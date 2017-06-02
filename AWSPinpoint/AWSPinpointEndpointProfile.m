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

#import <AWSCore/AWSCocoaLumberjack.h>
#import "AWSPinpointEndpointProfile.h"
#import "AWSPinpointContext.h"
#import "AWSPinpointConfiguration.h"
#import "AWSPinpointNotificationManager.h"
#import "AWSPinpointStringUtils.h"
#import "AWSPinpointDateUtils.h"

static int const MAX_NUM_OF_METRICS_AND_ATTRIBUTES = 20;
static int const MAX_ENDPOINT_ATTRIBUTE_METRIC_KEY_LENGTH = 50;
static int const MAX_ENDPOINT_ATTRIBUTE_VALUE_LENGTH = 100;
static int const MAX_ENDPOINT_ATTRIBUTE_VALUES = 50;

@interface AWSPinpointEndpointProfile()
@property (nonatomic, readwrite) NSString *endpointId;
@property (nonatomic, readwrite) NSString *channelType;
@property (nonatomic, readwrite) NSDictionary<NSString*,NSArray*> *attributes;
@property (nonatomic, readwrite) NSDictionary<NSString*,NSNumber*> *metrics;
@property (nonatomic, readwrite) UTCTimeMillis effectiveDate;
@property (atomic, readonly) int currentNumOfAttributesAndMetrics;

@end

#pragma mark - AWSPinpointEndpointProfile -
@implementation AWSPinpointEndpointProfile

NSString *CHANNEL_TYPE = @"APNS";

- (instancetype) initWithApplicationId:(NSString*) applicationId
                            endpointId:(NSString*) endpointId
                applicationLevelOptOut:(BOOL) applicationLevelOptOut {
    if (self = [super init]) {
        //Remove spaces and brackets from token
        NSString *deviceTokenString = [[[[[NSUserDefaults standardUserDefaults] objectForKey:AWSDeviceTokenKey] description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]] stringByReplacingOccurrencesOfString:@" " withString:@""];

        _applicationId = applicationId;
        _endpointId = endpointId;
        _channelType  = CHANNEL_TYPE;
        _address = deviceTokenString;
        _location = [AWSPinpointEndpointProfileLocation new];
        _demographic = [AWSPinpointEndpointProfileDemographic defaultAWSPinpointEndpointProfileDemographic];
        _effectiveDate = [AWSPinpointDateUtils utcTimeMillisNow];
        _optOut = (applicationLevelOptOut || [self isSystemLevelOptOut])?@"ALL":@"NONE";
        _attributes = [NSMutableDictionary dictionary];
        _metrics = [NSMutableDictionary dictionary];
        _user = [AWSPinpointEndpointProfileUser new];
    }
    return self;
}

- (instancetype)initWithApplicationId:(NSString*) applicationId
                           endpointId:(NSString*) endpointId {
    return [self initWithApplicationId: applicationId endpointId:endpointId applicationLevelOptOut:NO];
}

- (instancetype)initWithContext:(AWSPinpointContext *) context {
    BOOL applicationLevelOptOut = [self isApplicationLevelOptOut:context];

    return [self initWithApplicationId: context.configuration.appId endpointId:context.uniqueId applicationLevelOptOut:applicationLevelOptOut];
}

- (BOOL) isApplicationLevelOptOut:(AWSPinpointContext *) context {
    if (context.configuration.isApplicationLevelOptOut != NULL && context.configuration.isApplicationLevelOptOut() == YES){
        return YES;
    }

    return NO;
}

- (BOOL) isSystemLevelOptOut {
    BOOL optOut = ![[UIApplication sharedApplication] isRegisteredForRemoteNotifications];

    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types == UIUserNotificationTypeNone) {
        optOut = YES;
    }

    return optOut;
}

+ (NSArray*) processAttributeValues:(NSArray*) values {
    NSMutableArray *trimmedValues = [NSMutableArray arrayWithCapacity:MAX_ENDPOINT_ATTRIBUTE_VALUES];
    int valuesCount = 0;
    for (NSString *val in values) {
        [trimmedValues addObject:[AWSPinpointEndpointProfile trimValue:val]];
        if (++valuesCount >= MAX_ENDPOINT_ATTRIBUTE_VALUES) {
            AWSDDLogWarn(@"Only %d attributes values are allowed, attribute values has been reduced to %d values.", MAX_ENDPOINT_ATTRIBUTE_VALUES, MAX_ENDPOINT_ATTRIBUTE_VALUES);
            break;
        }
    }
    return trimmedValues;
}

