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
	rm -rf build
	echo "Cleaning Completed"
	exit 0
fi

set -u

if [ -e "Scripts/objc-fix.patch" ]; then
	echo "Applying a patch"
	patch -p1 < Scripts/objc-fix.patch
fi

if [ -x "Scripts/SdkPackage.sh" ]; then

    Scripts/SdkPackage.sh AWSCore
    Scripts/SdkPackage.sh AWSAutoScaling
    Scripts/SdkPackage.sh AWSCloudWatch
    Scripts/SdkPackage.sh AWSDynamoDB
    Scripts/SdkPackage.sh AWSEC2
    Scripts/SdkPackage.sh AWSElasticLoadBalancing
    Scripts/SdkPackage.sh AWSKinesis
    Scripts/SdkPackage.sh AWSS3
    Scripts/SdkPackage.sh AWSSES
    Scripts/SdkPackage.sh AWSSimpleDB
    Scripts/SdkPackage.sh AWSSNS
    Scripts/SdkPackage.sh AWSSQS

fi

if [ -x "Scripts/PodFramework.sh" ]; then

	xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" \
	ONLY_ACTIVE_ARCH=NO \
	-configuration Debug \
	-project "Pods/Pods.xcodeproj" \
	-target "Pods" \
	-sdk iphonesimulator \
	SYMROOT=$(PWD)/build \
	clean build

	xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" \
	ONLY_ACTIVE_ARCH=NO \
	-configuration Release \
	-project "Pods/Pods.xcodeproj" \
	-target "Pods" \
	-sdk iphoneos \
	SYMROOT=$(PWD)/build \
	clean build

	Scripts/PodFramework.sh Bolts
	Scripts/PodFramework.sh Mantle
	Scripts/PodFramework.sh TMCache
	Scripts/PodFramework.sh XMLDictionary
	Scripts/PodFramework.sh UICKeyChainStore
	Scripts/PodFramework.sh Reachability
	Scripts/PodFramework.sh GZIP
	Scripts/PodFramework.sh FMDB
fi

git checkout .
