//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSNetworking.h"
#import "AWSSerialization.h"

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

@property (nonatomic, strong, readonly) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong, readonly) NSString *actionName;
@property (nonatomic, assign, readonly) Class outputClass;

- (instancetype)initWithJSONDefinition:(NSDictionary *)JSONDefinition
                            actionName:(NSString *)actionName
                           outputClass:(Class)outputClass;

@end

@interface AWSXMLResponseSerializer : NSObject <AWSHTTPURLResponseSerializer>

@property (nonatomic, assign) Class outputClass;

- (instancetype)initWithJSONDefinition:(NSDictionary *)JSONDefinition
                            actionName:(NSString *)actionName
                           outputClass:(Class)outputClass;

+ (NSMutableDictionary *)parseResponse:(NSHTTPURLResponse *)response
                                 rules:(AWSJSONDictionary *)rules
                        bodyDictionary:(NSMutableDictionary *)bodyDictionary
                                 error:(NSError *__autoreleasing *)error;
@end


