# Copyright 2025 Dean Hall, see LICENSE for details

import std/[macros, volatile]

# Assert we are compiling for arch v4 (armv7) or later, which supports
# the asm instructions used in this module: ubfx and bfi.
const ARM_ARCH {.intdefine: "__ARM_ARCH".} = 0
assert ARM_ARCH >= 4, "This module requires ARM architecture v4 or later"

#
# Native Nim interface for special Core Registers (accessed via MSR/MRS)
#
type
  RegisterVal = uint32

template declareSpecialRegister(
    registerName: untyped,
    readAccess: static bool,
    writeAccess: static bool,
    registerDesc: static string
): untyped =
  type
    `coreSpecialReg _ registerName Val`* {.inject.} = distinct RegisterVal
    `coreSpecialReg _ registerName Str`* {.inject.} = distinct string
  const registerName* {.inject.} = `coreSpecialReg _ registerName Str`(astToStr(`registerName`))

  when readAccess:
    proc read*(reg: static `coreSpecialReg _ registerName Str`): RegisterVal {.inline.} =
      {.emit: ["asm (\"  mrs %0, ", reg, "\"\n",
               "\t     : \"=r\" (", result, "));"] .}

  when writeAccess:
    proc write*(reg: static `coreSpecialReg _ registerName Str`, val: RegisterVal) {.inline.} =
      {.emit: ["asm (\"  msr ", reg, ", %0\"\n",
               "\t     :\n",
               "\t     : \"r\" (", val, "));"] .}


func getField(regVal: RegisterVal, bitOffset: static int, bitWidth: static int): RegisterVal {.inline.} =
  # Extracts a bitfield from regVal, zero extends it to 32 bits.
  # Returns the field value, down-shifted to no bit offset, as a register-distinct type.
  # Employs the Unsigned Bit Field eXtract instruction, UBFX, when the target supports it.
  assert bitOffset >= 0, "bitOffset must not be negative"
  assert bitWidth > 0, "bitWidth must be greater than zero"
  assert (bitOffset + bitWidth) <= 32, "bit field must not exceed register size in bits"
  {.emit: ["asm (\"  ubfx %0, %1, %2, %3\"\n",
           "\t     : \"=r\" (", result, ")\n",
           "\t     : \"r\" (", regVal, "), \"n\" (", bitOffset, "), \"n\" (", bitWidth, "));"] .}

func setField(
    regVal: RegisterVal, fieldVal: RegisterVal, bitOffset: static int, bitWidth: static int
): RegisterVal {.inline.} =
  # Replaces width bits in regVal starting at the low bit position bitOffset,
  # with bitWidth bits from fieldVal starting at bit[0]. Other bits in regVal are unchanged.
  # Employs the ARMv7 Bit Field Insert instruction, BFI, when the target supports it.
  assert bitOffset >= 0, "bitOffset must not be negative"
  assert bitWidth > 0, "bitWidth must be greater than zero"
  assert (bitOffset + bitWidth) <= 32, "bit field must not exceed register size in bits"
  {.emit: ["asm (\"  bfi %0, %1, %2, %3\"\n",
           "\t     : \"+r\" (", result, ")\n",
           "\t     : \"r\" (", fieldVal, "), \"n\" (", bitOffset, "), \"n\" (", bitWidth, "));\n"] .}

template declareField(
    registerName: untyped,
    fieldName: untyped,
    bitOffset: static int,
    bitWidth: static int,
    readAccess: static bool,
    writeAccess: static bool,
    fieldDesc: static string,
) =
  ## Declares read and write funcs for a register's bit field.
  ## The read and write funcs perform the necessary bit shifting and masking
  ## to ensure only the named fields are impacted.
  ##
  ## Field read-modify-writes must be terminated with the `.write()`
  ## More than one field-write funcs can be chained. `PERIPH.REG.FIELD1(11).FIELD2(42).write()`
  when readAccess:
    template `fieldName`*(
        reg: static `coreSpecialReg _ registerName Str`
    ): RegisterVal =
      let regVal = reg.read()
      getField(regVal, bitOffset, bitWidth)

  when writeAccess:
    template `fieldName=`*(
        reg: static `coreSpecialReg _ registerName Str`, fieldVal: RegisterVal
    ) =
      var regVal = reg.read()
      regVal = setField(regVal, fieldVal, bitOffset, bitWidth)
      reg.write(regVal)


declareSpecialRegister(PSR, true, true, "Program Status Register")
declareField(PSR, ISR_NUMBER, 0, 9, true, false, "Interrupt Service Routine number") # IPSR
declareField(PSR, ICI_IT_1, 10, 6, true, true, "If-Then execution state bits part 1") # EPSR
declareField(PSR, T, 24, 1, true, true, "Thumb state bit")
declareField(PSR, ICI_IT_2, 25, 2, true, true, "If-Then execution state bits part 2")
declareField(PSR, Q, 27, 1, true, false, "DSP overflow and saturation flag") # APSR
declareField(PSR, V, 28, 1, true, false, "Overflow flag")
declareField(PSR, C, 29, 1, true, false, "Carry or borrow flag")
declareField(PSR, Z, 30, 1, true, false, "Zero flag")
declareField(PSR, N, 31, 1, true, false, "Negative flag")

# Writing to APSR without specifying a bitmask is deprecated, so we write to APSR_nzcvq
declareSpecialRegister(APSR_nzcvq, true, true, "Application Program Status Register")
declareField(APSR_nzcvq, Q, 27, 1, true, true, "DSP overflow and saturation flag")
declareField(APSR_nzcvq, V, 28, 1, true, true, "Overflow flag")
declareField(APSR_nzcvq, C, 29, 1, true, true, "Carry or borrow flag")
declareField(APSR_nzcvq, Z, 30, 1, true, true, "Zero flag")
declareField(APSR_nzcvq, N, 31, 1, true, true, "Negative flag")

