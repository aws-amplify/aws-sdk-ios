/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#if AWS_TEST_S3

#import <XCTest/XCTest.h>
#import "S3.h"
#import "AWSTestUtility.h"

@interface AWSS3Tests : XCTestCase

@end

@implementation AWSS3Tests

NSUInteger const AWSS3Test256KB = 1024 * 256;
NSUInteger const AWSS3TestsTransferManagerMinimumPartSize = 5 * 1024 * 1024;
NSString *const AWSS3TestBucketNamePrefix = @"ios-v2-test-";

static NSString *testBucketNameGeneral = nil;

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];

    //Create bucketName
    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    testBucketNameGeneral = [NSString stringWithFormat:@"%@%lld", AWSS3TestBucketNamePrefix, (int64_t)timeIntervalSinceReferenceDate];

    [AWSS3Tests createBucketWithName:testBucketNameGeneral];
}

- (void)setUp {
    [super setUp];
}

+ (void)tearDown {
    //Delete Bucket
    [AWSS3Tests deleteBucketWithName:testBucketNameGeneral];
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

+ (BOOL)createBucketWithName:(NSString *)bucketName {
    AWSS3 *s3 = [AWSS3 defaultS3];

    AWSS3CreateBucketRequest *createBucketReq = [AWSS3CreateBucketRequest new];
    createBucketReq.bucket = bucketName;

#if AWS_TEST_BJS_INSTEAD
    AWSS3CreateBucketConfiguration *createBucketConfiguration = [AWSS3CreateBucketConfiguration new];
    createBucketConfiguration.locationConstraint = AWSS3BucketLocationConstraintCNNorth1;
    createBucketReq.createBucketConfiguration = createBucketConfiguration;
#endif

    __block BOOL success = NO;
    [[[s3 createBucket:createBucketReq] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            success = NO;
        } else {
            success = YES;
        }
        return nil;
    }] waitUntilFinished];

    sleep(5);

    return success;
}

+ (BOOL)deleteBucketWithName:(NSString *)bucketName {
    AWSS3 *s3 = [AWSS3 defaultS3];

    AWSS3DeleteBucketRequest *deleteBucketReq = [AWSS3DeleteBucketRequest new];
    deleteBucketReq.bucket = bucketName;

    __block BOOL success = NO;
    [[[s3 deleteBucket:deleteBucketReq] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            success = NO;
        } else {
            success = YES;
        }
        return nil;
    }] waitUntilFinished];

    return success;
}

- (BOOL)isContainBucketName:(NSString *)bucketName inBucketArray:(NSArray *)bucketsArray {
    for (AWSS3Bucket* bucket in bucketsArray) {
        if ([bucket.name isEqualToString:bucketName]) return YES;
    }
    return NO;
}

- (void)testListBucket {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    [[[s3 listBuckets:nil] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListBucketsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListBucketsOutput class]));

        AWSS3ListBucketsOutput *listBucketOutput = task.result;
        AWSLogDebug(@" testListBucket ========= responseObject is: ================  %@", [listBucketOutput description]);
        return nil;
    }] waitUntilFinished];
}

- (void)testCreateDeleteBucket {
    NSString *bucketNameTest2 = [testBucketNameGeneral stringByAppendingString:@"-testcreatedeletebucket"];

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3CreateBucketRequest *createBucketReq = [AWSS3CreateBucketRequest new];
    createBucketReq.ACL = AWSS3BucketCannedACLAuthenticatedRead;
    createBucketReq.bucket = bucketNameTest2;

#if AWS_TEST_BJS_INSTEAD
    AWSS3CreateBucketConfiguration *createBucketConfiguration = [AWSS3CreateBucketConfiguration new];
    createBucketConfiguration.locationConstraint = AWSS3BucketLocationConstraintCNNorth1;
    createBucketReq.createBucketConfiguration = createBucketConfiguration;
#endif
    
    [[[[[[s3 createBucket:createBucketReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        sleep(2);
        return [s3 listBuckets:nil];
    }] continueWithBlock:^id(BFTask *task) {
        //Check if bucket are there.
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListBucketsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListBucketsOutput class]));

        AWSS3ListBucketsOutput *listBucketOutput = task.result;
        XCTAssertTrue([self isContainBucketName:bucketNameTest2 inBucketArray:listBucketOutput.buckets], @"%@ can not be found in S3 Bucket List",bucketNameTest2);

        AWSS3DeleteBucketRequest *deleteBucketReq = [AWSS3DeleteBucketRequest new];
        deleteBucketReq.bucket = bucketNameTest2;

        return [s3 deleteBucket:deleteBucketReq];
    }] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        return [s3 listBuckets:nil];
    }] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListBucketsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListBucketsOutput class]));

        AWSS3ListBucketsOutput *listBucketOutput = task.result;
        XCTAssertFalse([self isContainBucketName:bucketNameTest2 inBucketArray:listBucketOutput.buckets], @"%@ should NOT befound in S3 Bucket List",bucketNameTest2);
        return nil;
    }] waitUntilFinished];
}

