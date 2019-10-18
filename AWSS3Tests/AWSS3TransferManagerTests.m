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
#import "AWSS3TestHelper.h"

@interface AWSS3TransferManagerTests : XCTestCase

@end

@implementation AWSS3TransferManagerTests

static NSString *testBucketNameGeneral = nil;
static NSString *const AWSS3TestBucketNamePrefix = @"s3-integ-transfermanager-test-";
static NSURL *tempLargeURL = nil;
static NSURL *tempSmallURL = nil;

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];

    //Create bucketName
    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    testBucketNameGeneral = [NSString stringWithFormat:@"%@%lld", AWSS3TestBucketNamePrefix, (int64_t)timeIntervalSinceReferenceDate];
    AWSRegionType regionType = AWSRegionUSEast1;
    #if AWS_TEST_BJS_INSTEAD
    regionType = AWSRegionCNNorth1;
    #endif
    [AWSS3TestHelper createBucketWithName:testBucketNameGeneral andRegion:regionType];

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
        multiplier = 15;
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

+ (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    // make sure bucket is empty before attempting to delete
    [AWSS3TestHelper deleteAllObjectsFromBucket:testBucketNameGeneral];

    //Delete Bucket
    [AWSS3TestHelper deleteBucketWithName:testBucketNameGeneral];

    //Delete Temp files
    if (tempLargeURL) {
        [[NSFileManager defaultManager] removeItemAtURL:tempLargeURL error:nil];
    }
    if (tempSmallURL) {
        [[NSFileManager defaultManager] removeItemAtURL:tempSmallURL error:nil];
    }
}

- (void)testDownloadWithSpecialEncodedCharacters {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);
    
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);
    
    //Use a key name which has a special character and also its encoded value used as individual characters
    // E.g. '(single quote) is encoded as %27. We create a key name which contains both ' and %27
    NSString *keyName = @"File'Name%27Test+ok+test.txt";
    
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempSmallURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];
    XCTAssertTrue(fileSize > 0);
    
    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;
    
    
    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
    
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    
    //Do a list objects call and verify if the upload file has the same file name as expected
    AWSS3ListObjectsRequest *listObjectsRequest = [AWSS3ListObjectsRequest new];
    listObjectsRequest.bucket = testBucketNameGeneral;
    
    [[[s3 listObjects:listObjectsRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        AWSS3ListObjectsOutput *output = task.result;
        __block bool filePresent = NO;
        for (AWSS3Object *object in output.contents) {
            if ([object.key isEqualToString:keyName]) {
                // mark file as present if found in list objects call
                filePresent = YES;
            }
        }
        XCTAssertTrue(filePresent, @"The expected file name was not found in list objects call.");
        return nil;
    }] waitUntilFinished];
    
    //Download the same file from the bucket
    AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest.bucket = testBucketNameGeneral;
    downloadRequest.key = keyName;
    
    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    
    NSURL *downloadedLocationURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];
    downloadRequest.downloadingFileURL = [downloadedLocationURL copy];
    
    __block NSString *eTag = nil;
    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));
        
        XCTAssertNotNil(output.ETag);
        eTag = output.ETag;
        //compare file address
        XCTAssertEqualObjects(downloadedLocationURL, receivedBodyURL);
        return nil;
        
    }] waitUntilFinished];
    
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:[downloadedLocationURL path]]);
    XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:downloadedLocationURL.path
                                                              andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]],
                  @"received and sent file are different");
    
    // Delete the uploaded object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;
    
    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
}

