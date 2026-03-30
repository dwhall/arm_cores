#!fmt: off

# Package

version = "0.3.0"
author = "!!Dean"
description = "ARM core register access"
license = "MIT"
srcDir = "src"

# Dependencies

requires "nim >= 2.0"
requires "minisvd2nim >= 0.10.0" # the version number is necessary for dimensioned registers and fields
