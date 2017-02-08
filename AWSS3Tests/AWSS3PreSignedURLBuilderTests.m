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

NSUInteger const AWSS3PreSignedURLTest256KB = 1024 * 256;

static NSString *testS3PresignedURLEUCentralKey = @"testS3PresignedURLEUCentral";
static NSString *testS3EUCentralKey = @"testS3EUCentral";
static NSString *testS3PresignedURLEUCentralStaticKey = @"testS3PresignedURLEUCentralStatic";

@interface AWSS3TestCredentialsProvider : NSObject <AWSCredentialsProvider>

@property (nonatomic, strong) AWSCredentials *internalCredentials;

@end

@implementation AWSS3TestCredentialsProvider

- (AWSTask<AWSCredentials *> *)credentials {
    return [AWSTask taskWithResult:self.internalCredentials];
}

- (void)invalidateCachedTemporaryCredentials {
    self.internalCredentials = nil;
}

@end

@interface AWSS3PreSignedURLBuilderTests : XCTestCase

@end

@implementation AWSS3PreSignedURLBuilderTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [AWSTestUtility setupCognitoCredentialsProvider];

    id<AWSCredentialsProvider> credentialProvider = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider;
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionEUCentral1
                                                                         credentialsProvider:credentialProvider];
    [AWSS3PreSignedURLBuilder registerS3PreSignedURLBuilderWithConfiguration:configuration forKey:testS3PresignedURLEUCentralKey];
    [AWSS3 registerS3WithConfiguration:configuration forKey:testS3EUCentralKey];

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSStaticCredentialsProvider *staticCredentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                            secretKey:credentialsJson[@"secretKey"]];
    AWSServiceConfiguration *staticConfig = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionEUCentral1
                                                                        credentialsProvider:staticCredentialsProvider];
    [AWSS3PreSignedURLBuilder registerS3PreSignedURLBuilderWithConfiguration:staticConfig forKey:testS3PresignedURLEUCentralStaticKey];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testCustomServiceConfiguration {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                      secretKey:credentialsJson[@"secretKey"]];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];

    [AWSS3PreSignedURLBuilder registerS3PreSignedURLBuilderWithConfiguration:configuration
                                                                      forKey:@"testCustomServiceConfiguration"];
    AWSS3PreSignedURLBuilder *customPreSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:@"testCustomServiceConfiguration"];


    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = @"ios-v2-s3-tm-testdata";
    getPreSignedURLRequest.key = @"temp2.txt";
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

    [[[customPreSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

        NSURL *presignedURL = task.result;

        XCTAssertNotNil(presignedURL);

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                         completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                             XCTAssertNil(error, @"response contains error:%@,\n presigned URL is:%@",error,presignedURL.absoluteString);

                                             if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                 XCTFail(@"response status Code is :%ld", (long)((NSHTTPURLResponse *)response).statusCode);
                                                 NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                             }

                                             XCTAssertEqual(65961003, [data length],
                                                            @"received object is different from sent object. expect file size:%lu, got:%lu", (unsigned long)65961003, (unsigned long)[data length]);

                                             dispatch_semaphore_signal(semaphore);
                                         }] resume];

        XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 240 * NSEC_PER_SEC)), 0);

        return nil;
    }] waitUntilFinished];

}

