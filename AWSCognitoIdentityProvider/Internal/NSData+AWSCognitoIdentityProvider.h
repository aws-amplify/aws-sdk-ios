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
+ (NSData*) aws_dataFromHexString:(NSString*)hexString;
- (AWSJKBigInteger *)aws_toBigInt;
void awsbigint_loadBigInt(void);
@end

NS_ASSUME_NONNULL_END
