/**
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSLambda.h"
#import "AWSTestUtility.h"

@interface AWSLambdaInvokerTests : XCTestCase

@end

@implementation AWSLambdaInvokerTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testInvoke {
    AWSLambdaInvoker *lambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];

    AWSLambdaInvokerInvocationRequest *invocationRequest = [AWSLambdaInvokerInvocationRequest new];
    invocationRequest.functionName = @"helloWorldExample";
    invocationRequest.invocationType = AWSLambdaInvocationTypeRequestResponse;
    invocationRequest.logType = AWSLambdaLogTypeTail;
    invocationRequest.payload = @{@"key1" : @"value1",
                                  @"key2" : @"value2",
                                  @"key3" : @"value3",
                                  @"isError" : @NO};

    [[[lambdaInvoker invoke:invocationRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNotNil(task.result);
        XCTAssertTrue([task.result isKindOfClass:[AWSLambdaInvokerInvocationResponse class]]);
        AWSLambdaInvokerInvocationResponse *invocationResponse = task.result;
        XCTAssertTrue([invocationResponse.payload isKindOfClass:[NSDictionary class]]);
        NSDictionary *result = invocationResponse.payload;
        XCTAssertEqualObjects(result[@"key1"], @"value1");
        XCTAssertEqualObjects(result[@"key2"], @"value2");
        XCTAssertEqualObjects(result[@"key3"], @"value3");
        XCTAssertNotNil(invocationResponse.logResult);
        XCTAssertTrue([invocationResponse.logResult isKindOfClass:[NSString class]]);
        return nil;
    }] waitUntilFinished];
}

- (void)testInvokeError {
    AWSLambdaInvoker *lambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];
    AWSLambdaInvokerInvocationRequest *invocationRequest = [AWSLambdaInvokerInvocationRequest new];
    invocationRequest.functionName = @"helloWorldExample";
    invocationRequest.invocationType = AWSLambdaInvocationTypeRequestResponse;
    invocationRequest.payload = @{@"key1" : @"value1",
                                  @"key2" : @"value2",
                                  @"key3" : @"value3",
                                  @"isError" : @YES,
                                  @"errorName" : @"ErrorCode123"};

    [[[lambdaInvoker invoke:invocationRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        XCTAssertEqualObjects(task.error.domain, AWSLambdaInvokerErrorDomain);
        XCTAssertEqual(task.error.code, AWSLambdaInvokerErrorTypeFunctionError);
        XCTAssertEqualObjects(task.error.userInfo[AWSLambdaInvokerFunctionErrorKey], @"Handled");
        XCTAssertEqualObjects(task.error.userInfo[AWSLambdaInvokerErrorMessageKey], @"Invalid Request");
        return nil;
    }] waitUntilFinished];
}

- (void)testInvokeFunction {
    AWSLambdaInvoker *lambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];
    [[[lambdaInvoker invokeFunction:@"helloWorldExample"
                         JSONObject:@{@"key1" : @"value1",
                                      @"key2" : @"value2",
                                      @"key3" : @"value3",
                                      @"isError" : @NO}] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNotNil(task.result);
        XCTAssertTrue([task.result isKindOfClass:[NSDictionary class]]);
        NSDictionary *result = task.result;
        XCTAssertEqualObjects(result[@"key1"], @"value1");
        XCTAssertEqualObjects(result[@"key2"], @"value2");
        XCTAssertEqualObjects(result[@"key3"], @"value3");
        return nil;
    }] waitUntilFinished];
}

- (void)testInvokeFunctionError {
    AWSLambdaInvoker *lambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];
    [[[lambdaInvoker invokeFunction:@"helloWorldExample"
                         JSONObject:@{@"key1" : @"value1",
                                      @"key2" : @"value2",
                                      @"key3" : @"value3",
                                      @"isError" : @YES,
                                      @"errorName" : @"ErrorCode123",}] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        XCTAssertEqualObjects(task.error.domain, AWSLambdaInvokerErrorDomain);
        XCTAssertEqual(task.error.code, AWSLambdaInvokerErrorTypeFunctionError);
        return nil;
    }] waitUntilFinished];
}

@end