declareSpecialRegister(EPSR, true, true, "Execution Program Status Register")
declareField(EPSR, ICI_IT_1, 10, 6, true, true, "If-Then execution state bits part 1") # EPSR
declareField(EPSR, T, 24, 1, true, true, "Thumb state bit")
declareField(EPSR, ICI_IT_2, 25, 2, true, true, "If-Then execution state bits part 2")

declareSpecialRegister(IPSR, true, true, "Interrupt Program Status Register")
declareField(IPSR, ISR_NUMBER, 0, 9, true, false, "Interrupt Service Routine number") # IPSR

declareSpecialRegister(EAPSR, true, true, "APSR and EPSR")
declareField(EAPSR, ICI_IT_1, 10, 6, true, true, "If-Then execution state bits part 1") # EPSR
declareField(EAPSR, T, 24, 1, true, true, "Thumb state bit")
declareField(EAPSR, ICI_IT_2, 25, 2, true, true, "If-Then execution state bits part 2")
declareField(EAPSR, Q, 27, 1, true, true, "DSP overflow and saturation flag") # APSR
declareField(EAPSR, V, 28, 1, true, true, "Overflow flag")
declareField(EAPSR, C, 29, 1, true, true, "Carry or borrow flag")
declareField(EAPSR, Z, 30, 1, true, true, "Zero flag")
declareField(EAPSR, N, 31, 1, true, true, "Negative flag")

declareSpecialRegister(IAPSR, true, true, "APSR and IPSR")
declareField(IAPSR, ISR_NUMBER, 0, 9, true, false, "Interrupt Service Routine number") # IPSR
declareField(IAPSR, Q, 27, 1, true, true, "DSP overflow and saturation flag") # APSR
declareField(IAPSR, V, 28, 1, true, true, "Overflow flag")
declareField(IAPSR, C, 29, 1, true, true, "Carry or borrow flag")
declareField(IAPSR, Z, 30, 1, true, true, "Zero flag")
declareField(IAPSR, N, 31, 1, true, true, "Negative flag")

declareSpecialRegister(IEPSR, true, true, "EPSR and IPSR")
declareField(IEPSR, ISR_NUMBER, 0, 9, true, false, "Interrupt Service Routine number") # IPSR
declareField(IEPSR, ICI_IT_1, 10, 6, true, true, "If-Then execution state bits part 1") # EPSR
declareField(IEPSR, T, 24, 1, true, true, "Thumb state bit")
declareField(IEPSR, ICI_IT_2, 25, 2, true, true, "If-Then execution state bits part 2")

declareSpecialRegister(PRIMASK, true, true, "Priority Mask Register")
declareField(PRIMASK, MASK, 0, 1, true, true, "prevents the activation of all exceptions with configurable priority")

declareSpecialRegister(FAULTMASK, true, true, "Fault Mask Register")
declareField(FAULTMASK, MASK, 0, 1, true, true, "prevents the activation of all exceptions except for NMI")

declareSpecialRegister(BASEPRI, true, true, "Base Priority Mask Register")
declareField(BASEPRI, PRI, 0, 8, true, true, "the base priority for exception processing")
declareSpecialRegister(BASEPRI_MAX, true, true, "Base Priority Mask Register (alias of BASEPRI)")
declareField(BASEPRI_MAX, PRI, 0, 8, true, true, "the base priority for exception processing")

declareSpecialRegister(CONTROL, true, true, "Control Register")
declareField(CONTROL, nPRIV, 0, 1, true, true, "Thread mode privilege level: 0=privileged, 1=unprivileged")
declareField(CONTROL, SPSEL, 1, 1, true, true, "Stack pointer selection: 0=MSP, 1=PSP")
declareField(CONTROL, FPCA, 2, 1, true, true, "Floating-point context active bit")

declareSpecialRegister(MSP, true, true, "Main Stack Pointer")
declareSpecialRegister(PSP, true, true, "Process Stack Pointer")

##
## Native Nim interface for equivalents to CMSIS-Core functions
##
## Reference: ARM DUI 0553B, p. 56, Table 3-2 CMSIS functions to generate some Cortex-M4 instructions
##
proc enableIrq*() {.inline.} =
  asm "  cpsie i \n"
proc disableIrq*() {.inline.} =
  asm "  cpsid i \n"
proc enableFaultIrq*() {.inline.} =
  asm "  cpsie f \n"
proc disableFaultIrq*() {.inline.} =
  asm "  cpsid f \n"
proc ISB*() {.inline.} =
  asm "  isb \n"
proc DSB*() {.inline.} =
  asm "  dsb \n"
proc DMB*() {.inline.} =
  asm "  dmb \n"
proc REV*(value: RegisterVal): RegisterVal {.inline.} =
  asm """
    rev %0, %1
    : "=r"(`result`)
    : "r"(`value`)
  """
proc REV16*(value: RegisterVal): RegisterVal {.inline.} =
  asm """
    rev16 %0, %1
    : "=r"(`result`)
    : "r"(`value`)
  """
proc REVSH*(value: RegisterVal): RegisterVal {.inline.} =
  asm """
    revsh %0, %1
    : "=r"(`result`)
    : "r"(`value`)
  """
proc RBIT*(value: RegisterVal): RegisterVal {.inline.} =
  asm """
    rbit %0, %1
    : "=r"(`result`)
    : "r"(`value`)
  """
proc SEV*() {.inline.} =
  asm "  sev \n"
proc WFE*() {.inline.} =
  asm "  wfe \n"
proc WFI*() {.inline.} =
  asm "  wfi \n"
