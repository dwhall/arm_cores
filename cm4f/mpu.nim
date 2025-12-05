# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = MPU, baseAddress = 0xE000ED90'u32, peripheralDesc = "Memory Protection Unit")
declareRegister(peripheralName = MPU, registerName = MPU_TYPE, addressOffset = 0x0'u32, readAccess = true, writeAccess = false, registerDesc = "The MPU Type Register indicates how many regions the MPU support")
declareField(peripheralName = MPU, registerName = MPU_TYPE, fieldName = IREGION, bitOffset = 16, bitWidth = 8, readAccess = true, writeAccess = false, fieldDesc = "Instruction region")
declareField(peripheralName = MPU, registerName = MPU_TYPE, fieldName = DREGION, bitOffset = 8, bitWidth = 8, readAccess = true, writeAccess = false, fieldDesc = "Number of regions supported by the MPU")
declareField(peripheralName = MPU, registerName = MPU_TYPE, fieldName = SEPARATE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Indicates support for separate instruction and data address maps. RAZ. ARMv7-M only supports a unified MPU")
declareRegister(peripheralName = MPU, registerName = MPU_CTRL, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Enables the MPU, and when the MPU is enabled, controls whether the default memory map is enabled as a background region for privileged accesses, and whether the MPU is enabled for HardFaults, NMIs")
declareField(peripheralName = MPU, registerName = MPU_CTRL, fieldName = PRIVDEFENA, bitOffset = 2, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "When the ENABLE bit is set to 1, the meaning of this bit is")
declareField(peripheralName = MPU, registerName = MPU_CTRL, fieldName = HFNMIENA, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "When the ENABLE bit is set to 1, controls whether handlers executing with priority less than 0 access memory with the MPU enabled or with the MPU disabled")
declareField(peripheralName = MPU, registerName = MPU_CTRL, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables the MPU")
declareRegister(peripheralName = MPU, registerName = MPU_RNR, addressOffset = 0x8'u32, readAccess = true, writeAccess = true, registerDesc = "Selects the region currently accessed by MPU_RBAR and MPU_RASR")
declareField(peripheralName = MPU, registerName = MPU_RNR, fieldName = REGION, bitOffset = 0, bitWidth = 8, readAccess = true, writeAccess = true, fieldDesc = "Indicates the memory region accessed by MPU_RBAR and MPU_RASR")
declareRegister(peripheralName = MPU, registerName = MPU_RBAR, addressOffset = 0xC'u32, readAccess = true, writeAccess = true, registerDesc = "Holds the base address of the region identified by MPU_RNR")
declareField(peripheralName = MPU, registerName = MPU_RBAR, fieldName = ADDR, bitOffset = 5, bitWidth = 27, readAccess = true, writeAccess = true, fieldDesc = "Base address of the region")
declareField(peripheralName = MPU, registerName = MPU_RBAR, fieldName = VALID, bitOffset = 4, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "On writes, indicates whether the region to update is specified by MPU_RNR")
declareField(peripheralName = MPU, registerName = MPU_RBAR, fieldName = REGION, bitOffset = 0, bitWidth = 4, readAccess = true, writeAccess = true, fieldDesc = "On writes, can specify the number of the region to update")
declareRegister(peripheralName = MPU, registerName = MPU_RASR, addressOffset = 0x10'u32, readAccess = true, writeAccess = true, registerDesc = "Defines the size and access behavior of the region identified by MPU_RNR, and enables that region")
declareField(peripheralName = MPU, registerName = MPU_RASR, fieldName = ATTRS, bitOffset = 16, bitWidth = 16, readAccess = true, writeAccess = true, fieldDesc = "The MPU Region Attribute field")
declareField(peripheralName = MPU, registerName = MPU_RASR, fieldName = SRD, bitOffset = 8, bitWidth = 8, readAccess = true, writeAccess = true, fieldDesc = "Subregion Disable")
declareField(peripheralName = MPU, registerName = MPU_RASR, fieldName = SIZE, bitOffset = 1, bitWidth = 5, readAccess = true, writeAccess = true, fieldDesc = "Indicates the region size")
declareField(peripheralName = MPU, registerName = MPU_RASR, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables this region")
