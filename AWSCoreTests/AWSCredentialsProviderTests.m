/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at
 
 http://aws.amazon.com/apache2.0
 
 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSCore.h"
#import "AWSTestUtility.h"

@interface AWSCredentialsProviderTests : XCTestCase

@property (nonatomic) NSString *dummyAccessKey;
@property (nonatomic) NSString *dummySecretKey;

@end

@implementation AWSCredentialsProviderTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _dummyAccessKey = @"dummyAccessKey";
    _dummySecretKey = @"dummySecretKey";
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (void)testCreateStaticCredentialsProvider {
    AWSStaticCredentialsProvider *staticProviderOne = [AWSStaticCredentialsProvider credentialsWithAccessKey:self.dummyAccessKey secretKey:self.dummySecretKey];
    
    XCTAssertEqualObjects(self.dummyAccessKey, staticProviderOne.accessKey);
    XCTAssertEqualObjects(self.dummySecretKey, staticProviderOne.secretKey);
    
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials" ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSStaticCredentialsProvider *staticProviderTwo = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
    XCTAssertEqualObjects(credentialsJson[@"accessKey"], staticProviderTwo.accessKey);
    XCTAssertEqualObjects(credentialsJson[@"secretKey"], staticProviderTwo.secretKey);
    
}

- (void)testCreateWebIdentityCredentialsProvider {
    
    NSString *providerId = @"providerId";
    NSString *roleArn = @"invalidARN";
    NSString *roleSessionName = @"testSession";
    NSString *webIdentityToken = @"OauthToken";
    
    AWSWebIdentityCredentialsProvider *provider = [AWSWebIdentityCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                                    providerId:providerId
                                                                                                       roleArn:roleArn
                                                                                               roleSessionName:roleSessionName
                                                                                              webIdentityToken:webIdentityToken];
    
    XCTAssertEqualObjects(providerId, provider.providerId);
    XCTAssertEqualObjects(roleArn, provider.roleArn);
    XCTAssertEqualObjects(roleSessionName, provider.roleSessionName);
    XCTAssertEqualObjects(webIdentityToken, provider.webIdentityToken);
    
    [provider setValue:@"accessKey" forKey:@"accessKey"];
    [provider setValue:@"secretKey" forKey:@"secretKey"];
    [provider setValue:@"sessionKey" forKey:@"sessionKey"];
    [provider setValue:[NSDate date] forKey:@"expiration"];
    [[provider refresh] waitUntilFinished];
    
    XCTAssertNil(provider.accessKey);
    XCTAssertNil(provider.secretKey);
    XCTAssertNil(provider.sessionKey);
    XCTAssertNil(provider.expiration);
    
    
}

- (void)testCreateCognitoCredentialsProvider {
    
    AWSCognitoCredentialsProvider *provider1 = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                       identityProvider:nil
                                                                                          unauthRoleArn:nil
                                                                                            authRoleArn:nil];
    XCTAssertNotNil(provider1);
    
    
    AWSCognitoCredentialsProvider *provider2 = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                         identityPoolId:nil];
    
    XCTAssertNotNil(provider2);
    
    AWSCognitoCredentialsProvider *provider3 = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                             accountId:nil
                                                                                        identityPoolId:nil
                                                                                         unauthRoleArn:nil
                                                                                           authRoleArn:nil];
    
    XCTAssertNotNil(provider3);
    
    AWSCognitoCredentialsProvider *provider4 = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                              accountId:nil
                                                                                         identityPoolId:nil
                                                                                          unauthRoleArn:nil
                                                                                            authRoleArn:nil
                                                                                                 logins:nil];
    XCTAssertNotNil(provider4);
    
    AWSCognitoCredentialsProvider *provider5 = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                             identityId:nil
                                                                                              accountId:nil
                                                                                         identityPoolId:nil
                                                                                          unauthRoleArn:nil
                                                                                            authRoleArn:nil
                                                                                                 logins:nil];
    
    XCTAssertNotNil(provider5);
    
    
}
#pragma clang diagnostic pop

@end
