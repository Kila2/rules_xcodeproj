"""Exposes targets used by `xcodeproj` to allow use in fixture tests."""

load(
    "@rules_xcodeproj//xcodeproj:defs.bzl",
    "project_options",
    "top_level_target",
    "top_level_targets",
    "xcode_schemes",
)

BAZEL_ENV = {
    # Overriding `PATH`
    "PATH": "/bin:/usr/bin:/sbin:/usr/sbin",
    # Testing escaping (quotes, spaces, newlines, and slashes)
    "QUOTES_VAR1": "foo \"bar\"",
    "QUOTES_VAR2": 'foo "bar"',
    "QUOTES_VAR3": "foo 'bar'",
    "SLASHES_VAR": "value/with\\slashes",
    "MULTILINE": """one line
two line""",
    # Inheriting any `NOT_SET`, but won't find any
    "NOT_SET": None,
    # Inheriting any `TERM`
    "TERM": None,
}


PROJECT_OPTIONS = project_options(
    development_region = "es",
    indent_width = 3,
    organization_name = "BB",
    tab_width = 2,
    uses_tabs = True,
)

XCODE_CONFIGURATIONS = {
    "AppStore": {
        "//command_line_option:compilation_mode": "opt",
    },
    "Debug": {
        "//command_line_option:compilation_mode": "dbg",
    },
}

DEFAULT_XCODE_CONFIGURATION = "Debug"

PRE_BUILD = """set -euo pipefail

if [[ "$ACTION" == "build" ]]; then
  cd "$SRCROOT"
  echo "Hello from pre-build!"
fi"""

EXTRA_FILES = [
    "//:README.md",
]

FAIL_FOR_INVALID_EXTRA_FILES_TARGETS = True

ASSOCIATED_EXTRA_FILES = {
}

UNFOCUSED_TARGETS = [
    "//Lib:LibFramework.iOS",
]

XCODEPROJ_TARGETS = [
    top_level_target(
        label = "//macOSApp/Source:macOSApp",
    )
]

IOS_BUNDLE_ID = "rules-xcodeproj.example"
TEAMID = "V82V4GQZXM"

APP_CLIP_BUNDLE_ID = "{}.app-clip".format(IOS_BUNDLE_ID)
TVOS_BUNDLE_ID = IOS_BUNDLE_ID
WATCHOS_BUNDLE_ID = "{}.watch".format(IOS_BUNDLE_ID)

SCHEME_AUTOGENERATION_MODE = "all"

def get_xcode_schemes():
    return []