-(void)testObjectWithGreedyKey {
    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata", @"ios-v2-s3.periods", @"ios-v2-s3-eu-central", @"ios-v2-s3-eu-c.periods"];

    int32_t count = 0;
    for (NSString *myBucketName in bucketNameArray) {

        AWSS3PreSignedURLBuilder *preSignedURLBuilder = nil;
        AWSS3 *s3 = nil;
        switch (count) {
            case 2:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralKey];
                s3 = [AWSS3 S3ForKey:testS3EUCentralKey];
                break;
            case 3:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralStaticKey];
                s3 = [AWSS3 S3ForKey:testS3EUCentralKey];
                break;
            default:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
                s3 = [AWSS3 defaultS3];
                break;
        }
        XCTAssertNotNil(preSignedURLBuilder);
        XCTAssertNotNil(s3);

        NSString *keyName = [NSString stringWithFormat:@"%lld/presignedURL-greedykey",(int64_t)[NSDate timeIntervalSinceReferenceDate]];
        //Put a object
        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = myBucketName;
        getPreSignedURLRequest.key = keyName;
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }

            NSURL *presignedURL = task.result;

            XCTAssertNotNil(presignedURL);

            //NSLog(@"(PUT)presigned URL (Put)is: %@",presignedURL.absoluteString);

            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
            request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
            [request setHTTPMethod:@"PUT"];

            unsigned char *largeData = malloc(AWSS3PreSignedURLTest256KB) ;
            memset(largeData, 5, AWSS3PreSignedURLTest256KB);
            NSData *testObjectData = [[NSData alloc] initWithBytesNoCopy:largeData length:AWSS3PreSignedURLTest256KB];

            [request setHTTPBody:testObjectData];

            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                 XCTAssertNil(error, @"response contains error:%@ \n presigned URL is:%@", error, presignedURL.absoluteString);

                                                 if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                     XCTFail(@"response status Code is :%ld", (long)((NSHTTPURLResponse *)response).statusCode);
                                                     NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                 }

                                                 if ([data length] != 0) {
                                                     //expected the got 0 size returnData, but got something else.
                                                     NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                     XCTFail(@"Error response received:\n %@",responseString);
                                                 }

                                                 dispatch_semaphore_signal(semaphore);
                                             }] resume];

            XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);

            return nil;
        }] waitUntilFinished];

        //wait a few seconds
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

        //Head the Object
        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest2 = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest2.bucket = myBucketName;
        getPreSignedURLRequest2.key = keyName;
        getPreSignedURLRequest2.HTTPMethod = AWSHTTPMethodHEAD;
        getPreSignedURLRequest2.expires = [NSDate dateWithTimeIntervalSinceNow:3600];


        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest2] continueWithBlock:^id(AWSTask *task) {

            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }

            NSURL *presignedURL = task.result;
            XCTAssertNotNil(presignedURL);

            //NSLog(@"(HEAD)presigned URL is: %@",presignedURL.absoluteString);

            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
            request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
            [request setHTTPMethod:@"HEAD"];

            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                 XCTAssertNil(error, @"response contains error:%@ \n presigned URL is:%@",error, presignedURL.absoluteString);

                                                 if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                     XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                     NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                 }

                                                 XCTAssertEqual((unsigned long)AWSS3PreSignedURLTest256KB, [[[((NSHTTPURLResponse *)response) allHeaderFields] objectForKey:@"Content-Length"] integerValue],@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)AWSS3PreSignedURLTest256KB,(long)[[[((NSHTTPURLResponse *)response) allHeaderFields] objectForKey:@"Content-Length"] integerValue]);

                                                 if ([data length] != 0) {
                                                     //expected the got 0 size returnData, but got something else.
                                                     NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                     XCTFail(@"Error response received:\n %@",responseString);
                                                 }
                                                 dispatch_semaphore_signal(semaphore);
                                             }] resume];

            XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);

            return nil;
        }] waitUntilFinished];

        //Get Object
        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest3 = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest3.bucket = myBucketName;
        getPreSignedURLRequest3.key = keyName;
        getPreSignedURLRequest3.HTTPMethod = AWSHTTPMethodGET;
        getPreSignedURLRequest3.expires = [NSDate dateWithTimeIntervalSinceNow:3600];


        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest3] continueWithBlock:^id(AWSTask *task) {

            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }

            NSURL *presignedURL = task.result;

            XCTAssertNotNil(presignedURL);

            //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);

            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
            request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                 XCTAssertNil(error, @"response contains error:%@,\n presigned URL is:%@",error,presignedURL.absoluteString);

                                                 if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                     XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                     NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                 }

                                                 XCTAssertEqual((unsigned long)AWSS3PreSignedURLTest256KB, [data length],@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)AWSS3PreSignedURLTest256KB,(unsigned long)[data length]);

                                                 dispatch_semaphore_signal(semaphore);
                                             }] resume];

            XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);

            return nil;
        }] waitUntilFinished];

        //Delete Object

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest4 = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest4.bucket = myBucketName;
        getPreSignedURLRequest4.key = keyName;
        getPreSignedURLRequest4.HTTPMethod = AWSHTTPMethodDELETE;
        getPreSignedURLRequest4.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest4] continueWithBlock:^id(AWSTask *task) {

            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }

            NSURL *presignedURL = task.result;

            XCTAssertNotNil(presignedURL);

            //NSLog(@"(DELETE)presigned URL is: %@",presignedURL.absoluteString);

            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
            request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
            [request setHTTPMethod:@"DELETE"];

            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                 XCTAssertNil(error, @"response contains error:%@, \n presigned URL is:%@",error, presignedURL.absoluteString);

                                                 if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                     XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                     NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                 }

                                                 if ([data length] != 0) {
                                                     //expected the got 0 size returnData, but got something else.
                                                     NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                     XCTFail(@"Error response received:\n %@",responseString);
                                                 }

                                                 dispatch_semaphore_signal(semaphore);
                                             }] resume];

            XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);

            return nil;
        }] waitUntilFinished];

        //wait a few seconds
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

        //confirm object has been deleted

        AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
        getObjectRequest.bucket = myBucketName;
        getObjectRequest.key = keyName;

        [[[s3 getObject:getObjectRequest] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNotNil(task.error);
            XCTAssertEqual(AWSS3ErrorNoSuchKey, task.error.code, @"expected AWSS3ErrorNoSuchKey Error but got:%ld",(long)task.error.code);
            return nil;
        }] waitUntilFinished];


        //if failed to delete by presigned URL, delete it.
        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = myBucketName;
        deleteObjectRequest.key = keyName;
        [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
            return nil;
        }] waitUntilFinished];
        count++;

    }

}

