Pod::Spec.new do |s|
  s.name         = 'AWSCognito'
  s.version      = '2.16.0'
  s.summary      = 'Amazon Cognito SDK for iOS'

  s.description  = 'Amazon Cognito offers multi device data synchronization with offline access'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.library      = 'sqlite3' 
  s.dependency 'AWSCore', '2.16.0'
  s.source_files = 'AWSCognito/*.{h,m}', 'AWSCognito/**/*.{h,m}'
  s.public_header_files = 'AWSCognito/*.h', 'AWSCognito/CognitoSync/*.h'
  s.private_header_files = 'AWSCognito/Fabric/*.h', 'AWSCognito/Internal/*.h'
end
