export test_result="$1"

echo "test result folder: $test_result" 
mkdir "$test_result"           
bash CircleciScripts/run_unittest_bundle.sh  AWSAPIGatewayUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSAutoScalingUnitTests     
bash CircleciScripts/run_unittest_bundle.sh  AWSCloudWatchUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSCognitoAuthUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSCognitoIdentityProviderUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSCognitoUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSComprehendUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSCoreUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSDynamoDBUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSEC2UnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSElasticLoadBalancingUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSIoTUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSKMSUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSKinesisUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSKinesisVideoUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSKinesisVideoArchivedMediaUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSLambdaUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSLexUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSLogsUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSMachineLearningUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSMobileAnalyticsUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSPinpointUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSPollyUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSRekognitionUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSS3UnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSSESUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSSNSUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSSQSUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSSimpleDBUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSTranscribeUnitTests
bash CircleciScripts/run_unittest_bundle.sh  AWSTranslateUnitTests
