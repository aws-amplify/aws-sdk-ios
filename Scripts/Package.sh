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

if [ -x "Scripts/BoltsPackage.sh" ]; then
	Scripts/BoltsPackage.sh
fi

if [ -x "Scripts/CSURITemplatePackage.sh" ]; then
	Scripts/CSURITemplatePackage.sh
fi

if [ -x "Scripts/MantlePackage.sh" ]; then
	Scripts/MantlePackage.sh 
fi

if [ -x "Scripts/TMCachePackage.sh" ]; then
	Scripts/TMCachePackage.sh
fi

if [ -x "Scripts/XMLDictionaryPackage.sh" ]; then
	Scripts/XMLDictionaryPackage.sh
fi

if [ -x "Scripts/UICKeyChainStore.sh" ]; then
	Scripts/UICKeyChainStore.sh
fi
