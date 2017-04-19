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

//
#if !AWS_TEST_BJS_INSTEAD

#import <XCTest/XCTest.h>
#import "AWSMobileAnalytics.h"
#import "AWSTestUtility.h"

FOUNDATION_EXPORT double    const AWSValueForceSubmissionWaitTime;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

@interface AWSAnalyticsTests : XCTestCase

@property (strong,nonatomic) NSString *identityPoolId;
@end

@implementation AWSAnalyticsTests
+ (void)setUp {
    [super setUp];

    AWSDDLogDebug(@"sleeping for %f seconds before AWSAnalyticsTests starts.", AWSValueForceSubmissionWaitTime);
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:AWSValueForceSubmissionWaitTime]];
}

- (void)setUp {
    [super setUp];
    
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    
    self.identityPoolId = credentialsJson[@"identityPoolId"];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAtomicCopy {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL* possibleCachesURL = [[fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    XCTAssertNotNil(possibleCachesURL);
    NSString *testCachesPath = [[possibleCachesURL path] stringByAppendingPathComponent:@"com.amazonaws.test"];
    NSError *error = nil;
    
    
    NSURL* possibleApplicationSupportURL = [[fileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    XCTAssertNotNil(possibleApplicationSupportURL);
    NSString *testAppSupportPath = [[possibleApplicationSupportURL path] stringByAppendingPathComponent:@"com.amazonaws.test"];
    error = nil;
    
    //clean up
    [fileManager removeItemAtPath:testCachesPath error:nil];
    [fileManager removeItemAtPath:testAppSupportPath error:nil];
    
    XCTAssertTrue([fileManager createDirectoryAtPath:testCachesPath withIntermediateDirectories:YES attributes:nil error:&error]);
    XCTAssertTrue([fileManager createDirectoryAtPath:testAppSupportPath withIntermediateDirectories:YES attributes:nil error:&error]);
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSDictionary *testDic = @{@"testID":uuid};
    error = nil;
    NSData *testData = [NSJSONSerialization dataWithJSONObject:testDic options:kNilOptions error:&error];
    XCTAssertNotNil(testData);
    XCTAssertNil(error);
    
    XCTAssertTrue([testData writeToFile:[testCachesPath stringByAppendingPathComponent:@"testFile"]  atomically:YES]);
    
    error = nil;
    BOOL result = [fileManager aws_atomicallyCopyItemAtURL:[NSURL fileURLWithPath:testCachesPath]
                                                     toURL:[NSURL fileURLWithPath:testAppSupportPath]
                                            backupItemName:@"com.amazonaws.MobileAnalytics.backupItem"
                                                     error:&error];
    if ( NO == result) {
        XCTFail(@"aws_atomicCopyItemAtURL failed. %@",error);
    }
    
    XCTAssertTrue([fileManager fileExistsAtPath:[testCachesPath stringByAppendingPathComponent:@"testFile"]]);
    XCTAssertTrue([fileManager fileExistsAtPath:[testAppSupportPath stringByAppendingPathComponent:@"testFile"]]);
    
    NSData *resultTestData = [NSData dataWithContentsOfFile:[testAppSupportPath stringByAppendingPathComponent:@"testFile"]];
    XCTAssertNotNil(resultTestData);
    XCTAssertEqualObjects(testData, resultTestData);
    error = nil;
    NSDictionary *resultTestDic = [NSJSONSerialization JSONObjectWithData:resultTestData options:kNilOptions error:&error];
    XCTAssertNotNil(resultTestDic);
    XCTAssertNil(error);
    
    NSString *resultUUID = resultTestDic[@"testID"];
    XCTAssertEqualObjects(uuid, resultUUID);
    
    
    //clean up
    [fileManager removeItemAtPath:testCachesPath error:nil];
    [fileManager removeItemAtPath:testAppSupportPath error:nil];
    
}

- (void)test_clientID_persistence {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    NSString *testAppId = [NSString stringWithFormat:@"appId-%@-%lld", NSStringFromSelector(_cmd), (int64_t)timeIntervalSinceReferenceDate];
    
    NSURL* possibleCachesURL = [[fileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    XCTAssertNotNil(possibleCachesURL);
    NSString *mobileAnalyticsCachesPath = [[possibleCachesURL path] stringByAppendingPathComponent:@"mobile-analytics"];
    NSString *appIDCachesPath = [mobileAnalyticsCachesPath stringByAppendingPathComponent:testAppId];
    NSString *prefCachesPath = [appIDCachesPath stringByAppendingPathComponent:@"preferences"];
    NSString *eventsFileCachesPath = [[appIDCachesPath stringByAppendingPathComponent:@"events"] stringByAppendingPathComponent:@"eventsFile"];
    
    NSURL* possibleAppSupportURL = [[fileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] objectAtIndex:0];
    XCTAssertNotNil(possibleAppSupportURL);
    NSString *mobileAnalyticsAppSupportPath = [[possibleAppSupportURL path] stringByAppendingPathComponent:@"com.amazonaws.MobileAnalytics"];
    NSString *appIDAppSupportPath = [mobileAnalyticsAppSupportPath stringByAppendingPathComponent:testAppId];
    NSString *prefAppSupportPath = [appIDAppSupportPath stringByAppendingPathComponent:@"preferences"];
    NSString *eventsFileAppSupportPath = [[appIDAppSupportPath stringByAppendingPathComponent:@"events"] stringByAppendingPathComponent:@"eventsFile"];
    
    
    
    //clean up testing folders
    //Remove "mobile-analytics" under NSCachesDirectory if exists
    [[NSFileManager defaultManager] removeItemAtPath:mobileAnalyticsCachesPath error:nil];
    //Remove "com.amazonaws.MobileAnalytics" under NSApplicationSupportDirectory if exists
    [[NSFileManager defaultManager] removeItemAtPath:mobileAnalyticsAppSupportPath error:nil];
    

    //Brand new installation of an App integrated with this RC should put both event cache and client id pref in the “NSApplicationSupportDirectory”, NOT “NSCachesDirectory”.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    XCTAssertNotNil([AWSMobileAnalytics mobileAnalyticsForAppId:testAppId identityPoolId:self.identityPoolId]);
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
#pragma clang dianostic pop
    XCTAssertTrue([fileManager fileExistsAtPath:appIDAppSupportPath]);
    XCTAssertTrue([fileManager fileExistsAtPath:prefAppSupportPath]);
    XCTAssertTrue([fileManager fileExistsAtPath:eventsFileAppSupportPath]);
    
    XCTAssertFalse([fileManager fileExistsAtPath:appIDCachesPath]);
    XCTAssertFalse([fileManager fileExistsAtPath:prefCachesPath]);
    XCTAssertFalse([fileManager fileExistsAtPath:eventsFileCachesPath]);
    
    
    /* Before upgrade, initialize with the old SDK, verify the event cache and client id both exist under “NSCachesDirectory” and 
     * mark the contents down for future comparison and make sure there are NOT any left-over “NSApplicationSupportDirectory" from 
     * previous tests to cause false positives.
     */
    
    //Mock Init with old SDK
    NSError *error = nil;
    XCTAssertTrue([fileManager createDirectoryAtPath:mobileAnalyticsCachesPath withIntermediateDirectories:YES attributes:nil error:&error]);
    XCTAssertNil(error);
    bool result = [fileManager replaceItemAtURL:[NSURL fileURLWithPath:appIDCachesPath]
                                  withItemAtURL:[NSURL fileURLWithPath:appIDAppSupportPath]
                                 backupItemName:nil
                                        options:NSFileManagerItemReplacementUsingNewMetadataOnly
                               resultingItemURL:nil
                                          error:&error];
    if ( NO == result) {
        XCTFail(@" replaceItem failed: %@",error);
    }
    XCTAssertFalse([fileManager fileExistsAtPath:appIDAppSupportPath]);
    XCTAssertFalse([fileManager fileExistsAtPath:prefAppSupportPath]);
    XCTAssertFalse([fileManager fileExistsAtPath:eventsFileAppSupportPath]);
    
    XCTAssertTrue([fileManager fileExistsAtPath:appIDCachesPath]);
    XCTAssertTrue([fileManager fileExistsAtPath:prefCachesPath]);
    XCTAssertTrue([fileManager fileExistsAtPath:eventsFileCachesPath]);
    
    NSData *preferencesData = [NSData dataWithContentsOfFile:prefCachesPath];
    XCTAssertNotNil(preferencesData);
    NSData *eventsFileData = [NSData dataWithContentsOfFile:eventsFileCachesPath];
    XCTAssertNotNil(eventsFileData);
    
    /* After upgrade, initialize with the RC, verify the event cache only exists under “NSApplicationSupportDirectory” but 
     * NOT under “NSCachesDirectory” while client id exists under both “NSApplicationSupportDirectory” and “NSCachesDirectory”.
     */
    [[AWSMobileAnalytics class] performSelector:@selector(removeCachedInstances)];
    XCTAssertNotNil([AWSMobileAnalytics mobileAnalyticsForAppId:testAppId identityPoolId:self.identityPoolId]);
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    
    XCTAssertTrue([fileManager fileExistsAtPath:appIDAppSupportPath]);
    XCTAssertTrue([fileManager fileExistsAtPath:prefAppSupportPath]);
    XCTAssertTrue([fileManager fileExistsAtPath:eventsFileAppSupportPath]);
    
    XCTAssertTrue([fileManager fileExistsAtPath:appIDCachesPath]);
    XCTAssertTrue([fileManager fileExistsAtPath:prefCachesPath]);
    XCTAssertFalse([fileManager fileExistsAtPath:eventsFileCachesPath]);
    
    // Verify the the contents you saved in step 1 matches with the contents you read out from “NSApplicationSupportDirectory”.
    XCTAssertEqualObjects(preferencesData, [NSData dataWithContentsOfFile:prefAppSupportPath]);
    
    /* Delete the client id from “NSApplicationSupportDirectory” but keep the event cache there (simulating the migration failed half way but some event cache was still moved), the RC should copy the client id over again from the “NSCachesDirectory”.
     */
    error = nil;
    XCTAssertTrue([fileManager removeItemAtPath:prefAppSupportPath error:&error]);
    XCTAssertNil(error);
    XCTAssertFalse([fileManager fileExistsAtPath:prefAppSupportPath]);
    
    [[AWSMobileAnalytics class] performSelector:@selector(removeCachedInstances)];
    XCTAssertNotNil([AWSMobileAnalytics mobileAnalyticsForAppId:testAppId identityPoolId:self.identityPoolId]);
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    XCTAssertEqualObjects(preferencesData, [NSData dataWithContentsOfFile:prefAppSupportPath]);
    
    /* Modify the client id saved in “NSCachesDirectory” to some bogus id, make sure the RC won’t read from there first. In other words, any request sent should be with the id saved in “NSApplicationSupportDirectory” NOT in “NSCachesDirectory” 
     */
    error = nil;
    NSMutableDictionary *prefDic = [NSJSONSerialization JSONObjectWithData:preferencesData
                                                                   options:NSJSONReadingMutableContainers error:&error];
    XCTAssertNil(error);
    NSString *correctClientID = prefDic[@"UniqueId"];
    XCTAssertNotNil(correctClientID);
    NSString *bogusClientID = @"bogus-id";
    
    prefDic[@"UniqueId"] = bogusClientID;
    error = nil;
    NSData *bogusPreferencesData = [NSJSONSerialization dataWithJSONObject:prefDic options:kNilOptions error:&error];
    XCTAssertNotNil(bogusPreferencesData);
    XCTAssertNil(error);
    
    XCTAssertTrue([bogusPreferencesData writeToFile:prefCachesPath atomically:YES]);
    [[AWSMobileAnalytics class] performSelector:@selector(removeCachedInstances)];
    AWSMobileAnalytics* analyticsObj = [AWSMobileAnalytics mobileAnalyticsForAppId:testAppId identityPoolId:self.identityPoolId];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    XCTAssertNotNil(analyticsObj);
    NSString *analyticsUniqueId = [[analyticsObj valueForKey:@"mobileAnalyticsContext"] valueForKey:@"uniqueId"];
    XCTAssertNotNil(analyticsUniqueId);
    XCTAssertEqualObjects(correctClientID, analyticsUniqueId);
    
    /* Upgrade on top of the app integrated with this RC (pretending we have RC2 goes out), make sure event cache and client id (including its contents) under “NSApplicationSupportDirectory” are persisted and client id under “NSCachesDirectory” is also persisted.
     */
    [[AWSMobileAnalytics class] performSelector:@selector(removeCachedInstances)];
    [AWSMobileAnalytics mobileAnalyticsForAppId:testAppId identityPoolId:self.identityPoolId];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    XCTAssertEqualObjects(preferencesData, [NSData dataWithContentsOfFile:prefAppSupportPath]);
    XCTAssertEqualObjects(bogusPreferencesData, [NSData dataWithContentsOfFile:prefCachesPath]);
    
    /* If user uninstalls the app integrated with this RC and reinstall either the old app integrated with old SDK and the app integrated with this RC again, a new client id will be created under “NSCachesDirectory”and “NSApplicationSupportDirectory” respectively.
     */
    
    error = nil;
    XCTAssert([[NSFileManager defaultManager] removeItemAtPath:mobileAnalyticsCachesPath error:&error]);
    XCTAssertNil(error);
    error = nil;
    XCTAssert([[NSFileManager defaultManager] removeItemAtPath:mobileAnalyticsAppSupportPath error:&error]);
    
    [[AWSMobileAnalytics class] performSelector:@selector(removeCachedInstances)];
    AWSMobileAnalytics* analyticsObj2 = [AWSMobileAnalytics mobileAnalyticsForAppId:testAppId identityPoolId:self.identityPoolId];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    XCTAssertNotNil(analyticsObj2);
    NSString *analyticsUniqueId2 = [[analyticsObj2 valueForKey:@"mobileAnalyticsContext"] valueForKey:@"uniqueId"];
    XCTAssertNotNil(analyticsUniqueId2);
    XCTAssertNotEqualObjects(correctClientID, analyticsUniqueId2);
    
    //clean up
    [[NSFileManager defaultManager] removeItemAtPath:mobileAnalyticsCachesPath error:nil];
    [[NSFileManager defaultManager] removeItemAtPath:mobileAnalyticsAppSupportPath error:nil];
    
#pragma clang diagnostic pop
}

- (void)test_createMobileAnalyticsInstanceOldConstructor {
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)]];
    XCTAssertNotNil([insights eventClient]);
}

- (void)test_createMobileAnalyticsInstance {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)] identityPoolId:self.identityPoolId];
#pragma cland diagnostic pop
    XCTAssertNotNil([insights eventClient]);

}

- (void)test_createMobileAnalyticsInstanceOldConstructor_WithDifferentAppId {
    AWSMobileAnalytics* insights1 = [AWSMobileAnalytics mobileAnalyticsForAppId:@"appId-1"];
    AWSMobileAnalytics* insights2 = [AWSMobileAnalytics mobileAnalyticsForAppId:@"appId-2"];
    XCTAssertNotEqual(insights1, insights2);
}

- (void)test_createMobileAnalyticsInstance_WithSameAppId_And_SameIdentityPool {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSMobileAnalytics* insights1 = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)] identityPoolId:self.identityPoolId];
    AWSMobileAnalytics* insights2 = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)] identityPoolId:self.identityPoolId];
