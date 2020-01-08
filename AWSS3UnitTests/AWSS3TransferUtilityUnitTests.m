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

#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "AWSTestUtility.h"
#import "AWSS3Service.h"
#import "AWSS3TransferUtility.h"
#import "AWSS3PreSignedUrl.h"

static id mockNetworking = nil;
static id awss3client = nil;
static id awss3PresignedUrlBuilder = nil;
static id urlSession = nil;
@class MockUploadTask;

@interface MockUploadTask: NSObject

@property (readonly) NSUInteger taskIdentifier;

@end

@implementation MockUploadTask

- (NSUInteger)getTaskIdentifier {
    return 1;
}

- (void)resume {
}

- (void)cancel {
}

@end

@interface AWSS3TransferUtilityUnitTests : XCTestCase

@end

@implementation AWSS3TransferUtilityUnitTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupFakeCognitoCredentialsProvider];
    
    awss3client = OCMClassMock([AWSS3 class]);
    mockNetworking = OCMClassMock([AWSNetworking class]);
    awss3PresignedUrlBuilder = OCMClassMock([AWSS3PreSignedURLBuilder class]);
    urlSession = OCMClassMock([NSURLSession class]);
    AWSTask *errorTask = [AWSTask taskWithError:[NSError errorWithDomain:@"OCMockExpectedNetworkingError" code:8848 userInfo:nil]];
    OCMStub([mockNetworking sendRequest:[OCMArg isKindOfClass:[AWSNetworkingRequest class]]]).andReturn(errorTask);
}

- (void)testInitializingForLocalTesting {
    NSString *key = @"testLocalTesting";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionAPEast1
                                                                                 serviceType:AWSServiceS3
                                                                         credentialsProvider:nil
                                                                         localTestingEnabled:YES];
    [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration
                                        transferUtilityConfiguration:[AWSS3TransferUtilityConfiguration new]
                                                              forKey:key];
    AWSS3TransferUtility *transferUtility = [AWSS3TransferUtility S3TransferUtilityForKey:key];
    configuration = transferUtility.configuration;
    XCTAssertNotNil(configuration, @"Transfer utility configuration should not be nil");
    XCTAssertEqualObjects(configuration.endpoint.URL, [NSURL URLWithString:@"http://localhost:20005/"], @"Local host url should be set");
    XCTAssertEqualObjects(configuration.endpoint.portNumber, [NSNumber numberWithInt:20005], @"Local host port should be set");
    XCTAssertEqual(configuration.endpoint.regionType, AWSRegionAPEast1, @"Endpoint region should AWSRegionAPEast1");
}

/// Test if upload data is sucessful
///
/// - Given: Transferutility configured with mock dependencies
/// - When:
///    - I try to call uploadData:
/// - Then:
///    - I should get a non nil value for result and nil value for error
///
- (void)testDataUpload {
    NSString *key = @"testDataUpload";
    NSData *uploadData = [@"1234343454" dataUsingEncoding:NSUTF8StringEncoding];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration forKey:key];
    AWSS3TransferUtility *transferUtility = [AWSS3TransferUtility S3TransferUtilityForKey:key];

    [awss3client setValue:mockNetworking forKey:@"networking"];
    [transferUtility setValue:awss3client forKey:@"s3"];
    [transferUtility setValue:awss3PresignedUrlBuilder forKey:@"preSignedURLBuilder"];
    [transferUtility setValue:urlSession forKey:@"session"];

    NSURL *preSignedURL = [NSURL URLWithString:@"http://asd.com/"];
    AWSTask *getPreSignedURLResultTask = [AWSTask taskWithResult:preSignedURL];
    OCMStub([awss3PresignedUrlBuilder getPreSignedURL:[OCMArg isKindOfClass:[AWSS3GetPreSignedURLRequest class]]]).andReturn(getPreSignedURLResultTask);

    MockUploadTask *uploadTask = [[MockUploadTask alloc] init];
    OCMStub([urlSession uploadTaskWithRequest:[OCMArg isKindOfClass:[NSURLRequest class]]
                                     fromFile:[OCMArg isKindOfClass:[NSURL class]]]).andReturn(uploadTask);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    [[[transferUtility uploadData:uploadData
                           bucket:@"unittestBucket"
                              key:@"unittestKey.txt"
                      contentType:@"text/plain"
                       expression:[AWSS3TransferUtilityUploadExpression new]
                completionHandler:nil] continueWithBlock:^id (AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertNotNil(task.result);
        dispatch_semaphore_signal(semaphore);
        return nil;
    }] waitUntilFinished];

    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    [AWSS3TransferUtility removeS3TransferUtilityForKey:key];
}

