# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = SYSTICK, baseAddress = 0xE000E010'u32, peripheralDesc = "SysTick Timer")
declareRegister(peripheralName = SYSTICK, registerName = SYST_CSR, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "Controls and provides status date for the SysTick timer")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = COUNTFLAG, bitOffset = 16, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Returns 1 if timer counted to 0 since the last read of this register")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = CLKSOURCE, bitOffset = 2, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Selects the SysTick timer clock source")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = TICKINT, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables SysTick exception request")
declareField(peripheralName = SYSTICK, registerName = SYST_CSR, fieldName = ENABLE, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = true, fieldDesc = "Enables the counter")
declareRegister(peripheralName = SYSTICK, registerName = SYST_RVR, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Specifies the SysTick timer counter reload value")
declareField(peripheralName = SYSTICK, registerName = SYST_RVR, fieldName = RELOAD, bitOffset = 0, bitWidth = 24, readAccess = true, writeAccess = true, fieldDesc = "Value to load into the SYST_CVR when the counter is enabled and when it reaches 0")
declareRegister(peripheralName = SYSTICK, registerName = SYST_CVR, addressOffset = 0x8'u32, readAccess = true, writeAccess = true, registerDesc = "Contains the current value of the SysTick counter")
declareField(peripheralName = SYSTICK, registerName = SYST_CVR, fieldName = CURRENT, bitOffset = 0, bitWidth = 24, readAccess = true, writeAccess = true, fieldDesc = "Current value of the SysTick counter. A write of any value clears the field to 0, and also clears the SYST_CSR.COUNTFLAG bit to 0.")
declareRegister(peripheralName = SYSTICK, registerName = SYST_CALIB, addressOffset = 0xC'u32, readAccess = true, writeAccess = false, registerDesc = "Indicates the SysTick calibration value and parameters for the selected Security state")
declareField(peripheralName = SYSTICK, registerName = SYST_CALIB, fieldName = NOREF, bitOffset = 31, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Indicates whether the device provides a reference clock to the processor")
declareField(peripheralName = SYSTICK, registerName = SYST_CALIB, fieldName = SKEW, bitOffset = 30, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Indicates whether the TENMS value is exact")
declareField(peripheralName = SYSTICK, registerName = SYST_CALIB, fieldName = TENMS, bitOffset = 0, bitWidth = 24, readAccess = true, writeAccess = false, fieldDesc = "Reload value for 10ms (100Hz) timing, subject to system clock skew errors. If the value reads as zero, the calibration value is not known.")