#pragma clang diagnostic pop
    XCTAssertEqual(insights1, insights2);
}

- (void)test_createMobileAnalyticsInstance_WithSameAppId_And_DifferentIdentityPool {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSMobileAnalytics* insights1 = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)] identityPoolId:@"bogusId-1"];
    AWSMobileAnalytics* insights2 = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)] identityPoolId:@"bogusId-2"];
#pragma clang dianostic pop
    XCTAssertEqual(insights1, insights2);

}

- (void)test_createMobileAnalyticsInstance_WithDifferentAppId_And_SameIdentityPool {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSMobileAnalytics* insights1 = [AWSMobileAnalytics mobileAnalyticsForAppId:@"appId-1" identityPoolId:self.identityPoolId];
    AWSMobileAnalytics* insights2 = [AWSMobileAnalytics mobileAnalyticsForAppId:@"appId-2" identityPoolId:self.identityPoolId];
#pragma clang dianostic pop
    XCTAssertNotEqual(insights1, insights2);

}

- (void)test_createMobileAnalyticsInstance_WithOldConstructor_And_NewConstructor {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSMobileAnalytics* insights1 = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)] identityPoolId:self.identityPoolId];
    AWSMobileAnalytics* insights2 = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)]];
#pragma clang dianostic pop
    XCTAssertEqual(insights1, insights2);

}

