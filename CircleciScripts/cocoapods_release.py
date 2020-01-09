from subprocess import Popen, PIPE
import subprocess
import os
from datetime import datetime
import time

from cocoapods_packages import podpackages

print (str(datetime.now()) + ': publishing cocoapods ...')

for package in podpackages:
    print (str(datetime.now())+': publishing ' + package + ' ...')
    process = Popen(["pod", 'trunk','push',package,'--allow-warnings'], stdout= PIPE, stderr= PIPE)
    wait_times = 0 ;
    while True:
        try:
            (output, err) = process.communicate(timeout = 10)
        except subprocess.TimeoutExpired:
            wait_times = wait_times + 1;
            #tell circleci I am still alive, don't kill me
            if wait_times % 30 == 0 :
                print(str(datetime.now())+ ": I am still alive")
            if wait_times > 600 :
                print(str(datetime.now())+ ": time out")
                quit(1)

            continue
        break
    exit_code = process.wait()
    if exit_code != 0 :
        if "Unable to accept duplicate entry for:" in str(output):
            print (str(datetime.now()) +": " +  package +" is already published")
        else:
            print(output)
            print(err,  exit_code  )
            print(str(datetime.now()) + " Failed to publish " + package)
            quit(exit_code);
    print (str(datetime.now())+': published ' + package)

