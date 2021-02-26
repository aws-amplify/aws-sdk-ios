import glob
import os
import sys

from functions import log, run_command

PROJECT_TYPES = ["Objective-C", "Swift"]

SAMPLE_PROJECTS = [
    "CognitoAuth-Sample",
    "CognitoYourUserPools-Sample",
    "IoT-Sample",
    "Lex-Sample",
    "Polly-Sample",
    "S3TransferUtility-Sample",
]


def build_project(project_dir, workspace, scheme):
    log(f"Installing CocoaPods for '{os.path.join(project_dir, workspace)}'")
    rv, out, err = run_command(["pod", "install", "--verbose"], working_dir=project_dir)
    if rv != 0:
        log(f"Failed to install CocoaPod for '{project_dir}; output={out}, error={err}'")
        return rv

    log(f"Building project '{os.path.join(project_dir, workspace)}'")
    build_command = [
        "xcodebuild",
        "build",
        "-workspace",
        workspace,
        "-scheme",
        scheme,
        "-sdk",
        "iphonesimulator",
    ]

    rv, out, err = run_command(build_command, working_dir=project_dir)
    if rv != 0:
        log(f"Failed to build '{project_dir}; output={out}, error={err}'")

    return rv


def build_all(root_dir):
    for project in SAMPLE_PROJECTS:
        for project_type in PROJECT_TYPES:
            project_folder = os.path.join(root_dir, project, project_type)
            if not os.path.isdir(project_folder):
                continue

            workspaces = glob.glob(project_folder + "/*.xcworkspace")
            for workspace_path in workspaces:
                workspace = os.path.basename(workspace_path)
                scheme = os.path.splitext(workspace)[0]
                rv = build_project(project_folder, workspace, scheme)
                if rv != 0:
                    return rv


exit_code = build_all(sys.argv[1])
sys.exit(exit_code)
