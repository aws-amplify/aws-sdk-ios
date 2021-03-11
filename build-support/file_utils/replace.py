import logging
import os
import platform
import sys

from .run_command import run_command


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
            logging.debug(f"Updating file")
            target_file = os.path.join(root, file)
            command = ["sed"] + sed_params + [f"{exclude}s/{match}/{replace}/", target_file]

            exit_code, out, err = run_command(command)
            if exit_code != 0:
                logging.error(f"Failed to replace {target_file}; output={out}, error={err}'")
                sys.exit(exit_code)
