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

#import <AWSCore/AWSNSCodingUtilities.h>
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
NSString *const AWSPinpointEndpointProfileKey = @"AWSPinpointEndpointProfileKey";
NSString *const AWSPinpointTargetingClientErrorDomain = @"com.amazonaws.AWSPinpointAnalyticsClientErrorDomain";
NSString *const APNS_CHANNEL_TYPE = @"APNS";

@interface AWSPinpointTargetingClient()

@property (nonatomic, weak) AWSPinpointContext *context;

@property (nonatomic) NSMutableArray* endpointObservers;
@property (nonatomic) NSMutableDictionary* globalAttributes;
@property (nonatomic) NSMutableDictionary* globalMetrics;
@property (nonatomic) AWSPinpointEndpointProfile *endpointProfile;
@property (nonatomic, strong) AWSUICKeyChainStore *keychain;
@end

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@interface AWSPinpointEndpointProfile()
- (void) removeAllAttributes;
- (void) removeAllMetrics;
- (BOOL) isApplicationLevelOptOut:(AWSPinpointContext *) context;
- (void) updateEndpointProfileWithContext:(AWSPinpointContext *) context;
- (void) setEndpointOptOut:(BOOL) applicationLevelOptOut;
@end

@implementation AWSPinpointTargetingClient

- (instancetype) init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"You must not initialize this class directly. Access the AWSPinpointTargetingClient from AWSPinpoint."
                                 userInfo:nil];
}

- (instancetype) initWithContext:(AWSPinpointContext *) context {
    if (self = [super init]) {
        _context = context;
        _keychain = context.keychain;
        [self migrateLegacyKeyValueStore];
        [self initGlobalAttributes];
        [self initGlobalMetrics];
    }
    
    return self;
}

- (void)initGlobalAttributes {
    NSData *customAttributesData = [_keychain dataForKey:AWSPinpointEndpointAttributesKey];
    NSMutableDictionary *attributes = [_context.configuration.userDefaults objectForKey:AWSPinpointEndpointAttributesKey];
    
    if (customAttributesData != nil) {
        NSSet *allowableClasses = [[NSSet alloc] initWithObjects:[NSMutableString class],
                                   [NSDictionary class],
                                   [NSArray class],
                                   nil];
        NSError *decodingError;
        NSMutableDictionary *customAttributes = [AWSNSCodingUtilities versionSafeUnarchivedObjectOfClasses:allowableClasses fromData:customAttributesData error:&decodingError];
        if (decodingError) {
            AWSDDLogError(@"Error decoding global endpoint attributes: %@", decodingError);
            _globalAttributes = [[NSMutableDictionary alloc] init];
            return;
        }
        _globalAttributes = [[NSMutableDictionary alloc] initWithDictionary:customAttributes];
        
    } else if (attributes != nil) {
        _globalAttributes = [[NSMutableDictionary alloc] initWithDictionary:attributes];
    } else {
        _globalAttributes = [[NSMutableDictionary alloc] init];
    }
}

- (void) initGlobalMetrics {
    NSData *customMetricsData = [_keychain dataForKey:AWSPinpointEndpointMetricsKey];
    NSMutableDictionary *metrics = [_context.configuration.userDefaults objectForKey:AWSPinpointEndpointMetricsKey];
    
    if (customMetricsData != nil) {
        NSError *decodingError;
        NSMutableDictionary *customMetrics = [AWSNSCodingUtilities versionSafeMutableDictionaryFromData:customMetricsData error:&decodingError];
        if (decodingError) {
            AWSDDLogError(@"Error decoding global endpoint metrics: %@", decodingError);
            _globalMetrics = [[NSMutableDictionary alloc] init];
            return;
        }
        _globalMetrics = [[NSMutableDictionary alloc] initWithDictionary:customMetrics];
    } else if (metrics != nil) {
        _globalMetrics = [[NSMutableDictionary alloc] initWithDictionary:metrics];
    } else {
        _globalMetrics = [[NSMutableDictionary alloc] init];
    }
}

