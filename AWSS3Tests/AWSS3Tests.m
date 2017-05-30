//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import "AWSS3.h"
#import "AWSTestUtility.h"

@interface AWSS3Tests : XCTestCase

@end

@implementation AWSS3Tests

NSUInteger const AWSS3Test256KB = 1024 * 256;
NSUInteger const AWSS3TestsTransferManagerMinimumPartSize = 5 * 1024 * 1024;
NSString *const AWSS3TestBucketNamePrefix = @"ios-v2-test-";

static NSURL *tempLargeURL = nil;
static NSURL *tempSmallURL = nil;

static NSString *testBucketNameGeneral = nil;

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
    //[AWSTestUtility setupCrdentialsViaFile];
    
    
    
    //Create bucketName
    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    testBucketNameGeneral = [NSString stringWithFormat:@"%@%lld", AWSS3TestBucketNamePrefix, (int64_t)timeIntervalSinceReferenceDate];

    [AWSS3Tests createBucketWithName:testBucketNameGeneral];
    
    
    //Create a large temporary file for uploading & downloading test
    tempLargeURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-s3tmTestTempLarge",testBucketNameGeneral]]];
    NSError *error = nil;
    if (![[NSFileManager defaultManager] createFileAtPath:tempLargeURL.path contents:nil attributes:nil]) {
        AWSDDLogError(@"Error: Can not create file with file path:%@",tempLargeURL.path);
    }
    error = nil;
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingToURL:tempLargeURL error:&error];
    if (error) {
        AWSDDLogError(@"Error: [%@]", error);
    }
    
    @autoreleasepool {
        
        NSMutableString *tempBaseString = [NSMutableString string];
        for (int32_t i = 0; i < 800000; i++) { //800000 = 4.68MB
            [tempBaseString appendFormat:@"%d", i];
        }
        
        int multiplier;
#if AWS_TEST_BJS_INSTEAD
        multiplier = 5;
#else
        multiplier = 5;
#endif
        for (int32_t j = 0; j < multiplier; j++) {
            @autoreleasepool {
                [fileHandle writeData:[tempBaseString dataUsingEncoding:NSUTF8StringEncoding]];
            }
        }
        [fileHandle closeFile];
        
        if (true) {
            //Create a smal temporary file for uploading & downloading test
            tempSmallURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-s3tmTestTempSmall",testBucketNameGeneral]]];
            NSError *error = nil;
            if (![[NSFileManager defaultManager] createFileAtPath:tempSmallURL.path contents:nil attributes:nil]) {
                AWSDDLogError(@"Error: Can not create file with file path:%@",tempSmallURL.path);
            }
            error = nil;
            NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingToURL:tempSmallURL error:&error];
            if (error) {
                AWSDDLogError(@"Error: [%@]", error);
            }
            
            [fileHandle writeData:[tempBaseString dataUsingEncoding:NSUTF8StringEncoding]]; //baseString 800000 = 4.68MB
            
            [fileHandle closeFile];
        }
        
    }
}

- (void)setUp {
    [super setUp];
    
    [AWSDDLog sharedInstance].logLevel = AWSDDLogLevelVerbose;
    [AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]];//xcode console logger
    
    AWSDDLogVerbose(@"verbose logging");
    
}

+ (void)tearDown {
    
    // Delete all contents of the bucket
    [AWSS3Tests deleteAllObjectsFromBucket:testBucketNameGeneral];
    
    //Delete Bucket
    [AWSS3Tests deleteBucketWithName:testBucketNameGeneral];
    
    //Delete Temp files
    if (tempLargeURL) {
        [[NSFileManager defaultManager] removeItemAtURL:tempLargeURL error:nil];
    }
    if (tempSmallURL) {
        [[NSFileManager defaultManager] removeItemAtURL:tempSmallURL error:nil];
    }

}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

