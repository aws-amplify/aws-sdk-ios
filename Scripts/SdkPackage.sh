#!/bin/sh
set -u

# Helper function to exit on nonzero code
function exitOnFailureCode() {
    if [ $1 -ne 0 ]
    then
    	echo "Error occurred, abort"
        exit $1
    fi
}

#############################################
#############################################

if [ $# -eq 0 ]
  then
    echo "No argument supplied, need to specified the name of the project. e.g. Sdkpackage.sh S3"
    exit 1
fi

project_name=$1
#set the project_path if $2 exists, if not, assign it to "."
project_path=${2-.}
echo "Project name: ${project_name}, Project Path: ${project_path}"

# Define these to suit your nefarious purposes
CURR_DIR=$(PWD)
FRAMEWORK_NAME="${project_name}"
FRAMEWORK_VERSION=A


# Where we'll put the build framework.
# The script presumes we're in the project root
# directory. Xcode builds in "build" by default
FRAMEWORK_BUILD_PATH="builtFramework/framework"


# Clean any existing framework that might be there
# already
echo "Framework: Cleaning framework..."
if [ -d "$FRAMEWORK_BUILD_PATH" ]
then
	rm -rf "$FRAMEWORK_BUILD_PATH/$FRAMEWORK_NAME.framework"
fi

# Build .a files
xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" \
	ONLY_ACTIVE_ARCH=NO \
	-configuration Debug \
    -project "${project_path}/AWSiOSSDKv2.xcodeproj" \
    -target "${project_name}" \
    -sdk iphonesimulator \
    SYMROOT=$(PWD)/builtFramework \
    clean build

exitOnFailureCode $?

xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" \
	ONLY_ACTIVE_ARCH=NO \
	-configuration Release \
    -project "${project_path}/AWSiOSSDKv2.xcodeproj" \
    -target "${project_name}" \
    -sdk iphoneos \
    SYMROOT=$(PWD)/builtFramework \
    clean build

exitOnFailureCode $?

# This is the full name of the framework we'll
# build
FRAMEWORK_DIR=$FRAMEWORK_BUILD_PATH/$FRAMEWORK_NAME.framework

# clean up old framework directory if exists
mkdir -p $FRAMEWORK_DIR
rm -rf $FRAMEWORK_DIR
cp -aR "builtFramework/Release-iphoneos/${project_name}.framework" "$FRAMEWORK_DIR"

# The trick for creating a fully usable library is
# to use lipo to glue the different library
# versions together into one file. When an
# application is linked to this library, the
# linker will extract the appropriate platform
# version and use that.
# The library file is given the same name as the
# framework with no .a extension.
echo "Framework: Creating library..."
lipo -create \
    "builtFramework/Debug-iphonesimulator/${project_name}.framework/${project_name}" \
    "builtFramework/Release-iphoneos/${project_name}.framework/${project_name}" \
    -o "$FRAMEWORK_DIR/${project_name}"

exitOnFailureCode $?
