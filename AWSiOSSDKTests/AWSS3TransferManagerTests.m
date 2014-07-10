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

#if AWS_TEST_S3_TRANSFER_MANAGER

#import <XCTest/XCTest.h>
#import "S3.h"

@interface AWSS3TransferManagerTests : XCTestCase

@end

@implementation AWSS3TransferManagerTests

static NSString *testBucketNameGeneral = nil;
static NSString *const AWSS3TestBucketNamePrefix = @"ios-v2-tm-test-";
static NSURL *tempLargeURL = nil;
static NSURL *tempSmallURL = nil;

+ (void)setUp {
    [super setUp];
    //[AZLogger defaultLogger].logLevel = AZLogLevelVerbose;
    // Put setup code here. This method is called before the invocation of each test method in the class.

    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }

    //Create bucketName
    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    testBucketNameGeneral = [NSString stringWithFormat:@"%@%lld", AWSS3TestBucketNamePrefix, (int64_t)timeIntervalSinceReferenceDate];

    [[self class] createBucketWithName:testBucketNameGeneral];
    
    //Create a large temporary file for uploading & downloading test
    tempLargeURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-s3tmTestTempLarge",testBucketNameGeneral]]];
    NSError *error = nil;
    if (![[NSFileManager defaultManager] createFileAtPath:tempLargeURL.path contents:nil attributes:nil]) {
        AZLogError(@"Error: Can not create file with file path:%@",tempLargeURL.path);
    }
    error = nil;
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingToURL:tempLargeURL error:&error];
    if (error) {
        AZLogError(@"Error: [%@]", error);
    }
    
    @autoreleasepool {
        
        NSMutableString *tempBaseString = [NSMutableString string];
        for (int32_t i = 0; i < 800000; i++) { //800000 = 4.68MB
            [tempBaseString appendFormat:@"%d", i];
        }
        
        for (int32_t j = 0; j < 15; j++) {
            @autoreleasepool {
                [fileHandle writeData:[tempBaseString dataUsingEncoding:NSUTF8StringEncoding]];
            }
        }
        [fileHandle closeFile];
        
        if (true) {
            //Create a smal temporary file for uploading & downloading test
            tempSmallURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-s3tmTestTempSmall",testBucketNameGeneral]]];
            NSError *error = nil;
            if (![[NSFileManager defaultManager] createFileAtPath:tempSmallURL.path contents:nil attributes:nil]) {
                AZLogError(@"Error: Can not create file with file path:%@",tempSmallURL.path);
            }
            error = nil;
            NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingToURL:tempSmallURL error:&error];
            if (error) {
                AZLogError(@"Error: [%@]", error);
            }
            
            [fileHandle writeData:[tempBaseString dataUsingEncoding:NSUTF8StringEncoding]]; //baseString 800000 = 4.68MB
            
            [fileHandle closeFile];
        }

    }

}

+ (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];

    //Delete Bucket
    [[self class] deleteBucketWithName:testBucketNameGeneral];
}

