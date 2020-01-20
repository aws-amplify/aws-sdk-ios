//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSSageMakerRuntimeModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSageMakerRuntimeErrorDomain = @"com.amazonaws.AWSSageMakerRuntimeErrorDomain";

@implementation AWSSageMakerRuntimeInvokeEndpointInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accept" : @"Accept",
             @"body" : @"Body",
             @"contentType" : @"ContentType",
             @"customAttributes" : @"CustomAttributes",
             @"endpointName" : @"EndpointName",
             @"targetModel" : @"TargetModel",
             };
}

@end

@implementation AWSSageMakerRuntimeInvokeEndpointOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"contentType" : @"ContentType",
             @"customAttributes" : @"CustomAttributes",
             @"invokedProductionVariant" : @"InvokedProductionVariant",
             };
}

@end
