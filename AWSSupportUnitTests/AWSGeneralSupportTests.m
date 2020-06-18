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
#import "AWSSupportService.h"

static id mockNetworking = nil;

@interface AWSGeneralSupportTests : XCTestCase

@end

@implementation AWSGeneralSupportTests

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
    NSString *key = @"testSupportConstructors";
    XCTAssertNotNil([AWSSupport defaultSupport]);
    XCTAssertEqual([[AWSSupport defaultSupport] class], [AWSSupport class]);
    XCTAssertNil([AWSSupport SupportForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSupport SupportForKey:key]);
    XCTAssertEqual([[AWSSupport SupportForKey:key] class], [AWSSupport class]);
    XCTAssertEqual([AWSSupport SupportForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSupport removeSupportForKey:key];
    XCTAssertNil([AWSSupport SupportForKey:key]);

}

- (void)testAddAttachmentsToSet {
    NSString *key = @"testAddAttachmentsToSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] addAttachmentsToSet:[AWSSupportAddAttachmentsToSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testAddAttachmentsToSetCompletionHandler {
    NSString *key = @"testAddAttachmentsToSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] addAttachmentsToSet:[AWSSupportAddAttachmentsToSetRequest new] completionHandler:^(AWSSupportAddAttachmentsToSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testAddCommunicationToCase {
    NSString *key = @"testAddCommunicationToCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] addCommunicationToCase:[AWSSupportAddCommunicationToCaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testAddCommunicationToCaseCompletionHandler {
    NSString *key = @"testAddCommunicationToCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] addCommunicationToCase:[AWSSupportAddCommunicationToCaseRequest new] completionHandler:^(AWSSupportAddCommunicationToCaseResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testCreateCase {
    NSString *key = @"testCreateCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] createCase:[AWSSupportCreateCaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testCreateCaseCompletionHandler {
    NSString *key = @"testCreateCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] createCase:[AWSSupportCreateCaseRequest new] completionHandler:^(AWSSupportCreateCaseResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeAttachment {
    NSString *key = @"testDescribeAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] describeAttachment:[AWSSupportDescribeAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeAttachmentCompletionHandler {
    NSString *key = @"testDescribeAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] describeAttachment:[AWSSupportDescribeAttachmentRequest new] completionHandler:^(AWSSupportDescribeAttachmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeCases {
    NSString *key = @"testDescribeCases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] describeCases:[AWSSupportDescribeCasesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeCasesCompletionHandler {
    NSString *key = @"testDescribeCases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] describeCases:[AWSSupportDescribeCasesRequest new] completionHandler:^(AWSSupportDescribeCasesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeCommunications {
    NSString *key = @"testDescribeCommunications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] describeCommunications:[AWSSupportDescribeCommunicationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeCommunicationsCompletionHandler {
    NSString *key = @"testDescribeCommunications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] describeCommunications:[AWSSupportDescribeCommunicationsRequest new] completionHandler:^(AWSSupportDescribeCommunicationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeServices {
    NSString *key = @"testDescribeServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] describeServices:[AWSSupportDescribeServicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeServicesCompletionHandler {
    NSString *key = @"testDescribeServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] describeServices:[AWSSupportDescribeServicesRequest new] completionHandler:^(AWSSupportDescribeServicesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeSeverityLevels {
    NSString *key = @"testDescribeSeverityLevels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] describeSeverityLevels:[AWSSupportDescribeSeverityLevelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeSeverityLevelsCompletionHandler {
    NSString *key = @"testDescribeSeverityLevels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] describeSeverityLevels:[AWSSupportDescribeSeverityLevelsRequest new] completionHandler:^(AWSSupportDescribeSeverityLevelsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckRefreshStatuses {
    NSString *key = @"testDescribeTrustedAdvisorCheckRefreshStatuses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] describeTrustedAdvisorCheckRefreshStatuses:[AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckRefreshStatusesCompletionHandler {
    NSString *key = @"testDescribeTrustedAdvisorCheckRefreshStatuses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] describeTrustedAdvisorCheckRefreshStatuses:[AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest new] completionHandler:^(AWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckResult {
    NSString *key = @"testDescribeTrustedAdvisorCheckResult";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] describeTrustedAdvisorCheckResult:[AWSSupportDescribeTrustedAdvisorCheckResultRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckResultCompletionHandler {
    NSString *key = @"testDescribeTrustedAdvisorCheckResult";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] describeTrustedAdvisorCheckResult:[AWSSupportDescribeTrustedAdvisorCheckResultRequest new] completionHandler:^(AWSSupportDescribeTrustedAdvisorCheckResultResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckSummaries {
    NSString *key = @"testDescribeTrustedAdvisorCheckSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] describeTrustedAdvisorCheckSummaries:[AWSSupportDescribeTrustedAdvisorCheckSummariesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckSummariesCompletionHandler {
    NSString *key = @"testDescribeTrustedAdvisorCheckSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] describeTrustedAdvisorCheckSummaries:[AWSSupportDescribeTrustedAdvisorCheckSummariesRequest new] completionHandler:^(AWSSupportDescribeTrustedAdvisorCheckSummariesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorChecks {
    NSString *key = @"testDescribeTrustedAdvisorChecks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] describeTrustedAdvisorChecks:[AWSSupportDescribeTrustedAdvisorChecksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorChecksCompletionHandler {
    NSString *key = @"testDescribeTrustedAdvisorChecks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] describeTrustedAdvisorChecks:[AWSSupportDescribeTrustedAdvisorChecksRequest new] completionHandler:^(AWSSupportDescribeTrustedAdvisorChecksResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testRefreshTrustedAdvisorCheck {
    NSString *key = @"testRefreshTrustedAdvisorCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] refreshTrustedAdvisorCheck:[AWSSupportRefreshTrustedAdvisorCheckRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testRefreshTrustedAdvisorCheckCompletionHandler {
    NSString *key = @"testRefreshTrustedAdvisorCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] refreshTrustedAdvisorCheck:[AWSSupportRefreshTrustedAdvisorCheckRequest new] completionHandler:^(AWSSupportRefreshTrustedAdvisorCheckResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testResolveCase {
    NSString *key = @"testResolveCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSupport SupportForKey:key] resolveCase:[AWSSupportResolveCaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

- (void)testResolveCaseCompletionHandler {
    NSString *key = @"testResolveCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSupport registerSupportWithConfiguration:configuration forKey:key];

    AWSSupport *awsClient = [AWSSupport SupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSupport SupportForKey:key] resolveCase:[AWSSupportResolveCaseRequest new] completionHandler:^(AWSSupportResolveCaseResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSupport removeSupportForKey:key];
}

@end