- (void)test_createAndSubmitEventOldConstructor {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)]];
#pragma clang diagnostic pop
    XCTAssertNotNil([insights eventClient]);

    // Record when the user completes level 1
    // Get the event client from Insights instance.
    id<AWSMobileAnalyticsEventClient>  eventClient = insights.eventClient;

    // Create a level completion event.
    id<AWSMobileAnalyticsEvent>  level1Event = [eventClient createEventWithEventType:@"level1Complete"];

    // add an attribute to know what weapon the user completed the level with
    [level1Event addAttribute:@"sword" forKey:@"weaponUsed"];
    // add a metric to know how many coins the user collected in the level
    [level1Event addMetric:@105 forKey:@"coinsCollected"];

    // add a metric to know how long it took the user to complete the level
    [level1Event addMetric:@300 forKey:@"levelDuration"];

    // Record the level completion event.
    [eventClient recordEvent:level1Event];

    //submit the event
    [eventClient submitEvents];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    id deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient performSelector:@selector(batchedEvents) withObject:nil];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!, batchedEvent:\n%@",batchedEvents);
}

- (void)test_createAndSubmitEventMixNewAndOldConstructor {
    AWSMobileAnalytics* insightsNewConstructor = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)] identityPoolId:self.identityPoolId];
    AWSMobileAnalytics* insightsOldConstructor = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)]];
    XCTAssertNotNil([insightsNewConstructor eventClient]);
    XCTAssertEqual(insightsNewConstructor, insightsOldConstructor);

    // Record when the user completes level 1
    // Get the event client from Insights instance.
    id<AWSMobileAnalyticsEventClient>  eventClientNewConstructor = insightsNewConstructor.eventClient;
    id<AWSMobileAnalyticsEventClient>  eventClientOldConstructor = insightsOldConstructor.eventClient;
    XCTAssertEqual(eventClientNewConstructor, eventClientOldConstructor);

    // Create a level completion event.
    id<AWSMobileAnalyticsEvent>  level1Event = [eventClientNewConstructor createEventWithEventType:@"level1Complete"];

    // add an attribute to know what weapon the user completed the level with
    [level1Event addAttribute:@"sword" forKey:@"weaponUsed"];
    // add a metric to know how many coins the user collected in the level
    [level1Event addMetric:@105 forKey:@"coinsCollected"];

    // add a metric to know how long it took the user to complete the level
    [level1Event addMetric:@300 forKey:@"levelDuration"];

    // Record the level completion event.
    [eventClientNewConstructor recordEvent:level1Event];

    //submit the event
    [eventClientNewConstructor submitEvents];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    id deliveryClient = [insightsNewConstructor valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient performSelector:@selector(batchedEvents) withObject:nil];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!, batchedEvent:\n%@",batchedEvents);

    //call sumbitEvent again without waiting for ValueForceSubmissionWaitTime(default 60sec) will result submission request been ignored.
    id<AWSMobileAnalyticsEvent>  level2Event = [eventClientOldConstructor createEventWithEventType:@"level2Complete"];
    [level2Event addAttribute:@"apple" forKey:@"foodUsed"];
    [eventClientOldConstructor recordEvent:level2Event];

    //submit the event
    [eventClientOldConstructor submitEvents];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    XCTAssertNotEqual(0, [[[insightsOldConstructor valueForKey:@"deliveryClient"] performSelector:@selector(batchedEvents) withObject:nil] count], @"batchedEvents should not be empty");

    //will for waitTime expired.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:AWSValueForceSubmissionWaitTime+5]];

    //submit it again, should be successful this time
    [eventClientOldConstructor submitEvents];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    XCTAssertEqual(0, [[[insightsOldConstructor valueForKey:@"deliveryClient"] performSelector:@selector(batchedEvents) withObject:nil] count], @"batchedEvents is not empty,events delivery may have failed! , batchedEvent:\n%@",batchedEvents);
}

