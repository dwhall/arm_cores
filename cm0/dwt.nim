# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = DWT, baseAddress = 0xE0001000'u32, peripheralDesc = "Data Watchpoint and Trace")
declareRegister(peripheralName = DWT, registerName = DWT_CTRL, addressOffset = 0x0'u32, readAccess = true, writeAccess = false, registerDesc = "Data Watchpoint Trace Control Register provides configuration and status information and control of the unit")
declareField(peripheralName = DWT, registerName = DWT_CTRL, fieldName = NUMCOMP, bitOffset = 28, bitWidth = 4, readAccess = true, writeAccess = false, fieldDesc = "Number of comparators implemented")
declareRegister(peripheralName = DWT, registerName = DWT_PCSR, addressOffset = 0x1C'u32, readAccess = true, writeAccess = false, registerDesc = "Program Counter Sample Register samples the current value of the program counter")
declareField(peripheralName = DWT, registerName = DWT_PCSR, fieldName = EIASAMPLE, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = false, fieldDesc = "Executed Instruction Address sample value")
declareDimRegister(peripheralName = DWT, registerName = DWT_COMP, addressOffset = 0x00000020'u32, dim = 8, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Comparator register provides a reference value for use by watchpoint comparator n")
declareField(peripheralName = DWT, registerName = DWT_COMP, fieldName = COMP, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = true, fieldDesc = "Reference value for comparison")
declareDimRegister(peripheralName = DWT, registerName = DWT_MASK, addressOffset = 0x00000024'u32, dim = 8, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Comparator Mask register provides the size of the ignore mask applied to the access address for address range matching by comparator n")
declareField(peripheralName = DWT, registerName = DWT_MASK, fieldName = MASK, bitOffset = 0, bitWidth = 5, readAccess = true, writeAccess = true, fieldDesc = "The size of the ignore mask, 0-31 bits, applied to address range matching")
declareDimRegister(peripheralName = DWT, registerName = DWT_FUNCTION, addressOffset = 0x00000028'u32, dim = 8, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Data Watchpoint Trace Comparator Function Register")
declareField(peripheralName = DWT, registerName = DWT_FUNCTION, fieldName = MATCHED, bitOffset = 24, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Comparator match")
declareField(peripheralName = DWT, registerName = DWT_FUNCTION, fieldName = FUNCTION, bitOffset = 0, bitWidth = 4, readAccess = true, writeAccess = true, fieldDesc = "Selects action taken on comparator match")
