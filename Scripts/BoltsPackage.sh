#!/bin/sh

cd "$SOURCE_ROOT"

FRAMEWORK_VERSION=A


# framework name
BOLTS="Bolts"


# framework build path
BOLTS_BUILD_PATH="Build/Bolts"


# full name of framework
BOLTS_FRAMEWORK_DIR=$BOLTS_BUILD_PATH/$BOLTS.framework
   

# bolts
rm -rf $BOLTS_FRAMEWORK_DIR

echo "Framework: Setting up directories for bolts..."
mkdir -p $BOLTS_FRAMEWORK_DIR
mkdir -p $BOLTS_FRAMEWORK_DIR/Versions
mkdir -p $BOLTS_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION
mkdir -p $BOLTS_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Resources
mkdir -p $BOLTS_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Headers

echo "Framework: Creating symlinks..."
ln -s $FRAMEWORK_VERSION $BOLTS_FRAMEWORK_DIR/Versions/Current
ln -s Versions/Current/Headers $BOLTS_FRAMEWORK_DIR/Headers
ln -s Versions/Current/Resources $BOLTS_FRAMEWORK_DIR/Resources
ln -s Versions/Current/$BOLTS $BOLTS_FRAMEWORK_DIR/$BOLTS



echo "Framework: Creating library bolts " 
lipo -create "Pods/build/Debug-iphonesimulator/libPods-${BOLTS}.a" "Pods/build/Debug64-iphonesimulator/libPods-${BOLTS}.a" "Pods/build/Release-iphoneos/libPods-${BOLTS}.a" "Pods/build/Release64-iphoneos/libPods-${BOLTS}.a" -o "$BOLTS_FRAMEWORK_DIR/Versions/Current/$BOLTS"


# copy header file
cp -a Pods/Bolts/Bolts/*.h $BOLTS_FRAMEWORK_DIR/Headers/