- (void)test_createAndSubmitEvent{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)] identityPoolId:self.identityPoolId];
    XCTAssertNotNil([insights eventClient]);

    // Record when the user completes level 1
    // Get the event client from Insights instance.
    id<AWSMobileAnalyticsEventClient>  eventClient = insights.eventClient;

    // Create a level completion event.
    id<AWSMobileAnalyticsEvent>  level1Event = [eventClient createEventWithEventType:@"level1Complete"];

    // add an attribute to know what weapon the user completed the level with
    [level1Event addAttribute:@"sword" forKey:@"weaponUsed"];
    // add a metric to know how many coins the user collected in the level
    [level1Event addMetric:@105 forKey:@"coinsCollected"];

    // add a metric to know how long it took the user to complete the level
    [level1Event addMetric:@300 forKey:@"levelDuration"];

    // Record the level completion event.
    [eventClient recordEvent:level1Event];

    //submit the event
    [eventClient submitEvents];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    id deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient performSelector:@selector(batchedEvents) withObject:nil];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!, batchedEvent:\n%@",batchedEvents);

    //call sumbitEvent again without waiting for ValueForceSubmissionWaitTime(default 60sec) will result submission request been ignored.
    id<AWSMobileAnalyticsEvent>  level2Event = [eventClient createEventWithEventType:@"level2Complete"];
    [level2Event addAttribute:@"apple" forKey:@"foodUsed"];
    [eventClient recordEvent:level2Event];

    //submit the event
    [eventClient submitEvents];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    XCTAssertNotEqual(0, [[[insights valueForKey:@"deliveryClient"] performSelector:@selector(batchedEvents) withObject:nil] count], @"batchedEvents should not be empty");

    //will for waitTime expired.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:AWSValueForceSubmissionWaitTime+5]];

    //submit it again, should be successful this time
    [eventClient submitEvents];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    XCTAssertEqual(0, [[[insights valueForKey:@"deliveryClient"] performSelector:@selector(batchedEvents) withObject:nil] count], @"batchedEvents is not empty,events delivery may have failed! , batchedEvent:\n%@",batchedEvents);
}