+ (void)deleteAllObjectsFromBucket:(NSString *)bucketName {
    AWSS3 *s3 = [AWSS3 defaultS3];
    
    AWSS3ListObjectsRequest *listObjectsRequest = [AWSS3ListObjectsRequest new];
    listObjectsRequest.bucket = testBucketNameGeneral;
    
    [[[s3 listObjects:listObjectsRequest] continueWithBlock:^id(AWSTask *task) {
        AWSS3ListObjectsOutput *output = task.result;
        
        for (AWSS3Object *object in output.contents) {
            // Delete the object
            AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
            deleteObjectRequest.bucket = testBucketNameGeneral;
            deleteObjectRequest.key = object.key;
            
            [[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
                if (task.error) {
                    NSLog(@"Failed to delete: %@", object.key);
                } else {
                    NSLog(@"Successfully deleted: %@", object.key);
                }
                return nil;
            }];
        }
        return nil;
    }] waitUntilFinished];
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
    [[[s3 createBucket:createBucketReq] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            success = NO;
        } else {
            success = YES;
        }
        return nil;
    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

    return success;
}

+ (BOOL)deleteBucketWithName:(NSString *)bucketName {
    AWSS3 *s3 = [AWSS3 defaultS3];

    AWSS3ListObjectVersionsRequest *listObjectVersionsRequest = [AWSS3ListObjectVersionsRequest new];
    listObjectVersionsRequest.bucket = bucketName;

    [[[s3 listObjectVersions:listObjectVersionsRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        NSMutableArray *tasks = [NSMutableArray new];

        AWSS3ListObjectVersionsOutput *listObjectVersionsOutput = task.result;
        for (AWSS3ObjectVersion *version in listObjectVersionsOutput.versions) {
            AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
            deleteObjectRequest.bucket = bucketName;
            deleteObjectRequest.key = version.key;
            deleteObjectRequest.versionId = version.versionId;
            AWSTask *task = [s3 deleteObject:deleteObjectRequest];
            [tasks addObject:task];
        }
        for (AWSS3DeleteMarkerEntry *deleteMarker in listObjectVersionsOutput.deleteMarkers) {
            AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
            deleteObjectRequest.bucket = bucketName;
            deleteObjectRequest.key = deleteMarker.key;
            deleteObjectRequest.versionId = deleteMarker.versionId;
            AWSTask *task = [s3 deleteObject:deleteObjectRequest];
            [tasks addObject:task];
        }

        return [AWSTask taskForCompletionOfAllTasks:tasks];
    }] waitUntilFinished];

    AWSS3DeleteBucketRequest *deleteBucketReq = [AWSS3DeleteBucketRequest new];
    deleteBucketReq.bucket = bucketName;

    __block BOOL success = NO;
    [[[s3 deleteBucket:deleteBucketReq] continueWithBlock:^id(AWSTask *task) {
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

-(void)testCreateEmptyFolder {
    
    
    AWSS3 *s3 = [AWSS3 defaultS3];
    
    AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
    
    putObjectRequest.key = @"test/";
    putObjectRequest.bucket = testBucketNameGeneral;
    putObjectRequest.body = nil;
    
    [[[s3 putObject:putObjectRequest] continueWithBlock:^id(AWSTask *task)
     {
         XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
         return nil;
     }] waitUntilFinished];
    
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = @"test/";
    
    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] waitUntilFinished];
    
    
}
- (void)testClockSkewS3 {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    [[[s3 listBuckets:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListBucketsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListBucketsOutput class]));

        return nil;
    }] waitUntilFinished];

    [AWSTestUtility revertSwizzling];
}

- (void)testListBucket {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    [[[s3 listBuckets:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListBucketsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListBucketsOutput class]));

        AWSS3ListBucketsOutput *listBucketOutput = task.result;
        AWSDDLogDebug(@" testListBucket ========= responseObject is: ================  %@", [listBucketOutput description]);
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
    
    [[[[[[s3 createBucket:createBucketReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
        return [s3 listBuckets:[AWSRequest new]];
    }] continueWithBlock:^id(AWSTask *task) {
        //Check if bucket are there.
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListBucketsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListBucketsOutput class]));

        AWSS3ListBucketsOutput *listBucketOutput = task.result;
        XCTAssertTrue([self isContainBucketName:bucketNameTest2 inBucketArray:listBucketOutput.buckets], @"%@ can not be found in S3 Bucket List",bucketNameTest2);

        AWSS3DeleteBucketRequest *deleteBucketReq = [AWSS3DeleteBucketRequest new];
        deleteBucketReq.bucket = bucketNameTest2;

        return [s3 deleteBucket:deleteBucketReq];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
        return [s3 listBuckets:[AWSRequest new]];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListBucketsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListBucketsOutput class]));

        AWSS3ListBucketsOutput *listBucketOutput = task.result;
        XCTAssertFalse([self isContainBucketName:bucketNameTest2 inBucketArray:listBucketOutput.buckets], @"%@ should NOT befound in S3 Bucket List",bucketNameTest2);
        return nil;
    }] waitUntilFinished];
}