- (void)testPutBucketWithGrants {
    NSString *grantBucketName = [testBucketNameGeneral stringByAppendingString:@"-grant"];
    XCTAssertTrue([AWSS3Tests createBucketWithName:grantBucketName]);

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3Grantee *granteeOne = [AWSS3Grantee new];
    granteeOne.ID = @"154b2f3550127d0439dfe1e89a03a7a4178048cc05c6fdaeb40796841a5cfcef";
    granteeOne.displayName = @"awssandbox";
    granteeOne.type = AWSS3TypeCanonicalUser;

    AWSS3Grant *grantOne = [AWSS3Grant new];
    grantOne.permission = AWSS3PermissionRead;
    grantOne.grantee = granteeOne;

    NSArray *grantsList = [NSArray arrayWithObjects:grantOne, nil];

    AWSS3Owner *s3Owner = [AWSS3Owner new];
    s3Owner.displayName = @"aws-dr-mobile-test-ios@amazon.com";
    s3Owner.ID = @"0d822d37be4e6e24e50d96c88fefa5d3b2e8cd5661a759d6a07596306c41f52d";

    AWSS3AccessControlPolicy *accessControlPolicy = [AWSS3AccessControlPolicy new];
    accessControlPolicy.grants = grantsList;
    accessControlPolicy.owner = s3Owner;

    AWSS3PutBucketAclRequest *putBucketAclReq = [AWSS3PutBucketAclRequest new];
    putBucketAclReq.bucket = grantBucketName;
#if AWS_TEST_BJS_INSTEAD
    putBucketAclReq.ACL = AWSS3BucketCannedACLPrivate;
#else
    putBucketAclReq.accessControlPolicy = accessControlPolicy;
#endif
    
    
    
    [[[s3 putBucketAcl:putBucketAclReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        return nil;

    }] waitUntilFinished];

    XCTAssertTrue([AWSS3Tests deleteBucketWithName:grantBucketName]);
}

- (void)testListObjects {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        //        XCTAssertEqualObjects(listObjectsOutput.name, @"ios-test-listobjects");

        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            XCTAssertTrue([s3Object.lastModified isKindOfClass:[NSDate class]], @"listObject doesn't contain LastModified(NSDate)");
        }

        return nil;
    }] waitUntilFinished];

    AWSS3ListObjectsRequest *listObjectReq2 = [AWSS3ListObjectsRequest new];
    listObjectReq2.bucket = @"ios-test-listobjects-not-existed";


    [[[s3 listObjects:listObjectReq2] continueWithBlock:^id(BFTask *task) {
        XCTAssertTrue(task.error, @"Expected NoSuchBucket Error not thrown.");
        XCTAssertEqual(task.error.code, AWSS3ErrorNoSuchBucket);
        return nil;
    }] waitUntilFinished];
}

- (void)testParamsURLEncoding {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    
    NSString *keyName = @" name with!@#$%^&+-end";

    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    
    NSString *testObjectStr = @"a test object string.";
    NSData *testObjectData = [testObjectStr dataUsingEncoding:NSUTF8StringEncoding];
    
    AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
    putObjectRequest.bucket = testBucketNameGeneral;
    putObjectRequest.key = keyName;
    putObjectRequest.body = testObjectData;
    putObjectRequest.contentLength = [NSNumber numberWithUnsignedInteger:[testObjectData length]];
    
    putObjectRequest.contentType = @"video/mpeg";
    
    [[[s3 putObject:putObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]),[task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);
        XCTAssertEqual(putObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionUnknown);
        return nil;
        
    }] waitUntilFinished];
    
     [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    
    //List Object with parameters need URL Encoding
    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;
    
    listObjectReq.marker = keyName;
    listObjectReq.prefix = @" name";
    
    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
     
        
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            XCTAssertTrue([s3Object.lastModified isKindOfClass:[NSDate class]], @"listObject doesn't contain LastModified(NSDate)");
        }
        
        return nil;
    }] waitUntilFinished];
    
    //Delete Object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;
    
    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] waitUntilFinished];

}

