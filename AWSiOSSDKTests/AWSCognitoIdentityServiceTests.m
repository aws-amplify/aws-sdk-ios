/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#if AWS_TEST_COGNITO_IDENTITY_SERVICE

#import <XCTest/XCTest.h>
#import "CognitoIdentityService.h"
#import "STS.h"

@interface AWSCognitoIdentityServiceTests : XCTestCase

@end

@implementation AWSCognitoIdentityServiceTests

+ (void)setUp {
    [super setUp];

    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
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
    AWSCognitoIdentityService *cib = [AWSCognitoIdentityService defaultCognitoIdentityService];

    AWSCognitoIdentityServiceListIdentityPoolsInput *listPools = [AWSCognitoIdentityServiceListIdentityPoolsInput new];
    listPools.maxResults = [NSNumber numberWithInt:10];
    [[[cib listIdentityPools:listPools] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCognitoIdentityServiceListIdentityPoolsResponse class]]);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testCreateDeleteIdentityPool {
    AWSCognitoIdentityService *cib = [AWSCognitoIdentityService defaultCognitoIdentityService];

    AWSCognitoIdentityServiceCreateIdentityPoolInput *createPool = [AWSCognitoIdentityServiceCreateIdentityPoolInput new];
    createPool.identityPoolName = @"CIBiOSTestCreateDeleteIdentityPool";
    createPool.allowUnauthenticatedIdentities = @YES;

    [[[[cib createIdentityPool:createPool] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCognitoIdentityServiceIdentityPool class]]);
        }

        AWSCognitoIdentityServiceIdentityPool *identityPool = task.result;

        AWSCognitoIdentityServiceDeleteIdentityPoolInput *deletePool = [AWSCognitoIdentityServiceDeleteIdentityPoolInput new];
        deletePool.identityPoolId = identityPool.identityPoolId;
        return [cib deleteIdentityPool:deletePool];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testDeleteIdentityPoolFailed {
    AWSCognitoIdentityService *cib = [AWSCognitoIdentityService defaultCognitoIdentityService];
    AWSCognitoIdentityServiceDeleteIdentityPoolInput *deletePool = [AWSCognitoIdentityServiceDeleteIdentityPoolInput new];
    deletePool.identityPoolId = @"us-east-1:aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"; //Non-existent PoolId

    [[[cib deleteIdentityPool:deletePool] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error, @"expect error but got nil");
        XCTAssertEqual(AWSCognitoIdentityServiceErrorResourceNotFound, task.error.code, @"expected AWSCognitoIdentityServiceErrorResourceNotFound but got:%ld",(long)task.error.code);
        return nil;

    }] waitUntilFinished];
}

- (void)testUpdateIdentityPoolPoolFailed {
    AWSCognitoIdentityService *cib = [AWSCognitoIdentityService defaultCognitoIdentityService];

    AWSCognitoIdentityServiceIdentityPool *updatePoolInput = [AWSCognitoIdentityServiceIdentityPool new];
    updatePoolInput.identityPoolId = @"us-east-1:aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"; //Non-existent PoolId
    updatePoolInput.identityPoolName = @"a new pool name";

    [[[cib updateIdentityPool:updatePoolInput] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error, @"expect error but got nil");

        XCTAssertEqual(AWSCognitoIdentityServiceErrorResourceNotFound, task.error.code, @"expected AWSCognitoIdentityServiceErrorResourceNotFound but got:%ld",(long)task.error.code);
        return nil;
    }] waitUntilFinished];
}


- (void)testGetIdGetToken {

    AWSSTS *sts = [AWSSTS defaultSTS];
    AWSCognitoIdentityService *cib = [AWSCognitoIdentityService defaultCognitoIdentityService];

    __block AWSSTSAssumeRoleWithWebIdentityRequest *wifRequest = nil;

    AWSCognitoIdentityServiceCreateIdentityPoolInput *createPool = [AWSCognitoIdentityServiceCreateIdentityPoolInput new];
    createPool.identityPoolName = @"CIBiOSTestGetIdGetToken";
    createPool.allowUnauthenticatedIdentities = @YES;

    __block NSString *identityPoolId = nil;

    [[[[[cib createIdentityPool:createPool] continueWithBlock:^id(BFTask *task) {
        AWSCognitoIdentityServiceIdentityPool *identityPool = task.result;

        AWSCognitoIdentityServiceGetIdInput *getId = [AWSCognitoIdentityServiceGetIdInput new];
        getId.accountId = @"335750469596";
        identityPoolId = identityPool.identityPoolId;
        getId.identityPoolId = identityPool.identityPoolId;

        return [cib getId:getId];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCognitoIdentityServiceGetIdResponse class]]);
        }

        AWSCognitoIdentityServiceGetIdResponse *idResult = task.result;

        AWSCognitoIdentityServiceGetOpenIdTokenInput *getToken = [AWSCognitoIdentityServiceGetOpenIdTokenInput new];
        getToken.identityId = idResult.identityId;

        return [cib getOpenIdToken:getToken];

    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCognitoIdentityServiceGetOpenIdTokenResponse class]]);
        }

        AWSCognitoIdentityServiceGetOpenIdTokenResponse *token = task.result;

        wifRequest = [AWSSTSAssumeRoleWithWebIdentityRequest new];
        wifRequest.roleArn = @"arn:aws:iam::335750469596:role/TEST_CIB_ROLE";
        wifRequest.webIdentityToken = token.token;
        wifRequest.roleSessionName = @"test";
        return  nil;
    }] waitUntilFinished];


    [[[sts assumeRoleWithWebIdentity:wifRequest] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return nil;
    }] waitUntilFinished];

    AWSCognitoIdentityServiceDeleteIdentityPoolInput *deletePool = [AWSCognitoIdentityServiceDeleteIdentityPoolInput new];
    deletePool.identityPoolId = identityPoolId;
    [[cib deleteIdentityPool:deletePool] waitUntilFinished];
}

@end

#endif