- (void)testBucketCustomEndpoint {
    
    id<AWSCredentialsProvider> credentialsProvider = [[[AWSServiceManager defaultServiceManager] defaultServiceConfiguration] credentialsProvider];
    
    AWSEndpoint *customEndpoint = [[AWSEndpoint alloc]initWithURLString:@"https://s3.dualstack.us-east-1.amazonaws.com"];
    
    AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc]initWithRegion:AWSRegionUSEast1 endpoint:customEndpoint credentialsProvider:credentialsProvider];
    
    [AWSS3 registerS3WithConfiguration:serviceConfiguration forKey:@"customendpoint"];
    
    AWSS3 *s3 = [AWSS3 S3ForKey:@"customendpoint"];
    XCTAssertNotNil(s3);
    
    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;
    
    [[[s3 listObjects:listObjectReq] continueWithBlock:^id _Nullable(AWSTask<AWSS3ListObjectsOutput *> * _Nonnull task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            XCTAssertTrue([s3Object.lastModified isKindOfClass:[NSDate class]], @"listObject doesn't contain LastModified(NSDate)");
        }
        
        return nil;
    }] waitUntilFinished];
    
}

- (void)testEmptyFolder{
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    
    XCTAssertNotNil(testBucketNameGeneral);
    
    AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
    
    putObjectRequest.key = @"test/";
    putObjectRequest.bucket = testBucketNameGeneral;
   
    putObjectRequest.body = nil;
    NSLog(@"testBucketNameGeneral %@",testBucketNameGeneral);
    
    
    [[[[[[s3 putObject:putObjectRequest] continueWithBlock:^id(AWSTask *task)
      {
          XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
          AWSS3ListObjectsRequest *list = [AWSS3ListObjectsRequest new];
          list.bucket = testBucketNameGeneral;
          return [s3 listObjects:list];
      }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
          XCTAssertNil(task.error);
          AWSS3ListObjectsOutput *listObjects = (AWSS3ListObjectsOutput *)task.result;
          XCTAssertTrue([[listObjects contents] count] == 1);
          NSArray<AWSS3Object *> *contents = [listObjects contents];
          AWSS3Object *fileContent = [contents firstObject];
          XCTAssertNotNil(fileContent);
          NSString *key = [fileContent key];
          XCTAssertTrue([[key substringFromIndex:[key length] - 1] isEqualToString:@"/"]);
          AWSS3DeleteObjectRequest *del = [AWSS3DeleteObjectRequest new];
          del.bucket = testBucketNameGeneral;
          del.key = @"test/";
          return [s3 deleteObject:del];
      }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
          XCTAssertNil(task.error);
          AWSS3ListObjectsRequest *list = [AWSS3ListObjectsRequest new];
          list.bucket = testBucketNameGeneral;
          return [s3 listObjects:list];
      }] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
          XCTAssertNil(task.error);
          AWSS3ListObjectsOutput *listObjects = (AWSS3ListObjectsOutput *)task.result;
          XCTAssertTrue([[listObjects contents] count] == 0);
          return nil;
      }] waitUntilFinished];
}


- (void)testPutBucketWithGrants {
    NSString *grantBucketName = [testBucketNameGeneral stringByAppendingString:@"-grant"];
    XCTAssertTrue([AWSS3Tests createBucketWithName:grantBucketName]);

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3Grantee *granteeOne = [AWSS3Grantee new];
    granteeOne.identifier = @"154b2f3550127d0439dfe1e89a03a7a4178048cc05c6fdaeb40796841a5cfcef";
    granteeOne.displayName = @"awssandbox";
    granteeOne.types = AWSS3TypesCanonicalUser;

    AWSS3Grant *grantOne = [AWSS3Grant new];
    grantOne.permission = AWSS3PermissionRead;
    grantOne.grantee = granteeOne;

    NSArray *grantsList = [NSArray arrayWithObjects:grantOne, nil];

    AWSS3Owner *s3Owner = [AWSS3Owner new];
    s3Owner.displayName = @"aws-dr-mobile-test-ios@amazon.com";
    s3Owner.identifier = @"0d822d37be4e6e24e50d96c88fefa5d3b2e8cd5661a759d6a07596306c41f52d";

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
    
    
    
    [[[s3 putBucketAcl:putBucketAclReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        return nil;

    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    // Delete all objects from the bucket
    [AWSS3Tests deleteAllObjectsFromBucket:grantBucketName];
    
    XCTAssertTrue([AWSS3Tests deleteBucketWithName:grantBucketName]);
}

- (void)testListObjects {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;

        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            XCTAssertTrue([s3Object.lastModified isKindOfClass:[NSDate class]], @"listObject doesn't contain LastModified(NSDate)");
        }

        return nil;
    }] waitUntilFinished];

    AWSS3ListObjectsRequest *listObjectReq2 = [AWSS3ListObjectsRequest new];
    listObjectReq2.bucket = @"ios-test-listobjects-not-existed";


    [[[s3 listObjects:listObjectReq2] continueWithBlock:^id(AWSTask *task) {
        XCTAssertTrue(task.error, @"Expected NoSuchBucket Error not thrown.");
        XCTAssertEqual(task.error.code, AWSS3ErrorNoSuchBucket);
        return nil;
    }] waitUntilFinished];
}

