import os
import platform

from datetime import datetime
from subprocess import Popen, TimeoutExpired


def runcommand(
    command,
    timeout=0,
    pipein=None,
    pipeout=None,
    logcommandline=True,
    workingdirectory=None,
):
    if logcommandline:
        print("running command: ", command, "......")
    process = Popen(
        command, shell=True, stdin=pipein, stdout=pipeout, cwd=workingdirectory
    )
    wait_times = 0
    while True:
        try:
            process.communicate(timeout=10)
        except TimeoutExpired:
            # tell circleci I am still alive, don't kill me
            if wait_times % 30 == 0:
                print(str(datetime.now()) + ": I am still alive")
            # if time costed exceed timeout, quit
            if timeout > 0 and wait_times > timeout * 6:
                print(str(datetime.now()) + ": time out")
                return 1
            wait_times += 1

            continue
        break
    exit_code = process.wait()
    return exit_code


# replace is a dictionary. it has a format
# {
# "exclude:string"
# "match":string,
# "replace":string
# "files" : [
# string,
# ]
# match and replace will be used by sed command like  sed -E 's/{match}/{replace}/'
# please check with sed document to see how to handle escape characaters in match and replace
# }
def replacefiles(root, *replaces):
    for replaceaction in replaces:
        match = replaceaction["match"]
        replace = replaceaction["replace"]
        files = replaceaction["files"]
        enclosemark = "'"
        if "enclosemark" in replaceaction and replaceaction["enclosemark"] == "double":
            enclosemark = '"'
        sed_params = "-r -i''"
        if platform.system() == "Darwin":
            sed_params = "-E -i ''"
        exclude = ""
        if "exclude" in replaceaction:
            exclude = "/{0}/ ! ".format(replaceaction["exclude"])
        for file in files:
            targetfile = os.path.join(root, file)
            runcommand(
                command="sed {sed_params} {enclosemark}{exclude}s/{match}/{replace}/{enclosemark} '{targetfile}'".format(
                    match=match,
                    replace=replace,
                    targetfile=targetfile,
                    exclude=exclude,
                    sed_params=sed_params,
                    enclosemark=enclosemark,
                ),
                logcommandline=True,
            )
