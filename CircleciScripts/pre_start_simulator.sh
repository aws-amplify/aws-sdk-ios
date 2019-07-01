# Create sim if needed
test_device_id=$( xcrun simctl list devices | grep "circleci-test-device" | sed 's/ *circleci-test-device *(//' | sed 's/).*//' )

if [[ -z $test_device_id ]] ; then
  echo "Creating test device"

  # Get the most recent available runtime
  runtime=$( xcrun simctl list runtimes iOS | sed 's/iOS //' | sort -h | tail -1 | sed 's/.* - //' | tr -d '[:space:]' )
  echo "Runtime: '${runtime}'"

  # Get the last alphabetical device (probably something in the iPhone X family, as of 2019-05-31)
  devicetype=$( xcrun simctl list devicetypes iPhone | sort | tail -1 | sed 's/.*(//' | sed 's/).*//' | tr -d '[:space:]' )
  echo "Device type: '${devicetype}'"

  test_device_id=$( xcrun simctl create "circleci-test-device" "${devicetype}" "${runtime}" | tr -d '[:space:]' )
fi

echo "test_device_id: ${test_device_id}"
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

