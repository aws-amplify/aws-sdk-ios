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
#import <AWSCore/AWSUICKeyChainStore.h>
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
NSString *const AWSPinpointOverrideDefaultOptOutKey = @"com.amazonaws.AWSPinpointOverrideDefaultOptOutKey";

@interface AWSPinpointEndpointProfile()
@property (nonatomic, readwrite) NSString *endpointId;
@property (nonatomic, readwrite) NSString *channelType;
@property (nonatomic, readwrite) NSDictionary<NSString*,NSArray*> *attributes;
@property (nonatomic, readwrite) NSDictionary<NSString*,NSNumber*> *metrics;
@property (nonatomic, readwrite) UTCTimeMillis effectiveDate;
@property (atomic, readonly) int currentNumOfAttributesAndMetrics;
@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@interface AWSPinpointEndpointProfileUser()
@property (nonatomic, readwrite) NSDictionary<NSString*,NSArray*> *userAttributes;

@end

@interface AWSPinpointConfiguration()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

#pragma mark - AWSPinpointEndpointProfile

@implementation AWSPinpointEndpointProfile

@synthesize optOut = _optOutBackingVariable;

NSString *CHANNEL_TYPE = @"APNS";
NSString *DEBUG_CHANNEL_TYPE = @"APNS_SANDBOX";

- (instancetype) initWithApplicationId:(NSString*) applicationId
                            endpointId:(NSString*) endpointId
                applicationLevelOptOut:(BOOL) applicationLevelOptOut
    isRegisteredForRemoteNotifications:(BOOL) isRegisteredForRemoteNotifications
                                 debug:(BOOL) debug {
    return [self initWithApplicationId:applicationId
                            endpointId:endpointId
                applicationLevelOptOut:applicationLevelOptOut
    isRegisteredForRemoteNotifications:isRegisteredForRemoteNotifications
                                 debug:debug
                          userDefaults:[NSUserDefaults standardUserDefaults]
                              keychain:[AWSUICKeyChainStore keyChainStoreWithService:AWSPinpointContextKeychainService]];
}

- (instancetype) initWithApplicationId:(NSString*) applicationId
                            endpointId:(NSString*) endpointId
                applicationLevelOptOut:(BOOL) applicationLevelOptOut
    isRegisteredForRemoteNotifications:(BOOL) isRegisteredForRemoteNotifications
                                 debug:(BOOL) debug
                          userDefaults:(NSUserDefaults*) userDefaults
                              keychain: (AWSUICKeyChainStore*) keychain {
    if (self = [super init]) {
        NSData *tokenData = [userDefaults objectForKey:AWSDeviceTokenKey];
        if (tokenData != nil) {
            //move to keychain if it's nil
            //if keychain already has a device token, keep the existing/newer token
            //remove token from user defaults
            if ([keychain dataForKey:AWSDeviceTokenKey] == nil) {
                [keychain setData:tokenData forKey:AWSDeviceTokenKey];
            }
            [userDefaults removeObjectForKey:AWSDeviceTokenKey];
            [userDefaults synchronize];
        } else {
            tokenData = [keychain dataForKey:AWSDeviceTokenKey];
        }
        NSString *deviceTokenString = [AWSPinpointEndpointProfile hexStringFromData:tokenData];
        
        _applicationId = applicationId;
        _endpointId = endpointId;
        _channelType  = debug? DEBUG_CHANNEL_TYPE : CHANNEL_TYPE;
        _address = deviceTokenString;
        _location = [AWSPinpointEndpointProfileLocation new];
        _demographic = [AWSPinpointEndpointProfileDemographic defaultAWSPinpointEndpointProfileDemographic];
        _effectiveDate = [AWSPinpointDateUtils utcTimeMillisNow];
        [self setEndpointOptOut:applicationLevelOptOut isRegisteredForRemoteNotifications:isRegisteredForRemoteNotifications];
        _attributes = [NSMutableDictionary dictionary];
        _metrics = [NSMutableDictionary dictionary];
        _user = [AWSPinpointEndpointProfileUser new];
        _userDefaults = userDefaults;
    }
    return self;
}

- (instancetype)initWithApplicationId:(NSString*) applicationId
                           endpointId:(NSString*) endpointId {
    return [self initWithApplicationId: applicationId endpointId:endpointId applicationLevelOptOut:NO isRegisteredForRemoteNotifications:NO debug:NO];
}

- (instancetype)initWithContext:(AWSPinpointContext *) context {
    return [self initWithContext:context isRegisteredForRemoteNotifications:[AWSPinpointNotificationManager isNotificationEnabled]];
}

