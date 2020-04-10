Pod::Spec.new do |s|
   s.name         = 'AWSUserPoolsSignIn'
   s.version      = '2.13.2'
   s.summary      = 'Amazon Web Services SDK for iOS.'
 
   s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'
 
   s.homepage     = 'http://aws.amazon.com/mobile/sdk'
   s.license      = 'Apache License, Version 2.0'
   s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
   s.platform     = :ios, '8.0'
   s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                      :tag => s.version}
   s.requires_arc = true
   s.dependency 'AWSCognitoIdentityProvider', '2.13.2'
   s.dependency 'AWSAuthCore', '2.13.2'
   s.source_files = 'AWSAuthSDK/Sources/AWSUserPoolsSignIn/**/*.{h,m}'
   s.public_header_files = 'AWSAuthSDK/Sources/AWSUserPoolsSignIn/*.{h}'
   s.private_header_files = 'AWSAuthSDK/Sources/AWSUserPoolsSignIn/UserPoolsUI/*.{h}'
   s.resource_bundles = { 'AWSUserPoolsSignIn' => ['AWSAuthSDK/Sources/AWSUserPoolsSignIn/**/*.{storyboard}'] }
 end
