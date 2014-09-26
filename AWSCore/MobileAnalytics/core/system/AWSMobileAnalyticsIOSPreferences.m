/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AWSMobileAnalyticsIOSPreferences.h"
#import "AWSLogging.h"

NSString * const AWSPreferencesFilename = @"preferences";

NSString * const AWSIOSPreferencesErrorDomain = @"com.amazon.insights-framework.AWSIOSPreferencesErrorDomain";

@interface AWSMobileAnalyticsIOSPreferences()

@property (nonatomic, readwrite) AWSMobileAnalyticsFile* file;
@property (nonatomic, readwrite) id<AWSMobileAnalyticsFileManager> fileManager;
@property (nonatomic, readwrite) NSMutableDictionary* preferences;

@end

@implementation AWSMobileAnalyticsIOSPreferences

+ (AWSMobileAnalyticsIOSPreferences *) preferencesWithFileManager:(id<AWSMobileAnalyticsFileManager>) theFileManager
{
    return [[AWSMobileAnalyticsIOSPreferences alloc] initWithFileManager:theFileManager];
}

- (id) initWithFileManager:(id<AWSMobileAnalyticsFileManager>) theFileManager
{
    if(self = [super init])
    {
        NSAssert(theFileManager != nil, @"The file manager should not have been nil");
        if(theFileManager == nil)
        {
            AWSLogError( @"The file manager should not have been nil");
            return nil;
        }
        
        self.fileManager = theFileManager;
        
        NSError *createError;
        self.file = [self.fileManager createFileWithPath:AWSPreferencesFilename error:&createError];
        if(self.file != nil && createError == nil)
        {
            [self loadPreferences];
        }
        else
        {
            if(createError != nil)
            {
                AWSLogError( @"Error creating preferences file. %@", [createError localizedDescription]);
            }
            else
            {
                AWSLogError( @"The preferences file could not be created");
            }
            return nil;
        }
    }
    return self;
}

- (void) writePreferences
{
    NSError *error = nil;
    BOOL success = [self.fileManager writeData:self.preferences toFile:self.file withFormat:JSON withError:&error];
    if(error != nil || !success)
    {
        if(error != nil)
        {
            AWSLogError( @"There was an error while attempting to write the preferences to the file. %@", [error localizedDescription]);
        }
        else
        {
            AWSLogError( @"There was an error while attempting to write the preferences to the file.");
        }
    }
}

- (void) loadPreferences
{
    NSError *error = nil;
    NSDictionary *prefs = [self.fileManager readDataFromFile:self.file withFormat:JSON withError:&error];

    if(error != nil || prefs == nil)
    {
        if(error != nil)
        {
            AWSLogWarn( @"Unable to load the preferences from the file. %@. It is common if the file has not been created yet.", [error localizedDescription]);
        }
        else
        {
            AWSLogError( @"There was an error while attempting to load the preferences from the file.");
        }
        
    }

    if(prefs == nil)
    {
        self.preferences = [NSMutableDictionary dictionary];
    }
    else
    {
        self.preferences = [NSMutableDictionary dictionaryWithDictionary:prefs];
    }
}

- (BOOL) boolForKey:(NSString*) theKey withOptValue:(BOOL) defaultValue
{
    if(self.preferences == nil)
    {
        AWSLogWarn( @"The preferences were nil");
        return defaultValue;
    }
    else if([AWSMobileAnalyticsStringUtils isBlank:theKey])
    {
        AWSLogWarn( @"The key was blank");
        return defaultValue;
    }

    id prefValue = nil;
    @synchronized(self)
    {
        prefValue = [self.preferences objectForKey:theKey];
    }
    
    BOOL value = defaultValue;
    if([AWSMobileAnalyticsStringUtils stringToBool:prefValue withBool:&value])
    {
        return value;
    }
    return defaultValue;
}

