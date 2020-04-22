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
#import "AWScodeguru-reviewerService.h"

static id mockNetworking = nil;

@interface AWSGeneralcodeguru-reviewerTests : XCTestCase

@end

@implementation AWSGeneralcodeguru-reviewerTests

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
    NSString *key = @"testcodeguru-reviewerConstructors";
    XCTAssertNotNil([AWScodeguru-reviewer defaultcodeguru-reviewer]);
    XCTAssertEqual([[AWScodeguru-reviewer defaultcodeguru-reviewer] class], [AWScodeguru-reviewer class]);
    XCTAssertNil([AWScodeguru-reviewer codeguru-reviewerForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWScodeguru-reviewer codeguru-reviewerForKey:key]);
    XCTAssertEqual([[AWScodeguru-reviewer codeguru-reviewerForKey:key] class], [AWScodeguru-reviewer class]);
    XCTAssertEqual([AWScodeguru-reviewer codeguru-reviewerForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
    XCTAssertNil([AWScodeguru-reviewer codeguru-reviewerForKey:key]);

}

- (void)testAssociateRepository {
    NSString *key = @"testAssociateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWScodeguru-reviewer codeguru-reviewerForKey:key] associateRepository:[AWScodeguru-reviewerAssociateRepositoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testAssociateRepositoryCompletionHandler {
    NSString *key = @"testAssociateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWScodeguru-reviewer codeguru-reviewerForKey:key] associateRepository:[AWScodeguru-reviewerAssociateRepositoryRequest new] completionHandler:^(AWScodeguru-reviewerAssociateRepositoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testDescribeCodeReview {
    NSString *key = @"testDescribeCodeReview";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWScodeguru-reviewer codeguru-reviewerForKey:key] describeCodeReview:[AWScodeguru-reviewerDescribeCodeReviewRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testDescribeCodeReviewCompletionHandler {
    NSString *key = @"testDescribeCodeReview";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWScodeguru-reviewer codeguru-reviewerForKey:key] describeCodeReview:[AWScodeguru-reviewerDescribeCodeReviewRequest new] completionHandler:^(AWScodeguru-reviewerDescribeCodeReviewResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testDescribeRecommendationFeedback {
    NSString *key = @"testDescribeRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWScodeguru-reviewer codeguru-reviewerForKey:key] describeRecommendationFeedback:[AWScodeguru-reviewerDescribeRecommendationFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testDescribeRecommendationFeedbackCompletionHandler {
    NSString *key = @"testDescribeRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWScodeguru-reviewer codeguru-reviewerForKey:key] describeRecommendationFeedback:[AWScodeguru-reviewerDescribeRecommendationFeedbackRequest new] completionHandler:^(AWScodeguru-reviewerDescribeRecommendationFeedbackResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testDescribeRepositoryAssociation {
    NSString *key = @"testDescribeRepositoryAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWScodeguru-reviewer codeguru-reviewerForKey:key] describeRepositoryAssociation:[AWScodeguru-reviewerDescribeRepositoryAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testDescribeRepositoryAssociationCompletionHandler {
    NSString *key = @"testDescribeRepositoryAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWScodeguru-reviewer codeguru-reviewerForKey:key] describeRepositoryAssociation:[AWScodeguru-reviewerDescribeRepositoryAssociationRequest new] completionHandler:^(AWScodeguru-reviewerDescribeRepositoryAssociationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testDisassociateRepository {
    NSString *key = @"testDisassociateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWScodeguru-reviewer codeguru-reviewerForKey:key] disassociateRepository:[AWScodeguru-reviewerDisassociateRepositoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testDisassociateRepositoryCompletionHandler {
    NSString *key = @"testDisassociateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWScodeguru-reviewer codeguru-reviewerForKey:key] disassociateRepository:[AWScodeguru-reviewerDisassociateRepositoryRequest new] completionHandler:^(AWScodeguru-reviewerDisassociateRepositoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testListCodeReviews {
    NSString *key = @"testListCodeReviews";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWScodeguru-reviewer codeguru-reviewerForKey:key] listCodeReviews:[AWScodeguru-reviewerListCodeReviewsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testListCodeReviewsCompletionHandler {
    NSString *key = @"testListCodeReviews";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWScodeguru-reviewer codeguru-reviewerForKey:key] listCodeReviews:[AWScodeguru-reviewerListCodeReviewsRequest new] completionHandler:^(AWScodeguru-reviewerListCodeReviewsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testListRecommendationFeedback {
    NSString *key = @"testListRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWScodeguru-reviewer codeguru-reviewerForKey:key] listRecommendationFeedback:[AWScodeguru-reviewerListRecommendationFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testListRecommendationFeedbackCompletionHandler {
    NSString *key = @"testListRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWScodeguru-reviewer codeguru-reviewerForKey:key] listRecommendationFeedback:[AWScodeguru-reviewerListRecommendationFeedbackRequest new] completionHandler:^(AWScodeguru-reviewerListRecommendationFeedbackResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testListRecommendations {
    NSString *key = @"testListRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWScodeguru-reviewer codeguru-reviewerForKey:key] listRecommendations:[AWScodeguru-reviewerListRecommendationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testListRecommendationsCompletionHandler {
    NSString *key = @"testListRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWScodeguru-reviewer codeguru-reviewerForKey:key] listRecommendations:[AWScodeguru-reviewerListRecommendationsRequest new] completionHandler:^(AWScodeguru-reviewerListRecommendationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testListRepositoryAssociations {
    NSString *key = @"testListRepositoryAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWScodeguru-reviewer codeguru-reviewerForKey:key] listRepositoryAssociations:[AWScodeguru-reviewerListRepositoryAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testListRepositoryAssociationsCompletionHandler {
    NSString *key = @"testListRepositoryAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWScodeguru-reviewer codeguru-reviewerForKey:key] listRepositoryAssociations:[AWScodeguru-reviewerListRepositoryAssociationsRequest new] completionHandler:^(AWScodeguru-reviewerListRepositoryAssociationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testPutRecommendationFeedback {
    NSString *key = @"testPutRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWScodeguru-reviewer codeguru-reviewerForKey:key] putRecommendationFeedback:[AWScodeguru-reviewerPutRecommendationFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

- (void)testPutRecommendationFeedbackCompletionHandler {
    NSString *key = @"testPutRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWScodeguru-reviewer registercodeguru-reviewerWithConfiguration:configuration forKey:key];

    AWScodeguru-reviewer *awsClient = [AWScodeguru-reviewer codeguru-reviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWScodeguru-reviewer codeguru-reviewerForKey:key] putRecommendationFeedback:[AWScodeguru-reviewerPutRecommendationFeedbackRequest new] completionHandler:^(AWScodeguru-reviewerPutRecommendationFeedbackResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWScodeguru-reviewer removecodeguru-reviewerForKey:key];
}

@end