- (void)testParamsURLEncoding {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    
    NSString *keyName = @" name with!@#$%^&+-end";

    
    NSString *testObjectStr = @"a test object string.";
    NSData *testObjectData = [testObjectStr dataUsingEncoding:NSUTF8StringEncoding];
    
    AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
    putObjectRequest.bucket = testBucketNameGeneral;
    putObjectRequest.key = keyName;
    putObjectRequest.body = testObjectData;
    putObjectRequest.contentLength = [NSNumber numberWithUnsignedInteger:[testObjectData length]];
    
    putObjectRequest.contentType = @"video/mpeg";
    
    [[[s3 putObject:putObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]),[task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);
        XCTAssertEqual(putObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionUnknown);
        return nil;
        
    }] waitUntilFinished];
    
     [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    //List Object with parameters need URL Encoding
    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;
    
    listObjectReq.marker = keyName;
    listObjectReq.prefix = @" name";
    
    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
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
    
    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
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
    
    //Add User Metadata
    NSDictionary *userMetaData = @{@"user-data-1": @"user-metadata-value1",
                                   @"user-data-2": @"user-metadata-value2"};
    
    
    putObjectRequest.metadata = userMetaData;

    [[[[[[[s3 putObject:putObjectRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]), [task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);
        XCTAssertEqual(putObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionUnknown);

        AWSS3HeadObjectRequest *headObjectRequest = [AWSS3HeadObjectRequest new];
        headObjectRequest.bucket = testBucketNameGeneral;
        headObjectRequest.key = keyName;

        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:15]];
        return [s3 headObject:headObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3HeadObjectOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3HeadObjectOutput class]), [task.result description]);
        AWSS3HeadObjectOutput *headObjectOutput = task.result;
        XCTAssertTrue([headObjectOutput.contentLength intValue] > 0, @"Content Length is 0: [%@]", headObjectOutput.contentLength);

        XCTAssertEqualObjects(userMetaData, headObjectOutput.metadata, @"headObjectOutput doesn't contains the metadata we expected");
        
        AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
        getObjectRequest.bucket = testBucketNameGeneral;
        getObjectRequest.key = keyName;

        return [s3 getObject:getObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3GetObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3GetObjectOutput class]),[task.result description]);
        AWSS3GetObjectOutput *getObjectOutput = task.result;
        NSData *receivedBody = getObjectOutput.body;
        XCTAssertEqualObjects(testObjectData,receivedBody, @"received object is different from sent object, expect:%@ but got:%@",[[NSString alloc] initWithData:testObjectData encoding:NSUTF8StringEncoding],[[NSString alloc] initWithData:receivedBody encoding:NSUTF8StringEncoding]);

        XCTAssertEqualObjects(userMetaData, getObjectOutput.metadata, @"getObjectOutput doesn't contains the metadata we expected");
        
        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = testBucketNameGeneral;
        deleteObjectRequest.key = keyName;

        return [s3 deleteObject:deleteObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
         XCTAssertNil(task.error, @"Error: [%@]", task.error);
        return nil;
    }] waitUntilFinished];
}

- (void)testPutHeadGetAndDeleteObjectServiceAwsKmsEncryption {
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
    
    putObjectRequest.serverSideEncryption = AWSS3ServerSideEncryptionAwsKms;
    
    //Add User Metadata
    NSDictionary *userMetaData = @{@"user-data-1": @"user-metadata-value1",
                                   @"user-data-2": @"user-metadata-value2"};
    
    
    putObjectRequest.metadata = userMetaData;
    
    [[[[[[[s3 putObject:putObjectRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]), [task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);
        XCTAssertEqual(putObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionAwsKms);
        XCTAssertNotNil(putObjectOutput.SSEKMSKeyId);
        
        AWSS3HeadObjectRequest *headObjectRequest = [AWSS3HeadObjectRequest new];
        headObjectRequest.bucket = testBucketNameGeneral;
        headObjectRequest.key = keyName;
        
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:15]];
        return [s3 headObject:headObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3HeadObjectOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3HeadObjectOutput class]), [task.result description]);
        AWSS3HeadObjectOutput *headObjectOutput = task.result;
        XCTAssertTrue([headObjectOutput.contentLength intValue] > 0, @"Content Length is 0: [%@]", headObjectOutput.contentLength);
        XCTAssertEqual(headObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionAwsKms);
        XCTAssertNotNil(headObjectOutput.SSEKMSKeyId);
        
        XCTAssertEqualObjects(userMetaData, headObjectOutput.metadata, @"headObjectOutput doesn't contains the metadata we expected");
        
        AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
        getObjectRequest.bucket = testBucketNameGeneral;
        getObjectRequest.key = keyName;
        
        return [s3 getObject:getObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3GetObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3GetObjectOutput class]),[task.result description]);
        AWSS3GetObjectOutput *getObjectOutput = task.result;
        
        XCTAssertEqual(getObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionAwsKms);
        XCTAssertNotNil(getObjectOutput.SSEKMSKeyId);
        
        
        NSData *receivedBody = getObjectOutput.body;
        XCTAssertEqualObjects(testObjectData,receivedBody, @"received object is different from sent object, expect:%@ but got:%@",[[NSString alloc] initWithData:testObjectData encoding:NSUTF8StringEncoding],[[NSString alloc] initWithData:receivedBody encoding:NSUTF8StringEncoding]);
        
        XCTAssertEqualObjects(userMetaData, getObjectOutput.metadata, @"getObjectOutput doesn't contains the metadata we expected");
        
        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = testBucketNameGeneral;
        deleteObjectRequest.key = keyName;
        
        return [s3 deleteObject:deleteObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"Error: [%@]", task.error);
        return nil;
    }] waitUntilFinished];
}

