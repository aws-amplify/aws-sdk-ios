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
#import "AWSroute53domainsService.h"

static id mockNetworking = nil;

@interface AWSGeneralroute53domainsTests : XCTestCase

@end

@implementation AWSGeneralroute53domainsTests

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
    NSString *key = @"testroute53domainsConstructors";
    XCTAssertNotNil([AWSroute53domains defaultroute53domains]);
    XCTAssertEqual([[AWSroute53domains defaultroute53domains] class], [AWSroute53domains class]);
    XCTAssertNil([AWSroute53domains route53domainsForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSroute53domains route53domainsForKey:key]);
    XCTAssertEqual([[AWSroute53domains route53domainsForKey:key] class], [AWSroute53domains class]);
    XCTAssertEqual([AWSroute53domains route53domainsForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSroute53domains removeroute53domainsForKey:key];
    XCTAssertNil([AWSroute53domains route53domainsForKey:key]);

}

- (void)testAcceptDomainTransferFromAnotherAwsAccount {
    NSString *key = @"testAcceptDomainTransferFromAnotherAwsAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] acceptDomainTransferFromAnotherAwsAccount:[AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testAcceptDomainTransferFromAnotherAwsAccountCompletionHandler {
    NSString *key = @"testAcceptDomainTransferFromAnotherAwsAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] acceptDomainTransferFromAnotherAwsAccount:[AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest new] completionHandler:^(AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testCancelDomainTransferToAnotherAwsAccount {
    NSString *key = @"testCancelDomainTransferToAnotherAwsAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] cancelDomainTransferToAnotherAwsAccount:[AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testCancelDomainTransferToAnotherAwsAccountCompletionHandler {
    NSString *key = @"testCancelDomainTransferToAnotherAwsAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] cancelDomainTransferToAnotherAwsAccount:[AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest new] completionHandler:^(AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testCheckDomainAvailability {
    NSString *key = @"testCheckDomainAvailability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] checkDomainAvailability:[AWSroute53domainsCheckDomainAvailabilityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testCheckDomainAvailabilityCompletionHandler {
    NSString *key = @"testCheckDomainAvailability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] checkDomainAvailability:[AWSroute53domainsCheckDomainAvailabilityRequest new] completionHandler:^(AWSroute53domainsCheckDomainAvailabilityResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testCheckDomainTransferability {
    NSString *key = @"testCheckDomainTransferability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] checkDomainTransferability:[AWSroute53domainsCheckDomainTransferabilityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testCheckDomainTransferabilityCompletionHandler {
    NSString *key = @"testCheckDomainTransferability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] checkDomainTransferability:[AWSroute53domainsCheckDomainTransferabilityRequest new] completionHandler:^(AWSroute53domainsCheckDomainTransferabilityResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testDeleteTagsForDomain {
    NSString *key = @"testDeleteTagsForDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] deleteTagsForDomain:[AWSroute53domainsDeleteTagsForDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testDeleteTagsForDomainCompletionHandler {
    NSString *key = @"testDeleteTagsForDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] deleteTagsForDomain:[AWSroute53domainsDeleteTagsForDomainRequest new] completionHandler:^(AWSroute53domainsDeleteTagsForDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testDisableDomainAutoRenew {
    NSString *key = @"testDisableDomainAutoRenew";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] disableDomainAutoRenew:[AWSroute53domainsDisableDomainAutoRenewRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testDisableDomainAutoRenewCompletionHandler {
    NSString *key = @"testDisableDomainAutoRenew";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] disableDomainAutoRenew:[AWSroute53domainsDisableDomainAutoRenewRequest new] completionHandler:^(AWSroute53domainsDisableDomainAutoRenewResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testDisableDomainTransferLock {
    NSString *key = @"testDisableDomainTransferLock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] disableDomainTransferLock:[AWSroute53domainsDisableDomainTransferLockRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testDisableDomainTransferLockCompletionHandler {
    NSString *key = @"testDisableDomainTransferLock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] disableDomainTransferLock:[AWSroute53domainsDisableDomainTransferLockRequest new] completionHandler:^(AWSroute53domainsDisableDomainTransferLockResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testEnableDomainAutoRenew {
    NSString *key = @"testEnableDomainAutoRenew";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] enableDomainAutoRenew:[AWSroute53domainsEnableDomainAutoRenewRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testEnableDomainAutoRenewCompletionHandler {
    NSString *key = @"testEnableDomainAutoRenew";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] enableDomainAutoRenew:[AWSroute53domainsEnableDomainAutoRenewRequest new] completionHandler:^(AWSroute53domainsEnableDomainAutoRenewResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testEnableDomainTransferLock {
    NSString *key = @"testEnableDomainTransferLock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] enableDomainTransferLock:[AWSroute53domainsEnableDomainTransferLockRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testEnableDomainTransferLockCompletionHandler {
    NSString *key = @"testEnableDomainTransferLock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] enableDomainTransferLock:[AWSroute53domainsEnableDomainTransferLockRequest new] completionHandler:^(AWSroute53domainsEnableDomainTransferLockResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testGetContactReachabilityStatus {
    NSString *key = @"testGetContactReachabilityStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] getContactReachabilityStatus:[AWSroute53domainsGetContactReachabilityStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testGetContactReachabilityStatusCompletionHandler {
    NSString *key = @"testGetContactReachabilityStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] getContactReachabilityStatus:[AWSroute53domainsGetContactReachabilityStatusRequest new] completionHandler:^(AWSroute53domainsGetContactReachabilityStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testGetDomainDetail {
    NSString *key = @"testGetDomainDetail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] getDomainDetail:[AWSroute53domainsGetDomainDetailRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testGetDomainDetailCompletionHandler {
    NSString *key = @"testGetDomainDetail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] getDomainDetail:[AWSroute53domainsGetDomainDetailRequest new] completionHandler:^(AWSroute53domainsGetDomainDetailResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testGetDomainSuggestions {
    NSString *key = @"testGetDomainSuggestions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] getDomainSuggestions:[AWSroute53domainsGetDomainSuggestionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testGetDomainSuggestionsCompletionHandler {
    NSString *key = @"testGetDomainSuggestions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] getDomainSuggestions:[AWSroute53domainsGetDomainSuggestionsRequest new] completionHandler:^(AWSroute53domainsGetDomainSuggestionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testGetOperationDetail {
    NSString *key = @"testGetOperationDetail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] getOperationDetail:[AWSroute53domainsGetOperationDetailRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testGetOperationDetailCompletionHandler {
    NSString *key = @"testGetOperationDetail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] getOperationDetail:[AWSroute53domainsGetOperationDetailRequest new] completionHandler:^(AWSroute53domainsGetOperationDetailResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testListDomains {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] listDomains:[AWSroute53domainsListDomainsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testListDomainsCompletionHandler {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] listDomains:[AWSroute53domainsListDomainsRequest new] completionHandler:^(AWSroute53domainsListDomainsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testListOperations {
    NSString *key = @"testListOperations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] listOperations:[AWSroute53domainsListOperationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testListOperationsCompletionHandler {
    NSString *key = @"testListOperations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] listOperations:[AWSroute53domainsListOperationsRequest new] completionHandler:^(AWSroute53domainsListOperationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testListTagsForDomain {
    NSString *key = @"testListTagsForDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] listTagsForDomain:[AWSroute53domainsListTagsForDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testListTagsForDomainCompletionHandler {
    NSString *key = @"testListTagsForDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] listTagsForDomain:[AWSroute53domainsListTagsForDomainRequest new] completionHandler:^(AWSroute53domainsListTagsForDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testRegisterDomain {
    NSString *key = @"testRegisterDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] registerDomain:[AWSroute53domainsRegisterDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testRegisterDomainCompletionHandler {
    NSString *key = @"testRegisterDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] registerDomain:[AWSroute53domainsRegisterDomainRequest new] completionHandler:^(AWSroute53domainsRegisterDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testRejectDomainTransferFromAnotherAwsAccount {
    NSString *key = @"testRejectDomainTransferFromAnotherAwsAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] rejectDomainTransferFromAnotherAwsAccount:[AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testRejectDomainTransferFromAnotherAwsAccountCompletionHandler {
    NSString *key = @"testRejectDomainTransferFromAnotherAwsAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] rejectDomainTransferFromAnotherAwsAccount:[AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest new] completionHandler:^(AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testRenewDomain {
    NSString *key = @"testRenewDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] renewDomain:[AWSroute53domainsRenewDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testRenewDomainCompletionHandler {
    NSString *key = @"testRenewDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] renewDomain:[AWSroute53domainsRenewDomainRequest new] completionHandler:^(AWSroute53domainsRenewDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testResendContactReachabilityEmail {
    NSString *key = @"testResendContactReachabilityEmail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] resendContactReachabilityEmail:[AWSroute53domainsResendContactReachabilityEmailRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testResendContactReachabilityEmailCompletionHandler {
    NSString *key = @"testResendContactReachabilityEmail";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] resendContactReachabilityEmail:[AWSroute53domainsResendContactReachabilityEmailRequest new] completionHandler:^(AWSroute53domainsResendContactReachabilityEmailResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testRetrieveDomainAuthCode {
    NSString *key = @"testRetrieveDomainAuthCode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] retrieveDomainAuthCode:[AWSroute53domainsRetrieveDomainAuthCodeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testRetrieveDomainAuthCodeCompletionHandler {
    NSString *key = @"testRetrieveDomainAuthCode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] retrieveDomainAuthCode:[AWSroute53domainsRetrieveDomainAuthCodeRequest new] completionHandler:^(AWSroute53domainsRetrieveDomainAuthCodeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testTransferDomain {
    NSString *key = @"testTransferDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] transferDomain:[AWSroute53domainsTransferDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testTransferDomainCompletionHandler {
    NSString *key = @"testTransferDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] transferDomain:[AWSroute53domainsTransferDomainRequest new] completionHandler:^(AWSroute53domainsTransferDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testTransferDomainToAnotherAwsAccount {
    NSString *key = @"testTransferDomainToAnotherAwsAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] transferDomainToAnotherAwsAccount:[AWSroute53domainsTransferDomainToAnotherAwsAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testTransferDomainToAnotherAwsAccountCompletionHandler {
    NSString *key = @"testTransferDomainToAnotherAwsAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] transferDomainToAnotherAwsAccount:[AWSroute53domainsTransferDomainToAnotherAwsAccountRequest new] completionHandler:^(AWSroute53domainsTransferDomainToAnotherAwsAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testUpdateDomainContact {
    NSString *key = @"testUpdateDomainContact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] updateDomainContact:[AWSroute53domainsUpdateDomainContactRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testUpdateDomainContactCompletionHandler {
    NSString *key = @"testUpdateDomainContact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] updateDomainContact:[AWSroute53domainsUpdateDomainContactRequest new] completionHandler:^(AWSroute53domainsUpdateDomainContactResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testUpdateDomainContactPrivacy {
    NSString *key = @"testUpdateDomainContactPrivacy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] updateDomainContactPrivacy:[AWSroute53domainsUpdateDomainContactPrivacyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testUpdateDomainContactPrivacyCompletionHandler {
    NSString *key = @"testUpdateDomainContactPrivacy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] updateDomainContactPrivacy:[AWSroute53domainsUpdateDomainContactPrivacyRequest new] completionHandler:^(AWSroute53domainsUpdateDomainContactPrivacyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testUpdateDomainNameservers {
    NSString *key = @"testUpdateDomainNameservers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] updateDomainNameservers:[AWSroute53domainsUpdateDomainNameserversRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testUpdateDomainNameserversCompletionHandler {
    NSString *key = @"testUpdateDomainNameservers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] updateDomainNameservers:[AWSroute53domainsUpdateDomainNameserversRequest new] completionHandler:^(AWSroute53domainsUpdateDomainNameserversResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testUpdateTagsForDomain {
    NSString *key = @"testUpdateTagsForDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] updateTagsForDomain:[AWSroute53domainsUpdateTagsForDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testUpdateTagsForDomainCompletionHandler {
    NSString *key = @"testUpdateTagsForDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] updateTagsForDomain:[AWSroute53domainsUpdateTagsForDomainRequest new] completionHandler:^(AWSroute53domainsUpdateTagsForDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testViewBilling {
    NSString *key = @"testViewBilling";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53domains route53domainsForKey:key] viewBilling:[AWSroute53domainsViewBillingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

- (void)testViewBillingCompletionHandler {
    NSString *key = @"testViewBilling";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53domains registerroute53domainsWithConfiguration:configuration forKey:key];

    AWSroute53domains *awsClient = [AWSroute53domains route53domainsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53domains route53domainsForKey:key] viewBilling:[AWSroute53domainsViewBillingRequest new] completionHandler:^(AWSroute53domainsViewBillingResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53domains removeroute53domainsForKey:key];
}

@end
