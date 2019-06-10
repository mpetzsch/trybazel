package(default_visibility = ["//visibility:public"])
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

filegroup(
    name="srcs",
    srcs = glob(["src/main/q/**/*.q"]),
    path = "libb"
)

sh_library(
    name = "libb",
    srcs = ["//libs/libb:srcs"]
)

pkg_tar(
    name="libb-tar",
    srcs=["//libs/libb:srcs"],
    strip_prefix="src/main/q",
    package_dir="libs/libb"
)

sh_test(
    name = "libb-unit-test",
    srcs = ["//testsh:test.sh"]
)