- (void)testPutObjectWithSpecialCharacters {

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods",@"ios-v2-s3-eu-central",@"ios-v2-s3-eu-c.periods"];
    NSArray *keyNameArray = @[@"a:b/&$@=;:+ ,?.zip",@"\\^`><{}/[]#  %'~|"]; //characters might require special handling and characters to avoid
    NSString *testContentType = @"application/x-authorware-bin";


    unsigned char *largeData = malloc(AWSS3PreSignedURLTest256KB) ;
    memset(largeData, 5, AWSS3PreSignedURLTest256KB);
    NSData *testObjectData = [[NSData alloc] initWithBytesNoCopy:largeData length:AWSS3PreSignedURLTest256KB];

    int32_t count = 0;
    for (NSString *myBucketName in bucketNameArray) {

        AWSS3PreSignedURLBuilder *preSignedURLBuilder = nil;
        AWSS3 *s3 = nil;
        switch (count) {
            case 2:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralKey];
                s3 = [AWSS3 S3ForKey:testS3EUCentralKey];
                break;
            case 3:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralStaticKey];
                s3 = [AWSS3 S3ForKey:testS3EUCentralKey];
                break;
            default:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
                s3 = [AWSS3 defaultS3];
                break;
        }
        XCTAssertNotNil(preSignedURLBuilder);
        XCTAssertNotNil(s3);

        count++;

        for (NSString *keyName in keyNameArray) {

            AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
            getPreSignedURLRequest.bucket = myBucketName;
            getPreSignedURLRequest.key = keyName;
            getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
            getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
            if ([keyName isEqualToString:@"a:b/&$@=;:+ ,?.zip"]) getPreSignedURLRequest.contentType = testContentType;


            [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

                if (task.error) {
                    XCTAssertNil(task.error);
                    return nil;
                }

                NSURL *presignedURL = task.result;

                XCTAssertNotNil(presignedURL);

                //NSLog(@"(PUT)presigned URL (Put)is: %@",presignedURL.absoluteString);

                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
                request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
                [request setHTTPMethod:@"PUT"];
                if ([keyName isEqualToString:@"a:b/&$@=;:+ ,?.zip"]) [request setValue:testContentType forHTTPHeaderField:@"Content-Type"];


                [request setHTTPBody:testObjectData];

                dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
                [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                     XCTAssertNil(error, @"response contains error:%@ \n presigned URL is:%@",error,presignedURL.absoluteString);

                                                     if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                         XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                         NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                     }

                                                     if ([data length] != 0) {
                                                         //expected the got 0 size returnData, but got something else.
                                                         NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                         XCTFail(@"Error response received:\n %@",responseString);
                                                     }

                                                     dispatch_semaphore_signal(semaphore);
                                                 }] resume];

                XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);



                return nil;
            }] waitUntilFinished];

            //wait a few seconds
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

            //validate uploaded Object
            AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
            listObjectReq.bucket = myBucketName;

            [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
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

            if (YES) {
                AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
                getPreSignedURLRequest.bucket = myBucketName;
                getPreSignedURLRequest.key = keyName;
                getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
                getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

                [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

                    if (task.error) {
                        XCTAssertNil(task.error);
                        return nil;
                    }

                    NSURL *presignedURL = task.result;

                    XCTAssertNotNil(presignedURL);

                    //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);

                    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
                    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

                    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
                    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                         XCTAssertNil(error, @"response contains error:%@,\n presigned URL is:%@",error,presignedURL.absoluteString);

                                                         if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                             XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                             NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                         }

                                                         XCTAssertEqualObjects(testObjectData, data);

                                                         dispatch_semaphore_signal(semaphore);
                                                     }] resume];

                    XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);

                    return nil;
                }] waitUntilFinished];
            }

            //delete uploaded Object
            AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
            deleteObjectRequest.bucket = myBucketName;
            deleteObjectRequest.key = keyName;

            [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
                XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
                XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
                return nil;
            }] waitUntilFinished];


        }
    }
}