- (void)testPutHeadGetAndDeleteObject {
    NSString *testObjectStr = @"a test object string.";
    NSString *keyName = @"ios-test-put-get-and-delete-obj";
    NSData *testObjectData = [testObjectStr dataUsingEncoding:NSUTF8StringEncoding];

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
    putObjectRequest.bucket = testBucketNameGeneral;
    putObjectRequest.key = keyName;
    putObjectRequest.body = testObjectData;
    putObjectRequest.contentLength = [NSNumber numberWithUnsignedInteger:[testObjectData length]];

    putObjectRequest.contentType = @"video/mpeg";

    [[[[[[[s3 putObject:putObjectRequest] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]), [task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);
        XCTAssertEqual(putObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionUnknown);

        AWSS3HeadObjectRequest *headObjectRequest = [AWSS3HeadObjectRequest new];
        headObjectRequest.bucket = testBucketNameGeneral;
        headObjectRequest.key = keyName;

        return [s3 headObject:headObjectRequest];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3HeadObjectOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3HeadObjectOutput class]), [task.result description]);
        AWSS3HeadObjectOutput *headObjectOutput = task.result;
        XCTAssertTrue([headObjectOutput.contentLength intValue] > 0, @"Content Length is 0: [%@]", headObjectOutput.contentLength);

        AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
        getObjectRequest.bucket = testBucketNameGeneral;
        getObjectRequest.key = keyName;

        return [s3 getObject:getObjectRequest];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3GetObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3GetObjectOutput class]),[task.result description]);
        AWSS3GetObjectOutput *getObjectOutput = task.result;
        NSData *receivedBody = getObjectOutput.body;
        XCTAssertEqualObjects(testObjectData,receivedBody, @"received object is different from sent object, expect:%@ but got:%@",[[NSString alloc] initWithData:testObjectData encoding:NSUTF8StringEncoding],[[NSString alloc] initWithData:receivedBody encoding:NSUTF8StringEncoding]);

        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = testBucketNameGeneral;
        deleteObjectRequest.key = keyName;

        return [s3 deleteObject:deleteObjectRequest];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] continueWithBlock:^id(BFTask *task) {
         XCTAssertNil(task.error, @"Error: [%@]", task.error);
        return nil;
    }] waitUntilFinished];
}

-(void)testGetByFilePathFailed {
    NSString *keyName = @"ios-test-get-non-existed-key";
    AWSS3 *s3 = [AWSS3 defaultS3];
    
    AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
    getObjectRequest.bucket = testBucketNameGeneral;
    getObjectRequest.key = keyName;
    
    //assign the file path to be written.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    getObjectRequest.downloadingFileURL = [NSURL fileURLWithPath:filePath];
    
    [[[s3 getObject:getObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error, @"The request should failed but the error is nil");
        XCTAssertEqual(AWSS3ErrorNoSuchKey, task.error.code, @"expected AWSS3ErrorNoSuchKey Error but got error code:%ld",(long)task.error.code);
        XCTAssertNil(task.result, @"result should be nil but got something.");
        
        
        return nil;
    }] waitUntilFinished];
    
}
- (void)testPutGetAndDeleteObjectByFilePathWithProgressFeedback {
    NSString *keyName = @"ios-test-put-get-and-delete-obj";
    NSString *getObjectFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"s3-2006-03-01" ofType:@"json"];
    XCTAssertNotNil(getObjectFilePath);
    unsigned long long fileSize = [[[NSFileManager defaultManager] attributesOfItemAtPath:getObjectFilePath error:nil] fileSize];

    AWSS3 *s3 = [AWSS3 defaultS3];

    AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
    putObjectRequest.bucket = testBucketNameGeneral;
    putObjectRequest.key = keyName;
    putObjectRequest.body = [NSURL fileURLWithPath:getObjectFilePath];
    putObjectRequest.contentLength = [NSNumber numberWithUnsignedLongLong:fileSize];
   

    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    putObjectRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
       
        //NSLog(@"bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",bytesSent,totalBytesSent,totalBytesExpectedToSend);
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };
    
    [[[s3 putObject:putObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]),[task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);
        XCTAssertEqual(putObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionUnknown);
        return nil;

    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);
    
    AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
    getObjectRequest.bucket = testBucketNameGeneral;
    getObjectRequest.key = keyName;

    //assign the file path to be written.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"s3ResponseDataFile.txt"];
    getObjectRequest.downloadingFileURL = [NSURL fileURLWithPath:filePath];
    
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    getObjectRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld", bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };
    
    [[[s3 getObject:getObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3GetObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3GetObjectOutput class]),[task.result description]);
        AWSS3GetObjectOutput *getObjectOutput = task.result;
        NSURL *receivedBodyURL = getObjectOutput.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),[receivedBodyURL description]);

        //read file content
        NSData *responseData = [NSData dataWithContentsOfFile:[receivedBodyURL path]];
        NSData *testObjectData = [NSData dataWithContentsOfFile:getObjectFilePath];
        XCTAssertEqualObjects(testObjectData, responseData, @"received object is different from sent object.");

        return nil;
    }] waitUntilFinished];
    
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);
    
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] waitUntilFinished];
}