- (void)test_createAndSubmitMultipleEventsWithGlobalAttributes{

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)] identityPoolId:self.identityPoolId];
    XCTAssertNotNil([insights eventClient]);

    // Get the event client from Insights instance.
    id<AWSMobileAnalyticsEventClient>  eventClient = insights.eventClient;

    //Add global Attributes
    [eventClient addGlobalAttribute:@"globalAttributesValue1" forKey:@"globalKey1"];
    //Add global Metrics
    [eventClient addGlobalMetric:@111 forKey:@"globalMetric1"];
    //Add global Attributes for specific eventType
    [eventClient addGlobalAttribute:@"globalAttributesValue2" forKey:@"globalKey2" forEventType:@"level2Complete"];
    [eventClient addGlobalMetric:@222 forKey:@"globalMetric2" forEventType:@"level3Complete"];

    // Create and record event 1
    id<AWSMobileAnalyticsEvent>  level1Event = [eventClient createEventWithEventType:@"level1Complete"];
    [level1Event addAttribute:@"sword" forKey:@"weaponUsed"];
    [level1Event addMetric:@105 forKey:@"coinsCollected"];
    [level1Event addMetric:@300 forKey:@"levelDuration"];
    // Record the level completion event.
    [eventClient recordEvent:level1Event];

    // Create and record event 2
    id<AWSMobileAnalyticsEvent>  level2Event = [eventClient createEventWithEventType:@"level2Complete"];
    [level2Event addAttribute:@"apple" forKey:@"foodUsed"];
    [eventClient recordEvent:level2Event];

    //create and record event 3
    [eventClient recordEvent:[eventClient createEventWithEventType:@"level3Complete"]];

    //validate if global attributes are there
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    NSArray *batchedEvents = [[insights valueForKey:@"deliveryClient"] performSelector:@selector(batchedEvents) withObject:nil];
    for (NSString *jsonStr in batchedEvents) {
        NSDictionary *aEventDic = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
        if (![aEventDic[@"event_type"] isEqualToString:@"_session.start"] &&
            ![aEventDic[@"event_type"] isEqualToString:@"_session.stop"] &&
            ![aEventDic[@"event_type"] isEqualToString:@"_session.pause"] &&
            ![aEventDic[@"event_type"] isEqualToString:@"_session.resume"]) {
            XCTAssertEqualObjects(@"globalAttributesValue1", aEventDic[@"attributes"][@"globalKey1"], @"global attribute is missing in at least one of event");
            XCTAssertEqualObjects(@111, aEventDic[@"metrics"][@"globalMetric1"], @"global metric is missing in the at least one of event");
        }

        if ([aEventDic[@"event_type"] isEqualToString:@"level2Complete"]) {
            XCTAssertEqualObjects(@"globalAttributesValue2", aEventDic[@"attributes"][@"globalKey2"], @"global attribute is missing in this event");
        }

        if ([aEventDic[@"event_type"] isEqualToString:@"level3Complete"]) {
            XCTAssertEqualObjects(@222, aEventDic[@"metrics"][@"globalMetric2"], @"global metric is missing in this event");
        }
    }

    //manually submit those events
    [eventClient submitEvents];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    XCTAssertEqual(0, [[[insights valueForKey:@"deliveryClient"] performSelector:@selector(batchedEvents) withObject:nil] count], @"batchedEvents is not empty,events delivery may have failed!");
}

