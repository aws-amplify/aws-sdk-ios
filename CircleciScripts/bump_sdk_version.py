from functions import replacefiles
import sys
import os
import glob
from lxml import etree
def bump_plist(filename, newsdkversion):
    tree = etree.parse(filename)
    root = tree.getroot()
    namespaces = root.nsmap
    dictnode = root.find("./dict", namespaces)
    setversion = False
    for child in dictnode:
        if child.tag == 'key' and child.text == 'CFBundleShortVersionString':
            setversion = True
        else:
            if setversion:
                print("old version:", child.text)
                child.text=newsdkversion
                break
    tree.write(filename)


root = sys.argv[1]
newsdkversion = sys.argv[2]
modulelist = [
    "AWSAPIGateway",
    "AWSAutoScaling",
    "AWSCloudWatch",
    "AWSCognito",
    "AWSCognitoAuth",
    "AWSCognitoIdentityProvider",
    "AWSComprehend",
    "AWSCore",
    "AWSDynamoDB",
    "AWSEC2",
    "AWSElasticLoadBalancing",
    "AWSIoT",
    "AWSKMS",
    "AWSKinesis",
    "AWSKinesisVideo",
    "AWSKinesisVideoArchivedMedia",
    "AWSLambda",
    "AWSLex",
    "AWSLogs",
    "AWSMachineLearning",
    "AWSMobileAnalytics",
    "AWSPinpoint",
    "AWSPolly",
    "AWSRekognition",
    "AWSS3",
    "AWSSES",
    "AWSSNS",
    "AWSSQS",
    "AWSSimpleDB",
    "AWSTranscribe",
    "AWSTranslate",
    'AWSAutoScaling',
    'AWSAuthSDK/Sources/AWSAuthCore',
    'AWSAuthSDK/Sources/AWSFacebookSignIn',
    'AWSAuthSDK/Sources/AWSGoogleSignIn',
    'AWSAuthSDK/Sources/AWSMobileClient',
    'AWSAuthSDK/Sources/AWSUserPoolsSignIn'
]

for module in modulelist:
    filename = os.path.join(root, module, "Info.plist")
    bump_plist(filename,newsdkversion)

podspec_pattern1 = {
    "enclosemark" : "double",
    'exclude':'AWSCognitoIdentityProviderASF',
    "match" : r"(dependency[[:space:]]+'AWS.+'[[:space:]]*,[[:space:]]*')[0-9]+\.[0-9]+\.[0-9]+(')", 
    "replace" : r"\1[version]\2",
    "files" : []       
}

podspec_pattern2 = {
    "enclosemark" : "double",
    'exclude':'AWSCognitoIdentityProviderASF',
    "match" : r"(s\.version[[:space:]]+=[[:space:]]*')[0-9]+\.[0-9]+\.[0-9]+(')", 
    "replace" : r"\1[version]\2",
    "files" : []       
}


for file in glob.glob(os.path.join(root,"*.podspec")):
    if (file.endswith('AWSCognitoIdentityProviderASF.podspec')):
        continue
    podspec_pattern1["files"].append(file)
    podspec_pattern2["files"].append(file)

service_pattern = {
        "match" : r'(NSString[[:space:]]+\*const[[:space:]]+AWS.+SDKVersion[[:space:]]*=[[:space:]]+@")[0-9]+\.[0-9]+\.[0-9]+"', 
        "replace" : r'\1[version]"',
        "files" : []
}

#add file for each module 
for module in modulelist:
    filepath = "{0}/{0}Service.m".format(module)
    if os.path.isfile(os.path.join(root, filepath)):
        print("add service pattern file", filepath)
        service_pattern["files"].append(filepath)
#add file for special module
service_pattern["files"].append("AWSCognito/CognitoSync/AWSCognitoSyncService.m")
service_pattern["files"].append("AWSCognitoIdentityProvider/CognitoIdentityProvider/AWSCognitoIdentityProviderService.m")
service_pattern["files"].append("AWSCore/Service/AWSService.m")
service_pattern["files"].append("AWSIoT/AWSIoTDataService.m")
service_pattern["files"].append("AWSKinesis/AWSFirehoseService.m")
service_pattern["files"].append("AWSLex/AWSLexInteractionKit.m")
service_pattern["files"].append("AWSPolly/AWSPollySynthesizeSpeechURLBuilder.m")
service_pattern["files"].append("AWSS3/AWSS3PreSignedURL.m")
service_pattern["files"].append("AWSAPIGateway/AWSAPIGatewayClient.m")
service_pattern["files"].append("AWSCognitoAuth/AWSCognitoAuth.m")
service_pattern["files"].append("AWSMobileAnalytics/AWSMobileAnalyticsERS/AWSMobileAnalyticsERSService.m")
service_pattern["files"].append("AWSPinpoint/AWSPinpointTargeting/AWSPinpointTargetingService.m")

# service_pattern["files"].append("")
# service_pattern["files"].append("")


replaces = [
    {
        # "enclosemark" : "double",
        "match" : r'VERSION="[0-9]+\.[0-9]+\.[0-9]+"', 
        "replace" : r'VERSION="[version]"',
        "files" : [
            'Scripts/GenerateAppleDocs.sh'
        ]
    }
]
replaces.append(podspec_pattern1)
replaces.append(podspec_pattern2)
replaces.append(service_pattern)
for replaceaction in replaces:
    replaceaction["replace"] = replaceaction["replace"].replace("[version]", newsdkversion)
replacefiles(root, replaces)