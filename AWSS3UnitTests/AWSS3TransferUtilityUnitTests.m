//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
          XCTAssertNotNil(task);
          dispatch_semaphore_signal(semaphore);
          return nil;
      }] waitUntilFinished];
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    [AWSS3TransferUtility removeS3TransferUtilityForKey:key];
}

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

    NSException *exp = [[NSException alloc]initWithName:@"S3exception" reason:NULL userInfo:NULL];
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
          XCTAssertNotNil(task);
          dispatch_semaphore_signal(semaphore);
          return nil;
      }] waitUntilFinished];
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    [AWSS3TransferUtility removeS3TransferUtilityForKey:key];
}

@end


