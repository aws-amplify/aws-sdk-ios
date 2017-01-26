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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSEC2.h"
#import "AWSTestUtility.h"
#import "AWSEC2Serializer.h"
#import "AWSXMLDictionary.h"

@interface AWSEC2Tests : XCTestCase

@end

@implementation AWSEC2Tests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testClockSkewEC2 {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSEC2 *ec2 = [AWSEC2 defaultEC2];
    XCTAssertNotNil(ec2);

    AWSEC2DescribeInstancesRequest *describeInstancesRequest = [AWSEC2DescribeInstancesRequest new];
    [[[ec2 describeInstances:describeInstancesRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSEC2DescribeInstancesResult class]]);
            AWSEC2DescribeInstancesResult *describeInstancesResult = task.result;
            XCTAssertNotNil(describeInstancesResult.reservations);
        }

        return nil;
    }] waitUntilFinished];

    [AWSTestUtility revertSwizzling];
}

- (void)testDescribeInstances {
    AWSEC2 *ec2 = [AWSEC2 defaultEC2];

    AWSEC2DescribeInstancesRequest *describeInstancesRequest = [AWSEC2DescribeInstancesRequest new];
    AWSEC2Filter *platformFilter = [AWSEC2Filter new];
    platformFilter.name = @"platform";
    platformFilter.values = @[@"windows"];
    describeInstancesRequest.filters = @[platformFilter];
    [[[ec2 describeInstances:describeInstancesRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSEC2DescribeInstancesResult class]]);
            AWSEC2DescribeInstancesResult *describeInstancesResult = task.result;
            XCTAssertNotNil(describeInstancesResult.reservations);
            
            for (AWSEC2Reservation *reservation in describeInstancesResult.reservations) {
                for (AWSEC2Instance * instance in reservation.instances) {
                    if ([instance.instanceId isEqualToString:@"i-dcd2a937"]) {
                        XCTAssertEqual(AWSEC2PlatformValuesWindows, instance.platform);
                    }
                }
            }         
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testDescribeImages {
    AWSEC2 *ec2 = [AWSEC2 defaultEC2];
    
    AWSEC2DescribeImagesRequest *describeImagesRequest = [AWSEC2DescribeImagesRequest new];
    describeImagesRequest.imageIds = @[@"ami-ca94f1a3"]; // .NET Beanstalk Cfn Container v1.0.0.0 on Windows 2008 Image ID
    [[[ec2 describeImages:describeImagesRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSEC2DescribeImagesResult class]]);
            AWSEC2DescribeImagesResult *describeImagesResult = task.result;
            XCTAssertNotNil(describeImagesResult.images);
            
            BOOL imageExist = NO;
            
            for (AWSEC2Image *image in describeImagesResult.images) {
                if ([image.imageId isEqualToString:@"ami-ca94f1a3"]) {
                    imageExist = YES;
                    XCTAssertEqual(AWSEC2PlatformValuesWindows, image.platform);
                }
            }
            XCTAssertTrue(imageExist);
        }
        
        return nil;

    }] waitUntilFinished ];
}

- (void)testAttachVolumeFailed {
    AWSEC2 *ec2 = [AWSEC2 defaultEC2];
    
    AWSEC2AttachVolumeRequest *volumeRequest = [AWSEC2AttachVolumeRequest new];
    volumeRequest.volumeId = @"invalidVolumeId"; //VolumeId is empty
    
    [[[ec2 attachVolume:volumeRequest] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"expected InvalidParameterValue error but got nil");
        return nil;
    }] waitUntilFinished];
}


- (void)testEC2Serializer {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"ec2-input" ofType:@"json"];
    
    NSError *error = nil;
    NSMutableArray *ec2TestPackage = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                     options:NSJSONReadingMutableContainers
                                                                       error:&error];
    XCTAssertNil(error);
    
    for (int i=0; i<[ec2TestPackage count]; i++) {
        NSMutableDictionary *aTestPak = [ec2TestPackage objectAtIndex:i];
        NSArray *testCases = [aTestPak objectForKey:@"cases"];
        for(int j=0; j<[testCases count]; j++) {
            NSDictionary *aTest = [testCases objectAtIndex:j];
            
            //create mockRequest
            NSMutableURLRequest *mockRequest = [NSMutableURLRequest new];
            mockRequest.URL = [NSURL URLWithString:@"/"];
            mockRequest.HTTPMethod = @"POST";
            
            //create user input parameters
            NSDictionary *testParameters = aTest[@"params"];
            
            
            //construct serviceDefinition dictionary
            if (aTestPak[@"operations"] == nil) {
                aTestPak[@"operations"] = [NSMutableDictionary new];
            }
            if (aTestPak[@"operations"][@"OperationName"]) {
                [aTestPak[@"operations"] removeObjectForKey:@"OperationName"];
            }
            aTestPak[@"operations"][@"OperationName"] = aTest[@"given"];
            
            //create mock ServiceDefinitionJSON
            NSDictionary *mockServiceDefinitionJSON = aTestPak;
            
            
            // ------------ Perform Serialization ---------------------
            // --------------------------------------------------------
            
            AWSEC2RequestSerializer *testEC2Serializer = [AWSEC2RequestSerializer new];
            [testEC2Serializer setValue:mockServiceDefinitionJSON forKey:@"serviceDefinitionJSON"];
            [testEC2Serializer setValue:@"OperationName" forKey:@"actionName"];
            
            
            AWSTask *resultTask = [testEC2Serializer serializeRequest:mockRequest
                                                              headers:@{}
                                                           parameters:testParameters];
            if (resultTask.error) {
                XCTFail(@"(TestPak %d TestCase %d) Serialization Error:%@",i,j,resultTask.error);
                return;
            }
            
            // ------------Validate Result------------------------------
            
            //validate result
            NSDictionary *resultDic = aTest[@"serialized"];
            
            //validate HTTP URL
            XCTAssertEqualObjects(resultDic[@"uri"], [mockRequest.URL absoluteString], @"(TestPak %d TestCase %d) wrong HTTP URI, expect:%@, but got:%@",i,j,resultDic[@"uri"],[mockRequest.URL absoluteString]);
            
            //validate HTTP Body
            NSString* resultBodyStr = [[NSString alloc] initWithData:mockRequest.HTTPBody encoding:NSUTF8StringEncoding];
            NSString* expectedBodyStr = resultDic[@"body"];
            
            NSCountedSet *resultBodySet = [NSCountedSet setWithArray:[resultBodyStr componentsSeparatedByString:@"&"]];
            NSCountedSet *expectedBodySet = [NSCountedSet setWithArray:[expectedBodyStr componentsSeparatedByString:@"&"]];
            
            if ([expectedBodySet count] == 0) {
                XCTAssertEqualObjects(expectedBodyStr,resultBodyStr , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedBodyStr, resultBodyStr);
            } else {
                XCTAssertEqualObjects(expectedBodySet,resultBodySet , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedBodySet, resultBodySet);
            }
        }
        
    }
}