- (void)testGetObject {

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods",@"ios-v2-s3-eu-central",@"ios-v2-s3-eu-c.periods"];

    int32_t count = 0;
    for (NSString *myBucketName in bucketNameArray) {

        @autoreleasepool {

            AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
            getPreSignedURLRequest.bucket = myBucketName;
            getPreSignedURLRequest.key = @"temp2.txt";
            getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
            getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

            AWSS3PreSignedURLBuilder *preSignedURLBuilder = nil;
            switch (count) {
                case 0:
                    preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
                    [getPreSignedURLRequest setValue:@"" forRequestParameter:AWSS3PresignedURLTorrent];
                    break;
                case 2:
                    preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralKey];
                    break;
                case 3:
                    preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralStaticKey];
                    break;
                default:
                    preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
                    break;
            }
            XCTAssertNotNil(preSignedURLBuilder);


            [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

                if (task.error) {
                    XCTAssertNil(task.error);
                    return nil;
                }

                NSURL *presignedURL = task.result;

                XCTAssertNotNil(presignedURL);

                //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);

                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
                request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

                dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
                [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                     XCTAssertNil(error, @"response contains error:%@,\n presigned URL is:%@",error,presignedURL.absoluteString);

                                                     if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                         XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                         NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                     }

                                                     if (count == 0) {
                                                         XCTAssertTrue([data length] > 0);
                                                         NSString *responseContentTypeStr = [((NSHTTPURLResponse *)response) allHeaderFields][@"Content-Type"];
                                                         XCTAssertEqualObjects(@"application/x-bittorrent", responseContentTypeStr);
                                                     } else {
                                                         XCTAssertEqual(65961003, [data length],@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)65961003,(unsigned long)[data length]);
                                                     }

                                                     dispatch_semaphore_signal(semaphore);
                                                 }] resume];

                XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 240 * NSEC_PER_SEC)), 0);

                return nil;
            }] waitUntilFinished];

            count++;
        }
    }

}

-(void)testPutObjectEncryption {

    NSString *testString1 = [NSString stringWithFormat:@"test string1: %@",[[NSUUID UUID] UUIDString]];
    NSData *testObjectData = [testString1 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *keyName = @"ios-presignedURL-testEncryption";

    //create a currentDate
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = @"ios-v2-s3-tm-testdata";
    getPreSignedURLRequest.key = keyName;
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

    //add encryption
    [getPreSignedURLRequest setValue:@"AES256" forRequestParameter:@"x-amz-server-side-encryption"];

    AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
    AWSTask *task = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
    [task waitUntilFinished];
    NSURL *presignedURL =  task.result;
    XCTAssertNotNil(presignedURL);


    //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);



    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    [request setHTTPMethod:@"PUT"];
    [request setHTTPBody:testObjectData];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                         XCTAssertNil(error, @"response contains error:%@ \n presigned URL is:%@",error,presignedURL.absoluteString);

                                         if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                             XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                             NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                         }

                                         if ([data length] != 0) {
                                             //expected the got 0 size returnData, but got something else.
                                             NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                             XCTFail(@"Error response received:\n %@",responseString);
                                         }

                                         //confirm server side encryption
                                         NSString *encryptDesc = [((NSHTTPURLResponse *)response) allHeaderFields][@"x-amz-server-side-encryption"];
                                         XCTAssertEqualObjects(@"AES256", encryptDesc);

                                         dispatch_semaphore_signal(semaphore);
                                     }] resume];

    XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);
}


-(void)testPutObjectWithCustomMetadata {
    AWSS3 *s3 = [AWSS3 defaultS3];
    AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];

    NSString *testString1 = [NSString stringWithFormat:@"test string1: %@",[[NSUUID UUID] UUIDString]];
    NSData *testObjectData = [testString1 dataUsingEncoding:NSUTF8StringEncoding];

    NSString *bucketName = @"ios-v2-s3-tm-testdata";
    NSString *keyName = @"ios-presignedURL-testMetaData";

    NSString *userDefinedHeader = @"x-amz-meta-userdefined-key";
    NSString *userDefinedValue = @"this is a test value with \" quotes \"";

    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = bucketName;
    getPreSignedURLRequest.key = keyName;
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600]; //presigned-URL expiration date

    //Add other parameters or your custom metadata
    [getPreSignedURLRequest setValue:userDefinedValue forRequestParameter:userDefinedHeader];

    //Build pre-signedURL
    [[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

        //retrieve presigned-URL
        NSURL *presignedURL = task.result;

        //create a url request
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        [request setHTTPMethod:@"PUT"];
        [request setHTTPBody:testObjectData];

        //send HTTP PUT Request
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                         completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                             if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                 NSLog(@"server returns error.");
                                             }

                                             dispatch_semaphore_signal(semaphore);
                                         }] resume];

        XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);


        return nil;
    }];


    //Get the object back
    if (true) {

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = bucketName;
        getPreSignedURLRequest.key = keyName;
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }

            NSURL *presignedURL = task.result;

            XCTAssertNotNil(presignedURL);

            //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);

            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
            request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                 XCTAssertNil(error, @"response contains error:%@,\n presigned URL is:%@",error,presignedURL.absoluteString);

                                                 if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                     XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                     NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                 }

                                                 //Assert response contains user-defined metadata
                                                 XCTAssertEqualObjects(userDefinedValue, [[((NSHTTPURLResponse *)response) allHeaderFields] objectForKey:userDefinedHeader]);

                                                 dispatch_semaphore_signal(semaphore);
                                             }] resume];

            XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);

            return nil;
        }] waitUntilFinished];

        //remove the object
        //delete uploaded Object
        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = bucketName;
        deleteObjectRequest.key = keyName;

        [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
            return nil;
        }] waitUntilFinished];
    }
}

