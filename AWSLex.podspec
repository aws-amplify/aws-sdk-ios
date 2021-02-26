Pod::Spec.new do |s|
  s.name         = 'AWSLex'
  s.version      = '2.23.0'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache 2.0 AND AWS Customer Agreement'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.23.0'
  s.source_files = 'AWSLex/*.{h,m}', 'AWSLex/Bluefront/include/*.h'
  s.public_header_files = 'AWSLex/*.h'
  s.private_header_files = 'AWSLex/Bluefront/include/*.h'
  s.preserve_paths = 'AWSLex/Bluefront/include/*'
  s.vendored_libraries = 'AWSLex/Bluefront/libBlueAudioSourceiOS.a'
  s.resource_bundle = { 'AWSLex' => 'AWSLex/Media.xcassets' }

  # Exclude arm64 when building for simulator on Xcode 12
  s.pod_target_xcconfig = {
    # Xcode 12 Beta 3
    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A8169g' => 'arm64 arm64e armv7 armv7s armv6 armv8',

    # Xcode 12 beta 4
    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A8179i' => 'arm64 arm64e armv7 armv7s armv6 armv8',

    # Xcode 12 beta 5
    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A8189h' => 'arm64 arm64e armv7 armv7s armv6 armv8',

    # Xcode 12 beta 6
    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A8189n' => 'arm64 arm64e armv7 armv7s armv6 armv8',

    # Xcode 12 GM (12A7208)
    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A7208' => 'arm64 arm64e armv7 armv7s armv6 armv8',

    # Xcode 12 GM (12A7209)
    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A7209' => 'arm64 arm64e armv7 armv7s armv6 armv8',

    # Xcode 12.0.1 (12A7300)
    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A7300' => 'arm64 arm64e armv7 armv7s armv6 armv8',

    # Xcode 12.1 GM Seed (12A7403)
    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A7403' => 'arm64 arm64e armv7 armv7s armv6 armv8',

    # Xcode 12.2 Beta 2 (12B5025f)
    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12B5025f' => 'arm64 arm64e armv7 armv7s armv6 armv8',

    # Xcode 12.2 Beta 3 (12B5035g)
    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12B5035g' => 'arm64 arm64e armv7 armv7s armv6 armv8',

    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200' => '$(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_$(XCODE_PRODUCT_BUILD_VERSION))',

    'EXCLUDED_ARCHS' => '$(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT)__XCODE_$(XCODE_VERSION_MAJOR))'
  }
end
