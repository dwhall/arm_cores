# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = SYSTICK, baseAddress = 0xE000E010'u32, peripheralDesc = "SysTick Timer")
declareRegister(peripheralName = SYSTICK, registerName = SYST_CSR, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "Controls the system timer and provides status data")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = COUNTFLAG, bitOffset = 16, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates whether the counter has counted to 0 since the last read of this register")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = CLKSOURCE, bitOffset = 2, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates the SysTick clock source")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = TICKINT, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates whether counting to 0 causes the status of the SysTick exception to change to pending")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Indicates the enabled status of the SysTick counter")
declareRegister(peripheralName = SYSTICK, registerName = SYST_RVR, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Holds the reload value of the SYST_CVR")
declareField(peripheralName = SYSTICK, registerName = SYST_RVR, fieldName = RELOAD, bitOffset = 0, bitWidth = 24, readAccess = true, writeAccess = true, fieldDesc = "The value to load into the SYST_CVR when the counter reaches 0")
declareRegister(peripheralName = SYSTICK, registerName = SYST_CVR, addressOffset = 0x8'u32, readAccess = true, writeAccess = true, registerDesc = "Reads or clears the current counter value")
declareField(peripheralName = SYSTICK, registerName = SYST_CVR, fieldName = CURRENT, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = true, fieldDesc = "Current counter value")
declareRegister(peripheralName = SYSTICK, registerName = SYST_CALIB, addressOffset = 0xC'u32, readAccess = true, writeAccess = false, registerDesc = "Reads the calibration value and parameters for SysTick")
declareField(peripheralName = SYSTICK, registerName = SYST_CALIB, fieldName = NOREF, bitOffset = 31, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Indicates whether the IMPLEMENTATION DEFINED reference clock is implemented")
declareField(peripheralName = SYSTICK, registerName = SYST_CALIB, fieldName = SKEW, bitOffset = 30, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Indicates whether the 10ms calibration value is exact")
declareField(peripheralName = SYSTICK, registerName = SYST_CALIB, fieldName = TENMS, bitOffset = 0, bitWidth = 24, readAccess = true, writeAccess = false, fieldDesc = "Optionally, holds a reload value to be used for 10ms (100Hz) timing, subject to system clock skew errors")