- (void)testDownloadWithIfModifiedSinceHeader {

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempSmallURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];
    XCTAssertTrue(fileSize > 0);

    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;


    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
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

    NSURL *downloadedLocationURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];
    downloadRequest.downloadingFileURL = [downloadedLocationURL copy];

    __block NSString *eTag = nil;
    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        XCTAssertNotNil(output.ETag);
        eTag = output.ETag;
        //compare file address
        XCTAssertEqualObjects(downloadedLocationURL, receivedBodyURL);
        return nil;

    }] waitUntilFinished];

    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:[downloadedLocationURL path]]);
    XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:downloadedLocationURL.path
                                                              andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]],
                  @"received and sent file are different1");

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:30]];

    //download again by using IfModifiedSince Header
    AWSS3TransferManagerDownloadRequest *downloadRequest2 = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest2.bucket = testBucketNameGeneral;
    downloadRequest2.key = keyName;
    downloadRequest2.downloadingFileURL = [downloadedLocationURL copy];
    downloadRequest2.ifModifiedSince = [NSDate date]; //should return 304 (not modified), with nil body

    [[[transferManager download:downloadRequest2] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        XCTAssertNotNil(output);
        XCTAssertNil(output.body); //body should be nil since 304(not modified) returned and the return body is nil.
        XCTAssertEqualObjects(eTag, output.ETag); //server should return an eTag
        return nil;

    }] waitUntilFinished];

    //previous downloaded file should still exist.
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:[downloadedLocationURL path]]);
    XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:downloadedLocationURL.path
                                                              andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]],
                  @"received and sent file are different1");


    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}
- (void)testDownloadSameFileMultipleTimesWithProvidedDownloadingFileURL {

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);


    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //Download the same file from the bucket
    NSMutableArray *tasks = [NSMutableArray new];

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *downloadURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    //Create Multiple downloadTask
    for (int i=0; i<5; i++) {
        AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
        downloadRequest.bucket = testBucketNameGeneral;
        downloadRequest.key = keyName;
        downloadRequest.downloadingFileURL = downloadURL;

        [tasks addObject:[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
            XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
            AWSS3TransferManagerDownloadOutput *output = task.result;
            NSURL *receivedBodyURL = output.body;
            XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

            //Compare URL should be the same as the one provided;
            XCTAssertEqualObjects(downloadRequest.downloadingFileURL, receivedBodyURL);
            //Compare file content
            XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
            XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);

            return nil;

        }]];

    }

    [[[AWSTask taskForCompletionOfAllTasks:tasks] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            return [AWSTask taskWithError:task.error];
        }
        return nil;
    }] waitUntilFinished];

    //Remove File
    [[NSFileManager defaultManager] removeItemAtURL:downloadURL error:nil];
    //remove symbolic link
    [[NSFileManager defaultManager] removeItemAtURL:testDataURL error:nil];

    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

- (void)testDownloadSameFileMultipleTimesWithoutProvidedDownloadingFileURL {

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);

    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);


    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = tempSmallURL;

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //Download the same file from the bucket
    NSMutableArray *tasks = [NSMutableArray new];
    __block NSURL *downloadURL = nil;
    //Create Multiple downloadTask
    for (int i=0; i<5; i++) {
        AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
        downloadRequest.bucket = testBucketNameGeneral;
        downloadRequest.key = keyName;

        [tasks addObject:[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
            XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
            AWSS3TransferManagerDownloadOutput *output = task.result;
            NSURL *receivedBodyURL = output.body;
            XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

            //Compare file content
            XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:tempSmallURL.path], @"received and sent file are different1");
            XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:tempSmallURL.path error:nil] fileSize]);

            downloadURL = receivedBodyURL;
            return nil;

        }]];

    }

    [[[AWSTask taskForCompletionOfAllTasks:tasks] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            return [AWSTask taskWithError:task.error];
        }
        return nil;
    }] waitUntilFinished];

    //Remove File
    [[NSFileManager defaultManager] removeItemAtURL:downloadURL error:nil];
    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"downloadingFileURL"]) {
        XCTFail(@"downloadingFileURL has been changed by S3 TransferManager!");
        NSLog(@"old value:%@",change[@"old"]);
        NSLog(@"new value:%@",change[@"new"]);
    }
}

