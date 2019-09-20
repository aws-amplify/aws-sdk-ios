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

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

#pragma mark - AWSPinpointEndpointProfile -
@implementation AWSPinpointEndpointProfile

NSString *CHANNEL_TYPE = @"APNS";
NSString *DEBUG_CHANNEL_TYPE = @"APNS_SANDBOX";

- (instancetype) initWithApplicationId:(NSString*) applicationId
                            endpointId:(NSString*) endpointId
                applicationLevelOptOut:(BOOL) applicationLevelOptOut
                                 debug:(BOOL) debug {
    return [self initWithApplicationId:applicationId
                            endpointId:endpointId
                applicationLevelOptOut:applicationLevelOptOut
                                 debug:debug
                          userDefaults:[NSUserDefaults standardUserDefaults]];
}

- (instancetype) initWithApplicationId:(NSString*) applicationId
                            endpointId:(NSString*) endpointId
                applicationLevelOptOut:(BOOL) applicationLevelOptOut
                                 debug:(BOOL) debug
                          userDefaults:(NSUserDefaults*) userDefaults {
    if (self = [super init]) {
        NSData *tokenData = [userDefaults objectForKey:AWSDeviceTokenKey];
        NSString *deviceTokenString = [AWSPinpointEndpointProfile hexStringFromData:tokenData];
        
        _applicationId = applicationId;
        _endpointId = endpointId;
        _channelType  = debug? DEBUG_CHANNEL_TYPE : CHANNEL_TYPE;
        _address = deviceTokenString;
        _location = [AWSPinpointEndpointProfileLocation new];
        _demographic = [AWSPinpointEndpointProfileDemographic defaultAWSPinpointEndpointProfileDemographic];
        _effectiveDate = [AWSPinpointDateUtils utcTimeMillisNow];
        [self setEndpointOptOut:applicationLevelOptOut];
        _attributes = [NSMutableDictionary dictionary];
        _metrics = [NSMutableDictionary dictionary];
        _user = [AWSPinpointEndpointProfileUser new];
    }
    return self;
}

- (instancetype)initWithApplicationId:(NSString*) applicationId
                           endpointId:(NSString*) endpointId {
    return [self initWithApplicationId: applicationId endpointId:endpointId applicationLevelOptOut:NO debug:NO];
}

- (instancetype)initWithContext:(AWSPinpointContext *) context {
    BOOL applicationLevelOptOut = [self isApplicationLevelOptOut:context];
    if(context.configuration.userDefaults != nil) {
        return [self initWithApplicationId:context.configuration.appId endpointId:context.uniqueId applicationLevelOptOut:applicationLevelOptOut debug:context.configuration.debug userDefaults:context.configuration.userDefaults];
    }
    return [self initWithApplicationId: context.configuration.appId endpointId:context.uniqueId applicationLevelOptOut:applicationLevelOptOut debug:context.configuration.debug];
}

- (void) updateEndpointProfileWithContext:(AWSPinpointContext *) context {
    NSUserDefaults *userDefaults = context.configuration.userDefaults;
    if (userDefaults == nil) {
        userDefaults = [NSUserDefaults standardUserDefaults];
    }
    NSData *tokenData = [userDefaults objectForKey:AWSDeviceTokenKey];
    NSString *deviceTokenString = [AWSPinpointEndpointProfile hexStringFromData:tokenData];
    @synchronized (self) {
        _channelType = context.configuration.debug ? DEBUG_CHANNEL_TYPE : CHANNEL_TYPE;
        _applicationId = context.configuration.appId;
        _endpointId = context.uniqueId;
        _address = deviceTokenString;
        
        //this updates demograhpic information.
        _location = [AWSPinpointEndpointProfileLocation new];
        _demographic = [AWSPinpointEndpointProfileDemographic defaultAWSPinpointEndpointProfileDemographic];
        _effectiveDate = [AWSPinpointDateUtils utcTimeMillisNow];
    }
}

- (BOOL) isApplicationLevelOptOut:(AWSPinpointContext *) context {
    if (context.configuration.isApplicationLevelOptOut != NULL && context.configuration.isApplicationLevelOptOut() == YES){
        return YES;
    }
    return NO;
}

