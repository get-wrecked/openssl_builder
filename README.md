# OpenSSL builder

This repo is intended to easily allow CI to build OpenSSL versions using vcpkg.

## Usage

- Run `build.bat`
- Collect results from `output` folder

## Implementation details

OpenSSL has an official `vcpkg` port, so we use this for easy building. We have our own vcpkg triplets (`x64-windows-recorder.cmake`, `arm64-windows-recorder.cmake`) which build OpenSSL dynamic (shared), but everything else as a static library.