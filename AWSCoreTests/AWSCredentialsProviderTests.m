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

@property AWSRegionType region;

@end

@implementation AWSCredentialsProviderTests

- (void)setUp {
    [super setUp];
    self.region = [AWSTestUtility getRegionFromTestConfiguration];
}

- (void)testCreateWebIdentityCredentialsProvider {
    NSString *providerId = @"providerId";
    NSString *roleArn = @"invalidARN";
    NSString *roleSessionName = @"testSession";
    NSString *webIdentityToken = @"OauthToken";

    AWSWebIdentityCredentialsProvider *provider = [[AWSWebIdentityCredentialsProvider alloc] initWithRegionType:self.region
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
