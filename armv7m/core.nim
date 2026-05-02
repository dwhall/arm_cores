# Copyright 2025 Dean Hall, see LICENSE for details
#!fmt: off

import std/tables

# Assert we are compiling for arch v4 (armv7) or later, which supports
# the asm instructions used in this module: ubfx and bfi.
const ARM_ARCH {.intdefine: "__ARM_ARCH".} = 0
assert ARM_ARCH >= 4, "This module requires ARM architecture v4 or later"

#
# Native Nim interface for special Core Registers (accessed via MSR/MRS)
#
type
  RegType = uint32
  # Encode the register's name into the *Addr and *Val types so that
  # the register is available to the tail of the call chain (usually a write)
  RegName[Tname: static string] = distinct RegType
  RegVal[Tname: static string] = distinct RegType
  FldVal[Tname: static string] = distinct RegType

var
  # Store some attributes that are set within declare* templates
  # for use at compile time outside of their declare* templates
  regReadAccess {.compileTime.} = initTable[string, bool]()
  regWriteAccess {.compileTime.} = initTable[string, bool]()

proc read*[Tname: static string](reg: RegName[Tname]): RegVal[Tname] {.inline.} =
  ## Reads the value of the special register reg
  ## Implements: REG.read()
  when not regReadAccess[Tname]:
    {.error: "Attempted read from a register without read access.".}
  when defined(arm):
    {.emit: ["asm (\"  mrs %0, ", Tname, "\"\n",
             "\t     : \"=r\" (", result, "));"] .}
  else:
    # TODO
    discard

#[
TODO: Missing ISB after MSR writes
ARM strongly recommends an ISB after writing CONTROL and certain other registers
for the effect to be immediately visible to subsequent instructions.
The write* procs do not emit one. This is not a bug in isolation, but callers
have no way to know they need to issue ISB() manually.
]#
proc write*[Tname: static string](reg: RegName[Tname], val: RegVal[Tname]) {.inline.} =
  ## Writes val to the special register reg
  ## Implements: REG.write(v)
  when not regWriteAccess[Tname]:
    {.error: "Attempted write to a register without write access.".}
  when defined(arm):
    {.emit: ["asm (\"  msr ", Tname, ", %0\"\n",
             "\t     :\n",
             "\t     : \"r\" (", val.uint32, "));"] .}
  else:
    # TODO
    discard

template declareSpecialRegister(registerName: untyped, readAccess: static bool, writeAccess: static bool, registerDesc: static string ): untyped =
  const
    regName = astToStr(`registerName`)
    registerName* {.inject.} = RegName[regName](0)
  static:
    regReadAccess[regName] = readAccess
    regWriteAccess[regName] = writeAccess


func getField[Tname: static string](regVal: RegVal[Tname], bitOffset: static int, bitWidth: static int): FldVal[Tname] {.inline.} =
  ## Extracts a bitfield from regVal, zero extends it to 32 bits.
  ## Returns the field value, down-shifted to no bit offset, as a register-distinct type.
  ## Employs the Unsigned Bit Field eXtract instruction, UBFX, when the target supports it.
  assert bitOffset >= 0, "bitOffset must not be negative"
  assert bitWidth > 0, "bitWidth must be greater than zero"
  assert (bitOffset + bitWidth) <= 32, "bit field must not exceed register size in bits"
  when defined(arm):
    {.emit: ["asm (\"  ubfx %0, %1, %2, %3\"\n",
            "\t     : \"=r\" (", result, ")\n",
            "\t     : \"r\" (", regVal.uint32, "), \"n\" (", bitOffset, "), \"n\" (", bitWidth, "));"] .}
  else:
    # TODO
    discard

func setField[Tname: static string](regVal: RegVal[Tname], value: RegType, bitOffset: static int, bitWidth: static int): FldVal[Tname] {.inline.} =
  ## Replaces width bits in regVal starting at the low bit position bitOffset,
  ## with bitWidth bits from `value` starting at bit[0]. Other bits in regVal are unchanged.
  ## Employs the ARMv7 Bit Field Insert instruction, BFI, when the target supports it.
  assert bitOffset >= 0, "bitOffset must not be negative"
  assert bitWidth > 0, "bitWidth must be greater than zero"
  assert (bitOffset + bitWidth) <= 32, "bit field must not exceed register size in bits"
  when defined(arm):
    result = FldVal[Tname](regVal)
    {.emit: ["asm (\"  bfi %0, %1, %2, %3\"\n",
            "\t     : \"+r\" (", result, ")\n",
            "\t     : \"r\" (", value, "), \"n\" (", bitOffset, "), \"n\" (", bitWidth, "));\n"] .}
  else:
    # TODO
    discard

