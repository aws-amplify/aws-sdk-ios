//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSCore.h"
#import "AWSTestUtility.h"

@interface AWSCognitoIdentity()

@property (nonatomic, strong) AWSNetworking *networking;

@end

@interface AWSNetworking()

@property (nonatomic, strong) AWSURLSessionManager *sessionManager;

@end

@interface AWSURLSessionManager()

- (void)invalidate;

@end

@interface AWSURLSessionManagerTests : XCTestCase

@end

// These tests rely on knowledge of AWSNetworking internals, but are needed to assert that we're properly releasing
// objects from memory.
@implementation AWSURLSessionManagerTests

- (void)setUp {
    [AWSTestUtility setupFakeCognitoCredentialsProvider];
}

/**
 - Given: An AWS service configuration
 - When: A service is registered with the configuration
 - Then: The service has an AWSURLSessionManager object
 */
- (void)testServiceHasAWSNetworking {
    AWSCognitoIdentity *cognitoIdentityClient = [AWSCognitoIdentity defaultCognitoIdentity];
    XCTAssertNotNil(cognitoIdentityClient.networking.sessionManager);
}

/**
 - Given: A registered AWS Service
 - When: The service is released
 - Then: The AWSURLSessionManager object is released
 */
- (void)testSessionManagerIsDeallocatedWhenServiceIsDeallocated {
    __weak AWSURLSessionManager *sessionManager;

    @autoreleasepool {
        // Doing all allocations in the autorelease pool to ensure dealloc happens within timeframe of test
        AWSServiceConfiguration *serviceConfig = [[AWSServiceManager defaultServiceManager] defaultServiceConfiguration];
        [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:serviceConfig forKey:@"localClient"];
        AWSCognitoIdentity *localClient = [AWSCognitoIdentity CognitoIdentityForKey:@"localClient"];
        sessionManager = localClient.networking.sessionManager;

        localClient = nil;

        // Overwrite previously registered client
        [AWSCognitoIdentity removeCognitoIdentityForKey:@"localClient"];
    }

    XCTestExpectation *sessionManagerIsReleased = [self expectationWithDescription:@"sessionManager is released"];

    // Watch for session manager to be released in the background, and fulfill the expectation when complete.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (YES) {
            if (sessionManager == nil) {
                [sessionManagerIsReleased fulfill];
                break;
            }
            sleep(0.25);
        }
    });

    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

/**
 - Given: An invalidated AWSURLSessionManager
 - When: A task is submitted
 - Then: The task returns with an `AWSNetworkingErrorSessionInvalid` error
 */
- (void)testErrorWhenAddingToInvalidatedSession {
    AWSCognitoIdentity *cognitoIdentityClient = [AWSCognitoIdentity defaultCognitoIdentity];
    AWSURLSessionManager *sessionManager = cognitoIdentityClient.networking.sessionManager;
    [sessionManager invalidate];

    AWSCognitoIdentityListIdentitiesInput *input = [[AWSCognitoIdentityListIdentitiesInput alloc] init];

    [[[cognitoIdentityClient listIdentities:input] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityListIdentitiesResponse *> * _Nonnull t) {
        XCTAssertNotNil(t.error);
        XCTAssertEqual(t.error.code, AWSNetworkingErrorSessionInvalid);
        return nil;
    }] waitUntilFinished];
}

@end
