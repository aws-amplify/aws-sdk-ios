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

#if AWS_TEST_S3_PRE_SIGNED_URL_BUILDER

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "S3.h"
#import "XMLDictionary.h"

NSUInteger const AWSS3PreSignedURLTest256KB = 1024 * 256;

@interface AWSS3TestCredentialsProvider : NSObject <AWSCredentialsProvider>

@property (nonatomic, strong) NSString *accessKey;
@property (nonatomic, strong) NSString *secretKey;
@property (nonatomic, strong) NSString *sessionKey;

@end

@implementation AWSS3TestCredentialsProvider

@end

@interface AWSS3PreSignedURLBuilderTests : XCTestCase

@end

@implementation AWSS3PreSignedURLBuilderTests

- (void)setUp {
    [super setUp];
    [AWSLogger defaultLogger].logLevel = AWSLogLevelError;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testCustomServiceConfiguration {

    AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
    AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                           credentialsProvider:credentialsProvider];

    AWSS3PreSignedURLBuilder *customPreSignedURLBuilder = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:configuration];
    NSURL *presignedURL = [customPreSignedURLBuilder getPreSignedURL:[[AWSS3GetPreSignedURLRequest alloc] initWithBucket:@"ios-v2-s3-tm-testdata"
                                                                                                                     key:@"temp2.txt"
                                                                                                              httpMethod:AWSHTTPMethodGET
                                                                                                                 expires:[NSDate dateWithTimeIntervalSinceNow:3600]]];
    XCTAssertNotNil(presignedURL);

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    NSError *returnError = nil;
    NSHTTPURLResponse *returnResponse = nil;

    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&returnResponse error:&returnError];

    XCTAssertNil(returnError, @"response contains error:%@,\n presigned URL is:%@",returnError,presignedURL.absoluteString);

    if (returnResponse.statusCode < 200 || returnResponse.statusCode >=300) XCTFail(@"response status Code is :%ld",(long)returnResponse.statusCode);

    XCTAssertEqual(65961003, [responseData length],@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)65961003,(unsigned long)[responseData length]);

}

- (void)testGetObject {

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods"];

    for (NSString *myBucketName in bucketNameArray) {

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [[AWSS3GetPreSignedURLRequest alloc] initWithBucket:myBucketName
                                                                                                              key:@"temp2.txt"
                                                                                                       httpMethod:AWSHTTPMethodGET
                                                                                                          expires:[NSDate dateWithTimeIntervalSinceNow:3600]];

        AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];

        NSURL *presignedURL = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
        XCTAssertNotNil(presignedURL);

        //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

        NSError *returnError = nil;
        NSHTTPURLResponse *returnResponse = nil;

        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&returnResponse error:&returnError];

        XCTAssertNil(returnError, @"response contains error:%@,\n presigned URL is:%@",returnError,presignedURL.absoluteString);

        if (returnResponse.statusCode < 200 || returnResponse.statusCode >=300) XCTFail(@"response status Code is :%ld",(long)returnResponse.statusCode);

        XCTAssertEqual(65961003, [responseData length],@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)65961003,(unsigned long)[responseData length]);
    }

}

