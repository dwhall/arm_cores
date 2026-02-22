# To learn how to use the output of the declarations below, visit:
# https://github.com/dwhall/minisvd2nim/blob/main/README.md#how-to-access-the-device

import metagenerator

#!fmt: off
declarePeripheral(peripheralName = EWIC IStat, baseAddress = 0xE001E400'u32, peripheralDesc = "External Wakeup Interrupt Controller Interrupt Status Access")
declareRegister(peripheralName = EWIC IStat, registerName = EVENTSPR, addressOffset = 0x0'u32, readAccess = false, writeAccess = true, registerDesc = "Set pending events at wakeup that cannot be directly set in the Nested Vectored Interrupt Controller (NVIC) using the architecture programming model")
declareField(peripheralName = EWIC IStat, registerName = EVENTSPR, fieldName = EDBGREQ, bitOffset = 2, bitWidth = 1, readAccess = false, writeAccess = true, fieldDesc = "Causes the processor to behave like an external debug request has occurred")
declareField(peripheralName = EWIC IStat, registerName = EVENTSPR, fieldName = NMI, bitOffset = 1, bitWidth = 1, readAccess = false, writeAccess = true, fieldDesc = "Causes the processor to behave like a Non-maskable Interrupt (NMI) has occurred")
declareField(peripheralName = EWIC IStat, registerName = EVENTSPR, fieldName = EVENT, bitOffset = 1, bitWidth = 1, readAccess = false, writeAccess = true, fieldDesc = "Causes the processor to behave like an RXEV event has occurred")
declareRegister(peripheralName = EWIC IStat, registerName = EVENTMASKA, addressOffset = 0x80'u32, readAccess = true, writeAccess = false, registerDesc = "Provides the events on sleep entry which cause the processor to wake up, including information about internal events")
declareField(peripheralName = EWIC IStat, registerName = EVENTMASKA, fieldName = EDBGREQ, bitOffset = 2, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Mask for external debug request")
declareField(peripheralName = EWIC IStat, registerName = EVENTMASKA, fieldName = NMI, bitOffset = 1, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Mask for Non-Maskable Interrupt (NMI)")
declareField(peripheralName = EWIC IStat, registerName = EVENTMASKA, fieldName = EVENT, bitOffset = 0, bitWidth = 1, readAccess = true, writeAccess = false, fieldDesc = "Sensitive to RXEV when in WFE sleep")
declareDimRegister(peripheralName = EWIC IStat, registerName = EVENTMASK, addressOffset = 0x00000084'u32, dim = 32, dimIncrement = 4, readAccess = true, writeAccess = false, registerDesc = "Provides the events on sleep entry which cause the processor to wake up, including information about external events")
declareField(peripheralName = EWIC IStat, registerName = EVENTMASK, fieldName = IRQ, bitOffset = 0, bitWidth = 32, readAccess = true, writeAccess = false, fieldDesc = "Masks for interrupts ((n-1)x32) to (nx32)-1.")
