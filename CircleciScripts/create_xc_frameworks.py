import os
import sys

from framework_list import frameworks
from functions import log, run_command

EXCLUDE_FROM_XCFRAMEWORKS = [
    # This isn't a real framework
    "AWSiOSSDKv2",
    # Legacy frameworks not built or packaged
    "AWSCognitoSync",
    "AWSAuth",
]

def is_framework_included(framework):
    return framework not in EXCLUDE_FROM_XCFRAMEWORKS

def archiveFrameWork(framework, destination, archivePath):
    cmd = [
        "xcodebuild",
        "archive",
        "-project",
        "AWSiOSSDKv2.xcodeproj",
        "-scheme",
        framework,
        "-destination",
        destination,
        "-archivePath",
        archivePath,
        "SKIP_INSTALL=NO",
        "BUILD_LIBRARY_FOR_DISTRIBUTION=YES"
    ]
    (exit_code, out, err) = run_command(cmd, keepalive_interval=300, timeout=7200)
    if exit_code == 0:
        log(f"Created archive {framework} at {archivePath}")
    else:
        log(f"Could not create archive: {framework}; output: {out}; error: {err}")
        sys.exit(exit_code)

project_dir = os.getcwd()
log(f"Creating XC Framework in {project_dir}")

filtered_frameworks = list(filter(is_framework_included, frameworks))

for framework in filtered_frameworks:
    archivePath_iOS = "./Archives/" + framework + "_iOS"
    archivePath_iOS_Simulator = "./Archives/" + framework + "_iOS_Simulator"

    archiveFrameWork(framework, "generic/platform=iOS", archivePath_iOS)
    archiveFrameWork(framework, "generic/platform=iOS Simulator", archivePath_iOS_Simulator)

    frameworkPath_iOS = archivePath_iOS + ".xcarchive/Products/Library/Frameworks/" + framework + ".framework"
    frameworkPath_iOS_Simulator = archivePath_iOS_Simulator + ".xcarchive/Products/Library/Frameworks/" + framework + ".framework"
    
    xcFramework_Path = "./XCFrameWorks/" + framework + ".xcframework"
    cmd = [
        "xcodebuild",
        "-create-xcframework",
        "-framework",
        frameworkPath_iOS,
        "-framework",
        frameworkPath_iOS_Simulator,
        "-output",
        xcFramework_Path
    ]
    (exit_code, out, err) = run_command(cmd, keepalive_interval=300, timeout=7200)
    if exit_code == 0:
        log(f"Created xcframework for {framework} at {xcFramework_Path}")
    else:
        log(f"Could not create xcframework: {framework}; output: {out}; error: {err}")
        sys.exit(exit_code)
