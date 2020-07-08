import glob
import ntpath
import os
import sys

from functions import log, run_command

PROJECT_TYPES = ["Objective-C", "Swift"]

SAMPLE_PROJECTS = [
    "CognitoAuth-Sample",
    "IoT-Sample",
    "Lex-Sample",
    "Polly-Sample",
    "S3TransferUtility-Sample",
    "CognitoYourUserPools-Sample",
]


def build_project(project_dir, workspace, scheme):
    log(f"Installing CocoaPods for '{workspace}'")
    rv, out, err = run_command(["pod", "install", "--verbose"], working_dir=project_dir)
    if rv != 0:
        log(f"Failed to install CocoaPod for '{project_dir}; output={out}, error={err}'")
        return rv

    log(f"Building '{workspace}'")
    rv, out, err = run_command(
        [
            "xcodebuild",
            "build",
            "-workspace",
            workspace,
            "-scheme",
            scheme,
            "-sdk",
            "iphonesimulator",
        ],
        working_dir=project_dir,
    )
    if rv != 0:
        log(f"Failed to build '{project_dir}; output={out}, error={err}'")

    return rv


def build_all(root_dir):
    for project in SAMPLE_PROJECTS:
        for project_type in PROJECT_TYPES:
            project_folder = os.path.join(root_dir, project, project_type)
            if os.path.isdir(project_folder):
                workspaces = glob.glob(project_folder + "/*.xcworkspace")
                for workspace in workspaces:
                    scheme = os.path.splitext(ntpath.basename(workspace))[0]
                    rv = build_project(project_folder, workspace, scheme)
                    if rv != 0:
                        return rv


exit_code = build_all(sys.argv[1])
sys.exit(exit_code)
