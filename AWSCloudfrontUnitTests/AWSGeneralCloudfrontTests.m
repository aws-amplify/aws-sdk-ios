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
#import "AWSCloudfrontService.h"

static id mockNetworking = nil;

@interface AWSGeneralCloudfrontTests : XCTestCase

@end

@implementation AWSGeneralCloudfrontTests

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
    NSString *key = @"testCloudfrontConstructors";
    XCTAssertNotNil([AWSCloudfront defaultCloudfront]);
    XCTAssertEqual([[AWSCloudfront defaultCloudfront] class], [AWSCloudfront class]);
    XCTAssertNil([AWSCloudfront CloudfrontForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCloudfront CloudfrontForKey:key]);
    XCTAssertEqual([[AWSCloudfront CloudfrontForKey:key] class], [AWSCloudfront class]);
    XCTAssertEqual([AWSCloudfront CloudfrontForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCloudfront removeCloudfrontForKey:key];
    XCTAssertNil([AWSCloudfront CloudfrontForKey:key]);

}

- (void)testCreateCloudFrontOriginAccessIdentity2019_03_26 {
    NSString *key = @"testCreateCloudFrontOriginAccessIdentity2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] createCloudFrontOriginAccessIdentity2019_03_26:[AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateCloudFrontOriginAccessIdentity2019_03_26CompletionHandler {
    NSString *key = @"testCreateCloudFrontOriginAccessIdentity2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] createCloudFrontOriginAccessIdentity2019_03_26:[AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest new] completionHandler:^(AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateDistribution2019_03_26 {
    NSString *key = @"testCreateDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] createDistribution2019_03_26:[AWSCloudfrontCreateDistributionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateDistribution2019_03_26CompletionHandler {
    NSString *key = @"testCreateDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] createDistribution2019_03_26:[AWSCloudfrontCreateDistributionRequest new] completionHandler:^(AWSCloudfrontCreateDistributionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateDistributionWithTags2019_03_26 {
    NSString *key = @"testCreateDistributionWithTags2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] createDistributionWithTags2019_03_26:[AWSCloudfrontCreateDistributionWithTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateDistributionWithTags2019_03_26CompletionHandler {
    NSString *key = @"testCreateDistributionWithTags2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] createDistributionWithTags2019_03_26:[AWSCloudfrontCreateDistributionWithTagsRequest new] completionHandler:^(AWSCloudfrontCreateDistributionWithTagsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateFieldLevelEncryptionConfig2019_03_26 {
    NSString *key = @"testCreateFieldLevelEncryptionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] createFieldLevelEncryptionConfig2019_03_26:[AWSCloudfrontCreateFieldLevelEncryptionConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateFieldLevelEncryptionConfig2019_03_26CompletionHandler {
    NSString *key = @"testCreateFieldLevelEncryptionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] createFieldLevelEncryptionConfig2019_03_26:[AWSCloudfrontCreateFieldLevelEncryptionConfigRequest new] completionHandler:^(AWSCloudfrontCreateFieldLevelEncryptionConfigResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateFieldLevelEncryptionProfile2019_03_26 {
    NSString *key = @"testCreateFieldLevelEncryptionProfile2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] createFieldLevelEncryptionProfile2019_03_26:[AWSCloudfrontCreateFieldLevelEncryptionProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateFieldLevelEncryptionProfile2019_03_26CompletionHandler {
    NSString *key = @"testCreateFieldLevelEncryptionProfile2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] createFieldLevelEncryptionProfile2019_03_26:[AWSCloudfrontCreateFieldLevelEncryptionProfileRequest new] completionHandler:^(AWSCloudfrontCreateFieldLevelEncryptionProfileResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateInvalidation2019_03_26 {
    NSString *key = @"testCreateInvalidation2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] createInvalidation2019_03_26:[AWSCloudfrontCreateInvalidationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateInvalidation2019_03_26CompletionHandler {
    NSString *key = @"testCreateInvalidation2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] createInvalidation2019_03_26:[AWSCloudfrontCreateInvalidationRequest new] completionHandler:^(AWSCloudfrontCreateInvalidationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreatePublicKey2019_03_26 {
    NSString *key = @"testCreatePublicKey2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] createPublicKey2019_03_26:[AWSCloudfrontCreatePublicKeyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreatePublicKey2019_03_26CompletionHandler {
    NSString *key = @"testCreatePublicKey2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] createPublicKey2019_03_26:[AWSCloudfrontCreatePublicKeyRequest new] completionHandler:^(AWSCloudfrontCreatePublicKeyResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateStreamingDistribution2019_03_26 {
    NSString *key = @"testCreateStreamingDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] createStreamingDistribution2019_03_26:[AWSCloudfrontCreateStreamingDistributionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateStreamingDistribution2019_03_26CompletionHandler {
    NSString *key = @"testCreateStreamingDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] createStreamingDistribution2019_03_26:[AWSCloudfrontCreateStreamingDistributionRequest new] completionHandler:^(AWSCloudfrontCreateStreamingDistributionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateStreamingDistributionWithTags2019_03_26 {
    NSString *key = @"testCreateStreamingDistributionWithTags2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] createStreamingDistributionWithTags2019_03_26:[AWSCloudfrontCreateStreamingDistributionWithTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testCreateStreamingDistributionWithTags2019_03_26CompletionHandler {
    NSString *key = @"testCreateStreamingDistributionWithTags2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] createStreamingDistributionWithTags2019_03_26:[AWSCloudfrontCreateStreamingDistributionWithTagsRequest new] completionHandler:^(AWSCloudfrontCreateStreamingDistributionWithTagsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeleteCloudFrontOriginAccessIdentity2019_03_26 {
    NSString *key = @"testDeleteCloudFrontOriginAccessIdentity2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] deleteCloudFrontOriginAccessIdentity2019_03_26:[AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeleteCloudFrontOriginAccessIdentity2019_03_26CompletionHandler {
    NSString *key = @"testDeleteCloudFrontOriginAccessIdentity2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] deleteCloudFrontOriginAccessIdentity2019_03_26:[AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeleteDistribution2019_03_26 {
    NSString *key = @"testDeleteDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] deleteDistribution2019_03_26:[AWSCloudfrontDeleteDistributionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeleteDistribution2019_03_26CompletionHandler {
    NSString *key = @"testDeleteDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] deleteDistribution2019_03_26:[AWSCloudfrontDeleteDistributionRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeleteFieldLevelEncryptionConfig2019_03_26 {
    NSString *key = @"testDeleteFieldLevelEncryptionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] deleteFieldLevelEncryptionConfig2019_03_26:[AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeleteFieldLevelEncryptionConfig2019_03_26CompletionHandler {
    NSString *key = @"testDeleteFieldLevelEncryptionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] deleteFieldLevelEncryptionConfig2019_03_26:[AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeleteFieldLevelEncryptionProfile2019_03_26 {
    NSString *key = @"testDeleteFieldLevelEncryptionProfile2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] deleteFieldLevelEncryptionProfile2019_03_26:[AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeleteFieldLevelEncryptionProfile2019_03_26CompletionHandler {
    NSString *key = @"testDeleteFieldLevelEncryptionProfile2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] deleteFieldLevelEncryptionProfile2019_03_26:[AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeletePublicKey2019_03_26 {
    NSString *key = @"testDeletePublicKey2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] deletePublicKey2019_03_26:[AWSCloudfrontDeletePublicKeyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeletePublicKey2019_03_26CompletionHandler {
    NSString *key = @"testDeletePublicKey2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] deletePublicKey2019_03_26:[AWSCloudfrontDeletePublicKeyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeleteStreamingDistribution2019_03_26 {
    NSString *key = @"testDeleteStreamingDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] deleteStreamingDistribution2019_03_26:[AWSCloudfrontDeleteStreamingDistributionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testDeleteStreamingDistribution2019_03_26CompletionHandler {
    NSString *key = @"testDeleteStreamingDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] deleteStreamingDistribution2019_03_26:[AWSCloudfrontDeleteStreamingDistributionRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetCloudFrontOriginAccessIdentity2019_03_26 {
    NSString *key = @"testGetCloudFrontOriginAccessIdentity2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getCloudFrontOriginAccessIdentity2019_03_26:[AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetCloudFrontOriginAccessIdentity2019_03_26CompletionHandler {
    NSString *key = @"testGetCloudFrontOriginAccessIdentity2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getCloudFrontOriginAccessIdentity2019_03_26:[AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest new] completionHandler:^(AWSCloudfrontGetCloudFrontOriginAccessIdentityResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetCloudFrontOriginAccessIdentityConfig2019_03_26 {
    NSString *key = @"testGetCloudFrontOriginAccessIdentityConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getCloudFrontOriginAccessIdentityConfig2019_03_26:[AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetCloudFrontOriginAccessIdentityConfig2019_03_26CompletionHandler {
    NSString *key = @"testGetCloudFrontOriginAccessIdentityConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getCloudFrontOriginAccessIdentityConfig2019_03_26:[AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest new] completionHandler:^(AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetDistribution2019_03_26 {
    NSString *key = @"testGetDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getDistribution2019_03_26:[AWSCloudfrontGetDistributionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetDistribution2019_03_26CompletionHandler {
    NSString *key = @"testGetDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getDistribution2019_03_26:[AWSCloudfrontGetDistributionRequest new] completionHandler:^(AWSCloudfrontGetDistributionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetDistributionConfig2019_03_26 {
    NSString *key = @"testGetDistributionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getDistributionConfig2019_03_26:[AWSCloudfrontGetDistributionConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetDistributionConfig2019_03_26CompletionHandler {
    NSString *key = @"testGetDistributionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getDistributionConfig2019_03_26:[AWSCloudfrontGetDistributionConfigRequest new] completionHandler:^(AWSCloudfrontGetDistributionConfigResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetFieldLevelEncryption2019_03_26 {
    NSString *key = @"testGetFieldLevelEncryption2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getFieldLevelEncryption2019_03_26:[AWSCloudfrontGetFieldLevelEncryptionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetFieldLevelEncryption2019_03_26CompletionHandler {
    NSString *key = @"testGetFieldLevelEncryption2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getFieldLevelEncryption2019_03_26:[AWSCloudfrontGetFieldLevelEncryptionRequest new] completionHandler:^(AWSCloudfrontGetFieldLevelEncryptionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetFieldLevelEncryptionConfig2019_03_26 {
    NSString *key = @"testGetFieldLevelEncryptionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getFieldLevelEncryptionConfig2019_03_26:[AWSCloudfrontGetFieldLevelEncryptionConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetFieldLevelEncryptionConfig2019_03_26CompletionHandler {
    NSString *key = @"testGetFieldLevelEncryptionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getFieldLevelEncryptionConfig2019_03_26:[AWSCloudfrontGetFieldLevelEncryptionConfigRequest new] completionHandler:^(AWSCloudfrontGetFieldLevelEncryptionConfigResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetFieldLevelEncryptionProfile2019_03_26 {
    NSString *key = @"testGetFieldLevelEncryptionProfile2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getFieldLevelEncryptionProfile2019_03_26:[AWSCloudfrontGetFieldLevelEncryptionProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetFieldLevelEncryptionProfile2019_03_26CompletionHandler {
    NSString *key = @"testGetFieldLevelEncryptionProfile2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getFieldLevelEncryptionProfile2019_03_26:[AWSCloudfrontGetFieldLevelEncryptionProfileRequest new] completionHandler:^(AWSCloudfrontGetFieldLevelEncryptionProfileResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetFieldLevelEncryptionProfileConfig2019_03_26 {
    NSString *key = @"testGetFieldLevelEncryptionProfileConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getFieldLevelEncryptionProfileConfig2019_03_26:[AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetFieldLevelEncryptionProfileConfig2019_03_26CompletionHandler {
    NSString *key = @"testGetFieldLevelEncryptionProfileConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getFieldLevelEncryptionProfileConfig2019_03_26:[AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest new] completionHandler:^(AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetInvalidation2019_03_26 {
    NSString *key = @"testGetInvalidation2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getInvalidation2019_03_26:[AWSCloudfrontGetInvalidationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetInvalidation2019_03_26CompletionHandler {
    NSString *key = @"testGetInvalidation2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getInvalidation2019_03_26:[AWSCloudfrontGetInvalidationRequest new] completionHandler:^(AWSCloudfrontGetInvalidationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetPublicKey2019_03_26 {
    NSString *key = @"testGetPublicKey2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getPublicKey2019_03_26:[AWSCloudfrontGetPublicKeyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetPublicKey2019_03_26CompletionHandler {
    NSString *key = @"testGetPublicKey2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getPublicKey2019_03_26:[AWSCloudfrontGetPublicKeyRequest new] completionHandler:^(AWSCloudfrontGetPublicKeyResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetPublicKeyConfig2019_03_26 {
    NSString *key = @"testGetPublicKeyConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getPublicKeyConfig2019_03_26:[AWSCloudfrontGetPublicKeyConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetPublicKeyConfig2019_03_26CompletionHandler {
    NSString *key = @"testGetPublicKeyConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getPublicKeyConfig2019_03_26:[AWSCloudfrontGetPublicKeyConfigRequest new] completionHandler:^(AWSCloudfrontGetPublicKeyConfigResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetStreamingDistribution2019_03_26 {
    NSString *key = @"testGetStreamingDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getStreamingDistribution2019_03_26:[AWSCloudfrontGetStreamingDistributionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetStreamingDistribution2019_03_26CompletionHandler {
    NSString *key = @"testGetStreamingDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getStreamingDistribution2019_03_26:[AWSCloudfrontGetStreamingDistributionRequest new] completionHandler:^(AWSCloudfrontGetStreamingDistributionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetStreamingDistributionConfig2019_03_26 {
    NSString *key = @"testGetStreamingDistributionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] getStreamingDistributionConfig2019_03_26:[AWSCloudfrontGetStreamingDistributionConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testGetStreamingDistributionConfig2019_03_26CompletionHandler {
    NSString *key = @"testGetStreamingDistributionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] getStreamingDistributionConfig2019_03_26:[AWSCloudfrontGetStreamingDistributionConfigRequest new] completionHandler:^(AWSCloudfrontGetStreamingDistributionConfigResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListCloudFrontOriginAccessIdentities2019_03_26 {
    NSString *key = @"testListCloudFrontOriginAccessIdentities2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] listCloudFrontOriginAccessIdentities2019_03_26:[AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListCloudFrontOriginAccessIdentities2019_03_26CompletionHandler {
    NSString *key = @"testListCloudFrontOriginAccessIdentities2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] listCloudFrontOriginAccessIdentities2019_03_26:[AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest new] completionHandler:^(AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListDistributions2019_03_26 {
    NSString *key = @"testListDistributions2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] listDistributions2019_03_26:[AWSCloudfrontListDistributionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListDistributions2019_03_26CompletionHandler {
    NSString *key = @"testListDistributions2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] listDistributions2019_03_26:[AWSCloudfrontListDistributionsRequest new] completionHandler:^(AWSCloudfrontListDistributionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListDistributionsByWebACLId2019_03_26 {
    NSString *key = @"testListDistributionsByWebACLId2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] listDistributionsByWebACLId2019_03_26:[AWSCloudfrontListDistributionsByWebACLIdRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListDistributionsByWebACLId2019_03_26CompletionHandler {
    NSString *key = @"testListDistributionsByWebACLId2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] listDistributionsByWebACLId2019_03_26:[AWSCloudfrontListDistributionsByWebACLIdRequest new] completionHandler:^(AWSCloudfrontListDistributionsByWebACLIdResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListFieldLevelEncryptionConfigs2019_03_26 {
    NSString *key = @"testListFieldLevelEncryptionConfigs2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] listFieldLevelEncryptionConfigs2019_03_26:[AWSCloudfrontListFieldLevelEncryptionConfigsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListFieldLevelEncryptionConfigs2019_03_26CompletionHandler {
    NSString *key = @"testListFieldLevelEncryptionConfigs2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] listFieldLevelEncryptionConfigs2019_03_26:[AWSCloudfrontListFieldLevelEncryptionConfigsRequest new] completionHandler:^(AWSCloudfrontListFieldLevelEncryptionConfigsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListFieldLevelEncryptionProfiles2019_03_26 {
    NSString *key = @"testListFieldLevelEncryptionProfiles2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] listFieldLevelEncryptionProfiles2019_03_26:[AWSCloudfrontListFieldLevelEncryptionProfilesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListFieldLevelEncryptionProfiles2019_03_26CompletionHandler {
    NSString *key = @"testListFieldLevelEncryptionProfiles2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] listFieldLevelEncryptionProfiles2019_03_26:[AWSCloudfrontListFieldLevelEncryptionProfilesRequest new] completionHandler:^(AWSCloudfrontListFieldLevelEncryptionProfilesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListInvalidations2019_03_26 {
    NSString *key = @"testListInvalidations2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] listInvalidations2019_03_26:[AWSCloudfrontListInvalidationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListInvalidations2019_03_26CompletionHandler {
    NSString *key = @"testListInvalidations2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] listInvalidations2019_03_26:[AWSCloudfrontListInvalidationsRequest new] completionHandler:^(AWSCloudfrontListInvalidationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListPublicKeys2019_03_26 {
    NSString *key = @"testListPublicKeys2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] listPublicKeys2019_03_26:[AWSCloudfrontListPublicKeysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListPublicKeys2019_03_26CompletionHandler {
    NSString *key = @"testListPublicKeys2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] listPublicKeys2019_03_26:[AWSCloudfrontListPublicKeysRequest new] completionHandler:^(AWSCloudfrontListPublicKeysResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListStreamingDistributions2019_03_26 {
    NSString *key = @"testListStreamingDistributions2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] listStreamingDistributions2019_03_26:[AWSCloudfrontListStreamingDistributionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListStreamingDistributions2019_03_26CompletionHandler {
    NSString *key = @"testListStreamingDistributions2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] listStreamingDistributions2019_03_26:[AWSCloudfrontListStreamingDistributionsRequest new] completionHandler:^(AWSCloudfrontListStreamingDistributionsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListTagsForResource2019_03_26 {
    NSString *key = @"testListTagsForResource2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] listTagsForResource2019_03_26:[AWSCloudfrontListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testListTagsForResource2019_03_26CompletionHandler {
    NSString *key = @"testListTagsForResource2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] listTagsForResource2019_03_26:[AWSCloudfrontListTagsForResourceRequest new] completionHandler:^(AWSCloudfrontListTagsForResourceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testTagResource2019_03_26 {
    NSString *key = @"testTagResource2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] tagResource2019_03_26:[AWSCloudfrontTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testTagResource2019_03_26CompletionHandler {
    NSString *key = @"testTagResource2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] tagResource2019_03_26:[AWSCloudfrontTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUntagResource2019_03_26 {
    NSString *key = @"testUntagResource2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] untagResource2019_03_26:[AWSCloudfrontUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUntagResource2019_03_26CompletionHandler {
    NSString *key = @"testUntagResource2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] untagResource2019_03_26:[AWSCloudfrontUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdateCloudFrontOriginAccessIdentity2019_03_26 {
    NSString *key = @"testUpdateCloudFrontOriginAccessIdentity2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] updateCloudFrontOriginAccessIdentity2019_03_26:[AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdateCloudFrontOriginAccessIdentity2019_03_26CompletionHandler {
    NSString *key = @"testUpdateCloudFrontOriginAccessIdentity2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] updateCloudFrontOriginAccessIdentity2019_03_26:[AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest new] completionHandler:^(AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdateDistribution2019_03_26 {
    NSString *key = @"testUpdateDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] updateDistribution2019_03_26:[AWSCloudfrontUpdateDistributionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdateDistribution2019_03_26CompletionHandler {
    NSString *key = @"testUpdateDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] updateDistribution2019_03_26:[AWSCloudfrontUpdateDistributionRequest new] completionHandler:^(AWSCloudfrontUpdateDistributionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdateFieldLevelEncryptionConfig2019_03_26 {
    NSString *key = @"testUpdateFieldLevelEncryptionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] updateFieldLevelEncryptionConfig2019_03_26:[AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdateFieldLevelEncryptionConfig2019_03_26CompletionHandler {
    NSString *key = @"testUpdateFieldLevelEncryptionConfig2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] updateFieldLevelEncryptionConfig2019_03_26:[AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest new] completionHandler:^(AWSCloudfrontUpdateFieldLevelEncryptionConfigResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdateFieldLevelEncryptionProfile2019_03_26 {
    NSString *key = @"testUpdateFieldLevelEncryptionProfile2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] updateFieldLevelEncryptionProfile2019_03_26:[AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdateFieldLevelEncryptionProfile2019_03_26CompletionHandler {
    NSString *key = @"testUpdateFieldLevelEncryptionProfile2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] updateFieldLevelEncryptionProfile2019_03_26:[AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest new] completionHandler:^(AWSCloudfrontUpdateFieldLevelEncryptionProfileResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdatePublicKey2019_03_26 {
    NSString *key = @"testUpdatePublicKey2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] updatePublicKey2019_03_26:[AWSCloudfrontUpdatePublicKeyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdatePublicKey2019_03_26CompletionHandler {
    NSString *key = @"testUpdatePublicKey2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] updatePublicKey2019_03_26:[AWSCloudfrontUpdatePublicKeyRequest new] completionHandler:^(AWSCloudfrontUpdatePublicKeyResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdateStreamingDistribution2019_03_26 {
    NSString *key = @"testUpdateStreamingDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCloudfront CloudfrontForKey:key] updateStreamingDistribution2019_03_26:[AWSCloudfrontUpdateStreamingDistributionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

- (void)testUpdateStreamingDistribution2019_03_26CompletionHandler {
    NSString *key = @"testUpdateStreamingDistribution2019_03_26";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:key];

    AWSCloudfront *awsClient = [AWSCloudfront CloudfrontForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCloudfront CloudfrontForKey:key] updateStreamingDistribution2019_03_26:[AWSCloudfrontUpdateStreamingDistributionRequest new] completionHandler:^(AWSCloudfrontUpdateStreamingDistributionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCloudfront removeCloudfrontForKey:key];
}

@end
