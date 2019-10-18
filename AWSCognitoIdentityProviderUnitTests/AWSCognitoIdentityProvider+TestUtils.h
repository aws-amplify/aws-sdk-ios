//
// Copyright 2014-2018 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import <Foundation/Foundation.h>

#import "AWSCognitoIdentityProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface AWSCognitoIdentityUserSessionToken(TestUtils)

// Exposes the `initWithToken:` initializer to allow Swift tests to validate behavior of
// Objective-C to Swift type conversion
-(instancetype) initWithToken:(NSString *)token;

@end

NS_ASSUME_NONNULL_END