- (void)testTMCheckDownloadFileURLManipluating{

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);


    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
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
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    //KVO - AddObserver
    [downloadRequest addObserver:self forKeyPath:@"downloadingFileURL" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];

    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
        XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);

        //KVO - RemoveObserver
        [downloadRequest removeObserver:self forKeyPath:@"downloadingFileURL"];

        return nil;

    }] waitUntilFinished];


    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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


    AWSTask *uploadTask1 = [[transferManager upload:uploadRequest1] continueWithBlock:^id(AWSTask *task) {
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


    AWSTask *uploadTask2 = [[transferManager upload:uploadRequest2] continueWithBlock:^id(AWSTask *task) {
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
    downloadRequest1.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];
    AWSTask *downloadTask1 = [[transferManager download:downloadRequest1] continueWithBlock:^id(AWSTask *task) {
        //Should return Cancelled Task Error
        XCTAssertNotNil(task.error, @"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    AWSS3TransferManagerDownloadRequest *downloadRequest2 = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest2.bucket = @"ios-v2-s3-tm-testdata";
    downloadRequest2.key = @"temp2.txt";


    NSString *downloadFileName2 = [NSString stringWithFormat:@"%@-downloaded-%@-%d",NSStringFromSelector(_cmd),testBucketNameGeneral,2];
    downloadRequest2.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName2]];
    AWSTask *downloadTask2 = [[transferManager download:downloadRequest2] continueWithBlock:^id(AWSTask *task) {
        //Should return Cancelled Task Error
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];


    //Wait a few second and then pause all tasks
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    [[transferManager pauseAll] continueWithBlock:^id(AWSTask *task) {
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


    }] continueWithBlock:^id(AWSTask *task) {
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

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName1] || [s3Object.key isEqualToString:keyName2]) {
                if ([s3Object.size unsignedIntegerValue] == fileSize) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        return nil;
    }] waitUntilFinished];

    AWSS3DeleteObjectRequest *deleteObjectRequest2 = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest2.bucket = testBucketNameGeneral;
    deleteObjectRequest2.key = keyName2;

    [[[s3 deleteObject:deleteObjectRequest2] continueWithBlock:^id(AWSTask *task) {
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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);



    NSString *keyName1 = [NSString stringWithFormat:@"%@-large-%d",NSStringFromSelector(_cmd),1];
    AWSS3TransferManagerUploadRequest *uploadRequest1 = [AWSS3TransferManagerUploadRequest new];
    uploadRequest1.bucket = testBucketNameGeneral;
    uploadRequest1.key = keyName1;
    uploadRequest1.body = testDataURL;


    AWSTask *uploadTask1 = [[transferManager upload:uploadRequest1] continueWithBlock:^id(AWSTask *task) {
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


    AWSTask *uploadTask2 = [[transferManager upload:uploadRequest2] continueWithBlock:^id(AWSTask *task) {
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
    downloadRequest1.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];
    AWSTask *downloadTask1 = [[transferManager download:downloadRequest1] continueWithBlock:^id(AWSTask *task) {
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
    downloadRequest2.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName2]];
    AWSTask *downloadTask2 = [[transferManager download:downloadRequest2] continueWithBlock:^id(AWSTask *task) {
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

    XCTAssertTrue(downloadRequest1.isCancelled);
    XCTAssertTrue(downloadRequest2.isCancelled);

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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);



    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;

    AWSTask *task = [transferManager upload:uploadRequest];
    [task continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    [task waitUntilFinished];

    //Check if uploaded file is on S3
    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
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
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    XCTAssertEqual(downloadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    [[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        //Should return Cancelled Task Error
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCancelled, task.error.code);

        [condition signal];
        return nil;

    }];

    XCTAssertEqual(downloadRequest.state, AWSS3TransferManagerRequestStateRunning);

    //Wait a few second and then cancel the task
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
    [condition lock];
    [downloadRequest cancel];

    XCTAssertEqual(downloadRequest.state, AWSS3TransferManagerRequestStateCanceling);
    XCTAssertTrue(downloadRequest.isCancelled);

    [condition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:180]];
    [condition unlock];

    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);



    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    [[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCancelled, task.error.code);

        [condition signal];
        return nil;
    }];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateRunning);

    //cancel the task
    [uploadRequest cancel];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateCanceling);
    XCTAssertTrue(uploadRequest.isCancelled);

    [condition lock];
    [condition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:180]];
    [condition unlock];

    if (true) {
        //Upload a large file to the bucket
        NSString *keyNameSecond =[NSString stringWithFormat:@"%@-large",NSStringFromSelector(_cmd)];

        NSError *error = nil;
        XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
        NSString *fileName = [NSString stringWithFormat:@"%@-%@-large",NSStringFromSelector(_cmd),testBucketNameGeneral];
        NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
        [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
        XCTAssertNil(error, @"The request failed. error: [%@]", error);



        AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
        uploadRequest.bucket = testBucketNameGeneral;
        uploadRequest.key = keyNameSecond;
        uploadRequest.body = testDataURL;

        XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

        AWSTask *uploadRequestLarge = [[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
            XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
            XCTAssertEqual(AWSS3TransferManagerErrorCancelled, task.error.code);


            return nil;
        }];

        XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateRunning);

        //wait a few moment and cancel the task
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
        [uploadRequest cancel];

        XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateCanceling);

        [uploadRequestLarge waitUntilFinished];


        XCTAssertNotNil([uploadRequest valueForKey:@"uploadId"], @"S3TransferManagerUploadRequest should now have a uploadID returned from server");

        //wait a few moment and check if there are some pending parts that haven't been cleared.
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];

        AWSS3ListPartsRequest *listPartsReq = [AWSS3ListPartsRequest new];
        listPartsReq.bucket = testBucketNameGeneral;
        listPartsReq.key = keyNameSecond;
        listPartsReq.uploadId = [uploadRequest valueForKey:@"uploadId"];
        [[[s3 listParts:listPartsReq] continueWithBlock:^id(AWSTask *task) {
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

- (void)testTMDownloadWithoutDownloadingFileURL {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = [NSString stringWithFormat:@"%@/test.dat",NSStringFromSelector(_cmd)];;

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);


    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;


    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];


    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //Download the same file from the bucket multiple times
    for (int i=0; i<3; i++) {

        AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
        downloadRequest.bucket = testBucketNameGeneral;
        downloadRequest.key = keyName;


        [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
            XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
            AWSS3TransferManagerDownloadOutput *output = task.result;
            NSURL *receivedBodyURL = output.body;
            XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

            //Compare file content
            XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
            XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);

            return nil;

        }] waitUntilFinished];

    }

    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];


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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
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
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    //Create a situation that there is a file has already existed on that downloadingFileURL Path
    NSString *getObjectFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials" ofType:@"json"];
    [[NSFileManager defaultManager] copyItemAtPath:getObjectFilePath toPath:downloadRequest.downloadingFileURL.path error:nil];

    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    downloadRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"keyName:%@ bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld",NSStringFromSelector(_cmd), bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };

    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
        XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);

        return nil;

    }] waitUntilFinished];

    XCTAssertEqual(totalDownloadedBytes, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to totalDownloadedBytes");
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);


    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

