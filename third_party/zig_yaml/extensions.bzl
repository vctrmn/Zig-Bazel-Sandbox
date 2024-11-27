"""
Module extension for zig-yaml.
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

COMMIT = "bd6a1847857b9bcf45aa9b5328ab7bb067231e0d"
BUILD_FILE_CONTENT = """
load("@rules_zig//zig:defs.bzl", "zig_module")

zig_module(
    name = "zig_yaml_module",
    main = "src/yaml.zig",
    srcs = glob(["**/*.zig"]),
    visibility = ["//visibility:public"],
)
"""

def _base32_impl(ctx):
    git_repository(
        name = "zig_yaml_repo",
        commit = COMMIT,
        remote = "https://github.com/kubkon/zig-yaml.git",
        patch_args = ["-p1"],
        build_file_content = BUILD_FILE_CONTENT,
    )

    return ctx.extension_metadata(
        reproducible = True,
        root_module_direct_deps = "all",
        root_module_direct_dev_deps = [],
    )

zig_yaml_repo = module_extension(implementation = _base32_impl)
