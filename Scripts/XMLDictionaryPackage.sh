#!/bin/sh

cd "$SOURCE_ROOT"

FRAMEWORK_VERSION=A

XML_DICTIONARY="XMLDictionary"

# framework build path
XML_DICTIONARY_BUILD_PATH="Build/XMLDictionary"

# full name of framework
XML_DICTIONARY_FRAMEWORK_DIR=$XML_DICTIONARY_BUILD_PATH/$XML_DICTIONARY.framework


# XMLDictionary
rm -rf $TMCACHE_FRAMEWORK_DIR

echo "Framework: Setting up directories for XMLDictionary..."
mkdir -p $XML_DICTIONARY_FRAMEWORK_DIR
mkdir -p $XML_DICTIONARY_FRAMEWORK_DIR/Versions
mkdir -p $XML_DICTIONARY_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION
mkdir -p $XML_DICTIONARY_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Resources
mkdir -p $XML_DICTIONARY_FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Headers

echo "Framework: Creating symlinks..."
ln -s $FRAMEWORK_VERSION $XML_DICTIONARY_FRAMEWORK_DIR/Versions/Current
ln -s Versions/Current/Headers $XML_DICTIONARY_FRAMEWORK_DIR/Headers
ln -s Versions/Current/Resources $XML_DICTIONARY_FRAMEWORK_DIR/Resources
ln -s Versions/Current/$XML_DICTIONARY $XML_DICTIONARY_FRAMEWORK_DIR/$XML_DICTIONARY


echo "Framework: Creating library XMLDictionary" 
lipo -create "Pods/build/Debug-iphonesimulator/libPods-${XML_DICTIONARY}.a" "Pods/build/Debug64-iphonesimulator/libPods-${XML_DICTIONARY}.a" "Pods/build/Release-iphoneos/libPods-${XML_DICTIONARY}.a" "Pods/build/Release64-iphoneos/libPods-${XML_DICTIONARY}.a" -o "$XML_DICTIONARY_FRAMEWORK_DIR/Versions/Current/$XML_DICTIONARY"



# copy header file
cp -a Pods/XMLDictionary/XMLDictionary/*.h $XML_DICTIONARY_FRAMEWORK_DIR/Headers