- (void)testPutHeadGetAndDeleteObjectServiceCustomEncryption {
    NSString *keyName = @"ios-test-put-get-and-delete-obj";
    
    NSString *getObjectFilePath = tempLargeURL.path;
    XCTAssertNotNil(getObjectFilePath);
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:getObjectFilePath]);
    unsigned long long fileSize = [[[NSFileManager defaultManager] attributesOfItemAtPath:getObjectFilePath error:nil] fileSize];

    
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    
    AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
    putObjectRequest.bucket = testBucketNameGeneral;
    putObjectRequest.key = keyName;
    putObjectRequest.body = [NSURL fileURLWithPath:getObjectFilePath];;
    putObjectRequest.contentLength = [NSNumber numberWithUnsignedLongLong:fileSize];
    putObjectRequest.contentType = @"video/mpeg";
    
    //Custom SSE
    NSString *base64Key = @"sBldqVP3dNJ9OLh4Fi0+HYAgIZsToOLQxiX3jM7TbHw=";
    NSData *nsdataFromBase64String = [[NSData alloc]
                                      initWithBase64EncodedString:base64Key options:kNilOptions];
    NSString *base64KeyMD5 = [NSString aws_base64md5FromData:nsdataFromBase64String];
    
    putObjectRequest.SSECustomerAlgorithm = @"AES256";
    putObjectRequest.SSECustomerKey = base64Key;
    putObjectRequest.SSECustomerKeyMD5 = base64KeyMD5;
    
    //Add User Metadata
    NSDictionary *userMetaData = @{@"user-data-1": @"user-metadata-value1",
                                   @"user-data-2": @"user-metadata-value2"};
    
    
    putObjectRequest.metadata = userMetaData;
    
    [[[[[[[s3 putObject:putObjectRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]), [task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);
        XCTAssertEqualObjects(putObjectOutput.SSECustomerAlgorithm, @"AES256");
        XCTAssertEqualObjects(putObjectOutput.SSECustomerKeyMD5, base64KeyMD5);
        
        AWSS3HeadObjectRequest *headObjectRequest = [AWSS3HeadObjectRequest new];
        headObjectRequest.bucket = testBucketNameGeneral;
        headObjectRequest.key = keyName;
        
        headObjectRequest.SSECustomerAlgorithm = @"AES256";
        headObjectRequest.SSECustomerKey = base64Key;
        headObjectRequest.SSECustomerKeyMD5 = base64KeyMD5;
        
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:15]];
        return [s3 headObject:headObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3HeadObjectOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3HeadObjectOutput class]), [task.result description]);
        AWSS3HeadObjectOutput *headObjectOutput = task.result;
        XCTAssertTrue([headObjectOutput.contentLength intValue] > 0, @"Content Length is 0: [%@]", headObjectOutput.contentLength);
        XCTAssertEqualObjects(headObjectOutput.SSECustomerAlgorithm, @"AES256");
        XCTAssertEqualObjects(headObjectOutput.SSECustomerKeyMD5, base64KeyMD5);
        
        XCTAssertEqualObjects(userMetaData, headObjectOutput.metadata, @"headObjectOutput doesn't contains the metadata we expected");
        
        AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
        getObjectRequest.bucket = testBucketNameGeneral;
        getObjectRequest.key = keyName;
        
        getObjectRequest.SSECustomerAlgorithm = @"AES256";
        getObjectRequest.SSECustomerKey = base64Key;
        getObjectRequest.SSECustomerKeyMD5 = base64KeyMD5;
        
        return [s3 getObject:getObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3GetObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3GetObjectOutput class]),[task.result description]);
        AWSS3GetObjectOutput *getObjectOutput = task.result;
        
        XCTAssertEqualObjects(getObjectOutput.SSECustomerAlgorithm, @"AES256");
        XCTAssertEqualObjects(getObjectOutput.SSECustomerKeyMD5, base64KeyMD5);
        
        
        NSData *responseData = getObjectOutput.body;
        
        //read file content
        NSData *testObjectData = [NSData dataWithContentsOfFile:getObjectFilePath];
        XCTAssertEqualObjects(testObjectData, responseData, @"received object is different from sent object.");
        
        
        XCTAssertEqualObjects(userMetaData, getObjectOutput.metadata, @"getObjectOutput doesn't contains the metadata we expected");
        
        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = testBucketNameGeneral;
        deleteObjectRequest.key = keyName;
        
        return [s3 deleteObject:deleteObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
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
    
    [[[s3 getObject:getObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"The request should failed but the error is nil");
        XCTAssertEqual(AWSS3ErrorNoSuchKey, task.error.code, @"expected AWSS3ErrorNoSuchKey Error but got error code:%ld",(long)task.error.code);
        XCTAssertNil(task.result, @"result should be nil but got something.");
        
        
        return nil;
    }] waitUntilFinished];
    
}