- (void)testPutObject2 {
    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods",@"ios-v2-s3-eu-central",@"ios-v2-s3-eu-c.periods"];
    NSString *testContentType = @"application/x-authorware-bin";
    int32_t count = 0;
    for (NSString *myBucketName in bucketNameArray) {

        NSString *testString1 = [NSString stringWithFormat:@"test string1: %@",[[NSUUID UUID] UUIDString]];
        NSData *testObjectData = [testString1 dataUsingEncoding:NSUTF8StringEncoding];

        NSString *testString2 = [NSString stringWithFormat:@"test string2: %@",[[NSUUID UUID] UUIDString]];
        NSData *testObjectData2 = [testString2 dataUsingEncoding:NSUTF8StringEncoding];

        NSString *keyName = @"ios-presignedURL-put";

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = myBucketName;
        getPreSignedURLRequest.key = keyName;
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

        AWSS3PreSignedURLBuilder *preSignedURLBuilder = nil;
        AWSS3 *s3 = nil;
        switch (count) {
            case 0:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
                s3 = [AWSS3 defaultS3];
                getPreSignedURLRequest.contentType = testContentType; //include contentType in the signature
                break;
            case 1:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder]; //include contentMD5 in the signature
                s3 = [AWSS3 defaultS3];
                getPreSignedURLRequest.contentMD5 = [NSString aws_base64md5FromData:testObjectData];
                break;
            case 2:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralKey];
                s3 = [AWSS3 S3ForKey:testS3EUCentralKey];
                break;
            case 3:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralStaticKey];
                s3 = [AWSS3 S3ForKey:testS3EUCentralKey];
                break;
            default:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
                s3 = [AWSS3 defaultS3];
                break;
        }
        XCTAssertNotNil(preSignedURLBuilder);
        XCTAssertNotNil(s3);

        NSMutableDictionary *versionIDDic = [NSMutableDictionary new];

        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }



            NSURL *presignedURL = task.result;

            XCTAssertNotNil(presignedURL);

            //NSLog(@"(PUT)presigned URL (Put)is: %@",presignedURL.absoluteString);
            int32_t numOfRuns = 1;
            if (count == 2 || count == 3) {
                numOfRuns = 2;
            }

            for (int i=0; i<numOfRuns; i++) {

                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
                request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
                [request setHTTPMethod:@"PUT"];


                if ( (count == 2 || count == 3) && i == 1) {
                    [request setHTTPBody:testObjectData2];
                } else {
                    [request setHTTPBody:testObjectData];
                }

                dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
                [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                     XCTAssertNil(error, @"response contains error:%@ \n presigned URL is:%@",error,presignedURL.absoluteString);

                                                     switch (count) {
                                                         case 0:
                                                             //should return 403 Forbidden error, since Content-Type is not in request header
                                                             if (((NSHTTPURLResponse *)response).statusCode != 403) {
                                                                 XCTFail(@"Expected 403 Error but got response status Code is :%ld, response data is:\n%@",(long)((NSHTTPURLResponse *)response).statusCode,[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                             }
                                                             break;
                                                         case 1:
                                                             //should return 403 Forbidden error, since Content-MD5 is not in request header
                                                             if (((NSHTTPURLResponse *)response).statusCode != 403) {
                                                                 XCTFail(@"Expected 403 Error but got response status Code is :%ld, response data is:\n%@",(long)((NSHTTPURLResponse *)response).statusCode,[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                             }
                                                             break;

                                                         default:
                                                             //should success
                                                             if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                                 XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                                 NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                             }
                                                             if ([data length] != 0) {
                                                                 //expected the got 0 size returnData, but got something else.
                                                                 NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                                 XCTFail(@"Error response received:\n %@",responseString);
                                                             }


                                                             if ( versionIDDic[[NSNumber numberWithInt:count]] == nil) {
                                                                 NSMutableArray *array = [NSMutableArray new];
                                                                 versionIDDic[[NSNumber numberWithInt:count]] = array;
                                                             }

                                                             NSString *versionID = [((NSHTTPURLResponse *)response) allHeaderFields][@"x-amz-version-id"];
                                                             XCTAssertNotNil(versionID);
                                                             [versionIDDic[[NSNumber numberWithInt:count]] addObject:versionID];


                                                             break;
                                                     }

                                                     dispatch_semaphore_signal(semaphore);
                                                 }] resume];

                XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);
            }

            return nil;
        }] waitUntilFinished];

        //wait a few seconds
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];


        if (count == 2 || count == 3) {
            //download the first uploaded data, confirm the data first time downloaded

            AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
            getPreSignedURLRequest.bucket = myBucketName;
            getPreSignedURLRequest.key = keyName;
            getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
            getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

            if (count == 2) {
                [getPreSignedURLRequest setValue:[versionIDDic[[NSNumber numberWithInt:count]] firstObject] forRequestParameter:AWSS3PresignedURLVersionID];
            }
            if (count == 3) {
                [getPreSignedURLRequest setValue:[versionIDDic[[NSNumber numberWithInt:count]] firstObject] forRequestParameter:AWSS3PresignedURLVersionID];
                [getPreSignedURLRequest setValue:@"x-amz-meta-userdefined-key" forRequestParameter:@"user-defined-value"];
            }

            [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

                if (task.error) {
                    XCTAssertNil(task.error);
                    return nil;
                }

                NSURL *presignedURL = task.result;

                XCTAssertNotNil(presignedURL);

                //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);

                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
                request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

                dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
                [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                     XCTAssertNil(error, @"response contains error:%@,\n presigned URL is:%@",error,presignedURL.absoluteString);

                                                     if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                         XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                         NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                     }
                                                     XCTAssertEqualObjects(testObjectData,data,@"Expected: %@, but got: %@",[[NSString alloc] initWithData:testObjectData encoding:NSUTF8StringEncoding],[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);

                                                     dispatch_semaphore_signal(semaphore);
                                                 }] resume];

                XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);

                return nil;
            }] waitUntilFinished];

        }

        //delete uploaded Object
        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = myBucketName;
        deleteObjectRequest.key = keyName;

        [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
            return nil;
        }] waitUntilFinished];

        count++;
    }


}
- (void)testPutObject {

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods",@"ios-v2-s3-eu-central",@"ios-v2-s3-eu-c.periods"];
    NSString *testContentType = @"application/x-authorware-bin";
    int32_t count = 0;

    NSString *testString1 = [NSString stringWithFormat:@"test string1: %@",[[NSUUID UUID] UUIDString]];
    NSData *testObjectData = [testString1 dataUsingEncoding:NSUTF8StringEncoding];

    for (NSString *myBucketName in bucketNameArray) {

        AWSS3PreSignedURLBuilder *preSignedURLBuilder = nil;
        AWSS3 *s3 = nil;
        switch (count) {
            case 2:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralKey];
                s3 = [AWSS3 S3ForKey:testS3EUCentralKey];
                break;
            case 3:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralStaticKey];
                s3 = [AWSS3 S3ForKey:testS3EUCentralKey];
                break;
            default:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
                s3 = [AWSS3 defaultS3];
                break;
        }
        XCTAssertNotNil(preSignedURLBuilder);
        XCTAssertNotNil(s3);

        NSString *keyName = @"ios-presignedURL-put";

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = myBucketName;
        getPreSignedURLRequest.key = keyName;
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
        if (count == 0) getPreSignedURLRequest.contentType = testContentType;
        if (count == 1) getPreSignedURLRequest.contentMD5 =  [NSString aws_base64md5FromData:testObjectData];

        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }

            NSURL *presignedURL = task.result;

            XCTAssertNotNil(presignedURL);

            //NSLog(@"(PUT)presigned URL (Put)is: %@",presignedURL.absoluteString);

            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
            request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
            [request setHTTPMethod:@"PUT"];
            if (count == 0) [request setValue:testContentType forHTTPHeaderField:@"Content-Type"];
            if (count == 1) [request setValue:[NSString aws_base64md5FromData:testObjectData] forHTTPHeaderField:@"Content-MD5"];

            [request setHTTPBody:testObjectData];

            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                 XCTAssertNil(error, @"response contains error:%@ \n presigned URL is:%@",error,presignedURL.absoluteString);

                                                 if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                     XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                     NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                 }

                                                 if ([data length] != 0) {
                                                     //expected the got 0 size returnData, but got something else.
                                                     NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                     XCTFail(@"Error response received:\n %@",responseString);
                                                 }

                                                 dispatch_semaphore_signal(semaphore);
                                             }] resume];

            XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);

            return nil;
        }] waitUntilFinished];

        //wait a few seconds
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

        //validate uploaded Object
        AWSS3ListObjectsRequest *listObjectReq = [AWSS3ListObjectsRequest new];
        listObjectReq.bucket = myBucketName;

        [[[s3 listObjects:listObjectReq] continueWithBlock:^id(AWSTask *task) {
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

        [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
            XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
            return nil;
        }] waitUntilFinished];

        count++;
    }
}

