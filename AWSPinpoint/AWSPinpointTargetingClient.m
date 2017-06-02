/*
 Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at
 
 http://aws.amazon.com/apache2.0
 
 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSPinpointTargetingClient.h"
#import "AWSPinpointEndpointProfile.h"
#import "AWSPinpointDateUtils.h"
#import "AWSPinpointNotificationManager.h"
#import "AWSPinpointEndpointProfile.h"
#import "AWSPinpointContext.h"
#import "AWSPinpointTargetingService.h"
#import "AWSPinpointConfiguration.h"

NSString *const AWSPinpointEndpointAttributesKey = @"AWSPinpointEndpointAttributesKey";
NSString *const AWSPinpointEndpointMetricsKey = @"AWSPinpointEndpointMetricsKey";
NSString *const AWSPinpointTargetingClientErrorDomain = @"com.amazonaws.AWSPinpointAnalyticsClientErrorDomain";

@interface AWSPinpointTargetingClient()

@property (nonatomic) AWSPinpointContext *context;
@property (nonatomic) NSMutableArray* endpointObservers;
@property (nonatomic) NSMutableDictionary* globalAttributes;
@property (nonatomic) NSMutableDictionary* globalMetrics;

@end

@implementation AWSPinpointTargetingClient

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"You must not initialize this class directly. Access the AWSPinpointTargetingClient from AWSPinpoint."
                                 userInfo:nil];
}

- (instancetype)initWithContext:(AWSPinpointContext *) context {
    if (self = [super init]) {
        _context = context;
        NSDictionary *customAttributes = [[NSUserDefaults standardUserDefaults] objectForKey:AWSPinpointEndpointAttributesKey];
        _globalAttributes = [[NSMutableDictionary alloc] initWithDictionary:customAttributes];
        NSDictionary *customMetrics = [[NSUserDefaults standardUserDefaults] objectForKey:AWSPinpointEndpointMetricsKey];
        _globalMetrics = [[NSMutableDictionary alloc] initWithDictionary:customMetrics];
    }
    
    return self;
}

- (AWSPinpointEndpointProfile *) currentEndpointProfile {
    AWSPinpointEndpointProfile *endpointProfile = [[AWSPinpointEndpointProfile alloc] initWithContext: self.context];

    //Add attributes
    if (self.globalAttributes.count > 0) {
        AWSDDLogVerbose(@"Applying Global Endpoint Attributes: %@", self.globalAttributes);
        for (NSString *key in [self.globalAttributes allKeys]) {
            [endpointProfile addAttribute:[self.globalAttributes objectForKey:key] forKey:key];
        }
    }
    
    if (self.globalMetrics.count > 0) {
        AWSDDLogVerbose(@"Applying Global Endpoint Metrics: %@", self.globalMetrics);
        for (NSString *key in [self.globalMetrics allKeys]) {
            [endpointProfile addMetric:[self.globalMetrics objectForKey:key] forKey:key];
        }
    }
    
    return endpointProfile;
}

#pragma mark - Endpoint Client -
- (nonnull AWSTask *)updateEndpointProfile:(nonnull AWSPinpointEndpointProfile*) endpointProfile {
    
    //Add attributes
    if (self.globalAttributes.count > 0) {
        AWSDDLogVerbose(@"Applying Global Endpoint Attributes: %@", self.globalAttributes);
        for (NSString *key in [self.globalAttributes allKeys]) {
            [endpointProfile addAttribute:[self.globalAttributes objectForKey:key] forKey:key];
        }
    }
    
    if (self.globalMetrics.count > 0) {
        AWSDDLogVerbose(@"Applying Global Endpoint Metrics: %@", self.globalMetrics);
        for (NSString *key in [self.globalMetrics allKeys]) {
            [endpointProfile addMetric:[self.globalMetrics objectForKey:key] forKey:key];
        }
    }
    
    return [self executeUpdate:endpointProfile];
}

- (AWSTask *)updateEndpointProfile {
    return [self executeUpdate:[self currentEndpointProfile]];
}

- (AWSTask *)executeUpdate:(AWSPinpointEndpointProfile *) endpointProfile {
    return [[self.context.targetingService updateEndpoint:[self updateEndpointRequestForEndpoint:endpointProfile]] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (task.error) {
            AWSDDLogError(@"Unable to successfully update endpoint. Error Message:%@", task.error);
            return task;
        } else {
            AWSDDLogVerbose(@"Endpoint Updated Successfully! %@", task.result);
            return task;
        }
    }];
}

- (void) verifyMinimumLengthForKey:(NSString*) key {
    if (key.length < 1) {
        @throw [NSException exceptionWithName:AWSPinpointTargetingClientErrorDomain
                                       reason:@"Attributes and Metrics must have a key of length 1 and 50"
                                     userInfo:nil];
    }
}

- (void)addAttribute:(NSArray *)theValue
                    forKey:(NSString *)theKey {
    if (theValue == nil) {
        @throw [NSException exceptionWithName:AWSPinpointTargetingClientErrorDomain
                                       reason:@"Nil value provided to addGlobalAttribute"
                                     userInfo:nil];
    }
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointTargetingClientErrorDomain
                                       reason:@"Nil key provided to addGlobalAttribute"
                                     userInfo:nil];
    } else {
        [self verifyMinimumLengthForKey:theKey];
    }
    
    @synchronized(self) {
        //Save value to disk
        [self.globalAttributes setValue:theValue forKey:theKey];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.globalAttributes forKey:AWSPinpointEndpointAttributesKey];
        [userDefaults synchronize];
    }
}

- (void)removeAttributeForKey:(NSString *) theKey {
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointTargetingClientErrorDomain
                                       reason:@"Nil key provided to removeGlobalAttributeForKey"
                                     userInfo:nil];
    }
    
    @synchronized(self) {
        [self.globalAttributes removeObjectForKey:theKey];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.globalAttributes forKey:AWSPinpointEndpointAttributesKey];
        [userDefaults synchronize];
    }
}

- (void)addMetric:(NSNumber *)theValue
                 forKey:(NSString *)theKey {
    if (theValue == nil) {
        @throw [NSException exceptionWithName:AWSPinpointTargetingClientErrorDomain
                                       reason:@"Nil value provided to addGlobalMetric"
                                     userInfo:nil];
    }
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointTargetingClientErrorDomain
                                       reason:@"Nil key provided to addGlobalMetric"
                                     userInfo:nil];
    } else {
        [self verifyMinimumLengthForKey:theKey];
    }
    
    @synchronized(self) {
        [self.globalMetrics setValue:theValue forKey:theKey];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.globalMetrics forKey:AWSPinpointEndpointMetricsKey];
        [userDefaults synchronize];
    }
}

- (void)removeMetricForKey:(NSString *) theKey {
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointTargetingClientErrorDomain
                                       reason:@"Nil key provided to removeGlobalMetric"
                                     userInfo:nil];
    }
    
    @synchronized(self) {
        [self.globalMetrics removeObjectForKey:theKey];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.globalMetrics forKey:AWSPinpointEndpointMetricsKey];
        [userDefaults synchronize];
    }
}


- (AWSPinpointTargetingEndpointDemographic * ) endpointDemographicModelForDemographic:(AWSPinpointEndpointProfileDemographic *) demographic {
    AWSPinpointTargetingEndpointDemographic *demographicModel = [[AWSPinpointTargetingEndpointDemographic alloc] init];
    demographicModel.make = demographic.make;
    demographicModel.model = demographic.model;
    demographicModel.timezone = demographic.timezone;
    demographicModel.locale = demographic.locale;
    demographicModel.appVersion = demographic.appVersion;
    demographicModel.platform = demographic.platform;
    demographicModel.platformVersion = demographic.platformVersion;
    return demographicModel;
}

- (AWSPinpointTargetingEndpointLocation*) locationModelForLocation:(AWSPinpointEndpointProfileLocation *) location {
    AWSPinpointTargetingEndpointLocation *locationModel = [AWSPinpointTargetingEndpointLocation new];
    locationModel.latitude = location.latitude;
    locationModel.longitude = location.longitude;
    locationModel.postalCode = location.postalCode;
    locationModel.city = location.city;
    locationModel.region = location.region;
    locationModel.country = location.country;
    return locationModel;
}

- (AWSPinpointTargetingEndpointUser*) userModelForUser:(AWSPinpointEndpointProfileUser *) user {
    AWSPinpointTargetingEndpointUser *userModel = [AWSPinpointTargetingEndpointUser new];
    userModel.userId = user.userId;
    return userModel;
}

- (AWSPinpointTargetingUpdateEndpointRequest*) updateEndpointRequestForEndpoint:(AWSPinpointEndpointProfile *) endpoint {
    AWSPinpointTargetingUpdateEndpointRequest *updateEndpointRequest = [AWSPinpointTargetingUpdateEndpointRequest new];
    updateEndpointRequest.endpointId = endpoint.endpointId;
    updateEndpointRequest.applicationId = endpoint.applicationId;
    
    AWSPinpointTargetingEndpointRequest *endpointRequest =  [AWSPinpointTargetingEndpointRequest new];
    endpointRequest.channelType = AWSPinpointTargetingChannelTypeApns;
    endpointRequest.address = endpoint.address;
    endpointRequest.location = [self locationModelForLocation:endpoint.location];
    endpointRequest.demographic = [self endpointDemographicModelForDemographic:endpoint.demographic];
    endpointRequest.effectiveDate = [[NSDate date] aws_stringValue:AWSDateISO8601DateFormat3];
    endpointRequest.optOut = endpoint.optOut;
    endpointRequest.attributes = [endpoint allAttributes];
    endpointRequest.metrics = [endpoint allMetrics];
    endpointRequest.user = [self userModelForUser:endpoint.user];
    
    updateEndpointRequest.endpointRequest = endpointRequest;
    
    return updateEndpointRequest;
}

@end
