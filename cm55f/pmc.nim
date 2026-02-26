# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = PMC, baseAddress = 0xE001E300'u32, peripheralDesc = "Implementation defined power mode control")
declareRegister(peripheralName = PMC, registerName = CPDLPSTATE, addressOffset = 0x0'u32, readAccess = true, writeAccess = true, registerDesc = "Core Power Domain Low Power State Register specifies the desired low-power states for core (PDCORE), Extension Processing Unit (PDEPU), and RAM (PDRAMS) power domains")
declareField(peripheralName = PMC, registerName = CPDLPSTATE, fieldName = RLPSTATE, bitOffset = 8, bitWidth = 2, readAccess = true, writeAccess = true, fieldDesc = "Power-on state for PDRAMS power domain")
declareField(peripheralName = PMC, registerName = CPDLPSTATE, fieldName = ELPSTATE, bitOffset = 4, bitWidth = 2, readAccess = true, writeAccess = true, fieldDesc = "Type of low-power state for PDEPU")
declareField(peripheralName = PMC, registerName = CPDLPSTATE, fieldName = CLPSTATE, bitOffset = 0, bitWidth = 2, readAccess = true, writeAccess = true, fieldDesc = "Type of low-power state for PDCORE")
declareRegister(peripheralName = PMC, registerName = DPDLPSTATE, addressOffset = 0x4'u32, readAccess = true, writeAccess = true, registerDesc = "Debug Power Domain Low Power State Register specifies the desired low-power states for the debug (PDDEBUG) power domain")
declareField(peripheralName = PMC, registerName = DPDLPSTATE, fieldName = DLPSTATE, bitOffset = 0, bitWidth = 2, readAccess = true, writeAccess = true, fieldDesc = "Type of low-power state for PDDEBUG")
