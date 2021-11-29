//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#import <Foundation/Foundation.h>

@class AWSJKBigInteger;

NS_ASSUME_NONNULL_BEGIN

@interface NSData (NSDataBigInteger)
+ (NSData*) aws_dataWithBigInteger:(AWSJKBigInteger *)bigInteger;
+ (NSData*) aws_dataWithSignedBigInteger:(AWSJKBigInteger *)bigInteger;
/*!
 @warning This function is deprecated and will be removed in an upcoming minor
 version of the SDK. You should use aws_dataFromHexidecimalString instead.
 @deprecated Use aws_dataFromHexidecimalString instead.
 */
+ (NSData*) aws_dataFromHexString:(NSString*)hexString DEPRECATED_MSG_ATTRIBUTE("Use aws_dataFromHexidecimalString instead.");
+ (nullable NSData*) aws_dataFromHexidecimalString:(NSString*)hexString;
- (AWSJKBigInteger *)aws_toBigInt;
void awsbigint_loadBigInt(void);
@end

NS_ASSUME_NONNULL_END
