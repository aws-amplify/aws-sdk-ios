import sys

from framework_list import frameworks
from functions import log, run_command

log("Publishing CocoaPods")

for framework in frameworks:
    log(f"Publishing {framework}")

    # Most pods take a few minutes to build, and a few seconds to push to trunk. However, the
    # AWSiOSSDK podspec can take a long time to build, since it builds each dependent pod as
    # part of its linting process, so set the timeout accordingly.
    (exit_code, out, err) = run_command(
        ["bundle", "exec", "pod", "trunk", "push", f"{framework}.podspec", "--allow-warnings", "--synchronous"],
        keepalive_interval=300,
        timeout=3600,
    )

    if exit_code != 0 and "Unable to accept duplicate entry for" in str(out):
        log(f"Already published {framework}")
    elif exit_code == 0:
        log(f"Published {framework}")
    else:
        log(f"Could not publish {framework}: output: {out}; error: {err}")
        sys.exit(exit_code)

    if framework == "AWSCore":
        log(f"pod repo update after {framework}")
        (exit_code, out, err) = run_command(
            ["bundle", "exec", "pod", "repo", "update"],
            keepalive_interval=300,
            timeout=3600,
        )
        if exit_code != 0:
            log(f"Failed to update CocoaPods repo'; output={out}, error={err}")

sys.exit(0)
