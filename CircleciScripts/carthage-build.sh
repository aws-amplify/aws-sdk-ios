#!/usr/bin/env bash

################################################################################
# Workaround for https://github.com/Carthage/Carthage/issues/3019
# from https://github.com/Carthage/Carthage/issues/3019#issuecomment-665136323
#
# Update this to include new values as new Xcode 12 versions are released
################################################################################

# carthage-build.sh
# Usage example: ./carthage-build.sh --platform iOS

set -euo pipefail

xcconfig=$(mktemp /tmp/static.xcconfig.XXXXXX)
trap 'rm -f "$xcconfig"' INT TERM HUP EXIT

# For Xcode 12 make sure EXCLUDED_ARCHS is set to arm architectures otherwise
# the build will fail on lipo due to duplicate architectures.
# Xcode 12 Beta 3:
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A8169g = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12 beta 4
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A8179i = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12 beta 5
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A8189h = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12 beta 6
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A8189n = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12 GM (12A7208)
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A7208 = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12 GM (12A7209)
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A7209 = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12.0.1 (12A7300)
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A7300 = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12.1 GM Seed (12A7403)
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12A7403 = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12.2 Beta 2 (12B5025f)
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12B5025f = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12.2 Beta 3 (12B5035g)
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12B5035g = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12.2 (12B45b)
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12B45b = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12.3 (12C33)
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12C33 = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
# Xcode 12.4 (12D4e)
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_12D4e = arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig

echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200 = $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200__BUILD_$(XCODE_PRODUCT_BUILD_VERSION))' >> $xcconfig
echo 'EXCLUDED_ARCHS = $(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT)__XCODE_$(XCODE_VERSION_MAJOR))' >> $xcconfig

export XCODE_XCCONFIG_FILE="$xcconfig"
carthage build "$@"