- (void)testTMDownloadSmallSizeAwsKmsEncryption {

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    uploadRequest.serverSideEncryption = AWSS3ServerSideEncryptionAwsKms;

    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {

        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
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
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    //Create a situation that there is a file has already existed on that downloadingFileURL Path
    NSString *getObjectFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials" ofType:@"json"];
    [[NSFileManager defaultManager] copyItemAtPath:getObjectFilePath toPath:downloadRequest.downloadingFileURL.path error:nil];

    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    downloadRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"keyName:%@ bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld",NSStringFromSelector(_cmd), bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };

    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
        XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);

        return nil;

    }] waitUntilFinished];

    XCTAssertEqual(totalDownloadedBytes, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to totalDownloadedBytes");
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);


    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

- (void)testTMDownloadSmallSizeCustomEncryption {

    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    //Custom SSE
    NSString *base64Key = @"sBldqVP3dNJ9OLh4Fi0+HYAgIZsToOLQxiX3jM7TbHw=";
    NSData *nsdataFromBase64String = [[NSData alloc]
                                      initWithBase64EncodedString:base64Key options:kNilOptions];
    NSString *base64KeyMD5 = [NSString aws_base64md5FromData:nsdataFromBase64String];

    uploadRequest.SSECustomerAlgorithm = @"AES256";
    uploadRequest.SSECustomerKey = base64Key;
    uploadRequest.SSECustomerKeyMD5 = base64KeyMD5;

    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {

        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
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

    //Custom SSE
    downloadRequest.SSECustomerAlgorithm = @"AES256";
    downloadRequest.SSECustomerKey = base64Key;

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    //Create a situation that there is a file has already existed on that downloadingFileURL Path
    NSString *getObjectFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials" ofType:@"json"];
    [[NSFileManager defaultManager] copyItemAtPath:getObjectFilePath toPath:downloadRequest.downloadingFileURL.path error:nil];

    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    downloadRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"keyName:%@ bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld",NSStringFromSelector(_cmd), bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };

    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
        XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);

        return nil;

    }] waitUntilFinished];

    XCTAssertEqual(totalDownloadedBytes, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to totalDownloadedBytes");
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);


    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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


    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
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
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    downloadRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"keyName:%@ bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld",NSStringFromSelector(_cmd), bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };

    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
        XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);


        return nil;

    }] waitUntilFinished];

    XCTAssertEqual(totalDownloadedBytes, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to totalDownloadedBytes");
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);

    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