- (void)testPutObject {
    AWSS3 *s3 = [AWSS3 defaultS3];

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods"];

    for (NSString *myBucketName in bucketNameArray) {

        NSString *keyName = @"ios-presignedURL-put";

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [[AWSS3GetPreSignedURLRequest alloc ]initWithBucket:myBucketName
                                                                                                              key:keyName
                                                                                                       httpMethod:AWSHTTPMethodPUT
                                                                                                          expires:[NSDate dateWithTimeIntervalSinceNow:3600]];
        AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
        NSURL *presignedURL = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
        XCTAssertNotNil(presignedURL);

        //NSLog(@"(PUT)presigned URL (Put)is: %@",presignedURL.absoluteString);

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [request setHTTPMethod:@"PUT"];

        unsigned char *largeData = malloc(AWSS3PreSignedURLTest256KB) ;
        memset(largeData, 5, AWSS3PreSignedURLTest256KB);
        NSData *testObjectData = [[NSData alloc] initWithBytesNoCopy:largeData length:AWSS3PreSignedURLTest256KB];

        [request setHTTPBody:testObjectData];

        NSError *returnError = nil;
        NSHTTPURLResponse *returnResponse = nil;

        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&returnResponse error:&returnError];

        XCTAssertNil(returnError, @"response contains error:%@ \n presigned URL is:%@",returnError,presignedURL.absoluteString);

        if (returnResponse.statusCode < 200 || returnResponse.statusCode >=300) XCTFail(@"response status Code is :%ld",(long)returnResponse.statusCode);

        if ([responseData length] != 0) {
            //expected the got 0 size returnData, but got something else.
            NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            XCTFail(@"Error response received:\n %@",responseString);
        }

        //wait a few seconds
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

        //validate uploaded Object
        AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
        listObjectReq.bucket = myBucketName;

        [[[s3 listObjects:listObjectReq] continueWithBlock:^id(BFTask *task) {
            XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
            XCTAssertTrue([task.result isKindOfClass:[AWSS3ListObjectsOutput class]],@"The response object is not a class of [%@]", NSStringFromClass([AWSS3ListObjectsOutput class]));
            AWSS3ListObjectsOutput *listObjectsOutput = task.result;

            XCTAssertEqualObjects(listObjectsOutput.name, myBucketName);

            BOOL hasObject = NO;
            for (AWSS3Object *s3Object in listObjectsOutput.contents) {
                if ([s3Object.key isEqualToString:keyName]) {
                    hasObject = YES;
                }
            }
            XCTAssertTrue(hasObject,@"can not find the object after putObject has been called");

            return nil;
        }] waitUntilFinished];


        //delete uploaded Object
        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = myBucketName;
        deleteObjectRequest.key = keyName;

        [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
            XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
            XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
            return nil;
        }] waitUntilFinished];

    }
}

- (void)testHEADObject {

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods"];

    for (NSString *myBucketName in bucketNameArray) {

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [[AWSS3GetPreSignedURLRequest alloc] initWithBucket:myBucketName
                                                                                                              key:@"temp2.txt"
                                                                                                       httpMethod:AWSHTTPMethodHEAD
                                                                                                          expires:[NSDate dateWithTimeIntervalSinceNow:3600]];
        AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
        NSURL *presignedURL = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
        XCTAssertNotNil(presignedURL);

        //NSLog(@"(HEAD)presigned URL is: %@",presignedURL.absoluteString);

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [request setHTTPMethod:@"HEAD"];

        NSError *returnError = nil;
        NSHTTPURLResponse *returnResponse = nil;

        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&returnResponse error:&returnError];

        XCTAssertNil(returnError, @"response contains error:%@ \n presigned URL is:%@",returnError, presignedURL.absoluteString);

        if (returnResponse.statusCode < 200 || returnResponse.statusCode >=300) XCTFail(@"response status Code is :%ld",(long)returnResponse.statusCode);

        XCTAssertEqual(65961003, [[[returnResponse allHeaderFields] objectForKey:@"Content-Length"] integerValue],@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)65961003,(long)[[[returnResponse allHeaderFields] objectForKey:@"Content-Length"] integerValue]);

        if ([responseData length] != 0) {
            //expected the got 0 size returnData, but got something else.
            NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            XCTFail(@"Error response received:\n %@",responseString);
        }

    }

}

