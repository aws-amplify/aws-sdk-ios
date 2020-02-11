import os
from subprocess import Popen, PIPE
from framework_list import frameworks
from utils import log


EXCLUDE_FROM_CARTHAGE = [
    # This isn't a real framework
    'AWSiOSSDKv2',
    # Legacy frameworks not built or packaged
    'AWSCognitoSync',
    'AWSAuth'
]

def is_framework_included(framework):
    return (framework not in EXCLUDE_FROM_CARTHAGE)


project_dir = os.getcwd()
log(f"Creating Carthage archive in {project_dir}")

frameworkfilename = "aws-sdk-ios-carthage.framework.zip"

filtered_frameworks = list(filter(is_framework_included, frameworks))

cmd = ["carthage", "archive", "--project-directory", project_dir, "--output", frameworkfilename] + filtered_frameworks
process = Popen(cmd, stdout= PIPE, stderr= PIPE)

elapsed_time = 0

while True:
    try:
        (output, err) = process.communicate()
    except subprocess.TimeoutExpired:
        elapsed_time = elapsed_time + 1;
        if elapsed_time % 30 == 0:
            log("I am still alive")
        if elapsed_time > 600:
            log("time out")
            quit(1)

        continue
    break

exit_code = process.wait()

if exit_code != 0:
    print(output)
    print(err, exit_code)
    log(f'Failed to create archive {frameworkfilename}')
    quit(exit_code);

log("Created Carthage archive")