- (void)testEC2Deserializer {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"ec2-output" ofType:@"json"];
    
    NSError *error = nil;
    NSMutableArray *ec2TestPackge = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:&error];
    XCTAssertNil(error);
    
    for (int i=0; i<[ec2TestPackge count]; i++) {
        NSMutableDictionary *aTestPak = [ec2TestPackge objectAtIndex:i];
        NSArray *testCases = [aTestPak objectForKey:@"cases"];
        for(int j=0; j<[testCases count]; j++) {
            NSDictionary *aTest = [testCases objectAtIndex:j];
            
            //create mockResponse
            NSDictionary *responseHeaders = aTest[@"response"][@"headers"];
            NSInteger statusCode = [aTest[@"response"][@"status_code"] integerValue];
            NSHTTPURLResponse *mockResponse = [[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"/"] statusCode:statusCode HTTPVersion:@"HTTP/1.1" headerFields:responseHeaders];
            
            //construct serviceDefinition dictionary
            if (aTestPak[@"operations"] == nil) {
                aTestPak[@"operations"] = [NSMutableDictionary new];
            }
            if (aTestPak[@"operations"][@"OperationName"]) {
                [aTestPak[@"operations"] removeObjectForKey:@"OperationName"];
            }
            aTestPak[@"operations"][@"OperationName"] = aTest[@"given"];
            
            //create mock ServiceDefinitionJSON
            NSDictionary *mockServiceDefinitionJSON = aTestPak;
            
            
            // ------------ Perform Serialization ---------------------
            // --------------------------------------------------------
            
            AWSXMLResponseSerializer *testXmlResponseSerializer = [AWSXMLResponseSerializer new];
            [testXmlResponseSerializer setValue:mockServiceDefinitionJSON forKey:@"serviceDefinitionJSON"];
            [testXmlResponseSerializer setValue:@"OperationName" forKey:@"actionName"];
            
            
            
            NSString *responseBodyStr = aTest[@"response"][@"body"];
            NSData *responseBodyData = [responseBodyStr dataUsingEncoding:NSUTF8StringEncoding];
            NSError *parseError = nil;
            id responseResult = [[testXmlResponseSerializer responseObjectForResponse:mockResponse originalRequest:nil currentRequest:nil data:responseBodyData error:&parseError] mutableCopy];
            if (parseError) {
                XCTFail(@"(TestPak %d TestCase %d) Serialization Error:%@",i,j,parseError);
                return;
            }
            
            // ------------Validate Result------------------------------
            if ([responseResult isKindOfClass:[NSDictionary class]] && [responseResult objectForKey:@"Stream"] ) {
                NSMutableDictionary *tempResult = [responseResult mutableCopy];
                [tempResult setObject:[[NSString alloc] initWithData:responseResult[@"Stream"] encoding:NSUTF8StringEncoding] forKey:@"Stream"];
                responseResult = tempResult;
            }
            //validate result
            NSDictionary *expectedResult = aTest[@"result"];
            [self replaceNSData2NSString:responseResult];
            
            XCTAssertEqualObjects(expectedResult,responseResult , @"(TestPak %d TestCase %d) wrong HTTP Body, expect:\n%@, but got:\n%@",i,j,expectedResult, responseResult);
            
        }
        
    }
}


- (void) replaceNSData2NSString:(id)jsonObject
{
    if ([jsonObject isKindOfClass:[NSArray class]]) {
        
        for (int i = 0 ; i< [(NSArray *)jsonObject count] ; i++ ) {
            id object = jsonObject[i];
            
            if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]]) {
                [self replaceNSData2NSString:object];
            }
            
            if ([object isKindOfClass:[NSData class]]) {
                [jsonObject replaceObjectAtIndex:i withObject:[[NSString alloc] initWithData:object encoding:NSUTF8StringEncoding]];
            }
        }
    }
    
    if ([jsonObject isKindOfClass:[NSDictionary class]]) {
        for (NSString *key in [jsonObject allKeys]) {
            if ( [jsonObject[key] isKindOfClass:[NSDictionary class]] || [jsonObject[key] isKindOfClass:[NSArray class]]) {
                [self replaceNSData2NSString:jsonObject[key]];
            }
            
            if ([jsonObject[key] isKindOfClass:[NSData class]]) {
                jsonObject[key] = [[NSString alloc] initWithData:jsonObject[key] encoding:NSUTF8StringEncoding];
            }
        }
    }
    
    
}



@end
