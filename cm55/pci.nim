# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = PCI, baseAddress = 0xE001E700'u32, peripheralDesc = "Implementation defined processor configuration information")
declareRegister(peripheralName = PCI, registerName = CFGINFOSEL, addressOffset = 0x0'u32, readAccess = false, writeAccess = true, registerDesc = "Processor configuration information selection register selects the configuration information which can then be read back using CFGINFORD")
declareRegister(peripheralName = PCI, registerName = CFGINFORD, addressOffset = 0x4'u32, readAccess = true, writeAccess = false, registerDesc = "Processor configuration information read data register displays the configuration information that the CFGINFOSEL register selects")