- (AWSPinpointEndpointProfile *) currentEndpointProfile {
    AWSPinpointEndpointProfile *localEndpointProfile;
    if (!self.endpointProfile) {
        NSData *endpointProfileData = [_keychain dataForKey:AWSPinpointEndpointProfileKey];
        if (endpointProfileData == nil) {
            endpointProfileData = [_context.configuration.userDefaults objectForKey:AWSPinpointEndpointProfileKey];
        }
        
        if (endpointProfileData != nil) {
            NSError *decodingError;
            localEndpointProfile = [AWSNSCodingUtilities versionSafeUnarchivedObjectOfClass:[AWSPinpointEndpointProfile class]
                                                                                   fromData:endpointProfileData
                                                                                      error:&decodingError];
            if (decodingError) {
                AWSDDLogError(@"Error decoding local endpoint profile: %@", decodingError);
            }

            if ([localEndpointProfile.applicationId isEqualToString:self.context.configuration.appId]) {
                // This is to verify that same appId is being used. Anyone can modify the plist and test with a different app id
                [localEndpointProfile removeAllMetrics];
                [localEndpointProfile removeAllAttributes];
            } else {
                @synchronized (self) {
                    [_keychain removeItemForKey:AWSPinpointEndpointProfileKey];
                    [_context.configuration.userDefaults removeObjectForKey:AWSPinpointEndpointProfileKey];
                    [_context.configuration.userDefaults synchronize];
                }
                localEndpointProfile = [[AWSPinpointEndpointProfile alloc] initWithContext: self.context];
            }
        } else {
            localEndpointProfile = [[AWSPinpointEndpointProfile alloc] initWithContext: self.context];
        }
    } else {
        localEndpointProfile = self.endpointProfile;
        [localEndpointProfile removeAllMetrics];
        [localEndpointProfile removeAllAttributes];
    }
    
    //This updates endpoint id, demograhpic information, address, debug mode and app id
    [localEndpointProfile updateEndpointProfileWithContext:self.context];
    //update opt outs
    BOOL applicationLevelOptOut = [localEndpointProfile isApplicationLevelOptOut:self.context];
    [localEndpointProfile setEndpointOptOut:applicationLevelOptOut];

    [self addMetricsAndAttributesToEndpointProfile:localEndpointProfile];

    return localEndpointProfile;
}

- (void) addMetricsAndAttributesToEndpointProfile:(AWSPinpointEndpointProfile *) localEndpointProfile {
    // Add attributes
    if (self.globalAttributes.count > 0) {
        AWSDDLogVerbose(@"Applying Global Endpoint Attributes: %@", self.globalAttributes);
        for (NSString *key in [self.globalAttributes allKeys]) {
            if ([[self.globalAttributes objectForKey:key] isKindOfClass:[NSArray class]]) {
                [localEndpointProfile addAttribute:[self.globalAttributes objectForKey:key] forKey:key];
            } else {
                AWSDDLogWarn(@"Metric should be of NSArray type: %@, Skipping...", [self.globalAttributes objectForKey:key]);
            }
        }
    }
    
    // Add metrics
    if (self.globalMetrics.count > 0) {
        AWSDDLogVerbose(@"Applying Global Endpoint Metrics: %@", self.globalMetrics);
        for (NSString *key in [self.globalMetrics allKeys]) {
            if ([[self.globalMetrics objectForKey:key] isKindOfClass:[NSNumber class]]) {
                [localEndpointProfile addMetric:[self.globalMetrics objectForKey:key] forKey:key];
            } else {
                AWSDDLogWarn(@"Metric should be of NSNumber type: %@, Skipping...", [self.globalMetrics objectForKey:key]);
            }
        }
    }
}

- (void)migrateLegacyKeyValueStore {
    NSUserDefaults *userDefaults = self.context.configuration.userDefaults;
    if ([userDefaults dataForKey:AWSPinpointEndpointProfileKey] != nil) {
        NSData *endpointProfileData = [userDefaults dataForKey:AWSPinpointEndpointProfileKey];
        [_keychain setData:endpointProfileData forKey:AWSPinpointEndpointProfileKey];
        [userDefaults removeObjectForKey:AWSPinpointEndpointProfileKey];
    }
    
    if ([userDefaults objectForKey:AWSPinpointEndpointAttributesKey] != nil) {
        NSMutableDictionary *attributes = [userDefaults objectForKey:AWSPinpointEndpointAttributesKey];
        NSError *codingError;
        NSData *attributesData = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:attributes
                                                                            requiringSecureCoding:YES
                                                                                            error:&codingError];
        if (codingError) {
            AWSDDLogError(@"Error migrating global attributes data from NSUserDefaults to Keychain with error: %@", codingError);
        } else {
            [_keychain setData:attributesData forKey:AWSPinpointEndpointAttributesKey];
            [userDefaults removeObjectForKey:AWSPinpointEndpointAttributesKey];
        }
    }
    
    if ([userDefaults objectForKey:AWSPinpointEndpointMetricsKey] != nil) {
        NSError *codingError;
        NSMutableDictionary *metrics = [userDefaults objectForKey:AWSPinpointEndpointMetricsKey];
        NSData *metricsData = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:metrics
                                                                            requiringSecureCoding:YES
                                                                                            error:&codingError];
        if (codingError) {
            AWSDDLogError(@"Error migrating global metrics from NSUserDefaults to Keychain with error: %@", codingError);
        } else {
            [_keychain setData:metricsData forKey:AWSPinpointEndpointMetricsKey];
            [userDefaults removeObjectForKey:AWSPinpointEndpointMetricsKey];
        }
    }
    
    [userDefaults synchronize];
}