- (void)testDeleteBucket {
    AWSS3 *s3 = [AWSS3 defaultS3];

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods"];

    for (NSString *myBucketName in bucketNameArray) {

        NSString *keyName = @"ios-test-to-be-deleted";

        //upload the object first
        AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
        putObjectRequest.bucket = myBucketName;
        putObjectRequest.key = keyName;

        unsigned char *largeData = malloc(AWSS3PreSignedURLTest256KB) ;
        memset(largeData, 5, AWSS3PreSignedURLTest256KB);
        NSData *testObjectData = [[NSData alloc] initWithBytesNoCopy:largeData length:AWSS3PreSignedURLTest256KB];

        putObjectRequest.body = testObjectData;
        putObjectRequest.contentLength = [NSNumber numberWithUnsignedInteger:[testObjectData length]];

        [[[s3 putObject:putObjectRequest] continueWithBlock:^id(BFTask *task) {
            XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
            XCTAssertTrue([task.result isKindOfClass:[AWSS3PutObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3PutObjectOutput class]),[task.result description]);
            AWSS3PutObjectOutput *putObjectOutput = task.result;
            XCTAssertNotNil(putObjectOutput.ETag);
            XCTAssertEqual(putObjectOutput.serverSideEncryption, AWSS3ServerSideEncryptionUnknown);
            return nil;

        }] waitUntilFinished];

        //wait a few seconds
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

        //create delete object resigned URL

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [[AWSS3GetPreSignedURLRequest alloc] initWithBucket:myBucketName
                                                                                                              key:keyName
                                                                                                       httpMethod:AWSHTTPMethodDELETE
                                                                                                          expires:[NSDate dateWithTimeIntervalSinceNow:3600]];
        AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
        NSURL *presignedURL = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
        XCTAssertNotNil(presignedURL);

        //NSLog(@"(DELETE)presigned URL is: %@",presignedURL.absoluteString);

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [request setHTTPMethod:@"DELETE"];

        NSError *returnError = nil;
        NSHTTPURLResponse *returnResponse = nil;

        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&returnResponse error:&returnError];

        XCTAssertNil(returnError, @"response contains error:%@, \n presigned URL is:%@",returnError, presignedURL.absoluteString);

        if (returnResponse.statusCode < 200 || returnResponse.statusCode >=300) XCTFail(@"response status Code is :%ld",(long)returnResponse.statusCode);

        if ([responseData length] != 0) {
            //expected the got 0 size returnData, but got something else.
            NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            XCTFail(@"Error response received:\n %@",responseString);
        }

        //wait a few seconds
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

        //confirm object has been deleted
        AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
        getObjectRequest.bucket = myBucketName;
        getObjectRequest.key = keyName;

        [[[s3 getObject:getObjectRequest] continueWithBlock:^id(BFTask *task) {
            XCTAssertNotNil(task.error);
            XCTAssertEqual(AWSS3ErrorNoSuchKey, task.error.code, @"expected AWSS3ErrorNoSuchKey Error but got:%ld",(long)task.error.code);
            return nil;
        }] waitUntilFinished];


        //if failed to delete by presigned URL, delete it.
        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = myBucketName;
        deleteObjectRequest.key = keyName;
        [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
            return nil;
        }] waitUntilFinished];

    }
}

- (void)testInvalidExpirationDate {

    //create a currentDate

    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [[AWSS3GetPreSignedURLRequest alloc] initWithBucket:@"ios-v2-s3-tm-testdata"
                                                                                                          key:@"temp2.txt"
                                                                                                   httpMethod:AWSHTTPMethodGET
                                                                                                      expires:[NSDate date]];

    AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
    NSURL *resultOne = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
    XCTAssertNil(resultOne);

    //create a date in the past
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:-100];
    NSURL *resultTwo = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
    XCTAssertNil(resultTwo);

    //create a date will expire soon.
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3]; //will expired in 3 seconds.
    NSURL *presignedURL =  [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
    XCTAssertNotNil(presignedURL);


    //wait a few seconds until presigned URL expired
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

    //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);



    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

    NSError *returnError = nil;
    NSHTTPURLResponse *returnResponse = nil;

    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&returnResponse error:&returnError];

    XCTAssertNil(returnError, @"response contains error:%@ \n presigned URL is:%@",returnError, presignedURL.absoluteString);

    XCTAssertEqual(403, returnResponse.statusCode, @"expected HTTP 403 Forbidden response code, but got: %ld",(long)returnResponse.statusCode);

    if (returnResponse.statusCode == 403) {
        if (responseData) {
            NSDictionary *responseDic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:responseData];
            XCTAssertEqualObjects(@"AccessDenied", responseDic[@"Code"], @"expect AccessDenied error but got:%@",responseDic[@"Code"]);
        } else {
            XCTAssertNotNil(responseData);
        }

    } else {
        XCTAssertEqual(403, returnResponse.statusCode, @"expected HTTP 403 Forbidden response code, but got: %ld",(long)returnResponse.statusCode);
    }

}

