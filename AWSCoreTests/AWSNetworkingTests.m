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
#import "AWSCore.h"
#import "AWSURLSessionManager.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"

@interface AWSNetworkingTests : XCTestCase

@end

@implementation AWSNetworkingTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAWSURLSessionManagerInvalidInitialization{
    
    AWSURLSessionManager *sessionManager = nil;
    
    @try {
        sessionManager = [AWSURLSessionManager new];
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
    @finally {
        XCTAssertNil(sessionManager);
    }
    
}

- (void)testAWSNetworkingInvalidInitialization{
    
    AWSNetworking *network = nil;
    
    @try {
        network = [AWSNetworking new];
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
    @finally {
        XCTAssertNil(network);
    }
    
}

- (void)testHTTPMethodMapping {
    
    XCTAssertEqualObjects(@"GET", [NSString aws_stringWithHTTPMethod:AWSHTTPMethodGET]);
    XCTAssertEqualObjects(@"HEAD", [NSString aws_stringWithHTTPMethod:AWSHTTPMethodHEAD]);
    XCTAssertEqualObjects(@"POST", [NSString aws_stringWithHTTPMethod:AWSHTTPMethodPOST]);
    XCTAssertEqualObjects(@"PUT", [NSString aws_stringWithHTTPMethod:AWSHTTPMethodPUT]);
    XCTAssertEqualObjects(@"PATCH", [NSString aws_stringWithHTTPMethod:AWSHTTPMethodPATCH]);
    XCTAssertEqualObjects(@"DELETE", [NSString aws_stringWithHTTPMethod:AWSHTTPMethodDELETE]);
    XCTAssertEqualObjects(nil, [NSString aws_stringWithHTTPMethod:AWSHTTPMethodUnknown]);
    
}

- (void)testConfigurationClone{
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                    identityPoolId:@""];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    configuration.baseURL = [NSURL URLWithString:@"baseURL"];
    configuration.URLString = @"URLString";
    configuration.HTTPMethod = AWSHTTPMethodPATCH;
    configuration.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:nil
                                                                                    actionName:@"operationName"];
    configuration.responseSerializer = [[AWSJSONResponseSerializer alloc] initWithJSONDefinition:nil
                                                                                actionName:@"operationName"
                                                                               outputClass:nil];

    XCTAssertTrue(configuration.allowsCellularAccess);
    
    AWSServiceConfiguration *configurationClone = [configuration copy];
    
    XCTAssertEqualObjects(configuration.URL, configurationClone.URL);
    XCTAssertEqualObjects(configuration.baseURL, configurationClone.baseURL);
    XCTAssertEqualObjects(configuration.URLString, configurationClone.URLString);
    XCTAssertEqual(configuration.HTTPMethod, configurationClone.HTTPMethod);
    XCTAssertEqualObjects(configuration.requestSerializer, configurationClone.requestSerializer);
    XCTAssertEqualObjects(configuration.requestInterceptors, configurationClone.requestInterceptors);
    XCTAssertEqualObjects(configuration.responseSerializer, configurationClone.responseSerializer);
    XCTAssertEqualObjects(configuration.responseInterceptors, configurationClone.responseInterceptors);
    XCTAssertEqualObjects(configuration.retryHandler, configurationClone.retryHandler);
    XCTAssertEqualObjects(configuration.sharedContainerIdentifier, configurationClone.sharedContainerIdentifier);
    XCTAssertTrue(configuration.allowsCellularAccess);
    
    AWSNetworkingConfiguration *networkConfig = [[AWSNetworkingConfiguration alloc] init];
    networkConfig.baseURL = [NSURL URLWithString:@"baseURL"];
    networkConfig.allowsCellularAccess = NO;

    AWSNetworkingConfiguration *networkConfigClone = [networkConfig copy];
    XCTAssertEqualObjects(networkConfig.baseURL, networkConfigClone.baseURL);
    XCTAssertEqual(networkConfig.allowsCellularAccess, networkConfigClone.allowsCellularAccess);
    XCTAssertFalse(networkConfigClone.allowsCellularAccess);
}

- (void)testConfigurationDefault {
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                    identityPoolId:@""];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];

    [AWSSTS registerSTSWithConfiguration:configuration forKey:@"AWSNetworkingTests.testConfiguration"];
    AWSSTS *STS = [AWSSTS STSForKey:@"AWSNetworkingTests.testConfiguration"];
    XCTAssertEqual(STS.configuration.timeoutIntervalForRequest, 0);
    XCTAssertEqual(STS.configuration.timeoutIntervalForResource, 0);
    XCTAssertEqual(STS.configuration.maxRetryCount, 3);
    NSURLSessionConfiguration *URLSessionConfiguration = [STS valueForKeyPath:@"networking.sessionManager.session.configuration"];
    XCTAssertEqual(URLSessionConfiguration.timeoutIntervalForRequest, 60);
    XCTAssertEqual(URLSessionConfiguration.timeoutIntervalForResource, 604800); // 1 week
}

- (void)testConfigurationModified {
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                    identityPoolId:@""];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    configuration.timeoutIntervalForRequest = 123;
    configuration.timeoutIntervalForResource = 321;
    configuration.maxRetryCount = 4;

    [AWSSTS registerSTSWithConfiguration:configuration forKey:@"AWSNetworkingTests.testConfiguration"];
    AWSSTS *STS = [AWSSTS STSForKey:@"AWSNetworkingTests.testConfiguration"];
    XCTAssertEqual(STS.configuration.timeoutIntervalForRequest, 123);
    XCTAssertEqual(STS.configuration.timeoutIntervalForResource, 321);
    XCTAssertEqual(STS.configuration.maxRetryCount, 4);
    NSURLSessionConfiguration *URLSessionConfiguration = [STS valueForKeyPath:@"networking.sessionManager.session.configuration"];
    XCTAssertEqual(URLSessionConfiguration.timeoutIntervalForRequest, 123);
    XCTAssertEqual(URLSessionConfiguration.timeoutIntervalForResource, 321);
}

- (void)testConfigurationForSmallValues {
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                    identityPoolId:@""];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    configuration.timeoutIntervalForRequest = 1;
    configuration.timeoutIntervalForResource = 1;
    configuration.maxRetryCount = 1;

    [AWSSTS registerSTSWithConfiguration:configuration forKey:@"AWSNetworkingTests.testConfiguration"];
    AWSSTS *STS = [AWSSTS STSForKey:@"AWSNetworkingTests.testConfiguration"];
    XCTAssertEqual(STS.configuration.timeoutIntervalForRequest, 1);
    XCTAssertEqual(STS.configuration.timeoutIntervalForResource, 1);
    XCTAssertEqual(STS.configuration.maxRetryCount, 1);
    NSURLSessionConfiguration *URLSessionConfiguration = [STS valueForKeyPath:@"networking.sessionManager.session.configuration"];
    XCTAssertEqual(URLSessionConfiguration.timeoutIntervalForRequest, 1);
    XCTAssertEqual(URLSessionConfiguration.timeoutIntervalForResource, 1);
}

- (void)testConfigurationForLargeRetry {
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                    identityPoolId:@""];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    configuration.maxRetryCount = 100;

    [AWSSTS registerSTSWithConfiguration:configuration forKey:@"AWSNetworkingTests.testConfiguration"];
    AWSSTS *STS = [AWSSTS STSForKey:@"AWSNetworkingTests.testConfiguration"];
    XCTAssertEqual(STS.configuration.maxRetryCount, 10); // 10 is the max retry possible.
}

@end
