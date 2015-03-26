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

target :AutoScaling do
  xcodeproj 'AutoScaling'
  link_with 'AutoScalingTests'
  default_pods
end

target :CloudWatch do
  xcodeproj 'CloudWatch'
  link_with 'CloudWatchTests'
  default_pods
end

target :DynamoDB do
  xcodeproj 'DynamoDB'
  link_with 'DynamoDBTests'
  default_pods
end

target :EC2 do
  xcodeproj 'EC2'
  link_with 'EC2Tests'
  default_pods
end

target :ElasticLoadBalancing do
  xcodeproj 'ElasticLoadBalancing'
  link_with 'ElasticLoadBalancingTests'
  default_pods
end

target :Kinesis do
  xcodeproj 'Kinesis'
  link_with 'KinesisTests'
  default_pods
end

target :S3 do
  xcodeproj 'S3'
  link_with 'S3Tests'
  default_pods
end

target :SES do
  xcodeproj 'SES'
  link_with 'SESTests'
  default_pods
end

target :SimpleDB do
  xcodeproj 'SimpleDB'
  link_with 'SimpleDBTests'
  default_pods
end

target :SNS do
  xcodeproj 'SNS'
  link_with 'SNSTests'
  default_pods
end

target :SQS do
  xcodeproj 'SQS'
  link_with 'SQSTests'
  default_pods
end

