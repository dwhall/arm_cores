# ARM Cores

Access the ARM Cortex-M core registers in Nim

SVD files give the programmer access to an ARM microcontroller's
peripherals and registers.  But there are no official SVD files for the
registers in the ARM core processor.

## If the core you need is not available...

Or if you need to re-generate an existing package from the .svd file,
then you will need the [minisvd2nim](https://github.com/dwhall/minisvd2nim) tool.
Install it via your preferred Nim package management tool:

```
nimble install git@github.com:dwhall/minisvd2nim.git
```

To generate a package for a core, use a command line such as:

```
minisvd2nim src/Cortex-M4F.svd
```

## HOW-TO Use this repo:

In your application source directory, edit `config.nims` to add
the path to the package for the core you need:

`switch("path", "path/to/arm_cores")`

Which might look like this if your project consolidates its dependencies
in a subdirectory:

`switch("path", "$projectDir/../deps/arm_cores")`

## HOW-TO Build:

This repo should contain everything you need for Cortex-M cores already built.
But in the case you need to make modifications, at the package root:

`nim build`

This will run the build task in `config.nims`.