- (void)testPutGetAndDeleteObject256KBWithProgressFeedback {
    NSString *keyName = @"ios-test-put-and-delete-256KB";
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
    putObjectRequest.bucket = testBucketNameGeneral;
    putObjectRequest.key = keyName;

    unsigned char *largeData = malloc(AWSS3Test256KB) ;
    memset(largeData, 5, AWSS3Test256KB);
    NSData *testObjectData = [[NSData alloc] initWithBytesNoCopy:largeData length:AWSS3Test256KB];

    putObjectRequest.body = testObjectData;
    putObjectRequest.contentLength = [NSNumber numberWithUnsignedInteger:[testObjectData length]];


    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    putObjectRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
     
        //NSLog(@"bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };
    
    [[[s3 putObject:putObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]),[task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);
        XCTAssertEqual(putObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionUnknown);
        return nil;

    }] waitUntilFinished];

    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    XCTAssertEqual(AWSS3Test256KB, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(AWSS3Test256KB, totalExpectedUploadBytes);
    
    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;

        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL hasObject = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                hasObject = YES;
            }
        }
        XCTAssertTrue(hasObject,@"can not find the object after putObject has been called");

        return nil;
    }] waitUntilFinished];

    AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
    getObjectRequest.bucket = testBucketNameGeneral;
    getObjectRequest.key = keyName;
    
    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    getObjectRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld", bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };
    
    [[[s3 getObject:getObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3GetObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3GetObjectOutput class]),[task.result description]);
        AWSS3GetObjectOutput *getObjectOutput = task.result;
        NSData *receivedBody = getObjectOutput.body;
        XCTAssertEqualObjects(testObjectData,receivedBody, @"received object is different from sent object, expect:%@ but got:%@",[[NSString alloc] initWithData:testObjectData encoding:NSUTF8StringEncoding],[[NSString alloc] initWithData:receivedBody encoding:NSUTF8StringEncoding]);
        return nil;
        
    }] waitUntilFinished];
    
    XCTAssertEqual(totalDownloadedBytes, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to totalDownloadedBytes");
    XCTAssertEqual(AWSS3Test256KB, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(AWSS3Test256KB, totalExpectedDownloadBytes);
    
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] waitUntilFinished];
}