- (void)test_createAndSubmitMonetizationEvent {

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)] identityPoolId:self.identityPoolId];
    XCTAssertNotNil([insights eventClient]);

    // get the event client for the builder
    id<AWSMobileAnalyticsEventClient> eventClient = insights.eventClient;

    // create a builder that can record purchase events from Apple
    AWSMobileAnalyticsAppleMonetizationEventBuilder* builder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:eventClient];

    // set the product id of the purchased item (obtained from the SKPurchaseTransaction object)
    [builder withProductId:@"sampleProductId1234567"];

    // set the item price and price locale (obtained from the SKProduct object)
    [builder withItemPrice:0.99
            andPriceLocale:[NSLocale currentLocale]];

    // set the quantity of item(s) purchased (obtained from the SKPurchaseTransaction object)
    [builder withQuantity:10];

    // set the transactionId of the transaction (obtained from the SKPurchaseTransaction object)
    [builder withTransactionId:@"transcationid1234567"];

    // build the monetization event
    id<AWSMobileAnalyticsEvent> purchaseEvent = [builder build];

    // add any additional metrics/attributes and record
    [eventClient recordEvent:purchaseEvent];

    //submit the event
    [eventClient submitEvents];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];

    id deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient performSelector:@selector(batchedEvents) withObject:nil];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!");

}

