# ARM Cores

Access the ARM core registers in Nim

SVD files give the programmer access to an ARM microcontroller's
peripherals and registers.  But there are no official SVD files for the
registers in the ARM core processor.

Segger created non-standard SVD-like files for a handful of ARM cores.
I am using those as a starting point to generate the Nim code in this project.
The result, though, may require some manual touch-up.

Segger link: https://www.segger.com/downloads/jlink/Ozone_Linux_x86_64.tgz

## If the core you need is not available...

Or if you need to re-generate an existing package from the .svd file,
then you will need the [minisvd2nim](https://github.com/dwhall/minisvd2nim) tool.
Install it via your preferred Nim package management tool:

```
nimble install git@github.com:dwhall/minisvd2nim.git
```

To generate a package for a core, use a command line such as:

```
minisvd2nim -s src/segger/Cortex-M4F.svd
```

## HOW-TO Use this repo:

In your application source directory, edit `config.nims` to add
the path to the package for the core you need:

`switch("path", "path/to/arm_cores")`

Which might look like this if your project consolidates its dependencies
in a subdirectory:

`switch("path", "$projectDir/../deps/arm_cores")`

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
