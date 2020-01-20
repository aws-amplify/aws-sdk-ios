#!/bin/bash

if [[ -z $SOURCE_ROOT ]] ; then
  SOURCE_ROOT=$( pwd )
fi

test_device_id=$( bash ${SOURCE_ROOT}/CircleciScripts/get_circleci_test_device_id.sh )
exitValue=$?
if [[ $exitValue -ne  0 ]] || [[ -z $test_device_id ]] ; then
  echo "Error getting test device ID"
  exit 1
fi

echo "export test_device_id='$test_device_id'" >> $BASH_ENV

# Boot sim if needed
xcrun simctl list devices ${test_device_id} | grep -q Booted
if [[ $? -eq 1 ]] ; then
  echo "Booting ${test_device_id}"
  xcrun simctl boot ${test_device_id}
fi

# destinationspecifier for xcodebuild commands
destination="platform=iOS Simulator,id=${test_device_id}"
echo "destination: ${destination}"
echo "export destination='$destination'" >> $BASH_ENV
