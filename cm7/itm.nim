# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = ITM, baseAddress = 0xE0000000'u32, peripheralDesc = "Instrumentation Macrocell")
declareDimRegister(peripheralName = ITM, registerName = ITM_STIM, addressOffset = 0x00000000'u32, dim = 256, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Stimulus Port Register provides the interface for generating instrumentation messages")
declareField(peripheralName = ITM, registerName = ITM_STIM, fieldName = STIMULUS, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = true, fieldDesc = "Data write to the stimulus port FIFO, for forwarding as a software event packet")
declareField(peripheralName = ITM, registerName = ITM_STIM, fieldName = FIFOREADY, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates whether the stimulus port FIFO can accept data")
declareDimRegister(peripheralName = ITM, registerName = ITM_TER, addressOffset = 0x00000E00'u32, dim = 8, dimIncrement = 4, readAccess = true, writeAccess = true, registerDesc = "Trace Enable Register provides an individual enable bit for each STIM register")
declareField(peripheralName = ITM, registerName = ITM_TER, fieldName = STIMENA, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = true, fieldDesc = "For bit STIMENA[n], in register ITM_TERx")
declareRegister(peripheralName = ITM, registerName = ITM_TPR, addressOffset = 0xE40'u32, readAccess = true, writeAccess = true, registerDesc = "Trace Privilege Register controls which stimulus ports can be accessed by unprivileged code")
declareField(peripheralName = ITM, registerName = ITM_TPR, fieldName = PRIVMASK, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = true, fieldDesc = "Bit mask to enable unprivileged access to ITM stimulus ports")
declareRegister(peripheralName = ITM, registerName = ITM_TCR, addressOffset = 0xE80'u32, readAccess = true, writeAccess = true, registerDesc = "Trace Control Register configures and controls transfers through the ITM interface")
declareField(peripheralName = ITM, registerName = ITM_TCR, fieldName = BUSY, bitOffset = 23, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates whether the ITM is currently processing events")
declareField(peripheralName = ITM, registerName = ITM_TCR, fieldName = TraceBusID, bitOffset = 16, bitWidth = 7, readAccess = true, writeAccess = true, fieldDesc = "Identifier for multi-source trace stream formatting")
declareField(peripheralName = ITM, registerName = ITM_TCR, fieldName = GTSFREQ, bitOffset = 10, bitWidth = 2, readAccess = true, writeAccess = true, fieldDesc = "Global timestamp frequency")
declareField(peripheralName = ITM, registerName = ITM_TCR, fieldName = TSPrescale, bitOffset = 8, bitWidth = 2, readAccess = true, writeAccess = true, fieldDesc = "Local timestamp prescaler, used with the trace packet reference clock")
declareField(peripheralName = ITM, registerName = ITM_TCR, fieldName = SWOENA, bitOffset = 4, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables asynchronous clocking of the timestamp counter")
declareField(peripheralName = ITM, registerName = ITM_TCR, fieldName = TXENA, bitOffset = 3, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables forwarding of hardware event packet from the DWT unit to the ITM for output to the TPIU")
declareField(peripheralName = ITM, registerName = ITM_TCR, fieldName = SYNCENA, bitOffset = 2, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables Synchronization packet transmission for a synchronous TPIU")
declareField(peripheralName = ITM, registerName = ITM_TCR, fieldName = TSENA, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables Local timestamp generation")
declareField(peripheralName = ITM, registerName = ITM_TCR, fieldName = ITMENA, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables the ITM")
