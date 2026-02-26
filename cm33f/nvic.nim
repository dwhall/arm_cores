# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = NVIC, baseAddress = 0xE000E100'u32, peripheralDesc = "Nested Vectored Interrupt Controller")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_IABR, addressOffset = 0x00000200'u32, dim = 15, dimIncrement = 4, readAccess = true, writeAccess = false, registerDesc = "Interrupt Active Bit Register shows whether each interrupt is active for a group of 32 interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_IABR, fieldName = ACTIVE, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = false, fieldDesc = "Active state. For ACTIVE[m] in NVIC_IABRn, indicates the active state for interrupt 32n+m")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_ICER, addressOffset = 0x00000080'u32, dim = 15, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Clear Enable Register disables or reads the enable state of a group of interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_ICER, fieldName = CLRENA, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = true, fieldDesc = "Clear enable. For CLRENA[m] in NVIC_ICERn, allows interrupt 32n + m to be disabled")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_ICPR, addressOffset = 0x00000180'u32, dim = 15, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Clear Pending Register clears the pending status, or shows the current pending status for a group of interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_ICPR, fieldName = CLRPEND, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = true, fieldDesc = "Clear pending. For CLRPEND[m] in NVIC_ICPRn, allows interrupt 32n + m to be unpended")
declareDimRegister(peripheralName = NVIC, registerName = IPR, addressOffset = 0x00000300'u32, dim = 123, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Priority Register sets or reads interrupt priorities")
declareField(peripheralName = NVIC, registerName = IPR, fieldName = PRI_Nm, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Priority 'N'+m")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_ISER, addressOffset = 0x00000000'u32, dim = 15, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Set Enable Register enables or reads the enabled state of each group of 32 interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_ISER, fieldName = SETENA, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = true, fieldDesc = "Set enable. For SETENA[m] in NVIC_ISERn, allows interrupt 32n + m to be set enabled")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_ISPR, addressOffset = 0x00000100'u32, dim = 15, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Set Pending Register enables or reads the pending state of each group of 32 interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_ISPR, fieldName = SETPEND, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = true, fieldDesc = "Set pending. For SETPEND[m] in NVIC_ISPRn, allows interrupt 32n + m to be set pending")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_ITNS, addressOffset = 0x00000280'u32, dim = 15, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Target Non-secure Register determines whether each interrupt targets Non-secure or Secure state for each group of 32 interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_ITNS, fieldName = ITNS, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = true, fieldDesc = "Interrupt Targets Non-secure")