- (void)testHEADObject {

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods",@"ios-v2-s3-eu-central",@"ios-v2-s3-eu-c.periods"];

    int32_t count = 0;
    for (NSString *myBucketName in bucketNameArray) {

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = myBucketName;
        getPreSignedURLRequest.key = @"temp2.txt";
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodHEAD;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];


        AWSS3PreSignedURLBuilder *preSignedURLBuilder = nil;
        switch (count) {
            case 2:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralKey];
                break;
            case 3:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralStaticKey];
                break;
            default:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
                break;
        }
        XCTAssertNotNil(preSignedURLBuilder);


        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }

            NSURL *presignedURL = task.result;
            XCTAssertNotNil(presignedURL);

            //NSLog(@"(HEAD)presigned URL is: %@",presignedURL.absoluteString);

            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
            request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
            [request setHTTPMethod:@"HEAD"];

            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                 XCTAssertNil(error, @"response contains error:%@ \n presigned URL is:%@",error, presignedURL.absoluteString);

                                                 if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                     XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                     NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                 }

                                                 XCTAssertEqual(65961003, [[[((NSHTTPURLResponse *)response) allHeaderFields] objectForKey:@"Content-Length"] integerValue],@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)65961003,(long)[[[((NSHTTPURLResponse *)response) allHeaderFields] objectForKey:@"Content-Length"] integerValue]);

                                                 if ([data length] != 0) {
                                                     //expected the got 0 size returnData, but got something else.
                                                     NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                     XCTFail(@"Error response received:\n %@",responseString);
                                                 }

                                                 dispatch_semaphore_signal(semaphore);
                                             }] resume];

            XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);

            return nil;
        }] waitUntilFinished];
        count++;
    }

}

