//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSCore/AWSCore.h>
#import "AWSAPIGatewayModel.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSAPIGatewayErrorDomain;

FOUNDATION_EXPORT NSString *const AWSAPIGatewayErrorHTTPBodyKey;
FOUNDATION_EXPORT NSString *const AWSAPIGatewayErrorHTTPHeaderFieldsKey;

typedef NS_ENUM(NSInteger, AWSAPIGatewayErrorType) {
    AWSAPIGatewayErrorTypeUnknown,
    AWSAPIGatewayErrorTypeClient,
    AWSAPIGatewayErrorTypeService,
};

@class AWSServiceConfiguration;

@interface AWSAPIGatewayClient : NSObject

@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@property (nonatomic, strong, nullable) NSString *APIKey;



/**
 *  The invoke method can be used to invoke an `AWS API Gateway` API endpoint with a `AWSAPIGatewayRequest` object.
 *
 *  @param apiRequest An `AWSAPIGatewayRequest` object.
 *
 *  @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSAPIGatewayResponse`. On failed execution, `task.error` may contain an `NSError`.
 */
- (AWSTask<AWSAPIGatewayResponse *> *)invoke:(AWSAPIGatewayRequest *)apiRequest;

@end

NS_ASSUME_NONNULL_END
