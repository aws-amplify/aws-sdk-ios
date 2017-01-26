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

#import <Foundation/Foundation.h>
#import "AWSPinpointEvent.h"

@class AWSPinpointEndpointProfileDemographic, AWSPinpointEndpointProfileLocation, AWSPinpointEndpointProfileUser;

NS_ASSUME_NONNULL_BEGIN

/**
 The Endpoint profile contains information about the device/user to be target for messaging.
 */
@interface AWSPinpointEndpointProfile : NSObject

/**
 The Pinpoint Application ID
 @returns applicationId
 */
@property (nonatomic, readwrite) NSString *applicationId;

/**
 The Endpoint ID is the unique identifier of this device
 @returns endpointId
 */
@property (nonatomic, readonly) NSString *endpointId;

/**
 The Channel type defaults to APNS
 @returns channelType
 */
@property (nonatomic, readonly) NSString *_Nullable channelType;

/**
 The address is the token returned from APNS to be used to send push notifications
 @returns address
 */
@property (nonatomic, readwrite) NSString *_Nullable address;

/**
 A string representing the opt out option of the endpoint profile.
 It defaults to ALL or NONE depending on if the user has allowed remote push notifications.
 @returns optOut
 */
@property (nonatomic, readwrite) NSString *_Nullable optOut;

/**
 The effectiveDate of the profile
 Defaults to current time
 @returns effectiveDate
 */
@property (nonatomic, readonly) UTCTimeMillis effectiveDate;

/**
 The AWSPinpointEndpointProfileLocation facet of the endpoint profile
 @returns location
 */
@property (nonatomic, readwrite) AWSPinpointEndpointProfileLocation *_Nullable location;

/**
 The AWSPinpointEndpointProfileDemographic facet of the endpoint profile
 @returns demographic
 */
@property (nonatomic, readwrite) AWSPinpointEndpointProfileDemographic *_Nullable demographic;

/**
 The AWSPinpointEndpointProfileUser facet of the endpoint profile
 @returns user
 */
@property (nonatomic, readwrite) AWSPinpointEndpointProfileUser *_Nullable user;

/**
 An AWSPinpointEndpointProfile object with the specified applicationId and endpointId
 @returns AWSPinpointEndpointProfile
 */
- (instancetype) initWithApplicationId:(NSString*) applicationId
                            endpointId:(NSString*) endpointId;

/**
 Adds an attribute to this AWSPinpointEndpointProfile with the specified key. Only 40 attributes/metrics
 are allowed to be added to an AWSPinpointEndpointProfile. If 40 attributes/metrics already exist on this AWSPinpointEndpointProfile, the call is ignored.
 @param theValue The value of the attribute. The value will be truncated if it exceeds 200 characters.
 @param theKey The key of the attribute. The key will be truncated if it exceeds 50 characters.
 */
- (void)addAttribute:(NSArray *)theValue
              forKey:(NSString *)theKey;

/**
 Returns the value of the attribute with the specified key.
 @param theKey The key of the attribute to return
 @returns The attribute with the specified key, or null if attribute does not exist
 */
- (NSArray *)attributeForKey:(NSString *)theKey;

/**
 Determines if this AWSPinpointEndpointProfile contains a specific attribute
 @param theKey The key of the attribute
 @returns YES if this AWSPinpointEndpointProfile has an attribute with the specified key, NO otherwise
 */
- (BOOL)hasAttributeForKey:(NSString *)theKey;

/**
 Returns an Dictionary of all attributes contained within this AWSPinpointEndpointProfile
 @returns an Dictionary of all attributes, where the attribute keys are the keys and the attribute values are the values
 */
- (NSDictionary*) allAttributes;

/**
 Adds a metric to this AWSPinpointEndpointProfile with the specified key. Only 40 attributes/metrics
 are allowed to be added to an AWSPinpointEndpointProfile. If 40 attribute/metrics already exist on this AWSPinpointEndpointProfile, the call is ignored.
 @param theValue The value of the metric.
 @param theKey The key of the metric. The key will be truncated if it exceeds 50 characters.
 */
- (void)addMetric:(NSNumber *)theValue
           forKey:(NSString *)theKey;

/**
 Returns the value of the metric with the specified key.
 @param theKey The key of the metric to return
 @returns The metric with the specified key, or null if metric does not exist
 */
- (NSNumber *)metricForKey:(NSString *)theKey;

/**
 Determines if this AWSPinpointEndpointProfile contains a specific metric
 @param theKey The key of the metric
 @returns YES if this AWSPinpointEndpointProfile has a metric with the specified key, NO otherwise
 */
- (BOOL)hasMetricForKey:(NSString *)theKey;

/**
 Returns an Dictionary of all metrics contained within this AWSPinpointEndpointProfile
 @returns an Dictionary of all metrics, where the metric keys are the keys and the metric values are the values
 */
- (NSDictionary*) allMetrics;

/**
 Returns an Dictionary representation of this object.
 @returns an Dictionary representation of this AWSPinpointEndpointProfile object.
 */
- (NSDictionary *) toDictionary;

@end

/**
 The Endpoint Demographic contains information about the device to be target for messaging.
 */
@interface AWSPinpointEndpointProfileDemographic : NSObject

/**
 Returns an instance of AWSPinpointEndpointProfileDemographic with default values.
 @returns make
 */
+ (instancetype) defaultAWSPinpointEndpointProfileDemographic;

/**
 The make defaults to apple
 @returns make
 */
@property (nonatomic, readonly) NSString *_Nullable make;

/**
 Defaults to [UIDevice currentDevice].model
 @returns model
 */
@property (nonatomic, readwrite) NSString *_Nullable model;

/**
 Defaults to [[NSTimeZone systemTimeZone] name]
 @returns timezone
 */
@property (nonatomic, readwrite) NSString *_Nullable timezone;

/**
 Defaults to [[NSLocale autoupdatingCurrentLocale] localeIdentifier]
 @returns locale
 */
@property (nonatomic, readwrite) NSString *_Nullable locale;

/**
 Defaults to [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
 @returns appVersion
 */
@property (nonatomic, readwrite) NSString *_Nullable appVersion;

/**
 Defaults to [UIDevice currentDevice].systemName
 @returns platform
 */
@property (nonatomic, readwrite) NSString *_Nullable platform;

/**
 Defaults to [UIDevice currentDevice].systemVersion
 @returns platformVersion
 */
@property (nonatomic, readwrite) NSString *_Nullable platformVersion;

@end

/**
 The Endpoint profile contains information about the location of the device/user to be target for messaging.
 */
@interface AWSPinpointEndpointProfileLocation : NSObject

/**
 The latitude coordinate of the device
 @returns latitude
 */
@property (nonatomic, strong) NSNumber *_Nullable latitude;

/**
 The longitude coordinate of the device
 @returns longitude
 */
@property (nonatomic, strong) NSNumber *_Nullable longitude;

/**
 The postal code location of the device
 @returns postalCode
 */
@property (nonatomic, strong) NSString *_Nullable postalCode;

/**
 The city of the location
 @returns city
 */
@property (nonatomic, strong) NSString *_Nullable city;

/**
 The region of the location
 @returns region
 */
@property (nonatomic, strong) NSString *_Nullable region;

/**
 the country of the location
 @returns country
 */
@property (nonatomic, strong) NSString *_Nullable country;

@end

/**
 The Endpoint profile contains information about the user to be target for messaging.
 */
@interface AWSPinpointEndpointProfileUser : NSObject

/**
 The userId of the endpoint profile.
 @returns userId
 */
@property (nonatomic, strong) NSString *_Nullable userId;

@end

NS_ASSUME_NONNULL_END