proc write*[Tname: static string](fldVal: FldVal[Tname]) {.inline.} =
  ## Writes fldVal to the special register, Tname.
  ## Implements the write part of: REG.read().FLD(8).write()
  when defined(arm):
    {.emit: ["asm (\"  msr ", Tname, ", %0\"\n",
            "\t     :\n",
            "\t     : \"r\" (", fldVal.uint32, "));"] .}
  else:
    # TODO
    discard

template declareField(registerName: untyped, fieldName: untyped, bitOffset: static int, bitWidth: static int, readAccess: static bool, writeAccess: static bool, fieldDesc: static string) =
  ## Declares read and write funcs for a register's bit field.
  ## The read and write funcs perform the necessary bit shifting and masking
  ## to ensure only the named fields are impacted.
  ## Field read-modify-writes must be terminated with the `.write()`
  ## More than one field-write funcs can be chained. `REG.read().FIELD1(11).FIELD2(42).write()`

  func fieldName*[Tname: static string](reg: static RegName[TName], value: RegType) =
    ## Replaces the register's field's bits with the value.
    ## Overwrites the bits outside the field with zeroes.
    ## Implements `REG.FLD(value)`
    when not writeAccess:
      {.error: "Attempted write to a field without write access.".}
    let initVal = RegVal[Tname](0'u32)
    let regVal = setField(initVal, value, bitOffset, bitWidth)
    reg.write(regVal)

  func fieldName*[Tname: static string](regVal: RegVal[TName]): FldVal[Tname] =
    ## Returns the field value, down-shifted to no bit offset, as a register-distinct type.
    ## Implements the FLD part of `REG.read().FLD()`
    when not readAccess:
      {.error: "Attempted read from a field without read access.".}
    getField(regVal, bitOffset, bitWidth)

  func fieldName*[Tname: static string](inVal: RegVal[TName], value: RegType): FldVal[Tname] =
    ## Replaces inVal's field's bits with the value.
    ## Returns the FldVal[Taddr] type to allow chaining of more field modifications.
    ## Implements the FLD part of `REG.read().FLD(5).write`
    setField[Tname](inVal, value, bitOffset, bitWidth)

  func fieldName*[Tname: static string](inVal: FldVal[TName], value: RegType): FldVal[Tname] =
    ## Replaces inVal's field's bits with the value.
    ## Returns the FldVal[Taddr] type to allow chaining of more field modifications.
    ## Implements the FLDB part of `REG.read().FLDA(4).FLDB(2).write`
    setField[Tname](inVal, value, bitOffset, bitWidth)


declareSpecialRegister(PSR, true, true, "Program Status Register")
declareField(PSR, EXN_NUMBER, 0, 9, true, false, "Exception number") # IPSR
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
declareField(IPSR, EXN_NUMBER, 0, 9, true, false, "Exception number") # IPSR

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
declareField(IAPSR, EXN_NUMBER, 0, 9, true, false, "Exception number") # IPSR
declareField(IAPSR, Q, 27, 1, true, true, "DSP overflow and saturation flag") # APSR
declareField(IAPSR, V, 28, 1, true, true, "Overflow flag")
declareField(IAPSR, C, 29, 1, true, true, "Carry or borrow flag")
declareField(IAPSR, Z, 30, 1, true, true, "Zero flag")
declareField(IAPSR, N, 31, 1, true, true, "Negative flag")

declareSpecialRegister(IEPSR, true, true, "EPSR and IPSR")
declareField(IEPSR, EXN_NUMBER, 0, 9, true, false, "Exception number") # IPSR
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
proc REV*(value: RegType): RegType {.inline.} =
  asm """
    rev %0, %1
    : "=r"(`result`)
    : "r"(`value`)
  """
proc REV16*(value: RegType): RegType {.inline.} =
  asm """
    rev16 %0, %1
    : "=r"(`result`)
    : "r"(`value`)
  """
proc REVSH*(value: RegType): RegType {.inline.} =
  asm """
    revsh %0, %1
    : "=r"(`result`)
    : "r"(`value`)
  """
proc RBIT*(value: RegType): RegType {.inline.} =
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





