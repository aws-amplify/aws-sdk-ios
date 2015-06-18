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
#import "AWSS3.h"

@interface AWSGeneralS3Tests : XCTestCase

@end

@implementation AWSGeneralS3Tests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testS3Constructors";
    XCTAssertNotNil([AWSS3 defaultS3]);
    XCTAssertEqual([[AWSS3 defaultS3] class], [AWSS3 class]);
    XCTAssertNil([AWSS3 S3ForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSS3 S3ForKey:key]);
    XCTAssertEqual([[AWSS3 S3ForKey:key] class], [AWSS3 class]);
    XCTAssertEqual([AWSS3 S3ForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSS3 removeS3ForKey:key];
    XCTAssertNil([AWSS3 S3ForKey:key]);

}

- (void)testAbortMultipartUpload {
    NSString *key = @"testAbortMultipartUpload";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] abortMultipartUpload:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testCompleteMultipartUpload {
    NSString *key = @"testCompleteMultipartUpload";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] completeMultipartUpload:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testCreateBucket {
    NSString *key = @"testCreateBucket";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] createBucket:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testCreateMultipartUpload {
    NSString *key = @"testCreateMultipartUpload";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] createMultipartUpload:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testDeleteBucket {
    NSString *key = @"testDeleteBucket";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] deleteBucket:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testDeleteBucketCors {
    NSString *key = @"testDeleteBucketCors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] deleteBucketCors:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testDeleteBucketLifecycle {
    NSString *key = @"testDeleteBucketLifecycle";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] deleteBucketLifecycle:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testDeleteBucketPolicy {
    NSString *key = @"testDeleteBucketPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] deleteBucketPolicy:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testDeleteBucketTagging {
    NSString *key = @"testDeleteBucketTagging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] deleteBucketTagging:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testDeleteBucketWebsite {
    NSString *key = @"testDeleteBucketWebsite";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] deleteBucketWebsite:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testDeleteObject {
    NSString *key = @"testDeleteObject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] deleteObject:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testDeleteObjects {
    NSString *key = @"testDeleteObjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] deleteObjects:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketAcl {
    NSString *key = @"testGetBucketAcl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketAcl:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketCors {
    NSString *key = @"testGetBucketCors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketCors:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketLifecycle {
    NSString *key = @"testGetBucketLifecycle";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketLifecycle:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketLocation {
    NSString *key = @"testGetBucketLocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketLocation:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketLogging {
    NSString *key = @"testGetBucketLogging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketLogging:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketNotification {
    NSString *key = @"testGetBucketNotification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketNotification:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketPolicy {
    NSString *key = @"testGetBucketPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketPolicy:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketRequestPayment {
    NSString *key = @"testGetBucketRequestPayment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketRequestPayment:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketTagging {
    NSString *key = @"testGetBucketTagging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketTagging:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketVersioning {
    NSString *key = @"testGetBucketVersioning";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketVersioning:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetBucketWebsite {
    NSString *key = @"testGetBucketWebsite";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getBucketWebsite:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetObject {
    NSString *key = @"testGetObject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getObject:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetObjectAcl {
    NSString *key = @"testGetObjectAcl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getObjectAcl:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testGetObjectTorrent {
    NSString *key = @"testGetObjectTorrent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] getObjectTorrent:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testHeadBucket {
    NSString *key = @"testHeadBucket";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] headBucket:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testHeadObject {
    NSString *key = @"testHeadObject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] headObject:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testListBuckets {
    NSString *key = @"testListBuckets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] listBuckets:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testListMultipartUploads {
    NSString *key = @"testListMultipartUploads";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] listMultipartUploads:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testListObjectVersions {
    NSString *key = @"testListObjectVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] listObjectVersions:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testListObjects {
    NSString *key = @"testListObjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] listObjects:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testListParts {
    NSString *key = @"testListParts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] listParts:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutBucketAcl {
    NSString *key = @"testPutBucketAcl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putBucketAcl:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutBucketCors {
    NSString *key = @"testPutBucketCors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putBucketCors:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutBucketLifecycle {
    NSString *key = @"testPutBucketLifecycle";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putBucketLifecycle:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutBucketLogging {
    NSString *key = @"testPutBucketLogging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putBucketLogging:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutBucketNotification {
    NSString *key = @"testPutBucketNotification";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putBucketNotification:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutBucketPolicy {
    NSString *key = @"testPutBucketPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putBucketPolicy:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutBucketRequestPayment {
    NSString *key = @"testPutBucketRequestPayment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putBucketRequestPayment:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutBucketTagging {
    NSString *key = @"testPutBucketTagging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putBucketTagging:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutBucketVersioning {
    NSString *key = @"testPutBucketVersioning";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putBucketVersioning:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutBucketWebsite {
    NSString *key = @"testPutBucketWebsite";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putBucketWebsite:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutObject {
    NSString *key = @"testPutObject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putObject:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testPutObjectAcl {
    NSString *key = @"testPutObjectAcl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] putObjectAcl:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testReplicateObject {
    NSString *key = @"testReplicateObject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] replicateObject:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testRestoreObject {
    NSString *key = @"testRestoreObject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] restoreObject:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testUploadPart {
    NSString *key = @"testUploadPart";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] uploadPart:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

- (void)testUploadPartCopy {
    NSString *key = @"testUploadPartCopy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSS3 registerS3WithConfiguration:configuration forKey:key];

    [[[[AWSS3 S3ForKey:key] uploadPartCopy:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSS3 removeS3ForKey:key];
}

@end