- (void) setEndpointOptOut:(BOOL) applicationLevelOptOut {
    BOOL isOptedOutForRemoteNotifications = ![AWSPinpointNotificationManager isNotificationEnabled];
    @synchronized (self) {
        self->_optOut = (applicationLevelOptOut || isOptedOutForRemoteNotifications)? @"ALL": @"NONE";
    }
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

- (void) removeAllAttributes {
    @synchronized (self) {
        self.attributes = [NSMutableDictionary new];
    }
}

- (void) removeAllMetrics {
    @synchronized (self) {
        self.metrics = [NSMutableDictionary new];
    }
}

- (NSArray *)attributeForKey:(NSString *)theKey {
    @synchronized(self) {
        return [self.attributes objectForKey:theKey];
    }
}

- (BOOL)hasAttributeForKey:(NSString *)theKey {
    if(!theKey) return NO;
    @synchronized(self) {
        if([self.attributes objectForKey:theKey]) {
            return YES;
        } else {
            return NO;
        }
    }
}

- (NSDictionary*) allAttributes {
    @synchronized(self) {
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
    @synchronized(self) {
        return [self.metrics objectForKey:theKey];
    }
}

- (BOOL)hasMetricForKey:(NSString *)theKey {
    if(!theKey) return NO;
    @synchronized(self) {
        if ([self.metrics objectForKey:theKey] != nil) {
            return YES;
        } else {
            return NO;
        }
    }
}

- (NSDictionary*) allMetrics {
    @synchronized(self) {
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


- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _applicationId = [decoder decodeObjectForKey:@"applicationId"];
        _endpointId = [decoder decodeObjectForKey:@"endpointId"];
        _channelType = [decoder decodeObjectForKey:@"channelType"];
        _address = [decoder decodeObjectForKey:@"address"];
        _location = [decoder decodeObjectForKey:@"location"];
        _demographic = [decoder decodeObjectForKey:@"demographic"];
        _attributes = [decoder decodeObjectForKey:@"attributes"];
        _metrics = [decoder decodeObjectForKey:@"metrics"];
        _user = [decoder decodeObjectForKey:@"user"];
        _effectiveDate = [decoder decodeInt64ForKey:@"effectiveDate"];
        _optOut = [decoder decodeObjectForKey:@"optOut"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_applicationId forKey:@"applicationId"];
    [encoder encodeObject:_endpointId forKey:@"endpointId"];
    [encoder encodeObject:_channelType forKey:@"channelType"];
    [encoder encodeObject:_address forKey:@"address"];
    [encoder encodeObject:_location forKey:@"location"];
    [encoder encodeObject:_demographic forKey:@"demographic"];
    [encoder encodeObject:_attributes forKey:@"attributes"];
    [encoder encodeObject:_metrics forKey:@"metrics"];
    [encoder encodeObject:_user forKey:@"user"];
    [encoder encodeInt64:_effectiveDate forKey:@"effectiveDate"];
    [encoder encodeObject:_optOut forKey:@"optOut"];

}

+ (nullable NSString *)hexStringFromData:(NSData *)data {
    if (!data || data.length == 0) {
        return NULL;
    }

    const unsigned char *bytes = [data bytes];

    NSMutableString *hexString = [[NSMutableString alloc] init];
    for (int i = 0; i < data.length; i++) {
        unsigned char byte = bytes[i];
        [hexString appendFormat:@"%02x", byte];
    }

    return hexString;
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

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _model = [decoder decodeObjectForKey:@"model"];
        _timezone = [decoder decodeObjectForKey:@"timezone"];
        _locale = [decoder decodeObjectForKey:@"locale"];
        _appVersion = [decoder decodeObjectForKey:@"appVersion"];
        _platform = [decoder decodeObjectForKey:@"platform"];
        _platformVersion = [decoder decodeObjectForKey:@"platformVersion"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_model forKey:@"model"];
    [encoder encodeObject:_timezone forKey:@"timezone"];
    [encoder encodeObject:_locale forKey:@"locale"];
    [encoder encodeObject:_appVersion forKey:@"appVersion"];
    [encoder encodeObject:_platform forKey:@"platform"];
    [encoder encodeObject:_platformVersion forKey:@"platformVersion"];
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
            self.latitude?:@0,
            self.longitude?:@0,
            [self quotedString:self.postalCode],
            [self quotedString:self.city],
            [self quotedString:self.region],
            [self quotedString:self.country]];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _latitude = [decoder decodeObjectForKey:@"latitude"];
        _longitude = [decoder decodeObjectForKey:@"longitude"];
        _postalCode = [decoder decodeObjectForKey:@"postalCode"];
        _city = [decoder decodeObjectForKey:@"city"];
        _region = [decoder decodeObjectForKey:@"region"];
        _country = [decoder decodeObjectForKey:@"country"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_latitude forKey:@"latitude"];
    [encoder encodeObject:_longitude forKey:@"longitude"];
    [encoder encodeObject:_postalCode forKey:@"postalCode"];
    [encoder encodeObject:_city forKey:@"city"];
    [encoder encodeObject:_region forKey:@"region"];
    [encoder encodeObject:_country forKey:@"country"];
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

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _userId = [decoder decodeObjectForKey:@"userId"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_userId forKey:@"userId"];
}

@end
