#!/bin/sh

# clean 
if [ -n $1 ] && [ "$1" == "clean" ];
then
	rm -rf build
	echo "Cleaning Completed"
	exit 0
fi

if [ -e "Scripts/objc-fix.patch" ]; then
	echo "Applying a patch"
	patch -p1 < Scripts/objc-fix.patch
fi

if [ -x "Scripts/SdkPackage.sh" ]; then
    Scripts/SdkPackage.sh || { echo "Scripts/SdkPackage.sh failed."; git checkout .; exit 1; }
fi

if [ -x "Scripts/PodFramework.sh" ]; then
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
