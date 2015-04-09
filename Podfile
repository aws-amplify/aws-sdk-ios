def default_pods
  pod 'Bolts', '~> 1.1.0'
  pod 'Mantle', '~> 1.4'
  pod 'TMCache', '~> 1.2.1'
  pod 'XMLDictionary', '~> 1.4.0'
  pod 'UICKeyChainStore', '~> 2.0'
  pod 'Reachability', '~> 3.1'
  pod 'GZIP', '~> 1.0.3'
  pod 'FMDB', '~> 2.4'
end

source 'https://github.com/CocoaPods/Specs.git'

workspace 'AWSiOSSDKv2'
xcodeproj 'AWSCore'

link_with 'AWSCoreTests', 'AWSiOSSDKAnalyticsTests'
default_pods

target :AWSAutoScaling do
  xcodeproj 'AWSAutoScaling'
  link_with 'AWSAutoScalingTests'
  default_pods
end

target :AWSCloudWatch do
  xcodeproj 'AWSCloudWatch'
  link_with 'AWSCloudWatchTests'
  default_pods
end

target :AWSDynamoDB do
  xcodeproj 'AWSDynamoDB'
  link_with 'AWSDynamoDBTests'
  default_pods
end

target :AWSEC2 do
  xcodeproj 'AWSEC2'
  link_with 'AWSEC2Tests'
  default_pods
end

target :AWSElasticLoadBalancing do
  xcodeproj 'AWSElasticLoadBalancing'
  link_with 'AWSElasticLoadBalancingTests'
  default_pods
end

target :AWSKinesis do
  xcodeproj 'AWSKinesis'
  link_with 'AWSKinesisTests'
  default_pods
end

target :AWSLambda do
  xcodeproj 'AWSLambda'
  link_with 'AWSLambdaTests'
  default_pods
end

target :AWSMachineLearning do
  xcodeproj 'AWSMachineLearning'
  link_with 'AWSMachineLearningTests'
  default_pods
end

target :AWSS3 do
  xcodeproj 'AWSS3'
  link_with 'AWSS3Tests'
  default_pods
end

target :AWSSES do
  xcodeproj 'AWSSES'
  link_with 'AWSSESTests'
  default_pods
end

target :AWSSimpleDB do
  xcodeproj 'AWSSimpleDB'
  link_with 'AWSSimpleDBTests'
  default_pods
end

target :AWSSNS do
  xcodeproj 'AWSSNS'
  link_with 'AWSSNSTests'
  default_pods
end

target :AWSSQS do
  xcodeproj 'AWSSQS'
  link_with 'AWSSQSTests'
  default_pods
end
