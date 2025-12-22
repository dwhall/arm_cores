# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = SAU, baseAddress = 0xE000EDD0'u32, peripheralDesc = "Security Attribution Unit")
declareRegister(peripheralName = SAU, registerName = SAU_CTRL, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "Allows enabling of the Security Attribution Unit")
declareField(peripheralName = SAU, registerName = SAU_CTRL, fieldName = ALLNS, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "All Non-secure. When SAU_CTRL")
declareField(peripheralName = SAU, registerName = SAU_CTRL, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enable. Enables the SAU")
declareRegister(peripheralName = SAU, registerName = SAU_RBAR, addressOffset = 0xC'u32, readAccess = true, writeAccess = true, registerDesc = "Provides indirect read and write access to the base address of the currently selected SAU region")
declareField(peripheralName = SAU, registerName = SAU_RBAR, fieldName = BADDR, bitOffset = 5, bitWidth = 27, readAccess = true, writeAccess = true, fieldDesc = "Base address. Holds bits [31:5] of the base address for the selected SAU region")
declareRegister(peripheralName = SAU, registerName = SAU_RLAR, addressOffset = 0x10'u32, readAccess = true, writeAccess = true, registerDesc = "Provides indirect read and write access to the limit address of the currently selected SAU region")
declareField(peripheralName = SAU, registerName = SAU_RLAR, fieldName = LADDR, bitOffset = 5, bitWidth = 27, readAccess = true, writeAccess = true, fieldDesc = "Limit address. Holds bits [31:5] of the limit address for the selected SAU region")
declareField(peripheralName = SAU, registerName = SAU_RLAR, fieldName = NSC, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Non-secure callable")
declareField(peripheralName = SAU, registerName = SAU_RLAR, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enable. SAU region enable")
declareRegister(peripheralName = SAU, registerName = SAU_RNR, addressOffset = 0x8'u32, readAccess = true, writeAccess = true, registerDesc = "Selects the region currently accessed by SAU_RBAR and SAU_RLAR")
declareField(peripheralName = SAU, registerName = SAU_RNR, fieldName = REGION, bitOffset = 0, bitWidth = 8, readAccess = true, writeAccess = true, fieldDesc = "Region number. Indicates the SAU region accessed by SAU_RBAR and SAU_RLAR")
declareRegister(peripheralName = SAU, registerName = SAU_TYPE, addressOffset = 0x4'u32, readAccess = true, writeAccess = false, registerDesc = "Indicates the number of regions implemented by the Security Attribution Unit")
declareField(peripheralName = SAU, registerName = SAU_TYPE, fieldName = SREGION, bitOffset = 0, bitWidth = 8, readAccess = true, writeAccess = false, fieldDesc = "SAU regions. The number of implemented SAU regions")
declareRegister(peripheralName = SAU, registerName = SFAR, addressOffset = 0x18'u32, readAccess = true, writeAccess = true, registerDesc = "Shows the address of the memory location that caused a Security violation")
declareField(peripheralName = SAU, registerName = SFAR, fieldName = ADDRESS, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = true, fieldDesc = "Address. The address of an access that caused an attribution unit violation")
declareRegister(peripheralName = SAU, registerName = SFSR, addressOffset = 0x14'u32, readAccess = true, writeAccess = true, registerDesc = "Provides information about any security related faults")
declareField(peripheralName = SAU, registerName = SFSR, fieldName = LSERR, bitOffset = 7, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Lazy state error flag")
declareField(peripheralName = SAU, registerName = SFSR, fieldName = SFARVALID, bitOffset = 6, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Secure fault address valid. This bit is set when the SFAR register contains a valid value")
declareField(peripheralName = SAU, registerName = SFSR, fieldName = LSPERR, bitOffset = 5, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Lazy state preservation error flag")
declareField(peripheralName = SAU, registerName = SFSR, fieldName = INVTRAN, bitOffset = 4, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Invalid transition flag")
declareField(peripheralName = SAU, registerName = SFSR, fieldName = AUVIOL, bitOffset = 3, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Attribution unit violation flag")
declareField(peripheralName = SAU, registerName = SFSR, fieldName = INVER, bitOffset = 2, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Invalid exception return flag. This can be caused by EXC_RETURN")
declareField(peripheralName = SAU, registerName = SFSR, fieldName = INVIS, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Invalid integrity signature flag")
declareField(peripheralName = SAU, registerName = SFSR, fieldName = INVEP, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Invalid entry point")
