Pod::Spec.new do |s|
  s.name         = 'AWSCognitoIdentityProviderASF'
  s.version      = '1.1.0'
  s.summary      = 'Amazon Cognito Identity Provider Advanced Security Features library (Beta)'

  s.description  = 'Amazon Cognito Identity Provider ASF provides the information necessary to support adaptive authentication'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/aws/aws-sdk-ios.git',
                     :tag => '2.14.2'}
  s.requires_arc = true
  s.public_header_files = 'AWSCognitoIdentityProviderASF/*.h'
  s.source_files = 'AWSCognitoIdentityProviderASF/**/*.{h,m,c}'
  s.private_header_files = 'AWSCognitoIdentityProviderASF/Internal/*.h'
  s.vendored_libraries = 'AWSCognitoIdentityProviderASF/Internal/libAWSCognitoIdentityProviderASFBinary.a'

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

    'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200' => '$(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_$(XCODE_PRODUCT_BUILD_VERSION))',

    'EXCLUDED_ARCHS' => '$(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT)__XCODE_$(XCODE_VERSION_MAJOR))'
  }
end
