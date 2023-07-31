import os
import sys
import shutil

from multiprocessing import Pool
from framework_list import xcframeworks
from functions import log, run_command

PWD = os.getcwd()

IOS_DEVICE_ARCHIVE_PATH = f"{PWD}/xcframeworks/output/iOS/"
IOS_SIMULATOR_ARCHIVE_PATH = f"{PWD}/xcframeworks/output/Simulator/"
XCFRAMEWORK_PATH = f"{PWD}/xcframeworks/output/XCF/"

def create_archive(framework, project_file, build_for_device):
    if build_for_device:
        archive_path = f"{IOS_DEVICE_ARCHIVE_PATH}{framework}"
        destination = "generic/platform=iOS"
    else:
        archive_path = f"{IOS_SIMULATOR_ARCHIVE_PATH}{framework}"
        destination = "generic/platform=iOS Simulator"
    cmd = [
        "xcodebuild",
        "archive",
        "-project",
        project_file,
        "-scheme",
        framework,
        "-destination",
        destination,
        "-archivePath",
        archive_path,
        "SKIP_INSTALL=NO",
        "BUILD_LIBRARY_FOR_DISTRIBUTION=YES"
    ]

    (exit_code, out, err) = run_command(cmd, keepalive_interval=300, timeout=7200)
    if exit_code == 0:
        log(f"Created iOS archive {framework} {destination}")
    else:
        log(f"Could not create xcodebuild archive: {framework} output: {out}; error: {err}")
        sys.exit(exit_code)

def map_framework_to_project(framework_list):
    framework_map = {}
    cmd = [
        "xcodebuild",
        "-project",
        "AWSiOSSDKv2.xcodeproj",
        "-list",
    ]
    (exit_code, out, err) = run_command(cmd, keepalive_interval=300, timeout=7200)
    if exit_code == 0:
        log(f"List of schema found")
    else:
        log(f"Xcodebuild list failed: output: {out}; error: {err}")
        sys.exit(exit_code)

    for framework in framework_list:
        if framework not in str(out):
            framework_map[framework] = "./AWSAuthSDK/AWSAuthSDK.xcodeproj"
        else:
            framework_map[framework] = "AWSiOSSDKv2.xcodeproj"
    return framework_map

def archive(framework):
    xcframework = f"{XCFRAMEWORK_PATH}{framework}.xcframework"

    if os.path.exists(xcframework):
        log(f"skipping {framework}...")
        return

    log(f"Creating archives for {framework}")

    create_archive(framework=framework, project_file=framework_map[framework], build_for_device=True)
    create_archive(framework=framework, project_file=framework_map[framework], build_for_device=False)

framework_map = map_framework_to_project(xcframeworks)

def create_xc_framework(framework):
    ios_device_framework = f"{IOS_DEVICE_ARCHIVE_PATH}{framework}.xcarchive/Products/Library/Frameworks/{framework}.framework"
    ios_device_debug_symbols = f"{IOS_DEVICE_ARCHIVE_PATH}{framework}.xcarchive/dSYMs/{framework}.framework.dSYM"
    ios_simulator_framework = f"{IOS_SIMULATOR_ARCHIVE_PATH}{framework}.xcarchive/Products/Library/Frameworks/{framework}.framework"
    ios_simulator_debug_symbols = f"{IOS_SIMULATOR_ARCHIVE_PATH}{framework}.xcarchive/dSYMs/{framework}.framework.dSYM"
    xcframework = f"{XCFRAMEWORK_PATH}{framework}.xcframework"
    if os.path.exists(xcframework):
        log(f"skipping {framework}...")
    else:
        log(f"Creating XCF for {framework}")

        cmd = [
                "xcodebuild",
                "-create-xcframework",
                "-framework",
                ios_device_framework,
                "-debug-symbols",
                ios_device_debug_symbols,
                "-framework",
                ios_simulator_framework,
                "-debug-symbols",
                ios_simulator_debug_symbols,
                "-output",
                xcframework
            ]
        (exit_code, out, err) = run_command(cmd, keepalive_interval=300, timeout=7200)
        if exit_code == 0:
            log(f"Created XCFramework for {framework}")
        else:
            log(f"Could not create XCFramework: {framework} output: {out}; error: {err}")
            sys.exit(exit_code)

def process_frameworks(process, base_frameworks, remaining_frameworks, pool):
    for base_framework in base_frameworks:
        process(base_framework)

    with pool:
        pool.map(process, remaining_frameworks)

if __name__ == '__main__':
    project_dir = os.getcwd()
    log(f"Creating XCFrameworks in {project_dir}")

    # These base_frameworks must be built first and serially.
    # Other frameworks are dependant on these base_frameworks,
    # and the build scripts will fail if they're not archived /
    # created in the proper order.
    # *** This may need to be updated when dependencies change ***
    base_frameworks = xcframeworks[:5]

    # The remaining_frameworks are archived and built concurrently
    # because they are dependent only on base_frameworks.
    remaining_frameworks = xcframeworks[5:]

    # To build the remaining_frameworks concurrently, we're using
    # a Pool(). By omitting an explicit input into the Pool constructor
    # we're allowing it to decide an appropriate amount of processes to run.
    archive_pool = Pool()

    # First let's archive everything.
    process_frameworks(archive, base_frameworks, remaining_frameworks, archive_pool)

    create_frameworks_pool = Pool()
    # Next let's create the xcframeworks.
    process_frameworks(create_xc_framework, base_frameworks, remaining_frameworks, create_frameworks_pool)

    if os.path.exists(IOS_DEVICE_ARCHIVE_PATH):
        shutil.rmtree(IOS_DEVICE_ARCHIVE_PATH)
    if os.path.exists(IOS_SIMULATOR_ARCHIVE_PATH):
        shutil.rmtree(IOS_SIMULATOR_ARCHIVE_PATH)
