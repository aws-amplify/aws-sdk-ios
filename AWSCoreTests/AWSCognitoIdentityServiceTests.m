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

#if !AWS_TEST_BJS_INSTEAD

#import <XCTest/XCTest.h>
#import "AWSCognitoIdentity.h"
#import "AWSSTS.h"
#import "AWSTestUtility.h"

@interface AWSCognitoIdentityTests : XCTestCase

@end

@implementation AWSCognitoIdentityTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoIdentityService];
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testListIdentityPools {
    AWSCognitoIdentity *cib = [AWSCognitoIdentity CognitoIdentityForKey:AWSTestUtilityCognitoIdentityServiceKey];

    AWSCognitoIdentityListIdentityPoolsInput *listPools = [AWSCognitoIdentityListIdentityPoolsInput new];
    listPools.maxResults = [NSNumber numberWithInt:10];
    [[[cib listIdentityPools:listPools] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCognitoIdentityListIdentityPoolsResponse class]]);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testCreateDeleteIdentityPool {
    AWSCognitoIdentity *cib = [AWSCognitoIdentity CognitoIdentityForKey:AWSTestUtilityCognitoIdentityServiceKey];

    AWSCognitoIdentityCreateIdentityPoolInput *createPool = [AWSCognitoIdentityCreateIdentityPoolInput new];
    createPool.identityPoolName = @"CIBiOSTestCreateDeleteIdentityPool";
    createPool.allowUnauthenticatedIdentities = @YES;

    [[[[cib createIdentityPool:createPool] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCognitoIdentityIdentityPool class]]);
        }

        AWSCognitoIdentityIdentityPool *identityPool = task.result;

        AWSCognitoIdentityDeleteIdentityPoolInput *deletePool = [AWSCognitoIdentityDeleteIdentityPoolInput new];
        deletePool.identityPoolId = identityPool.identityPoolId;
        return [cib deleteIdentityPool:deletePool];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testDeleteIdentityPoolFailed {
    AWSCognitoIdentity *cib = [AWSCognitoIdentity CognitoIdentityForKey:AWSTestUtilityCognitoIdentityServiceKey];
    AWSCognitoIdentityDeleteIdentityPoolInput *deletePool = [AWSCognitoIdentityDeleteIdentityPoolInput new];
    deletePool.identityPoolId = @"us-east-1:aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"; //Non-existent PoolId

    [[[cib deleteIdentityPool:deletePool] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"expect error but got nil");
        XCTAssertEqual(AWSCognitoIdentityErrorResourceNotFound, task.error.code, @"expected AWSCognitoIdentityErrorResourceNotFound but got:%ld",(long)task.error.code);
        return nil;

    }] waitUntilFinished];
}

- (void)testUpdateIdentityPoolPoolFailed {
    AWSCognitoIdentity *cib = [AWSCognitoIdentity CognitoIdentityForKey:AWSTestUtilityCognitoIdentityServiceKey];

    AWSCognitoIdentityIdentityPool *updatePoolInput = [AWSCognitoIdentityIdentityPool new];
    updatePoolInput.identityPoolId = @"us-east-1:aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"; //Non-existent PoolId
    updatePoolInput.identityPoolName = @"a new pool name";

    [[[cib updateIdentityPool:updatePoolInput] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error, @"expect error but got nil");

        XCTAssertEqual(AWSCognitoIdentityErrorResourceNotFound, task.error.code, @"expected AWSCognitoIdentityErrorResourceNotFound but got:%ld",(long)task.error.code);
        return nil;
    }] waitUntilFinished];
}


- (void)testGetIdGetToken {
    AWSSTS *sts = [AWSSTS STSForKey:AWSTestUtilitySTSKey];
    AWSCognitoIdentity *cib = [AWSCognitoIdentity CognitoIdentityForKey:AWSTestUtilityCognitoIdentityServiceKey];

    __block AWSSTSAssumeRoleWithWebIdentityRequest *wifRequest = nil;

    AWSCognitoIdentityCreateIdentityPoolInput *createPool = [AWSCognitoIdentityCreateIdentityPoolInput new];
    createPool.identityPoolName = @"CIBiOSTestGetIdGetToken";
    createPool.allowUnauthenticatedIdentities = @YES;

    __block NSString *identityPoolId = nil;

    [[[[[cib createIdentityPool:createPool] continueWithBlock:^id(AWSTask *task) {
        AWSCognitoIdentityIdentityPool *identityPool = task.result;

        AWSCognitoIdentityGetIdInput *getId = [AWSCognitoIdentityGetIdInput new];
        getId.accountId = @"335750469596";
        identityPoolId = identityPool.identityPoolId;
        getId.identityPoolId = identityPool.identityPoolId;

        return [cib getId:getId];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCognitoIdentityGetIdResponse class]]);
        }

        AWSCognitoIdentityGetIdResponse *idResult = task.result;

        AWSCognitoIdentityGetOpenIdTokenInput *getToken = [AWSCognitoIdentityGetOpenIdTokenInput new];
        getToken.identityId = idResult.identityId;

        return [cib getOpenIdToken:getToken];

    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCognitoIdentityGetOpenIdTokenResponse class]]);
        }

        AWSCognitoIdentityGetOpenIdTokenResponse *token = task.result;

        wifRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
        wifRequest.roleArn = @"arn:aws:iam::335750469596:role/TEST_CIB_ROLE";
        wifRequest.webIdentityToken = token.token;
        wifRequest.roleSessionName = @"test";
        return  nil;
    }] waitUntilFinished];


    [[[sts assumeRoleWithWebIdentity:wifRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return nil;
    }] waitUntilFinished];

    AWSCognitoIdentityDeleteIdentityPoolInput *deletePool = [AWSCognitoIdentityDeleteIdentityPoolInput new];
    deletePool.identityPoolId = identityPoolId;
    [[cib deleteIdentityPool:deletePool] waitUntilFinished];
}

@end

#endif
