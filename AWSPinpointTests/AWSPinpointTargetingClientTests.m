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
#import "AWSTestUtility.h"
#import "AWSPinpoint.h"

NSString *const AWSPinpointTargetingClientErrorDomain = @"com.amazonaws.AWSPinpointAnalyticsClientErrorDomain";

@interface AWSPinpointTargetingClientTests : XCTestCase
@property (nonatomic, strong) AWSPinpoint *pinpoint;
@property (nonatomic, strong) NSDictionary *credentialsJson;

@end

@implementation AWSPinpointTargetingClientTests


- (void)setUp {
    [super setUp];
    [[AWSLogger defaultLogger] setLogLevel:AWSLogLevelVerbose];

    [AWSTestUtility setupCognitoCredentialsProvider];
    

    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    self.credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    
    AWSPinpointConfiguration *configuration = [[AWSPinpointConfiguration alloc] initWithAppId:self.credentialsJson[@"pinpointAppId"] launchOptions:@{}];
    
    self.pinpoint = [AWSPinpoint pinpointWithConfiguration:configuration];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    @try {
        AWSPinpointTargetingClient *eventRecorder = [AWSPinpointTargetingClient new];
        XCTFail(@"Expected an exception to be thrown. %@", eventRecorder);
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, NSInternalInconsistencyException);
    }
}

- (void)testCurrentProfile {
    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertNotNil(profile);
    XCTAssertNotNil(profile.endpointId);
    XCTAssertTrue([profile.applicationId isEqualToString:self.credentialsJson[@"pinpointAppId"]]);
    XCTAssertTrue([profile.channelType isEqualToString:@"APNS"]);
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
    XCTAssertNil(profile.address);
    XCTAssertTrue(profile.effectiveDate > 0);
    XCTAssertNotNil(profile.location);
    XCTAssertNotNil(profile.demographic);
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.allAttributes);
    XCTAssertEqual([profile.allAttributes count], 0);
    XCTAssertNotNil(profile.allMetrics);
    XCTAssertEqual([profile.allMetrics count], 0);
    XCTAssertNotNil(profile.demographic.make);
    XCTAssertNotNil(profile.demographic.model);
    XCTAssertNotNil(profile.demographic.timezone);
    XCTAssertNotNil(profile.demographic.locale);
    XCTAssertNotNil(profile.demographic.appVersion);
    XCTAssertNotNil(profile.demographic.platform);
    XCTAssertNotNil(profile.demographic.platformVersion);
    
    UIDevice* currentDevice = [UIDevice currentDevice];
    NSString *autoUpdatingLocaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
    XCTAssertTrue([profile.demographic.make isEqualToString:@"apple"]);
    XCTAssertTrue([profile.demographic.model isEqualToString:[currentDevice model]]);
    XCTAssertTrue([profile.demographic.timezone isEqualToString:[[NSTimeZone systemTimeZone] name]]);
    XCTAssertTrue([profile.demographic.locale isEqualToString:autoUpdatingLocaleIdentifier]);
   // XCTAssertTrue([profile.demographic.appVersion isEqualToString:@"1.0"]);
    XCTAssertTrue([profile.demographic.platform isEqualToString:[currentDevice systemName]]);
    XCTAssertTrue([profile.demographic.platformVersion isEqualToString:[currentDevice systemVersion]]);
    
}

- (void)testUpdateEndpointProfile {
    [[[self.pinpoint.targetingClient updateEndpointProfile] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        
        return nil;
    }] waitUntilFinished];
}