- (void)testInvalidParameters {

    AWSS3 *s3 = [AWSS3 defaultS3];

    AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
    NSURL *resultOne = [preSignedURLBuilder getPreSignedURL:[[AWSS3GetPreSignedURLRequest alloc] initWithBucket:nil key:@"anyKey" httpMethod:AWSHTTPMethodGET expires:[NSDate dateWithTimeIntervalSinceNow:3600]]];
    XCTAssertNil(resultOne,@"expected nil caused by AWSS3PreSignedURLErrorBucketNameIsNil Error");

    NSURL *resultTwo = [preSignedURLBuilder getPreSignedURL:[[AWSS3GetPreSignedURLRequest alloc ] initWithBucket:@"somebucket" key:nil httpMethod:AWSHTTPMethodGET expires:[NSDate dateWithTimeIntervalSinceNow:3600]]];
    XCTAssertNil(resultTwo,@"expected nil caused by AWSS3PreSignedURLErrorKeyNameIsNil Error");

    NSURL *resultThree = [preSignedURLBuilder getPreSignedURL:[[AWSS3GetPreSignedURLRequest alloc] initWithBucket:@"somebucket" key:@"someKey" httpMethod:AWSHTTPMethodPOST expires:[NSDate dateWithTimeIntervalSinceNow:3600]]];
    XCTAssertNil(resultThree, @"expected nil caused by unsupported httpMethod Error");

    AWSS3PreSignedURLBuilder *customPreSignedURLBuilder = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:nil];
    NSURL *resultFour = [customPreSignedURLBuilder getPreSignedURL:[[AWSS3GetPreSignedURLRequest alloc] initWithBucket:@"somebucket" key:@"someKey" httpMethod:AWSHTTPMethodGET expires:[NSDate dateWithTimeIntervalSinceNow:3600]]];
    XCTAssertNil(resultFour, @"expected nil caused by AWSS3PreSignedURLErrorKeyNameIsNil");

    AWSS3TestCredentialsProvider *testCredentialProvider = [AWSS3TestCredentialsProvider new];
    testCredentialProvider.accessKey = s3.configuration.credentialsProvider.accessKey;
    testCredentialProvider.sessionKey = s3.configuration.credentialsProvider.sessionKey;

    AWSServiceConfiguration *customServiceConfigTwo = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSEast1 credentialsProvider:testCredentialProvider];
    AWSS3PreSignedURLBuilder *customPreSignedURLBuilderTwo = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:customServiceConfigTwo];
    NSURL *resultFive = [customPreSignedURLBuilderTwo getPreSignedURL:[[AWSS3GetPreSignedURLRequest alloc] initWithBucket:@"somebucket" key:@"someKey" httpMethod:AWSHTTPMethodGET expires:[NSDate dateWithTimeIntervalSinceNow:3600]]];

    XCTAssertNil(resultFive, @"expected nil caused by AWSS3PreSignedURLErrorSecretKeyIsNil Error");

    testCredentialProvider.accessKey = nil;
    testCredentialProvider.secretKey = s3.configuration.credentialsProvider.secretKey;
    
    AWSServiceConfiguration *customServiceConfigThree = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSEast1 credentialsProvider:testCredentialProvider];
    AWSS3PreSignedURLBuilder *customPreSignedURLBuilderThree = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:customServiceConfigThree];
    NSURL *resultSix = [customPreSignedURLBuilderThree getPreSignedURL:[[AWSS3GetPreSignedURLRequest alloc] initWithBucket:@"somebucket" key:@"someKey" httpMethod:AWSHTTPMethodGET expires:[NSDate dateWithTimeIntervalSinceNow:3600]]];
    
    XCTAssertNil(resultSix, @"expected nil caused by AWSS3PreSignedURLErrorKeyNameIsNil Error");
    
}

@end

#endif
