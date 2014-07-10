#!/bin/sh

cd "$SOURCE_ROOT"

FRAMEWORK_VERSION=A


CSURI_TEMPLATE="CSURITemplate"

# framework build path
CSURI_TEMPLATE_BUILD_PATH="Build/CSURITemplate"

# full name of framework
CSURI_TEMPLATE_FRAMEWORK_DIR=$CSURI_TEMPLATE_BUILD_PATH/$CSURI_TEMPLATE.framework


#CSURITemplate
rm -rf $CSURI_TEMPLATE_FRAMEWORK_DIR

echo "Framework: Setting up directories for CSURITemplate..."
mkdir -p $CSURI_TEMPLATE_FRAMEWORK_DIR
mkdir -p $CSURI_TEMPLATE_FRAMEWORK_DIR/Versions
mkdir -p $CSURI_TEMPLATE_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION
mkdir -p $CSURI_TEMPLATE_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Resources
mkdir -p $CSURI_TEMPLATE_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Headers

echo "Framework: Creating symlinks..."
ln -s $FRAMEWORK_VERSION $CSURI_TEMPLATE_FRAMEWORK_DIR/Versions/Current
ln -s Versions/Current/Headers $CSURI_TEMPLATE_FRAMEWORK_DIR/Headers
ln -s Versions/Current/Resources $CSURI_TEMPLATE_FRAMEWORK_DIR/Resources
ln -s Versions/Current/$CSURI_TEMPLATE $CSURI_TEMPLATE_FRAMEWORK_DIR/$CSURI_TEMPLATE


echo "Framework: Creating library CSURITemplate " 
lipo -create "Pods/build/Debug-iphonesimulator/libPods-${CSURI_TEMPLATE}.a" "Pods/build/Debug64-iphonesimulator/libPods-${CSURI_TEMPLATE}.a" "Pods/build/Release-iphoneos/libPods-${CSURI_TEMPLATE}.a" "Pods/build/Release64-iphoneos/libPods-${CSURI_TEMPLATE}.a" -o "$CSURI_TEMPLATE_FRAMEWORK_DIR/Versions/Current/$CSURI_TEMPLATE"

# copy header file
cp -a Pods/CSURITemplate/CSURITemplate/*.h  $CSURI_TEMPLATE_FRAMEWORK_DIR/Headers