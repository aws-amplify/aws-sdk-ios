Pod::Spec.new do |s|
  s.name         = 'AWSCognitoAuth'
  s.version      = '2.5.10'
  s.summary      = 'Amazon Cognito Auth SDK for iOS'

  s.description  = 'Amazon Cognito Auth enables sign up and authentication of your end users via a hosted UI'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.source_files = 'AWSCognitoAuth/**/*.{h,m,c}'
  s.public_header_files = 'AWSCognitoAuth/*.h'
  s.private_header_files = 'AWSCognitoAuth/Internal/*.h'
end
