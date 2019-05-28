testbundle="$1"

echo "testing $testbundle ..."
echo "test destination $destination"
echo "test result will be saved to $test_result"

xcodebuild test-without-building -project AWSiOSSDKv2.xcodeproj -scheme AWSAllTests -sdk iphonesimulator -destination "${destination}" -only-testing:$testbundle | tee raw.log | xcpretty -r junit | tee xcpretty.log
returncode=${PIPESTATUS[0]}
echo "xcodebuild return code = $returncode"
if [ $returncode -eq 0 ];then
  echo "$testbundle succeed"
else
  echo "$testbundle unittest failed"
  mkdir $test_result/$testbundle
  mv raw.log $test_result/"$testbundle"/raw.log
  mv xcpretty.log $test_result/"$testbundle"/xcpretty.log
  mv build/reports/junit.xml $test_result/"$testbundle"/junit.xml
fi

