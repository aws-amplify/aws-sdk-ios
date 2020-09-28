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

#import <XCTest/XCTest.h>
#import "AWSCore.h"
#import "AWSTestUtility.h"

@interface AWSClockSkewTests : XCTestCase

@end

@implementation AWSClockSkewTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupSwizzling];
}

- (void)tearDown {
    [super tearDown];
    [AWSTestUtility revertSwizzling];
}

- (void)testClockSkewSTS {
    NSString *AWSClockSkewTestsSTSKey = @"AWSClockSkewTestsSTSKey";

    // Have to override the STS service region to handle non-USEast1 regions
    AWSRegionType region = [AWSTestUtility getRegionFromTestConfiguration];
    NSString *regionName = [AWSEndpoint regionNameFromType:region];
    NSString *regionalizedEndpointURL = [NSString stringWithFormat:@"https://sts.%@.amazonaws.com", regionName];
    AWSEndpoint *regionalizedEndpoint = [[AWSEndpoint alloc] initWithURLString:regionalizedEndpointURL];

    AWSBasicSessionCredentialsProvider *credentialsProvider = [AWSTestUtility getDefaultCredentialsProvider];

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:region
                                                                                    endpoint:regionalizedEndpoint
                                                                         credentialsProvider:credentialsProvider];

    [AWSSTS registerSTSWithConfiguration:configuration
                                  forKey:AWSClockSkewTestsSTSKey];

    AWSSTS *sts = [AWSSTS STSForKey:AWSClockSkewTestsSTSKey];
    XCTAssertNotNil(sts);

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    NSDictionary *packageConfig = [AWSTestUtility getIntegrationTestConfigurationForPackageId:@"sts"];
    NSString *testRoleArn = packageConfig[@"testRoleArn"];
    
    AWSSTSAssumeRoleRequest *assumeRoleRequest = [AWSSTSAssumeRoleRequest new];
    assumeRoleRequest.durationSeconds = @900;
    assumeRoleRequest.roleArn = testRoleArn;
    assumeRoleRequest.roleSessionName = @"testClockSkewSTS";

    [[[sts assumeRole:assumeRoleRequest] continueWithBlock:^id _Nullable(AWSTask<AWSSTSAssumeRoleResponse *> * _Nonnull task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        if (task.result) {
            AWSSTSAssumeRoleResponse *getSessionTokenResponse = task.result;
            XCTAssertTrue([getSessionTokenResponse.credentials.accessKeyId length] > 0);
            XCTAssertTrue([getSessionTokenResponse.credentials.secretAccessKey length] > 0);
            XCTAssertTrue([getSessionTokenResponse.credentials.sessionToken length] > 0);
            XCTAssertTrue([getSessionTokenResponse.credentials.expiration isKindOfClass:[NSDate class]]);
        }
        return nil;
    }] waitUntilFinished];
}

//Cognito Identity Service Test
#if !AWS_TEST_BJS_INSTEAD
-(void)testClockSkewCognitoIdentityService {
    [AWSTestUtility setupCognitoIdentityService];
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSCognitoIdentity *cib = [AWSCognitoIdentity CognitoIdentityForKey:AWSTestUtilityCognitoIdentityServiceKey];
    XCTAssertNotNil(cib);

    AWSCognitoIdentityListIdentityPoolsInput *listPools = [AWSCognitoIdentityListIdentityPoolsInput new];
    listPools.maxResults = @10;
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
#endif

@end
