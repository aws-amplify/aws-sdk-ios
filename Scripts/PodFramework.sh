#!/bin/sh

cd "$SOURCE_ROOT"


# version
FRAMEWORK_VERSION=A

# framework name
NAME="$1"

# framework build path
BUILD_PATH="Build/$NAME"

# full name of framework
FRAMEWORK_DIR=$BUILD_PATH/$NAME.framework
   
echo "generate framework for: "
echo $NAME
echo "framework path is: "
echo $FRAMEWORK_DIR


# clean
rm -rf $FRAMEWORK_DIR

echo "Framework: Setting up directories  ..."
mkdir -p $FRAMEWORK_DIR
mkdir -p $FRAMEWORK_DIR/Versions
mkdir -p $FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION
mkdir -p $FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Resources
mkdir -p $FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Headers

echo "Framework: Creating symlinks..."
ln -s $FRAMEWORK_VERSION $FRAMEWORK_DIR/Versions/Current
ln -s Versions/Current/Headers $FRAMEWORK_DIR/Headers
ln -s Versions/Current/Resources $FRAMEWORK_DIR/Resources
ln -s Versions/Current/$NAME $FRAMEWORK_DIR/$NAME



echo "Framework: Creating library bolts " 
lipo -create "Pods/build/Debug-iphonesimulator/libPods-${NAME}.a" "Pods/build/Debug64-iphonesimulator/libPods-${NAME}.a" "Pods/build/Release-iphoneos/libPods-${NAME}.a" "Pods/build/Release64-iphoneos/libPods-${NAME}.a" -o "$FRAMEWORK_DIR/Versions/Current/$NAME"


# copy header file
if [ "$1" = "UICKeyChainStore" ]
then
    cp -a Pods/${NAME}/Lib/*.h $FRAMEWORK_DIR/Headers/
elif [ "$1" = "Reachability" ]
then
    cp -a Pods/${NAME}/*.h $FRAMEWORK_DIR/Headers/
else
    cp -a Pods/${NAME}/${NAME}/*.h $FRAMEWORK_DIR/Headers/
fi