- (void) testGlobalAttribute {
    [self.pinpoint.targetingClient addAttribute:@[@"GlobalAttr1"] forKey:@"GlobalAttr1"];
    
    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];

    XCTAssertNotNil(profile);
    XCTAssertNotNil(profile.endpointId);
    XCTAssertTrue([profile.applicationId isEqualToString:self.credentialsJson[@"pinpointAppId"]]);
    XCTAssertTrue([profile.channelType isEqualToString:@"APNS"]);
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
    XCTAssertNil(profile.address);
    XCTAssertTrue(profile.effectiveDate > 0);
    XCTAssertNotNil(profile.location);
    XCTAssertNotNil(profile.demographic);
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.allAttributes);
    XCTAssertEqual([profile.allAttributes count], 1);
    XCTAssertTrue([[[profile.allAttributes objectForKey:@"GlobalAttr1"] firstObject] isEqualToString:@"GlobalAttr1"]);
    XCTAssertNotNil(profile.allMetrics);
    XCTAssertEqual([profile.allMetrics count], 0);
    XCTAssertNotNil(profile.demographic.make);
    XCTAssertNotNil(profile.demographic.model);
    XCTAssertNotNil(profile.demographic.timezone);
    XCTAssertNotNil(profile.demographic.locale);
    XCTAssertNotNil(profile.demographic.appVersion);
    XCTAssertNotNil(profile.demographic.platform);
    XCTAssertNotNil(profile.demographic.platformVersion);
    
    UIDevice* currentDevice = [UIDevice currentDevice];
    NSString *autoUpdatingLocaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
    XCTAssertTrue([profile.demographic.make isEqualToString:@"apple"]);
    XCTAssertTrue([profile.demographic.model isEqualToString:[currentDevice model]]);
    XCTAssertTrue([profile.demographic.timezone isEqualToString:[[NSTimeZone systemTimeZone] name]]);
    XCTAssertTrue([profile.demographic.locale isEqualToString:autoUpdatingLocaleIdentifier]);
    //XCTAssertTrue([profile.demographic.appVersion isEqualToString:@"1.0"]);
    XCTAssertTrue([profile.demographic.platform isEqualToString:[currentDevice systemName]]);
    XCTAssertTrue([profile.demographic.platformVersion isEqualToString:[currentDevice systemVersion]]);
    
    [self.pinpoint.targetingClient removeAttributeForKey:@"GlobalAttr1"];
    profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqual([profile.allAttributes count], 0);
    XCTAssertEqual([profile.allMetrics count], 0);
}

- (void) testGlobalAttributeValidation {
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addAttribute:nil forKey:@"GlobalAttr1"];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addAttribute:@[@"GlobalAttr1"] forKey:nil];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addAttribute:nil forKey:nil];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addAttribute:@[@"TestKeyLength0"] forKey:@""];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
}


- (void) testGlobalMetric {
    [self.pinpoint.targetingClient addMetric:@(123) forKey:@"GlobalMetr1"];
    
    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    
    XCTAssertNotNil(profile);
    XCTAssertNotNil(profile.endpointId);
    XCTAssertTrue([profile.applicationId isEqualToString:self.credentialsJson[@"pinpointAppId"]]);
    XCTAssertTrue([profile.channelType isEqualToString:@"APNS"]);
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
    XCTAssertNil(profile.address);
    XCTAssertTrue(profile.effectiveDate > 0);
    XCTAssertNotNil(profile.location);
    XCTAssertNotNil(profile.demographic);
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.allAttributes);
    XCTAssertEqual([profile.allAttributes count], 0);
    XCTAssertNotNil(profile.allMetrics);
    XCTAssertEqual([profile.allMetrics count], 1);
    XCTAssertEqual([[profile.allMetrics objectForKey:@"GlobalMetr1"] intValue], 123);
    XCTAssertNotNil(profile.demographic.make);
    XCTAssertNotNil(profile.demographic.model);
    XCTAssertNotNil(profile.demographic.timezone);
    XCTAssertNotNil(profile.demographic.locale);
    XCTAssertNotNil(profile.demographic.appVersion);
    XCTAssertNotNil(profile.demographic.platform);
    XCTAssertNotNil(profile.demographic.platformVersion);
    
    UIDevice* currentDevice = [UIDevice currentDevice];
    NSString *autoUpdatingLocaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
    XCTAssertTrue([profile.demographic.make isEqualToString:@"apple"]);
    XCTAssertTrue([profile.demographic.model isEqualToString:[currentDevice model]]);
    XCTAssertTrue([profile.demographic.timezone isEqualToString:[[NSTimeZone systemTimeZone] name]]);
    XCTAssertTrue([profile.demographic.locale isEqualToString:autoUpdatingLocaleIdentifier]);
   // XCTAssertTrue([profile.demographic.appVersion isEqualToString:@"1.0"]);
    XCTAssertTrue([profile.demographic.platform isEqualToString:[currentDevice systemName]]);
    XCTAssertTrue([profile.demographic.platformVersion isEqualToString:[currentDevice systemVersion]]);
    
    [self.pinpoint.targetingClient removeMetricForKey:@"GlobalMetr1"];
    profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqual([profile.allAttributes count], 0);
    XCTAssertEqual([profile.allMetrics count], 0);
}

