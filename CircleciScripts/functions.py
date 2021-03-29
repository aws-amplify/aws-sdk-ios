import os
import platform
import sys
import logging
from datetime import datetime, timedelta
from subprocess import PIPE, Popen, TimeoutExpired


def log(*messages):
    print(f"{datetime.now()}:", *messages)

def setup_logging():
    logging.basicConfig(format='%(asctime)s %(message)s', datefmt='%m/%d/%Y %I:%M:%S %p', level=logging.INFO)

def has_timed_out(deadline):
    """
    Returns True if deadline is not None and the current date is later, False otherwise

    :param deadline: An optional datetime to compare against
    """
    if deadline is None:
        return False

    return datetime.now() > deadline


def run_command(
    command, keepalive_interval=60, timeout=1800, in_handle=PIPE, out_handle=PIPE, working_dir=None
):
    """
    Runs the specified command, emitting a keepalive message every `keepalive_interval` seconds.
    If the command has not completed in `timeout` seconds, fail. If keepalive_interval is None,
    the method will wait indefinitely for the process to complete, although CircleCI may terminate
    the process if it does not see any activity.

    :param command: A sequence containing the command and its arguments, to be passed to `Popen`
    :param keepalive_interval: The number of seconds to wait for a process to complete before
        emitting a keepalive message.
    :param timeout: The maximum number of seconds to wait for process completion
    :param in_handle: A file or subprocess handle to send the commands input. Defaults to PIPE
    :param out_handle: A file or subprocess handle to send the commands output. Defaults to PIPE
    :param working_dir: If specified, Popen will switch to this directory before executing
        `command`
    :return: A tuple of exit_code, command output, and command error
    """

    deadline = datetime.now() + timedelta(seconds=timeout) if timeout is not None else None
    process = Popen(command, stdin=in_handle, stdout=out_handle, stderr=PIPE, cwd=working_dir)
    while not has_timed_out(deadline) and process.returncode is None:
        try:
            log(f"Waiting for process {process.pid}")
            (out, err) = process.communicate(timeout=keepalive_interval)
        except TimeoutExpired:
            if has_timed_out(deadline):
                # Popen.communicate doesn't automatically clean up a child process upon timeout,
                # so do that here
                process.kill()
                (out, err) = process.communicate()
                log(f"ERROR: {process.pid} timed out; return code: {process.returncode}")
            else:
                log("I am still alive")
    return process.returncode, out, err


def replace_files(root, *replaces):
    """
    Replaces is an array of dictionaries, each one having the format
        {
          "exclude":string,
          "match":string,
          "replace":string,
          "files" : [
            string
          ]
        }

    `match` and `replace` will be used in the sed command: sed -E 's/{match}/{replace}/'.
    Check sed documentation to see how to handle escape characters in match and replace.
    `replace_files` will sys.exit if it encounters an error, but returns no values otherwise.

    :param root: The root directory containing the files to replace
    :param replaces: An array of `replace` dictionaries
    """
    for replace_action in replaces:
        match = replace_action["match"]
        replace = replace_action["replace"]
        files = replace_action["files"]

        extended_regex_flag = "-E" if platform.system() == "Darwin" else "-r"
        sed_params = [extended_regex_flag, "-i", ""]
        exclude = f"/{replace_action['exclude']}/ ! " if "exclude" in replace_action else ""

        for file in files:
            target_file = os.path.join(root, file)
            command = ["sed"] + sed_params + [f"{exclude}s/{match}/{replace}/", target_file]

            exit_code, out, err = run_command(command)
            if exit_code != 0:
                log(f"Failed to replace {target_file}; output={out}, error={err}'")
                sys.exit(exit_code)
