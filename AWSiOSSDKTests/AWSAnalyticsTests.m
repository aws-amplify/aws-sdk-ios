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

//
#if !AWS_TEST_BJS_INSTEAD

#import <XCTest/XCTest.h>
#import "AWSCore.h"
#import "AWSTestUtility.h"

#import "AWSMobileAnalyticsDeliveryClient.h"
#import "AWSMobileAnalyticsConfigurationKeys.h"

@interface AWSAnalyticsTests : XCTestCase

@end

@implementation AWSAnalyticsTests
+ (void)setUp {
    [super setUp];
    
    NSLog(@"sleeping for %f seconds before AWSAnalyticsTests starts.",AWSValueForceSubmissionWaitTime);
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:AWSValueForceSubmissionWaitTime]];
}
- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_createMobileAnalyticsInstance {
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)]];
    XCTAssertNotNil([insights eventClient]);
}

- (void)test_createAndSubmitEvent{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)]];
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
    
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient batchedEvents];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!, batchedEvent:\n%@",batchedEvents);
    
    //call sumbitEvent again without waiting for ValueForceSubmissionWaitTime(default 60sec) will result submission request been ignored.
    id<AWSMobileAnalyticsEvent>  level2Event = [eventClient createEventWithEventType:@"level2Complete"];
    [level2Event addAttribute:@"apple" forKey:@"foodUsed"];
    [eventClient recordEvent:level2Event];
    
    //submit the event
    [eventClient submitEvents];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    XCTAssertNotEqual(0, [[[insights valueForKey:@"deliveryClient"] batchedEvents] count], @"batchedEvents should not be empty");
    
    //will for waitTime expired.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:AWSValueForceSubmissionWaitTime+5]];
    
    //submit it again, should be successful this time
    [eventClient submitEvents];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    XCTAssertEqual(0, [[[insights valueForKey:@"deliveryClient"] batchedEvents] count], @"batchedEvents is not empty,events delivery may have failed! , batchedEvent:\n%@",batchedEvents);
}

- (void)test_createAndSubmitMultipleEventsWithGlobalAttributes{
    
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)]];
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
    NSArray *batchedEvents = [[insights valueForKey:@"deliveryClient"] batchedEvents];
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
    XCTAssertEqual(0, [[[insights valueForKey:@"deliveryClient"] batchedEvents] count], @"batchedEvents is not empty,events delivery may have failed!");
}

- (void)test_createAndSubmitMonetizationEvent {

    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:[NSString stringWithFormat:@"appId-%@",NSStringFromSelector(_cmd)]];
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

    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient batchedEvents];
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
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient batchedEvents];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!");


}

- (void)test_createAndSubmitEventCustomServiceConfiguration {
    AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
    AWSServiceConfiguration *customServiceConfig = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
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
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient batchedEvents];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!");
}

- (void)test_createAndSUmbitEventsWithDifferentAppId {
    
    NSMutableArray *insightsObjectsArray = [NSMutableArray new];
    for (int32_t i=0; i<10; i++) {
        NSString *appIdStr = [NSString stringWithFormat:@"testAppId%d",i];
        AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsForAppId:appIdStr];
        XCTAssertNotNil([insights eventClient]);
        [insights.eventClient submitEvents];
        [insightsObjectsArray addObject:insights];
    }
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    for (AWSMobileAnalytics *insights in insightsObjectsArray) {
        id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [insights valueForKey:@"deliveryClient"];
        NSArray *batchedEvents = [deliveryClient batchedEvents];
        //batchedEvents should be empty if all events has been sent successfully.
        XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!");
    }
}
@end

#endif
