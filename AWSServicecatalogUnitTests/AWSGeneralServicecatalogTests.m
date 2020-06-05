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
#import "AWSServicecatalogService.h"

static id mockNetworking = nil;

@interface AWSGeneralServicecatalogTests : XCTestCase

@end

@implementation AWSGeneralServicecatalogTests

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
    NSString *key = @"testServicecatalogConstructors";
    XCTAssertNotNil([AWSServicecatalog defaultServicecatalog]);
    XCTAssertEqual([[AWSServicecatalog defaultServicecatalog] class], [AWSServicecatalog class]);
    XCTAssertNil([AWSServicecatalog ServicecatalogForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSServicecatalog ServicecatalogForKey:key]);
    XCTAssertEqual([[AWSServicecatalog ServicecatalogForKey:key] class], [AWSServicecatalog class]);
    XCTAssertEqual([AWSServicecatalog ServicecatalogForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSServicecatalog removeServicecatalogForKey:key];
    XCTAssertNil([AWSServicecatalog ServicecatalogForKey:key]);

}

- (void)testAcceptPortfolioShare {
    NSString *key = @"testAcceptPortfolioShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] acceptPortfolioShare:[AWSServicecatalogAcceptPortfolioShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAcceptPortfolioShareCompletionHandler {
    NSString *key = @"testAcceptPortfolioShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] acceptPortfolioShare:[AWSServicecatalogAcceptPortfolioShareInput new] completionHandler:^(AWSServicecatalogAcceptPortfolioShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAssociateBudgetWithResource {
    NSString *key = @"testAssociateBudgetWithResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] associateBudgetWithResource:[AWSServicecatalogAssociateBudgetWithResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAssociateBudgetWithResourceCompletionHandler {
    NSString *key = @"testAssociateBudgetWithResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] associateBudgetWithResource:[AWSServicecatalogAssociateBudgetWithResourceInput new] completionHandler:^(AWSServicecatalogAssociateBudgetWithResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAssociatePrincipalWithPortfolio {
    NSString *key = @"testAssociatePrincipalWithPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] associatePrincipalWithPortfolio:[AWSServicecatalogAssociatePrincipalWithPortfolioInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAssociatePrincipalWithPortfolioCompletionHandler {
    NSString *key = @"testAssociatePrincipalWithPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] associatePrincipalWithPortfolio:[AWSServicecatalogAssociatePrincipalWithPortfolioInput new] completionHandler:^(AWSServicecatalogAssociatePrincipalWithPortfolioOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAssociateProductWithPortfolio {
    NSString *key = @"testAssociateProductWithPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] associateProductWithPortfolio:[AWSServicecatalogAssociateProductWithPortfolioInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAssociateProductWithPortfolioCompletionHandler {
    NSString *key = @"testAssociateProductWithPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] associateProductWithPortfolio:[AWSServicecatalogAssociateProductWithPortfolioInput new] completionHandler:^(AWSServicecatalogAssociateProductWithPortfolioOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAssociateServiceActionWithProvisioningArtifact {
    NSString *key = @"testAssociateServiceActionWithProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] associateServiceActionWithProvisioningArtifact:[AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAssociateServiceActionWithProvisioningArtifactCompletionHandler {
    NSString *key = @"testAssociateServiceActionWithProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] associateServiceActionWithProvisioningArtifact:[AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput new] completionHandler:^(AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAssociateTagOptionWithResource {
    NSString *key = @"testAssociateTagOptionWithResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] associateTagOptionWithResource:[AWSServicecatalogAssociateTagOptionWithResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testAssociateTagOptionWithResourceCompletionHandler {
    NSString *key = @"testAssociateTagOptionWithResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] associateTagOptionWithResource:[AWSServicecatalogAssociateTagOptionWithResourceInput new] completionHandler:^(AWSServicecatalogAssociateTagOptionWithResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testBatchAssociateServiceActionWithProvisioningArtifact {
    NSString *key = @"testBatchAssociateServiceActionWithProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] batchAssociateServiceActionWithProvisioningArtifact:[AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testBatchAssociateServiceActionWithProvisioningArtifactCompletionHandler {
    NSString *key = @"testBatchAssociateServiceActionWithProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] batchAssociateServiceActionWithProvisioningArtifact:[AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput new] completionHandler:^(AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testBatchDisassociateServiceActionFromProvisioningArtifact {
    NSString *key = @"testBatchDisassociateServiceActionFromProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] batchDisassociateServiceActionFromProvisioningArtifact:[AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testBatchDisassociateServiceActionFromProvisioningArtifactCompletionHandler {
    NSString *key = @"testBatchDisassociateServiceActionFromProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] batchDisassociateServiceActionFromProvisioningArtifact:[AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput new] completionHandler:^(AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCopyProduct {
    NSString *key = @"testCopyProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] replicateProduct:[AWSServicecatalogReplicateProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCopyProductCompletionHandler {
    NSString *key = @"testCopyProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] replicateProduct:[AWSServicecatalogReplicateProductInput new] completionHandler:^(AWSServicecatalogReplicateProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateConstraint {
    NSString *key = @"testCreateConstraint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] createConstraint:[AWSServicecatalogCreateConstraintInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateConstraintCompletionHandler {
    NSString *key = @"testCreateConstraint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] createConstraint:[AWSServicecatalogCreateConstraintInput new] completionHandler:^(AWSServicecatalogCreateConstraintOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreatePortfolio {
    NSString *key = @"testCreatePortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] createPortfolio:[AWSServicecatalogCreatePortfolioInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreatePortfolioCompletionHandler {
    NSString *key = @"testCreatePortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] createPortfolio:[AWSServicecatalogCreatePortfolioInput new] completionHandler:^(AWSServicecatalogCreatePortfolioOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreatePortfolioShare {
    NSString *key = @"testCreatePortfolioShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] createPortfolioShare:[AWSServicecatalogCreatePortfolioShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreatePortfolioShareCompletionHandler {
    NSString *key = @"testCreatePortfolioShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] createPortfolioShare:[AWSServicecatalogCreatePortfolioShareInput new] completionHandler:^(AWSServicecatalogCreatePortfolioShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateProduct {
    NSString *key = @"testCreateProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] createProduct:[AWSServicecatalogCreateProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateProductCompletionHandler {
    NSString *key = @"testCreateProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] createProduct:[AWSServicecatalogCreateProductInput new] completionHandler:^(AWSServicecatalogCreateProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateProvisionedProductPlan {
    NSString *key = @"testCreateProvisionedProductPlan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] createProvisionedProductPlan:[AWSServicecatalogCreateProvisionedProductPlanInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateProvisionedProductPlanCompletionHandler {
    NSString *key = @"testCreateProvisionedProductPlan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] createProvisionedProductPlan:[AWSServicecatalogCreateProvisionedProductPlanInput new] completionHandler:^(AWSServicecatalogCreateProvisionedProductPlanOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateProvisioningArtifact {
    NSString *key = @"testCreateProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] createProvisioningArtifact:[AWSServicecatalogCreateProvisioningArtifactInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateProvisioningArtifactCompletionHandler {
    NSString *key = @"testCreateProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] createProvisioningArtifact:[AWSServicecatalogCreateProvisioningArtifactInput new] completionHandler:^(AWSServicecatalogCreateProvisioningArtifactOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateServiceAction {
    NSString *key = @"testCreateServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] createServiceAction:[AWSServicecatalogCreateServiceActionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateServiceActionCompletionHandler {
    NSString *key = @"testCreateServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] createServiceAction:[AWSServicecatalogCreateServiceActionInput new] completionHandler:^(AWSServicecatalogCreateServiceActionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateTagOption {
    NSString *key = @"testCreateTagOption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] createTagOption:[AWSServicecatalogCreateTagOptionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testCreateTagOptionCompletionHandler {
    NSString *key = @"testCreateTagOption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] createTagOption:[AWSServicecatalogCreateTagOptionInput new] completionHandler:^(AWSServicecatalogCreateTagOptionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteConstraint {
    NSString *key = @"testDeleteConstraint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] deleteConstraint:[AWSServicecatalogDeleteConstraintInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteConstraintCompletionHandler {
    NSString *key = @"testDeleteConstraint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] deleteConstraint:[AWSServicecatalogDeleteConstraintInput new] completionHandler:^(AWSServicecatalogDeleteConstraintOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeletePortfolio {
    NSString *key = @"testDeletePortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] deletePortfolio:[AWSServicecatalogDeletePortfolioInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeletePortfolioCompletionHandler {
    NSString *key = @"testDeletePortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] deletePortfolio:[AWSServicecatalogDeletePortfolioInput new] completionHandler:^(AWSServicecatalogDeletePortfolioOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeletePortfolioShare {
    NSString *key = @"testDeletePortfolioShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] deletePortfolioShare:[AWSServicecatalogDeletePortfolioShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeletePortfolioShareCompletionHandler {
    NSString *key = @"testDeletePortfolioShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] deletePortfolioShare:[AWSServicecatalogDeletePortfolioShareInput new] completionHandler:^(AWSServicecatalogDeletePortfolioShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteProduct {
    NSString *key = @"testDeleteProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] deleteProduct:[AWSServicecatalogDeleteProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteProductCompletionHandler {
    NSString *key = @"testDeleteProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] deleteProduct:[AWSServicecatalogDeleteProductInput new] completionHandler:^(AWSServicecatalogDeleteProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteProvisionedProductPlan {
    NSString *key = @"testDeleteProvisionedProductPlan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] deleteProvisionedProductPlan:[AWSServicecatalogDeleteProvisionedProductPlanInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteProvisionedProductPlanCompletionHandler {
    NSString *key = @"testDeleteProvisionedProductPlan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] deleteProvisionedProductPlan:[AWSServicecatalogDeleteProvisionedProductPlanInput new] completionHandler:^(AWSServicecatalogDeleteProvisionedProductPlanOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteProvisioningArtifact {
    NSString *key = @"testDeleteProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] deleteProvisioningArtifact:[AWSServicecatalogDeleteProvisioningArtifactInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteProvisioningArtifactCompletionHandler {
    NSString *key = @"testDeleteProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] deleteProvisioningArtifact:[AWSServicecatalogDeleteProvisioningArtifactInput new] completionHandler:^(AWSServicecatalogDeleteProvisioningArtifactOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteServiceAction {
    NSString *key = @"testDeleteServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] deleteServiceAction:[AWSServicecatalogDeleteServiceActionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteServiceActionCompletionHandler {
    NSString *key = @"testDeleteServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] deleteServiceAction:[AWSServicecatalogDeleteServiceActionInput new] completionHandler:^(AWSServicecatalogDeleteServiceActionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteTagOption {
    NSString *key = @"testDeleteTagOption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] deleteTagOption:[AWSServicecatalogDeleteTagOptionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDeleteTagOptionCompletionHandler {
    NSString *key = @"testDeleteTagOption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] deleteTagOption:[AWSServicecatalogDeleteTagOptionInput new] completionHandler:^(AWSServicecatalogDeleteTagOptionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeConstraint {
    NSString *key = @"testDescribeConstraint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeConstraint:[AWSServicecatalogDescribeConstraintInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeConstraintCompletionHandler {
    NSString *key = @"testDescribeConstraint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeConstraint:[AWSServicecatalogDescribeConstraintInput new] completionHandler:^(AWSServicecatalogDescribeConstraintOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeCopyProductStatus {
    NSString *key = @"testDescribeCopyProductStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeCopyProductStatus:[AWSServicecatalogDescribeCopyProductStatusInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeCopyProductStatusCompletionHandler {
    NSString *key = @"testDescribeCopyProductStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeCopyProductStatus:[AWSServicecatalogDescribeCopyProductStatusInput new] completionHandler:^(AWSServicecatalogDescribeCopyProductStatusOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribePortfolio {
    NSString *key = @"testDescribePortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describePortfolio:[AWSServicecatalogDescribePortfolioInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribePortfolioCompletionHandler {
    NSString *key = @"testDescribePortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describePortfolio:[AWSServicecatalogDescribePortfolioInput new] completionHandler:^(AWSServicecatalogDescribePortfolioOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribePortfolioShareStatus {
    NSString *key = @"testDescribePortfolioShareStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describePortfolioShareStatus:[AWSServicecatalogDescribePortfolioShareStatusInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribePortfolioShareStatusCompletionHandler {
    NSString *key = @"testDescribePortfolioShareStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describePortfolioShareStatus:[AWSServicecatalogDescribePortfolioShareStatusInput new] completionHandler:^(AWSServicecatalogDescribePortfolioShareStatusOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProduct {
    NSString *key = @"testDescribeProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeProduct:[AWSServicecatalogDescribeProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProductCompletionHandler {
    NSString *key = @"testDescribeProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeProduct:[AWSServicecatalogDescribeProductInput new] completionHandler:^(AWSServicecatalogDescribeProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProductAsAdmin {
    NSString *key = @"testDescribeProductAsAdmin";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeProductAsAdmin:[AWSServicecatalogDescribeProductAsAdminInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProductAsAdminCompletionHandler {
    NSString *key = @"testDescribeProductAsAdmin";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeProductAsAdmin:[AWSServicecatalogDescribeProductAsAdminInput new] completionHandler:^(AWSServicecatalogDescribeProductAsAdminOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProductView {
    NSString *key = @"testDescribeProductView";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeProductView:[AWSServicecatalogDescribeProductViewInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProductViewCompletionHandler {
    NSString *key = @"testDescribeProductView";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeProductView:[AWSServicecatalogDescribeProductViewInput new] completionHandler:^(AWSServicecatalogDescribeProductViewOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProvisionedProduct {
    NSString *key = @"testDescribeProvisionedProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeProvisionedProduct:[AWSServicecatalogDescribeProvisionedProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProvisionedProductCompletionHandler {
    NSString *key = @"testDescribeProvisionedProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeProvisionedProduct:[AWSServicecatalogDescribeProvisionedProductInput new] completionHandler:^(AWSServicecatalogDescribeProvisionedProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProvisionedProductPlan {
    NSString *key = @"testDescribeProvisionedProductPlan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeProvisionedProductPlan:[AWSServicecatalogDescribeProvisionedProductPlanInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProvisionedProductPlanCompletionHandler {
    NSString *key = @"testDescribeProvisionedProductPlan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeProvisionedProductPlan:[AWSServicecatalogDescribeProvisionedProductPlanInput new] completionHandler:^(AWSServicecatalogDescribeProvisionedProductPlanOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProvisioningArtifact {
    NSString *key = @"testDescribeProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeProvisioningArtifact:[AWSServicecatalogDescribeProvisioningArtifactInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProvisioningArtifactCompletionHandler {
    NSString *key = @"testDescribeProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeProvisioningArtifact:[AWSServicecatalogDescribeProvisioningArtifactInput new] completionHandler:^(AWSServicecatalogDescribeProvisioningArtifactOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProvisioningParameters {
    NSString *key = @"testDescribeProvisioningParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeProvisioningParameters:[AWSServicecatalogDescribeProvisioningParametersInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeProvisioningParametersCompletionHandler {
    NSString *key = @"testDescribeProvisioningParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeProvisioningParameters:[AWSServicecatalogDescribeProvisioningParametersInput new] completionHandler:^(AWSServicecatalogDescribeProvisioningParametersOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeRecord {
    NSString *key = @"testDescribeRecord";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeRecord:[AWSServicecatalogDescribeRecordInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeRecordCompletionHandler {
    NSString *key = @"testDescribeRecord";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeRecord:[AWSServicecatalogDescribeRecordInput new] completionHandler:^(AWSServicecatalogDescribeRecordOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeServiceAction {
    NSString *key = @"testDescribeServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeServiceAction:[AWSServicecatalogDescribeServiceActionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeServiceActionCompletionHandler {
    NSString *key = @"testDescribeServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeServiceAction:[AWSServicecatalogDescribeServiceActionInput new] completionHandler:^(AWSServicecatalogDescribeServiceActionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeServiceActionExecutionParameters {
    NSString *key = @"testDescribeServiceActionExecutionParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeServiceActionExecutionParameters:[AWSServicecatalogDescribeServiceActionExecutionParametersInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeServiceActionExecutionParametersCompletionHandler {
    NSString *key = @"testDescribeServiceActionExecutionParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeServiceActionExecutionParameters:[AWSServicecatalogDescribeServiceActionExecutionParametersInput new] completionHandler:^(AWSServicecatalogDescribeServiceActionExecutionParametersOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeTagOption {
    NSString *key = @"testDescribeTagOption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] describeTagOption:[AWSServicecatalogDescribeTagOptionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDescribeTagOptionCompletionHandler {
    NSString *key = @"testDescribeTagOption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] describeTagOption:[AWSServicecatalogDescribeTagOptionInput new] completionHandler:^(AWSServicecatalogDescribeTagOptionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisableAWSOrganizationsAccess {
    NSString *key = @"testDisableAWSOrganizationsAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] disableAWSOrganizationsAccess:[AWSServicecatalogDisableAWSOrganizationsAccessInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisableAWSOrganizationsAccessCompletionHandler {
    NSString *key = @"testDisableAWSOrganizationsAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] disableAWSOrganizationsAccess:[AWSServicecatalogDisableAWSOrganizationsAccessInput new] completionHandler:^(AWSServicecatalogDisableAWSOrganizationsAccessOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisassociateBudgetFromResource {
    NSString *key = @"testDisassociateBudgetFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] disassociateBudgetFromResource:[AWSServicecatalogDisassociateBudgetFromResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisassociateBudgetFromResourceCompletionHandler {
    NSString *key = @"testDisassociateBudgetFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] disassociateBudgetFromResource:[AWSServicecatalogDisassociateBudgetFromResourceInput new] completionHandler:^(AWSServicecatalogDisassociateBudgetFromResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisassociatePrincipalFromPortfolio {
    NSString *key = @"testDisassociatePrincipalFromPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] disassociatePrincipalFromPortfolio:[AWSServicecatalogDisassociatePrincipalFromPortfolioInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisassociatePrincipalFromPortfolioCompletionHandler {
    NSString *key = @"testDisassociatePrincipalFromPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] disassociatePrincipalFromPortfolio:[AWSServicecatalogDisassociatePrincipalFromPortfolioInput new] completionHandler:^(AWSServicecatalogDisassociatePrincipalFromPortfolioOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisassociateProductFromPortfolio {
    NSString *key = @"testDisassociateProductFromPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] disassociateProductFromPortfolio:[AWSServicecatalogDisassociateProductFromPortfolioInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisassociateProductFromPortfolioCompletionHandler {
    NSString *key = @"testDisassociateProductFromPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] disassociateProductFromPortfolio:[AWSServicecatalogDisassociateProductFromPortfolioInput new] completionHandler:^(AWSServicecatalogDisassociateProductFromPortfolioOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisassociateServiceActionFromProvisioningArtifact {
    NSString *key = @"testDisassociateServiceActionFromProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] disassociateServiceActionFromProvisioningArtifact:[AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisassociateServiceActionFromProvisioningArtifactCompletionHandler {
    NSString *key = @"testDisassociateServiceActionFromProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] disassociateServiceActionFromProvisioningArtifact:[AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput new] completionHandler:^(AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisassociateTagOptionFromResource {
    NSString *key = @"testDisassociateTagOptionFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] disassociateTagOptionFromResource:[AWSServicecatalogDisassociateTagOptionFromResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testDisassociateTagOptionFromResourceCompletionHandler {
    NSString *key = @"testDisassociateTagOptionFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] disassociateTagOptionFromResource:[AWSServicecatalogDisassociateTagOptionFromResourceInput new] completionHandler:^(AWSServicecatalogDisassociateTagOptionFromResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testEnableAWSOrganizationsAccess {
    NSString *key = @"testEnableAWSOrganizationsAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] enableAWSOrganizationsAccess:[AWSServicecatalogEnableAWSOrganizationsAccessInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testEnableAWSOrganizationsAccessCompletionHandler {
    NSString *key = @"testEnableAWSOrganizationsAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] enableAWSOrganizationsAccess:[AWSServicecatalogEnableAWSOrganizationsAccessInput new] completionHandler:^(AWSServicecatalogEnableAWSOrganizationsAccessOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testExecuteProvisionedProductPlan {
    NSString *key = @"testExecuteProvisionedProductPlan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] executeProvisionedProductPlan:[AWSServicecatalogExecuteProvisionedProductPlanInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testExecuteProvisionedProductPlanCompletionHandler {
    NSString *key = @"testExecuteProvisionedProductPlan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] executeProvisionedProductPlan:[AWSServicecatalogExecuteProvisionedProductPlanInput new] completionHandler:^(AWSServicecatalogExecuteProvisionedProductPlanOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testExecuteProvisionedProductServiceAction {
    NSString *key = @"testExecuteProvisionedProductServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] executeProvisionedProductServiceAction:[AWSServicecatalogExecuteProvisionedProductServiceActionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testExecuteProvisionedProductServiceActionCompletionHandler {
    NSString *key = @"testExecuteProvisionedProductServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] executeProvisionedProductServiceAction:[AWSServicecatalogExecuteProvisionedProductServiceActionInput new] completionHandler:^(AWSServicecatalogExecuteProvisionedProductServiceActionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testGetAWSOrganizationsAccessStatus {
    NSString *key = @"testGetAWSOrganizationsAccessStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] getAWSOrganizationsAccessStatus:[AWSServicecatalogGetAWSOrganizationsAccessStatusInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testGetAWSOrganizationsAccessStatusCompletionHandler {
    NSString *key = @"testGetAWSOrganizationsAccessStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] getAWSOrganizationsAccessStatus:[AWSServicecatalogGetAWSOrganizationsAccessStatusInput new] completionHandler:^(AWSServicecatalogGetAWSOrganizationsAccessStatusOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListAcceptedPortfolioShares {
    NSString *key = @"testListAcceptedPortfolioShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listAcceptedPortfolioShares:[AWSServicecatalogListAcceptedPortfolioSharesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListAcceptedPortfolioSharesCompletionHandler {
    NSString *key = @"testListAcceptedPortfolioShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listAcceptedPortfolioShares:[AWSServicecatalogListAcceptedPortfolioSharesInput new] completionHandler:^(AWSServicecatalogListAcceptedPortfolioSharesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListBudgetsForResource {
    NSString *key = @"testListBudgetsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listBudgetsForResource:[AWSServicecatalogListBudgetsForResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListBudgetsForResourceCompletionHandler {
    NSString *key = @"testListBudgetsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listBudgetsForResource:[AWSServicecatalogListBudgetsForResourceInput new] completionHandler:^(AWSServicecatalogListBudgetsForResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListConstraintsForPortfolio {
    NSString *key = @"testListConstraintsForPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listConstraintsForPortfolio:[AWSServicecatalogListConstraintsForPortfolioInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListConstraintsForPortfolioCompletionHandler {
    NSString *key = @"testListConstraintsForPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listConstraintsForPortfolio:[AWSServicecatalogListConstraintsForPortfolioInput new] completionHandler:^(AWSServicecatalogListConstraintsForPortfolioOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListLaunchPaths {
    NSString *key = @"testListLaunchPaths";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listLaunchPaths:[AWSServicecatalogListLaunchPathsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListLaunchPathsCompletionHandler {
    NSString *key = @"testListLaunchPaths";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listLaunchPaths:[AWSServicecatalogListLaunchPathsInput new] completionHandler:^(AWSServicecatalogListLaunchPathsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListOrganizationPortfolioAccess {
    NSString *key = @"testListOrganizationPortfolioAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listOrganizationPortfolioAccess:[AWSServicecatalogListOrganizationPortfolioAccessInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListOrganizationPortfolioAccessCompletionHandler {
    NSString *key = @"testListOrganizationPortfolioAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listOrganizationPortfolioAccess:[AWSServicecatalogListOrganizationPortfolioAccessInput new] completionHandler:^(AWSServicecatalogListOrganizationPortfolioAccessOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListPortfolioAccess {
    NSString *key = @"testListPortfolioAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listPortfolioAccess:[AWSServicecatalogListPortfolioAccessInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListPortfolioAccessCompletionHandler {
    NSString *key = @"testListPortfolioAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listPortfolioAccess:[AWSServicecatalogListPortfolioAccessInput new] completionHandler:^(AWSServicecatalogListPortfolioAccessOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListPortfolios {
    NSString *key = @"testListPortfolios";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listPortfolios:[AWSServicecatalogListPortfoliosInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListPortfoliosCompletionHandler {
    NSString *key = @"testListPortfolios";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listPortfolios:[AWSServicecatalogListPortfoliosInput new] completionHandler:^(AWSServicecatalogListPortfoliosOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListPortfoliosForProduct {
    NSString *key = @"testListPortfoliosForProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listPortfoliosForProduct:[AWSServicecatalogListPortfoliosForProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListPortfoliosForProductCompletionHandler {
    NSString *key = @"testListPortfoliosForProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listPortfoliosForProduct:[AWSServicecatalogListPortfoliosForProductInput new] completionHandler:^(AWSServicecatalogListPortfoliosForProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListPrincipalsForPortfolio {
    NSString *key = @"testListPrincipalsForPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listPrincipalsForPortfolio:[AWSServicecatalogListPrincipalsForPortfolioInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListPrincipalsForPortfolioCompletionHandler {
    NSString *key = @"testListPrincipalsForPortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listPrincipalsForPortfolio:[AWSServicecatalogListPrincipalsForPortfolioInput new] completionHandler:^(AWSServicecatalogListPrincipalsForPortfolioOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListProvisionedProductPlans {
    NSString *key = @"testListProvisionedProductPlans";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listProvisionedProductPlans:[AWSServicecatalogListProvisionedProductPlansInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListProvisionedProductPlansCompletionHandler {
    NSString *key = @"testListProvisionedProductPlans";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listProvisionedProductPlans:[AWSServicecatalogListProvisionedProductPlansInput new] completionHandler:^(AWSServicecatalogListProvisionedProductPlansOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListProvisioningArtifacts {
    NSString *key = @"testListProvisioningArtifacts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listProvisioningArtifacts:[AWSServicecatalogListProvisioningArtifactsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListProvisioningArtifactsCompletionHandler {
    NSString *key = @"testListProvisioningArtifacts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listProvisioningArtifacts:[AWSServicecatalogListProvisioningArtifactsInput new] completionHandler:^(AWSServicecatalogListProvisioningArtifactsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListProvisioningArtifactsForServiceAction {
    NSString *key = @"testListProvisioningArtifactsForServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listProvisioningArtifactsForServiceAction:[AWSServicecatalogListProvisioningArtifactsForServiceActionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListProvisioningArtifactsForServiceActionCompletionHandler {
    NSString *key = @"testListProvisioningArtifactsForServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listProvisioningArtifactsForServiceAction:[AWSServicecatalogListProvisioningArtifactsForServiceActionInput new] completionHandler:^(AWSServicecatalogListProvisioningArtifactsForServiceActionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListRecordHistory {
    NSString *key = @"testListRecordHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listRecordHistory:[AWSServicecatalogListRecordHistoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListRecordHistoryCompletionHandler {
    NSString *key = @"testListRecordHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listRecordHistory:[AWSServicecatalogListRecordHistoryInput new] completionHandler:^(AWSServicecatalogListRecordHistoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListResourcesForTagOption {
    NSString *key = @"testListResourcesForTagOption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listResourcesForTagOption:[AWSServicecatalogListResourcesForTagOptionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListResourcesForTagOptionCompletionHandler {
    NSString *key = @"testListResourcesForTagOption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listResourcesForTagOption:[AWSServicecatalogListResourcesForTagOptionInput new] completionHandler:^(AWSServicecatalogListResourcesForTagOptionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListServiceActions {
    NSString *key = @"testListServiceActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listServiceActions:[AWSServicecatalogListServiceActionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListServiceActionsCompletionHandler {
    NSString *key = @"testListServiceActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listServiceActions:[AWSServicecatalogListServiceActionsInput new] completionHandler:^(AWSServicecatalogListServiceActionsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListServiceActionsForProvisioningArtifact {
    NSString *key = @"testListServiceActionsForProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listServiceActionsForProvisioningArtifact:[AWSServicecatalogListServiceActionsForProvisioningArtifactInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListServiceActionsForProvisioningArtifactCompletionHandler {
    NSString *key = @"testListServiceActionsForProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listServiceActionsForProvisioningArtifact:[AWSServicecatalogListServiceActionsForProvisioningArtifactInput new] completionHandler:^(AWSServicecatalogListServiceActionsForProvisioningArtifactOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListStackInstancesForProvisionedProduct {
    NSString *key = @"testListStackInstancesForProvisionedProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listStackInstancesForProvisionedProduct:[AWSServicecatalogListStackInstancesForProvisionedProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListStackInstancesForProvisionedProductCompletionHandler {
    NSString *key = @"testListStackInstancesForProvisionedProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listStackInstancesForProvisionedProduct:[AWSServicecatalogListStackInstancesForProvisionedProductInput new] completionHandler:^(AWSServicecatalogListStackInstancesForProvisionedProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListTagOptions {
    NSString *key = @"testListTagOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] listTagOptions:[AWSServicecatalogListTagOptionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testListTagOptionsCompletionHandler {
    NSString *key = @"testListTagOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] listTagOptions:[AWSServicecatalogListTagOptionsInput new] completionHandler:^(AWSServicecatalogListTagOptionsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testProvisionProduct {
    NSString *key = @"testProvisionProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] provisionProduct:[AWSServicecatalogProvisionProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testProvisionProductCompletionHandler {
    NSString *key = @"testProvisionProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] provisionProduct:[AWSServicecatalogProvisionProductInput new] completionHandler:^(AWSServicecatalogProvisionProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testRejectPortfolioShare {
    NSString *key = @"testRejectPortfolioShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] rejectPortfolioShare:[AWSServicecatalogRejectPortfolioShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testRejectPortfolioShareCompletionHandler {
    NSString *key = @"testRejectPortfolioShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] rejectPortfolioShare:[AWSServicecatalogRejectPortfolioShareInput new] completionHandler:^(AWSServicecatalogRejectPortfolioShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testScanProvisionedProducts {
    NSString *key = @"testScanProvisionedProducts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] scanProvisionedProducts:[AWSServicecatalogScanProvisionedProductsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testScanProvisionedProductsCompletionHandler {
    NSString *key = @"testScanProvisionedProducts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] scanProvisionedProducts:[AWSServicecatalogScanProvisionedProductsInput new] completionHandler:^(AWSServicecatalogScanProvisionedProductsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testSearchProducts {
    NSString *key = @"testSearchProducts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] searchProducts:[AWSServicecatalogSearchProductsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testSearchProductsCompletionHandler {
    NSString *key = @"testSearchProducts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] searchProducts:[AWSServicecatalogSearchProductsInput new] completionHandler:^(AWSServicecatalogSearchProductsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testSearchProductsAsAdmin {
    NSString *key = @"testSearchProductsAsAdmin";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] searchProductsAsAdmin:[AWSServicecatalogSearchProductsAsAdminInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testSearchProductsAsAdminCompletionHandler {
    NSString *key = @"testSearchProductsAsAdmin";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] searchProductsAsAdmin:[AWSServicecatalogSearchProductsAsAdminInput new] completionHandler:^(AWSServicecatalogSearchProductsAsAdminOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testSearchProvisionedProducts {
    NSString *key = @"testSearchProvisionedProducts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] searchProvisionedProducts:[AWSServicecatalogSearchProvisionedProductsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testSearchProvisionedProductsCompletionHandler {
    NSString *key = @"testSearchProvisionedProducts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] searchProvisionedProducts:[AWSServicecatalogSearchProvisionedProductsInput new] completionHandler:^(AWSServicecatalogSearchProvisionedProductsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testTerminateProvisionedProduct {
    NSString *key = @"testTerminateProvisionedProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] terminateProvisionedProduct:[AWSServicecatalogTerminateProvisionedProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testTerminateProvisionedProductCompletionHandler {
    NSString *key = @"testTerminateProvisionedProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] terminateProvisionedProduct:[AWSServicecatalogTerminateProvisionedProductInput new] completionHandler:^(AWSServicecatalogTerminateProvisionedProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateConstraint {
    NSString *key = @"testUpdateConstraint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] updateConstraint:[AWSServicecatalogUpdateConstraintInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateConstraintCompletionHandler {
    NSString *key = @"testUpdateConstraint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] updateConstraint:[AWSServicecatalogUpdateConstraintInput new] completionHandler:^(AWSServicecatalogUpdateConstraintOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdatePortfolio {
    NSString *key = @"testUpdatePortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] updatePortfolio:[AWSServicecatalogUpdatePortfolioInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdatePortfolioCompletionHandler {
    NSString *key = @"testUpdatePortfolio";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] updatePortfolio:[AWSServicecatalogUpdatePortfolioInput new] completionHandler:^(AWSServicecatalogUpdatePortfolioOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateProduct {
    NSString *key = @"testUpdateProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] updateProduct:[AWSServicecatalogUpdateProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateProductCompletionHandler {
    NSString *key = @"testUpdateProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] updateProduct:[AWSServicecatalogUpdateProductInput new] completionHandler:^(AWSServicecatalogUpdateProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateProvisionedProduct {
    NSString *key = @"testUpdateProvisionedProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] updateProvisionedProduct:[AWSServicecatalogUpdateProvisionedProductInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateProvisionedProductCompletionHandler {
    NSString *key = @"testUpdateProvisionedProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] updateProvisionedProduct:[AWSServicecatalogUpdateProvisionedProductInput new] completionHandler:^(AWSServicecatalogUpdateProvisionedProductOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateProvisionedProductProperties {
    NSString *key = @"testUpdateProvisionedProductProperties";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] updateProvisionedProductProperties:[AWSServicecatalogUpdateProvisionedProductPropertiesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateProvisionedProductPropertiesCompletionHandler {
    NSString *key = @"testUpdateProvisionedProductProperties";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] updateProvisionedProductProperties:[AWSServicecatalogUpdateProvisionedProductPropertiesInput new] completionHandler:^(AWSServicecatalogUpdateProvisionedProductPropertiesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateProvisioningArtifact {
    NSString *key = @"testUpdateProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] updateProvisioningArtifact:[AWSServicecatalogUpdateProvisioningArtifactInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateProvisioningArtifactCompletionHandler {
    NSString *key = @"testUpdateProvisioningArtifact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] updateProvisioningArtifact:[AWSServicecatalogUpdateProvisioningArtifactInput new] completionHandler:^(AWSServicecatalogUpdateProvisioningArtifactOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateServiceAction {
    NSString *key = @"testUpdateServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] updateServiceAction:[AWSServicecatalogUpdateServiceActionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateServiceActionCompletionHandler {
    NSString *key = @"testUpdateServiceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] updateServiceAction:[AWSServicecatalogUpdateServiceActionInput new] completionHandler:^(AWSServicecatalogUpdateServiceActionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateTagOption {
    NSString *key = @"testUpdateTagOption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSServicecatalog ServicecatalogForKey:key] updateTagOption:[AWSServicecatalogUpdateTagOptionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

- (void)testUpdateTagOptionCompletionHandler {
    NSString *key = @"testUpdateTagOption";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSServicecatalog registerServicecatalogWithConfiguration:configuration forKey:key];

    AWSServicecatalog *awsClient = [AWSServicecatalog ServicecatalogForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSServicecatalog ServicecatalogForKey:key] updateTagOption:[AWSServicecatalogUpdateTagOptionInput new] completionHandler:^(AWSServicecatalogUpdateTagOptionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSServicecatalog removeServicecatalogForKey:key];
}

@end