- (void)testTMPauseAllandResumeAllTasks {
    
    
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);
    
    //Create multiple upload tasks
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempLargeURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];
    
    
    NSString *keyName1 = [NSString stringWithFormat:@"%@-large-%d",NSStringFromSelector(_cmd),1];
    AWSS3TransferManagerUploadRequest *uploadRequest1 = [AWSS3TransferManagerUploadRequest new];
    uploadRequest1.bucket = testBucketNameGeneral;
    uploadRequest1.key = keyName1;
    uploadRequest1.body = testDataURL;
    
 
    BFTask *uploadTask1 = [[transferManager upload:uploadRequest1] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        
        return nil;
    }];
    
    NSString *keyName2 = [NSString stringWithFormat:@"%@-large-%d",NSStringFromSelector(_cmd),2];
    AWSS3TransferManagerUploadRequest *uploadRequest2 = [AWSS3TransferManagerUploadRequest new];
    uploadRequest2.bucket = testBucketNameGeneral;
    uploadRequest2.key = keyName2;
    uploadRequest2.body = testDataURL;
  
   
    BFTask *uploadTask2 = [[transferManager upload:uploadRequest2] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        
        return nil;
    }];
    
    
    //Create Multiple downloadTask
    
    AWSS3TransferManagerDownloadRequest *downloadRequest1 = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest1.bucket = @"ios-v2-s3-tm-testdata";
    downloadRequest1.key = @"temp.txt";
    
    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@-%d",NSStringFromSelector(_cmd),testBucketNameGeneral,1];
    downloadRequest1.downloadingFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:downloadFileName]];
    BFTask *downloadTask1 = [[transferManager download:downloadRequest1] continueWithBlock:^id(BFTask *task) {
        //Should return Cancelled Task Error
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];
    
    AWSS3TransferManagerDownloadRequest *downloadRequest2 = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest2.bucket = @"ios-v2-s3-tm-testdata";
    downloadRequest2.key = @"temp2.txt";
    
    
    NSString *downloadFileName2 = [NSString stringWithFormat:@"%@-downloaded-%@-%d",NSStringFromSelector(_cmd),testBucketNameGeneral,2];
    downloadRequest2.downloadingFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:downloadFileName2]];
    BFTask *downloadTask2 = [[transferManager download:downloadRequest2] continueWithBlock:^id(BFTask *task) {
        //Should return Cancelled Task Error
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];
    
    
    //Wait a few second and then pause all tasks
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [[transferManager pauseAll] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }];
    
    //make sure all uploading/downloading task callback has been called.
    [uploadTask1 waitUntilFinished];
    [uploadTask2 waitUntilFinished];
    
    [downloadTask1 waitUntilFinished];
    [downloadTask2 waitUntilFinished];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    
    //resume it
    __block int expectResumeRequestCount = 0;
    __block int totalResumedRequestCount = 0;
    [[[transferManager resumeAll:^(AWSRequest *request) {
        totalResumedRequestCount++;
        
        if ([request isKindOfClass:[AWSS3TransferManagerUploadRequest class]]) {
            AWSS3TransferManagerUploadRequest *pausedUploadRequest = (AWSS3TransferManagerUploadRequest *)request;
            if ([pausedUploadRequest.key isEqualToString:keyName1]) {
                //upload request 1
                expectResumeRequestCount++;
               
            } else if ([pausedUploadRequest.key isEqualToString:keyName2]) {
                //upload request 2
                expectResumeRequestCount++;
            } else {
                XCTFail(@"unexpected uploadRequest received:\n %@",pausedUploadRequest);
            }
            
        } else if  ([request isKindOfClass:[AWSS3TransferManagerDownloadRequest class]]) {
            AWSS3TransferManagerDownloadRequest *pausedDownloadRequest =(AWSS3TransferManagerDownloadRequest *)request;
            if ([pausedDownloadRequest.key isEqualToString:@"temp.txt"]) {
                //download request 1
                expectResumeRequestCount++;
            } else if ([pausedDownloadRequest.key isEqualToString:@"temp2.txt"]) {
                //download request 2
                expectResumeRequestCount++;
            } else {
                XCTFail(@"unexpected downloadRequest received:\n %@",pausedDownloadRequest);
            }
        } else {
            XCTFail(@"unexpected request received:\n %@",request);
        }
        
        
    }] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error);
        NSArray *results = task.result;
        XCTAssertEqual(4, [results count]);
        
        for (id responseObject in results) {
            if ([responseObject isKindOfClass:[AWSS3TransferManagerDownloadOutput class]]) {
                AWSS3TransferManagerDownloadOutput *output = (AWSS3TransferManagerDownloadOutput *)responseObject;
                NSURL *receivedBodyURL = output.body;
                XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));
                
                //Compare file size
                NSError *error = nil;
                NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path
                                                                                            error:&error];
                XCTAssertNil(error, @"The request failed. error: [%@]", error);
                unsigned long long fileSize = [attributes fileSize];
                XCTAssertEqual(65961003, fileSize,@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)65961003,(unsigned long)fileSize);
            }
        }
        
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(4, expectResumeRequestCount, @"number of expected request is not matched");
    XCTAssertEqual(expectResumeRequestCount, totalResumedRequestCount, @"total number resumed request is not equal to expected number of request");
    
    //check if uploaded object exists
    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;
    
    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);
        
        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName1] || [s3Object.key isEqualToString:keyName2]) {
                if ( [s3Object.size unsignedIntegerValue] == fileSize) {
                    match = YES;
                } else {
                    XCTFail(@"file size is different on the server. expected:%lu, but got: %lu",(unsigned long)fileSize,(unsigned long)[s3Object.size unsignedIntegerValue]);
                }
            }
        }
        
        XCTAssertTrue(match, @"Didn't find the uploaded object in the bucket!");
        
        
        return nil;
    }] waitUntilFinished];
    
    //Delete uploaded Object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName1;
    
    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
        return nil;
    }] waitUntilFinished];
    
    AWSS3DeleteObjectRequest *deleteObjectRequest2 = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest2.bucket = testBucketNameGeneral;
    deleteObjectRequest2.key = keyName2;
    
    [[[s3 deleteObject:deleteObjectRequest2] continueWithBlock:^id(BFTask *task) {
        return nil;
    }] waitUntilFinished];

}

