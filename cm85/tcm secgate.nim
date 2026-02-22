# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = TCM SecGate, baseAddress = 0xE001E500'u32, peripheralDesc = "TCM Security Gate")
declareRegister(peripheralName = TCM SecGate, registerName = ITGU_CTRL, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "Main TCM Gate Unit (TGU) control registers for the ITCM")
declareField(peripheralName = TCM SecGate, registerName = ITGU_CTRL, fieldName = DEREN, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enable Slave AHB (S-AHB) error response for TGU fault")
declareField(peripheralName = TCM SecGate, registerName = ITGU_CTRL, fieldName = DBFEN, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enable data side BusFault for TGU fault")
declareRegister(peripheralName = TCM SecGate, registerName = ITGU_CFG, addressOffset = 0x4'u32, readAccess = true, writeAccess = false, registerDesc = "Provides access to configuration values for the ITGU")
declareField(peripheralName = TCM SecGate, registerName = ITGU_CFG, fieldName = PRESENT, bitOffset = 31, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Determines if the TGU is present")
declareField(peripheralName = TCM SecGate, registerName = ITGU_CFG, fieldName = NUMBLKS, bitOffset = 8, bitWidth = 4, readAccess = true, writeAccess = false, fieldDesc = "This value is used to calculate the number of TCM blocks")
declareField(peripheralName = TCM SecGate, registerName = ITGU_CFG, fieldName = BLKSZ, bitOffset = 0, bitWidth = 4, readAccess = true, writeAccess = false, fieldDesc = "TGU block size in bytes")
declareDimRegister(peripheralName = TCM SecGate, registerName = ITGU_LUT, addressOffset = 0x00000010'u32, dim = 16, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Identifying the ITGU blocks as being Secure or Non-secure")
declareRegister(peripheralName = TCM SecGate, registerName = DTGU_CTRL, addressOffset = 0x100'u32, readAccess = true, writeAccess = true, registerDesc = "Main TCM Gate Unit (TGU) control registers for the DTCM")
declareField(peripheralName = TCM SecGate, registerName = DTGU_CTRL, fieldName = DEREN, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enable Slave AHB (S-AHB) error response for TGU fault")
declareField(peripheralName = TCM SecGate, registerName = DTGU_CTRL, fieldName = DBFEN, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enable data side BusFault for TGU fault")
declareRegister(peripheralName = TCM SecGate, registerName = DTGU_CFG, addressOffset = 0x104'u32, readAccess = true, writeAccess = false, registerDesc = "Provides access to configuration values for the DTGU")
declareField(peripheralName = TCM SecGate, registerName = DTGU_CFG, fieldName = PRESENT, bitOffset = 31, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Determines if the TGU is present")
declareField(peripheralName = TCM SecGate, registerName = DTGU_CFG, fieldName = NUMBLKS, bitOffset = 8, bitWidth = 4, readAccess = true, writeAccess = false, fieldDesc = "This value is used to calculate the number of TCM blocks")
declareField(peripheralName = TCM SecGate, registerName = DTGU_CFG, fieldName = BLKSZ, bitOffset = 0, bitWidth = 4, readAccess = true, writeAccess = false, fieldDesc = "TGU block size in bytes")
declareDimRegister(peripheralName = TCM SecGate, registerName = DTGU_LUT, addressOffset = 0x00000110'u32, dim = 16, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Identifying the DTGU blocks as being Secure or Non-secure")
