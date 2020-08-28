Pod::Spec.new do |s|
  s.name         = 'AWSMobileAnalytics'
  s.version      = '2.15.2'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.deprecated = true
  s.deprecated_in_favor_of = 'Amplify'
  s.description  = 'This framework is deprecated. Use Amplify Analytics or AWSPinpoint.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.15.2'
  s.source_files = 'AWSMobileAnalytics/*.{h,m}', 'AWSMobileAnalytics/**/*.{h,m}'
  s.private_header_files = 'AWSMobileAnalytics/Internal/*.h'

end