- (void)testCancelAllTasks {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);

    //Create multiple upload tasks
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);




    NSString *keyName1 = [NSString stringWithFormat:@"%@-large-%d",NSStringFromSelector(_cmd),1];
    AWSS3TransferManagerUploadRequest *uploadRequest1 = [AWSS3TransferManagerUploadRequest new];
    uploadRequest1.bucket = testBucketNameGeneral;
    uploadRequest1.key = keyName1;
    uploadRequest1.body = testDataURL;


    BFTask *uploadTask1 = [[transferManager upload:uploadRequest1] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCancelled, task.error.code);

        return nil;
    }];

    NSString *keyName2 = [NSString stringWithFormat:@"%@-large-%d",NSStringFromSelector(_cmd),2];
    AWSS3TransferManagerUploadRequest *uploadRequest2 = [AWSS3TransferManagerUploadRequest new];
    uploadRequest2.bucket = testBucketNameGeneral;
    uploadRequest2.key = keyName2;
    uploadRequest2.body = testDataURL;

   
    BFTask *uploadTask2 = [[transferManager upload:uploadRequest2] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCancelled, task.error.code);

        return nil;
    }];


    //Create Multiple downloadTask

    AWSS3TransferManagerDownloadRequest *downloadRequest1 = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest1.bucket = @"ios-v2-s3-tm-testdata";
    downloadRequest1.key = @"temp.txt";

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@-%d",NSStringFromSelector(_cmd),testBucketNameGeneral,1];
    downloadRequest1.downloadingFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:downloadFileName]];
    BFTask *downloadTask1 = [[transferManager download:downloadRequest1] continueWithBlock:^id(BFTask *task) {
        //Should return Cancelled Task Error
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCancelled, task.error.code);
        return nil;
    }];

    AWSS3TransferManagerDownloadRequest *downloadRequest2 = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest2.bucket = @"ios-v2-s3-tm-testdata";
    downloadRequest2.key = @"temp2.txt";


    NSString *downloadFileName2 = [NSString stringWithFormat:@"%@-downloaded-%@-%d",NSStringFromSelector(_cmd),testBucketNameGeneral,2];
    downloadRequest2.downloadingFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:downloadFileName2]];
    BFTask *downloadTask2 = [[transferManager download:downloadRequest2] continueWithBlock:^id(BFTask *task) {
        //Should return Cancelled Task Error
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCancelled, task.error.code);
        return nil;
    }];


    //Wait a few second and then cancel all tasks
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
    [transferManager cancelAll];

    //make sure all uploading task callback has been called.
    [uploadTask1 waitUntilFinished];
    [uploadTask2 waitUntilFinished];

    [downloadTask1 waitUntilFinished];
    [downloadTask2 waitUntilFinished];
}

