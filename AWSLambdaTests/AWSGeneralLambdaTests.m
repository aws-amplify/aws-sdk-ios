/*
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
#import "AWSTestUtility.h"
#import "AWSLambda.h"

@interface AWSGeneralLambdaTests : XCTestCase

@end

@implementation AWSGeneralLambdaTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testLambdaConstructors";
    XCTAssertNotNil([AWSLambda defaultLambda]);
    XCTAssertEqual([[AWSLambda defaultLambda] class], [AWSLambda class]);
    XCTAssertNil([AWSLambda LambdaForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSLambda LambdaForKey:key]);
    XCTAssertEqual([[AWSLambda LambdaForKey:key] class], [AWSLambda class]);
    XCTAssertEqual([AWSLambda LambdaForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSLambda removeLambdaForKey:key];
    XCTAssertNil([AWSLambda LambdaForKey:key]);

}

- (void)testAddPermission {
    NSString *key = @"testAddPermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] addPermission:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testCreateEventSourceMapping {
    NSString *key = @"testCreateEventSourceMapping";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] createEventSourceMapping:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testCreateFunction {
    NSString *key = @"testCreateFunction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] createFunction:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testDeleteEventSourceMapping {
    NSString *key = @"testDeleteEventSourceMapping";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] deleteEventSourceMapping:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testDeleteFunction {
    NSString *key = @"testDeleteFunction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] deleteFunction:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testGetEventSourceMapping {
    NSString *key = @"testGetEventSourceMapping";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] getEventSourceMapping:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testGetFunction {
    NSString *key = @"testGetFunction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] getFunction:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testGetFunctionConfiguration {
    NSString *key = @"testGetFunctionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] getFunctionConfiguration:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testGetPolicy {
    NSString *key = @"testGetPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] getPolicy:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testInvoke {
    NSString *key = @"testInvoke";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] invoke:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testInvokeAsync {
    NSString *key = @"testInvokeAsync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] invokeAsync:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testListEventSourceMappings {
    NSString *key = @"testListEventSourceMappings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] listEventSourceMappings:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testListFunctions {
    NSString *key = @"testListFunctions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] listFunctions:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testRemovePermission {
    NSString *key = @"testRemovePermission";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] removePermission:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testUpdateEventSourceMapping {
    NSString *key = @"testUpdateEventSourceMapping";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] updateEventSourceMapping:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testUpdateFunctionCode {
    NSString *key = @"testUpdateFunctionCode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] updateFunctionCode:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

- (void)testUpdateFunctionConfiguration {
    NSString *key = @"testUpdateFunctionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSLambda registerLambdaWithConfiguration:configuration forKey:key];

    [[[[AWSLambda LambdaForKey:key] updateFunctionConfiguration:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSLambda removeLambdaForKey:key];
}

@end
