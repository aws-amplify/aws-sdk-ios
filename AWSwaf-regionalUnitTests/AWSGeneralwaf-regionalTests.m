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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "AWSTestUtility.h"
#import "AWSwaf-regionalService.h"

static id mockNetworking = nil;

@interface AWSGeneralwaf-regionalTests : XCTestCase

@end

@implementation AWSGeneralwaf-regionalTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupFakeCognitoCredentialsProvider];

    mockNetworking = OCMClassMock([AWSNetworking class]);
    AWSTask *errorTask = [AWSTask taskWithError:[NSError errorWithDomain:@"OCMockExpectedNetworkingError" code:8848 userInfo:nil]];
    OCMStub([mockNetworking sendRequest:[OCMArg isKindOfClass:[AWSNetworkingRequest class]]]).andReturn(errorTask);
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testwaf-regionalConstructors";
    XCTAssertNotNil([AWSwaf-regional defaultwaf-regional]);
    XCTAssertEqual([[AWSwaf-regional defaultwaf-regional] class], [AWSwaf-regional class]);
    XCTAssertNil([AWSwaf-regional waf-regionalForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSwaf-regional waf-regionalForKey:key]);
    XCTAssertEqual([[AWSwaf-regional waf-regionalForKey:key] class], [AWSwaf-regional class]);
    XCTAssertEqual([AWSwaf-regional waf-regionalForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSwaf-regional removewaf-regionalForKey:key];
    XCTAssertNil([AWSwaf-regional waf-regionalForKey:key]);

}