+ (NSString*) trimKey:(NSString*)theKey
              forType:(NSString*)theType {
    NSString* trimmedKey = [AWSPinpointStringUtils clipString:theKey
                                                   toMaxChars:MAX_ENDPOINT_ATTRIBUTE_METRIC_KEY_LENGTH
                                            andAppendEllipses:NO];
    if(trimmedKey.length < theKey.length) {
        AWSDDLogWarn(@"The %@ key has been trimmed to a length of %0d characters", theType, MAX_ENDPOINT_ATTRIBUTE_METRIC_KEY_LENGTH);
    }
    
    return trimmedKey;
}

+ (NSString*) trimValue:(NSString*)theValue {
    NSString* trimmedValue = [AWSPinpointStringUtils clipString:theValue
                                                     toMaxChars:MAX_ENDPOINT_ATTRIBUTE_VALUE_LENGTH
                                              andAppendEllipses:NO];
    if(trimmedValue.length < theValue.length) {
        AWSDDLogWarn( @"The attribute value has been trimmed to a length of %0d characters", MAX_ENDPOINT_ATTRIBUTE_VALUE_LENGTH);
    }
    
    return trimmedValue;
}

- (int) currentNumOfAttributesAndMetrics {
    return (int)self.attributes.count + (int)self.metrics.count;
}

- (void)addAttribute:(NSArray *)theValue
              forKey:(NSString *)theKey {
    if (!theKey) return;
    @synchronized(self) {
        if (theKey != nil && theValue != nil && ![self hasAttributeForKey:theKey]) {
            if (self.currentNumOfAttributesAndMetrics < MAX_NUM_OF_METRICS_AND_ATTRIBUTES) {
                [self.attributes setValue:[AWSPinpointEndpointProfile processAttributeValues:theValue]
                                   forKey:[AWSPinpointEndpointProfile trimKey:theKey
                                                                      forType:@"attribute"]];
            } else {
                AWSDDLogWarn(@"Max number of attributes/metrics reached, dropping attribute with key: %@", theKey);
            }
        } else if ([self hasAttributeForKey:theKey]) {
            [self.attributes setValue:[AWSPinpointEndpointProfile processAttributeValues:theValue]
                               forKey:[AWSPinpointEndpointProfile trimKey:theKey
                                                                  forType:@"attribute"]];
        }
    }
}

- (NSArray *)attributeForKey:(NSString *)theKey {
    @synchronized(self.attributes) {
        return [self.attributes objectForKey:theKey];
    }
}

- (BOOL)hasAttributeForKey:(NSString *)theKey {
    if(!theKey) return NO;
    @synchronized(self.attributes) {
        if([self.attributes objectForKey:theKey]) {
            return YES;
        } else {
            return NO;
        }
    }
}

- (NSDictionary*) allAttributes {
    @synchronized(self.attributes) {
        return [NSDictionary dictionaryWithDictionary:self.attributes];
    }
}

- (void)addMetric:(NSNumber *)theValue
           forKey:(NSString *)theKey {
    if(!theKey) return;
    @synchronized(self) {
        if (theKey != nil && theValue != nil && ![self hasMetricForKey:theKey]) {
            if (self.currentNumOfAttributesAndMetrics < MAX_NUM_OF_METRICS_AND_ATTRIBUTES) {
                NSString* trimmedKey = [AWSPinpointEndpointProfile trimKey:theKey
                                                                   forType:@"metric"];
                [self.metrics setValue:theValue forKey:trimmedKey];
            } else {
                AWSDDLogWarn(@"Max number of attributes/metrics reached, dropping metric with key: %@", theKey);
            }
        }
    }
}

- (NSNumber *)metricForKey:(NSString *)theKey {
    @synchronized(self.metrics) {
        return [self.metrics objectForKey:theKey];
    }
}

- (BOOL)hasMetricForKey:(NSString *)theKey {
    if(!theKey) return NO;
    @synchronized(self.metrics) {
        if ([self.metrics objectForKey:theKey]) {
            return YES;
        } else {
            return NO;
        }
    }
}

- (NSDictionary*) allMetrics {
    @synchronized(self.metrics) {
        return [NSDictionary dictionaryWithDictionary:self.metrics];
    }
}

- (NSString*) quotedString:(NSString*) input {
    return [NSString stringWithFormat:@"\"%@\"", input];
}