- (void)testDeleteBucket {
    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods",@"ios-v2-s3-eu-central",@"ios-v2-s3-eu-c.periods"];

    int32_t count = 0;
    for (NSString *myBucketName in bucketNameArray) {

        NSString *keyName = @"ios-test-to-be-deleted";

        AWSS3PreSignedURLBuilder *preSignedURLBuilder = nil;
        AWSS3 *s3 = nil;
        switch (count) {
            case 2:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralKey];
                s3 = [AWSS3 S3ForKey:testS3EUCentralKey];
                break;
            case 3:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:testS3PresignedURLEUCentralStaticKey];
                s3 = [AWSS3 S3ForKey:testS3EUCentralKey];
                break;
            default:
                preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
                s3 = [AWSS3 defaultS3];
                break;
        }
        XCTAssertNotNil(preSignedURLBuilder);
        XCTAssertNotNil(s3);

        //upload the object first
        AWSS3PutObjectRequest *putObjectRequest = [AWSS3PutObjectRequest new];
        putObjectRequest.bucket = myBucketName;
        putObjectRequest.key = keyName;

        unsigned char *largeData = malloc(AWSS3PreSignedURLTest256KB) ;
        memset(largeData, 5, AWSS3PreSignedURLTest256KB);
        NSData *testObjectData = [[NSData alloc] initWithBytesNoCopy:largeData length:AWSS3PreSignedURLTest256KB];

        putObjectRequest.body = testObjectData;
        putObjectRequest.contentLength = [NSNumber numberWithUnsignedInteger:[testObjectData length]];

        [[[s3 putObject:putObjectRequest] continueWithBlock:^id(AWSTask *task) {
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

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = myBucketName;
        getPreSignedURLRequest.key = keyName;
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodDELETE;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(AWSTask *task) {

            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }

            NSURL *presignedURL = task.result;

            XCTAssertNotNil(presignedURL);

            //NSLog(@"(DELETE)presigned URL is: %@",presignedURL.absoluteString);

            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
            request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
            [request setHTTPMethod:@"DELETE"];

            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                 XCTAssertNil(error, @"response contains error:%@, \n presigned URL is:%@",error, presignedURL.absoluteString);

                                                 if (((NSHTTPURLResponse *)response).statusCode < 200 || ((NSHTTPURLResponse *)response).statusCode >=300) {
                                                     XCTFail(@"response status Code is :%ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                                     NSLog(@"response data is:%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                 }

                                                 if ([data length] != 0) {
                                                     //expected the got 0 size returnData, but got something else.
                                                     NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                     XCTFail(@"Error response received:\n %@",responseString);
                                                 }

                                                 dispatch_semaphore_signal(semaphore);
                                             }] resume];

            XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);

            return nil;
        }] waitUntilFinished];

        //wait a few seconds
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

        //confirm object has been deleted
        AWSS3GetObjectRequest *getObjectRequest = [AWSS3GetObjectRequest new];
        getObjectRequest.bucket = myBucketName;
        getObjectRequest.key = keyName;

        [[[s3 getObject:getObjectRequest] continueWithBlock:^id(AWSTask *task) {
            XCTAssertNotNil(task.error);
            XCTAssertEqual(AWSS3ErrorNoSuchKey, task.error.code, @"expected AWSS3ErrorNoSuchKey Error but got:%ld",(long)task.error.code);
            return nil;
        }] waitUntilFinished];


        //if failed to delete by presigned URL, delete it.
        AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
        deleteObjectRequest.bucket = myBucketName;
        deleteObjectRequest.key = keyName;
        [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(AWSTask *task) {
            return nil;
        }] waitUntilFinished];
        count++;
    }
}

