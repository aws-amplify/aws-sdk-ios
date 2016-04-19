//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License").
// You may not use this file except in compliance with the
// License. A copy of the License is located at
//
//     http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, express or implied. See the License
// for the specific language governing permissions and
// limitations under the License.
//

#import <Foundation/Foundation.h>

@class AWSJKBigInteger;

NS_ASSUME_NONNULL_BEGIN

@interface NSData (NSDataBigInteger)
+ (NSData*) aws_dataWithBigInteger:(AWSJKBigInteger *)bigInteger;
+ (NSData*) aws_dataWithSignedBigInteger:(AWSJKBigInteger *)bigInteger;
+ (NSData*) aws_dataFromHexString:(NSString*)hexString;
- (AWSJKBigInteger *)aws_toBigInt;
void awsbigint_loadBigInt();
@end

NS_ASSUME_NONNULL_END
