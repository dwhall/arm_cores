# ARM Cores

Access the ARM core registers in Nim

SVD files give the programmer access to an ARM microcontroller's
peripherals and registers.  But there are no official SVD files for the
registers in the ARM core processor.

Segger created non-standard SVD-like files for a handful of ARM cores.
I am using those as a starting point to generate the Nim code in this project.
The result, though, may require some manual touch-up.

Segger link: https://www.segger.com/downloads/jlink/Ozone_Linux_x86_64.tgz

## Prerequisites

You will need the [minisvd2nim](https://github.com/dwhall/minisvd2nim) tool.
Install it via your preferred Nim package management tool:

`nimble install git@github.com:dwhall/minisvd2nim.git`

## Usage:

If the core you need isn't already available,
convert it via a command line such as:

```text
minisvd2nim -s src/segger/Cortex-M4F.svd
```

## Then what?

You will need to add the path of the generated package to your project.
In the directory where your application source uses the generated package,
edit `config.nims` to add this line:

`switch("path", "path/to/generated/pkg")`

## Status

I've generated a package for the Cortex-M4 and
early tests are working (and revealing issues).

## Fixes

* 2025/12/22 - In `Cortex-M4F.svd` in the XML path,
  `device/cpu/groups/group/peripherals/peripheral(SCB)/register(ID_DFR0)`,
  there was a field with the name `<name>Debug model, M profile</name>`.
  The comma in this name caused problems with the `minisvd2nim` tool,
  so the field was renamed following the format in the preceding register,
  from "Debug model, M profile" to "M profile debug model".

* 2025/12/22 - For each .svd file with a core that includes an FPU
  with a similarly named core without an FPU,
  I renamed the `cpu/name` field to include an `F` at the end
  so that the `minisvd2nim` tool would generated a distinctly named
  package/directory. This change applies to these files, src/segger/
    - Cortex-M4F.svd
    - Cortex-M7F.svd
    - Cortex-M33F.svd
    - Cortex-M55F.svd
    - Cortex-M85F.svd

* 2025/12/22 - In Cortex-M55F.svd and Cortex-M85F.svd, renamed
  `<name>FP & MVE</name>` to `<name>FP_MVE</name>`