-(void)testGetObjectByFilePathCanceled {
    
    AWSS3 *s3 = [AWSS3 defaultS3];
    
    AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
    getObjectRequest.bucket = @"ios-v2-s3-tm-testdata";
    getObjectRequest.key = @"temp.txt";
    
    //assign the file path to be written.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"s3TestCanceled.txt"];
    getObjectRequest.downloadingFileURL = [NSURL fileURLWithPath:filePath];
    
    
    AWSTask *getObjTask = [[s3 getObject:getObjectRequest] continueWithBlock:^id(AWSTask *task) {
        //Should return Cancelled Task Error
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        if ([NSURLErrorDomain isEqualToString:task.error.domain]) {
            XCTAssertEqualObjects(NSURLErrorDomain, task.error.domain);
            XCTAssertEqual(NSURLErrorCancelled, task.error.code);
        } else {
            XCTAssertEqualObjects(AWSNetworkingErrorDomain, task.error.domain);
            XCTAssertEqual(AWSNetworkingErrorCancelled, task.error.code);
        }

        return nil;
    }];
    
    
    //wait few sec then cancel this job
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
    [getObjectRequest cancel];
    
    
    [getObjTask waitUntilFinished];

    
}
- (void)testPutGetAndDeleteObjectByFilePathWithProgressFeedback {
    NSString *keyName = @"ios-test-put-get-and-delete-obj";
    NSString *getObjectFilePath = tempSmallURL.path;
    XCTAssertNotNil(getObjectFilePath);
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:getObjectFilePath]);
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
    
    [[[s3 putObject:putObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]),[task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);
        XCTAssertEqual(putObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionUnknown);
        return nil;

    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
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
    
    [[[s3 getObject:getObjectRequest] continueWithBlock:^id(AWSTask *task) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] waitUntilFinished];
}


