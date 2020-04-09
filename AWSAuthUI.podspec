Pod::Spec.new do |s|
   s.name         = 'AWSAuthUI'
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
   s.dependency 'AWSCore', '2.13.2'
   s.dependency 'AWSAuthCore', '2.13.2'
   s.source_files = 'AWSAuthSDK/Sources/AWSAuthUI/*.{h,m}', 'AWSAuthSDK/Sources/AWSAuthUI/**/*.{h,m}', 'AWSAuthSDK/Sources/AWSUserPoolsSignIn/UserPoolsUI/AWSFormTableCell.h', 'AWSAuthSDK/Sources/AWSUserPoolsSignIn/UserPoolsUI/AWSTableInputCell.h', 'AWSAuthSDK/Sources/AWSUserPoolsSignIn/UserPoolsUI/AWSFormTableDelegate.h', 'AWSAuthSDK/Sources/AWSUserPoolsSignIn/UserPoolsUI/AWSUserPoolsUIHelper.h'
   s.public_header_files = 'AWSAuthSDK/Sources/AWSAuthUI/AWSAuthUI.h', 'AWSAuthSDK/Sources/AWSAuthUI/AWSAuthUIViewController.h', 'AWSAuthSDK/Sources/AWSAuthUI/AWSAuthUIConfiguration.h'
   s.private_header_files = 'AWSAuthSDK/Sources/AWSUserPoolsSignIn/UserPoolsUI/AWSFormTableCell.h', 'AWSAuthSDK/Sources/AWSAuthUI/AWSSignInViewController.h', 'AWSAuthSDK/Sources/AWSUserPoolsSignIn/UserPoolsUI/AWSTableInputCell.h', 'AWSAuthSDK/Sources/AWSUserPoolsSignIn/UserPoolsUI/AWSFormTableDelegate.h'
   s.resource_bundles = { 'AWSAuthUI' => ['AWSAuthSDK/Sources/AWSAuthUI/*.{storyboard}', 'AWSAuthSDK/Sources/AWSAuthUI/Images.xcassets'] }
 end
