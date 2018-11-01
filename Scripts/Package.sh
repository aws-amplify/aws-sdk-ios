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
echo "step 1"
echo "ddd"
# clean
if [ -n $1 ] && [ "$1" == "clean" ];
then
	rm -rf builtFramework
	echo "Cleaning Completed"
	exit 0
fi
echo "step 2"
echo $PWD
set -u
exit 0

#if [ -x "Scripts/SdkPackage.sh" ]; then
    echo "step 3"
    bash Scripts/SdkPackage.sh AWSCore
    bash Scripts/SdkPackage.sh AWSAutoScaling
    bash Scripts/SdkPackage.sh AWSCognito
    bash Scripts/SdkPackage.sh AWSCognitoIdentityProvider
    bash Scripts/SdkPackage.sh AWSCognitoIdentityProviderASF
    bash Scripts/SdkPackage.sh AWSCognitoAuth
    bash Scripts/SdkPackage.sh AWSCloudWatch
    bash Scripts/SdkPackage.sh AWSDeepSense
    bash Scripts/SdkPackage.sh AWSDynamoDB
    bash Scripts/SdkPackage.sh AWSEC2
    bash Scripts/SdkPackage.sh AWSElasticLoadBalancing
    bash Scripts/SdkPackage.sh AWSIoT
    bash Scripts/SdkPackage.sh AWSKinesis
    bash Scripts/SdkPackage.sh AWSKMS
    bash Scripts/SdkPackage.sh AWSLambda
    bash Scripts/SdkPackage.sh AWSLogs
    bash Scripts/SdkPackage.sh AWSMachineLearning
    bash Scripts/SdkPackage.sh AWSMobileAnalytics
    bash Scripts/SdkPackage.sh AWSPinpoint
    bash Scripts/SdkPackage.sh AWSS3
    bash Scripts/SdkPackage.sh AWSSES
    bash Scripts/SdkPackage.sh AWSSimpleDB
    bash Scripts/SdkPackage.sh AWSSNS
    bash Scripts/SdkPackage.sh AWSSQS
#fi