- (void)testAssociateWebACL {
    NSString *key = @"testAssociateWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] associateWebACL:[AWSwaf-regionalAssociateWebACLRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testAssociateWebACLCompletionHandler {
    NSString *key = @"testAssociateWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] associateWebACL:[AWSwaf-regionalAssociateWebACLRequest new] completionHandler:^(AWSwaf-regionalAssociateWebACLResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateByteMatchSet {
    NSString *key = @"testCreateByteMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createByteMatchSet:[AWSwaf-regionalCreateByteMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateByteMatchSetCompletionHandler {
    NSString *key = @"testCreateByteMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createByteMatchSet:[AWSwaf-regionalCreateByteMatchSetRequest new] completionHandler:^(AWSwaf-regionalCreateByteMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateGeoMatchSet {
    NSString *key = @"testCreateGeoMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createGeoMatchSet:[AWSwaf-regionalCreateGeoMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateGeoMatchSetCompletionHandler {
    NSString *key = @"testCreateGeoMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createGeoMatchSet:[AWSwaf-regionalCreateGeoMatchSetRequest new] completionHandler:^(AWSwaf-regionalCreateGeoMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateIPSet {
    NSString *key = @"testCreateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createIPSet:[AWSwaf-regionalCreateIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateIPSetCompletionHandler {
    NSString *key = @"testCreateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createIPSet:[AWSwaf-regionalCreateIPSetRequest new] completionHandler:^(AWSwaf-regionalCreateIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateRateBasedRule {
    NSString *key = @"testCreateRateBasedRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createRateBasedRule:[AWSwaf-regionalCreateRateBasedRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateRateBasedRuleCompletionHandler {
    NSString *key = @"testCreateRateBasedRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createRateBasedRule:[AWSwaf-regionalCreateRateBasedRuleRequest new] completionHandler:^(AWSwaf-regionalCreateRateBasedRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateRegexMatchSet {
    NSString *key = @"testCreateRegexMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createRegexMatchSet:[AWSwaf-regionalCreateRegexMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateRegexMatchSetCompletionHandler {
    NSString *key = @"testCreateRegexMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createRegexMatchSet:[AWSwaf-regionalCreateRegexMatchSetRequest new] completionHandler:^(AWSwaf-regionalCreateRegexMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateRegexPatternSet {
    NSString *key = @"testCreateRegexPatternSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createRegexPatternSet:[AWSwaf-regionalCreateRegexPatternSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateRegexPatternSetCompletionHandler {
    NSString *key = @"testCreateRegexPatternSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createRegexPatternSet:[AWSwaf-regionalCreateRegexPatternSetRequest new] completionHandler:^(AWSwaf-regionalCreateRegexPatternSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateRule {
    NSString *key = @"testCreateRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createRule:[AWSwaf-regionalCreateRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateRuleCompletionHandler {
    NSString *key = @"testCreateRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createRule:[AWSwaf-regionalCreateRuleRequest new] completionHandler:^(AWSwaf-regionalCreateRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateRuleGroup {
    NSString *key = @"testCreateRuleGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createRuleGroup:[AWSwaf-regionalCreateRuleGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateRuleGroupCompletionHandler {
    NSString *key = @"testCreateRuleGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createRuleGroup:[AWSwaf-regionalCreateRuleGroupRequest new] completionHandler:^(AWSwaf-regionalCreateRuleGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateSizeConstraintSet {
    NSString *key = @"testCreateSizeConstraintSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createSizeConstraintSet:[AWSwaf-regionalCreateSizeConstraintSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateSizeConstraintSetCompletionHandler {
    NSString *key = @"testCreateSizeConstraintSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createSizeConstraintSet:[AWSwaf-regionalCreateSizeConstraintSetRequest new] completionHandler:^(AWSwaf-regionalCreateSizeConstraintSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateSqlInjectionMatchSet {
    NSString *key = @"testCreateSqlInjectionMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createSqlInjectionMatchSet:[AWSwaf-regionalCreateSqlInjectionMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateSqlInjectionMatchSetCompletionHandler {
    NSString *key = @"testCreateSqlInjectionMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createSqlInjectionMatchSet:[AWSwaf-regionalCreateSqlInjectionMatchSetRequest new] completionHandler:^(AWSwaf-regionalCreateSqlInjectionMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateWebACL {
    NSString *key = @"testCreateWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createWebACL:[AWSwaf-regionalCreateWebACLRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateWebACLCompletionHandler {
    NSString *key = @"testCreateWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createWebACL:[AWSwaf-regionalCreateWebACLRequest new] completionHandler:^(AWSwaf-regionalCreateWebACLResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateWebACLMigrationStack {
    NSString *key = @"testCreateWebACLMigrationStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createWebACLMigrationStack:[AWSwaf-regionalCreateWebACLMigrationStackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateWebACLMigrationStackCompletionHandler {
    NSString *key = @"testCreateWebACLMigrationStack";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createWebACLMigrationStack:[AWSwaf-regionalCreateWebACLMigrationStackRequest new] completionHandler:^(AWSwaf-regionalCreateWebACLMigrationStackResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateXssMatchSet {
    NSString *key = @"testCreateXssMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] createXssMatchSet:[AWSwaf-regionalCreateXssMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testCreateXssMatchSetCompletionHandler {
    NSString *key = @"testCreateXssMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] createXssMatchSet:[AWSwaf-regionalCreateXssMatchSetRequest new] completionHandler:^(AWSwaf-regionalCreateXssMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteByteMatchSet {
    NSString *key = @"testDeleteByteMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteByteMatchSet:[AWSwaf-regionalDeleteByteMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteByteMatchSetCompletionHandler {
    NSString *key = @"testDeleteByteMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteByteMatchSet:[AWSwaf-regionalDeleteByteMatchSetRequest new] completionHandler:^(AWSwaf-regionalDeleteByteMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteGeoMatchSet {
    NSString *key = @"testDeleteGeoMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteGeoMatchSet:[AWSwaf-regionalDeleteGeoMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteGeoMatchSetCompletionHandler {
    NSString *key = @"testDeleteGeoMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteGeoMatchSet:[AWSwaf-regionalDeleteGeoMatchSetRequest new] completionHandler:^(AWSwaf-regionalDeleteGeoMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteIPSet {
    NSString *key = @"testDeleteIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteIPSet:[AWSwaf-regionalDeleteIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteIPSetCompletionHandler {
    NSString *key = @"testDeleteIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteIPSet:[AWSwaf-regionalDeleteIPSetRequest new] completionHandler:^(AWSwaf-regionalDeleteIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteLoggingConfiguration {
    NSString *key = @"testDeleteLoggingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteLoggingConfiguration:[AWSwaf-regionalDeleteLoggingConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteLoggingConfigurationCompletionHandler {
    NSString *key = @"testDeleteLoggingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteLoggingConfiguration:[AWSwaf-regionalDeleteLoggingConfigurationRequest new] completionHandler:^(AWSwaf-regionalDeleteLoggingConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeletePermissionPolicy {
    NSString *key = @"testDeletePermissionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deletePermissionPolicy:[AWSwaf-regionalDeletePermissionPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeletePermissionPolicyCompletionHandler {
    NSString *key = @"testDeletePermissionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deletePermissionPolicy:[AWSwaf-regionalDeletePermissionPolicyRequest new] completionHandler:^(AWSwaf-regionalDeletePermissionPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteRateBasedRule {
    NSString *key = @"testDeleteRateBasedRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteRateBasedRule:[AWSwaf-regionalDeleteRateBasedRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteRateBasedRuleCompletionHandler {
    NSString *key = @"testDeleteRateBasedRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteRateBasedRule:[AWSwaf-regionalDeleteRateBasedRuleRequest new] completionHandler:^(AWSwaf-regionalDeleteRateBasedRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteRegexMatchSet {
    NSString *key = @"testDeleteRegexMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteRegexMatchSet:[AWSwaf-regionalDeleteRegexMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteRegexMatchSetCompletionHandler {
    NSString *key = @"testDeleteRegexMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteRegexMatchSet:[AWSwaf-regionalDeleteRegexMatchSetRequest new] completionHandler:^(AWSwaf-regionalDeleteRegexMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteRegexPatternSet {
    NSString *key = @"testDeleteRegexPatternSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteRegexPatternSet:[AWSwaf-regionalDeleteRegexPatternSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteRegexPatternSetCompletionHandler {
    NSString *key = @"testDeleteRegexPatternSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteRegexPatternSet:[AWSwaf-regionalDeleteRegexPatternSetRequest new] completionHandler:^(AWSwaf-regionalDeleteRegexPatternSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteRule {
    NSString *key = @"testDeleteRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteRule:[AWSwaf-regionalDeleteRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteRuleCompletionHandler {
    NSString *key = @"testDeleteRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteRule:[AWSwaf-regionalDeleteRuleRequest new] completionHandler:^(AWSwaf-regionalDeleteRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteRuleGroup {
    NSString *key = @"testDeleteRuleGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteRuleGroup:[AWSwaf-regionalDeleteRuleGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteRuleGroupCompletionHandler {
    NSString *key = @"testDeleteRuleGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteRuleGroup:[AWSwaf-regionalDeleteRuleGroupRequest new] completionHandler:^(AWSwaf-regionalDeleteRuleGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteSizeConstraintSet {
    NSString *key = @"testDeleteSizeConstraintSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteSizeConstraintSet:[AWSwaf-regionalDeleteSizeConstraintSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteSizeConstraintSetCompletionHandler {
    NSString *key = @"testDeleteSizeConstraintSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteSizeConstraintSet:[AWSwaf-regionalDeleteSizeConstraintSetRequest new] completionHandler:^(AWSwaf-regionalDeleteSizeConstraintSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteSqlInjectionMatchSet {
    NSString *key = @"testDeleteSqlInjectionMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteSqlInjectionMatchSet:[AWSwaf-regionalDeleteSqlInjectionMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteSqlInjectionMatchSetCompletionHandler {
    NSString *key = @"testDeleteSqlInjectionMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteSqlInjectionMatchSet:[AWSwaf-regionalDeleteSqlInjectionMatchSetRequest new] completionHandler:^(AWSwaf-regionalDeleteSqlInjectionMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteWebACL {
    NSString *key = @"testDeleteWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteWebACL:[AWSwaf-regionalDeleteWebACLRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteWebACLCompletionHandler {
    NSString *key = @"testDeleteWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteWebACL:[AWSwaf-regionalDeleteWebACLRequest new] completionHandler:^(AWSwaf-regionalDeleteWebACLResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteXssMatchSet {
    NSString *key = @"testDeleteXssMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] deleteXssMatchSet:[AWSwaf-regionalDeleteXssMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDeleteXssMatchSetCompletionHandler {
    NSString *key = @"testDeleteXssMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] deleteXssMatchSet:[AWSwaf-regionalDeleteXssMatchSetRequest new] completionHandler:^(AWSwaf-regionalDeleteXssMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDisassociateWebACL {
    NSString *key = @"testDisassociateWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] disassociateWebACL:[AWSwaf-regionalDisassociateWebACLRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testDisassociateWebACLCompletionHandler {
    NSString *key = @"testDisassociateWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] disassociateWebACL:[AWSwaf-regionalDisassociateWebACLRequest new] completionHandler:^(AWSwaf-regionalDisassociateWebACLResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetByteMatchSet {
    NSString *key = @"testGetByteMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getByteMatchSet:[AWSwaf-regionalGetByteMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetByteMatchSetCompletionHandler {
    NSString *key = @"testGetByteMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getByteMatchSet:[AWSwaf-regionalGetByteMatchSetRequest new] completionHandler:^(AWSwaf-regionalGetByteMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetChangeToken {
    NSString *key = @"testGetChangeToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getChangeToken:[AWSwaf-regionalGetChangeTokenRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetChangeTokenCompletionHandler {
    NSString *key = @"testGetChangeToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getChangeToken:[AWSwaf-regionalGetChangeTokenRequest new] completionHandler:^(AWSwaf-regionalGetChangeTokenResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetChangeTokenStatus {
    NSString *key = @"testGetChangeTokenStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getChangeTokenStatus:[AWSwaf-regionalGetChangeTokenStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetChangeTokenStatusCompletionHandler {
    NSString *key = @"testGetChangeTokenStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getChangeTokenStatus:[AWSwaf-regionalGetChangeTokenStatusRequest new] completionHandler:^(AWSwaf-regionalGetChangeTokenStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetGeoMatchSet {
    NSString *key = @"testGetGeoMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getGeoMatchSet:[AWSwaf-regionalGetGeoMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetGeoMatchSetCompletionHandler {
    NSString *key = @"testGetGeoMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getGeoMatchSet:[AWSwaf-regionalGetGeoMatchSetRequest new] completionHandler:^(AWSwaf-regionalGetGeoMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetIPSet {
    NSString *key = @"testGetIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getIPSet:[AWSwaf-regionalGetIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetIPSetCompletionHandler {
    NSString *key = @"testGetIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getIPSet:[AWSwaf-regionalGetIPSetRequest new] completionHandler:^(AWSwaf-regionalGetIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetLoggingConfiguration {
    NSString *key = @"testGetLoggingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getLoggingConfiguration:[AWSwaf-regionalGetLoggingConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetLoggingConfigurationCompletionHandler {
    NSString *key = @"testGetLoggingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getLoggingConfiguration:[AWSwaf-regionalGetLoggingConfigurationRequest new] completionHandler:^(AWSwaf-regionalGetLoggingConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetPermissionPolicy {
    NSString *key = @"testGetPermissionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getPermissionPolicy:[AWSwaf-regionalGetPermissionPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetPermissionPolicyCompletionHandler {
    NSString *key = @"testGetPermissionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getPermissionPolicy:[AWSwaf-regionalGetPermissionPolicyRequest new] completionHandler:^(AWSwaf-regionalGetPermissionPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRateBasedRule {
    NSString *key = @"testGetRateBasedRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getRateBasedRule:[AWSwaf-regionalGetRateBasedRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRateBasedRuleCompletionHandler {
    NSString *key = @"testGetRateBasedRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getRateBasedRule:[AWSwaf-regionalGetRateBasedRuleRequest new] completionHandler:^(AWSwaf-regionalGetRateBasedRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRateBasedRuleManagedKeys {
    NSString *key = @"testGetRateBasedRuleManagedKeys";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getRateBasedRuleManagedKeys:[AWSwaf-regionalGetRateBasedRuleManagedKeysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRateBasedRuleManagedKeysCompletionHandler {
    NSString *key = @"testGetRateBasedRuleManagedKeys";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getRateBasedRuleManagedKeys:[AWSwaf-regionalGetRateBasedRuleManagedKeysRequest new] completionHandler:^(AWSwaf-regionalGetRateBasedRuleManagedKeysResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRegexMatchSet {
    NSString *key = @"testGetRegexMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getRegexMatchSet:[AWSwaf-regionalGetRegexMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRegexMatchSetCompletionHandler {
    NSString *key = @"testGetRegexMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getRegexMatchSet:[AWSwaf-regionalGetRegexMatchSetRequest new] completionHandler:^(AWSwaf-regionalGetRegexMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRegexPatternSet {
    NSString *key = @"testGetRegexPatternSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getRegexPatternSet:[AWSwaf-regionalGetRegexPatternSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRegexPatternSetCompletionHandler {
    NSString *key = @"testGetRegexPatternSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getRegexPatternSet:[AWSwaf-regionalGetRegexPatternSetRequest new] completionHandler:^(AWSwaf-regionalGetRegexPatternSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRule {
    NSString *key = @"testGetRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getRule:[AWSwaf-regionalGetRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRuleCompletionHandler {
    NSString *key = @"testGetRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getRule:[AWSwaf-regionalGetRuleRequest new] completionHandler:^(AWSwaf-regionalGetRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRuleGroup {
    NSString *key = @"testGetRuleGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getRuleGroup:[AWSwaf-regionalGetRuleGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetRuleGroupCompletionHandler {
    NSString *key = @"testGetRuleGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getRuleGroup:[AWSwaf-regionalGetRuleGroupRequest new] completionHandler:^(AWSwaf-regionalGetRuleGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetSampledRequests {
    NSString *key = @"testGetSampledRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getSampledRequests:[AWSwaf-regionalGetSampledRequestsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetSampledRequestsCompletionHandler {
    NSString *key = @"testGetSampledRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getSampledRequests:[AWSwaf-regionalGetSampledRequestsRequest new] completionHandler:^(AWSwaf-regionalGetSampledRequestsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetSizeConstraintSet {
    NSString *key = @"testGetSizeConstraintSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getSizeConstraintSet:[AWSwaf-regionalGetSizeConstraintSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetSizeConstraintSetCompletionHandler {
    NSString *key = @"testGetSizeConstraintSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getSizeConstraintSet:[AWSwaf-regionalGetSizeConstraintSetRequest new] completionHandler:^(AWSwaf-regionalGetSizeConstraintSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetSqlInjectionMatchSet {
    NSString *key = @"testGetSqlInjectionMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getSqlInjectionMatchSet:[AWSwaf-regionalGetSqlInjectionMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetSqlInjectionMatchSetCompletionHandler {
    NSString *key = @"testGetSqlInjectionMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getSqlInjectionMatchSet:[AWSwaf-regionalGetSqlInjectionMatchSetRequest new] completionHandler:^(AWSwaf-regionalGetSqlInjectionMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetWebACL {
    NSString *key = @"testGetWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getWebACL:[AWSwaf-regionalGetWebACLRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetWebACLCompletionHandler {
    NSString *key = @"testGetWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getWebACL:[AWSwaf-regionalGetWebACLRequest new] completionHandler:^(AWSwaf-regionalGetWebACLResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetWebACLForResource {
    NSString *key = @"testGetWebACLForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getWebACLForResource:[AWSwaf-regionalGetWebACLForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetWebACLForResourceCompletionHandler {
    NSString *key = @"testGetWebACLForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getWebACLForResource:[AWSwaf-regionalGetWebACLForResourceRequest new] completionHandler:^(AWSwaf-regionalGetWebACLForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetXssMatchSet {
    NSString *key = @"testGetXssMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] getXssMatchSet:[AWSwaf-regionalGetXssMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testGetXssMatchSetCompletionHandler {
    NSString *key = @"testGetXssMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] getXssMatchSet:[AWSwaf-regionalGetXssMatchSetRequest new] completionHandler:^(AWSwaf-regionalGetXssMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListActivatedRulesInRuleGroup {
    NSString *key = @"testListActivatedRulesInRuleGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listActivatedRulesInRuleGroup:[AWSwaf-regionalListActivatedRulesInRuleGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListActivatedRulesInRuleGroupCompletionHandler {
    NSString *key = @"testListActivatedRulesInRuleGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listActivatedRulesInRuleGroup:[AWSwaf-regionalListActivatedRulesInRuleGroupRequest new] completionHandler:^(AWSwaf-regionalListActivatedRulesInRuleGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListByteMatchSets {
    NSString *key = @"testListByteMatchSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listByteMatchSets:[AWSwaf-regionalListByteMatchSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListByteMatchSetsCompletionHandler {
    NSString *key = @"testListByteMatchSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listByteMatchSets:[AWSwaf-regionalListByteMatchSetsRequest new] completionHandler:^(AWSwaf-regionalListByteMatchSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListGeoMatchSets {
    NSString *key = @"testListGeoMatchSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listGeoMatchSets:[AWSwaf-regionalListGeoMatchSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListGeoMatchSetsCompletionHandler {
    NSString *key = @"testListGeoMatchSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listGeoMatchSets:[AWSwaf-regionalListGeoMatchSetsRequest new] completionHandler:^(AWSwaf-regionalListGeoMatchSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListIPSets {
    NSString *key = @"testListIPSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listIPSets:[AWSwaf-regionalListIPSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListIPSetsCompletionHandler {
    NSString *key = @"testListIPSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listIPSets:[AWSwaf-regionalListIPSetsRequest new] completionHandler:^(AWSwaf-regionalListIPSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListLoggingConfigurations {
    NSString *key = @"testListLoggingConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listLoggingConfigurations:[AWSwaf-regionalListLoggingConfigurationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListLoggingConfigurationsCompletionHandler {
    NSString *key = @"testListLoggingConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listLoggingConfigurations:[AWSwaf-regionalListLoggingConfigurationsRequest new] completionHandler:^(AWSwaf-regionalListLoggingConfigurationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListRateBasedRules {
    NSString *key = @"testListRateBasedRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listRateBasedRules:[AWSwaf-regionalListRateBasedRulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListRateBasedRulesCompletionHandler {
    NSString *key = @"testListRateBasedRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listRateBasedRules:[AWSwaf-regionalListRateBasedRulesRequest new] completionHandler:^(AWSwaf-regionalListRateBasedRulesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListRegexMatchSets {
    NSString *key = @"testListRegexMatchSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listRegexMatchSets:[AWSwaf-regionalListRegexMatchSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListRegexMatchSetsCompletionHandler {
    NSString *key = @"testListRegexMatchSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listRegexMatchSets:[AWSwaf-regionalListRegexMatchSetsRequest new] completionHandler:^(AWSwaf-regionalListRegexMatchSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListRegexPatternSets {
    NSString *key = @"testListRegexPatternSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listRegexPatternSets:[AWSwaf-regionalListRegexPatternSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListRegexPatternSetsCompletionHandler {
    NSString *key = @"testListRegexPatternSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listRegexPatternSets:[AWSwaf-regionalListRegexPatternSetsRequest new] completionHandler:^(AWSwaf-regionalListRegexPatternSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListResourcesForWebACL {
    NSString *key = @"testListResourcesForWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listResourcesForWebACL:[AWSwaf-regionalListResourcesForWebACLRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListResourcesForWebACLCompletionHandler {
    NSString *key = @"testListResourcesForWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listResourcesForWebACL:[AWSwaf-regionalListResourcesForWebACLRequest new] completionHandler:^(AWSwaf-regionalListResourcesForWebACLResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListRuleGroups {
    NSString *key = @"testListRuleGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listRuleGroups:[AWSwaf-regionalListRuleGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListRuleGroupsCompletionHandler {
    NSString *key = @"testListRuleGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listRuleGroups:[AWSwaf-regionalListRuleGroupsRequest new] completionHandler:^(AWSwaf-regionalListRuleGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListRules {
    NSString *key = @"testListRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listRules:[AWSwaf-regionalListRulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListRulesCompletionHandler {
    NSString *key = @"testListRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listRules:[AWSwaf-regionalListRulesRequest new] completionHandler:^(AWSwaf-regionalListRulesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListSizeConstraintSets {
    NSString *key = @"testListSizeConstraintSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listSizeConstraintSets:[AWSwaf-regionalListSizeConstraintSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListSizeConstraintSetsCompletionHandler {
    NSString *key = @"testListSizeConstraintSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listSizeConstraintSets:[AWSwaf-regionalListSizeConstraintSetsRequest new] completionHandler:^(AWSwaf-regionalListSizeConstraintSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListSqlInjectionMatchSets {
    NSString *key = @"testListSqlInjectionMatchSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listSqlInjectionMatchSets:[AWSwaf-regionalListSqlInjectionMatchSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListSqlInjectionMatchSetsCompletionHandler {
    NSString *key = @"testListSqlInjectionMatchSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listSqlInjectionMatchSets:[AWSwaf-regionalListSqlInjectionMatchSetsRequest new] completionHandler:^(AWSwaf-regionalListSqlInjectionMatchSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListSubscribedRuleGroups {
    NSString *key = @"testListSubscribedRuleGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listSubscribedRuleGroups:[AWSwaf-regionalListSubscribedRuleGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListSubscribedRuleGroupsCompletionHandler {
    NSString *key = @"testListSubscribedRuleGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listSubscribedRuleGroups:[AWSwaf-regionalListSubscribedRuleGroupsRequest new] completionHandler:^(AWSwaf-regionalListSubscribedRuleGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listTagsForResource:[AWSwaf-regionalListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listTagsForResource:[AWSwaf-regionalListTagsForResourceRequest new] completionHandler:^(AWSwaf-regionalListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListWebACLs {
    NSString *key = @"testListWebACLs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listWebACLs:[AWSwaf-regionalListWebACLsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListWebACLsCompletionHandler {
    NSString *key = @"testListWebACLs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listWebACLs:[AWSwaf-regionalListWebACLsRequest new] completionHandler:^(AWSwaf-regionalListWebACLsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListXssMatchSets {
    NSString *key = @"testListXssMatchSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] listXssMatchSets:[AWSwaf-regionalListXssMatchSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testListXssMatchSetsCompletionHandler {
    NSString *key = @"testListXssMatchSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] listXssMatchSets:[AWSwaf-regionalListXssMatchSetsRequest new] completionHandler:^(AWSwaf-regionalListXssMatchSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testPutLoggingConfiguration {
    NSString *key = @"testPutLoggingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] putLoggingConfiguration:[AWSwaf-regionalPutLoggingConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testPutLoggingConfigurationCompletionHandler {
    NSString *key = @"testPutLoggingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] putLoggingConfiguration:[AWSwaf-regionalPutLoggingConfigurationRequest new] completionHandler:^(AWSwaf-regionalPutLoggingConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testPutPermissionPolicy {
    NSString *key = @"testPutPermissionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] putPermissionPolicy:[AWSwaf-regionalPutPermissionPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testPutPermissionPolicyCompletionHandler {
    NSString *key = @"testPutPermissionPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] putPermissionPolicy:[AWSwaf-regionalPutPermissionPolicyRequest new] completionHandler:^(AWSwaf-regionalPutPermissionPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] tagResource:[AWSwaf-regionalTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] tagResource:[AWSwaf-regionalTagResourceRequest new] completionHandler:^(AWSwaf-regionalTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] untagResource:[AWSwaf-regionalUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] untagResource:[AWSwaf-regionalUntagResourceRequest new] completionHandler:^(AWSwaf-regionalUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateByteMatchSet {
    NSString *key = @"testUpdateByteMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateByteMatchSet:[AWSwaf-regionalUpdateByteMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateByteMatchSetCompletionHandler {
    NSString *key = @"testUpdateByteMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateByteMatchSet:[AWSwaf-regionalUpdateByteMatchSetRequest new] completionHandler:^(AWSwaf-regionalUpdateByteMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateGeoMatchSet {
    NSString *key = @"testUpdateGeoMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateGeoMatchSet:[AWSwaf-regionalUpdateGeoMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateGeoMatchSetCompletionHandler {
    NSString *key = @"testUpdateGeoMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateGeoMatchSet:[AWSwaf-regionalUpdateGeoMatchSetRequest new] completionHandler:^(AWSwaf-regionalUpdateGeoMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateIPSet {
    NSString *key = @"testUpdateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateIPSet:[AWSwaf-regionalUpdateIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateIPSetCompletionHandler {
    NSString *key = @"testUpdateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateIPSet:[AWSwaf-regionalUpdateIPSetRequest new] completionHandler:^(AWSwaf-regionalUpdateIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateRateBasedRule {
    NSString *key = @"testUpdateRateBasedRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateRateBasedRule:[AWSwaf-regionalUpdateRateBasedRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateRateBasedRuleCompletionHandler {
    NSString *key = @"testUpdateRateBasedRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateRateBasedRule:[AWSwaf-regionalUpdateRateBasedRuleRequest new] completionHandler:^(AWSwaf-regionalUpdateRateBasedRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateRegexMatchSet {
    NSString *key = @"testUpdateRegexMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateRegexMatchSet:[AWSwaf-regionalUpdateRegexMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateRegexMatchSetCompletionHandler {
    NSString *key = @"testUpdateRegexMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateRegexMatchSet:[AWSwaf-regionalUpdateRegexMatchSetRequest new] completionHandler:^(AWSwaf-regionalUpdateRegexMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateRegexPatternSet {
    NSString *key = @"testUpdateRegexPatternSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateRegexPatternSet:[AWSwaf-regionalUpdateRegexPatternSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateRegexPatternSetCompletionHandler {
    NSString *key = @"testUpdateRegexPatternSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateRegexPatternSet:[AWSwaf-regionalUpdateRegexPatternSetRequest new] completionHandler:^(AWSwaf-regionalUpdateRegexPatternSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateRule {
    NSString *key = @"testUpdateRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateRule:[AWSwaf-regionalUpdateRuleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateRuleCompletionHandler {
    NSString *key = @"testUpdateRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateRule:[AWSwaf-regionalUpdateRuleRequest new] completionHandler:^(AWSwaf-regionalUpdateRuleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateRuleGroup {
    NSString *key = @"testUpdateRuleGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateRuleGroup:[AWSwaf-regionalUpdateRuleGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateRuleGroupCompletionHandler {
    NSString *key = @"testUpdateRuleGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateRuleGroup:[AWSwaf-regionalUpdateRuleGroupRequest new] completionHandler:^(AWSwaf-regionalUpdateRuleGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateSizeConstraintSet {
    NSString *key = @"testUpdateSizeConstraintSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateSizeConstraintSet:[AWSwaf-regionalUpdateSizeConstraintSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateSizeConstraintSetCompletionHandler {
    NSString *key = @"testUpdateSizeConstraintSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateSizeConstraintSet:[AWSwaf-regionalUpdateSizeConstraintSetRequest new] completionHandler:^(AWSwaf-regionalUpdateSizeConstraintSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateSqlInjectionMatchSet {
    NSString *key = @"testUpdateSqlInjectionMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateSqlInjectionMatchSet:[AWSwaf-regionalUpdateSqlInjectionMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateSqlInjectionMatchSetCompletionHandler {
    NSString *key = @"testUpdateSqlInjectionMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateSqlInjectionMatchSet:[AWSwaf-regionalUpdateSqlInjectionMatchSetRequest new] completionHandler:^(AWSwaf-regionalUpdateSqlInjectionMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateWebACL {
    NSString *key = @"testUpdateWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateWebACL:[AWSwaf-regionalUpdateWebACLRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateWebACLCompletionHandler {
    NSString *key = @"testUpdateWebACL";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateWebACL:[AWSwaf-regionalUpdateWebACLRequest new] completionHandler:^(AWSwaf-regionalUpdateWebACLResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateXssMatchSet {
    NSString *key = @"testUpdateXssMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSwaf-regional waf-regionalForKey:key] updateXssMatchSet:[AWSwaf-regionalUpdateXssMatchSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

- (void)testUpdateXssMatchSetCompletionHandler {
    NSString *key = @"testUpdateXssMatchSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:key];

    AWSwaf-regional *awsClient = [AWSwaf-regional waf-regionalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSwaf-regional waf-regionalForKey:key] updateXssMatchSet:[AWSwaf-regionalUpdateXssMatchSetRequest new] completionHandler:^(AWSwaf-regionalUpdateXssMatchSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSwaf-regional removewaf-regionalForKey:key];
}

@end
