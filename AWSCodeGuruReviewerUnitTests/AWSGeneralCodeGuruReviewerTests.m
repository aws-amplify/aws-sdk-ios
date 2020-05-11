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
#import "AWSCodeGuruReviewerService.h"

static id mockNetworking = nil;

@interface AWSGeneralCodeGuruReviewerTests : XCTestCase

@end

@implementation AWSGeneralCodeGuruReviewerTests

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
    NSString *key = @"testCodeGuruReviewerConstructors";
    XCTAssertNotNil([AWSCodeGuruReviewer defaultCodeGuruReviewer]);
    XCTAssertEqual([[AWSCodeGuruReviewer defaultCodeGuruReviewer] class], [AWSCodeGuruReviewer class]);
    XCTAssertNil([AWSCodeGuruReviewer CodeGuruReviewerForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCodeGuruReviewer CodeGuruReviewerForKey:key]);
    XCTAssertEqual([[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] class], [AWSCodeGuruReviewer class]);
    XCTAssertEqual([AWSCodeGuruReviewer CodeGuruReviewerForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
    XCTAssertNil([AWSCodeGuruReviewer CodeGuruReviewerForKey:key]);

}

- (void)testAssociateRepository {
    NSString *key = @"testAssociateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] associateRepository:[AWSCodeGuruReviewerAssociateRepositoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testAssociateRepositoryCompletionHandler {
    NSString *key = @"testAssociateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] associateRepository:[AWSCodeGuruReviewerAssociateRepositoryRequest new] completionHandler:^(AWSCodeGuruReviewerAssociateRepositoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testDescribeCodeReview {
    NSString *key = @"testDescribeCodeReview";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] describeCodeReview:[AWSCodeGuruReviewerDescribeCodeReviewRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testDescribeCodeReviewCompletionHandler {
    NSString *key = @"testDescribeCodeReview";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] describeCodeReview:[AWSCodeGuruReviewerDescribeCodeReviewRequest new] completionHandler:^(AWSCodeGuruReviewerDescribeCodeReviewResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testDescribeRecommendationFeedback {
    NSString *key = @"testDescribeRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] describeRecommendationFeedback:[AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testDescribeRecommendationFeedbackCompletionHandler {
    NSString *key = @"testDescribeRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] describeRecommendationFeedback:[AWSCodeGuruReviewerDescribeRecommendationFeedbackRequest new] completionHandler:^(AWSCodeGuruReviewerDescribeRecommendationFeedbackResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testDescribeRepositoryAssociation {
    NSString *key = @"testDescribeRepositoryAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] describeRepositoryAssociation:[AWSCodeGuruReviewerDescribeRepositoryAssociationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testDescribeRepositoryAssociationCompletionHandler {
    NSString *key = @"testDescribeRepositoryAssociation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] describeRepositoryAssociation:[AWSCodeGuruReviewerDescribeRepositoryAssociationRequest new] completionHandler:^(AWSCodeGuruReviewerDescribeRepositoryAssociationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testDisassociateRepository {
    NSString *key = @"testDisassociateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] disassociateRepository:[AWSCodeGuruReviewerDisassociateRepositoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testDisassociateRepositoryCompletionHandler {
    NSString *key = @"testDisassociateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] disassociateRepository:[AWSCodeGuruReviewerDisassociateRepositoryRequest new] completionHandler:^(AWSCodeGuruReviewerDisassociateRepositoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testListCodeReviews {
    NSString *key = @"testListCodeReviews";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] listCodeReviews:[AWSCodeGuruReviewerListCodeReviewsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testListCodeReviewsCompletionHandler {
    NSString *key = @"testListCodeReviews";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] listCodeReviews:[AWSCodeGuruReviewerListCodeReviewsRequest new] completionHandler:^(AWSCodeGuruReviewerListCodeReviewsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testListRecommendationFeedback {
    NSString *key = @"testListRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] listRecommendationFeedback:[AWSCodeGuruReviewerListRecommendationFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testListRecommendationFeedbackCompletionHandler {
    NSString *key = @"testListRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] listRecommendationFeedback:[AWSCodeGuruReviewerListRecommendationFeedbackRequest new] completionHandler:^(AWSCodeGuruReviewerListRecommendationFeedbackResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testListRecommendations {
    NSString *key = @"testListRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] listRecommendations:[AWSCodeGuruReviewerListRecommendationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testListRecommendationsCompletionHandler {
    NSString *key = @"testListRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] listRecommendations:[AWSCodeGuruReviewerListRecommendationsRequest new] completionHandler:^(AWSCodeGuruReviewerListRecommendationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testListRepositoryAssociations {
    NSString *key = @"testListRepositoryAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] listRepositoryAssociations:[AWSCodeGuruReviewerListRepositoryAssociationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testListRepositoryAssociationsCompletionHandler {
    NSString *key = @"testListRepositoryAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] listRepositoryAssociations:[AWSCodeGuruReviewerListRepositoryAssociationsRequest new] completionHandler:^(AWSCodeGuruReviewerListRepositoryAssociationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testPutRecommendationFeedback {
    NSString *key = @"testPutRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] putRecommendationFeedback:[AWSCodeGuruReviewerPutRecommendationFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

- (void)testPutRecommendationFeedbackCompletionHandler {
    NSString *key = @"testPutRecommendationFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeGuruReviewer registerCodeGuruReviewerWithConfiguration:configuration forKey:key];

    AWSCodeGuruReviewer *awsClient = [AWSCodeGuruReviewer CodeGuruReviewerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeGuruReviewer CodeGuruReviewerForKey:key] putRecommendationFeedback:[AWSCodeGuruReviewerPutRecommendationFeedbackRequest new] completionHandler:^(AWSCodeGuruReviewerPutRecommendationFeedbackResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeGuruReviewer removeCodeGuruReviewerForKey:key];
}

@end
