//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@implementation AWSSageMakerRuntimeInvokeEndpointAsyncInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accept" : @"Accept",
             @"contentType" : @"ContentType",
             @"customAttributes" : @"CustomAttributes",
             @"endpointName" : @"EndpointName",
             @"inferenceId" : @"InferenceId",
             @"inputLocation" : @"InputLocation",
             @"invocationTimeoutSeconds" : @"InvocationTimeoutSeconds",
             @"requestTTLSeconds" : @"RequestTTLSeconds",
             };
}

@end

@implementation AWSSageMakerRuntimeInvokeEndpointAsyncOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureLocation" : @"FailureLocation",
             @"inferenceId" : @"InferenceId",
             @"outputLocation" : @"OutputLocation",
             };
}

@end

@implementation AWSSageMakerRuntimeInvokeEndpointInput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accept" : @"Accept",
             @"body" : @"Body",
             @"contentType" : @"ContentType",
             @"customAttributes" : @"CustomAttributes",
             @"enableExplanations" : @"EnableExplanations",
             @"endpointName" : @"EndpointName",
             @"inferenceId" : @"InferenceId",
             @"targetContainerHostname" : @"TargetContainerHostname",
             @"targetModel" : @"TargetModel",
             @"targetVariant" : @"TargetVariant",
             };
}

@end

@implementation AWSSageMakerRuntimeInvokeEndpointOutput

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"contentType" : @"ContentType",
             @"customAttributes" : @"CustomAttributes",
             @"invokedProductionVariant" : @"InvokedProductionVariant",
             };
}

@end