- (void)testTMDownloadLargeSizeWithAwsKmsEncryption {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    uploadRequest.serverSideEncryption = AWSS3ServerSideEncryptionAwsKms;


    AWSTask *task = [[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

    [task waitUntilFinished];

    //Download the same file from the bucket
    AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest.bucket = testBucketNameGeneral;
    downloadRequest.key = keyName;

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    downloadRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"keyName:%@ bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld",NSStringFromSelector(_cmd), bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };

    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
        XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);


        return nil;

    }] waitUntilFinished];

    XCTAssertEqual(totalDownloadedBytes, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to totalDownloadedBytes");
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);

    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
}

- (void)testTMDownloadLargeSizeWithCustomEncryption {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);
    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    //Custom SSE
    NSString *base64Key = @"sBldqVP3dNJ9OLh4Fi0+HYAgIZsToOLQxiX3jM7TbHw=";
    NSData *nsdataFromBase64String = [[NSData alloc]
                                      initWithBase64EncodedString:base64Key options:kNilOptions];
    NSString *base64KeyMD5 = [NSString aws_base64md5FromData:nsdataFromBase64String];

    uploadRequest.SSECustomerAlgorithm = @"AES256";
    uploadRequest.SSECustomerKey = base64Key;
    uploadRequest.SSECustomerKeyMD5 = base64KeyMD5;

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //Download the same file from the bucket
    AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest.bucket = testBucketNameGeneral;
    downloadRequest.key = keyName;

    //Custom SSE
    downloadRequest.SSECustomerAlgorithm = @"AES256";
    downloadRequest.SSECustomerKey = base64Key;

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    downloadRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"keyName:%@ bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld",NSStringFromSelector(_cmd), bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };

    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
        XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);


        return nil;

    }] waitUntilFinished];

    XCTAssertEqual(totalDownloadedBytes, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to totalDownloadedBytes");
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);

    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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


    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
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
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    __block int64_t accumulatedDownloadBytes = 0;
    __block int64_t totalDownloadedBytes = 0;
    __block int64_t totalExpectedDownloadBytes = 0;
    downloadRequest.downloadProgress = ^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        accumulatedDownloadBytes += bytesWritten;
        totalDownloadedBytes = totalBytesWritten;
        totalExpectedDownloadBytes = totalBytesExpectedToWrite;
        //NSLog(@"keyName:%@ bytesWritten: %lld, totalBytesWritten: %lld, totalBytesExpectedtoWrite: %lld",NSStringFromSelector(_cmd), bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    };

    XCTAssertEqual(downloadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    AWSTask *pausedTaskOne = [[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertNil(task.result, @"task result should be nil since it has already been cancelled");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    XCTAssertEqual(downloadRequest.state, AWSS3TransferManagerRequestStateRunning);

    //wait a few seconds and then pause it.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    [[[downloadRequest pause] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(downloadRequest.state, AWSS3TransferManagerRequestStatePaused);

    AWSDDLogDebug(@"(S3 Transfer Manager) Download Task has been paused.");
    AWSDDLogDebug(@"(S3 Transfer Manager) Download Task has been paused.");
    [pausedTaskOne waitUntilFinished]; //make sure callback has been called.

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //resume it
    AWSTask *pausedTaskTwo = [[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertNil(task.result, @"task result should be nil since it has already been cancelled");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    XCTAssertEqual(downloadRequest.state, AWSS3TransferManagerRequestStateRunning);

    //wait and pause again
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [[[downloadRequest pause] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(downloadRequest.state, AWSS3TransferManagerRequestStatePaused);

    [pausedTaskTwo waitUntilFinished]; //make sure callback has been called.

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    //resume the task
    AWSDDLogDebug(@"(S3 Transfer Manager) Download Task has been resumed.");
    AWSDDLogDebug(@"(S3 Transfer Manager) Download Task has been resumed.");
    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
        XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);

        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(downloadRequest.state, AWSS3TransferManagerRequestStateCompleted);

    AWSDDLogDebug(@"(S3 Transfer Manager) Download Task has been finished.");
    XCTAssertEqual(fileSize, accumulatedDownloadBytes, @"accumulatedDownloadBytes is not equal to total file size");
    XCTAssertEqual(fileSize, totalDownloadedBytes,@"total downloaded fileSize is not equal to uploaded fileSize");
    XCTAssertEqual(fileSize, totalExpectedDownloadBytes);

    //Cleaning Up
    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

}

- (void)testTMWithMissingParameters {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);


    //Upload a file to the bucket
    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempSmallURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);

    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = (id)[NSData data];  //invalid type of body, should be instance of NSURL class.

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'InvalidParameters' Error, but got nil");
        XCTAssertNil(task.result, @"task result should be nil since it returns errors");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorInvalidParameters, task.error.code);

        return nil;
    }] waitUntilFinished];


    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];

    //Download the same file from the bucket
    AWSS3TransferManagerDownloadRequest *downloadRequest = [AWSS3TransferManagerDownloadRequest new];
    downloadRequest.bucket = testBucketNameGeneral;
    //downloadRequest.key = keyName;

    NSString *downloadFileName = [NSString stringWithFormat:@"%@-downloaded-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];


    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'MIssingParameters' Error, but got nil");
        XCTAssertNil(task.result, @"task result should be nil since it returns errors");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorMissingRequiredParameters, task.error.code);
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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
    [[NSFileManager defaultManager] createSymbolicLinkAtURL:testDataURL withDestinationURL:tempLargeURL error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:tempLargeURL.path
                                                                                error:&error];
    XCTAssertNil(error, @"The request failed. error: [%@]", error);
    unsigned long long fileSize = [attributes fileSize];
    XCTAssertTrue(fileSize > 0);

    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = testBucketNameGeneral;
    uploadRequest.key = keyName;
    uploadRequest.body = testDataURL;


    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
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
    downloadRequest.downloadingFileURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:downloadFileName]];

    AWSTask *pausedTaskOne = [[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertNil(task.result, @"task result should be nil since it has already been cancelled");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    //wait a few seconds and then pause it.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    [[[downloadRequest pause] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }] waitUntilFinished];

    AWSDDLogDebug(@"(S3 Transfer Manager) Download Task has been paused.");
    [pausedTaskOne waitUntilFinished]; //make sure callback has been called.

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    //resume it
    AWSTask *pausedTaskTwo = [[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerDownloadOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3TransferManagerDownloadOutput class]),NSStringFromClass([task.result class]));
        AWSS3TransferManagerDownloadOutput *output = task.result;
        NSURL *receivedBodyURL = output.body;
        XCTAssertTrue([receivedBodyURL isKindOfClass:[NSURL class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([receivedBodyURL class]));

        //Compare file content
        XCTAssertTrue([[NSFileManager defaultManager] contentsEqualAtPath:receivedBodyURL.path andPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil]], @"received and sent file are different1");
        XCTAssertEqual([[[NSFileManager defaultManager] attributesOfItemAtPath:receivedBodyURL.path error:nil] fileSize], [[[NSFileManager defaultManager] attributesOfItemAtPath:[[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:testDataURL.path error:nil] error:nil] fileSize]);

        return nil;
    }];

    //finish this task
    [pausedTaskTwo waitUntilFinished];

    //try to pause finished task
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [[[downloadRequest pause] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'AWSS3TransferManagerErrorCompleted' Error, but got nil");
        XCTAssertEqualObjects(@"com.amazonaws.AWSS3TransferManagerErrorDomain", task.error.domain, @"expected AWSS3TransferManagerErrorDomain error, but got:%@",task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCompleted, task.error.code, @"expected got  'AWSS3TransferManagerErrorCompleted' error code, but got:%ld",(long)task.error.code);
        return nil;
    }] waitUntilFinished];


    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    //try to resume the finished task
    [[[transferManager download:downloadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'AWSS3TransferManagerErrorCompleted' Error, but got nil");
        XCTAssertEqualObjects(@"com.amazonaws.AWSS3TransferManagerErrorDomain", task.error.domain, @"expected AWSS3TransferManagerErrorDomain error, but got:%@",task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorCompleted, task.error.code, @"expected got  'AWSS3TransferManagerErrorCompleted' error code, but got:%ld",(long)task.error.code);
        return nil;
    }] waitUntilFinished];
    AWSDDLogDebug(@"(S3 Transfer Manager) Download Task has been resumed.");

    //Cleaning Up
    //Delete the object
    AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
    deleteObjectRequest.bucket = testBucketNameGeneral;
    deleteObjectRequest.key = keyName;

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    AWSTask *uploadTaskSmall = [[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        return nil;
    }];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateRunning);

    //wait a few moment and pause the task
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.3]];
    [[[uploadRequest pause] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStatePaused);

    [uploadTaskSmall waitUntilFinished];

    //resume the upload
    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];


    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateCompleted);

    //XCTAssertEqual(fileSize, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ([s3Object.size unsignedIntegerValue] == fileSize) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    [[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error,@"Expect got 'Cancelled' Error, but got nil");
        XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
        XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
        if ([task.error.domain isEqualToString:AWSS3TransferManagerErrorDomain] == NO || task.error.code != AWSS3TransferManagerErrorPaused) {
            AWSDDLogError(@"unexpected error:%@",task.error);
        }
        return nil;
    }];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateRunning);

    //random pause and resume task until it finished
    AWSTask *currentTask = nil;
    __block BOOL isFinished = NO;
    for (int32_t i=0; i<10; i++) {
        if (isFinished) break;
        int randNum = rand() % (8 - 3) + 3; //create the random number between 3 to 8.
        //wait a random moment and pause the task
        AWSDDLogDebug(@"-------- Pause the Task in %d seconds--------",randNum);
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:randNum]];
        AWSDDLogDebug(@"-------- Pausing the Task --------");
        if (isFinished) break;
        [[[uploadRequest pause] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error); //should not return error if successfully paused.
            return nil;
        }] waitUntilFinished];

        XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStatePaused);

        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
        AWSDDLogDebug(@"-------- Resume the Task --------");
        //resume the upload
        if (isFinished) break;
        currentTask = [[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
            if (task.error) {
                //if contains error, should be PauseError
                XCTAssertEqualObjects(AWSS3TransferManagerErrorDomain, task.error.domain);
                XCTAssertEqual(AWSS3TransferManagerErrorPaused, task.error.code);
                if ([task.error.domain isEqualToString:AWSS3TransferManagerErrorDomain] == NO || task.error.code != AWSS3TransferManagerErrorPaused) {
                    AWSDDLogError(@"unexpected error:%@",task.error);
                    isFinished = YES;
                }
            } else {
                isFinished = YES;
                XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
            }

            return nil;
        }];

        XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateRunning);
    }

    [currentTask waitUntilFinished];
    XCTAssertTrue(isFinished);

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateCompleted);

    //XCTAssertEqual(fileSize, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ([s3Object.size unsignedIntegerValue] == fileSize) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateCompleted);

    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    //XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ([s3Object.size unsignedIntegerValue] == fileSize) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
}

