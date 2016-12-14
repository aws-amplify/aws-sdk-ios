Pod::Spec.new do |s|
  s.name         = 'AWSLex'
  s.version      = '2.4.16'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache 2.0 AND AWS Customer Agreement'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.4.16'
  s.source_files = 'AWSLex/*.{h,m}', 'AWSLex/Bluefront/include/*.h'
  s.public_header_files = 'AWSLex/*.h'
  s.private_header_files = 'AWSLex/Bluefront/include/*.h'
  s.preserve_paths = 'AWSLex/Bluefront/include/*'
  s.vendored_libraries = 'AWSLex/Bluefront/libBlueAudioSourceiOS.a'
  s.xcconfig = {  'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/#{s.name}/AWSLex/Bluefront/include/**' 
  			   }
  s.resource_bundle = {  'AWSResources' => 'AWSResources/*' }
end
