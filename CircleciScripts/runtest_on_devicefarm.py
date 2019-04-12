import os 
import sys
from functions import *
import glob
import boto3
import datetime
import time
import demjson
from collections import namedtuple
from send_email import *


def create_host_app(derivedDataPath, hostAppName, ipaPath):
    targetPath = os.path.dirname(ipaPath)
    temp = os.path.join(targetPath, "temp")
    payloadPath =  os.path.join(temp, "Payload")    
    if 0 != runcommand("mkdir -p '{0}'".format(payloadPath)):
        print("Failed to create payload path.", payloadPath)
    product = os.path.join(derivedDataPath, "Build/Products/Debug-iphoneos")

    # plugins = os.path.join(product, hostAppName, "PlugIns")

    # testlist = list(map( lambda file:(os.path.splitext(os.path.basename(file))[0]),  glob.glob("{0}/*.xctest".format(plugins))))
    # # testlist = "{0}/*..xctest".format(plugins)
    # print(testlist)
    # return 0 


    if 0 != runcommand("cp -R '{product}/{hostapp}' {destination} ".format(product = product, hostapp = hostAppName, destination = payloadPath)):
        print( "Failed to copy host app" )
        return 1

    frameworklist = glob.glob("{0}/*.framework".format(product))
    print("frameworklist:" , frameworklist)
    for framework in frameworklist:
        path, filename = os.path.split(framework)
        targetpath = os.path.join(payloadPath, hostAppName, "Frameworks", filename)
        if not os.path.exists(targetpath) :
            if 0 != runcommand("cp -R '{0}/' '{1}'".format(framework, targetpath)):
                print("Failed to copy framework. ", framework)
                return 1
    if 0 != runcommand("zip -r  '{0}' .".format(ipaPath), workingdirectory = temp):
        print("failed to zip payload folder")
        return 1
    return 0

def upload(filepath, type):
    path, filename = os.path.split(filepath)
    # create an upload for the test module
    response = devicefarm_client.create_upload(
        projectArn = project_arn,
        name= filename,
        type= type
    )
    uploadarn =  response['upload']['arn']
    status = response['upload']['status']
    if status != 'INITIALIZED':
        print("Failed to create upload")
        return None

    uploadurl = response['upload']['url']
    #upload the test module
    uploadcommand = 'curl -T "{0}"  "{1}"'.format(filepath, uploadurl)  
    rn = runcommand(uploadcommand)
    if rn != 0 :
        print("Failed to run curl upload:", filepath)
        return None

    while  status != 'SUCCEEDED' and status != 'FAILED' :   
        print("upload status:", status)
        time.sleep(5)
        response = devicefarm_client.get_upload(arn = uploadarn)
        status = response['upload']['status']
    if status == 'FAILED':
        print(response)
        print("Failed to upload test apk for ", test)
        return None;
    return uploadarn

def runtest(project, scheme, test, hostApp, sdkfolder, filters):    
    print("################################### {0} ###################################".format(test))
    derivedDataPath = os.path.join(sdkfolder, "build_result", test)
    runcommand("rm -rf '{0}'".format(derivedDataPath))
    if 0 != runcommand('xcodebuild clean build-for-testing  -project {project} -scheme {scheme}    CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -derivedDataPath "{derivedDataPath}"'.format(project = project, scheme = scheme, derivedDataPath = derivedDataPath)) :
        print("Failed to build project.", project)
        return 1
    ipaPath = "{base}/{test}.ipa".format(base = derivedDataPath, test = test)

    if 0 != create_host_app(derivedDataPath , hostApp, ipaPath):
        print("Failed to create ipa for current test.", test)
        return 1

    ipaArn = upload(ipaPath , 'IOS_APP')

    if ipaArn is None:
        return 1

    product = os.path.join(derivedDataPath, "Build/Products/Debug-iphoneos")
    plugins = os.path.join(product, hostApp, "PlugIns")
    xctestpath = os.path.join(plugins, "{0}.xctest".format(test))
    xctesttemp = os.path.join(derivedDataPath, "xctesttemp")
    runcommand("rm -rf '{0}'".format(xctesttemp))
    runcommand("mkdir -p '{0}'".format(xctesttemp))
    if 0 != runcommand("cp -R '{0}' '{1}'".format(xctestpath, xctesttemp)):
        print("Failed to copy xctest")
        return 1
    xctestzip = "{base}/{test}.xctest.zip".format(base = derivedDataPath, test = test)

    if 0 != runcommand("zip -r  '{0}' .".format(xctestzip), workingdirectory = xctesttemp):
        print("failed to zip xctest")
        return 1

    packageArn = upload(xctestzip, "XCTEST_TEST_PACKAGE")
    if packageArn is None:
        return 1

    #schedule an run for the test module
    if filters is None:
        response = devicefarm_client.schedule_run(
            projectArn = project_arn,
            appArn = ipaArn,
            devicePoolArn= devicepool_arn,
            name='{0}-{1}'.format(test, tag),
            test={
                'type': 'XCTEST',
                'testPackageArn': packageArn,
                # 'testSpecArn': testspec_arn
            }
        )
        print(response['run']['status'], response['run']['result']) 
    else:
        for testfilter in filters:
            response = devicefarm_client.schedule_run(
                projectArn = project_arn,
                appArn = ipaArn,
                devicePoolArn= devicepool_arn,
                name='{0}-{1}'.format(testfilter['name'], tag),
                test={
                    'type': 'XCTEST',
                    'testPackageArn': packageArn,
                    'filter' : testfilter['filter'],
                    # 'testSpecArn': testspec_arn
                }
            )
            print(response['run']['status'], response['run']['result'])            


    
    return 0

