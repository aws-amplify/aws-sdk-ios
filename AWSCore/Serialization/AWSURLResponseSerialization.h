/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>

#import "AWSNetworking.h"

FOUNDATION_EXPORT NSString *const AWSGeneralErrorDomain;

typedef NS_ENUM(NSInteger, AWSGeneralErrorType) {
    AWSGeneralErrorUnknown,
    AWSGeneralErrorRequestTimeTooSkewed,
    AWSGeneralErrorInvalidSignatureException,
    AWSGeneralErrorSignatureDoesNotMatch,
    AWSGeneralErrorRequestExpired,
    AWSGeneralErrorAuthFailure
};

@interface AWSJSONResponseSerializer : NSObject <AWSHTTPURLResponseSerializer>

@property (nonatomic, assign) Class outputClass;

- (instancetype)initWithOutputClass:(Class)outputClass;

+ (instancetype)serializerWithResource:(NSString *)resource actionName:(NSString *)actionName;

@end

@interface AWSXMLResponseSerializer : NSObject <AWSHTTPURLResponseSerializer>

+ (instancetype)serializerWithResource:(NSString *)resource actionName:(NSString *)actionName;

@end


