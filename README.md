# Zig Bazel Sandbox

This project demonstrates how to set up a sandboxed Zig development environment
using Bazel. It integrates third-party libraries (base32, zig-yaml) and isolates
the Zig toolchain for a clean and reproducible build environment.

## Project structure

```
zig-bazel-sandbox/
├── src/
│   ├── main.zig              # Main entry point for the Zig application
│   └── utils/
│       └── hello.zig         # Example utility Zig file
├── third_party/
│   ├── base32/
│   │   ├── BUILD.bazel       # Bazel build file for the base32 library (empty)
│   │   └── extensions.bzl    # Extension file to fetch base32 as an external dependency
│   ├── zig/
│   │   ├── BUILD.bazel       # Bazel build file for Zig toolchain-related rules
│   │   └── zig_runner.bzl    # Sandbox setup for Zig toolchain execution
│   └── zig_yaml/
│       ├── BUILD.bazel       # Bazel build file for the zig-yaml library (empty)
│       └── extensions.bzl    # Extension file to fetch zig-yaml as an external dependency
├── MODULE.bazel              # Bazel module file to define dependencies and extensions
└── BUILD.bazel               # Top-level build file
```

## Getting Started

Build the project:

```
bazel build //...
```

Run the binary:

```
./bazel-bin/binary
```

Or : `bazel run binary`
