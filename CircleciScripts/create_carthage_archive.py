from subprocess import Popen, PIPE
import subprocess
import os
import time
from framework_list import frameworks
from utils import log


log("Creating Carthage archive")

frameworkfilename = "aws-sdk-ios-carthage.framework.zip"

cmd = ["carthage", "archive", "--output", frameworkfilename] + frameworks
process = Popen(cmd, stdout= PIPE, stderr= PIPE)

elapsed_time = 0

while True:
    try:
        (output, err) = process.communicate(timeout = 10)
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

