import logging
from datetime import datetime, timedelta
from subprocess import PIPE, Popen, TimeoutExpired


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
            logging.debug(f"Waiting for process {process.pid}")
            (out, err) = process.communicate(timeout=keepalive_interval)
        except TimeoutExpired:
            if has_timed_out(deadline):
                # Popen.communicate doesn't automatically clean up a child process upon timeout,
                # so do that here
                process.kill()
                (out, err) = process.communicate()
                logging.error(f"ERROR: {process.pid} timed out; return code: {process.returncode}")
            else:
                logging.info("I am still alive")
    return process.returncode, out, err
