Pod::Spec.new do |s|
  s.name         = 'AWSCognitoIdentityProvider'
  s.version      = '2.35.0'
  s.summary      = 'Amazon Cognito Identity Provider SDK for iOS (Beta)'

  s.description  = 'Amazon Cognito Identity Provider enables sign up and authentication of your end users'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/aws-amplify/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.frameworks   = 'Security', 'UIKit'
  s.dependency 'AWSCore', '2.35.0'
  s.dependency 'AWSCognitoIdentityProviderASF', '2.35.0'

  s.source_files = 'AWSCognitoIdentityProvider/**/*.{h,m,c}'
  s.public_header_files = 'AWSCognitoIdentityProvider/*.h'
  s.private_header_files = 'AWSCognitoIdentityProvider/Internal/*.h'
  s.resource_bundle = { 'AWSCognitoIdentityProvider' => ['AWSCognitoIdentityProvider/PrivacyInfo.xcprivacy']}
end