- (void)testCancelDownloadTask {
    NSCondition *condition = [NSCondition new];

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);

    //Upload a large file to the bucket
    NSString *keyName =[NSString stringWithFormat:@"%@-large",NSStringFromSelector(_cmd)];
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);



    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;


    [[[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //Check if uploaded file is on S3
    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName] && [s3Object.key isEqualToString:keyName]) {
                match = YES;
            }
        }

        XCTAssertTrue(match, @"Didn't find the uploaded object in the bucket!");

        return nil;
    }] waitUntilFinished];

    //Download the same file from the bucket
    AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest.bucket = testBucketNameGeneral;
    downloadRequest.key = keyName;

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:downloadFileName]];

    [[transferManager download:downloadRequest] continueWithBlock:^id(BFTask *task) {
        //Should return Cancelled Task Error
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCancelled, task.error.code);

        [condition signal];
        return nil;

    }];

    //Wait a few second and then cancel the task
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
    [condition lock];
    [downloadRequest cancel];
    [condition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:180]];
    [condition unlock];

    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}
- (void)testCancelUploadTask {
    NSCondition *condition = [NSCondition new];

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);



    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;

 
    [[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCancelled, task.error.code);

        [condition signal];
        return nil;
    }];

    //cancel the task
    [uploadRequest cancel];

    [condition lock];
    [condition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:180]];
    [condition unlock];

    if (true) {
        //Upload a large file to the bucket
        NSString *keyNameSecond =[NSString stringWithFormat:@"%@-large",NSStringFromSelector(_cmd)];
        
        NSError *error = nil;
        XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
        NSString *fileName = [NSString stringWithFormat:@"%@-%@-large",NSStringFromSelector(_cmd),testBucketNameGeneral];
        NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
        [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
        XCTAssertNil(error, @"The request failed. error: [%@]", error);



        AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
        uploadRequest.bucket = testBucketNameGeneral;
        uploadRequest.key = keyNameSecond;
        uploadRequest.body = testDataURL;
      

        BFTask *uploadRequestLarge = [[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
            XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
            XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
            XCTAssertEqual(AWSS3TransferManagerErrorCancelled, task.error.code);

           
            return nil;
        }];

        //wait a few moment and cancel the task
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
        [uploadRequest cancel];
        [uploadRequestLarge waitUntilFinished];
      

        XCTAssertNotNil([uploadRequest valueForKey:@"uploadId"], @"S3TransferManagerUploadRequest should now have a uploadID returned from server");

        //wait a few moment and check if there are some pending parts that haven't been cleared.
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];

        AWSS3ListPartsRequest *listPartsReq = [AWSS3ListPartsRequest new];
        listPartsReq.bucket = testBucketNameGeneral;
        listPartsReq.key = keyNameSecond;
        listPartsReq.uploadId = [uploadRequest valueForKey:@"uploadId"];
        [[[s3 listParts:listPartsReq] continueWithBlock:^id(BFTask *task) {
            XCTAssertTrue(task.error, @"Expected 'NoSuchUpload' error, but got nil");
            XCTAssertEqual(AWSS3ErrorNoSuchUpload, task.error.code);

            AWSS3ListPartsOutput *listPartsOutput = task.result;
            if ([listPartsOutput.parts count] != 0) {
                XCTFail(@"Should be empty but got pending parts:%@",[listPartsOutput.parts description]);
            }
            return nil;
        }] waitUntilFinished];
    }
}

