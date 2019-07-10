# VCV Plugin Builder - Linux

This repository contains a simple build environment for [VCV Rack](https://github.com/VCVRack/Rack) Plugins.

The environment is based on a [Docker](https://www.docker.com/) image of **Ubuntu 16.04 LTS** and provides
a compiler and libraries that adhere to the minimum version requirements for Rack plugins.

*Minimum requirements* for plugins:

- libc v2.23
- libstdc++ v5.4.0

**IMPORTANT - Why is this required?**

*Minimum version requirements* refer the library versions that Rack needs at minimum to run.
Both, `libc` and `libstdc++` are *forward-compatible*. This means, Rack and its plugins need to be
**compiled** with the minimum version of `libc` and `libstdc++`, but can **run** on any newer version of
both of the libraries. Compiling plugins with a newer version of the libraries and running them on
an older version will **not** work.

# Prerequisites

`Docker` is required. Install instructions for all supported platforms can be found on the
[Docker website](https://docs.docker.com/install/).

# Usage

Two environment variables control the build input and build dependencies:

- `WORKING_DIR`: Location of the Rack **plugin** source code.
- `RACK_DIR`: Location of the Rack **application** source code, which is a build dependency.

Example invocation:

```bash
cd ~/src/Rack/plugins/Fundamental
RACK_DIR=$PWD/../../ WORKING_DIR=$PWD ~/src/vcv-plugin-builder-linux/build.sh
```

On first run, a `Docker` image is built to provide the build environment. Once the image is built
the build process uses the image cache to not have to rebuild the image on every invocation.

Then, the plugin build process is executed inside of the `Docker` image in an isolated environment,
which is based on `Ubuntu 16.04 LTS`.
