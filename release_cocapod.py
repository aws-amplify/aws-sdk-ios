from subprocess import Popen, PIPE
import os
import sys
import re

if len(sys.argv) < 2:
    print("parameter is missed")
    quit(1)
packages = sys.argv[1]
packages = re.split("[, ,]", packages)
for package in packages:
    if package =='':  continue
    print ('publishing ' + package + ' ...')
    #   process = Popen(["pod", 'trunk','push',package,'--allow-warnings'], stdout=PIPE)
    process = Popen(["pod", 'repo','push','https://github.com/sunchunqiang/mypod-specs',package,'--allow-warnings'], stdout=PIPE)
    (output, err) = process.communicate()
    exit_code = process.wait()
    if exit_code != 0 :
        if "Unable to accept duplicate entry for:" in str(output):
            print (package +" is already published")
        else:
            print(output)
            print(err,  exit_code  )
            print("Failed to publish " + package)
            quit(exit_code);

