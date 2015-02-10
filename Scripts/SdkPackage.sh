#!/bin/sh

#==================== build AWSiOSSDK framework ====================#
xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" ONLY_ACTIVE_ARCH=NO -configuration Debug -project "Pods/Pods.xcodeproj" -target "Pods" -sdk iphonesimulator SYMROOT=$(PWD)/build clean build
xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" ONLY_ACTIVE_ARCH=NO -configuration Release -project "Pods/Pods.xcodeproj" -target "Pods" -sdk iphoneos SYMROOT=$(PWD)/build clean build

# Remove libPods.a from linked libraries
sed -i'.bak' '/libPods.a in Frameworks/d' AWSiOSSDKv2.xcodeproj/project.pbxproj

xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" ONLY_ACTIVE_ARCH=NO -configuration Debug -project "AWSiOSSDKv2.xcodeproj" -target "AWSiOSSDKv2" -sdk iphonesimulator SYMROOT=$(PWD)/build clean build
xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" ONLY_ACTIVE_ARCH=NO -configuration Release -project "AWSiOSSDKv2.xcodeproj" -target "AWSiOSSDKv2" -sdk iphoneos SYMROOT=$(PWD)/build clean build

# Add libPods.a back to linked libraries
mv AWSiOSSDKv2.xcodeproj/project.pbxproj.bak AWSiOSSDKv2.xcodeproj/project.pbxproj

#====================================================================#
CURR_DIR=$(PWD)

FRAMEWORK_NAME=AWSiOSSDKv2
FRAMEWORK_VERSION=A

# build path
FRAMEWORK_BUILD_PATH="build/frameworks"

echo "Framework: Cleaning framework..."
if [ -d "$FRAMEWORK_BUILD_PATH" ]
then
	rm -rf "$FRAMEWORK_BUILD_PATH/${FRAMEWORK_NAME}.framework"
fi

# This is the full name of the framework 
FRAMEWORK_DIR=$FRAMEWORK_BUILD_PATH/${FRAMEWORK_NAME}.framework

rm -rf $FRAMEWORK_DIR

echo "Framework: Setting up directories..."
mkdir -p $FRAMEWORK_DIR
mkdir -p $FRAMEWORK_DIR/Versions
mkdir -p $FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION
mkdir -p $FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Resources
mkdir -p $FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Headers

echo "Framework: Creating symlinks..."
ln -s $FRAMEWORK_VERSION $FRAMEWORK_DIR/Versions/Current
ln -s Versions/Current/Headers $FRAMEWORK_DIR/Headers
ln -s Versions/Current/Resources $FRAMEWORK_DIR/Resources
ln -s Versions/Current/$FRAMEWORK_NAME $FRAMEWORK_DIR/$FRAMEWORK_NAME


# The trick for creating a fully usable library is
# to use lipo to glue the different library
# versions together into one file. When an
# application is linked to this library, the
# linker will extract the appropriate platform
# version and use that.
# The library file is given the same name as the
# framework with no .a extension.
echo "Framework: Creating library..."
lipo -create "build/Debug-iphonesimulator/libAWSiOSSDKv2.a" "build/Release-iphoneos/libAWSiOSSDKv2.a" -o "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"

# Now copy headerfile
echo "Framework: Copying assets into current version..."
# cp -a AmazonCore/*.h $FRAMEWORK_DIR/Headers/
# cp -a AmazonCore/Logging/*.h $FRAMEWORK_DIR/Headers/
# cp -a AmazonCore/Networking/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/Utility/*.h $FRAMEWORK_DIR/Headers/

cp -a AWSCore/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/Authentication/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/CognitoIdentity/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/MobileAnalyticsERS/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/MobileAnalytics/AZCommon/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/MobileAnalytics/include/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/MobileAnalytics/include/monetization/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/Networking/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/Serialization/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/Service/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/STS/*.h $FRAMEWORK_DIR/Headers/
cp -a AWSCore/XMLWriter/*.h $FRAMEWORK_DIR/Headers/

cp -a AutoScaling/*.h $FRAMEWORK_DIR/Headers/
cp -a CloudWatch/*.h $FRAMEWORK_DIR/Headers/
cp -a DynamoDB/*.h $FRAMEWORK_DIR/Headers/
cp -a EC2/*.h $FRAMEWORK_DIR/Headers/
cp -a ElasticLoadBalancing/*.h $FRAMEWORK_DIR/Headers/
cp -a Kinesis/*.h $FRAMEWORK_DIR/Headers/
cp -a S3/*.h $FRAMEWORK_DIR/Headers/
cp -a SES/*.h $FRAMEWORK_DIR/Headers/
cp -a SimpleDB/*.h $FRAMEWORK_DIR/Headers/
cp -a SNS/*.h $FRAMEWORK_DIR/Headers/
cp -a SQS/*.h $FRAMEWORK_DIR/Headers/

# copy service definition json files
mkdir -p 'build/service-definitions'
find . -name "*.json" -not -path "./*Tests/*" -not -path './build/*' -exec cp {} 'build/service-definitions/' \;

# correct the way to import framework's header
(cd $FRAMEWORK_DIR/Headers; ${CURR_DIR}/Scripts/SdkHeader.sh)

# validate framework
echo "Framework: Validating..."
isValidate=true

if  grep -qF "BFTask.o" "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"
then
echo "Framework: framework contains Bolts 3rd party libraries"
isValidate=false
fi

if  grep -qF "FMDatabase.o" "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"
then
echo "Framework: framework contains FMDB 3rd party libraries"
isValidate=false
fi

if  grep -qF "GZIP.o" "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"
then
echo "Framework: framework contains GZIP 3rd party libraries"
isValidate=false
fi

if  grep -qF "MTLModel.o" "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"
then
echo "Framework: framework contains Mantle 3rd party libraries"
isValidate=false
fi

if  grep -qF "Reachability.o" "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"
then
echo "Framework: framework contains Reachability 3rd party libraries"
isValidate=false
fi

if  grep -qF "TMCache.o" "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"
then
echo "Framework: framework contains TMCache 3rd party libraries"
isValidate=false
fi

if  grep -qF "UICKeyChainStore.o" "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"
then
echo "Framework: framework contains UICKeyChainStore 3rd party libraries"
isValidate=false
fi

if  grep -qF "XMLDictionary.o" "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"
then
echo "Framework: framework contains XMLDictionary 3rd party libraries"
isValidate=false
fi

if [ "$isValidate" = false ]
then
echo "Framework: Validation Failed, abort."
exit 1
else
echo "Validation Succeed."
fi