- (void)testTMUploadLargeSizeAwsKmsEncryption {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);

    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    uploadRequest.serverSideEncryption = AWSS3ServerSideEncryptionAwsKms;

    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {

        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateCompleted);

    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    //XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ([s3Object.size unsignedIntegerValue] == fileSize) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
}

- (void)testTMUploadLargeSizeWithCustomEncryption {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);

    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempLargeURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    //Custom SSE
    NSString *base64Key = @"sBldqVP3dNJ9OLh4Fi0+HYAgIZsToOLQxiX3jM7TbHw=";
    NSData *nsdataFromBase64String = [[NSData alloc]
                                      initWithBase64EncodedString:base64Key options:kNilOptions];
    NSString *base64KeyMD5 = [NSString aws_base64md5FromData:nsdataFromBase64String];

    uploadRequest.SSECustomerAlgorithm = @"AES256";
    uploadRequest.SSECustomerKey = base64Key;
    uploadRequest.SSECustomerKeyMD5 = base64KeyMD5;

    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {

        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateCompleted);

    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    //XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ([s3Object.size unsignedIntegerValue] == fileSize) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
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
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateCompleted);

    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);


    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ([s3Object.size unsignedIntegerValue] == fileSize) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
}

- (void)testTMUploadSmallSizeWIthKmsEncryption {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);

    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    uploadRequest.serverSideEncryption = AWSS3ServerSideEncryptionAwsKms;



    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {

        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateCompleted);

    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);


    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ([s3Object.size unsignedIntegerValue] == fileSize) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
}

