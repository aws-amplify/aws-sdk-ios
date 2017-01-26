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

static NSString *AWSClockSkewTestsSTSKey = @"AWSClockSkewTestsSTSKey";

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];

    if (![AWSSTS STSForKey:AWSClockSkewTestsSTSKey]) {
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                              ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                          secretKey:credentialsJson[@"secretKey"]];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                             credentialsProvider:credentialsProvider];
        [AWSSTS registerSTSWithConfiguration:configuration
                                      forKey:AWSClockSkewTestsSTSKey];
    }

    [AWSTestUtility setupSwizzling];
}

- (void)tearDown {
    [super tearDown];

    [AWSTestUtility revertSwizzling];
}

// ERS Test
/*
#if !AWS_TEST_BJS_INSTEAD
-(void)testClockSkewERS {
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSMobileAnalyticsERS *ers = [AWSMobileAnalyticsERS defaultMobileAnalyticsERS];
    XCTAssertNotNil(ers);

    AWSMobileAnalyticsERSPutEventsInput *putEventInput = [AWSMobileAnalyticsERSPutEventsInput new];


    AWSMobileAnalyticsERSEvent *eventOne = [AWSMobileAnalyticsERSEvent new];

    eventOne.attributes = @{};
    eventOne.version = @"v2.0";
    eventOne.eventType = @"_session.start";
    eventOne.timestamp = [[NSDate date] aws_stringValue:AWSDateISO8601DateFormat3];

    AWSMobileAnalyticsERSSession *serviceSession = [AWSMobileAnalyticsERSSession new];
    serviceSession.identifier = @"SMZSP1G8-21c9ac01-20140604-171714026";
    serviceSession.startTimestamp = [[NSDate date] aws_stringValue:AWSDateISO8601DateFormat3];

    eventOne.session = serviceSession;

    putEventInput.events = @[eventOne];

    NSDictionary *clientContext = @{@"client": @{@"app_package_name": @"MT3T3XMSMZSP1G8",
                                                 @"app_version_name":@"v1.2",
                                                 @"app_version_code":@"3",
                                                 @"app_title":[NSNull null],
                                                 @"client_id":@"0a877e9d-c7c0-4269-b138-cb3f21c9ac01"
                                                 },
                                    @"env" : @{@"model": @"iPhone Simulator",
                                               @"make":@"Apple",
                                               @"platform":@"IOS",
                                               @"platform_version":@"4.3.1",
                                               @"locale":@"en-US"},
                                    @"custom" : @{},
                                    };
    NSString *clientContextJsonString = [[NSString alloc] initWithData: [NSJSONSerialization dataWithJSONObject:clientContext options:0 error:nil] encoding:NSUTF8StringEncoding];

    putEventInput.clientContext = clientContextJsonString;

    [[[ers putEvents:putEventInput] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error, @"The request failed. error: [%@]", task.error);

        return nil;

    }] waitUntilFinished ];


}
#endif
*/
//STS Test
-(void)testClockSkewSTS
{
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSSTS *sts = [AWSSTS STSForKey:AWSClockSkewTestsSTSKey];
    XCTAssertNotNil(sts);

    AWSSTSGetSessionTokenRequest *getSessionTokenRequest = [AWSSTSGetSessionTokenRequest new];
    getSessionTokenRequest.durationSeconds = @900;

    [[[sts getSessionToken:getSessionTokenRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            AWSSTSGetSessionTokenResponse *getSessionTokenResponse = task.result;
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
    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSCognitoIdentity *cib = [AWSCognitoIdentity defaultCognitoIdentity];
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
