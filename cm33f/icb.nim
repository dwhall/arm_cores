# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = ICB, baseAddress = 0xE000E004'u32, peripheralDesc = "Implementation Control Block")
declareRegister(peripheralName = ICB, registerName = ACTLR, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Provides IMPLEMENTATION DEFINED configuration and control options")
declareField(peripheralName = ICB, registerName = ACTLR, fieldName = IMPLEMENTATION_DEFINED, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = true, fieldDesc = "IMPLEMENTATION DEFINED. The contents of this field are IMPLEMENTATION DEFINED")
declareRegister(peripheralName = ICB, registerName = CPPWR, addressOffset = 0x8'u32, readAccess = true, writeAccess = true, registerDesc = "Specifies whether coprocessors are permitted to enter a non-retentive power state")
declareField(peripheralName = ICB, registerName = CPPWR, fieldName = SUS11, bitOffset = 23, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "State UNKNOWN Secure only 11. The value in this field is ignored")
declareField(peripheralName = ICB, registerName = CPPWR, fieldName = SU11, bitOffset = 22, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "State UNKNOWN 11. The value in this field is ignored")
declareField(peripheralName = ICB, registerName = CPPWR, fieldName = SUS10, bitOffset = 21, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "State UNKNOWN Secure only 10")
declareField(peripheralName = ICB, registerName = CPPWR, fieldName = SU10, bitOffset = 20, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "State UNKNOWN 10")
declareField(peripheralName = ICB, registerName = CPPWR, fieldName = SUSm, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "State UNKNOWN Secure only m")
declareField(peripheralName = ICB, registerName = CPPWR, fieldName = SUm, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "State UNKNOWN m")
declareRegister(peripheralName = ICB, registerName = ICTR, addressOffset = 0x0'u32, readAccess = true, writeAccess = false, registerDesc = "Provides information about the interrupt controller")
declareField(peripheralName = ICB, registerName = ICTR, fieldName = INTLINESNUM, bitOffset = 0, bitWidth = 4, readAccess = true, writeAccess = false, fieldDesc = "Interrupt line set number")
