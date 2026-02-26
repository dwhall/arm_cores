# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = SIG, baseAddress = 0xE000EF00'u32, peripheralDesc = "Software Interrupt Generation")
declareRegister(peripheralName = SIG, registerName = STIR, addressOffset = 0x0'u32, readAccess = false, writeAccess = true, registerDesc = "Software Triggered Interrupt Register provides a mechanism for software to generate an interrupt")
declareField(peripheralName = SIG, registerName = STIR, fieldName = INTID, bitOffset = 0, bitWidth = 9, readAccess = false, writeAccess = true, fieldDesc = "Indicates the interrupt to be triggered")
