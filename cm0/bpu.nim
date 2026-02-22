# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = BPU, baseAddress = 0xE0002000'u32, peripheralDesc = "Breakpoint Unit")
declareRegister(peripheralName = BPU, registerName = BP_CTRL, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "Provides BPU implementation information, and the global enable for the BPU")
declareField(peripheralName = BPU, registerName = BP_CTRL, fieldName = NUM_CODE, bitOffset = 4, bitWidth = 4, readAccess = true, writeAccess = true, fieldDesc = "The number of breakpoint comparators")
declareField(peripheralName = BPU, registerName = BP_CTRL, fieldName = KEY, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "On any write to FP_CTRL, this bit must be 1")
declareField(peripheralName = BPU, registerName = BP_CTRL, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enable bit for the FPB")
declareDimRegister(peripheralName = BPU, registerName = BP_COMP, addressOffset = 0x00000008'u32, dim = 8, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Holds a breakpoint address for comparison with instruction addresses in the Code memory region")
declareField(peripheralName = BPU, registerName = BP_COMP, fieldName = BP_MATCH, bitOffset = 30, bitWidth = 2, readAccess = true, writeAccess = true, fieldDesc = "defines the behavior when the COMP address is matched")
declareField(peripheralName = BPU, registerName = BP_COMP, fieldName = COMP, bitOffset = 2, bitWidth = 27, readAccess = true, writeAccess = true, fieldDesc = "Stores bits [28:2] of the comparison address")
declareField(peripheralName = BPU, registerName = BP_COMP, fieldName = BE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "enables the comperator")
