//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import <Foundation/Foundation.h>

@class AWSIoTMessage;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AWSIoTKeyChainAccessibility) {
    AWSIoTKeyChainAccessibilityWhenUnlocked = 1,
    AWSIoTKeyChainAccessibilityAfterFirstUnlock,
    AWSIoTKeyChainAccessibilityAlways __deprecated_enum_msg("Use an accessibility level that provides some user protection, such as AWSIoTKeyChainAccessibilityAfterFirstUnlock"),
    AWSIoTKeyChainAccessibilityWhenPasscodeSetThisDeviceOnly,
    AWSIoTKeyChainAccessibilityWhenUnlockedThisDeviceOnly,
    AWSIoTKeyChainAccessibilityAfterFirstUnlockThisDeviceOnly,
    AWSIoTKeyChainAccessibilityAlwaysThisDeviceOnly __deprecated_enum_msg("Use an accessibility level that provides some user protection, such as AWSIoTKeyChainAccessibilityAfterFirstUnlockThisDeviceOnly"),
};

NS_ASSUME_NONNULL_END
