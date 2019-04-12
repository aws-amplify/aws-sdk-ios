import sys
import os
import boto3
import datetime
import time
from collections import namedtuple
from send_email import *
import demjson

configurefile = sys.argv[1]
lastcommit = sys.argv[2]
tag = lastcommit[:10] 

with open(configurefile, 'r') as jsonfile:
    jsonstring = jsonfile.read()
configure =  demjson.decode(jsonstring)

project_arn =  configure['project_arn']
project_runlink = configure['project_runlink']

 
# session = boto3.session.Session(profile_name='default')
client = boto3.client('devicefarm', region_name='us-west-2')
 

module_result = namedtuple('module_result', 'name, result, total, passed, failed, warned, skipped, errored,  totalminutes')
response = client.list_runs(arn = project_arn)
resultlist = []
totals = 0 
passeds = 0
while True: 
    now  = datetime.datetime.now()
    for run in response['runs']:

        status = run['status']
        if status != 'COMPLETED' :
            continue
        testname =  run['name']
        if not testname.endswith(tag):
            continue
        totals += 1
        if run['result'] == "PASSED":
            passeds += 1
        # testname = testname[:-len(tailtag)]
        # if testname.endswith("-test"):
        #     testname = testname[:-5]
        result = module_result(
        name = testname ,       
        result = run['result'] ,
        total = int(run['counters']['total'])  ,
        passed = int(run['counters']['passed'])   ,
        failed = run['counters']['failed'] ,
        warned = run['counters']['warned'] ,
        skipped = run['counters']['skipped'] ,    
        errored = run['counters']['errored'] ,  
        totalminutes = run['deviceMinutes']['total']
        )

        # print(result)
        resultlist.append(result)
        # if  name.endswith(tag):
        #     print(run)
    if 'nextToken' in response:
        nextToken = response['nextToken']
        response = client.list_runs(arn = project_arn, nextToken = nextToken)
    else:
        break;

htmloutput = "<b>Totals: {0}</b> <br>".format(totals)
htmloutput += "<b>Passed: {0}</b>  <br>".format(passeds)
htmloutput += "<b>Last commit: {0}</b>  <br>".format(lastcommit)
htmloutput += '<a href="{0}">Details for more information. </a> <br>'.format(project_runlink)
htmloutput += "<br> <br>"
htmloutput +=  """<table border="0"> 
              <tr align="left"  bgcolor="#A9A9A9">
                <th width="300">Run name</th>
                <th width="80">Result</th>
                <th width="50">Total</th>
                <th width="50">Passed</th>
                <th width="50">Failed</th>
                <th width="50">Warned</th>
                <th width="50">Skipped</th>
                <th width="50">Errored</th>
                <th width="100">Total miniutes</th>
              </tr>
              """



for result in resultlist:
    print(result)
    if result.result == 'PASSED':
        bgcolor = "#32CD32"
    else:
        bgcolor = "#DC143C"
    htmloutput +=  \
            """<tr bgcolor="{bgcolor}">
                <td>{runname}</td>
                <td>{result}</td>
                <td>{total}</td>
                <td>{passed}</td>
                <td>{failed}</td>
                <td>{warned}</td>
                <td>{skipped}</th>
                <td>{errored}</th>
                <td>{totalminutes}</th>
              </tr>
            """.format(runname = result.name, result = result.result, total = result.total, passed = result.passed, failed = result.failed, warned = result.warned, skipped = result.skipped, errored = result.errored,totalminutes = result.totalminutes, bgcolor = bgcolor)
htmloutput += "</table>"
title = "iOS SDK Integration test result Passed:{0} Failed:{1}".format(passeds, totals - passeds)
send_email(title, htmloutput , contentformat = ContentFormat.Html, fromaddress = configure['email_from'], toaddresses = configure['email_to'] )

