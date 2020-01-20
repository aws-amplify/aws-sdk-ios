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

rm -rf  builtFramework
set -u

if [ -f "CircleciScripts/package_sdk.sh" ]; then
    chmod +x CircleciScripts/package_sdk.sh
    CircleciScripts/package_sdk.sh AWSAPIGateway
    CircleciScripts/package_sdk.sh AWSAutoScaling
    CircleciScripts/package_sdk.sh AWSCloudWatch
    CircleciScripts/package_sdk.sh AWSCognito
    CircleciScripts/package_sdk.sh AWSCognitoAuth
    CircleciScripts/package_sdk.sh AWSCognitoIdentityProvider
    CircleciScripts/package_sdk.sh AWSCognitoIdentityProviderASF
    CircleciScripts/package_sdk.sh AWSComprehend
    CircleciScripts/package_sdk.sh AWSConnect
    CircleciScripts/package_sdk.sh AWSConnectParticipant
    CircleciScripts/package_sdk.sh AWSCore
    CircleciScripts/package_sdk.sh AWSDynamoDB
    CircleciScripts/package_sdk.sh AWSEC2
    CircleciScripts/package_sdk.sh AWSElasticLoadBalancing
    CircleciScripts/package_sdk.sh AWSIoT
    CircleciScripts/package_sdk.sh AWSKMS
    CircleciScripts/package_sdk.sh AWSKinesis
    CircleciScripts/package_sdk.sh AWSKinesisVideo
    CircleciScripts/package_sdk.sh AWSKinesisVideoArchivedMedia
    CircleciScripts/package_sdk.sh AWSKinesisVideoSignaling
    CircleciScripts/package_sdk.sh AWSLambda
    CircleciScripts/package_sdk.sh AWSLex
    CircleciScripts/package_sdk.sh AWSLogs
    CircleciScripts/package_sdk.sh AWSMachineLearning
    CircleciScripts/package_sdk.sh AWSMobileAnalytics
    CircleciScripts/package_sdk.sh AWSPinpoint
    CircleciScripts/package_sdk.sh AWSPolly
    CircleciScripts/package_sdk.sh AWSRekognition
    CircleciScripts/package_sdk.sh AWSS3
    CircleciScripts/package_sdk.sh AWSSES
    CircleciScripts/package_sdk.sh AWSSNS
    CircleciScripts/package_sdk.sh AWSSQS
    CircleciScripts/package_sdk.sh AWSSageMakerRuntime
    CircleciScripts/package_sdk.sh AWSSimpleDB
    CircleciScripts/package_sdk.sh AWSTextract
    CircleciScripts/package_sdk.sh AWSTranscribe
    CircleciScripts/package_sdk.sh AWSTranscribeStreaming
    CircleciScripts/package_sdk.sh AWSTranslate

    CircleciScripts/package_sdk.sh AWSAuthCore "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
    CircleciScripts/package_sdk.sh AWSAuthUI "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
    CircleciScripts/package_sdk.sh AWSFacebookSignIn "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
    CircleciScripts/package_sdk.sh AWSGoogleSignIn "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
    CircleciScripts/package_sdk.sh AWSMobileClient "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
    CircleciScripts/package_sdk.sh AWSUserPoolsSignIn "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
else
    echo "$(pwd)"
    echo "Did not find CircleciScripts/package_sdk.sh"
    exit 1
fi
