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

#import "AWSMobileAnalyticsDefaultConfiguration.h"

@interface AWSMobileAnalyticsDefaultConfiguration()
@property(strong, nonatomic)NSDictionary* settings;

@end

@implementation AWSMobileAnalyticsDefaultConfiguration


+(AWSMobileAnalyticsDefaultConfiguration*)configurationWithSettings:(NSDictionary*) settings {
    return [[AWSMobileAnalyticsDefaultConfiguration alloc] initWithSettings:settings];
}

-(id)  initWithSettings:(NSDictionary*) settings {
    if(self = [super init]) {
        self.settings = settings;
    }
    return self;
}


-(BOOL)boolForKey: (NSString*) key withOptValue:(BOOL)defaultValue {
    BOOL value = defaultValue;
    @try {
        id idValue = [self objectForKey:key];
        if(idValue != nil) {
            value = [idValue boolValue];
        }
    }
    @catch (NSException *exception) {
        value = defaultValue;
    }
    return value;
}

- (int) intForKey: (NSString*) key withOptValue:(int) defaultValue {
    int value = defaultValue;
    @try {
        id idValue = [self objectForKey:key];
        if(idValue != nil) {
            value = [idValue intValue];
        }
    }
    @catch (NSException *exception) {
        value = defaultValue;
    }
    return value;
}

- (long) longForKey: (NSString*) key withOptValue:(long) defaultValue {
    long value = defaultValue;
    @try {
        id idValue = [self objectForKey:key];
        if(idValue != nil) {
            value = [idValue longValue];
        }
    }
    @catch (NSException *exception) {
        value = defaultValue;
    }
    return value;
}

- (long long) longLongForKey: (NSString*) key withOptValue:(long long) defaultValue {
    long long value = defaultValue;
    @try {
        id idValue = [self objectForKey:key];
        if(idValue != nil) {
            value = [idValue longLongValue];
        };
    }
    @catch (NSException *exception) {
        value = defaultValue;
    }
    return value;
}

- (double) doubleForKey: (NSString*) key withOptValue:(double) defaultValue {
    double value = defaultValue;
    @try {
        id idValue = [self objectForKey:key];
        if(idValue != nil) {
            value = [idValue doubleValue];
        }
    }
    @catch (NSException *exception) {
        value = defaultValue;
    }
    return value;
}

- (NSString *) stringForKey: (NSString*) key {
    return [self objectForKey:key];
}

- (NSString *) stringForKey: (NSString*) key withOptValue:(NSString *) defaultValue {
    NSString *value = [self stringForKey:key];
    if(value != nil) {
        return value;
    } else {
        return defaultValue;
    }
}

- (NSArray *) arrayForKey: (NSString*) key {
    return [self objectForKey:key];
}

- (NSArray *) arrayForKey: (NSString*) key withOptValue:(NSArray *) defaultValue {
    NSArray *value = [self arrayForKey:key];
    if(value != nil) {
        return value;
    } else {
        return defaultValue;
    }
}

- (id) objectForKey: (NSString*) key {
    if(key == nil) {
        return nil;
    }

    return [self.settings objectForKey:key];
}

@end