#pragma mark - Endpoint Client -
- (nonnull AWSTask *)updateEndpointProfile:(nonnull AWSPinpointEndpointProfile*) endpointProfile {
    
    [self addMetricsAndAttributesToEndpointProfile:endpointProfile];
    
    return [self executeUpdate:endpointProfile];
}

- (AWSTask *)updateEndpointProfile {
    return [self executeUpdate:[self currentEndpointProfile]];
}

- (AWSTask *)executeUpdate:(AWSPinpointEndpointProfile *) endpointProfile {
    self.endpointProfile = endpointProfile;
    @synchronized (self.endpointProfile) {
        NSError *codingError;
        NSData *endpointProfileData = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:endpointProfile
                                                                            requiringSecureCoding:YES
                                                                                            error:&codingError];
        if (codingError) {
            AWSDDLogError(@"Error archiving endpointProfileData. Updating service but not persisting locally: %@", codingError);
        }
        [_keychain setData:endpointProfileData forKey:AWSPinpointEndpointProfileKey];
    }

    return [[self.context.targetingService updateEndpoint:[self updateEndpointRequestForEndpoint:self.endpointProfile]] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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
        NSError *codingError;
        NSData *globalAttributesData = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:self.globalAttributes
                                                                            requiringSecureCoding:YES
                                                                                            error:&codingError];
        if (codingError) {
            AWSDDLogError(@"Error archiving globalAttributesData with error: %@", codingError);
        } else {
            [_keychain setData:globalAttributesData forKey:AWSPinpointEndpointAttributesKey];
        }
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
        NSError *codingError;
        NSData *globalAttributesData = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:self.globalAttributes
                                                                            requiringSecureCoding:YES
                                                                                            error:&codingError];
        if (codingError) {
            AWSDDLogError(@"Error archiving globalAttributesData with error: %@", codingError);
        } else {
            [_keychain setData:globalAttributesData forKey:AWSPinpointEndpointAttributesKey];
        }
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
        NSError *codingError;
        NSData *globalMetricsData = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:self.globalMetrics
                                                                            requiringSecureCoding:YES
                                                                                            error:&codingError];
        if (codingError) {
            AWSDDLogError(@"Error archiving globalMetricsData with error: %@", codingError);
        } else {
            [_keychain setData:globalMetricsData forKey:AWSPinpointEndpointMetricsKey];
        }
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
        NSError *codingError;
        NSData *globalMetricsData = [AWSNSCodingUtilities versionSafeArchivedDataWithRootObject:self.globalMetrics
                                                                            requiringSecureCoding:YES
                                                                                            error:&codingError];
        if (codingError) {
            AWSDDLogError(@"Error archiving globalMetricsData with error: %@", codingError);
        } else {
            [_keychain setData:globalMetricsData forKey:AWSPinpointEndpointMetricsKey];
        }
        
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
    userModel.userAttributes = user.allUserAttributes;
    return userModel;
}

- (AWSPinpointTargetingUpdateEndpointRequest*) updateEndpointRequestForEndpoint:(AWSPinpointEndpointProfile *) endpoint {
    AWSPinpointTargetingEndpointRequest *endpointRequest =  [AWSPinpointTargetingEndpointRequest new];
    endpointRequest.channelType = [endpoint.channelType isEqualToString:APNS_CHANNEL_TYPE] ? AWSPinpointTargetingChannelTypeApns : AWSPinpointTargetingChannelTypeApnsSandbox;
    endpointRequest.address = endpoint.address;
    endpointRequest.location = [self locationModelForLocation:endpoint.location];
    endpointRequest.demographic = [self endpointDemographicModelForDemographic:endpoint.demographic];
    endpointRequest.effectiveDate = [[NSDate date] aws_stringValue:AWSDateISO8601DateFormat3];
    endpointRequest.optOut = endpoint.optOut;
    endpointRequest.attributes = [endpoint allAttributes];
    endpointRequest.metrics = [endpoint allMetrics];
    endpointRequest.user = [self userModelForUser:endpoint.user];
    
    AWSPinpointTargetingUpdateEndpointRequest *updateEndpointRequest = [AWSPinpointTargetingUpdateEndpointRequest new];
    updateEndpointRequest.endpointId = endpoint.endpointId;
    updateEndpointRequest.applicationId = endpoint.applicationId;
    updateEndpointRequest.endpointRequest = endpointRequest;
    
    AWSDDLogVerbose(@"UpdateEndpointRequest: [%@]", updateEndpointRequest);
    
    return updateEndpointRequest;
}

@end
