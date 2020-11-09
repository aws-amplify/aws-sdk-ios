Pod::Spec.new do |s|

  s.name         = 'AWSCognitoSync'
  s.version      = '2.19.0'
  s.summary      = 'Amazon Cognito SDK for iOS'

  s.deprecated = true
  s.deprecated_in_favor_of = 'Amplify'
  s.description  = 'This framework is deprecated. Use Amplify DataStore for synchronizing app data, and Amplify Auth for authentication and authorization.'

  s.homepage     = 'http://aws.amazon.com/cognito'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.library      = 'sqlite3'
  s.dependency 'AWSCognito', '2.19.0'
end
