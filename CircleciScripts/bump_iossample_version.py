import sys

from functions import replace_files

root = sys.argv[1]
newsdkversion = sys.argv[2]


replaces = [
    {
        "match": r"(pod[[:space:]]+'AWS.+'[[:space:]]*,[[:space:]]*'~>[[:space:]]*)[0-9]+\.[0-9]+\.[0-9]+'",  # noqa: E501
        "replace": r"\1[version]'",
        "files": [
            "CognitoAuth-Sample/Objective-C/Podfile",
            "CognitoAuth-Sample/Swift/Podfile",
            "CognitoYourUserPools-Sample/Objective-C/Podfile",
            "CognitoYourUserPools-Sample/Swift/Podfile",
            "IoT-Sample/Swift/Podfile",
            "Lex-Sample/ObjC/Podfile",
            "Lex-Sample/Swift/Podfile",
            "Polly-Sample/Swift/Podfile",
            "S3TransferUtility-Sample/Objective-C/Podfile",
            "S3TransferUtility-Sample/Swift/Podfile",
        ],
    },
    {
        "match": r"(awsVersion[[:space:]]*=[[:space:]]*'~>[[:space:]]*)[0-9]+\.[0-9]+\.[0-9]+'",
        "replace": r"\1[version]'",
        "files": [
            "CognitoAuth-Sample/Objective-C/Podfile",
            "CognitoAuth-Sample/Swift/Podfile",
            "CognitoYourUserPools-Sample/Objective-C/Podfile",
            "CognitoYourUserPools-Sample/Swift/Podfile",
            "IoT-Sample/Swift/Podfile",
            "Lex-Sample/ObjC/Podfile",
            "Lex-Sample/Swift/Podfile",
            "Polly-Sample/Swift/Podfile",
            "S3TransferUtility-Sample/Objective-C/Podfile",
            "S3TransferUtility-Sample/Swift/Podfile",
        ],
    },
]
for replaceaction in replaces:
    replaceaction["replace"] = replaceaction["replace"].replace("[version]", newsdkversion)
replace_files(root, *replaces)
