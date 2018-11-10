# carthage archive | tee "carthageout.txt"
frameworkfilename=$(carthage archive |  grep -o 'Created .*\.zip$'  | grep -o   '\S*\.zip$')

if [ -z  "$frameworkfilename" ];then
	echo "Cannot find framework zip file from output of carthage archive"
	exit 1
fi

if [ ! -f "$frameworkfilename" ]; then
	echo "$frameworkfilename is not present"
	exit 1
fi

mv $frameworkfilename   aws-sdk-ios-carthage.framework.zip