- (void)testInvalidExpirationDate {

    //create a currentDate

    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = @"ios-v2-s3-tm-testdata";
    getPreSignedURLRequest.key = @"temp2.txt";
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequest.expires = [NSDate date];


    AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
    AWSTask *resultOne = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
    XCTAssertNil(resultOne.result);


    //create a date in the past
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:-100];
    AWSTask *resultTwo = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
    XCTAssertNil(resultTwo.result);
    
    //create a date will expire soon.
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3]; //will expired in 3 seconds.
    AWSTask *task =  [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
    [task waitUntilFinished];
    NSURL *presignedURL =  task.result;
    XCTAssertNotNil(presignedURL);
    
    
    //wait a few seconds until presigned URL expired
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);
    
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                     completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                         XCTAssertNil(error, @"response contains error:%@ \n presigned URL is:%@",error, presignedURL.absoluteString);
                                         
                                         XCTAssertEqual(403, ((NSHTTPURLResponse *)response).statusCode, @"expected HTTP 403 Forbidden response code, but got: %ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                         
                                         if (((NSHTTPURLResponse *)response).statusCode == 403) {
                                             if (data) {
                                                 NSString *responseXMLString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                 if ([responseXMLString rangeOfString:@"AccessDenied"].location == NSNotFound) {
                                                     XCTFail(@"Can not find 'AccessDenied' in the responseData: %@",responseXMLString);
                                                 }
                                                 
                                             } else {
                                                 XCTAssertNotNil(data);
                                             }
                                             
                                         } else {
                                             XCTAssertEqual(403, ((NSHTTPURLResponse *)response).statusCode, @"expected HTTP 403 Forbidden response code, but got: %ld",(long)((NSHTTPURLResponse *)response).statusCode);
                                         }
                                         
                                         dispatch_semaphore_signal(semaphore);
                                     }] resume];
    
    XCTAssertEqual(dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC)), 0);
}

- (void)testInvalidParameters {
    AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
    
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequestOne = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequestOne.key = @"anyKey";
    getPreSignedURLRequestOne.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequestOne.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
    AWSTask *resultOne = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequestOne];
    XCTAssertEqual(AWSS3PresignedURLErrorBucketNameIsNil, resultOne.error.code);
    
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequestTwo = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequestTwo.bucket = @"somebucket";
    getPreSignedURLRequestTwo.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequestTwo.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
    AWSTask *resultTwo = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequestTwo];
    XCTAssertEqual(AWSS3PresignedURLErrorKeyNameIsNil, resultTwo.error.code);
    
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequestThree = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequestThree.bucket = @"somebucket";
    getPreSignedURLRequestThree.key = @"somekey";
    getPreSignedURLRequestThree.HTTPMethod = AWSHTTPMethodPOST;
    getPreSignedURLRequestThree.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
    AWSTask *resultThree = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequestThree];
    XCTAssertEqual(AWSS3PresignedURLErrorUnsupportedHTTPVerbs, resultThree.error.code);
    
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequestSeven= [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequestSeven.key = @"anyKey";
    getPreSignedURLRequestSeven.bucket = @"somebucket";
    getPreSignedURLRequestSeven.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequestSeven.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
    [getPreSignedURLRequestSeven setValue:@6 forRequestParameter:@"key"];
#pragma clang diagnostic pop
    AWSTask *resultSeven = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequestSeven];
    XCTAssertEqual(AWSS3PresignedURLErrorInvalidRequestParameters, resultSeven.error.code);
    
}

@end