/// Test if upload data gives error on NSURLException
///
/// - Given: Transferutility configured with mock dependencies. And NSURLSession is uploadTask
/// is mocked to throw an exception always
/// - When:
///    - I try to call uploadData:
/// - Then:
///    - I should get a non nil value for error and nil value for result
///
- (void)testDataUploadWithURLSessionException {
    NSString *key = @"testDataUpload";
    NSData *uploadData = [@"1234343454" dataUsingEncoding:NSUTF8StringEncoding];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration forKey:key];
    AWSS3TransferUtility *transferUtility = [AWSS3TransferUtility S3TransferUtilityForKey:key];

    [awss3client setValue:mockNetworking forKey:@"networking"];
    [transferUtility setValue:awss3client forKey:@"s3"];
    [transferUtility setValue:awss3PresignedUrlBuilder forKey:@"preSignedURLBuilder"];
    [transferUtility setValue:urlSession forKey:@"session"];

    NSURL *preSignedURL = [NSURL URLWithString:@"http://asd.com/"];
    AWSTask *getPreSignedURLResultTask = [AWSTask taskWithResult:preSignedURL];
    OCMStub([awss3PresignedUrlBuilder getPreSignedURL:[OCMArg isKindOfClass:[AWSS3GetPreSignedURLRequest class]]]).andReturn(getPreSignedURLResultTask);

    NSException *exp = [[NSException alloc] initWithName:@"S3exception" reason:NULL userInfo:NULL];
    OCMStub([urlSession uploadTaskWithRequest:[OCMArg isKindOfClass:[NSURLRequest class]]
                                     fromFile:[OCMArg isKindOfClass:[NSURL class]]]).andThrow(exp);

    MockUploadTask *uploadTask = [[MockUploadTask alloc] init];
    OCMStub([urlSession uploadTaskWithRequest:[OCMArg isKindOfClass:[NSURLRequest class]]
                                     fromFile:[OCMArg isKindOfClass:[NSURL class]]]).andReturn(uploadTask);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    [[[transferUtility uploadData:uploadData
                           bucket:@"unittestBucket"
                              key:@"unittestKey.txt"
                      contentType:@"text/plain"
                       expression:[AWSS3TransferUtilityUploadExpression new]
                completionHandler:nil] continueWithBlock:^id (AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.result);
        dispatch_semaphore_signal(semaphore);
        return nil;
    }] waitUntilFinished];

    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    [AWSS3TransferUtility removeS3TransferUtilityForKey:key];
}

/**
 Test the successfull execution of multipart data upload.
 **/
- (void)testMultiPartDataUpload {
    NSString *key = @"testMultiPartDataUpload";
    NSData *uploadData = [@"1234343454" dataUsingEncoding:NSUTF8StringEncoding];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration forKey:key];
    AWSS3TransferUtility *transferUtility = [AWSS3TransferUtility S3TransferUtilityForKey:key];
    
    [awss3client setValue:mockNetworking forKey:@"networking"];
    [transferUtility setValue:awss3client forKey:@"s3"];
    [transferUtility setValue:awss3PresignedUrlBuilder forKey:@"preSignedURLBuilder"];
    [transferUtility setValue:urlSession forKey:@"session"];
    
    AWSS3CreateMultipartUploadOutput *output = [AWSS3CreateMultipartUploadOutput new];
    output.uploadId = @"uploadID";
    AWSTask *createMultipartUploadResultTask = [AWSTask taskWithResult:output];
    OCMStub([awss3client createMultipartUpload:[OCMArg isKindOfClass:[AWSS3CreateMultipartUploadRequest class]]]).andReturn(createMultipartUploadResultTask);
    
    NSURL *preSignedURL = [NSURL URLWithString:@"http://asd.com/"];
    AWSTask *getPreSignedURLResultTask = [AWSTask taskWithResult:preSignedURL];
    OCMStub([awss3PresignedUrlBuilder getPreSignedURL:[OCMArg isKindOfClass:[AWSS3GetPreSignedURLRequest class]]]).andReturn(getPreSignedURLResultTask);
    
    MockUploadTask *uploadTask = [[MockUploadTask alloc] init];
    OCMStub([urlSession uploadTaskWithRequest:[OCMArg isKindOfClass:[NSURLRequest class]]
                                     fromFile:[OCMArg isKindOfClass:[NSURL class]]]).andReturn(uploadTask);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [[[transferUtility uploadDataUsingMultiPart:uploadData
                                         bucket:@"unittestBucket"
                                            key:@"unittestKey.txt"
                                    contentType:@"text/plain"
                                     expression:[AWSS3TransferUtilityMultiPartUploadExpression new]
                              completionHandler:nil]
      continueWithBlock:^id (AWSTask *task) {
          XCTAssertNil(task.error);
          XCTAssertNotNil(task.result);
          dispatch_semaphore_signal(semaphore);
          return nil;
      }] waitUntilFinished];
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    [AWSS3TransferUtility removeS3TransferUtilityForKey:key];
}

/**
 Test the situation where NSURLSession throws an exception in multipart upload.
 This should return an error back to the caller. One possible scenario of this
 usecase is when temporary file used for upload got deleted by OS.
 **/
