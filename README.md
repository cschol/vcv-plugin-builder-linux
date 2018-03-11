# VCV Plugin Builder - Linux

This repository contains a simple build environment for [VCV Rack](https://github.com/VCVRack/Rack) Plugins.

The environment is based on a [Docker](https://www.docker.com/) image of **Ubuntu 16.04 LTS** and provides
a compiler and libraries that adhere to the minimum version requirements for Rack plugins.

Minimum requirements for plugins:

- libc v2.23
- libstdc++ v5.4.0

# Prerequisites

`Docker` is required. Install instructions for your platform can be found on the [Docker website](https://docs.docker.com/install/).

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