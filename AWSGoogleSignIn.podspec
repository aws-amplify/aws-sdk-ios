Pod::Spec.new do |s|
   s.name         = 'AWSGoogleSignIn'
   s.version      = '2.13.2'
   s.summary      = 'Amazon Web Services SDK for iOS.'
 
   s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'
 
   s.homepage     = 'http://aws.amazon.com/mobile/sdk'
   s.license      = 'Apache License, Version 2.0'
   s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
   s.platform     = :ios, '9.0'
   s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                      :tag => s.version}
   s.requires_arc = true
   s.dependency 'AWSAuthCore', '2.13.2'
   s.source_files = 'AWSAuthSDK/Sources/AWSGoogleSignIn/*.{h,m}', 'AWSAuthSDK/Dependencies/GoogleHeaders/*.h'
   s.public_header_files = 'AWSAuthSDK/Sources/AWSGoogleSignIn/*.h'
   s.private_header_files = 'AWSAuthSDK/Dependencies/GoogleHeaders/*.h'
   s.resource_bundle = {  'AWSGoogleSignIn' => 'AWSAuthSDK/Sources/AWSGoogleSignIn/Images.xcassets' }
 end
