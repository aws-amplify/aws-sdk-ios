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
#import "AWSElasticbeanstalkService.h"

static id mockNetworking = nil;

@interface AWSGeneralElasticbeanstalkTests : XCTestCase

@end

@implementation AWSGeneralElasticbeanstalkTests

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
    NSString *key = @"testElasticbeanstalkConstructors";
    XCTAssertNotNil([AWSElasticbeanstalk defaultElasticbeanstalk]);
    XCTAssertEqual([[AWSElasticbeanstalk defaultElasticbeanstalk] class], [AWSElasticbeanstalk class]);
    XCTAssertNil([AWSElasticbeanstalk ElasticbeanstalkForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSElasticbeanstalk ElasticbeanstalkForKey:key]);
    XCTAssertEqual([[AWSElasticbeanstalk ElasticbeanstalkForKey:key] class], [AWSElasticbeanstalk class]);
    XCTAssertEqual([AWSElasticbeanstalk ElasticbeanstalkForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
    XCTAssertNil([AWSElasticbeanstalk ElasticbeanstalkForKey:key]);

}

- (void)testAbortEnvironmentUpdate {
    NSString *key = @"testAbortEnvironmentUpdate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] abortEnvironmentUpdate:[AWSElasticbeanstalkAbortEnvironmentUpdateMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testAbortEnvironmentUpdateCompletionHandler {
    NSString *key = @"testAbortEnvironmentUpdate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] abortEnvironmentUpdate:[AWSElasticbeanstalkAbortEnvironmentUpdateMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testApplyEnvironmentManagedAction {
    NSString *key = @"testApplyEnvironmentManagedAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] applyEnvironmentManagedAction:[AWSElasticbeanstalkApplyEnvironmentManagedActionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testApplyEnvironmentManagedActionCompletionHandler {
    NSString *key = @"testApplyEnvironmentManagedAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] applyEnvironmentManagedAction:[AWSElasticbeanstalkApplyEnvironmentManagedActionRequest new] completionHandler:^(AWSElasticbeanstalkApplyEnvironmentManagedActionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testAssociateEnvironmentOperationsRole {
    NSString *key = @"testAssociateEnvironmentOperationsRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] associateEnvironmentOperationsRole:[AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testAssociateEnvironmentOperationsRoleCompletionHandler {
    NSString *key = @"testAssociateEnvironmentOperationsRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] associateEnvironmentOperationsRole:[AWSElasticbeanstalkAssociateEnvironmentOperationsRoleMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCheckDNSAvailability {
    NSString *key = @"testCheckDNSAvailability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] checkDNSAvailability:[AWSElasticbeanstalkCheckDNSAvailabilityMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCheckDNSAvailabilityCompletionHandler {
    NSString *key = @"testCheckDNSAvailability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] checkDNSAvailability:[AWSElasticbeanstalkCheckDNSAvailabilityMessage new] completionHandler:^(AWSElasticbeanstalkCheckDNSAvailabilityResultMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testComposeEnvironments {
    NSString *key = @"testComposeEnvironments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] composeEnvironments:[AWSElasticbeanstalkComposeEnvironmentsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testComposeEnvironmentsCompletionHandler {
    NSString *key = @"testComposeEnvironments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] composeEnvironments:[AWSElasticbeanstalkComposeEnvironmentsMessage new] completionHandler:^(AWSElasticbeanstalkEnvironmentDescriptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreateApplication {
    NSString *key = @"testCreateApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createApplication:[AWSElasticbeanstalkCreateApplicationMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreateApplicationCompletionHandler {
    NSString *key = @"testCreateApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createApplication:[AWSElasticbeanstalkCreateApplicationMessage new] completionHandler:^(AWSElasticbeanstalkApplicationDescriptionMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreateApplicationVersion {
    NSString *key = @"testCreateApplicationVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createApplicationVersion:[AWSElasticbeanstalkCreateApplicationVersionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreateApplicationVersionCompletionHandler {
    NSString *key = @"testCreateApplicationVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createApplicationVersion:[AWSElasticbeanstalkCreateApplicationVersionMessage new] completionHandler:^(AWSElasticbeanstalkApplicationVersionDescriptionMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreateConfigurationTemplate {
    NSString *key = @"testCreateConfigurationTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createConfigurationTemplate:[AWSElasticbeanstalkCreateConfigurationTemplateMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreateConfigurationTemplateCompletionHandler {
    NSString *key = @"testCreateConfigurationTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createConfigurationTemplate:[AWSElasticbeanstalkCreateConfigurationTemplateMessage new] completionHandler:^(AWSElasticbeanstalkConfigurationSettingsDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreateEnvironment {
    NSString *key = @"testCreateEnvironment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createEnvironment:[AWSElasticbeanstalkCreateEnvironmentMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreateEnvironmentCompletionHandler {
    NSString *key = @"testCreateEnvironment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createEnvironment:[AWSElasticbeanstalkCreateEnvironmentMessage new] completionHandler:^(AWSElasticbeanstalkEnvironmentDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreatePlatformVersion {
    NSString *key = @"testCreatePlatformVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createPlatformVersion:[AWSElasticbeanstalkCreatePlatformVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreatePlatformVersionCompletionHandler {
    NSString *key = @"testCreatePlatformVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createPlatformVersion:[AWSElasticbeanstalkCreatePlatformVersionRequest new] completionHandler:^(AWSElasticbeanstalkCreatePlatformVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreateStorageLocation {
    NSString *key = @"testCreateStorageLocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createStorageLocation:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testCreateStorageLocationCompletionHandler {
    NSString *key = @"testCreateStorageLocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] createStorageLocation:[AWSRequest new] completionHandler:^(AWSElasticbeanstalkCreateStorageLocationResultMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDeleteApplication {
    NSString *key = @"testDeleteApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] deleteApplication:[AWSElasticbeanstalkDeleteApplicationMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDeleteApplicationCompletionHandler {
    NSString *key = @"testDeleteApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] deleteApplication:[AWSElasticbeanstalkDeleteApplicationMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDeleteApplicationVersion {
    NSString *key = @"testDeleteApplicationVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] deleteApplicationVersion:[AWSElasticbeanstalkDeleteApplicationVersionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDeleteApplicationVersionCompletionHandler {
    NSString *key = @"testDeleteApplicationVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] deleteApplicationVersion:[AWSElasticbeanstalkDeleteApplicationVersionMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDeleteConfigurationTemplate {
    NSString *key = @"testDeleteConfigurationTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] deleteConfigurationTemplate:[AWSElasticbeanstalkDeleteConfigurationTemplateMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDeleteConfigurationTemplateCompletionHandler {
    NSString *key = @"testDeleteConfigurationTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] deleteConfigurationTemplate:[AWSElasticbeanstalkDeleteConfigurationTemplateMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDeleteEnvironmentConfiguration {
    NSString *key = @"testDeleteEnvironmentConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] deleteEnvironmentConfiguration:[AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDeleteEnvironmentConfigurationCompletionHandler {
    NSString *key = @"testDeleteEnvironmentConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] deleteEnvironmentConfiguration:[AWSElasticbeanstalkDeleteEnvironmentConfigurationMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDeletePlatformVersion {
    NSString *key = @"testDeletePlatformVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] deletePlatformVersion:[AWSElasticbeanstalkDeletePlatformVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDeletePlatformVersionCompletionHandler {
    NSString *key = @"testDeletePlatformVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] deletePlatformVersion:[AWSElasticbeanstalkDeletePlatformVersionRequest new] completionHandler:^(AWSElasticbeanstalkDeletePlatformVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeAccountAttributes {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeAccountAttributes:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeAccountAttributesCompletionHandler {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeAccountAttributes:[AWSRequest new] completionHandler:^(AWSElasticbeanstalkDescribeAccountAttributesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeApplicationVersions {
    NSString *key = @"testDescribeApplicationVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeApplicationVersions:[AWSElasticbeanstalkDescribeApplicationVersionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeApplicationVersionsCompletionHandler {
    NSString *key = @"testDescribeApplicationVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeApplicationVersions:[AWSElasticbeanstalkDescribeApplicationVersionsMessage new] completionHandler:^(AWSElasticbeanstalkApplicationVersionDescriptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeApplications {
    NSString *key = @"testDescribeApplications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeApplications:[AWSElasticbeanstalkDescribeApplicationsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeApplicationsCompletionHandler {
    NSString *key = @"testDescribeApplications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeApplications:[AWSElasticbeanstalkDescribeApplicationsMessage new] completionHandler:^(AWSElasticbeanstalkApplicationDescriptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeConfigurationOptions {
    NSString *key = @"testDescribeConfigurationOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeConfigurationOptions:[AWSElasticbeanstalkDescribeConfigurationOptionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeConfigurationOptionsCompletionHandler {
    NSString *key = @"testDescribeConfigurationOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeConfigurationOptions:[AWSElasticbeanstalkDescribeConfigurationOptionsMessage new] completionHandler:^(AWSElasticbeanstalkConfigurationOptionsDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeConfigurationSettings {
    NSString *key = @"testDescribeConfigurationSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeConfigurationSettings:[AWSElasticbeanstalkDescribeConfigurationSettingsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeConfigurationSettingsCompletionHandler {
    NSString *key = @"testDescribeConfigurationSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeConfigurationSettings:[AWSElasticbeanstalkDescribeConfigurationSettingsMessage new] completionHandler:^(AWSElasticbeanstalkConfigurationSettingsDescriptions* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEnvironmentHealth {
    NSString *key = @"testDescribeEnvironmentHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEnvironmentHealth:[AWSElasticbeanstalkDescribeEnvironmentHealthRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEnvironmentHealthCompletionHandler {
    NSString *key = @"testDescribeEnvironmentHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEnvironmentHealth:[AWSElasticbeanstalkDescribeEnvironmentHealthRequest new] completionHandler:^(AWSElasticbeanstalkDescribeEnvironmentHealthResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEnvironmentManagedActionHistory {
    NSString *key = @"testDescribeEnvironmentManagedActionHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEnvironmentManagedActionHistory:[AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEnvironmentManagedActionHistoryCompletionHandler {
    NSString *key = @"testDescribeEnvironmentManagedActionHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEnvironmentManagedActionHistory:[AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryRequest new] completionHandler:^(AWSElasticbeanstalkDescribeEnvironmentManagedActionHistoryResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEnvironmentManagedActions {
    NSString *key = @"testDescribeEnvironmentManagedActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEnvironmentManagedActions:[AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEnvironmentManagedActionsCompletionHandler {
    NSString *key = @"testDescribeEnvironmentManagedActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEnvironmentManagedActions:[AWSElasticbeanstalkDescribeEnvironmentManagedActionsRequest new] completionHandler:^(AWSElasticbeanstalkDescribeEnvironmentManagedActionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEnvironmentResources {
    NSString *key = @"testDescribeEnvironmentResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEnvironmentResources:[AWSElasticbeanstalkDescribeEnvironmentResourcesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEnvironmentResourcesCompletionHandler {
    NSString *key = @"testDescribeEnvironmentResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEnvironmentResources:[AWSElasticbeanstalkDescribeEnvironmentResourcesMessage new] completionHandler:^(AWSElasticbeanstalkEnvironmentResourceDescriptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEnvironments {
    NSString *key = @"testDescribeEnvironments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEnvironments:[AWSElasticbeanstalkDescribeEnvironmentsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEnvironmentsCompletionHandler {
    NSString *key = @"testDescribeEnvironments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEnvironments:[AWSElasticbeanstalkDescribeEnvironmentsMessage new] completionHandler:^(AWSElasticbeanstalkEnvironmentDescriptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEvents {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEvents:[AWSElasticbeanstalkDescribeEventsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeEventsCompletionHandler {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeEvents:[AWSElasticbeanstalkDescribeEventsMessage new] completionHandler:^(AWSElasticbeanstalkEventDescriptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeInstancesHealth {
    NSString *key = @"testDescribeInstancesHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeInstancesHealth:[AWSElasticbeanstalkDescribeInstancesHealthRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribeInstancesHealthCompletionHandler {
    NSString *key = @"testDescribeInstancesHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describeInstancesHealth:[AWSElasticbeanstalkDescribeInstancesHealthRequest new] completionHandler:^(AWSElasticbeanstalkDescribeInstancesHealthResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribePlatformVersion {
    NSString *key = @"testDescribePlatformVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describePlatformVersion:[AWSElasticbeanstalkDescribePlatformVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDescribePlatformVersionCompletionHandler {
    NSString *key = @"testDescribePlatformVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] describePlatformVersion:[AWSElasticbeanstalkDescribePlatformVersionRequest new] completionHandler:^(AWSElasticbeanstalkDescribePlatformVersionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDisassociateEnvironmentOperationsRole {
    NSString *key = @"testDisassociateEnvironmentOperationsRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] disassociateEnvironmentOperationsRole:[AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testDisassociateEnvironmentOperationsRoleCompletionHandler {
    NSString *key = @"testDisassociateEnvironmentOperationsRole";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] disassociateEnvironmentOperationsRole:[AWSElasticbeanstalkDisassociateEnvironmentOperationsRoleMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testListAvailableSolutionStacks {
    NSString *key = @"testListAvailableSolutionStacks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] listAvailableSolutionStacks:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testListAvailableSolutionStacksCompletionHandler {
    NSString *key = @"testListAvailableSolutionStacks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] listAvailableSolutionStacks:[AWSRequest new] completionHandler:^(AWSElasticbeanstalkListAvailableSolutionStacksResultMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testListPlatformBranches {
    NSString *key = @"testListPlatformBranches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] listPlatformBranches:[AWSElasticbeanstalkListPlatformBranchesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testListPlatformBranchesCompletionHandler {
    NSString *key = @"testListPlatformBranches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] listPlatformBranches:[AWSElasticbeanstalkListPlatformBranchesRequest new] completionHandler:^(AWSElasticbeanstalkListPlatformBranchesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testListPlatformVersions {
    NSString *key = @"testListPlatformVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] listPlatformVersions:[AWSElasticbeanstalkListPlatformVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testListPlatformVersionsCompletionHandler {
    NSString *key = @"testListPlatformVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] listPlatformVersions:[AWSElasticbeanstalkListPlatformVersionsRequest new] completionHandler:^(AWSElasticbeanstalkListPlatformVersionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] listTagsForResource:[AWSElasticbeanstalkListTagsForResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] listTagsForResource:[AWSElasticbeanstalkListTagsForResourceMessage new] completionHandler:^(AWSElasticbeanstalkResourceTagsDescriptionMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testRebuildEnvironment {
    NSString *key = @"testRebuildEnvironment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] rebuildEnvironment:[AWSElasticbeanstalkRebuildEnvironmentMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testRebuildEnvironmentCompletionHandler {
    NSString *key = @"testRebuildEnvironment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] rebuildEnvironment:[AWSElasticbeanstalkRebuildEnvironmentMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testRequestEnvironmentInfo {
    NSString *key = @"testRequestEnvironmentInfo";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] requestEnvironmentInfo:[AWSElasticbeanstalkRequestEnvironmentInfoMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testRequestEnvironmentInfoCompletionHandler {
    NSString *key = @"testRequestEnvironmentInfo";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] requestEnvironmentInfo:[AWSElasticbeanstalkRequestEnvironmentInfoMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testRestartAppServer {
    NSString *key = @"testRestartAppServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] restartAppServer:[AWSElasticbeanstalkRestartAppServerMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testRestartAppServerCompletionHandler {
    NSString *key = @"testRestartAppServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] restartAppServer:[AWSElasticbeanstalkRestartAppServerMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testRetrieveEnvironmentInfo {
    NSString *key = @"testRetrieveEnvironmentInfo";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] retrieveEnvironmentInfo:[AWSElasticbeanstalkRetrieveEnvironmentInfoMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testRetrieveEnvironmentInfoCompletionHandler {
    NSString *key = @"testRetrieveEnvironmentInfo";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] retrieveEnvironmentInfo:[AWSElasticbeanstalkRetrieveEnvironmentInfoMessage new] completionHandler:^(AWSElasticbeanstalkRetrieveEnvironmentInfoResultMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testSwapEnvironmentCNAMEs {
    NSString *key = @"testSwapEnvironmentCNAMEs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] swapEnvironmentCNAMEs:[AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testSwapEnvironmentCNAMEsCompletionHandler {
    NSString *key = @"testSwapEnvironmentCNAMEs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] swapEnvironmentCNAMEs:[AWSElasticbeanstalkSwapEnvironmentCNAMEsMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testTerminateEnvironment {
    NSString *key = @"testTerminateEnvironment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] terminateEnvironment:[AWSElasticbeanstalkTerminateEnvironmentMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testTerminateEnvironmentCompletionHandler {
    NSString *key = @"testTerminateEnvironment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] terminateEnvironment:[AWSElasticbeanstalkTerminateEnvironmentMessage new] completionHandler:^(AWSElasticbeanstalkEnvironmentDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateApplication {
    NSString *key = @"testUpdateApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateApplication:[AWSElasticbeanstalkUpdateApplicationMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateApplicationCompletionHandler {
    NSString *key = @"testUpdateApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateApplication:[AWSElasticbeanstalkUpdateApplicationMessage new] completionHandler:^(AWSElasticbeanstalkApplicationDescriptionMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateApplicationResourceLifecycle {
    NSString *key = @"testUpdateApplicationResourceLifecycle";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateApplicationResourceLifecycle:[AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateApplicationResourceLifecycleCompletionHandler {
    NSString *key = @"testUpdateApplicationResourceLifecycle";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateApplicationResourceLifecycle:[AWSElasticbeanstalkUpdateApplicationResourceLifecycleMessage new] completionHandler:^(AWSElasticbeanstalkApplicationResourceLifecycleDescriptionMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateApplicationVersion {
    NSString *key = @"testUpdateApplicationVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateApplicationVersion:[AWSElasticbeanstalkUpdateApplicationVersionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateApplicationVersionCompletionHandler {
    NSString *key = @"testUpdateApplicationVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateApplicationVersion:[AWSElasticbeanstalkUpdateApplicationVersionMessage new] completionHandler:^(AWSElasticbeanstalkApplicationVersionDescriptionMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateConfigurationTemplate {
    NSString *key = @"testUpdateConfigurationTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateConfigurationTemplate:[AWSElasticbeanstalkUpdateConfigurationTemplateMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateConfigurationTemplateCompletionHandler {
    NSString *key = @"testUpdateConfigurationTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateConfigurationTemplate:[AWSElasticbeanstalkUpdateConfigurationTemplateMessage new] completionHandler:^(AWSElasticbeanstalkConfigurationSettingsDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateEnvironment {
    NSString *key = @"testUpdateEnvironment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateEnvironment:[AWSElasticbeanstalkUpdateEnvironmentMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateEnvironmentCompletionHandler {
    NSString *key = @"testUpdateEnvironment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateEnvironment:[AWSElasticbeanstalkUpdateEnvironmentMessage new] completionHandler:^(AWSElasticbeanstalkEnvironmentDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateTagsForResource {
    NSString *key = @"testUpdateTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateTagsForResource:[AWSElasticbeanstalkUpdateTagsForResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testUpdateTagsForResourceCompletionHandler {
    NSString *key = @"testUpdateTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] updateTagsForResource:[AWSElasticbeanstalkUpdateTagsForResourceMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testValidateConfigurationSettings {
    NSString *key = @"testValidateConfigurationSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] validateConfigurationSettings:[AWSElasticbeanstalkValidateConfigurationSettingsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

- (void)testValidateConfigurationSettingsCompletionHandler {
    NSString *key = @"testValidateConfigurationSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticbeanstalk registerElasticbeanstalkWithConfiguration:configuration forKey:key];

    AWSElasticbeanstalk *awsClient = [AWSElasticbeanstalk ElasticbeanstalkForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticbeanstalk ElasticbeanstalkForKey:key] validateConfigurationSettings:[AWSElasticbeanstalkValidateConfigurationSettingsMessage new] completionHandler:^(AWSElasticbeanstalkConfigurationSettingsValidationMessages* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticbeanstalk removeElasticbeanstalkForKey:key];
}

@end
