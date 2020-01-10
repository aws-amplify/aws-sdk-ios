from subprocess import Popen, PIPE
import subprocess
import os
from datetime import datetime
import time

frameworkfilename = "aws-sdk-ios-carthage.framework.zip"

print(str(datetime.now()) + ": creating Carthage archive...")

process = Popen(["carthage", "archive", "--output", frameworkfilename], stdout= PIPE, stderr= PIPE)

elapsed_time = 0

while True:
    try:
        (output, err) = process.communicate(timeout = 10)
    except subprocess.TimeoutExpired:
        elapsed_time = elapsed_time + 1;
        if elapsed_time % 30 == 0:
            print(str(datetime.now())+ ": I am still alive")
        if elapsed_time > 3600:
            print(str(datetime.now())+ ": time out")
            quit(1)

        continue
    break

exit_code = process.wait()

if exit_code != 0:
    if "Unable to create archive:" in str(output):
        print(str(datetime.now()) +": " +  package + " is already published")
    else:
        print(output)
        print(err,  exit_code)
        print(str(datetime.now()) + " Failed to publish " + package)
        quit(exit_code);

print(str(datetime.now()) + ": created Carthage archive...")

