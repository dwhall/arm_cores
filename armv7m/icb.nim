# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device
#!fmt: off

import metagenerator
export read, write

declarePeripheral(peripheralName = ICB, baseAddress = 0xE000E004'u32, peripheralDesc = "Implementation Control Block")
declareRegister(peripheralName = ICB, registerName = ICTR, addressOffset = 0x0'u32, dim = 0, dimIncrement = 0, readAccess = true, writeAccess = false, registerDesc = "Interrupt Controller Type Register provides information about the interrupt controller")
declareField(peripheralName = ICB, registerName = ICTR, fieldName = INTLINESNUM, bitOffset = 0, bitWidth = 4, dim = 2, dimIncrement = 16, readAccess = true, writeAccess = false, fieldDesc = "The total number of interrupt lines supported by an implementation, defined in groups of 32")
declareRegister(peripheralName = ICB, registerName = ACTLR, addressOffset = 0x4'u32, dim = 0, dimIncrement = 0, readAccess = true, writeAccess = true, registerDesc = "Auxiliary Control Register provides IMPLEMENTATION DEFINED configuration and control options")