- (int) intForKey:(NSString*) theKey withOptValue:(int) defaultValue
{
    if(self.preferences == nil)
    {
        AWSLogWarn( @"The preferences were nil");
        return defaultValue;
    }
    else if([AWSMobileAnalyticsStringUtils isBlank:theKey])
    {
        AWSLogWarn( @"The key was blank");
        return defaultValue;
    }
    
    id prefValue = nil;
    @synchronized(self)
    {
        prefValue = [self.preferences objectForKey:theKey];
    }
    
    int value = defaultValue;
    if([AWSMobileAnalyticsStringUtils stringToInt:prefValue withInt:&value])
    {
        return value;
    }
    return defaultValue;
}

- (long long) longLongForKey:(NSString*) theKey withOptValue:(long long) defaultValue
{
    if(self.preferences == nil)
    {
        AWSLogWarn( @"The user defaults were nil");
        return defaultValue;
    }
    else if([AWSMobileAnalyticsStringUtils isBlank:theKey])
    {
        AWSLogWarn( @"The key was blank");
        return defaultValue;
    }
    
    id prefValue = nil;
    @synchronized(self)
    {
        prefValue = [self.preferences objectForKey:theKey];
    }
    
    long long value = defaultValue;
    if([AWSMobileAnalyticsStringUtils stringToLongLong:prefValue withLongLong:&value])
    {
        return value;
    }
    return defaultValue;
}

- (double) doubleForKey:(NSString*) theKey withOptValue:(double) defaultValue
{
    if(self.preferences == nil)
    {
        AWSLogWarn( @"The preferences were nil");
        return defaultValue;
    }
    else if([AWSMobileAnalyticsStringUtils isBlank:theKey])
    {
        AWSLogWarn( @"The key was blank");
        return defaultValue;
    }

    id prefValue = nil;
    @synchronized(self)
    {
        prefValue = [self.preferences objectForKey:theKey];
    }
    
    double value = defaultValue;
    if([AWSMobileAnalyticsStringUtils stringToDouble:prefValue withDouble:&value])
    {
        return value;
    }
    return defaultValue;
}

- (NSString *) stringForKey:(NSString*) theKey withOptValue:(NSString *) defaultValue
{
    if(self.preferences == nil)
    {
        AWSLogWarn( @"The preferences were nil");
        return defaultValue;
    }
    else if([AWSMobileAnalyticsStringUtils isBlank:theKey])
    {
        AWSLogWarn( @"The key was blank");
        return defaultValue;
    }
    
    NSString *string = nil;
    @synchronized(self)
    {
        string = [self.preferences objectForKey:theKey];
    }
    
    if(string != nil)
    {
        return string;
    }
    return defaultValue;
}

- (void) putBool:(BOOL) theValue forKey:(NSString*) theKey
{
    if(theValue)
    {
        [self putString:@"YES" forKey:theKey];
    }
    else
    {
        [self putString:@"NO" forKey:theKey];
    }
}

- (void) putInt:(int) theValue forKey:(NSString*) theKey
{
    [self putString:[[NSNumber numberWithInt:theValue] stringValue] forKey:theKey];
}

- (void) putLongLong:(long long) theValue forKey:(NSString*) theKey
{
    [self putString:[[NSNumber numberWithLongLong:theValue] stringValue] forKey:theKey];
}

- (void) putDouble:(double) theValue forKey:(NSString*) theKey
{
    [self putString:[[NSNumber numberWithDouble:theValue] stringValue] forKey:theKey];
}

- (void) putString:(NSString*) theValue forKey:(NSString*) theKey
{
    if(self.preferences == nil)
    {
        AWSLogWarn( @"The preferences were nil");
        return;
    }
    else if([AWSMobileAnalyticsStringUtils isBlank:theKey])
    {
        AWSLogWarn( @"The key was blank");
        return;
    }
    else if(theValue == nil)
    {
        AWSLogWarn( @"The key was nil");
        return;
    }
    
    @synchronized(self)
    {
        [self.preferences setObject:theValue forKey:theKey];
        [self writePreferences];
    }
}

@end