- (void)testTMDownloadSmallSizeWithProgressFeedback {

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempSmallURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];
    

    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;
   
 
    
    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        
        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };
    
    [[[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //Download the same file from the bucket
    AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest.bucket = testBucketNameGeneral;
    downloadRequest.key = keyName;

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:downloadFileName]];

    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    downloadRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"keyName:%@ bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld",NSStringFromSelector(_cmd), bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };
    
    [[[transferManager download:downloadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");

        return nil;

    }] waitUntilFinished];
    
    XCTAssertEqual(totalDownloadedBytes, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to totalDownloadedBytes");
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);

    
    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

- (void)testTMDownloadLargeSizeWithProgressFeedback {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempLargeURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];

    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;
   
   
    [[[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //Download the same file from the bucket
    AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest.bucket = testBucketNameGeneral;
    downloadRequest.key = keyName;

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:downloadFileName]];

    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    downloadRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"keyName:%@ bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld",NSStringFromSelector(_cmd), bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };
    
    [[[transferManager download:downloadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");


        return nil;

    }] waitUntilFinished];

    XCTAssertEqual(totalDownloadedBytes, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to totalDownloadedBytes");
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);

    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

- (void)testTMDownloadPauseAndResumeWithProgressFeedback {

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempLargeURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];


    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;

    
    [[[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //Download the same file from the bucket
    AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest.bucket = testBucketNameGeneral;
    downloadRequest.key = keyName;

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:downloadFileName]];

    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    downloadRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"keyName:%@ bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld",NSStringFromSelector(_cmd), bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };
    
    BFTask *pausedTaskOne = [[transferManager download:downloadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertNil(task.result, @"task result should be nil since it has already been cancelled");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    //wait a few seconds and then pause it.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [[[downloadRequest pause] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }] waitUntilFinished];

    AZLogDebug(@"(S3 Transfer Manager) Download Task has been paused.");
    [pausedTaskOne waitUntilFinished]; //make sure callback has been called.

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //resume it
    BFTask *pausedTaskTwo = [[transferManager download:downloadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertNil(task.result, @"task result should be nil since it has already been cancelled");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    //wait and pause again
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [[[downloadRequest pause] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }] waitUntilFinished];

    [pausedTaskTwo waitUntilFinished]; //make sure callback has been called.

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    //resume the task
    [[[transferManager download:downloadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");

        return nil;
    }] waitUntilFinished];
    AZLogDebug(@"(S3 Transfer Manager) Download Task has been resumed.");

    XCTAssertEqual(fileSize, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to total file size");
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);

    //Cleaning Up
    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

- (void)testTMDownloadPauseAndResumeWithFailedTask {

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
 

    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;
   
 
    [[[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //Download the same file from the bucket
    AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest.bucket = testBucketNameGeneral;
    downloadRequest.key = keyName;

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:downloadFileName]];

    BFTask *pausedTaskOne = [[transferManager download:downloadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertNil(task.result, @"task result should be nil since it has already been cancelled");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    //wait a few seconds and then pause it.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [[[downloadRequest pause] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }] waitUntilFinished];

    AZLogDebug(@"(S3 Transfer Manager) Download Task has been paused.");
    [pausedTaskOne waitUntilFinished]; //make sure callback has been called.

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //resume it
    BFTask *pausedTaskTwo = [[transferManager download:downloadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
 
        return nil;
    }];

    //finish this task
    [pausedTaskTwo waitUntilFinished];

    //try to pause finished task
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [[[downloadRequest pause] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'AWSS3TransferManagerErrorCompleted' Error, but got nil");
        XCTAssertEqualObjects(@"com.amazonaws.AWSS3TransferManagerErrorDomain", task.error.domain, @"expected AWSS3TransferManagerErrorDomian error, but got:%@",task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCompleted, task.error.code, @"expected got  'AWSS3TransferManagerErrorCompleted' error code, but got:%ld",(long)task.error.code);
        return nil;
    }] waitUntilFinished];


    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    //try to resume the finished task
    [[[transferManager download:downloadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'AWSS3TransferManagerErrorCompleted' Error, but got nil");
        XCTAssertEqualObjects(@"com.amazonaws.AWSS3TransferManagerErrorDomain", task.error.domain, @"expected AWSS3TransferManagerErrorDomian error, but got:%@",task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCompleted, task.error.code, @"expected got  'AWSS3TransferManagerErrorCompleted' error code, but got:%ld",(long)task.error.code);
        return nil;
    }] waitUntilFinished];
    AZLogDebug(@"(S3 Transfer Manager) Download Task has been resumed.");




    //Cleaning Up
    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

- (void)testTMUploadPauseAndResumeSmallSizeWithProgressFeedback {

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);
    
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempSmallURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];

    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;
 
   
    
    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        
        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };

    
    BFTask *uploadTaskSmall = [[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    //wait a few moment and pause the task
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.3]];
    [[[uploadRequest pause] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }] waitUntilFinished];

    [uploadTaskSmall waitUntilFinished];

    //resume the upload
    [[[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    //XCTAssertEqual(fileSize, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ( [s3Object.size unsignedIntegerValue] == fileSize) {
                    match = YES;
                } else {
                    XCTFail(@"file size is different on the server. expected:%lu, but got: %lu",(unsigned long)fileSize,(unsigned long)[s3Object.size unsignedIntegerValue]);
                }
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
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

- (void)testTMUploadPauseAndResumeLargeSizeWithProgressFeedback {

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempLargeURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];

    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;
  
 
    
    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        
        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };
    
    BFTask *uploadTaskSmall = [[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    //wait a few moment and pause the task
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [[[uploadRequest pause] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }] waitUntilFinished];

    [uploadTaskSmall waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];

    //resume the upload
    BFTask *taskTwo = [[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    // pause the task again
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [[[uploadRequest pause] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }] waitUntilFinished];

    [taskTwo waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];

    //resume the upload
    [[[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(fileSize, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    
    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ( [s3Object.size unsignedIntegerValue] == fileSize) {
                    match = YES;
                } else {
                    XCTFail(@"file size is different on the server. expected:%lu, but got: %lu",(unsigned long)fileSize,(unsigned long)[s3Object.size unsignedIntegerValue]);
                }
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
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}


- (void)testTMUploadLargeSizeWithProgressFeedback {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);

    NSString *keyName = NSStringFromSelector(_cmd);
    
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempLargeURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];


    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;
 
    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        
        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };
    
    [[[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName] ) {
                if ( [s3Object.size unsignedIntegerValue] == fileSize) {
                    match = YES;
                } else {
                    XCTFail(@"file size is different on the server. expected:%lu, but got: %lu",(unsigned long)fileSize,(unsigned long)[s3Object.size unsignedIntegerValue]);
                }
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
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
}

- (void)testTMUploadSmallSizeWithProgressFeedback {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);

    NSString *keyName = NSStringFromSelector(_cmd);
    
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempSmallURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];


    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;
 
  

    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        
        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };
    
    [[[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
    
    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);


    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ( [s3Object.size unsignedIntegerValue] == fileSize) {
                    match = YES;
                } else {
                    XCTFail(@"file size is different on the server. expected:%lu, but got: %lu",(unsigned long)fileSize,(unsigned long)[s3Object.size unsignedIntegerValue]);
                }
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
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
}

+ (BOOL)createBucketWithName:(NSString *)bucketName {
    AWSS3 *s3 = [AWSS3 defaultS3];

    AWSS3CreateBucketRequest *createBucketReq = [AWSS3CreateBucketRequest new];
    createBucketReq.bucket = bucketName;

    __block BOOL success = NO;
    [[[s3 createBucket:createBucketReq] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            success = NO;
        } else {
            success = YES;
        }
        return nil;
    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

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

@end

#endif
