# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = NVIC, baseAddress = 0xE000E100'u32, peripheralDesc = "Nested Vectored Interrupt Controller")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_ISER, addressOffset = 0x00000000'u32, dim = 16, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Set-Enable Register enables or reads the enable state of a group of interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_ISER, fieldName = SETENA, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = true, fieldDesc = "For register ISER[n], enables or shows the current enabled state of interrupt (m+(32*n))")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_ICER, addressOffset = 0x00000080'u32, dim = 16, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Clear Enable Register disables or reads the enable state of a group of interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_ICER, fieldName = CLRENA, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = true, fieldDesc = "For register ICER[n], disables or shows the current enabled state of interrupt (m+(32*n))")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_ISPR, addressOffset = 0x00000100'u32, dim = 16, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Set Pending Register changes status to pending, or shows the current pending status for a group of interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_ISPR, fieldName = SETPEND, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = true, fieldDesc = "For register ISPR[n], changes the state of interrupt (m+(32*n)) to pending, or shows whether the state of the interrupt is pending")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_ICPR, addressOffset = 0x00000180'u32, dim = 16, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Clear Pending Register clears the pending status, or shows the current pending status for a group of interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_ICPR, fieldName = CLRPEND, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = true, fieldDesc = "For register ICPR[n], clears the pending state of interrupt (m+(32*n)), or shows whether the state of the interrupt is pending")
declareDimRegister(peripheralName = NVIC, registerName = NVIC_IABR, addressOffset = 0x00000200'u32, dim = 16, dimIncrement = 4, readAccess = true, writeAccess = false, registerDesc = "Interrupt Active Bit Register shows whether each interrupt is active for a group of 32 interrupts")
declareDimField(peripheralName = NVIC, registerName = NVIC_IABR, fieldName = ACTIVE, dim = 32, dimIncrement = 1, readAccess = true, writeAccess = false, fieldDesc = "For register NVIC_IABRn, shows whether interrupt (m+(32*n)) is active")
declareDimRegister(peripheralName = NVIC, registerName = IPR, addressOffset = 0x00000300'u32, dim = 124, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Interrupt Priority Register sets or reads interrupt priorities")
declareField(peripheralName = NVIC, registerName = IPR, fieldName = PRI_N3, bitOffset = 24, bitWidth = 8, readAccess = true, writeAccess = true, fieldDesc = "For register NVIC_IPRn, priority of interrupt number 4n+3")
declareField(peripheralName = NVIC, registerName = IPR, fieldName = PRI_N2, bitOffset = 16, bitWidth = 8, readAccess = true, writeAccess = true, fieldDesc = "For register NVIC_IPRn, priority of interrupt number 4n+2")
declareField(peripheralName = NVIC, registerName = IPR, fieldName = PRI_N1, bitOffset = 8, bitWidth = 8, readAccess = true, writeAccess = true, fieldDesc = "For register NVIC_IPRn, priority of interrupt number 4n+1")
declareField(peripheralName = NVIC, registerName = IPR, fieldName = PRI_N0, bitOffset = 0, bitWidth = 8, readAccess = true, writeAccess = true, fieldDesc = "For register NVIC_IPRn, priority of interrupt number 4n")