- (void)testMultiPartDataUploadWithURLSessionException {
    NSString *key = @"testMultiPartDataUploadException";
    NSData *uploadData = [@"1234343454" dataUsingEncoding:NSUTF8StringEncoding];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration forKey:key];
    AWSS3TransferUtility *transferUtility = [AWSS3TransferUtility S3TransferUtilityForKey:key];
    
    [awss3client setValue:mockNetworking forKey:@"networking"];
    [transferUtility setValue:awss3client forKey:@"s3"];
    [transferUtility setValue:awss3PresignedUrlBuilder forKey:@"preSignedURLBuilder"];
    [transferUtility setValue:urlSession forKey:@"session"];
    
    AWSS3CreateMultipartUploadOutput *output = [AWSS3CreateMultipartUploadOutput new];
    output.uploadId = @"uploadID";
    AWSTask *createMultipartUploadResultTask = [AWSTask taskWithResult:output];
    OCMStub([awss3client createMultipartUpload:[OCMArg isKindOfClass:[AWSS3CreateMultipartUploadRequest class]]]).andReturn(createMultipartUploadResultTask);
    
    NSURL *preSignedURL = [NSURL URLWithString:@"http://asd.com/"];
    AWSTask *getPreSignedURLResultTask = [AWSTask taskWithResult:preSignedURL];
    OCMStub([awss3PresignedUrlBuilder getPreSignedURL:[OCMArg isKindOfClass:[AWSS3GetPreSignedURLRequest class]]]).andReturn(getPreSignedURLResultTask);
    
    NSException *exp = [[NSException alloc] initWithName:@"S3exception" reason:NULL userInfo:NULL];
    OCMStub([urlSession uploadTaskWithRequest:[OCMArg isKindOfClass:[NSURLRequest class]]
                                     fromFile:[OCMArg isKindOfClass:[NSURL class]]]).andThrow(exp);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [[[transferUtility uploadDataUsingMultiPart:uploadData
                                         bucket:@"unittestBucket"
                                            key:@"unittestKey.txt"
                                    contentType:@"text/plain"
                                     expression:[AWSS3TransferUtilityMultiPartUploadExpression new]
                              completionHandler:nil]
      continueWithBlock:^id (AWSTask *task) {
          XCTAssertNotNil(task.error);
          XCTAssertNil(task.result);
          dispatch_semaphore_signal(semaphore);
          return nil;
      }] waitUntilFinished];
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    [AWSS3TransferUtility removeS3TransferUtilityForKey:key];
}

/**
 Test the situation where AWSS3PresignedUrlBuilder throws an error preparing for multipart upload.
 This should return an error back to the caller.
 **/
- (void)testMultiPartDataUploadWithPresignedURLBuilderError {
    NSString *key = @"testMultiPartDataUploadWithPresignedURLBuilderError";
    NSData *uploadData = [@"1234343454" dataUsingEncoding:NSUTF8StringEncoding];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSS3TransferUtility registerS3TransferUtilityWithConfiguration:configuration forKey:key];
    AWSS3TransferUtility *transferUtility = [AWSS3TransferUtility S3TransferUtilityForKey:key];
    
    [awss3client setValue:mockNetworking forKey:@"networking"];
    [transferUtility setValue:awss3client forKey:@"s3"];
    [transferUtility setValue:awss3PresignedUrlBuilder forKey:@"preSignedURLBuilder"];
    [transferUtility setValue:urlSession forKey:@"session"];
    
    AWSS3CreateMultipartUploadOutput *output = [AWSS3CreateMultipartUploadOutput new];
    output.uploadId = @"uploadID";
    AWSTask *createMultipartUploadResultTask = [AWSTask taskWithResult:output];
    OCMStub([awss3client createMultipartUpload:[OCMArg isKindOfClass:[AWSS3CreateMultipartUploadRequest class]]]).andReturn(createMultipartUploadResultTask);
    
    NSError *presignedURLError = [NSError errorWithDomain:AWSS3PresignedURLErrorDomain code:AWSS3PresignedURLErrorUnknown userInfo:nil];
    AWSTask *getPreSignedURLErrorTask = [AWSTask taskWithError:presignedURLError];
    OCMStub([awss3PresignedUrlBuilder getPreSignedURL:[OCMArg isKindOfClass:[AWSS3GetPreSignedURLRequest class]]]).andReturn(getPreSignedURLErrorTask);
    
    MockUploadTask *uploadTask = [[MockUploadTask alloc] init];
    OCMStub([urlSession uploadTaskWithRequest:[OCMArg isKindOfClass:[NSURLRequest class]]
                                     fromFile:[OCMArg isKindOfClass:[NSURL class]]]).andReturn(uploadTask);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [[[transferUtility uploadDataUsingMultiPart:uploadData
                                         bucket:@"unittestBucket"
                                            key:@"unittestKey.txt"
                                    contentType:@"text/plain"
                                     expression:[AWSS3TransferUtilityMultiPartUploadExpression new]
                              completionHandler:nil]
      continueWithBlock:^id (AWSTask *task) {
          XCTAssertNotNil(task.error);
          XCTAssertNil(task.result);
          dispatch_semaphore_signal(semaphore);
          return nil;
      }] waitUntilFinished];
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    [AWSS3TransferUtility removeS3TransferUtilityForKey:key];
}

@end
