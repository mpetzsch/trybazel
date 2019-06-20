load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

def q_lib(name, strip_prefix = "src/main/q/", replace_prefix = "", pkg_dir = "libs", visibility = ["//visibility:public"], bcore_repository = ""):
    src_glob = native.glob(["src/main/q/**"])
    test_glob = native.glob(["src/test/q/**/test*.q"])
    test_resources_glob = native.glob(["src/test/resources/**"])


    native.filegroup(
        name="srcs",
        srcs = src_glob,
        visibility = ["//visibility:private"]
    )

    native.filegroup(
        name="tests",
        srcs = test_glob,
        visibility = ["//visibility:private"],
        testonly = True
    )  

    native.filegroup(
        name="test-resources",
        srcs = test_resources_glob,
        visibility = ["//visibility:private"],
        testonly = True
    )    

    native.genrule(
        name = name,
        srcs = src_glob,
        outs = [f.replace(strip_prefix, replace_prefix) for f in src_glob],
        cmd = '\n'.join(['mkdir -p $$(dirname $(location %s)) && cp $(location %s) $(location :%s)' % (f, f, f.replace(strip_prefix, replace_prefix)) for f in src_glob]),
        visibility = visibility
    )

    for test in test_glob:
        native.sh_test(
            name = name + test,
            args = ["-testFiles $(locations tests)" + " -testFile " + test],
            size = "small",
            srcs = [bcore_repository + "//testsh:test.sh"],
            data = [bcore_repository + "//testsh", name, "tests", "test-resources"]
        )

    pkg_tar(
        name=name + "-pkg",        
        srcs=[name],
        strip_prefix = ".",
        package_dir=pkg_dir + "/" + name,
        visibility = visibility
    )