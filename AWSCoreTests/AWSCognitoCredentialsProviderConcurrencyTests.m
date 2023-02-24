//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#if !AWS_TEST_BJS_INSTEAD

#import <XCTest/XCTest.h>
#import "AWSCore.h"
#import "AWSTestUtility.h"

NSString *TestsIdentityPoolId = nil;

@interface AWSUnAuthenticatedIdentityProvider : NSObject<AWSIdentityProvider, AWSIdentityProviderManager>

@end

@implementation AWSUnAuthenticatedIdentityProvider

- (NSString *)identityProviderName {
    return nil;
}

- (AWSTask<NSString *> *)token {
    return [AWSTask taskWithResult: nil];
}

- (AWSTask<NSDictionary<NSString *, NSString *> *> *)logins {
    return [[self token] continueWithSuccessBlock:^id _Nullable(AWSTask<NSString *> * _Nonnull task) {
        NSString *token = task.result;
        return [AWSTask taskWithResult:[NSDictionary new]];
    }];
}

@end

@interface AWSCognitoCredentialsProviderConcurrencyTests : XCTestCase

@property AWSRegionType region;

@end

@implementation AWSCognitoCredentialsProviderConcurrencyTests

#pragma mark - Set up/Tear down

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupSessionCredentialsProvider];
    AWSServiceConfiguration *configuration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
    [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration
                                                          forKey:@"Session"];

    NSDictionary *testConfig = [AWSTestUtility getIntegrationTestConfigurationForPackageId: @"core"];
    TestsIdentityPoolId = testConfig[@"identityPoolId"];

}

- (void)setUp {
    [super setUp];
    self.region = [AWSTestUtility getRegionFromTestConfiguration];
}

- (void)tearDown {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc]
                                               initWithRegionType:self.region
                                               identityPoolId:TestsIdentityPoolId];
    [provider clearKeychain];
    [super tearDown];
}

- (void)testMultiThreadedWithEnhancedFlow {
    AWSCognitoCredentialsProviderHelper *identityProvider = [[AWSCognitoCredentialsProviderHelper alloc]
                                                             initWithRegionType: self.region
                                                             identityPoolId:TestsIdentityPoolId
                                                             useEnhancedFlow:YES
                                                             identityProviderManager:[AWSUnAuthenticatedIdentityProvider new]];

    AWSCognitoCredentialsProvider *provider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:self.region
                                                                                       identityProvider:identityProvider];

    dispatch_queue_t processingQueue = dispatch_queue_create("com.amazon.testqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();

    for (int i = 0; i < 1000; i++) {
        dispatch_group_async(group, processingQueue, ^{
            [[[provider credentials] continueWithBlock:^id(AWSTask *task) {
                XCTAssertNotNil(provider.identityId, @"Unable to get identityId");

                AWSCredentials *credentials = task.result;
                XCTAssertNotNil(credentials.secretKey);
                XCTAssertNotNil(credentials.sessionKey);
                XCTAssertNotNil(credentials.expiration);

                return nil;
            }] waitUntilFinished];

        });
    }

    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
}

@end

#endif
