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

- (void)testClockSkewLambda {
    [AWSTestUtility setupSwizzling];
    
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];
    
    AWSLambdaInvoker *lambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];
    XCTAssertNotNil(lambdaInvoker);
    
    AWSLambdaInvokerInvocationRequest *invocationRequest = [AWSLambdaInvokerInvocationRequest new];
    invocationRequest.functionName = @"helloWorldExample";
    invocationRequest.invocationType = AWSLambdaInvocationTypeRequestResponse;
    invocationRequest.logType = AWSLambdaLogTypeTail;
    invocationRequest.payload = @{@"key1" : @"value1",
                                  @"key2" : @"value2",
                                  @"key3" : @"value3",
                                  @"isError" : @NO};
    
    [[[lambdaInvoker invoke:invocationRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
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
    
    [AWSTestUtility revertSwizzling];
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

    [[[lambdaInvoker invoke:invocationRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
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

- (void)testInvokeWithCompletionHandler {
    AWSLambdaInvoker *lambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];

    AWSLambdaInvokerInvocationRequest *invocationRequest = [AWSLambdaInvokerInvocationRequest new];
    invocationRequest.functionName = @"helloWorldExample";
    invocationRequest.invocationType = AWSLambdaInvocationTypeRequestResponse;
    invocationRequest.logType = AWSLambdaLogTypeTail;
    invocationRequest.payload = @{@"key1" : @"value1",
                                  @"key2" : @"value2",
                                  @"key3" : @"value3",
                                  @"isError" : @NO};

    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion handler called."];

    [lambdaInvoker invoke:invocationRequest completionHandler:^(AWSLambdaInvokerInvocationResponse * _Nullable response, NSError * _Nullable error) {
        XCTAssertNil(error);
        XCTAssertNotNil(response);
        XCTAssertTrue([response isKindOfClass:[AWSLambdaInvokerInvocationResponse class]]);
        XCTAssertTrue([response.payload isKindOfClass:[NSDictionary class]]);
        NSDictionary *result = response.payload;
        XCTAssertEqualObjects(result[@"key1"], @"value1");
        XCTAssertEqualObjects(result[@"key2"], @"value2");
        XCTAssertEqualObjects(result[@"key3"], @"value3");
        XCTAssertNotNil(response.logResult);
        XCTAssertTrue([response.logResult isKindOfClass:[NSString class]]);

        [expectation fulfill];
    }];

    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
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

    [[[lambdaInvoker invoke:invocationRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
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
                                      @"isError" : @NO}] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        XCTAssertTrue([task.result isKindOfClass:[NSDictionary class]]);
        NSDictionary *result = task.result;
        XCTAssertEqualObjects(result[@"key1"], @"value1");
        XCTAssertEqualObjects(result[@"key2"], @"value2");
        XCTAssertEqualObjects(result[@"key3"], @"value3");
        return nil;
    }] waitUntilFinished];
}

- (void)testInvokeFunctionWithCompletionHandler {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion handler called."];

    AWSLambdaInvoker *lambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];
    [lambdaInvoker invokeFunction:@"helloWorldExample"
                       JSONObject:@{@"key1" : @"value1",
                                    @"key2" : @"value2",
                                    @"key3" : @"value3",
                                    @"isError" : @NO}
                completionHandler:^(id  _Nullable response, NSError * _Nullable error) {
                    XCTAssertNil(error);
                    XCTAssertNotNil(response);
                    XCTAssertTrue([response isKindOfClass:[NSDictionary class]]);
                    NSDictionary *result = response;
                    XCTAssertEqualObjects(result[@"key1"], @"value1");
                    XCTAssertEqualObjects(result[@"key2"], @"value2");
                    XCTAssertEqualObjects(result[@"key3"], @"value3");

                    [expectation fulfill];
                }];

    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

- (void)testInvokeFunction2 {
    AWSLambdaInvoker *lambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];
    
    NSDictionary *jsonObject = @{@"firstName" : NSStringFromSelector(_cmd)};
    [[[lambdaInvoker invokeFunction:@"lambdaDebugging" JSONObject:jsonObject] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        XCTAssertTrue([task.result isKindOfClass:[NSDictionary class]]);
        NSDictionary *result = task.result;
        NSString *expectedString = [NSString stringWithFormat:@"Hello %@",NSStringFromSelector(_cmd)];
        XCTAssertEqualObjects(expectedString,result[@"message"]);
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
                                      @"errorName" : @"ErrorCode123",}] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.result);
        XCTAssertEqualObjects(task.error.domain, AWSLambdaInvokerErrorDomain);
        XCTAssertEqual(task.error.code, AWSLambdaInvokerErrorTypeFunctionError);
        return nil;
    }] waitUntilFinished];
}

- (void)testInvokeWithVersion {
    AWSLambdaInvoker *lambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];

    AWSLambdaInvokerInvocationRequest *invocationRequest = [AWSLambdaInvokerInvocationRequest new];
    invocationRequest.functionName = @"helloWorldExample";
    invocationRequest.invocationType = AWSLambdaInvocationTypeRequestResponse;
    invocationRequest.logType = AWSLambdaLogTypeTail;
    invocationRequest.payload = @{@"key1" : @"value1",
                                  @"key2" : @"value2",
                                  @"key3" : @"value3",
                                  @"isError" : @NO};
    invocationRequest.qualifier = @"2";

    [[[lambdaInvoker invoke:invocationRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        XCTAssertTrue([task.result isKindOfClass:[AWSLambdaInvokerInvocationResponse class]]);
        AWSLambdaInvokerInvocationResponse *invocationResponse = task.result;
        XCTAssertTrue([invocationResponse.payload isKindOfClass:[NSDictionary class]]);
        NSDictionary *result = invocationResponse.payload;
        XCTAssertEqualObjects(result[@"version"], @"1");
        XCTAssertNotNil(invocationResponse.logResult);
        XCTAssertTrue([invocationResponse.logResult isKindOfClass:[NSString class]]);
        return nil;
    }] waitUntilFinished];
}

- (void)testInvokeWithVersionAlias {
    AWSLambdaInvoker *lambdaInvoker = [AWSLambdaInvoker defaultLambdaInvoker];

    AWSLambdaInvokerInvocationRequest *invocationRequest = [AWSLambdaInvokerInvocationRequest new];
    invocationRequest.functionName = @"helloWorldExample";
    invocationRequest.invocationType = AWSLambdaInvocationTypeRequestResponse;
    invocationRequest.logType = AWSLambdaLogTypeTail;
    invocationRequest.payload = @{@"key1" : @"value1",
                                  @"key2" : @"value2",
                                  @"key3" : @"value3",
                                  @"isError" : @NO};
    invocationRequest.qualifier = @"version2";

    [[[lambdaInvoker invoke:invocationRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        XCTAssertTrue([task.result isKindOfClass:[AWSLambdaInvokerInvocationResponse class]]);
        AWSLambdaInvokerInvocationResponse *invocationResponse = task.result;
        XCTAssertTrue([invocationResponse.payload isKindOfClass:[NSDictionary class]]);
        NSDictionary *result = invocationResponse.payload;
        XCTAssertEqualObjects(result[@"version"], @"1");
        XCTAssertNotNil(invocationResponse.logResult);
        XCTAssertTrue([invocationResponse.logResult isKindOfClass:[NSString class]]);
        return nil;
    }] waitUntilFinished];
}

@end