- (void)test_createAndSubmitEventCustomClientContext{
    //=====Notice============================
    // Custom ClientConfiguration muse be set before Init AWSMobileAnalytics
    // Modification of clientConfiguration has no effect after AWSMobileAnalytics has been initialized.

    //add custom attributes in clientContext
    AWSMobileAnalyticsConfiguration *mobileAnalyticsConfiguration = [AWSMobileAnalyticsConfiguration new];
    mobileAnalyticsConfiguration.attributes = @{@"legacy_id":@"1234567"};
    //overwrite app_title which will be originally read from value of @"CFBundleDisplayName" in app's plist.
    mobileAnalyticsConfiguration.environment.appName = @"myappname";

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)]
                                                                 configuration:mobileAnalyticsConfiguration
                                                               completionBlock:nil];
    XCTAssertNotNil([insights eventClient]);

    // Record when the user completes level 1
    // Get the event client from Insights instance.
    id<AWSMobileAnalyticsEventClient>  eventClient = insights.eventClient;

    // Create a level completion event.
    id<AWSMobileAnalyticsEvent>  level1Event = [eventClient createEventWithEventType:@"level1Complete"];

    // add an attribute to know what weapon the user completed the level with
    [level1Event addAttribute:@"sword" forKey:@"weaponUsed"];
    // add a metric to know how many coins the user collected in the level
    [level1Event addMetric:@105 forKey:@"coinsCollected"];

    // add a metric to know how long it took the user to complete the level
    [level1Event addMetric:@300 forKey:@"levelDuration"];

    // Record the level completion event.
    [eventClient recordEvent:level1Event];

    //submit the event
    [eventClient submitEvents];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    id deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient performSelector:@selector(batchedEvents) withObject:nil];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!");


}

