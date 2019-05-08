import os
import sys
from functions import runcommand
from shutil import copyfile

root = sys.argv[1]
dest = sys.argv[2]
files = {
"LICENSE":"LICENSE",
"LICENSE.APACHE":"LICENSE.APACHE",
"NOTICE":"NOTICE",
"README.md":"README.md",
"CircleciScripts/src/README.html":"src/source.html",
"CircleciScripts/samples/README.html":"samples/samples.html"
}

for source,target in files.items(): 
    s = os.path.join(root, source)
    t = os.path.join(dest, target)
    runcommand("mkdir -p '{0}'".format(os.path.dirname(t)))
    copyfile(s,t)