def cleanup_olduploads():
    # clean up old uploads
    response = devicefarm_client.list_uploads(arn = project_arn, type = 'INSTRUMENTATION_TEST_PACKAGE')
    while True:   
        now  = datetime.datetime.now()
        for upload in response['uploads']:

            createdtdays= (now - upload['created'].replace(tzinfo=None)).days
            status = upload['status']
            name = upload['name']
            if (createdtdays >= keepoldrundays or status != 'SUCCEEDED') and name.startswith("AWS") :
                print("delete old upload:", name)
                arn = upload['arn']
                devicefarm_client.delete_upload(arn = arn)
        if 'nextToken' in response:
            nextToken = response['nextToken']
            response = devicefarm_client.list_uploads(arn = project_arn, type = 'INSTRUMENTATION_TEST_PACKAGE', nextToken = nextToken)
        else:
            break;
def cleanup_oldruns():
    #clean up old runs
    response = devicefarm_client.list_runs(arn = project_arn)
    while True: 
        now  = datetime.datetime.now()
        for run in response['runs']:
            name = run['name']
            createdtdays = (now - run['created'].replace(tzinfo=None)).days
            status = run['status']
            if  createdtdays >= keepoldrundays  and status != "PENDING" and status != 'RUNNING':
                print("delete old run:", name)
                arn = run['arn']
                devicefarm_client.delete_run(arn = arn)       
        if 'nextToken' in response:
            nextToken = response['nextToken']
            response = devicefarm_client.list_runs(arn = project_arn, nextToken = nextToken)
        else:
            break;



sdkfolder =sys.argv[1]
configurefile = sys.argv[2]
lastcommit = sys.argv[3]
tag = lastcommit[:10]

with open(configurefile, 'r') as jsonfile:
    jsonstring = jsonfile.read()
configure =  demjson.decode(jsonstring)

keepoldrundays = configure['keepoldrundays']
project_arn = configure['project_arn']
devicepool_arn = configure['devicepool_arn']
projectlist = configure['projectlist']
devicefarm_client = boto3.client('devicefarm', region_name='us-west-2')

cleanup_olduploads()
cleanup_oldruns()

faiedtestlist = []
for project in projectlist:
    projectpath = project["path"]
    testlist = project["testlist"]
    hostAppName =  project["hostAppName"]
    for test in testlist:
        scheme = test["scheme"]
        if "testname" in test:
            testname = test["testname"]
        else:
            testname = scheme +"Tests"
        filters = None
        if "filters" in test:
            filters = test["filters"]

        if 0 != runtest(projectpath , scheme, testname, hostAppName, sdkfolder, filters):
            print("Failed to run {0} on device farm".format(testname))
            faiedtestlist.append(testname)



if len (faiedtestlist) > 0 :
    joblink = r"https://circleci.com/gh/{0}/{1}/{2}".format(os.environ.get('CIRCLE_PROJECT_USERNAME'), os.environ.get('CIRCLE_PROJECT_REPONAME'), os.environ.get('CIRCLE_BUILD_NUM'))
    content = "Failed tests: " + "," .join(faiedtestlist)   
    print(content)
    title = "Alarm!!! Faied to run iOS SDK Integration test on device farm"
    response = send_email(title, content , fromaddress = configure['email_from'], toaddresses = configure['alarm_email_to'] )
    print(response)









