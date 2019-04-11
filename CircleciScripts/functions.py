import sys
from subprocess import Popen, PIPE
import subprocess
import xml.etree.ElementTree as ET
import os
from datetime import datetime
from enum import Enum
from collections import namedtuple
import re
import platform


def runcommand(command, timeout=0,pipein=None, pipeout =  None, logcommandline = True,  workingdirectory=None):
    if logcommandline:
        print("running command: ", command, "......")
    process = Popen(command, shell=True, stdin=pipein, stdout = pipeout, cwd = workingdirectory)
    wait_times = 0 
    while True:
        try:
            process.communicate(timeout = 10)
        except subprocess.TimeoutExpired:        
            #tell circleci I am still alive, don't kill me
            if wait_times % 30 == 0 :
                print(str(datetime.now())+ ": I am still alive")
            # if time costed exceed timeout, quit
            if timeout >0 and wait_times > timeout * 6 :
                print(str(datetime.now())+ ": time out")
                return 1
            wait_times+=1 

            continue
        break
    exit_code = process.wait()    
    return exit_code


 #replace is a dictionary. it has a format 
 #{
 # "exclude:string"
 # "match":string,
 # "replace":string 
 # "files" : [
 # string,
 # ]
 # match and replace will be used by sed command like  sed -E 's/{match}/{replace}/'
 # please check with sed document to see how to handle escape characaters in match and replace
 #}
def replacefiles(root, replaces):
    for replaceaction in replaces:
        match = replaceaction["match"]
        replace = replaceaction["replace"]
        files = replaceaction["files"]
        enclosemark = "'"
        if "enclosemark" in replaceaction and replaceaction['enclosemark'] == "double" :
            enclosemark = '"'
        paramters = "-r -i''"
        if platform.system() == "Darwin":
            paramters = "-E -i ''"
        exclude=""
        if 'exclude' in replaceaction:
            exclude = "/{0}/ ! ".format(replaceaction['exclude'])       
        for file in files:
            targetfile = os.path.join(root, file)           
            runcommand(command = "sed {4}   {5}{3}s/{0}/{1}/{5}  '{2}'".format(match, replace, targetfile, exclude, paramters, enclosemark), logcommandline = True) 




