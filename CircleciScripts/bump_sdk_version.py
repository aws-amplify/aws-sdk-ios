from functions import replacefiles
import sys
import os
import glob
import re
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

    plist_string = format_plist(tree)
    plist = open(filename, "w")
    plist.write(plist_string)
    plist.close()

# Adjusts lxml's pretty-printed XML format to match Xcode's default and avoid
# semantically uninteresting diffs
def format_plist(tree):
    plist_string = tree_to_string(tree)

    flags = re.MULTILINE | re.IGNORECASE

    # Prepend XML prolog. This could be partially done with `lxml.tostring`'s
    # xml_declaration option, but that returns single-quoted attributes
    formatted_plist = '<?xml version="1.0" encoding="UTF-8"?>\n' + plist_string

    # Replace self-closing '<string/>' tags with explicitly closed tags
    formatted_plist = re.sub(r'<string/>', '<string></string>', formatted_plist, flags=flags)

    # Adjust lxml's default space-based indentation to Xcode's tab-based. Use the
    # multiline flag and match beginning of each line.
    formatted_plist = re.sub(r'^\s+<', '\t<', formatted_plist, flags=flags)

    return formatted_plist

def tree_to_string(tree):
    plist_bytes = etree.tostring(tree, pretty_print = True, xml_declaration = False, encoding='UTF-8')
    plist_string = plist_bytes.decode('utf-8')
    return plist_string


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
    "AWSConnect",
    "AWSConnectParticipant",
    "AWSCore",
    "AWSDynamoDB",
    "AWSEC2",
    "AWSElasticLoadBalancing",
    "AWSIoT",
    "AWSKMS",
    "AWSKinesis",
    "AWSKinesisVideo",
    "AWSKinesisVideoArchivedMedia",
    "AWSKinesisVideoSignaling",
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
    "AWSSageMakerRuntime",
    "AWSSimpleDB",
    "AWSTextract",
    "AWSTranscribe",
    "AWSTranscribeStreaming",
    "AWSTranslate",
    'AWSAutoScaling',
    'AWSAuthSDK/Sources/AWSAuthCore',
    'AWSAuthSDK/Sources/AWSFacebookSignIn',
    'AWSAuthSDK/Sources/AWSGoogleSignIn',
    'AWSAuthSDK/Sources/AWSMobileClient',
    'AWSAuthSDK/Sources/AWSUserPoolsSignIn',
    'AWSAuthSDK/Sources/AWSAuthUI'
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

replaces = [
    {
        # "enclosemark" : "double",
        "match" : r'VERSION="[0-9]+\.[0-9]+\.[0-9]+"', 
        "replace" : r'VERSION="[version]"',
        "files" : [
            'CircleciScripts/generate_documentation.sh'
        ]
    }
]
replaces.append(podspec_pattern1)
replaces.append(podspec_pattern2)
replaces.append(service_pattern)
for replaceaction in replaces:
    replaceaction["replace"] = replaceaction["replace"].replace("[version]", newsdkversion)
replacefiles(root, replaces)