- (void)testPutBucketVersioning {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3VersioningConfiguration *conf = [AWSS3VersioningConfiguration new];
    conf.status = AWSS3BucketVersioningStatusEnabled;
    //conf.MFADelete = AWSS3MFADeleteDisabled;
    
    AWSS3PutBucketVersioningRequest *versionRequest =  [AWSS3PutBucketVersioningRequest new];
    versionRequest.bucket = testBucketNameGeneral;
    versionRequest.versioningConfiguration = conf;

    [[[s3 putBucketVersioning:versionRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];

    conf = [AWSS3VersioningConfiguration new];
    conf.status = AWSS3BucketVersioningStatusSuspended;

    versionRequest =  [AWSS3PutBucketVersioningRequest new];
    versionRequest.bucket = testBucketNameGeneral;
    versionRequest.versioningConfiguration = conf;

    [[[s3 putBucketVersioning:versionRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
}


- (void)testPutBucketTagging {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    
    AWSS3Tag *aTag = [AWSS3Tag new];
    aTag.key = @"tagKey";
    aTag.value = @"tagValue";
    
    AWSS3Tag *aTagTwo = [AWSS3Tag new];
    aTagTwo.key = @"tagKey2";
    aTagTwo.value = @"tagKeyValue2";
    
    AWSS3Tagging *tagging = [AWSS3Tagging new];
    tagging.tagSet = @[aTag,aTagTwo];
    
    AWSS3PutBucketTaggingRequest *putBucketTaggingReq = [AWSS3PutBucketTaggingRequest new];
    putBucketTaggingReq.bucket = testBucketNameGeneral;
    putBucketTaggingReq.tagging = tagging;
    
    [[[s3 putBucketTagging:putBucketTaggingReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        return nil;
    }] waitUntilFinished];
    
}
- (void)testPutBucketLifeCycle {
    
    // ----------Test PutBucketLifeCycle-----------------
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    
    AWSS3LifecycleExpiration *expire = [AWSS3LifecycleExpiration new];
    expire.days = @10;
    
    
    AWSS3Rule *myRule = [AWSS3Rule new];
    myRule.prefix = @"key-prefix";
    myRule.status = AWSS3ExpirationStatusEnabled;
    myRule.expiration = expire;
    
    AWSS3LifecycleConfiguration *cycleConf = [AWSS3LifecycleConfiguration new];
    cycleConf.rules = @[myRule];
    
    AWSS3PutBucketLifecycleRequest *putBucketLifeCycleReq = [AWSS3PutBucketLifecycleRequest new];
    putBucketLifeCycleReq.bucket = testBucketNameGeneral;
    putBucketLifeCycleReq.lifecycleConfiguration =    cycleConf;
    
    [[[s3 putBucketLifecycle:putBucketLifeCycleReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        
        return nil;
    }] waitUntilFinished ];
    
}
- (void)testPutBucketCor {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    
    
    //-------------Test PutBucketCorsReq-----------------
    NSMutableArray *corsRules = [NSMutableArray new];
    
    AWSS3CORSRule *rule = [AWSS3CORSRule new];
    rule.allowedMethods = @[@"PUT",@"POST",@"DELETE"];
    rule.allowedOrigins = @[@"*"];
    [corsRules addObject:rule];
    
    AWSS3CORSRule *rule2 = [AWSS3CORSRule new];
    rule2.allowedOrigins = @[@"*"];
    rule2.allowedMethods = @[@"GET"];
    rule2.allowedHeaders = @[@"*"];
    [corsRules addObject:rule2];
    
    AWSS3CORSConfiguration *cors = [AWSS3CORSConfiguration new];;
    cors.CORSRules = corsRules;
    
    AWSS3PutBucketCorsRequest *putBucketCorsReq = [AWSS3PutBucketCorsRequest new];
    putBucketCorsReq.bucket =  testBucketNameGeneral;
    putBucketCorsReq.CORSConfiguration = cors;
    
    [[[s3 putBucketCors:putBucketCorsReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        
        AWSS3DeleteBucketRequest *deleteBucketReq = [AWSS3DeleteBucketRequest new];
        deleteBucketReq.bucket = testBucketNameGeneral ;
        
        return nil;
        
    }] waitUntilFinished];

    
}

- (void)testDeleteMultipleObjects {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    
    unsigned char *largeData = malloc(AWSS3Test256KB) ;
    memset(largeData, 5, AWSS3Test256KB);
    NSData *testObjectData = [[NSData alloc] initWithBytesNoCopy:largeData length:AWSS3Test256KB];

    
    for (int i=0;i<5;i++) {
        NSString *keyName = [NSString stringWithFormat:@"key%d",i];
        AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
        putObjectRequest.bucket = testBucketNameGeneral;
        putObjectRequest.key = keyName;
        putObjectRequest.body = testObjectData;
        putObjectRequest.contentLength = [NSNumber numberWithUnsignedInteger:[testObjectData length]];
        
        [[[s3 putObject:putObjectRequest] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
            return nil;
        }] waitUntilFinished];
    }
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    NSMutableArray *objectsArray = [NSMutableArray new];
    for (int i=0;i<5;i++) {
        NSString *keyName = [NSString stringWithFormat:@"key%d",i];
        AWSS3ObjectIdentifier *obj = [AWSS3ObjectIdentifier new];
        obj.key = keyName;
        [objectsArray addObject:obj];
    }
    
    AWSS3Remove *s3Remove = [AWSS3Remove new];
    s3Remove.objects = objectsArray;
    
    AWSS3DeleteObjectsRequest *multipleObjectsDeleteReq = [AWSS3DeleteObjectsRequest new];
    multipleObjectsDeleteReq.bucket = testBucketNameGeneral;
    multipleObjectsDeleteReq.remove = s3Remove;
    
    [[[s3 deleteObjects:multipleObjectsDeleteReq ] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        AWSS3DeleteObjectsOutput *output = task.result;
        XCTAssertEqual([AWSS3DeleteObjectsOutput class], [output class]);
        
        NSMutableSet *deletedSet = [NSMutableSet new];
        
        NSMutableSet *expectedSet = [NSMutableSet new];
        for (int i=0;i<5;i++) {
            [expectedSet addObject:[NSString stringWithFormat:@"key%d",i]];
            AWSS3DeletedObject *deletedObj = output.deleted[i];
            [deletedSet addObject:deletedObj.key];
        }
        XCTAssertEqualObjects(expectedSet, deletedSet);

        return nil;
    }] waitUntilFinished];
    
}
- (void)testPutGetAndDeleteObject256KBWithProgressFeedbackAndGreedyKey {
    NSString *keyName = @"testfolder/ios-test-put-and-delete-256KB";
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
    
    [[[s3 putObject:putObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]),[task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);
        XCTAssertEqual(putObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionUnknown);
        return nil;

    }] waitUntilFinished];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    XCTAssertEqual(AWSS3Test256KB, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(AWSS3Test256KB, totalExpectedUploadBytes);
    
    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
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
    
    [[[s3 getObject:getObjectRequest] continueWithBlock:^id(AWSTask *task) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] waitUntilFinished];
    
    //confirm it has been deleted
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    AWSS3ListObjectsRequest *listObjectReq2 = [AWSS3ListObjectsRequest new];
    listObjectReq2.bucket = testBucketNameGeneral;
    
    [[[s3 listObjects:listObjectReq2] continueWithBlock:^id(AWSTask *task) {
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
        XCTAssertFalse(hasObject,@"object should be deleted but still existed.");
        
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

    [[[[[s3 createMultipartUpload:createReq] continueWithBlock:^id(AWSTask *task) {
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

            [partUploadTasks addObject:[[s3 uploadPart:uploadPartRequest] continueWithSuccessBlock:^id(AWSTask *task) {
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

        return [AWSTask taskForCompletionOfAllTasks:partUploadTasks];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
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
    }] continueWithBlock:^id(AWSTask *task) {
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

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:20]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] waitUntilFinished];
}

- (void)testGetBucketLocation {
    AWSS3 *s3 = [AWSS3 defaultS3];
    AWSS3GetBucketLocationRequest *getBucketLocationRequest = [AWSS3GetBucketLocationRequest new];
    getBucketLocationRequest.bucket = testBucketNameGeneral;

    [[[s3 getBucketLocation:getBucketLocationRequest] continueWithBlock:^id(AWSTask *task) {
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

- (void)testHeadNonExistingKey {
    AWSS3 *s3 = [AWSS3 defaultS3];

    AWSS3HeadObjectRequest *headObjectRequest = [AWSS3HeadObjectRequest new];
    headObjectRequest.bucket = testBucketNameGeneral;
    headObjectRequest.key = @"some-non-existing-key";

    [[[s3 headObject:headObjectRequest] continueWithBlock:^id _Nullable(AWSTask<AWSS3HeadObjectOutput *> * _Nonnull task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];
}

- (void)testHTMLContentType {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Completion handler called."];

    NSString *testObjectStr = @"<html></html>";
    NSString *keyName = @"ios-test-put-get-and-delete-html";
    NSData *testObjectData = [testObjectStr dataUsingEncoding:NSUTF8StringEncoding];

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
    putObjectRequest.bucket = testBucketNameGeneral;
    putObjectRequest.key = keyName;
    putObjectRequest.body = testObjectData;
    putObjectRequest.contentLength = @(testObjectData.length);
    putObjectRequest.contentType = @"text/html";

    [[[[[s3 putObject:putObjectRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]), [task.result description]);
        AWSS3PutObjectOutput *putObjectOutput = task.result;
        XCTAssertNotNil(putObjectOutput.ETag);

        AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
        getObjectRequest.bucket = testBucketNameGeneral;
        getObjectRequest.key = keyName;

        return [s3 getObject:getObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3GetObjectOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3GetObjectOutput class]),[task.result description]);
        AWSS3GetObjectOutput *getObjectOutput = task.result;
        NSData *receivedBody = getObjectOutput.body;

        XCTAssertEqualObjects(testObjectData,receivedBody, @"received object is different from sent object, expect:%@ but got:%@",[[NSString alloc] initWithData:testObjectData encoding:NSUTF8StringEncoding],[[NSString alloc] initWithData:receivedBody encoding:NSUTF8StringEncoding]);
        XCTAssertEqualObjects(getObjectOutput.contentType, @"text/html");

        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = testBucketNameGeneral;
        deleteObjectRequest.key = keyName;

        return [s3 deleteObject:deleteObjectRequest];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"Error: [%@]", task.error);

        [expectation fulfill];

        return nil;
    }];

    [self waitForExpectationsWithTimeout:30.0 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

@end
