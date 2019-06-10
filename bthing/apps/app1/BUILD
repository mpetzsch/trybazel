load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

pkg_tar(
    name = "app1",
    extension = "tar.gz",
    package_dir = "",
    deps = [
        "//libs/libbt:libbt-tar",
        "@bcore//libs/liba:liba-tar",
        "@bcore//libs/libb:libb-tar"
    ]
)