- (NSString*) description {
    NSError *error;
    NSData *attributesData = [NSJSONSerialization dataWithJSONObject:self.attributes
                                                             options:0 // Pass 0 if you don't care about the readability of the generated string
                                                               error:&error];
    NSString *attributesString = [[NSString alloc] initWithData:attributesData
                                                       encoding:NSUTF8StringEncoding];
    NSData *metricsData = [NSJSONSerialization dataWithJSONObject:self.metrics
                                                          options:0
                                                            error:&error];
    NSString *metricsString = [[NSString alloc] initWithData:metricsData
                                                    encoding:NSUTF8StringEncoding];
    return [NSString stringWithFormat:
            @"{"
            "\"ApplicationId\" : %@,"
            "\"EndpointId\" : %@,"
            "\"ChannelType\" : %@,"
            "\"Address\" : %@,"
            "\"Location\" : %@,"
            "\"Demographic\" : %@,"
            "\"EffectiveDate\" : %@,"
            "\"OptOut\" : %@,"
            "\"Attributes\":%@,"
            "\"Metrics\":%@, "
            "\"User\":%@}",
            [self quotedString:self.applicationId],
            [self quotedString:self.endpointId],
            [self quotedString:self.channelType],
            [self quotedString:self.address],
            self.location.description,
            self.demographic.description,
            [self quotedString:[AWSPinpointDateUtils isoDateTimeWithTimestamp:self.effectiveDate]],
            [self quotedString:self.optOut],
            attributesString,
            metricsString,
            self.user.description];
}

- (NSDictionary *) toDictionary {
    NSData *data = [self.description dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                               options:0
                                                                 error:nil];
    return dictionary;
}

@end


#pragma mark - AWSPinpointEndpointProfileDemographic
NSString *const AWSPinpointDefaultEndpointDemographicUnknown = @"Unknown";

@implementation AWSPinpointEndpointProfileDemographic

+ (instancetype) defaultAWSPinpointEndpointProfileDemographic {
    AWSPinpointEndpointProfileDemographic *demographic = [AWSPinpointEndpointProfileDemographic new];
    UIDevice* currentDevice = [UIDevice currentDevice];
    NSString *autoUpdatingLocaleIdentifier = [[NSLocale autoupdatingCurrentLocale] localeIdentifier];
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    demographic.model = [currentDevice model] ? [currentDevice model] : AWSPinpointDefaultEndpointDemographicUnknown;
    //Reset the cached system time zone
    [NSTimeZone resetSystemTimeZone];
    demographic.timezone = [[NSTimeZone systemTimeZone] name];
    demographic.locale = autoUpdatingLocaleIdentifier ? autoUpdatingLocaleIdentifier : AWSPinpointDefaultEndpointDemographicUnknown;
    demographic.appVersion = appVersion ? appVersion : AWSPinpointDefaultEndpointDemographicUnknown;
    demographic.platform = [currentDevice systemName] ? [currentDevice systemName] : AWSPinpointDefaultEndpointDemographicUnknown;
    demographic.platformVersion = [currentDevice systemVersion] ? [currentDevice systemVersion] : AWSPinpointDefaultEndpointDemographicUnknown;
    return demographic;
}

- (NSString*) make {
    return @"apple";
}

- (NSString*) quotedString:(NSString*) input {
    return [NSString stringWithFormat:@"\"%@\"", input];
}

- (NSString*) description {
    return [NSString stringWithFormat:
            @"{\"Make\" : %@,"
            "\"Model\" : %@,"
            "\"Timezone\" : %@,"
            "\"Locale\" : %@,"
            "\"AppVersion\" : %@,"
            "\"Platform\" : %@,"
            "\"PlatformVersion\" : %@}",
            [self quotedString:self.make],
            [self quotedString:self.model],
            [self quotedString:self.timezone],
            [self quotedString:self.locale],
            [self quotedString:self.appVersion],
            [self quotedString:self.platform],
            [self quotedString:self.platformVersion]];
}

@end

#pragma mark - AWSPinpointEndpointProfileLocation
@implementation AWSPinpointEndpointProfileLocation

- (NSString*) quotedString:(NSString*) input {
    return [NSString stringWithFormat:@"\"%@\"", input];
}

- (NSString*) description {
    return [NSString stringWithFormat:
            @"{\"Latitude\" : %@,"
            "\"Longitude\" : %@,"
            "\"PostalCode\" : %@,"
            "\"City\" : %@,"
            "\"Region\" : %@,"
            "\"Country\" : %@}",
            (self.latitude)?self.latitude:@"0",
            (self.longitude)?self.longitude:@"0",
            [self quotedString:self.postalCode],
            [self quotedString:self.city],
            [self quotedString:self.region],
            [self quotedString:self.country]];
}

@end

#pragma mark - AWSPinpointEndpointProfileUser
@implementation AWSPinpointEndpointProfileUser

- (NSString*) quotedString:(NSString*) input {
    return [NSString stringWithFormat:@"\"%@\"", input];
}

- (NSString*) description {
    return [NSString stringWithFormat:
            @"{"
            "\"UserId\" : %@}",
            [self quotedString:self.userId]];
}

@end
