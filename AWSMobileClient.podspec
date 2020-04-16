Pod::Spec.new do |s|
   s.name         = 'AWSMobileClient'
   s.version      = '2.13.2'
   s.summary      = 'Amazon Web Services SDK for iOS.'
 
   s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'
 
   s.homepage     = 'https://aws.amazon.com/mobile/sdk'
   s.license      = 'Apache License, Version 2.0'
   s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
   s.platform     = :ios, '9.0'
   s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                      :tag => s.version}
   s.requires_arc = true
   s.dependency 'AWSAuthCore', '2.13.2'
   s.dependency 'AWSCognitoIdentityProvider', '2.13.2'
   s.source_files = 'AWSAuthSDK/Sources/AWSMobileClient/*.{h,m}', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/*.{h,m}', 'AWSAuthSDK/Sources/AWSMobileClient/*.swift', 'AWSCognitoAuth/**/*.{h,m,c}', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/*.swift'
   s.public_header_files = 'AWSAuthSDK/Sources/AWSMobileClient/AWSMobileClient.h', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/_AWSMobileClient.h', 'AWSCognitoAuth/*.h', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/AWSCognitoAuth+Extensions.h', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/AWSCognitoCredentialsProvider+Extension.h', 'AWSAuthSDK/Sources/AWSMobileClient/Internal/AWSCognitoIdentityUserPool+Extension.h'
 end
