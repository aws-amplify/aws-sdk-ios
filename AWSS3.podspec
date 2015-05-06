Pod::Spec.new do |s|

  s.name         = 'AWSS3'
  s.version      = '2.1.1'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/sdkforios'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.1.1'
  s.dependency 'Bolts', '~> 1.1.0'
  s.dependency 'Mantle', '~> 1.4'
  s.dependency 'TMCache', '~> 1.2.1'

  s.source_files = 'AWSS3/*.{h,m}'
  s.resources = ['AWSS3/Resources/*.json']
end
