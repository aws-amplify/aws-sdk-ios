import os
import sys
from shutil import copyfile

from functions import log, run_command

root = sys.argv[1]
dest = sys.argv[2]
files = {
    "LICENSE": "LICENSE",
    "LICENSE.APACHE": "LICENSE.APACHE",
    "NOTICE": "NOTICE",
    "README.md": "README.md",
    "CircleciScripts/src/README.html": "src/source.html",
    "CircleciScripts/samples/README.html": "samples/samples.html",
}

for source, target in files.items():
    s = os.path.join(root, source)
    t = os.path.join(dest, target)
    target_dir = os.path.dirname(t)
    exit_code, out, err = run_command(["mkdir", "-p", target_dir])
    if exit_code != 0:
        log(f"Failed to make directory '{target_dir}'; output={out}, error={err}")

    copyfile(s, t)
