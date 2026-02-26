# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = MSC, baseAddress = 0xE001E000'u32, peripheralDesc = "Memory System Control Registers")
declareRegister(peripheralName = MSC, registerName = MSCR, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "Memory System Control Register controls the memory system features specific to the processor")
declareField(peripheralName = MSC, registerName = MSCR, fieldName = CPWRDN, bitOffset = 17, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates when the data and instruction caches are not accessible because they are either being powered down or being initialized using the automatic invalidation sequence")
declareField(peripheralName = MSC, registerName = MSCR, fieldName = DCCLEAN, bitOffset = 16, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates whether the data cache contains any dirty lines")
declareField(peripheralName = MSC, registerName = MSCR, fieldName = ICACTIVE, bitOffset = 13, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates whether the L1 instruction cache is active")
declareField(peripheralName = MSC, registerName = MSCR, fieldName = DCACTIVE, bitOffset = 12, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates whether the L1 data cache is active")
declareField(peripheralName = MSC, registerName = MSCR, fieldName = EVECCFAULT, bitOffset = 3, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables asynchronous BusFault exceptions when data is lost on evictions")
declareField(peripheralName = MSC, registerName = MSCR, fieldName = FORCEWT, bitOffset = 2, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables Forced Write-Through in the L1 data cache")
declareField(peripheralName = MSC, registerName = MSCR, fieldName = ECCEN, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates whether Error Correcting Code (ECC) is present and enabled")
declareRegister(peripheralName = MSC, registerName = PFCR, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Prefetcher Control Register controls the prefetcher")
declareField(peripheralName = MSC, registerName = PFCR, fieldName = DIS_NLP, bitOffset = 7, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Disables Next Line Prefetch mode")
declareField(peripheralName = MSC, registerName = PFCR, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Prefetcher enable")
declareRegister(peripheralName = MSC, registerName = ITCMCR, addressOffset = 0x10'u32, readAccess = true, writeAccess = true, registerDesc = "ITCM Control Register enable access to the Tightly Coupled Memories (TCMs) by software running on the processor")
declareField(peripheralName = MSC, registerName = ITCMCR, fieldName = SZ, bitOffset = 3, bitWidth = 4, readAccess = true, writeAccess = true, fieldDesc = "Indicates the size of the relevant TCM")
declareField(peripheralName = MSC, registerName = ITCMCR, fieldName = EN, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "TCM enable")
declareRegister(peripheralName = MSC, registerName = DTCMCR, addressOffset = 0x14'u32, readAccess = true, writeAccess = true, registerDesc = "DTCM Control Register enable access to the Tightly Coupled Memories (TCMs) by software running on the processor")
declareField(peripheralName = MSC, registerName = DTCMCR, fieldName = SZ, bitOffset = 3, bitWidth = 4, readAccess = true, writeAccess = true, fieldDesc = "Indicates the size of the relevant TCM")
declareField(peripheralName = MSC, registerName = DTCMCR, fieldName = EN, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "TCM enable")
declareRegister(peripheralName = MSC, registerName = PAHBCR, addressOffset = 0x18'u32, readAccess = true, writeAccess = true, registerDesc = "P-AHB Control Register enables accesses to Peripheral AHB (P-AHB) interface from software running on the processor")
declareField(peripheralName = MSC, registerName = PAHBCR, fieldName = SZ, bitOffset = 1, bitWidth = 3, readAccess = true, writeAccess = true, fieldDesc = "P-AHB size")
declareField(peripheralName = MSC, registerName = PAHBCR, fieldName = EN, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "P-AHB enable")
