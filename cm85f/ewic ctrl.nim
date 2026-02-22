# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = EWIC Ctrl, baseAddress = 0xE0047000'u32, peripheralDesc = "External Wakeup Interrupt Controller")
declareRegister(peripheralName = EWIC Ctrl, registerName = EWIC_CR, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "The main External Wakeup Interrupt Controller (EWIC) control register")
declareField(peripheralName = EWIC Ctrl, registerName = EWIC_CR, fieldName = EN, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enable")
declareRegister(peripheralName = EWIC Ctrl, registerName = EWIC_ASCR, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Determines whether the processor generates APB transactions on entry and exit from Wakeup Interrupt Controller (WIC) sleep to set up the wakeup state in the External Wakeup Interrupt Controller (EWIC)")
declareField(peripheralName = EWIC Ctrl, registerName = EWIC_ASCR, fieldName = ASPU, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "The processor must use this value to decide whether any automatic EWIC accesses must be performed on transitioning from a low-power state")
declareField(peripheralName = EWIC Ctrl, registerName = EWIC_ASCR, fieldName = ASPD, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "The processor must use this value to decide whether any automatic EWIC accesses must be performed on transitioning to a low-power state")
declareRegister(peripheralName = EWIC Ctrl, registerName = EWIC_CLRMASK, addressOffset = 0x8'u32, readAccess = false, writeAccess = true, registerDesc = "Causes EWIC_MASKA and all the EWIC_MASKn registers to be cleared. The write data is ignored. This register is RAZ.")
declareRegister(peripheralName = EWIC Ctrl, registerName = EWIC_NUMID, addressOffset = 0xC'u32, readAccess = true, writeAccess = false, registerDesc = "Returns the total number of events supported in the External Wakeup Interrupt Controller (EWIC) that have been configured during synthesis")
declareField(peripheralName = EWIC Ctrl, registerName = EWIC_NUMID, fieldName = NUMEVENT, bitOffset = 0, bitWidth = 16, readAccess = true, writeAccess = false, fieldDesc = "The number of events supported")
declareDimRegister(peripheralName = EWIC Ctrl, registerName = EWIC_MASK, addressOffset = 0x00000204'u32, dim = 15, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Defines the mask for special events and the EWIC_MASKn registers for external interrupt (IRQ) events")
declareField(peripheralName = EWIC Ctrl, registerName = EWIC_MASK, fieldName = IRQ, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = true, fieldDesc = "Masks for interrupts (nx32) to ((n+1)x32)-1")
declareDimRegister(peripheralName = EWIC Ctrl, registerName = EWIC_PEND, addressOffset = 0x00000404'u32, dim = 15, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Indicate which events have been pended")
declareField(peripheralName = EWIC Ctrl, registerName = EWIC_PEND, fieldName = IRQ, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = true, fieldDesc = "Interrupts (nx32) to ((n+1)x32)-1 are pended. A write of zero to this field is ignored.")
declareRegister(peripheralName = EWIC Ctrl, registerName = EWIC_PSR, addressOffset = 0x600'u32, readAccess = true, writeAccess = false, registerDesc = "Indicates which EWIC_PENDn registers are non-zero")
declareField(peripheralName = EWIC Ctrl, registerName = EWIC_PSR, fieldName = NZ, bitOffset = 1, bitWidth = 15, readAccess = true, writeAccess = false, fieldDesc = "If EWIC_PSR.NZ[n+1] is set, then EWIC_PENDn is non-zero")
declareField(peripheralName = EWIC Ctrl, registerName = EWIC_PSR, fieldName = NZA, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "If EWIC_PSR.NZA set, then EWIC_PENDA is non-zero")