- (instancetype)initWithContext:(AWSPinpointContext *) context isRegisteredForRemoteNotifications:(BOOL) isRegisteredForRemoteNotifications {
    BOOL applicationLevelOptOut = [self isApplicationLevelOptOut:context];
    if(context.configuration.userDefaults != nil) {
        return [self initWithApplicationId:context.configuration.appId endpointId:context.uniqueId applicationLevelOptOut:applicationLevelOptOut isRegisteredForRemoteNotifications:isRegisteredForRemoteNotifications debug:context.configuration.debug userDefaults:context.configuration.userDefaults keychain: context.keychain];
    }
    return [self initWithApplicationId: context.configuration.appId endpointId:context.uniqueId applicationLevelOptOut:applicationLevelOptOut isRegisteredForRemoteNotifications:isRegisteredForRemoteNotifications debug:context.configuration.debug];
}

- (void) updateEndpointProfileWithContext:(AWSPinpointContext *) context {
    NSData *tokenData = [context.keychain dataForKey:AWSDeviceTokenKey];
    NSString *deviceTokenString = [AWSPinpointEndpointProfile hexStringFromData:tokenData];
    @synchronized (self) {
        _channelType = context.configuration.debug ? DEBUG_CHANNEL_TYPE : CHANNEL_TYPE;
        _applicationId = context.configuration.appId;
        _endpointId = context.uniqueId;
        _address = deviceTokenString;
        
        //this updates demograhpic information.
        _location = [AWSPinpointEndpointProfileLocation new];
        _demographic = self.customDemographic ?: [AWSPinpointEndpointProfileDemographic defaultAWSPinpointEndpointProfileDemographic];
        _effectiveDate = [AWSPinpointDateUtils utcTimeMillisNow];
    }
}

- (BOOL) isApplicationLevelOptOut:(AWSPinpointContext *) context {
    if (context.configuration.isApplicationLevelOptOut != NULL && context.configuration.isApplicationLevelOptOut() == YES){
        return YES;
    }
    return NO;
}

- (void) setOptOut:(NSString *)optOut {
    NSString *overrideDefaultOptOut = [self.userDefaults stringForKey:AWSPinpointOverrideDefaultOptOutKey];
    if (![overrideDefaultOptOut isEqualToString:optOut]) {
        [self.userDefaults setObject:optOut forKey:AWSPinpointOverrideDefaultOptOutKey];
        [self.userDefaults synchronize];
    }

    _optOutBackingVariable = optOut;
}

- (NSString *)optOut {
    return _optOutBackingVariable;
}

