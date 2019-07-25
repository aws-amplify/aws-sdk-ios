Pod::Spec.new do |s|
  s.name         = 'AWSTranscribeStreaming'
  s.version      = '2.10.0'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :branch => 'palpatim/finish-transcribe-wss'}
                      # Restore this after development of TranscribeStreaming WSS is finished, before
                      # merging to the /develop branch
                      # :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.10.0'
  s.source_files = 'AWSTranscribeStreaming/*.{h,m}', 'AWSTranscribeStreaming/**/*.{h,m}', 'AWSIoT/Internal/SocketRocket/*.{h,m}'
  s.private_header_files = 'AWSTranscribeStreaming/Internal/*.h', 'AWSIoT/Internal/SocketRocket/*.h'
end
