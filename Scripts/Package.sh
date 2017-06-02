#!/bin/sh
set -e
# Helper function to exit on nonzero code
function exitOnFailureCode() {
    if [ $1 -ne 0 ]
    then
    	echo "Error occurred, abort"
    	git checkout .
        exit $1
    fi
}

# clean
if [ -n $1 ] && [ "$1" == "clean" ];
then
	rm -rf builtFramework
	echo "Cleaning Completed"
	exit 0
fi

set -u

if [ -x "Scripts/SdkPackage.sh" ]; then
    Scripts/SdkPackage.sh AWSCore
    Scripts/SdkPackage.sh AWSAutoScaling
    Scripts/SdkPackage.sh AWSCognito
    Scripts/SdkPackage.sh AWSCognitoIdentityProvider
    Scripts/SdkPackage.sh AWSCognitoAuth
    Scripts/SdkPackage.sh AWSCloudWatch
    Scripts/SdkPackage.sh AWSDeepSense
    Scripts/SdkPackage.sh AWSDynamoDB
    Scripts/SdkPackage.sh AWSEC2
    Scripts/SdkPackage.sh AWSElasticLoadBalancing
    Scripts/SdkPackage.sh AWSIoT
    Scripts/SdkPackage.sh AWSKinesis
    Scripts/SdkPackage.sh AWSKMS
    Scripts/SdkPackage.sh AWSLambda
    Scripts/SdkPackage.sh AWSLogs
    Scripts/SdkPackage.sh AWSMachineLearning
    Scripts/SdkPackage.sh AWSMobileAnalytics
    Scripts/SdkPackage.sh AWSPinpoint
    Scripts/SdkPackage.sh AWSS3
    Scripts/SdkPackage.sh AWSSES
    Scripts/SdkPackage.sh AWSSimpleDB
    Scripts/SdkPackage.sh AWSSNS
    Scripts/SdkPackage.sh AWSSQS
fi
