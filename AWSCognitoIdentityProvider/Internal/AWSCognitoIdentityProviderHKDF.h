//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface AWSCognitoIdentityProviderHKDF : NSObject
+ (NSData*)deriveKeyWithInputKeyingMaterial:(NSData*)ikm salt:(NSData*)salt info:(NSData*)info outputLength:(NSUInteger)outputLength;
@end
NS_ASSUME_NONNULL_END
