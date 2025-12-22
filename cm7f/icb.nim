# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = ICB, baseAddress = 0xE000E004'u32, peripheralDesc = "Implementation Control Block")
declareRegister(peripheralName = ICB, registerName = ICTR, addressOffset = 0x0'u32, readAccess = true, writeAccess = false, registerDesc = "Provides information about the interrupt controller")
declareField(peripheralName = ICB, registerName = ICTR, fieldName = INTLINESNUM_0, bitOffset = 0, bitWidth = 4, readAccess = true, writeAccess = false, fieldDesc = "The total number of interrupt lines supported by an implementation, defined in groups of 32")
declareField(peripheralName = ICB, registerName = ICTR, fieldName = INTLINESNUM_1, bitOffset = 16, bitWidth = 4, readAccess = true, writeAccess = false, fieldDesc = "The total number of interrupt lines supported by an implementation, defined in groups of 32")
declareRegister(peripheralName = ICB, registerName = ACTLR, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Provides IMPLEMENTATION DEFINED configuration and control options")
