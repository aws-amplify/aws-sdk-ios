#!/bin/sh

cd "$SOURCE_ROOT"

FRAMEWORK_VERSION=A

MANTLE="Mantle"

# framework build path
MANTLE_BUILD_PATH="Build/Mantle"

# full name of framework
MANTLE_FRAMEWORK_DIR=$MANTLE_BUILD_PATH/$MANTLE.framework


# Mantle
rm -rf $MANTLE_FRAMEWORK_DIR

echo "Framework: Setting up directories for Mantle..."
mkdir -p $MANTLE_FRAMEWORK_DIR
mkdir -p $MANTLE_FRAMEWORK_DIR/Versions
mkdir -p $MANTLE_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION
mkdir -p $MANTLE_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Resources
mkdir -p $MANTLE_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Headers

echo "Framework: Creating symlinks..."
ln -s $FRAMEWORK_VERSION $MANTLE_FRAMEWORK_DIR/Versions/Current
ln -s Versions/Current/Headers $MANTLE_FRAMEWORK_DIR/Headers
ln -s Versions/Current/Resources $MANTLE_FRAMEWORK_DIR/Resources
ln -s Versions/Current/$MANTLE $MANTLE_FRAMEWORK_DIR/$MANTLE


echo "Framework: Creating library Mantle " 
lipo -create "Pods/build/Debug-iphonesimulator/libPods-${MANTLE}.a" "Pods/build/Debug64-iphonesimulator/libPods-${MANTLE}.a" "Pods/build/Release-iphoneos/libPods-${MANTLE}.a" "Pods/build/Release64-iphoneos/libPods-${MANTLE}.a" -o "$MANTLE_FRAMEWORK_DIR/Versions/Current/$MANTLE"


# copy header file
cp -a Pods/Mantle/Mantle/*.h  $MANTLE_FRAMEWORK_DIR/Headers