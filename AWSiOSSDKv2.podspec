Pod::Spec.new do |s|

  s.name         = 'AWSiOSSDKv2'
  s.version      = '2.0.14'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/sdkforios'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.frameworks   = 'UIKit','Foundation','SystemConfiguration'

  s.dependency 'Bolts', '~> 1.1.0'
  s.dependency 'Mantle', '~> 1.4'
  s.dependency 'TMCache', '~> 1.2.1'
  s.dependency 'XMLDictionary', '~> 1.4.0'
  s.dependency 'UICKeyChainStore', '~> 1.0'
  s.dependency 'Reachability', '~> 3.1'
  s.dependency 'GZIP', '~> 1.0.3'
  s.dependency 'FMDB', '~> 2.4.0'

  s.requires_arc = true

  s.subspec 'AWSCore' do |aws|
    aws.source_files = 'AWSCore/*.{h,m}', 'AWSCore/**/*.{h,m}'
    aws.resources = ['AWSCore/**/Resources/*.json']
  end

  s.subspec 'AutoScaling' do |autoscaling|
  	autoscaling.dependency 'AWSiOSSDKv2/AWSCore'
    autoscaling.source_files = 'AutoScaling/*.{h,m}'
    autoscaling.resources = ['AutoScaling/Resources/*.json']
  end

  s.subspec 'CloudWatch' do |cloudwatch|
  	cloudwatch.dependency 'AWSiOSSDKv2/AWSCore'
    cloudwatch.source_files = 'CloudWatch/*.{h,m}'
    cloudwatch.resources = ['CloudWatch/Resources/*.json']
  end

  s.subspec 'DynamoDB' do |ddb|
  	ddb.dependency 'AWSiOSSDKv2/AWSCore'
    ddb.source_files = 'DynamoDB/*.{h,m}'
    ddb.resources = ['DynamoDB/Resources/*.json']
  end

  s.subspec 'EC2' do |ec2|
  	ec2.dependency 'AWSiOSSDKv2/AWSCore'
    ec2.source_files = 'EC2/*.{h,m}'
    ec2.resources = ['EC2/Resources/*.json']
  end

  s.subspec 'ElasticLoadBalancing' do |elasticloadbalancing|
  	elasticloadbalancing.dependency 'AWSiOSSDKv2/AWSCore'
    elasticloadbalancing.source_files = 'ElasticLoadBalancing/*.{h,m}'
    elasticloadbalancing.resources = ['ElasticLoadBalancing/Resources/*.json']
  end

  s.subspec 'Kinesis' do |kinesis|
  	kinesis.dependency 'AWSiOSSDKv2/AWSCore'
    kinesis.source_files = 'Kinesis/*.{h,m}'
    kinesis.resources = ['Kinesis/Resources/*.json']
  end

  s.subspec 'S3' do |s3|
  	s3.dependency 'AWSiOSSDKv2/AWSCore'
    s3.source_files = 'S3/*.{h,m}'
    s3.resources = ['S3/Resources/*.json']
  end

  s.subspec 'SES' do |ses|
  	ses.dependency 'AWSiOSSDKv2/AWSCore'
    ses.source_files = 'SES/*.{h,m}'
    ses.resources = ['SES/Resources/*.json']
  end

  s.subspec 'SimpleDB' do |simpledb|
  	simpledb.dependency 'AWSiOSSDKv2/AWSCore'
    simpledb.source_files = 'SimpleDB/*.{h,m}'
    simpledb.resources = ['SimpleDB/Resources/*.json']
  end

  s.subspec 'SNS' do |sns|
  	sns.dependency 'AWSiOSSDKv2/AWSCore'
    sns.source_files = 'SNS/*.{h,m}'
    sns.resources = ['SNS/Resources/*.json']
  end

  s.subspec 'SQS' do |sqs|
  	sqs.dependency 'AWSiOSSDKv2/AWSCore'
    sqs.source_files = 'SQS/*.{h,m}'
    sqs.resources = ['SQS/Resources/*.json']
  end
end
