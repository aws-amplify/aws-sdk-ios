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

- (void)testCreateStaticCredentialsProvider {
    AWSStaticCredentialsProvider *staticProviderOne = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:self.dummyAccessKey
                                                                                                    secretKey:self.dummySecretKey];

    [[[staticProviderOne credentials] continueWithBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        AWSCredentials *credentials = task.result;
        XCTAssertEqualObjects(self.dummyAccessKey, credentials.accessKey);
        XCTAssertEqualObjects(self.dummySecretKey, credentials.secretKey);

        return nil;
    }] waitUntilFinished];

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials" ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSStaticCredentialsProvider *staticProviderTwo = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                    secretKey:credentialsJson[@"secretKey"]];

    [[[staticProviderTwo credentials] continueWithBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        AWSCredentials *credentials = task.result;
        XCTAssertEqualObjects(credentialsJson[@"accessKey"], credentials.accessKey);
        XCTAssertEqualObjects(credentialsJson[@"secretKey"], credentials.secretKey);

        return nil;
    }] waitUntilFinished];
}

- (void)testCreateWebIdentityCredentialsProvider {
    NSString *providerId = @"providerId";
    NSString *roleArn = @"invalidARN";
    NSString *roleSessionName = @"testSession";
    NSString *webIdentityToken = @"OauthToken";

    AWSWebIdentityCredentialsProvider *provider = [[AWSWebIdentityCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                     providerId:providerId
                                                                                                        roleArn:roleArn
                                                                                                roleSessionName:roleSessionName
                                                                                               webIdentityToken:webIdentityToken];

    XCTAssertEqualObjects(providerId, provider.providerId);
    XCTAssertEqualObjects(roleArn, provider.roleArn);
    XCTAssertEqualObjects(roleSessionName, provider.roleSessionName);
    XCTAssertEqualObjects(webIdentityToken, provider.webIdentityToken);

    AWSCredentials *credentials = [[AWSCredentials alloc] initWithAccessKey:@"accessKey"
                                                                  secretKey:@"secretKey"
                                                                 sessionKey:@"sessionKey"
                                                                 expiration:[NSDate date]];

    [provider setValue:credentials forKey:@"internalCredentials"];
    [[[provider credentials] continueWithBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        AWSCredentials *credentials = task.result;
        XCTAssertNil(credentials.accessKey);
        XCTAssertNil(credentials.secretKey);
        XCTAssertNil(credentials.sessionKey);
        XCTAssertNil(credentials.expiration);

        return nil;
    }] waitUntilFinished];
}

@end
