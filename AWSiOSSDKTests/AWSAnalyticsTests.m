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
#if AWS_TEST_ANALYTICS

#import <XCTest/XCTest.h>
#import "AWSCore.h"
#import "AZLogging.h"

#import "AWSMobileAnalyticsDeliveryClient.h"

@interface AWSAnalyticsTests : XCTestCase

@end

@implementation AWSAnalyticsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_createMobileAnalyticsInstance
{
    AWSMobileAnalytics* insights = [AWSMobileAnalytics defaultMobileAnalyticsWithAppNamespace:@"newuniqueid"];
    XCTAssertNotNil([insights eventClient]);
}

- (void)test_createAndSubmitEvent{

    AWSMobileAnalytics* insights = [AWSMobileAnalytics defaultMobileAnalyticsWithAppNamespace:@"newuniqueid"];
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
    
    //ValueForceSubmissionWaitTime is 60 sec. need to wait before forceSubmitEvents take effect.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:65]];
    
    //submit the event
    [eventClient submitEvents];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient batchedEvents];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!");
}

- (void)test_createAndSubmitMonetizationEvent {
    
    AWSMobileAnalytics* insights = [AWSMobileAnalytics defaultMobileAnalyticsWithAppNamespace:@"newuniqueid"];
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
    
    //ValueForceSubmissionWaitTime is 60 sec. need to wait before forceSubmitEvents take effect.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:65]];
    
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
    [AWSMobileAnalyticsClientConfiguration defaultClientConfiguration].attributes = @{@"legacy_id":@"1234567"};
    //overwrite app_title which will be originally read from value of @"CFBundleDisplayName" in app's plist.
    [AWSMobileAnalyticsClientConfiguration defaultClientConfiguration].environment.appName = @"myappname";
    
    
    AWSMobileAnalytics* insights = [AWSMobileAnalytics defaultMobileAnalyticsWithAppNamespace:@"newuniqueid"];
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
    
    //ValueForceSubmissionWaitTime is 60 sec. need to wait before forceSubmitEvents take effect.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:65]];
    
    //submit the event
    [eventClient submitEvents];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient batchedEvents];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!");

    
}

- (void)test_createAndSubmitEventCustomServiceConfiguration{
    
    AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
    AWSServiceConfiguration *customServiceConfig = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                                 credentialsProvider:credentialsProvider];
    
    
    AWSEventRecorderService *ers = [[AWSEventRecorderService alloc] initWithConfiguration:customServiceConfig];
    
    AWSMobileAnalytics* insights = [AWSMobileAnalytics mobileAnalyticsWithEventRecorderService:ers appNamespace:@"someuniqueid2" completionBlock:nil];
    
    
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
    
    //ValueForceSubmissionWaitTime is 60 sec. need to wait before forceSubmitEvents take effect.
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:65]];
    
    //submit the event
    [eventClient submitEvents];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
    id<AWSMobileAnalyticsDeliveryClient> deliveryClient = [insights valueForKey:@"deliveryClient"];
    NSArray *batchedEvents = [deliveryClient batchedEvents];
    //batchedEvents should be empty if all events has been sent successfully.
    XCTAssertEqual(0, [batchedEvents count], @"batchedEvents is not empty,events delivery may have failed!");

    
}

@end

#endif