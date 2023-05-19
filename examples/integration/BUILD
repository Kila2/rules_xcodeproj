load("@rules_xcodeproj//xcodeproj:defs.bzl", "xcodeproj")
load(
    ":xcodeproj_targets.bzl",
    "ASSOCIATED_EXTRA_FILES",
    "BAZEL_ENV",
    "DEFAULT_XCODE_CONFIGURATION",
    "EXTRA_FILES",
    "FAIL_FOR_INVALID_EXTRA_FILES_TARGETS",
    "PRE_BUILD",
    "PROJECT_OPTIONS",
    "SCHEME_AUTOGENERATION_MODE",
    "UNFOCUSED_TARGETS",
    "XCODEPROJ_TARGETS",
    "XCODE_CONFIGURATIONS",
    "get_xcode_schemes",
)

exports_files(["README.md"])

# Example of xcodeproj cache warming
#
# 1. Register a single macOS execution platform in `WORKSPACE`:
#
#      register_execution_platforms("@build_bazel_apple_support//platforms:macos_x86_64")
#
# 2. Create a `platform_mappings` file.
# 3. Add `build:rules_xcodeproj --@build_bazel_rules_swift//swift:universal_tools`
#    flag to your `.bazelrc`/`xcodeproj.bazelrc`.
# 4. Define an `xcodeproj` target for each macOS platform, e.g.
#    `xcodeproj-x86_64` and `xcodeproj-sim_arm64`. Even if you don't need to
#    support any of iOS, tvOS, or watchOS platforms, you still need to set all
#    of the `ios_simulator_cpus`, `tvos_simulator_cpus`, and
#    `watchos_simulator_cpus` to avoid Starlark transition effect. See
#    https://github.com/MobileNativeFoundation/rules_xcodeproj/issues/1094.
# 5. Run each of the following commands to produce a cache for each macOS host
#    platform. This can be run from an Intel or Apple silicon Mac.
#
#      bazel run --config=cache //:xcodeproj-x86_64 \
#        -- \
#        --generator_output_groups=all_targets \
#        'build --remote_download_minimal'
#
#      bazel run --config=cache //:xcodeproj-sim_arm64 \
#        -- \
#        --generator_output_groups=all_targets \
#        'build --remote_download_minimal'
#
xcodeproj(
    name = "xcodeproj",
    associated_extra_files = ASSOCIATED_EXTRA_FILES,
    build_mode = "xcode",
    extra_files = EXTRA_FILES,
    project_name = "Integration",
    tags = ["manual"],
    top_level_targets = XCODEPROJ_TARGETS,
)