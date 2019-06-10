package(default_visibility = ["//visibility:public"])
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

filegroup(
    name="srcs",
    srcs = glob(["src/main/q/**/*.q"]),
    path = "liba"
)

sh_library(
    name = "liba",
    srcs = ["//libs/liba:srcs"]
)

pkg_tar(
    name="liba-tar",
    srcs=["//libs/liba:srcs"],
    strip_prefix="src/main/q",
    package_dir="libs/liba"
)

sh_test(
    name = "liba-unit-test",
    srcs = ["//testsh:test.sh"]
)