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
    -project "${project_name}.xcodeproj" \
    -target "${project_name}" \
    -sdk iphonesimulator \
    SYMROOT=$(PWD)/builtFramework \
    clean build

exitOnFailureCode $?

xcodebuild ARCHS="armv7 armv7s arm64 i386 x86_64" \
	ONLY_ACTIVE_ARCH=NO \
	-configuration Release \
    -project "${project_name}.xcodeproj" \
    -target "${project_name}" \
    -sdk iphoneos \
    SYMROOT=$(PWD)/builtFramework \
    clean build

exitOnFailureCode $?

# This is the full name of the framework we'll
# build
FRAMEWORK_DIR=$FRAMEWORK_BUILD_PATH/$FRAMEWORK_NAME.framework

# clean up old framework directory if exists
rm -rf $FRAMEWORK_DIR

# Build the canonical Framework bundle directory
# structure
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
lipo -create \
    "builtFramework/Debug-iphonesimulator/lib${project_name}.a" \
    "builtFramework/Release-iphoneos/lib${project_name}.a" \
    -o "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"

exitOnFailureCode $?

# Now copy the final assets over: your library
# header files and service definition json files
echo "Framework: Copying public headers into current version..."
#those headers are declared in xcode's building phase: Headers
cp -a builtFramework/Release-iphoneos/include/${project_name}/*.h $FRAMEWORK_DIR/Headers/
exitOnFailureCode $?

# copy service definition json files
echo "Copying service definition files into current build directory..."
mkdir -p 'builtFramework/service-definitions'
find . -name "*.json" -not -path "./*Tests/*" -not -path './builtFramework/*' -exec cp {} 'builtFramework/service-definitions/' \;
exitOnFailureCode $?
