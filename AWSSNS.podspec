Pod::Spec.new do |s|

  s.name         = 'AWSSNS'
  s.version      = '2.3.3'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/sdkforios'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }

  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.10"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.3.3'

  s.source_files = 'AWSSNS/*.{h,m}'
end
