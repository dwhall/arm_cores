# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = TPIU, baseAddress = 0xE0040000'u32, peripheralDesc = "Trace Port Interface Unit")
declareRegister(peripheralName = TPIU, registerName = TPIU_SSPSR, addressOffset = 0x0'u32, readAccess = true, writeAccess = false, registerDesc = "Supported Parallel Port Sizes Register indicates the supported parallel trace port sizes")
declareField(peripheralName = TPIU, registerName = TPIU_SSPSR, fieldName = SWIDTH[31:0], bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = false, fieldDesc = "SWIDTH[N] represents a trace port width of (N+1)")
declareRegister(peripheralName = TPIU, registerName = TPIU_CSPSR, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Current Parallel Port Size Register defines the width of the current parallel trace port")
declareField(peripheralName = TPIU, registerName = TPIU_CSPSR, fieldName = CWIDTH[31:0], bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = true, fieldDesc = "CWIDTH[N] represents a trace port width of (N+1)")
declareRegister(peripheralName = TPIU, registerName = TPIU_ACPR, addressOffset = 0x10'u32, readAccess = true, writeAccess = true, registerDesc = "Asynchronous Clock Prescaler Register defines a prescaler value for the baud rate of the Serial Wire Output (SWO)")
declareField(peripheralName = TPIU, registerName = TPIU_ACPR, fieldName = SWOSCALER, bitOffset = 0, bitWidth = 16, readAccess = true, writeAccess = true, fieldDesc = "SWO baud rate prescaler value")
declareRegister(peripheralName = TPIU, registerName = TPIU_SPPR, addressOffset = 0xF0'u32, readAccess = true, writeAccess = true, registerDesc = "Selected Pin Protocol Register selects the protocol used for trace output")
declareField(peripheralName = TPIU, registerName = TPIU_SPPR, fieldName = TXMODE, bitOffset = 0, bitWidth = 2, readAccess = true, writeAccess = true, fieldDesc = "Specifies the protocol for trace output from the TPIU")
declareRegister(peripheralName = TPIU, registerName = TPIU_TYPE, addressOffset = 0xF00'u32, readAccess = true, writeAccess = false, registerDesc = "TPIU Type register defines the SWO options supported by the TPIU")
declareField(peripheralName = TPIU, registerName = TPIU_TYPE, fieldName = NRZVALID, bitOffset = 11, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Indicates support for SWO using UART/NRZ encoding")
declareField(peripheralName = TPIU, registerName = TPIU_TYPE, fieldName = MANCVALID, bitOffset = 10, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Indicates support for SWO using Manchester encoding")
declareField(peripheralName = TPIU, registerName = TPIU_TYPE, fieldName = PTINVALID, bitOffset = 9, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Indicates support for parallel trace port operation")
declareField(peripheralName = TPIU, registerName = TPIU_TYPE, fieldName = FIFOSZ, bitOffset = 6, bitWidth = 3, readAccess = true, writeAccess = false, fieldDesc = "Indicates the minimum implemented size of the TPIU output FIFO for trace data")
