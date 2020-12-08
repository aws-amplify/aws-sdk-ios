import os
import sys

from framework_list import frameworks
from functions import log, run_command

EXCLUDE_FROM_CARTHAGE = [
    # This isn't a real framework
    "AWSiOSSDKv2",
    # Legacy frameworks not built or packaged
    "AWSAuth",
]


def is_framework_included(framework):
    return framework not in EXCLUDE_FROM_CARTHAGE


project_dir = os.getcwd()
log(f"Creating Carthage archive in {project_dir}")

framework_file_name = "aws-sdk-ios-carthage.framework.zip"

filtered_frameworks = list(filter(is_framework_included, frameworks))

cmd = [
    "carthage",
    "archive",
    "--project-directory",
    project_dir,
    "--output",
    framework_file_name,
] + filtered_frameworks

# Carthage builds each SDK as part of its process, so set a generous timeout for this process
(exit_code, out, err) = run_command(cmd, keepalive_interval=300, timeout=7200)

if exit_code == 0:
    log(f"Created Carthage archive {framework_file_name}")
else:
    log(f"Could not create Carthage archive: output: {out}; error: {err}")

sys.exit(exit_code)
