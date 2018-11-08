from subprocess import Popen, PIPE
import subprocess
import os
from datetime import datetime
import time
import sys


filename = sys.argv[1]
commandargs = sys.argv[2:]
print(str(datetime.now())+ ": Running " + str(commandargs))
process = Popen(commandargs, stdout= PIPE, stderr= PIPE)

wait_times = 0 ;
while True:
    try:
        (output, err) = process.communicate(timeout = 10)
    except subprocess.TimeoutExpired:
        wait_times = wait_times + 1;
        #tell circleci I am still alive, don't kill me
        if wait_times % 10 == 0 :
            print(str(datetime.now())+ ": Still running")
        if wait_times > 600 :
            print(str(datetime.now())+ ": time out")
            quit(1)
        continue
    break
output = str(output.strip().decode())
if output != "":
	print(output)
	f= open(filename,"w+")
	f.write(output)
	f.close()
err = str(err.strip().decode())
if err != "":
	print(err)
exit_code = process.wait()
quit(exit_code)
