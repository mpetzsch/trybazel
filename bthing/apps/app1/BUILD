load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

pkg_tar(
    name = "app1",
    extension = "tar.gz",
    deps = [
        "@bcore//libs/liba:liba-pkg",
        "@bcore//libs/libb:libb-pkg",
        "//libs/libbt:libbt-pkg"
    ]
)