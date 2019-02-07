from functions import replacefiles
import sys
import os

root = sys.argv[1]
newsdkversion = sys.argv[2]


replaces = [
    {
        "exclude" :"AWSAppSync",
        "enclosemark" : "double",
        "match" : r"(pod[[:space:]]+'AWS.+'[[:space:]]*,[[:space:]]*'~>[[:space:]]*)[0-9]+\.[0-9]+\.[0-9]+'", 
        "replace" : r"\1[version]'",
        "files" : [
            "analytics.md",
            "api.md",
            "authentication.md",
            "how-to-cognito-integrate-an-existing-identity-pool-ios.md",    
            "manualsetup.md",
            "pubsub.md",
            "push-notifications.md",    
            "start.md",
            "storage.md"
        ]       
    },

    {
        "enclosemark" : "double",
        "match" : r"(so for version )[0-9]+\.[0-9]+\.[0-9]+(, the filename is `aws-ios-sdk-)[0-9]+\.[0-9]+\.[0-9]+", 
        "replace" : r"\1[version]\2[version]",
        "files" : [
            "manualsetup.md"
        ]       
    },


    {
        "enclosemark" : "double",
        "match" : r"(Replace )[0-9]+\.[0-9]+\.[0-9]+() in the preceding example with the version number}", 
        "replace" : r"\1[version]\2",
        "files" : [
            "manualsetup.md"
        ]       
    },

]
for replaceaction in replaces:
    replaceaction["replace"] = replaceaction["replace"].replace("[version]", newsdkversion)
replacefiles(root, replaces)
