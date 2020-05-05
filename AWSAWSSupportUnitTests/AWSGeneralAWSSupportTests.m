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
#import "AWSAWSSupportService.h"

static id mockNetworking = nil;

@interface AWSGeneralAWSSupportTests : XCTestCase

@end

@implementation AWSGeneralAWSSupportTests

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
    NSString *key = @"testAWSSupportConstructors";
    XCTAssertNotNil([AWSAWSSupport defaultAWSSupport]);
    XCTAssertEqual([[AWSAWSSupport defaultAWSSupport] class], [AWSAWSSupport class]);
    XCTAssertNil([AWSAWSSupport AWSSupportForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSAWSSupport AWSSupportForKey:key]);
    XCTAssertEqual([[AWSAWSSupport AWSSupportForKey:key] class], [AWSAWSSupport class]);
    XCTAssertEqual([AWSAWSSupport AWSSupportForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSAWSSupport removeAWSSupportForKey:key];
    XCTAssertNil([AWSAWSSupport AWSSupportForKey:key]);

}

- (void)testAddAttachmentsToSet {
    NSString *key = @"testAddAttachmentsToSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] addAttachmentsToSet:[AWSAWSSupportAddAttachmentsToSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testAddAttachmentsToSetCompletionHandler {
    NSString *key = @"testAddAttachmentsToSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] addAttachmentsToSet:[AWSAWSSupportAddAttachmentsToSetRequest new] completionHandler:^(AWSAWSSupportAddAttachmentsToSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testAddCommunicationToCase {
    NSString *key = @"testAddCommunicationToCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] addCommunicationToCase:[AWSAWSSupportAddCommunicationToCaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testAddCommunicationToCaseCompletionHandler {
    NSString *key = @"testAddCommunicationToCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] addCommunicationToCase:[AWSAWSSupportAddCommunicationToCaseRequest new] completionHandler:^(AWSAWSSupportAddCommunicationToCaseResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testCreateCase {
    NSString *key = @"testCreateCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] createCase:[AWSAWSSupportCreateCaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testCreateCaseCompletionHandler {
    NSString *key = @"testCreateCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] createCase:[AWSAWSSupportCreateCaseRequest new] completionHandler:^(AWSAWSSupportCreateCaseResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeAttachment {
    NSString *key = @"testDescribeAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] describeAttachment:[AWSAWSSupportDescribeAttachmentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeAttachmentCompletionHandler {
    NSString *key = @"testDescribeAttachment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] describeAttachment:[AWSAWSSupportDescribeAttachmentRequest new] completionHandler:^(AWSAWSSupportDescribeAttachmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeCases {
    NSString *key = @"testDescribeCases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] describeCases:[AWSAWSSupportDescribeCasesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeCasesCompletionHandler {
    NSString *key = @"testDescribeCases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] describeCases:[AWSAWSSupportDescribeCasesRequest new] completionHandler:^(AWSAWSSupportDescribeCasesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeCommunications {
    NSString *key = @"testDescribeCommunications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] describeCommunications:[AWSAWSSupportDescribeCommunicationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeCommunicationsCompletionHandler {
    NSString *key = @"testDescribeCommunications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] describeCommunications:[AWSAWSSupportDescribeCommunicationsRequest new] completionHandler:^(AWSAWSSupportDescribeCommunicationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeServices {
    NSString *key = @"testDescribeServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] describeServices:[AWSAWSSupportDescribeServicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeServicesCompletionHandler {
    NSString *key = @"testDescribeServices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] describeServices:[AWSAWSSupportDescribeServicesRequest new] completionHandler:^(AWSAWSSupportDescribeServicesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeSeverityLevels {
    NSString *key = @"testDescribeSeverityLevels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] describeSeverityLevels:[AWSAWSSupportDescribeSeverityLevelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeSeverityLevelsCompletionHandler {
    NSString *key = @"testDescribeSeverityLevels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] describeSeverityLevels:[AWSAWSSupportDescribeSeverityLevelsRequest new] completionHandler:^(AWSAWSSupportDescribeSeverityLevelsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckRefreshStatuses {
    NSString *key = @"testDescribeTrustedAdvisorCheckRefreshStatuses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] describeTrustedAdvisorCheckRefreshStatuses:[AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckRefreshStatusesCompletionHandler {
    NSString *key = @"testDescribeTrustedAdvisorCheckRefreshStatuses";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] describeTrustedAdvisorCheckRefreshStatuses:[AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest new] completionHandler:^(AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckResult {
    NSString *key = @"testDescribeTrustedAdvisorCheckResult";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] describeTrustedAdvisorCheckResult:[AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckResultCompletionHandler {
    NSString *key = @"testDescribeTrustedAdvisorCheckResult";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] describeTrustedAdvisorCheckResult:[AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest new] completionHandler:^(AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckSummaries {
    NSString *key = @"testDescribeTrustedAdvisorCheckSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] describeTrustedAdvisorCheckSummaries:[AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorCheckSummariesCompletionHandler {
    NSString *key = @"testDescribeTrustedAdvisorCheckSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] describeTrustedAdvisorCheckSummaries:[AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest new] completionHandler:^(AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorChecks {
    NSString *key = @"testDescribeTrustedAdvisorChecks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] describeTrustedAdvisorChecks:[AWSAWSSupportDescribeTrustedAdvisorChecksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testDescribeTrustedAdvisorChecksCompletionHandler {
    NSString *key = @"testDescribeTrustedAdvisorChecks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] describeTrustedAdvisorChecks:[AWSAWSSupportDescribeTrustedAdvisorChecksRequest new] completionHandler:^(AWSAWSSupportDescribeTrustedAdvisorChecksResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testRefreshTrustedAdvisorCheck {
    NSString *key = @"testRefreshTrustedAdvisorCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] refreshTrustedAdvisorCheck:[AWSAWSSupportRefreshTrustedAdvisorCheckRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testRefreshTrustedAdvisorCheckCompletionHandler {
    NSString *key = @"testRefreshTrustedAdvisorCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] refreshTrustedAdvisorCheck:[AWSAWSSupportRefreshTrustedAdvisorCheckRequest new] completionHandler:^(AWSAWSSupportRefreshTrustedAdvisorCheckResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testResolveCase {
    NSString *key = @"testResolveCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSSupport AWSSupportForKey:key] resolveCase:[AWSAWSSupportResolveCaseRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

- (void)testResolveCaseCompletionHandler {
    NSString *key = @"testResolveCase";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSSupport registerAWSSupportWithConfiguration:configuration forKey:key];

    AWSAWSSupport *awsClient = [AWSAWSSupport AWSSupportForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSSupport AWSSupportForKey:key] resolveCase:[AWSAWSSupportResolveCaseRequest new] completionHandler:^(AWSAWSSupportResolveCaseResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSSupport removeAWSSupportForKey:key];
}

@end