- (void)test_createAndSubmitEventCustomServiceConfiguration {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials" ofType:@"json"];
    NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                      secretKey:credentialsJson[@"secretKey"]];
    AWSServiceConfiguration *customServiceConfig = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
    AWSMobileAnalyticsConfiguration *configuration = [AWSMobileAnalyticsConfiguration new];
    configuration.serviceConfiguration = customServiceConfig;
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)]
                                                                 configuration:configuration
                                                               completionBlock:nil];

    // Record when the user completes level 1
    // Get the event client from Insights instance.
    id<AWSMobileAnalyticsEventClient>  eventClient = insights.eventClient;

    // Create a level completion event.
    id<AWSMobileAnalyticsEvent>  level1Event = [eventClient createEventWithEventType:@"level1Complete"];

    // add an attribute to know what weapon the user completed the level with
    [level1Event addAttribute:@"sword" forKey:@"weaponUsed"];
    // add a metric to know how many coins the user collected in the level
    [level1Event addMetric:@105 forKey:@"coinsCollected"];

    // add a metric to know how long it took the user to complete the level
    [level1Event addMetric:@300 forKey:@"levelDuration"];

    // Record the level completion event.
    [eventClient recordEvent:level1Event];

    //submit the event
    [eventClient submitEvents];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    id deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient performSelector:@selector(batchedEvents) withObject:nil];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!");
}

- (void)test_createAndSubmitEventsWithDifferentAppId {

    NSMutableArray *insightsObjectsArray = [NSMutableArray new];
    for (int32_t i=0; i<10; i++) {
        NSString *appIdStr = [NSString stringWithFormat:@"testAppId%d",i];
        AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:appIdStr identityPoolId:self.identityPoolId];
        XCTAssertNotNil([insights eventClient]);
        [insights.eventClient submitEvents];
        [insightsObjectsArray addObject:insights];
    }

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];

    for (AWSMobileAnalytics *insights in insightsObjectsArray) {
        id deliveryClient = [insights valueForKey:@"deliveryClient"];
        NSArray *batchedEvents = [deliveryClient performSelector:@selector(batchedEvents) withObject:nil];
        //batchedEvents should be empty if all events has been sent successfully.
        XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!");
    }
}
@end
#pragma clang diagnostic pop
#endif
