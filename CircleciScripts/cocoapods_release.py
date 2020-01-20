from subprocess import Popen, PIPE
import subprocess
import os
import time
from framework_list import frameworks
from utils import log


log('Publishing cocoapods')

for package in frameworks:
    log(f'Publishing {package}')
    process = Popen(["pod", 'trunk', 'push', f'{package}.podspec', '--allow-warnings'], stdout= PIPE, stderr= PIPE)
    wait_times = 0 ;
    while True:
        try:
            (output, err) = process.communicate(timeout = 10)
        except subprocess.TimeoutExpired:
            wait_times = wait_times + 1;
            #tell circleci I am still alive, don't kill me
            if wait_times % 30 == 0 :
                log('I am still alive')
            if wait_times > 600 :
                log('time out')
                quit(1)

            continue
        break

    exit_code = process.wait()

    if exit_code != 0 :
        if "Unable to accept duplicate entry for:" in str(output):
            log(f'{package} is already published')
        else:
            log(f'Output: {output}')
            log(f'Error: {err}')
            log(f'Exit code: {exit_code}')
            log(f'Failed to publish {package}')
            quit(exit_code);

    log(f'Published {package}')

