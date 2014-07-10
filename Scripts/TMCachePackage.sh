#!/bin/sh

cd "$SOURCE_ROOT"

FRAMEWORK_VERSION=A

TMCACHE="TMCache"

# framework build path
TMCACHE_BUILD_PATH="Build/TMCache"


# full name of framework
TMCACHE_FRAMEWORK_DIR=$TMCACHE_BUILD_PATH/$TMCACHE.framework


# TMCache
rm -rf $TMCACHE_FRAMEWORK_DIR

echo "Framework: Setting up directories for TMCache..."
mkdir -p $TMCACHE_FRAMEWORK_DIR
mkdir -p $TMCACHE_FRAMEWORK_DIR/Versions
mkdir -p $TMCACHE_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION
mkdir -p $TMCACHE_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Resources
mkdir -p $TMCACHE_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Headers

echo "Framework: Creating symlinks..."
ln -s $FRAMEWORK_VERSION $TMCACHE_FRAMEWORK_DIR/Versions/Current
ln -s Versions/Current/Headers $TMCACHE_FRAMEWORK_DIR/Headers
ln -s Versions/Current/Resources $TMCACHE_FRAMEWORK_DIR/Resources
ln -s Versions/Current/$TMCACHE $TMCACHE_FRAMEWORK_DIR/$TMCACHE

echo "Framework: Creating library TMCache" 
lipo -create "Pods/build/Debug-iphonesimulator/libPods-${TMCACHE}.a" "Pods/build/Debug64-iphonesimulator/libPods-${TMCACHE}.a" "Pods/build/Release-iphoneos/libPods-${TMCACHE}.a" "Pods/build/Release64-iphoneos/libPods-${TMCACHE}.a" -o "$TMCACHE_FRAMEWORK_DIR/Versions/Current/$TMCACHE"

# copy header file
cp -a Pods/TMCache/TMCache/*.h $TMCACHE_FRAMEWORK_DIR/Headers





