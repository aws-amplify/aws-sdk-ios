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

#import "AITestConfiguration.h"

@implementation AITestConfiguration

+(AITestConfiguration *) configurationWithDictionary:(NSDictionary *) theConfiguration
{
    return [[AITestConfiguration alloc] initWithDictionary:theConfiguration];
}

-(id) initWithDictionary:(NSDictionary *)theConfiguration
{
    if(self = [super init])
    {
        self.configuration = [NSMutableDictionary dictionaryWithDictionary:theConfiguration];
    }
    return self;
}

-(BOOL) boolForKey: (NSString*) key
{
    return [self boolForKey:key withOptValue:NO];
}

-(BOOL) boolForKey: (NSString*) key withOptValue:(BOOL) defaultValue
{
    NSObject *value = [self.configuration valueForKey:key];
    if(value)
    {
        NSNumber *num = (NSNumber *)value;
        return [num boolValue];
    }
    else
    {
        return defaultValue;
    }
}

- (int) intForKey: (NSString*) key
{
    return [self intForKey:key withOptValue:0];
}

- (int) intForKey: (NSString*) key withOptValue:(int) defaultValue
{
    NSObject *value = [self.configuration valueForKey:key];
    if(value)
    {
        NSNumber *num = (NSNumber *)value;
        return [num intValue];
    }
    else
    {
        return defaultValue;
    }
}

- (long) longForKey: (NSString*) key
{
    return [self longForKey:key withOptValue:0];
}

- (long) longForKey: (NSString*) key withOptValue:(long) defaultValue
{
    NSObject *value = [self.configuration valueForKey:key];
    if(value)
    {
        NSNumber *num = (NSNumber *)value;
        return [num longValue];
    }
    else
    {
        return defaultValue;
    }
}

- (long long) longLongForKey: (NSString*) key
{
    return [self longLongForKey:key withOptValue:0];
}

- (long long) longLongForKey: (NSString*) key withOptValue:(long long)  defaultValue
{
    NSObject *value = [self.configuration valueForKey:key];
    if(value)
    {
        NSNumber *num = (NSNumber *)value;
        return [num longLongValue];
    }
    else
    {
        return defaultValue;
    }
}

- (double) doubleForKey: (NSString*) key
{
    return [self doubleForKey:key withOptValue:0.0];
}

- (double) doubleForKey: (NSString*) key withOptValue:(double) defaultValue
{
    NSObject *value = [self.configuration valueForKey:key];
    if(value)
    {
        NSNumber *num = (NSNumber *)value;
        return [num doubleValue];
    }
    else
    {
        return defaultValue;
    }
}

- (NSString *) stringForKey: (NSString*) key
{
    return [self stringForKey:key withOptValue:nil];
}

- (NSString *) stringForKey: (NSString*) key withOptValue:(NSString *) defaultValue
{
    NSString *value = [self.configuration valueForKey:key];
    if(!value)
    {
        return defaultValue;
    }
    return value;
}

- (NSArray *) arrayForKey: (NSString*) key
{
    return [self arrayForKey:key withOptValue:[NSArray array]];
}

- (NSArray *) arrayForKey: (NSString*) key withOptValue:(NSArray *) defaultValue
{
    NSArray *value = [self.configuration valueForKey:key];
    if(!value)
    {
        return defaultValue;
    }
    return value;
}

- (id) objectForKey: (NSString*) key
{
    return [self.configuration valueForKey:key];
}

- (void) refresh
{
    
}

-(void) setObject:(NSObject *) theValue forKey:(NSString *)theKey
{
    [self.configuration setValue:theValue forKey:theKey];
}

@end
