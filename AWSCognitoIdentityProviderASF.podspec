Pod::Spec.new do |s|
  s.name         = 'AWSCognitoIdentityProviderASF'
  s.version      = '1.0.1'
  s.summary      = 'Amazon Cognito Identity Provider Advanced Security Features library (Beta)'

  s.description  = 'Amazon Cognito Identity Provider ASF provides the information necessary to support adaptive authentication'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => '2.6.12'}
  s.requires_arc = true
  s.public_header_files = 'AWSCognitoIdentityProviderASF/*.h'
  s.source_files = 'AWSCognitoIdentityProviderASF/**/*.{h,m,c}'
  s.private_header_files = 'AWSCognitoIdentityProviderASF/Internal/*.h'
  s.vendored_libraries = 'AWSCognitoIdentityProviderASF/Internal/libAWSCognitoIdentityProviderASF.a'
end
