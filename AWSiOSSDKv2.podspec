Pod::Spec.new do |s|

  s.name         = 'AWSiOSSDKv2'
  s.version      = '2.33.0'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.deprecated = true
  s.deprecated_in_favor_of = 'Amplify'
  s.description  = 'This pod is deprecated. Use Amplify for iOS to build fullstack iOS apps, or use individual AWS Mobile SDK pods for individual services.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/aws-amplify/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true

  # Used by many of the service-api subspecs
  s.subspec 'AWSCognitoIdentityProvider' do |sub|
    sub.dependency 'AWSCognitoIdentityProvider', '2.33.0'
  end

  # Used by all service-api subspecs
  s.subspec 'AWSCore' do |sub|
    sub.dependency 'AWSCore', '2.33.0'
  end

  # Service-api subspecs
  s.subspec 'AWSAPIGateway' do |sub|
    sub.dependency 'AWSAPIGateway', '2.33.0'
  end

  s.subspec 'AutoScaling' do |sub|
    sub.dependency 'AWSAutoScaling', '2.33.0'
  end

  s.subspec 'CloudWatch' do |sub|
    sub.dependency 'AWSCloudWatch', '2.33.0'
  end

  s.subspec 'AWSComprehend' do |sub|
    sub.dependency 'AWSComprehend', '2.33.0'
  end

  s.subspec 'AWSConnect' do |sub|
    sub.dependency 'AWSConnect', '2.33.0'
  end

  s.subspec 'AWSConnectParticipant' do |sub|
    sub.dependency 'AWSConnectParticipant', '2.33.0'
  end

  s.subspec 'DynamoDB' do |sub|
    sub.dependency 'AWSDynamoDB', '2.33.0'
  end

  s.subspec 'EC2' do |sub|
    sub.dependency 'AWSEC2', '2.33.0'
  end

  s.subspec 'ElasticLoadBalancing' do |sub|
    sub.dependency 'AWSElasticLoadBalancing', '2.33.0'
  end

  s.subspec 'AWSIoT' do |sub|
    sub.dependency 'AWSIoT', '2.33.0'
  end

  s.subspec 'AWSKMS' do |sub|
    sub.dependency 'AWSKMS', '2.33.0'
  end

  s.subspec 'Kinesis' do |sub|
    sub.dependency 'AWSKinesis', '2.33.0'
  end

  # KinesisVideo not released as part of AWSiOSSDKv2
  # KinesisVideoArchivedMedia not released as part of AWSiOSSDKv2

  s.subspec 'KinesisVideoSignaling' do |sub|
    sub.dependency 'AWSKinesisVideoSignaling', '2.33.0'
  end

  s.subspec 'AWSLambda' do |sub|
    sub.dependency 'AWSLambda', '2.33.0'
  end

  s.subspec 'AWSLex' do |sub|
    sub.dependency 'AWSLex', '2.33.0'
  end

  s.subspec 'AWSLogs' do |sub|
    sub.dependency 'AWSLogs', '2.33.0'
  end

  s.subspec 'AWSMachineLearning' do |sub|
    sub.dependency 'AWSMachineLearning', '2.33.0'
  end

  s.subspec 'Pinpoint' do |sub|
    sub.dependency 'AWSPinpoint', '2.33.0'
  end

  s.subspec 'AWSPolly' do |sub|
    sub.dependency 'AWSPolly', '2.33.0'
  end

  s.subspec 'AWSRekognition' do |sub|
    sub.dependency 'AWSRekognition', '2.33.0'
  end

  s.subspec 'AWSS3' do |sub|
    sub.dependency 'AWSS3', '2.33.0'
  end

  s.subspec 'AWSSES' do |sub|
    sub.dependency 'AWSSES', '2.33.0'
  end

  s.subspec 'AWSSNS' do |sub|
    sub.dependency 'AWSSNS', '2.33.0'
  end

  s.subspec 'AWSSQS' do |sub|
    sub.dependency 'AWSSQS', '2.33.0'
  end
  
  s.subspec 'AWSSageMakerRuntime' do |sub|
    sub.dependency 'AWSSageMakerRuntime', '2.33.0'
  end

  s.subspec 'AWSSimpleDB' do |sub|
    sub.dependency 'AWSSimpleDB', '2.33.0'
  end

  s.subspec 'AWSTextract' do |sub|
    sub.dependency 'AWSTextract', '2.33.0'
  end
  
  s.subspec 'AWSTranscribe' do |sub|
    sub.dependency 'AWSTranscribe', '2.33.0'
  end

  # note that AWSTranscribeStreaming requires iOS 9.0 or higher, and is
  # therefore not included as a subspec

  s.subspec 'AWSTranslate' do |sub|
    sub.dependency 'AWSTranslate', '2.33.0'
  end
  
end
