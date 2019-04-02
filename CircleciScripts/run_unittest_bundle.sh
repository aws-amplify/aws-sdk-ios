
#testscheme="$1"
testbundle="$1"
echo "testing $testbundle ..."
echo "test result will be saved to $test_result"

xcodebuild   test-without-building  -project AWSiOSSDKv2.xcodeproj -scheme AWSAllTests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 8,OS=11.2'  -only-testing:$testbundle | tee raw.log  | xcpretty -r junit | tee xcpretty.log
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

