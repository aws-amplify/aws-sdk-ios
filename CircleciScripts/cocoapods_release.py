from subprocess import Popen, PIPE
import subprocess
import os
import time
from framework_list import grouped_frameworks
from utils import log

# Execute a process using `Popen` and avoid CircleCI to kill the process by emitting
# a message to the process every now and then.
def execute_command_and_wait(commands):
    process = Popen(commands, stdout= PIPE, stderr= PIPE)
    wait_times = 0
    while True:
        try:
            (output, err) = process.communicate(timeout = 10)
        except subprocess.TimeoutExpired:
            wait_times = wait_times + 1
            # tell circleci I am still alive, don't kill me
            if wait_times % 30 == 0:
                log('I am still alive')
            if wait_times > 600:
                log('time out')
                quit(1)

            continue
        break

        exit_code = process.wait()
        if exit_code != 0:
            if 'Unable to accept duplicate entry for:' in str(output):
                log(f'{package} is already published')
            else:
                log(f'Output: {output}')
                log(f'Error: {err}')
                log(f'Exit code: {exit_code}')
                log(f'Failed to publish {package}')
                quit(exit_code)

# Start the CocoaPods publishing...

# Wait time between each framework group publishing, so dependencies are resolved correctly
# Refer to https://github.com/CocoaPods/CocoaPods/issues/9497 for details
COCOAPODS_PUSH_WAIT_TIME = 600

log('Publishing cocoapods')

number_of_groups = len(grouped_frameworks)
current_group = 0

for frameworks in grouped_frameworks:
    for package in frameworks:
        log(f'Publishing {package}')

        execute_command_and_wait(['pod', 'trunk', 'push', f'{package}.podspec', '--allow-warnings'])
        log(f'Published {package}')
    if current_group < number_of_groups - 1:
        # Wait until the packages
        log('Waiting for packages to reach Trunk...')
        time.sleep(COCOAPODS_PUSH_WAIT_TIME)
    current_group += 1
