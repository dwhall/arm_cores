# ARM Cores

Access the ARM core registers in Nim

SVD files give the programmer access to an ARM microcontroller's
peripherals and registers.  But there are no official SVD files for the
registers in the ARM core processor.

Segger created non-standard SVD-like files for a handful of ARM cores.
I am using those as a starting point to generate the Nim code in this project.
The result, though, may require some manual touch-up.

Segger link: https://www.segger.com/downloads/jlink/Ozone_Linux_x86_64.tgz

## Status

I've generated a package for the Cortex-M4
and have not yet made any manual corrections.
