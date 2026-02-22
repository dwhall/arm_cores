# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = DPB, baseAddress = 0xE0002000'u32, peripheralDesc = "Flash Patch and Breakpoint")
declareRegister(peripheralName = DPB, registerName = FP_CTRL, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "Provides FPB implementation information, and the global enable for the FPB unit")
declareField(peripheralName = DPB, registerName = FP_CTRL, fieldName = REV, bitOffset = 28, bitWidth = 4, readAccess = true, writeAccess = true, fieldDesc = "Flash Patch Breakpoint architecture revision")
declareField(peripheralName = DPB, registerName = FP_CTRL, fieldName = NUM_CODE[6:4], bitOffset = 12, bitWidth = 3, readAccess = true, writeAccess = true, fieldDesc = "Number of comperators 6:4")
declareField(peripheralName = DPB, registerName = FP_CTRL, fieldName = NUM_LIT, bitOffset = 8, bitWidth = 4, readAccess = true, writeAccess = true, fieldDesc = "The number of literal address comparators supported, starting from NUM_CODE upwards")
declareField(peripheralName = DPB, registerName = FP_CTRL, fieldName = NUM_CODE[3:0], bitOffset = 4, bitWidth = 4, readAccess = true, writeAccess = true, fieldDesc = "Number of comperators 3:0")
declareField(peripheralName = DPB, registerName = FP_CTRL, fieldName = KEY, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "On any write to FP_CTRL, this bit must be 1")
declareField(peripheralName = DPB, registerName = FP_CTRL, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enable bit for the FPB")
declareRegister(peripheralName = DPB, registerName = FP_REMAP, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Indicates whether the implementation supports flash patch remap, and if it does, holds the SRAM address for remap")
declareField(peripheralName = DPB, registerName = FP_REMAP, fieldName = RMPSPT, bitOffset = 29, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates whether the FPB unit supports flash patch remap")
declareField(peripheralName = DPB, registerName = FP_REMAP, fieldName = REMAP, bitOffset = 5, bitWidth = 24, readAccess = true, writeAccess = true, fieldDesc = "If the FPB supports flash patch remap, this field")
declareDimRegister(peripheralName = DPB, registerName = FP_COMP, addressOffset = 0x00000008'u32, dim = 8, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Holds an address for comparison with addresses in the Code memory region")
declareField(peripheralName = DPB, registerName = FP_COMP, fieldName = REPLACE, bitOffset = 30, bitWidth = 2, readAccess = true, writeAccess = true, fieldDesc = "For an instruction address comparator: Defines the behavior when the COMP address is matched")
declareField(peripheralName = DPB, registerName = FP_COMP, fieldName = COMP, bitOffset = 2, bitWidth = 27, readAccess = true, writeAccess = true, fieldDesc = "Bits[28:2] of the address to compare with addresses from the Code memory region. Bits[31:29] of the address for comparison are zero. For a literal address or instruction address remap, bits[1:0] of the comparison are also zero. For an instruction address breakpoint, bits[1:0] of the comparison are encoded by the REPLACE field.")
declareField(peripheralName = DPB, registerName = FP_COMP, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enable bit for this comparator")
declareField(peripheralName = DPB, registerName = FP_COMP, fieldName = BPADDR, bitOffset = 1, bitWidth = 31, readAccess = true, writeAccess = true, fieldDesc = "Breakpoint address")
declareField(peripheralName = DPB, registerName = FP_COMP, fieldName = BE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Breakpoint Enabled bit")
declareField(peripheralName = DPB, registerName = FP_COMP, fieldName = DCBA, bitOffset = 1, bitWidth = 31, readAccess = true, writeAccess = true, fieldDesc = "This field is defined depending on the value for Breakpoint Enabled")
declareField(peripheralName = DPB, registerName = FP_COMP, fieldName = FE, bitOffset = 31, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Specifies if Flash Patch enabled")
declareField(peripheralName = DPB, registerName = FP_COMP, fieldName = FPADDR, bitOffset = 2, bitWidth = 27, readAccess = true, writeAccess = true, fieldDesc = "Specifies bits[28")
