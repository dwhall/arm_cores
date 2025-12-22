# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = SYSTICK, baseAddress = 0xE000E010'u32, peripheralDesc = "SysTick Timer")
declareRegister(peripheralName = SYSTICK, registerName = SYST_CALIB, addressOffset = 0xC'u32, readAccess = true, writeAccess = false, registerDesc = "Reads the SysTick timer calibration value and parameters for the selected Security state")
declareField(peripheralName = SYSTICK, registerName = SYST_CALIB, fieldName = NOREF, bitOffset = 31, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "No reference. Indicates whether the IMPLEMENTATION DEFINED reference clock is implemented")
declareField(peripheralName = SYSTICK, registerName = SYST_CALIB, fieldName = SKEW, bitOffset = 30, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Skew. Indicates whether the 10ms calibration value is exact")
declareField(peripheralName = SYSTICK, registerName = SYST_CALIB, fieldName = TENMS, bitOffset = 0, bitWidth = 24, readAccess = true, writeAccess = false, fieldDesc = "Ten milliseconds")
declareRegister(peripheralName = SYSTICK, registerName = SYST_CSR, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "Controls the SysTick timer and provides status data for the selected Security state")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = COUNTFLAG, bitOffset = 16, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Count flag. Indicates whether the counter has counted to zero since the last read of this register")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = CLKSOURCE, bitOffset = 2, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Clock source. Indicates the SysTick clock source")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = TICKINT, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Tick interrupt")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "SysTick enable. Indicates the enabled status of the SysTick counter")
declareRegister(peripheralName = SYSTICK, registerName = SYST_CVR, addressOffset = 0x8'u32, readAccess = true, writeAccess = true, registerDesc = "Reads or clears the SysTick timer current counter value for the selected Security state")
declareField(peripheralName = SYSTICK, registerName = SYST_CVR, fieldName = CURRENT, bitOffset = 0, bitWidth = 24, readAccess = true, writeAccess = true, fieldDesc = "Reset counter value")
declareRegister(peripheralName = SYSTICK, registerName = SYST_RVR, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Provides access SysTick timer counter reload value for the selected Security state")
declareField(peripheralName = SYSTICK, registerName = SYST_RVR, fieldName = RELOAD, bitOffset = 0, bitWidth = 24, readAccess = true, writeAccess = true, fieldDesc = "Counter reload value")