- (void)testTMUploadSmallSizeWithCustomEncryption {
    AWSS3 *s3 = [AWSS3 defaultS3];
    XCTAssertNotNil(s3);

    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    XCTAssertNotNil(transferManager);

    NSString *keyName = NSStringFromSelector(_cmd);

    NSError *error = nil;
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:tempSmallURL.path]);
    NSString *fileName = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(_cmd),testBucketNameGeneral];
    NSURL *testDataURL = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName]];
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

    //Custom SSE
    NSString *base64Key = @"sBldqVP3dNJ9OLh4Fi0+HYAgIZsToOLQxiX3jM7TbHw=";
    NSData *nsdataFromBase64String = [[NSData alloc]
                                      initWithBase64EncodedString:base64Key options:kNilOptions];
    NSString *base64KeyMD5 = [NSString aws_base64md5FromData:nsdataFromBase64String];

    uploadRequest.SSECustomerAlgorithm = @"AES256";
    uploadRequest.SSECustomerKey = base64Key;
    uploadRequest.SSECustomerKeyMD5 = base64KeyMD5;


    __block int64_t accumulatedUploadBytes = 0;
    __block int64_t totalUploadedBytes = 0;
    __block int64_t totalExpectedUploadBytes = 0;
    uploadRequest.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {

        //NSLog(@"keyName:%@ bytesSent: %lld, totalBytesSent: %lld, totalBytesExpectedToSend: %lld",keyName,bytesSent,totalBytesSent,totalBytesExpectedToSend);
        accumulatedUploadBytes += bytesSent;
        totalUploadedBytes = totalBytesSent;
        totalExpectedUploadBytes = totalBytesExpectedToSend;
    };

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateNotStarted);

    [[[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3TransferManagerUploadOutput class]], @"The response object is not a class of [%@], got: %@", NSStringFromClass([NSURL class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];

    XCTAssertEqual(uploadRequest.state, AWSS3TransferManagerRequestStateCompleted);

    XCTAssertEqual(totalUploadedBytes, accumulatedUploadBytes, @"total of accumulatedUploadBytes is not equal to totalUploadedBytes");
    XCTAssertEqual(fileSize, totalUploadedBytes, @"totalUploaded Bytes is not equal to fileSize");
    XCTAssertEqual(fileSize, totalExpectedUploadBytes);


    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
    listObjectReq.bucket = testBucketNameGeneral;

    [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
        AWSS3ListObjectsOutput *listObjectsOutput = task.result;
        XCTAssertEqualObjects(listObjectsOutput.name, testBucketNameGeneral);

        BOOL match = NO;
        for (AWSS3Object *s3Object in listObjectsOutput.contents) {
            if ([s3Object.key isEqualToString:keyName]) {
                if ([s3Object.size unsignedIntegerValue] == fileSize) {
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

    [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),NSStringFromClass([task.result class]));
        return nil;
    }] waitUntilFinished];
}

- (void)testArchiver {
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"uploadRequest"];

    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = @"test-bucket";
    uploadRequest.key = @"test-key";
    uploadRequest.body = [NSURL fileURLWithPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"test-body"]];

    XCTAssertTrue([uploadRequest respondsToSelector:@selector(encodeWithCoder:)]);

    XCTAssertTrue([NSKeyedArchiver archiveRootObject:uploadRequest
                                              toFile:filePath]);
    AWSS3TransferManagerUploadRequest *unarchivedObject = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    XCTAssertEqualObjects(unarchivedObject.bucket, uploadRequest.bucket);
    XCTAssertEqualObjects(unarchivedObject.key, uploadRequest.key);
    XCTAssertEqualObjects(unarchivedObject.body, uploadRequest.body);
}

@end
