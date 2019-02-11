from functions import replacefiles
import sys
import os

root = sys.argv[1]
newsdkversion = sys.argv[2]


replaces = [
    {
        "enclosemark" : "double",
        "match" : r"(pod[[:space:]]+'AWS.+'[[:space:]]*,[[:space:]]*'~>[[:space:]]*)[0-9]+\.[0-9]+\.[0-9]+'", 
        "replace" : r"\1[version]'",
        "files" : [
            "CognitoAuth-Sample/Objective-C/Podfile",
            "CognitoAuth-Sample/Swift/Podfile",
            "CognitoYourUserPools-Sample/Objective-C/Podfile",
            "CognitoYourUserPools-Sample/Swift/Podfile",
            "IoT-Sample/Swift/Podfile",
            "Lex-Sample/ObjC/Podfile",
            "Lex-Sample/swift-3/Podfile",
            "Polly-Sample/Swift/Podfile",
            "S3TransferUtility-Sample/Objective-C/Podfile",
            "S3TransferUtility-Sample/Swift/Podfile"
        ]       
    },

    {
        "enclosemark" : "double",
        "match" : r"(awsVersion[[:space:]]*=[[:space:]]*'~>[[:space:]]*)[0-9]+\.[0-9]+\.[0-9]+'", 
        "replace" : r"\1[version]'",
        "files" : [
            "CognitoAuth-Sample/Objective-C/Podfile",
            "CognitoAuth-Sample/Swift/Podfile",
            "CognitoYourUserPools-Sample/Objective-C/Podfile",
            "CognitoYourUserPools-Sample/Swift/Podfile",
            "IoT-Sample/Swift/Podfile",
            "Lex-Sample/ObjC/Podfile",
            "Lex-Sample/swift-3/Podfile",
            "Polly-Sample/Swift/Podfile",
            "S3TransferUtility-Sample/Objective-C/Podfile",
            "S3TransferUtility-Sample/Swift/Podfile"
        ]       
    }
]
for replaceaction in replaces:
    replaceaction["replace"] = replaceaction["replace"].replace("[version]", newsdkversion)
replacefiles(root, replaces)
