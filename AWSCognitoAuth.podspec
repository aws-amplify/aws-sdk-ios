Pod::Spec.new do |s|
  s.name         = 'AWSCognitoAuth'
  s.version      = '2.36.0'
  s.summary      = 'Amazon Cognito Auth SDK for iOS'

  s.description  = 'Amazon Cognito Auth enables sign up and authentication of your end users via a hosted UI'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '12.0'
  s.source       = { :git => 'https://github.com/aws-amplify/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true

  s.dependency 'AWSCore', '2.36.0'
  s.dependency 'AWSCognitoIdentityProviderASF', '2.36.0'

  s.source_files = 'AWSCognitoAuth/**/*.{h,m,c}'
  s.public_header_files = 'AWSCognitoAuth/*.h'
  s.private_header_files = 'AWSCognitoAuth/Internal/*.h'
  s.resource_bundle = { 'AWSCognitoAuth' => ['AWSCognitoAuth/PrivacyInfo.xcprivacy']}
end