- (void) setEndpointOptOut:(BOOL) applicationLevelOptOut isRegisteredForRemoteNotifications:(BOOL) isRegisteredForRemoteNotifications {
    NSString *overrideDefaultOptOut = [self.userDefaults stringForKey:AWSPinpointOverrideDefaultOptOutKey];
    NSString *overrideOrNoneAsDefault = [overrideDefaultOptOut length] ? overrideDefaultOptOut : @"NONE";
    BOOL isUsingPinpointForNotifications = isRegisteredForRemoteNotifications && [self.address length];
    BOOL isOptedOutForNotifications = !isUsingPinpointForNotifications;

    @synchronized (self) {
        self->_optOutBackingVariable = (applicationLevelOptOut || isOptedOutForNotifications)? @"ALL": overrideOrNoneAsDefault;
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _applicationId = [decoder decodeObjectOfClass:[NSString class] forKey:@"applicationId"];
        _endpointId = [decoder decodeObjectOfClass:[NSString class] forKey:@"endpointId"];
        _channelType = [decoder decodeObjectOfClass:[NSString class] forKey:@"channelType"];
        _address = [decoder decodeObjectOfClass:[NSString class] forKey:@"address"];
        _optOutBackingVariable = [decoder decodeObjectOfClass:[NSString class] forKey:@"optOut"];
        _effectiveDate = [decoder decodeInt64ForKey:@"effectiveDate"];
        _location = [decoder decodeObjectOfClass:[AWSPinpointEndpointProfileLocation class] forKey:@"location"];
        _demographic = [decoder decodeObjectOfClass:[AWSPinpointEndpointProfileDemographic class] forKey:@"demographic"];

        NSSet * attributesClasses = [NSSet setWithObjects:[NSDictionary class], [NSArray class], [NSString class], nil];
        _attributes = [decoder decodeObjectOfClasses:attributesClasses forKey:@"attributes"];

        NSSet * metricsClasses = [NSSet setWithObjects:[NSDictionary class], [NSArray class], [NSNumber class], nil];
        _metrics = [decoder decodeObjectOfClasses:metricsClasses forKey:@"metrics"];

        _user = [decoder decodeObjectOfClass:[AWSPinpointEndpointProfileUser class] forKey:@"user"];
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
    [encoder encodeObject:_optOutBackingVariable forKey:@"optOut"];

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _model = [decoder decodeObjectOfClass:[NSString class] forKey:@"model"];
        _timezone = [decoder decodeObjectOfClass:[NSString class] forKey:@"timezone"];
        _locale = [decoder decodeObjectOfClass:[NSString class] forKey:@"locale"];
        _appVersion = [decoder decodeObjectOfClass:[NSString class] forKey:@"appVersion"];
        _platform = [decoder decodeObjectOfClass:[NSString class] forKey:@"platform"];
        _platformVersion = [decoder decodeObjectOfClass:[NSString class] forKey:@"platformVersion"];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _latitude = [decoder decodeObjectOfClass:[NSNumber class] forKey:@"latitude"];
        _longitude = [decoder decodeObjectOfClass:[NSNumber class] forKey:@"longitude"];
        _postalCode = [decoder decodeObjectOfClass:[NSString class] forKey:@"postalCode"];
        _city = [decoder decodeObjectOfClass:[NSString class] forKey:@"city"];
        _region = [decoder decodeObjectOfClass:[NSString class] forKey:@"region"];
        _country = [decoder decodeObjectOfClass:[NSString class] forKey:@"country"];
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

- (NSString *)quotedString:(NSString*) input {
    return [NSString stringWithFormat:@"\"%@\"", input];
}

- (NSString *)description {
    if (!self.userAttributes) {
        self.userAttributes = [NSMutableDictionary dictionary];
    }
    
    NSError *error;
    NSData *userAttributesData = [NSJSONSerialization dataWithJSONObject:self.userAttributes
                                                                 options:0
                                                                   error:&error];
    NSString *userAttributesString = [[NSString alloc] initWithData:userAttributesData
                                                           encoding:NSUTF8StringEncoding];
    return [NSString stringWithFormat:
            @"{"
            "\"UserId\" : %@,"
            "\"Attributes\":%@}",
            [self quotedString:self.userId],
            userAttributesString];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _userId = [decoder decodeObjectOfClass:[NSString class] forKey:@"userId"];
        _userAttributes = [decoder decodeObjectOfClass:[NSDictionary class] forKey:@"userAttributes"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_userId forKey:@"userId"];
    [encoder encodeObject:_userAttributes forKey:@"userAttributes"];
}

- (void)addUserAttribute:(NSArray *)theValue
                  forKey:(NSString *)theKey {
    if (!theKey.length) {
        AWSDDLogWarn(@"The key of user attribute you tried to add is empty.");
        return;
    }
    
    if (!self.userAttributes) {
        self.userAttributes = [NSMutableDictionary dictionary];
    }
    
    [self.userAttributes setValue:[AWSPinpointEndpointProfileUser processUserAttributeValues:theValue]
                           forKey:[AWSPinpointEndpointProfileUser trimKey:theKey
                                                                  forType:@"userAttribute"]];
}

- (NSDictionary *)allUserAttributes {
    return [NSDictionary dictionaryWithDictionary:self.userAttributes];
}

- (BOOL)hasUserAttributeForKey:(NSString *)theKey {
    return [self.userAttributes objectForKey:theKey] != nil;
}

- (NSArray *)userAttributeForKey:(NSString *)theKey {
    return [self.userAttributes objectForKey:theKey];
}

+ (NSArray *)processUserAttributeValues:(NSArray*) values {
    NSMutableArray *trimmedValues = [NSMutableArray arrayWithCapacity:MAX_ENDPOINT_ATTRIBUTE_VALUES];
    int valuesCount = 0;
    for (NSString *val in values) {
        [trimmedValues addObject:[AWSPinpointEndpointProfileUser trimValue:val]];
        if (++valuesCount >= MAX_ENDPOINT_ATTRIBUTE_VALUES) {
            AWSDDLogWarn(@"Only %d attributes values are allowed, attribute values has been reduced to %d values.", MAX_ENDPOINT_ATTRIBUTE_VALUES, MAX_ENDPOINT_ATTRIBUTE_VALUES);
            break;
        }
    }
    return trimmedValues;
}

+ (NSString *)trimKey:(NSString*)theKey
              forType:(NSString*)theType {
    NSString* trimmedKey = [AWSPinpointStringUtils clipString:theKey
                                                   toMaxChars:MAX_ENDPOINT_ATTRIBUTE_METRIC_KEY_LENGTH
                                            andAppendEllipses:NO];
    if(trimmedKey.length < theKey.length) {
        AWSDDLogWarn(@"The %@ key has been trimmed to a length of %0d characters", theType, MAX_ENDPOINT_ATTRIBUTE_METRIC_KEY_LENGTH);
    }

    return trimmedKey;
}

+ (NSString *)trimValue:(NSString*)theValue {
    NSString* trimmedValue = [AWSPinpointStringUtils clipString:theValue
                                                     toMaxChars:MAX_ENDPOINT_ATTRIBUTE_VALUE_LENGTH
                                              andAppendEllipses:NO];
    if(trimmedValue.length < theValue.length) {
        AWSDDLogWarn( @"The attribute value has been trimmed to a length of %0d characters", MAX_ENDPOINT_ATTRIBUTE_VALUE_LENGTH);
    }

    return trimmedValue;
}

@end
