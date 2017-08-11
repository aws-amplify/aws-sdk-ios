Pod::Spec.new do |s|

  s.name         = 'AWSiOSSDKv2'
  s.version      = '2.5.10'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true

  s.subspec 'AWSCore' do |aws|
    aws.dependency 'AWSCore', '2.5.10'
  end

  s.subspec 'AWSAPIGateway' do |apigateway|
    apigateway.dependency 'AWSAPIGateway', '2.5.10'
  end

  s.subspec 'AutoScaling' do |autoscaling|
  	autoscaling.dependency 'AWSAutoScaling', '2.5.10'
  end

  s.subspec 'CloudWatch' do |cloudwatch|
  	cloudwatch.dependency 'AWSCloudWatch', '2.5.10'
  end

  s.subspec 'Pinpoint' do |pp|
        pp.dependency 'AWSPinpoint', '2.5.10'
  end

  s.subspec 'AWSCognito' do |cognito|
    cognito.dependency 'AWSCognito', '2.5.10'
  end

  s.subspec 'AWSCognitoIdentityProvider' do |cognitoidentityprovider|
    cognitoidentityprovider.dependency 'AWSCognitoIdentityProvider', '2.5.10'
  end

  s.subspec 'DynamoDB' do |ddb|
  	ddb.dependency 'AWSDynamoDB', '2.5.10'
  end

  s.subspec 'EC2' do |ec2|
  	ec2.dependency 'AWSEC2', '2.5.10'
  end

  s.subspec 'ElasticLoadBalancing' do |elasticloadbalancing|
  	elasticloadbalancing.dependency 'AWSElasticLoadBalancing', '2.5.10'
  end

  s.subspec 'AWSIoT' do |iot|
        iot.dependency 'AWSIoT', '2.5.10'
  end

  s.subspec 'Kinesis' do |kinesis|
    kinesis.dependency 'AWSKinesis', '2.5.10'
  end

  s.subspec 'AWSKMS' do |kms|
    kms.dependency 'AWSKMS', '2.5.10'
  end

  s.subspec 'AWSLambda' do |lambda|
        lambda.dependency 'AWSLambda', '2.5.10'
  end

  s.subspec 'AWSLex' do |lex|
        lex.dependency 'AWSLex', '2.5.10'
  end

   s.subspec 'AWSLogs' do |log|
        log.dependency 'AWSLogs', '2.5.10'
  end

  s.subspec 'AWSMachineLearning' do |machinelearning|
        machinelearning.dependency 'AWSMachineLearning', '2.5.10'
  end

  s.subspec 'AWSPolly' do |polly|
        polly.dependency 'AWSPolly', '2.5.10'
  end

  s.subspec 'MobileAnalytics' do |mobileanalytics|
  	mobileanalytics.dependency 'AWSMobileAnalytics', '2.5.10'
  end

  s.subspec 'AWSRekognition' do |rekognition|
  	rekognition.dependency 'AWSRekognition', '2.5.10'
  end

  s.subspec 'AWSS3' do |s3|
  	s3.dependency 'AWSS3', '2.5.10'
  end

  s.subspec 'AWSSES' do |ses|
  	ses.dependency 'AWSSES', '2.5.10'
  end

  s.subspec 'AWSSimpleDB' do |simpledb|
  	simpledb.dependency 'AWSSimpleDB', '2.5.10'
  end

  s.subspec 'AWSSNS' do |sns|
  	sns.dependency 'AWSSNS', '2.5.10'
  end

  s.subspec 'AWSSQS' do |sqs|
  	sqs.dependency 'AWSSQS', '2.5.10'
  end
  
  

end
