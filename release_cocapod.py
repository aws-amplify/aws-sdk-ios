from subprocess import Popen, PIPE
import os
import sys

package = sys.argv[1]
print ('publishing ' + package + ' ...')
#   process = Popen(["pod", 'trunk','push',package,'--allow-warnings'], stdout=PIPE)
process = Popen(["pod", 'repo','push','https://github.com/sunchunqiang/mypod-specs',package,'--allow-warnings'], stdout=PIPE)
(output, err) = process.communicate()
exit_code = process.wait()
if exit_code != 0 :
    if "Unable to accept duplicate entry for:" in str(output):
        print (package +" is already published")
    else:
        print("Failed to publish " + package)
        quit(0);

