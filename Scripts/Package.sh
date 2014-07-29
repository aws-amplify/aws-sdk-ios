#!/bin/sh

# clean 
if [ -n $1 ] && [ "$1" == "clean" ];
then
	rm -rf Build
	echo "Cleaning Completed"
	exit 0
fi

if [ -x "Scripts/SdkPackage.sh" ]; then
	Scripts/SdkPackage.sh
fi

if [ -x "Scripts/PodFramework.sh" ]; then
	Scripts/PodFramework.sh Bolts
	Scripts/PodFramework.sh CSURITemplate
	Scripts/PodFramework.sh Mantle
	Scripts/PodFramework.sh TMCache
	Scripts/PodFramework.sh XMLDictionary
	Scripts/PodFramework.sh UICKeyChainStore
	Scripts/PodFramework.sh Reachability
	Scripts/PodFramework.sh GZIP
fi
