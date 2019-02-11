import os
import sys
from functions import runcommand

user =  sys.argv[1]
token =  sys.argv[2]
title =  sys.argv[3]
body = sys.argv[4]
base =  sys.argv[5]
head =  sys.argv[6]
touser =  sys.argv[7]
repo =  sys.argv[8]

data='{{"title":"{0}","base":"{1}","head":"{2}", "body":"{3}"}}'.format(title, base, head,body)
print("data:", data)
rn = runcommand(command = "curl --user  '{0}:{1}' --request POST  --data  '{2}' 'https://api.github.com/repos/{3}/{4}/pulls'".format(user,token,data, touser, repo), logcommandline = False)
exit(rn)
