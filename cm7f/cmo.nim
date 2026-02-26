# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = CMO, baseAddress = 0xE000EF50'u32, peripheralDesc = "Cache Maintenance Operations")
declareRegister(peripheralName = CMO, registerName = ICIALLU, addressOffset = 0x0'u32, readAccess = false, writeAccess = true, registerDesc = "Instruction Cache Invalidate All to PoU invalidate all instruction caches to PoU")
declareField(peripheralName = CMO, registerName = ICIALLU, fieldName = Ignored, bitOffset = 0, bitWidth = 32, readAccess = false, writeAccess = true, fieldDesc = "The value written to this field is ignored. Ignored")
declareRegister(peripheralName = CMO, registerName = ICIMVAU, addressOffset = 0x8'u32, readAccess = false, writeAccess = true, registerDesc = "Instruction Cache line Invalidate by Address to PoU invalidate instruction cache line by address to PoU")
declareField(peripheralName = CMO, registerName = ICIMVAU, fieldName = ADDRESS, bitOffset = 0, bitWidth = 32, readAccess = false, writeAccess = true, fieldDesc = "Address. Writing to this field initiates the maintenance operation for the address written")
declareRegister(peripheralName = CMO, registerName = DCIMVAC, addressOffset = 0xC'u32, readAccess = false, writeAccess = true, registerDesc = "Data Cache line Invalidate by Address to PoC invalidate data or unified cache line by address to PoC")
declareField(peripheralName = CMO, registerName = DCIMVAC, fieldName = ADDRESS, bitOffset = 0, bitWidth = 32, readAccess = false, writeAccess = true, fieldDesc = "Address. Writing to this field initiates the maintenance operation for the address written")
declareRegister(peripheralName = CMO, registerName = DCISW, addressOffset = 0x10'u32, readAccess = false, writeAccess = true, registerDesc = "Data Cache line Invalidate by Set/Way invalidate data or unified cache line by set/way")
declareField(peripheralName = CMO, registerName = DCISW, fieldName = SetWay, bitOffset = 4, bitWidth = 28, readAccess = false, writeAccess = true, fieldDesc = "Cache set/way. Contains two fields: Way, bits[31:32-A], the number of the way to operate on")
declareField(peripheralName = CMO, registerName = DCISW, fieldName = Level, bitOffset = 1, bitWidth = 3, readAccess = false, writeAccess = true, fieldDesc = "Cache level. Cache level to operate on, minus 1")
declareRegister(peripheralName = CMO, registerName = DCCMVAU, addressOffset = 0x14'u32, readAccess = false, writeAccess = true, registerDesc = "Data Cache line Clean by address to PoU clean data or unified cache line by address to PoU")
declareField(peripheralName = CMO, registerName = DCCMVAU, fieldName = ADDRESS, bitOffset = 0, bitWidth = 32, readAccess = false, writeAccess = true, fieldDesc = "Address. Writing to this field initiates the maintenance operation for the address written")
declareRegister(peripheralName = CMO, registerName = DCCMVAC, addressOffset = 0x18'u32, readAccess = false, writeAccess = true, registerDesc = "Data Cache line Clean by Address to PoC clean data or unified cache line by address to PoC")
declareField(peripheralName = CMO, registerName = DCCMVAC, fieldName = ADDRESS, bitOffset = 0, bitWidth = 32, readAccess = false, writeAccess = true, fieldDesc = "Address. Writing to this field initiates the maintenance operation for the address written")
declareRegister(peripheralName = CMO, registerName = DCCSW, addressOffset = 0x1C'u32, readAccess = false, writeAccess = true, registerDesc = "Data Cache Clean line by Set/Way clean data or unified cache line by set/way")
declareField(peripheralName = CMO, registerName = DCCSW, fieldName = SetWay, bitOffset = 4, bitWidth = 28, readAccess = false, writeAccess = true, fieldDesc = "Cache set/way. Contains two fields: Way, bits [31:32-A], the number of the way to operate on")
declareField(peripheralName = CMO, registerName = DCCSW, fieldName = Level, bitOffset = 1, bitWidth = 3, readAccess = false, writeAccess = true, fieldDesc = "Cache level. Cache level to operate on, minus 1")
declareRegister(peripheralName = CMO, registerName = DCCIMVAC, addressOffset = 0x20'u32, readAccess = false, writeAccess = true, registerDesc = "Data Cache line Clean and Invalidate by Address to PoC clean and invalidate data or unified cache line by address to PoC")
declareField(peripheralName = CMO, registerName = DCCIMVAC, fieldName = ADDRESS, bitOffset = 0, bitWidth = 32, readAccess = false, writeAccess = true, fieldDesc = "Address. Writing to this field initiates the maintenance operation for the address written")
declareRegister(peripheralName = CMO, registerName = DCCISW, addressOffset = 0x24'u32, readAccess = false, writeAccess = true, registerDesc = "Data Cache line Clean and Invalidate by Set/Way clean and invalidate data or unified cache line by set/way")
declareField(peripheralName = CMO, registerName = DCCISW, fieldName = SetWay, bitOffset = 4, bitWidth = 28, readAccess = false, writeAccess = true, fieldDesc = "Cache set/way. Contains two fields: Way, bits[31:32-A], the number of the way to operate on")
declareField(peripheralName = CMO, registerName = DCCISW, fieldName = Level, bitOffset = 1, bitWidth = 3, readAccess = false, writeAccess = true, fieldDesc = "Cache level. Cache level to operate on, minus 1")
declareRegister(peripheralName = CMO, registerName = BPIALL, addressOffset = 0x28'u32, readAccess = false, writeAccess = true, registerDesc = "Branch Predictor Invalidate All invalidate all entries from branch predictors")
declareField(peripheralName = CMO, registerName = BPIALL, fieldName = Ignored, bitOffset = 0, bitWidth = 32, readAccess = false, writeAccess = true, fieldDesc = "Ignored. The value written to this field is ignored")
