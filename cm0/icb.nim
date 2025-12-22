# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = ICB, baseAddress = 0xE000E008'u32, peripheralDesc = "Implementation Control Block")
declareRegister(peripheralName = ICB, registerName = ACTLR, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "Provides IMPLEMENTATION DEFINED configuration and control options")
