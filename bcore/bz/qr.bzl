load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

def q_lib(name, strip_prefix = "src/main/q/", replace_prefix = "", pkg_dir = "libs", visibility = ["//visibility:public"]):
    src_glob = native.glob(["src/main/q/**"])
    test_glob = native.glob(["src/test/q/**"])

    native.filegroup(
        name="srcs",
        srcs = src_glob,
        visibility = ["//visibility:private"]
    )

    native.filegroup(
        name="tests",
        srcs = test_glob,
        visibility = ["//visibility:private"]
    )

    native.genrule(
        name = name,
        srcs = src_glob,
        outs = [f.replace(strip_prefix, replace_prefix) for f in src_glob],
        cmd = '\n'.join(['mkdir -p $$(dirname $(location %s)) && cp $(location %s) $(location :%s)' % (f, f, f.replace(strip_prefix, replace_prefix)) for f in src_glob]),
        visibility = visibility
    )

    pkg_tar(
        name=name + "-pkg",        
        srcs=[name],
        strip_prefix = ".",
        package_dir=pkg_dir + "/" + name,
        visibility = visibility
    )