- (void) testGlobalMetricValidation {
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addMetric:nil forKey:@"GlobalMetr1"];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addMetric:@(1) forKey:nil];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addMetric:nil forKey:nil];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
    
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
        [self.pinpoint.targetingClient addMetric:@(1) forKey:@""];
#pragma clang diagnostic pop
        
        XCTFail(@"Expected an exception to be thrown. Insert nil parameter");
    }
    @catch (NSException *exception) {
        XCTAssertEqualObjects(exception.name, AWSPinpointTargetingClientErrorDomain);
    }
}

- (void) testGlobalAttributeAndMetric {
    [self.pinpoint.targetingClient addAttribute:@[@"GlobalAttr1"] forKey:@"GlobalAttr1"];
    [self.pinpoint.targetingClient addMetric:@(123) forKey:@"GlobalMetr1"];
    
    AWSPinpointEndpointProfile *profile = [self.pinpoint.targetingClient currentEndpointProfile];
    
    XCTAssertNotNil(profile);
    XCTAssertNotNil(profile.endpointId);
    XCTAssertTrue([profile.applicationId isEqualToString:self.credentialsJson[@"pinpointAppId"]]);
    XCTAssertTrue([profile.channelType isEqualToString:@"APNS"]);
    XCTAssertTrue([profile.optOut isEqualToString:@"ALL"]);
    XCTAssertNil(profile.address);
    XCTAssertTrue(profile.effectiveDate > 0);
    XCTAssertNotNil(profile.location);
    XCTAssertNotNil(profile.demographic);
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.allAttributes);
    XCTAssertEqual([profile.allAttributes count], 1);
    XCTAssertTrue([[[profile.allAttributes objectForKey:@"GlobalAttr1"] firstObject] isEqualToString:@"GlobalAttr1"]);
    XCTAssertNotNil(profile.allMetrics);
    XCTAssertEqual([profile.allMetrics count], 1);
    XCTAssertEqual([[profile.allMetrics objectForKey:@"GlobalMetr1"] intValue], 123);
    XCTAssertNotNil(profile.demographic.make);
    XCTAssertNotNil(profile.demographic.model);
    XCTAssertNotNil(profile.demographic.timezone);
    XCTAssertNotNil(profile.demographic.locale);
    XCTAssertNotNil(profile.demographic.appVersion);
    XCTAssertNotNil(profile.demographic.platform);
    XCTAssertNotNil(profile.demographic.platformVersion);
    
    UIDevice* currentDevice = [UIDevice currentDevice];
    NSString *autoUpdatingLocaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
    XCTAssertTrue([profile.demographic.make isEqualToString:@"apple"]);
    XCTAssertTrue([profile.demographic.model isEqualToString:[currentDevice model]]);
    XCTAssertTrue([profile.demographic.timezone isEqualToString:[[NSTimeZone systemTimeZone] name]]);
    XCTAssertTrue([profile.demographic.locale isEqualToString:autoUpdatingLocaleIdentifier]);
    //XCTAssertTrue([profile.demographic.appVersion isEqualToString:@"1.0"]);
    XCTAssertTrue([profile.demographic.platform isEqualToString:[currentDevice systemName]]);
    XCTAssertTrue([profile.demographic.platformVersion isEqualToString:[currentDevice systemVersion]]);
    
    [self.pinpoint.targetingClient removeAttributeForKey:@"GlobalAttr1"];
    [self.pinpoint.targetingClient removeMetricForKey:@"GlobalMetr1"];
    profile = [self.pinpoint.targetingClient currentEndpointProfile];
    XCTAssertEqual([profile.allAttributes count], 0);
    XCTAssertEqual([profile.allMetrics count], 0);
}

@end
