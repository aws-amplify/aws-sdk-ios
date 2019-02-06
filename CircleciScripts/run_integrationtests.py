import demjson
import sys
from subprocess import Popen, PIPE
import subprocess
import xml.etree.ElementTree as ET
import os
from datetime import datetime

#from sets import Set
def getfailedcases():   
    xmlfile='build/reports/junit.xml'
    tree = ET.parse(xmlfile) 
    root = tree.getroot() 
    testbundle = root.get('name')
    testbundle = testbundle[0:len(testbundle) - 7]

    failedtests = set()

    #TODO  we can filter with condtion 
    for testsuite in root.findall(".//testsuite"):  
        for testcase in testsuite.findall('.//testcase[failure]'): 
            suitename = testsuite.get('name')
            casename = testcase.get('name')
            failedtests.add(testbundle + '/' + suitename + '/' + casename)
    return failedtests 

def runcommand(command, timeout=0,pipein=None, pipeout =  None):
    print("running command: ", command, "......")
    process = Popen(command, shell=True, stdin=pipein, stdout = pipeout)
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

 #run test   
def runtest(otherargments, timeout = 0):
    runcommand("rm raw.log")
    runcommand("rm xcpretty.log")
    testcommand = "xcodebuild   test-without-building  -project AWSiOSSDKv2.xcodeproj -scheme AWSAllTests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 8,OS=12.1'" 
    testcommand +=" " +  otherargments;
    rawoutput = open('raw.log','w')
    exit_code = runcommand(testcommand,timeout, pipeout = rawoutput)
    rawoutput.close()
    print("Formatting test result .......")
    xcprettycommand = "cat raw.log | xcpretty -r junit  | tee xcpretty.log"
    runcommand(xcprettycommand)
    return exit_code


##########################  main function ###############################
# a command will like 

if (len(sys.argv) < 3 or sys.argv[1] == '-h' or sys.argv[1] == '-h') : 
    print("Usage: \r\n {0} <integrationTestsConfiguration json file path> <test result location>".format(sys.argv[0])) ;
    exit(1)


jsonfilename=sys.argv[1]
test_result_folder=sys.argv[2]

with open(jsonfilename, 'r') as jsonfile:
    jsonstring = jsonfile.read()

testConfigure =  demjson.decode(jsonstring)
runningConfigure = testConfigure['runningConfigure']
projectName = runningConfigure['projectName']
schemeName = runningConfigure['schemeName']
sdkName = runningConfigure['sdkName']
paltformName = runningConfigure['paltformName']
deviceName = runningConfigure['deviceName']
osVersion = runningConfigure['osVersion']

buildcommand = f"xcodebuild  build-for-testing -project {projectName} -scheme {schemeName} -sdk {sdkName} -destination 'platform={paltformName},name={deviceName},OS={osVersion}'"      
exit_code = runcommand(buildcommand)
if(exit_code != 0):
    exit(exit_code)  

testlist = testConfigure['testList']
testcommandhead = f"xcodebuild   test-without-building  -project {projectName} -scheme {schemeName} -sdk {sdkName} -destination 'platform={paltformName},name={deviceName},OS={osVersion}'"
testcommandtail = "    | tee raw.log  | xcpretty -r junit | tee xcpretty.log"
for testname in testlist:

    print("-------------------------------", testname , "-------------------------------");
    
    test = testlist[testname]
    testarguments = ' -only-testing:' + testname
    #create skipping tests parameters 
    skipingtests = ""
    if 'skipingtests' in test:
        for skipingtest in test['skipingtests']:
            skipingtests += ' -skip-testing:' + testname+ "/" + skipingtest

    exit_code = runtest(testarguments + skipingtests)
    print(testname, "exit code:", exit_code)
    # if test fails, check if the failed tests can be retried
    if exit_code != 0:
        if 'retriabletests' in test:
            retriableset = set()
            suitesname = testname;
            #get retriable test cases
            for retriabletest in test['retriabletests']:
                retriableset.add(suitesname + "/" + retriabletest) 
            print("retriabletests", retriableset)
            allretriable = True 
            #get all failed test cases
            faileds = getfailedcases()
            if len(faileds) == 0 :
                print("test command return an error code, but the failed test cases is 0")
                print("exit code:", exit_code)
                break;
            print("failed tests:",faileds)
            notretriabletests = faileds - retriableset 
            #only retry when all failed test cases are retriable
            if len(notretriabletests) > 0 :
                print("not retriable tests:", notretriabletests)
                break;

            #default retry times is 3
            retriabletimes = 3 
            if 'retriabletimes' in test:
                retriabletimes = test['retriabletimes']
            retrytimes = 1
            
            while retrytimes <= retriabletimes  and exit_code > 0:
                print("retry ", testname, "for ", retrytimes, " times")
                testarguments = ""
                for failed in faileds:
                    testarguments += ' -only-testing:' + failed
                retrytimes += 1
                exit_code = runtest(testarguments, timeout);
                print("retry exit code:", exit_code)                
                if(exit_code != 0 ):
                    faileds = getfailedcases()

    if exit_code != 0 :
        runcommand('mkdir {0}/{1}'.format(test_result_folder,testname))
        runcommand('echo "{2}" >> {0}/{1}/exitcode.log'.format(test_result_folder,testname,exit_code))
        runcommand('mv raw.log {0}/{1}/raw.log'.format(test_result_folder,testname))
        runcommand('mv xcpretty.log {0}/{1}/xcpretty.log'.format(test_result_folder,testname))
        runcommand('mv build/reports/junit.xml {0}/{1}/junit.xml'.format(test_result_folder,testname))
