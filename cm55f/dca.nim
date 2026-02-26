# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = DCA, baseAddress = 0xE001E200'u32, peripheralDesc = "Direct Cache Access")
declareRegister(peripheralName = DCA, registerName = DCADCRR, addressOffset = 0x0'u32, readAccess = true, writeAccess = false, registerDesc = "Direct Data Cache Access Read Registers read the data from the Level 1 (L1) data cache from the location that is determined by the DCADCLR registers")
declareField(peripheralName = DCA, registerName = DCADCRR, fieldName = VALID, bitOffset = 21, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Valid state of the cache line")
declareField(peripheralName = DCA, registerName = DCADCRR, fieldName = TAG, bitOffset = 0, bitWidth = 21, readAccess = true, writeAccess = false, fieldDesc = "Tag address. The number of significant bits of TAG depends on the cache size.")
declareRegister(peripheralName = DCA, registerName = DCAICRR, addressOffset = 0x4'u32, readAccess = true, writeAccess = false, registerDesc = "Direct Instruction Cache Access Read Registers read the data from the Level 1 (L1) instruction cache from the location that is determined by the DCAICLR registers")
declareField(peripheralName = DCA, registerName = DCAICRR, fieldName = VALID, bitOffset = 21, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Valid state of the cache line")
declareField(peripheralName = DCA, registerName = DCAICRR, fieldName = TAG, bitOffset = 0, bitWidth = 21, readAccess = true, writeAccess = false, fieldDesc = "Tag address. The number of significant bits of TAG depends on the cache size.")
declareRegister(peripheralName = DCA, registerName = DCADCLR, addressOffset = 0x10'u32, readAccess = true, writeAccess = true, registerDesc = "Direct Data Cache Access Location Registers set the location to be read from the Level 1 (L1) data cache")
declareField(peripheralName = DCA, registerName = DCADCLR, fieldName = WAY, bitOffset = 30, bitWidth = 2, readAccess = true, writeAccess = true, fieldDesc = "Cache way")
declareField(peripheralName = DCA, registerName = DCADCLR, fieldName = SET, bitOffset = 5, bitWidth = 9, readAccess = true, writeAccess = true, fieldDesc = "Set index. The number of significant bits of SET depends on the cache size.")
declareField(peripheralName = DCA, registerName = DCADCLR, fieldName = OFFSET, bitOffset = 2, bitWidth = 3, readAccess = true, writeAccess = true, fieldDesc = "Data offset")
declareField(peripheralName = DCA, registerName = DCADCLR, fieldName = RAMTYPE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "RAM type")
declareRegister(peripheralName = DCA, registerName = DCAICLR, addressOffset = 0x14'u32, readAccess = true, writeAccess = true, registerDesc = "Direct Instruction Cache Access Location Registers set the location to be read from the Level 1 (L1) instruction cache")
declareField(peripheralName = DCA, registerName = DCAICLR, fieldName = WAY, bitOffset = 30, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Cache way")
declareField(peripheralName = DCA, registerName = DCAICLR, fieldName = SET, bitOffset = 5, bitWidth = 10, readAccess = true, writeAccess = true, fieldDesc = "Set index. The number of significant bits of SET depends on the cache size.")
declareField(peripheralName = DCA, registerName = DCAICLR, fieldName = OFFSET, bitOffset = 2, bitWidth = 3, readAccess = true, writeAccess = true, fieldDesc = "Data offset")
declareField(peripheralName = DCA, registerName = DCAICLR, fieldName = RAMTYPE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "RAM type")
