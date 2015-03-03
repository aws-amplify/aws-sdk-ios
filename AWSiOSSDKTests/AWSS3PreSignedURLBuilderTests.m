/*
 * Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import "S3.h"
#import "XMLDictionary.h"
#import "AWSTestUtility.h"

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
    [AWSTestUtility setupCognitoCredentialsProvider];
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
    
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = @"ios-v2-s3-tm-testdata";
    getPreSignedURLRequest.key = @"temp2.txt";
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
    
    [[[customPreSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(BFTask *task) {
        
        NSURL *presignedURL = task.result;
        
        XCTAssertNotNil(presignedURL);
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        NSError *returnError = nil;
        NSHTTPURLResponse *returnResponse = nil;
        
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&returnResponse error:&returnError];
        
        XCTAssertNil(returnError, @"response contains error:%@,\n presigned URL is:%@",returnError,presignedURL.absoluteString);
        
        if (returnResponse.statusCode < 200 || returnResponse.statusCode >=300) XCTFail(@"response status Code is :%ld",(long)returnResponse.statusCode);
        
        XCTAssertEqual(65961003, [responseData length],@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)65961003,(unsigned long)[responseData length]);
        
        return nil;
    }] waitUntilFinished];

}

-(void)testObjectWithGreedyKey {
    
    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods"];
    
    for (NSString *myBucketName in bucketNameArray) {
        
        
        NSString *keyName = [NSString stringWithFormat:@"%lld/presignedURL-greedykey",(int64_t)[NSDate timeIntervalSinceReferenceDate]];
        //Put a object
        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = myBucketName;
        getPreSignedURLRequest.key = keyName;
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
        
        [[[[AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder] getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(BFTask *task) {
            
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
        
        
        [[[[AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder] getPreSignedURL:getPreSignedURLRequest2] continueWithBlock:^id(BFTask *task) {
            
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
            
            NSError *returnError = nil;
            NSHTTPURLResponse *returnResponse = nil;
            
            NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&returnResponse error:&returnError];
            
            XCTAssertNil(returnError, @"response contains error:%@ \n presigned URL is:%@",returnError, presignedURL.absoluteString);
            
            if (returnResponse.statusCode < 200 || returnResponse.statusCode >=300) XCTFail(@"response status Code is :%ld",(long)returnResponse.statusCode);
            
            XCTAssertEqual((unsigned long)AWSS3PreSignedURLTest256KB, [[[returnResponse allHeaderFields] objectForKey:@"Content-Length"] integerValue],@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)AWSS3PreSignedURLTest256KB,(long)[[[returnResponse allHeaderFields] objectForKey:@"Content-Length"] integerValue]);
            
            if ([responseData length] != 0) {
                //expected the got 0 size returnData, but got something else.
                NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
                XCTFail(@"Error response received:\n %@",responseString);
            }
            
            return nil;
        }] waitUntilFinished];
        
        //Get Object
        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest3 = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest3.bucket = myBucketName;
        getPreSignedURLRequest3.key = keyName;
        getPreSignedURLRequest3.HTTPMethod = AWSHTTPMethodGET;
        getPreSignedURLRequest3.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
        
        
        [[[[AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder] getPreSignedURL:getPreSignedURLRequest3] continueWithBlock:^id(BFTask *task) {
            
            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }
            
            NSURL *presignedURL = task.result;
            
            XCTAssertNotNil(presignedURL);
            
            //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);
            
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
            request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
            
            NSError *returnError = nil;
            NSHTTPURLResponse *returnResponse = nil;
            
            NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&returnResponse error:&returnError];
            
            XCTAssertNil(returnError, @"response contains error:%@,\n presigned URL is:%@",returnError,presignedURL.absoluteString);
            
            if (returnResponse.statusCode < 200 || returnResponse.statusCode >=300) XCTFail(@"response status Code is :%ld",(long)returnResponse.statusCode);
            
            XCTAssertEqual((unsigned long)AWSS3PreSignedURLTest256KB, [responseData length],@"received object is different from sent object. expect file size:%lu, got:%lu",(unsigned long)AWSS3PreSignedURLTest256KB,(unsigned long)[responseData length]);
            
            return nil;
        }] waitUntilFinished];
        
        //Delete Object
        
        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest4 = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest4.bucket = myBucketName;
        getPreSignedURLRequest4.key = keyName;
        getPreSignedURLRequest4.HTTPMethod = AWSHTTPMethodDELETE;
        getPreSignedURLRequest4.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
        
        [[[[AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder] getPreSignedURL:getPreSignedURLRequest4] continueWithBlock:^id(BFTask *task) {
            
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
            
            return nil;
        }] waitUntilFinished];
        
        //wait a few seconds
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
        
        //confirm object has been deleted
        AWSS3 *s3 = [AWSS3 defaultS3];
        
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

- (void)testPutObjectWithSpecialCharacters {
    AWSS3 *s3 = [AWSS3 defaultS3];
    
    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods"];
    NSArray *keyNameArray = @[@"a:b/&$@=;:+ ,?.zip",@"\\^`><{}/[]#  %'~|"]; //characters might require special handling and characters to avoid
    NSString *testContentType = @"application/x-authorware-bin";
    int32_t count = 0;
    
    unsigned char *largeData = malloc(AWSS3PreSignedURLTest256KB) ;
    memset(largeData, 5, AWSS3PreSignedURLTest256KB);
    NSData *testObjectData = [[NSData alloc] initWithBytesNoCopy:largeData length:AWSS3PreSignedURLTest256KB];
    
    for (NSString *myBucketName in bucketNameArray) {
        
        for (NSString *keyName in keyNameArray) {
            
            AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
            getPreSignedURLRequest.bucket = myBucketName;
            getPreSignedURLRequest.key = keyName;
            getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
            getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
            if (count == 0) getPreSignedURLRequest.contentType = testContentType;
            
            AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
            
            [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(BFTask *task) {
                
                if (task.error) {
                    XCTAssertNil(task.error);
                    return nil;
                }
                
                NSURL *presignedURL = task.result;
                
                XCTAssertNotNil(presignedURL);
                
                NSLog(@"(PUT)presigned URL (Put)is: %@",presignedURL.absoluteString);
                
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
                request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
                [request setHTTPMethod:@"PUT"];
                if (count == 0) [request setValue:testContentType forHTTPHeaderField:@"Content-Type"];
                
                
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
                
                return nil;
            }] waitUntilFinished];
            
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
            
            if (YES) {
                AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
                getPreSignedURLRequest.bucket = myBucketName;
                getPreSignedURLRequest.key = keyName;
                getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
                getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
                
                AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
                
                [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(BFTask *task) {
                    
                    if (task.error) {
                        XCTAssertNil(task.error);
                        return nil;
                    }
                    
                    NSURL *presignedURL = task.result;
                    
                    XCTAssertNotNil(presignedURL);
                    
                    //NSLog(@"(GET)presigned URL is: %@",presignedURL.absoluteString);
                    
                    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:presignedURL];
                    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
                    
                    NSError *returnError = nil;
                    NSHTTPURLResponse *returnResponse = nil;
                    
                    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&returnResponse error:&returnError];
                    
                    XCTAssertNil(returnError, @"response contains error:%@,\n presigned URL is:%@",returnError,presignedURL.absoluteString);
                    
                    if (returnResponse.statusCode < 200 || returnResponse.statusCode >=300) XCTFail(@"response status Code is :%ld",(long)returnResponse.statusCode);
                    
                    XCTAssertEqualObjects(testObjectData, responseData);
                    
                    return nil;
                }] waitUntilFinished];
            }
            
            //delete uploaded Object
            AWSS3DeleteObjectRequest *deleteObjectRequest = [AWSS3DeleteObjectRequest new];
            deleteObjectRequest.bucket = myBucketName;
            deleteObjectRequest.key = keyName;
            
            [[[s3 deleteObject:deleteObjectRequest] continueWithBlock:^id(BFTask *task) {
                XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);
                XCTAssertTrue([task.result isKindOfClass:[AWSS3DeleteObjectOutput class]],@"The response object is not a class of [%@], got: %@", NSStringFromClass([AWSS3DeleteObjectOutput class]),[task.result description]);
                return nil;
            }] waitUntilFinished];
            
            count++;
            
        }
    }
}

- (void)testGetObject {

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods"];

    for (NSString *myBucketName in bucketNameArray) {
        
        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = myBucketName;
        getPreSignedURLRequest.key = @"temp2.txt";
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
        
        AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
        
        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(BFTask *task) {
            
            if (task.error) {
                XCTAssertNil(task.error);
                return nil;
            }
            
            NSURL *presignedURL = task.result;
            
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
            
            return nil;
        }] waitUntilFinished];
    }

}

- (void)testPutObject {
    AWSS3 *s3 = [AWSS3 defaultS3];

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods"];
    NSString *testContentType = @"application/x-authorware-bin";
    int32_t count = 0;
    for (NSString *myBucketName in bucketNameArray) {

        NSString *keyName = @"ios-presignedURL-put";

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = myBucketName;
        getPreSignedURLRequest.key = keyName;
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodPUT;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
        if (count == 0) getPreSignedURLRequest.contentType = testContentType;

        AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
        
        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(BFTask *task) {
            
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
            
            return nil;
        }] waitUntilFinished];
        
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

        count++;
    }
}

- (void)testHEADObject {

    NSArray *bucketNameArray = @[@"ios-v2-s3-tm-testdata",@"ios-v2-s3.periods"];

    for (NSString *myBucketName in bucketNameArray) {

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = myBucketName;
        getPreSignedURLRequest.key = @"temp2.txt";
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodHEAD;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

        AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
        
        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(BFTask *task) {
            
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
            
            return nil;
        }] waitUntilFinished];

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

        AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
        getPreSignedURLRequest.bucket = myBucketName;
        getPreSignedURLRequest.key = keyName;
        getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodDELETE;
        getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3600];

        AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
        [[[preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest] continueWithBlock:^id(BFTask *task) {
            
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
            
            return nil;
        }] waitUntilFinished];

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

    AWSS3GetPreSignedURLRequest *getPreSignedURLRequest = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequest.bucket = @"ios-v2-s3-tm-testdata";
    getPreSignedURLRequest.key = @"temp2.txt";
    getPreSignedURLRequest.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequest.expires = [NSDate date];


    AWSS3PreSignedURLBuilder *preSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];
    BFTask *resultOne = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
    XCTAssertNil(resultOne.result);
    

    //create a date in the past
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:-100];
    BFTask *resultTwo = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest];
    XCTAssertNil(resultTwo.result);

    //create a date will expire soon.
    getPreSignedURLRequest.expires = [NSDate dateWithTimeIntervalSinceNow:3]; //will expired in 3 seconds.
    NSURL *presignedURL =  [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequest].result;
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
    
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequestOne = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequestOne.key = @"anyKey";
    getPreSignedURLRequestOne.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequestOne.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
    BFTask *resultOne = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequestOne];
    XCTAssertEqual(AWSS3PresignedURLErrorBucketNameIsNil, resultOne.error.code);

    AWSS3GetPreSignedURLRequest *getPreSignedURLRequestTwo = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequestTwo.bucket = @"somebucket";
    getPreSignedURLRequestTwo.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequestTwo.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
    BFTask *resultTwo = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequestTwo];
    XCTAssertEqual(AWSS3PresignedURLErrorKeyNameIsNil, resultTwo.error.code);

    AWSS3GetPreSignedURLRequest *getPreSignedURLRequestThree = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequestThree.bucket = @"somebucket";
    getPreSignedURLRequestThree.key = @"somekey";
    getPreSignedURLRequestThree.HTTPMethod = AWSHTTPMethodPOST;
    getPreSignedURLRequestThree.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
    BFTask *resultThree = [preSignedURLBuilder getPreSignedURL:getPreSignedURLRequestThree];
    XCTAssertEqual(AWSS3PresignedURLErrorUnsupportedHTTPVerbs, resultThree.error.code);

    AWSS3PreSignedURLBuilder *customPreSignedURLBuilder = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:nil];
    
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequestFour = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequestFour.bucket = @"somebucket";
    getPreSignedURLRequestFour.key = @"somekey";
    getPreSignedURLRequestFour.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequestFour.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
    BFTask *resultFour = [customPreSignedURLBuilder getPreSignedURL:getPreSignedURLRequestFour];
    XCTAssertEqual(AWSS3PresignedURLErrorEndpointIsNil, resultFour.error.code);

    AWSS3TestCredentialsProvider *testCredentialProvider = [AWSS3TestCredentialsProvider new];
    testCredentialProvider.accessKey = s3.configuration.credentialsProvider.accessKey;
    testCredentialProvider.sessionKey = s3.configuration.credentialsProvider.sessionKey;

    AWSServiceConfiguration *customServiceConfigTwo = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSEast1 credentialsProvider:testCredentialProvider];
    AWSS3PreSignedURLBuilder *customPreSignedURLBuilderTwo = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:customServiceConfigTwo];
    
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequestFive = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequestFive.bucket = @"somebucket";
    getPreSignedURLRequestFive.key = @"somekey";
    getPreSignedURLRequestFive.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequestFive.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
    BFTask *resultFive = [customPreSignedURLBuilderTwo getPreSignedURL:getPreSignedURLRequestFive];

    XCTAssertEqual(AWSS3PresignedURLErrorSecretKeyIsNil, resultFive.error.code);

    testCredentialProvider.accessKey = nil;
    testCredentialProvider.secretKey = s3.configuration.credentialsProvider.secretKey;
    
    AWSServiceConfiguration *customServiceConfigThree = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSEast1 credentialsProvider:testCredentialProvider];
    AWSS3PreSignedURLBuilder *customPreSignedURLBuilderThree = [[AWSS3PreSignedURLBuilder alloc] initWithConfiguration:customServiceConfigThree];
    
    AWSS3GetPreSignedURLRequest *getPreSignedURLRequestSix = [AWSS3GetPreSignedURLRequest new];
    getPreSignedURLRequestSix.bucket = @"somebucket";
    getPreSignedURLRequestSix.key = @"somekey";
    getPreSignedURLRequestSix.HTTPMethod = AWSHTTPMethodGET;
    getPreSignedURLRequestSix.expires = [NSDate dateWithTimeIntervalSinceNow:3600];
    
    BFTask *resultSix = [customPreSignedURLBuilderThree getPreSignedURL:getPreSignedURLRequestSix];
    
    XCTAssertEqual(AWSS3PresignedURLErrorAccessKeyIsNil, resultSix.error.code);
    
}

@end
