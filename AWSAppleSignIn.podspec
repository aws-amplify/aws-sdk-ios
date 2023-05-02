Pod::Spec.new do |s|
  s.name         = 'AWSAppleSignIn'
  s.version      = '2.31.1'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '13.0'
  s.source       = { :git => 'https://github.com/aws-amplify/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.31.1'
  s.dependency 'AWSAuthCore', '2.31.1'
  s.source_files = 'AWSAuthSDK/Sources/AWSAppleSignIn/*.{h,m}'
  s.public_header_files = 'AWSAuthSDK/Sources/AWSAppleSignIn/*.h'
end
