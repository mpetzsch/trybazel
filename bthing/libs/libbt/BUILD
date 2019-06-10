package(default_visibility = ["//visibility:public"])
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

filegroup(
    name="srcs",
    srcs = glob(["src/main/q/**/*.q"]),
    path = "libbt"
)

sh_library(
    name = "libbt",
    srcs = ["//libs/libbt:srcs"]
)

pkg_tar(
    name="libbt-tar",
    srcs=["//libs/libbt:srcs"],
    strip_prefix="src/main/q",
    package_dir="libs/libbt"
)

sh_test(
    name = "libbt-unit-test",
    srcs = ["@bcore//testsh:test.sh"]
)