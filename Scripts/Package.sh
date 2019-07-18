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

if [ -f "Scripts/SdkPackage.sh" ]; then
    chmod +x Scripts/SdkPackage.sh
    Scripts/SdkPackage.sh   AWSCore
    Scripts/SdkPackage.sh   AWSLex
    Scripts/SdkPackage.sh   AWSLambda
    Scripts/SdkPackage.sh   AWSLogs
    Scripts/SdkPackage.sh   AWSMachineLearning
    Scripts/SdkPackage.sh   AWSMobileAnalytics
    Scripts/SdkPackage.sh   AWSPinpoint
    Scripts/SdkPackage.sh   AWSPolly
    Scripts/SdkPackage.sh   AWSRekognition
    Scripts/SdkPackage.sh   AWSS3
    Scripts/SdkPackage.sh   AWSSES
    Scripts/SdkPackage.sh   AWSSNS
    Scripts/SdkPackage.sh   AWSSQS
    Scripts/SdkPackage.sh   AWSSimpleDB
    Scripts/SdkPackage.sh   AWSTranscribe
    Scripts/SdkPackage.sh   AWSTranslate
        
    Scripts/SdkPackage.sh   AWSAuthCore "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
    Scripts/SdkPackage.sh   AWSAuthUI   "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
    Scripts/SdkPackage.sh   AWSFacebookSignIn   "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
    Scripts/SdkPackage.sh   AWSGoogleSignIn "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
    Scripts/SdkPackage.sh   AWSMobileClient "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"
    Scripts/SdkPackage.sh   AWSUserPoolsSignIn  "$(pwd)/AWSAuthSDK/AWSAuthSDK.xcodeproj"   

    Scripts/SdkPackage.sh   AWSAPIGateway
    Scripts/SdkPackage.sh   AWSAutoScaling
    Scripts/SdkPackage.sh   AWSCloudWatch
    Scripts/SdkPackage.sh   AWSCognito
    Scripts/SdkPackage.sh   AWSCognitoAuth
    Scripts/SdkPackage.sh   AWSCognitoIdentityProvider
    Scripts/SdkPackage.sh   AWSCognitoIdentityProviderASF
    Scripts/SdkPackage.sh   AWSComprehend
    Scripts/SdkPackage.sh   AWSDynamoDB
    Scripts/SdkPackage.sh   AWSEC2
    Scripts/SdkPackage.sh   AWSElasticLoadBalancing
    Scripts/SdkPackage.sh   AWSIoT
    Scripts/SdkPackage.sh   AWSKMS
    Scripts/SdkPackage.sh   AWSKinesis
    Scripts/SdkPackage.sh   AWSKinesisVideo
    Scripts/SdkPackage.sh   AWSKinesisVideoArchivedMedia

else 
    echo "$(pwd)"
    echo "Did not find Scripts/SdkPackage.sh"
    exit 1
fi
