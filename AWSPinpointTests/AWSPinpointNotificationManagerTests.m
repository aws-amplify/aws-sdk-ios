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
#import "OCMock.h"
#import "AWSTestUtility.h"
#import "AWSPinpoint.h"
#import "AWSPinpointNotificationManager.h"

@interface AWSPinpointAnalyticsClient()
@property (nonatomic, strong) NSDictionary* globalFeatureAttributes;
- (void) setFeatureAttributes:(NSDictionary*) attributes;
- (void) removeAllGlobalFeatureAttributes;
@end

@interface AWSPinpointNotificationManager()
- (void)addPinpointMetadataForEvent:(AWSPinpointEvent *) event
                   withNotification:(NSDictionary *) userInfo;
- (void)addGlobalPinpointMetadataForNotification:(NSDictionary *) userInfo;
- (NSString*)buildEventTypeFromUserInfo:(NSDictionary *) userInfo
                     withPushActionType:(AWSPinpointPushActionType) pushActionType;
@end

@interface AWSPinpointConfiguration()
@property (nonnull, strong) NSUserDefaults *userDefaults;
@end

@interface AWSPinpointNotificationManagerTests : XCTestCase
@property (nonatomic, strong) AWSPinpoint *pinpoint;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@property (nonatomic, strong) NSDictionary *campaignPushPayload;
@property (nonatomic, strong) NSDictionary *journeyPushPayload;

@end

@implementation AWSPinpointNotificationManagerTests

- (void)setUp {
    [super setUp];

    [[NSUserDefaults standardUserDefaults] removeSuiteNamed:@"AWSPinpointNotificationManagerTests"];
    self.userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"AWSPinpointNotificationManagerTests"];

    [AWSTestUtility setupCognitoCredentialsProvider];
    AWSPinpointConfiguration *configuration = [[AWSPinpointConfiguration alloc] initWithAppId:@"fakeAppId" launchOptions:@{}];
    configuration.userDefaults = self.userDefaults;
    configuration.enableAutoSessionRecording = NO;
    self.pinpoint = [AWSPinpoint pinpointWithConfiguration:configuration];

    _campaignPushPayload = @{
        @"data": @{
            @"pinpoint": @{
                @"campaign": @{
                    @"campaign_id": @"testCampaignId"
                }
            }
        }
    };

    _journeyPushPayload = @{
        @"data": @{
            @"pinpoint": @{
                @"journey": @{
                    @"journey_id": @"testJourneyId"
                }
            }
        }
    };
}

- (void)tearDown {
    [self.pinpoint.analyticsClient.eventRecorder removeAllEvents];
    [self.pinpoint.analyticsClient removeAllGlobalFeatureAttributes];
    [super tearDown];
}

- (void)testAddPinpointMetadataForCampaignEvent {
    AWSPinpointEvent *pushNotificationEvent = [self.pinpoint.analyticsClient createEventWithEventType:@"_campaign.received_foreground"];
    [_pinpoint.notificationManager addPinpointMetadataForEvent:pushNotificationEvent
                                              withNotification:self.campaignPushPayload];
    XCTAssertTrue([pushNotificationEvent.eventType isEqualToString:@"_campaign.received_foreground"]);
    XCTAssertTrue([pushNotificationEvent.allAttributes[@"campaign_id"] isEqualToString:@"testCampaignId"]);
}

- (void)testAddPinpointMetadataForJourneyEvent {
    AWSPinpointEvent *pushNotificationEvent = [self.pinpoint.analyticsClient createEventWithEventType:@"_journey.received_background"];
    [_pinpoint.notificationManager addPinpointMetadataForEvent:pushNotificationEvent
                                              withNotification:self.journeyPushPayload];
    XCTAssertTrue([pushNotificationEvent.eventType isEqualToString:@"_journey.received_background"]);
    XCTAssertTrue([pushNotificationEvent.allAttributes[@"journey_id"] isEqualToString:@"testJourneyId"]);
}

- (void)testAddPinpointMetadataForUnknownEvent {
    NSDictionary *userInfo = @{
        @"data": @{
            @"pinpoint": @{
                @"randomKey": @{
                    @"randomAttribute": @"randomValue"
                }
            }
        }
    };
    AWSPinpointEvent *pushNotificationEvent = [self.pinpoint.analyticsClient createEventWithEventType:@"_unknown.received_background"];
    [_pinpoint.notificationManager addPinpointMetadataForEvent:pushNotificationEvent
                                              withNotification:userInfo];
    XCTAssertEqual([pushNotificationEvent.allAttributes count], 0);
}

- (void)testAddGlobalPinpointMetadataForCampaignNotification {
    [_pinpoint.notificationManager addGlobalPinpointMetadataForNotification:self.campaignPushPayload];
    XCTAssertEqual([self.pinpoint.analyticsClient.globalFeatureAttributes count], 1);
    XCTAssertEqual(self.pinpoint.analyticsClient.globalFeatureAttributes[@"campaign_id"], @"testCampaignId");
}

- (void)testAddGlobalPinpointMetadataForJourneyNotification {
    [_pinpoint.notificationManager addGlobalPinpointMetadataForNotification:self.journeyPushPayload];
    XCTAssertEqual([self.pinpoint.analyticsClient.globalFeatureAttributes count], 1);
    XCTAssertEqual(self.pinpoint.analyticsClient.globalFeatureAttributes[@"journey_id"], @"testJourneyId");
}

- (void)testBuildEventType {
    NSString *eventType = [_pinpoint.notificationManager buildEventTypeFromUserInfo:self.campaignPushPayload withPushActionType:AWSPinpointPushActionTypeOpened];
    XCTAssertTrue([eventType isEqualToString:@"_campaign.opened_notification"]);

    eventType = [_pinpoint.notificationManager buildEventTypeFromUserInfo:self.campaignPushPayload withPushActionType:AWSPinpointPushActionTypeReceivedBackground];
    XCTAssertTrue([eventType isEqualToString:@"_campaign.received_background"]);

    eventType = [_pinpoint.notificationManager buildEventTypeFromUserInfo:self.campaignPushPayload withPushActionType:AWSPinpointPushActionTypeReceivedForeground];
    XCTAssertTrue([eventType isEqualToString:@"_campaign.received_foreground"]);

    eventType = [_pinpoint.notificationManager buildEventTypeFromUserInfo:self.journeyPushPayload withPushActionType:AWSPinpointPushActionTypeOpened];
    XCTAssertTrue([eventType isEqualToString:@"_journey.opened_notification"]);

    eventType = [_pinpoint.notificationManager buildEventTypeFromUserInfo:self.journeyPushPayload withPushActionType:AWSPinpointPushActionTypeReceivedBackground];
    XCTAssertTrue([eventType isEqualToString:@"_journey.received_background"]);

    eventType = [_pinpoint.notificationManager buildEventTypeFromUserInfo:self.journeyPushPayload withPushActionType:AWSPinpointPushActionTypeReceivedForeground];
    XCTAssertTrue([eventType isEqualToString:@"_journey.received_foreground"]);
}

@end