- (void)testMultipartUploadWithComplete {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    NSString *keyName = @"testMultipartUploadKey";
    NSMutableString *testString = [NSMutableString string];
    for (int32_t i = 0; i < 3000000; i++) {
        [testString appendFormat:@"%d", i];
    }

    NSData *testData = [testString dataUsingEncoding:NSUTF8StringEncoding];
    __block NSString *uploadId = @"";
    __block NSString *resultETag = @"";

    NSUInteger partCount = ceil((double)[testData length] / AWSS3TestsTransferManagerMinimumPartSize);
    NSMutableArray *completedParts = [NSMutableArray arrayWithCapacity:partCount];
    for (int32_t i = 0; i < partCount; i++) {
        [completedParts addObject:[NSNull null]];
    }

    AWSS3CreateMultipartUploadRequest *createReq = [AWSS3CreateMultipartUploadRequest new];
    createReq.bucket = testBucketNameGeneral;
    createReq.key = keyName;

    [[[[[s3 createMultipartUpload:createReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        AWSS3CreateMultipartUploadOutput *output = task.result;
        XCTAssertTrue([task.result isKindOfClass:[AWSS3CreateMultipartUploadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3CreateMultipartUploadOutput class]),[task.result description]);
        uploadId = output.uploadId;

        NSMutableArray *partUploadTasks = [NSMutableArray arrayWithCapacity:partCount];

        for (int32_t i = 1; i < partCount + 1; i++) {
            NSUInteger dataLength = i == partCount ? [testData length] - ((i - 1) * AWSS3TestsTransferManagerMinimumPartSize) : AWSS3TestsTransferManagerMinimumPartSize;
            NSData *partData = [testData subdataWithRange:NSMakeRange((i - 1) * AWSS3TestsTransferManagerMinimumPartSize, dataLength)];

            AWSS3UploadPartRequest *uploadPartRequest = [AWSS3UploadPartRequest new];
            uploadPartRequest.bucket = testBucketNameGeneral;
            uploadPartRequest.key = keyName;
            uploadPartRequest.partNumber = @(i);
            uploadPartRequest.body = partData;
            uploadPartRequest.contentLength = @(dataLength);
            uploadPartRequest.uploadId = uploadId;

            [partUploadTasks addObject:[[s3 uploadPart:uploadPartRequest] continueWithSuccessBlock:^id(BFTask *task) {
                XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
                XCTAssertTrue([task.result isKindOfClass:[AWSS3UploadPartOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3UploadPartOutput class]),[task.result description]);
                AWSS3UploadPartOutput *partOuput = task.result;
                XCTAssertNotNil(partOuput.ETag);

                AWSS3CompletedPart *completedPart = [AWSS3CompletedPart new];
                completedPart.partNumber = @(i);
                completedPart.ETag = partOuput.ETag;

                [completedParts replaceObjectAtIndex:i - 1 withObject:completedPart];

                return nil;
            }]];
        }

        return [BFTask taskForCompletionOfAllTasks:partUploadTasks];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);

        for (id cp in completedParts) {
            XCTAssertTrue([cp isKindOfClass:[AWSS3CompletedPart class]]);
        }

        //Construct CompleteUploadRequest
        AWSS3CompletedMultipartUpload *multipartUpload = [AWSS3CompletedMultipartUpload new];
        multipartUpload.parts = completedParts;

        AWSS3CompleteMultipartUploadRequest *compReq = [AWSS3CompleteMultipartUploadRequest new];
        compReq.bucket = testBucketNameGeneral;
        compReq.key = keyName;
        compReq.uploadId = uploadId;
        compReq.multipartUpload = multipartUpload;

        return [s3 completeMultipartUpload:compReq];
    }] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3CompleteMultipartUploadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3CompleteMultipartUploadOutput class]),[task.result description]);
        AWSS3CompleteMultipartUploadOutput *compOutput = task.result;
        resultETag = compOutput.ETag;

        XCTAssertNotNil(compOutput.location);
        XCTAssertNotNil(compOutput.ETag);
        XCTAssertEqualObjects(compOutput.bucket, testBucketNameGeneral);
        XCTAssertEqualObjects(compOutput.key, keyName);

        return nil;
    }] waitUntilFinished];

    sleep(5.0);

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName] && [s3Object.ETag isEqualToString:resultETag]) {
                match = YES;
            }
        }

        XCTAssertTrue(match, @"Didn't find the uploaded object in the bucket!");

        return nil;
    }] waitUntilFinished];

    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] waitUntilFinished];
}

- (void)testGetBucketLocation {
    AWSS3 *s3 = [AWSS3 defaultS3];
    AWSS3GetBucketLocationRequest *getBucketLocationRequest = [AWSS3GetBucketLocationRequest new];
    getBucketLocationRequest.bucket = testBucketNameGeneral;

    [[[s3 getBucketLocation:getBucketLocationRequest] continueWithBlock:^id(BFTask *task) {
        if(task.error != nil){
            XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        }
        
        AWSS3GetBucketLocationOutput *getBucketLocationOutput = task.result;
#if AWS_TEST_BJS_INSTEAD
        XCTAssertEqual(getBucketLocationOutput.locationConstraint, AWSS3BucketLocationConstraintCNNorth1);
#else
        XCTAssertEqual(getBucketLocationOutput.locationConstraint, AWSS3BucketLocationConstraintBlank);
#endif
        return nil;
    }] waitUntilFinished];
}

@end

#endif
