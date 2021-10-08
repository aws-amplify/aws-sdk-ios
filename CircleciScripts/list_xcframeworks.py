# import os
# import sys
# import shutil

from framework_list import xcframeworks
from functions import log
from colors import bcolors

for framework in xcframeworks:
    log(f"{bcolors.OKGREEN} {framework} {bcolors.ENDC}")
