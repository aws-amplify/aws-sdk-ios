import demjson
import sys
from subprocess import Popen, PIPE
import subprocess
import xml.etree.ElementTree as ET
import os
from datetime import datetime
from functions import runcommand
#from sets import Set
def getfailedcases(withBundle = True):   
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
            if withBundle: 
                failedtests.add(testbundle + '/' + suitename + '/' + casename)
            else:
                failedtests.add(suitename + '/' + casename)

    return failedtests 
 #run test   
def runtest(otherargments, projectPath, schemeName, projectName, destination, derivedDataPath, timeout = 0):
    runcommand("rm raw.log")
    runcommand("rm xcpretty.log")
    testcommand = "xcodebuild   test-without-building  -project {0} -scheme {1} -sdk iphonesimulator -destination '{2}'  -derivedDataPath  {3}/{4}".format(projectPath,schemeName, destination, derivedDataPath, projectName) 
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
    print("Usage: \r\n {0} <integrationTestsConfiguration json file path> <test result location> <group name>".format(sys.argv[0])) ;
    exit(1)


jsonfilename=sys.argv[1]
test_result_folder=sys.argv[2]
group_name = sys.argv[3]
destination = sys.argv[4]
derivedDataPath = sys.argv[5]

with open(jsonfilename, 'r') as jsonfile:
    jsonstring = jsonfile.read()

testConfigure =  demjson.decode(jsonstring)
runningConfigure = testConfigure['runningConfigure']
projectName = runningConfigure['projectName']
projectPath = runningConfigure['projectPath']
schemeName = runningConfigure['schemeName']
sdkName = runningConfigure['sdkName']
 

print("group name:", group_name)
testgroup = testConfigure[group_name]
testlist = testgroup['test_list']
if 'projectName' in testgroup.keys() :
    projectName = testgroup['projectName']
if 'projectPath' in testgroup.keys():
    projectPath = testgroup['projectPath']
if 'schemeName' in testgroup.keys():
    schemeName = testgroup['schemeName']

print("projectName, projectPath, schemeName, destination", projectName, projectPath, schemeName, destination)
# testcommandhead = f"xcodebuild   test-without-building  -project {projectName} -scheme {schemeName} -sdk {sdkName} -destination 'platform={paltformName},name={deviceName},OS={osVersion}'"
# testcommandtail = "    | tee raw.log  | xcpretty -r junit | tee xcpretty.log"
runcommand('echo "export testresult=0" >> $BASH_ENV')
testresult = 0
for testname in testlist:

    print("-------------------------------", testname , "-------------------------------");
    
    test = testlist[testname]
    testarguments = ' -only-testing:' + testname
    #create skipping tests parameters 
    skipingtests = ""
    if 'excludetests' in test:
        for skipingtest in test['excludetests']:
            skipingtests += ' -skip-testing:' + testname+ "/" + skipingtest
        print("excludetests:", skipingtests)
    exit_code = runtest(testarguments + skipingtests, projectPath, schemeName, projectName, destination, derivedDataPath)
    print(testname, "exit code:", exit_code)
    # if test fails, check if the failed tests can be retried
    if exit_code == 65:
        retriabletimes = 3 ;
        if 'retriabletimes' in test:
            retriabletimes = test['retriabletimes']
        if retriabletimes > 1:
            #get all failed test cases
            faileds = getfailedcases()
            if len(faileds) == 0 :
                print("test command return an error code, but the failed test cases is 0")
                print("exit code:", exit_code)
                break;
            print("failed tests:",faileds)
            retrytimes = 1
            print('retriabletimes:', retriabletimes)
            while retrytimes <= retriabletimes  and exit_code > 0:
                print("retry ", testname, "for ", retrytimes, " times")
                testarguments = ""
                for failed in faileds:
                    testarguments += ' -only-testing:' + failed
                retrytimes += 1
                exit_code = runtest(testarguments,projectPath, schemeName, projectName, destination, derivedDataPath);
                print("retry exit code:", exit_code)                
                if(exit_code != 0 ):
                    faileds = getfailedcases()

    if exit_code != 0 :
        print("exit code:", exit_code)
        runcommand('mkdir -p {0}/{1}'.format(test_result_folder,testname))
        runcommand('echo "{2}" >> {0}/{1}/exitcode.log'.format(test_result_folder,testname,exit_code))
        runcommand('mv raw.log {0}/{1}/raw.log'.format(test_result_folder,testname))
        runcommand('mv xcpretty.log {0}/{1}/xcpretty.log'.format(test_result_folder,testname))
        runcommand('cp build/reports/junit.xml {0}/{1}/junit.xml'.format(test_result_folder,testname))
        ignorefailure = False ; 
        if exit_code == 65 :
            failedtests = getfailedcases(False) 
            print("failedtests:", failedtests)              
            if 'ignoreFailures' in test and failedtests :
                ignoreFailures = set(test['ignoreFailures'])       
                if failedtests.issubset(ignoreFailures):
                    print("There are failed testcases that can be ignored")
                    ignorefailure = True; 
                else :
                    print("Failed testcases that cannot be ignored: ", failedtests - ignoreFailures )     
        if not ignorefailure: 
            print("There are faillures in the test")
            testresult = 1
            
    else:
        print("Test succeed")
 
print("testresult:", testresult)
runcommand('echo "export testresult={0}" >> $BASH_ENV'.format(testresult))  

