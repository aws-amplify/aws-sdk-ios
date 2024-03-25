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

#import <XCTest/XCTest.h>
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSSageMakerRuntimeModel.h"

@interface AWSSageMakerRuntimeNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSSageMakerRuntimeInvokeEndpointAsyncInput API_AVAILABLE(ios(11));
- (void) test_AWSSageMakerRuntimeInvokeEndpointAsyncOutput API_AVAILABLE(ios(11));
- (void) test_AWSSageMakerRuntimeInvokeEndpointInput API_AVAILABLE(ios(11));
- (void) test_AWSSageMakerRuntimeInvokeEndpointOutput API_AVAILABLE(ios(11));
- (void) test_AWSSageMakerRuntimeInvokeEndpointWithResponseStreamInput API_AVAILABLE(ios(11));
- (void) test_AWSSageMakerRuntimeInvokeEndpointWithResponseStreamOutput API_AVAILABLE(ios(11));
- (void) test_AWSSageMakerRuntimePayloadPart API_AVAILABLE(ios(11));
- (void) test_AWSSageMakerRuntimeResponseStream API_AVAILABLE(ios(11));

@end

@implementation AWSSageMakerRuntimeNSSecureCodingTests

- (void) test_AWSSageMakerRuntimeInvokeEndpointAsyncInput {
    [self validateSecureCodingForClass:[AWSSageMakerRuntimeInvokeEndpointAsyncInput class]];
}

- (void) test_AWSSageMakerRuntimeInvokeEndpointAsyncOutput {
    [self validateSecureCodingForClass:[AWSSageMakerRuntimeInvokeEndpointAsyncOutput class]];
}

- (void) test_AWSSageMakerRuntimeInvokeEndpointInput {
    [self validateSecureCodingForClass:[AWSSageMakerRuntimeInvokeEndpointInput class]];
}

- (void) test_AWSSageMakerRuntimeInvokeEndpointOutput {
    [self validateSecureCodingForClass:[AWSSageMakerRuntimeInvokeEndpointOutput class]];
}

- (void) test_AWSSageMakerRuntimeInvokeEndpointWithResponseStreamInput {
    [self validateSecureCodingForClass:[AWSSageMakerRuntimeInvokeEndpointWithResponseStreamInput class]];
}

- (void) test_AWSSageMakerRuntimeInvokeEndpointWithResponseStreamOutput {
    [self validateSecureCodingForClass:[AWSSageMakerRuntimeInvokeEndpointWithResponseStreamOutput class]];
}

- (void) test_AWSSageMakerRuntimePayloadPart {
    [self validateSecureCodingForClass:[AWSSageMakerRuntimePayloadPart class]];
}

- (void) test_AWSSageMakerRuntimeResponseStream {
    [self validateSecureCodingForClass:[AWSSageMakerRuntimeResponseStream class]];
}

@end

