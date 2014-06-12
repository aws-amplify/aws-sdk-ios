# How to Use Cocoapods Locally

1. Create a project. Define the containing directory path as `APP-PATH`. **NOTE**: Delete `Podfile`, `Podfile.lock`, `Pod` directory and `.xcworkspace` file under `APP-PATH` if they already exist. 

1. Download the AWS SDK for iOS v2. Define the containing directory path as `IOS-SDK-PATH`.

1. Create Podfile in `APP-PATH`. The content of the file is:

		pod 'AWSiOSSDKv2', :path => "IOS-SDK-PATH" 

1. Create `AWSiOSSDKv2.podspec` at `APP-PATH`. The content of the file is:

		Pod::Spec.new do |s|
		
		  s.name         = 'AWSiOSSDKv2'
		  s.version      = '2.0.0'
		  s.summary      = 'Amazon Web Services SDK for iOS.'
		
		  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'
		
		  s.homepage     = 'http://aws.amazon.com/sdkforios'
		  s.license      = 'Apache License, Version 2.0'
		  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
		  s.platform     = :ios, '7.0'
		  s.source       = { :path => 'IOS-SDK-PATH'}
		  s.frameworks   = 'UIKit','Foundation'
		  s.library      = 'sqlite3'
		  s.source_files = '**/*.{h,m}'
		  s.exclude_files = 'AWSiOSSDKTests/*.{h,m}'
		
		  s.dependency 'Bolts', '~> 1.0.0'
		  s.dependency 'Mantle', '~> 1.4.1'
		  s.dependency 'TMCache', '~> 1.2.0'
		  s.dependency 'CSURITemplate', '~> 0.3.0'
		  s.dependency 'XMLDictionary', '~> 1.4.0'
		  s.dependency 'UICKeyChainStore', '~> 1.0.5'
		
		  s.requires_arc = true
		end

1. Run the following shell command in `APP-PATH`:

		pod install

