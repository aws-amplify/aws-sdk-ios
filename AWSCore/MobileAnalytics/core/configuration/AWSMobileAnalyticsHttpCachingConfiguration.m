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


//TODO: This class is obsolete and there is no configuration service
//      It is a known component throughout the SDK. It was kept because so many other classes depended on it
#import "AWSMobileAnalyticsHttpCachingConfiguration.h"
#import "AWSMobileAnalyticsHttpClient.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsJSONSerializer.h"
#import "AWSMobileAnalyticsConfigurationKeys.h"
#import "AWSMobileAnalyticsSerializerFactory.h"
#import "AWSLogging.h"

static NSString* const CONFIG_KEY = @"configuration";
static NSString* const CONFIG_KEY_LAST_SYNC = @"configuration.lastSyncDate";
//static const NSTimeInterval DEFAULT_SYNC_INTERVAL = 60 * 60; // 60 minutes, comment out to suppress unused variable warnings
static NSString* const UNIQUE_ID_HEADER_NAME = @"x-amzn-UniqueId";
static NSString* const CONFIG_URL_FORMAT = @"%@/applications/%@/configuration";

NSString * const AWSConfigurationFileStoreFilename = @"configuration";

@interface AWSMobileAnalyticsHttpCachingConfiguration()
@property(nonatomic)id<AWSMobileAnalyticsHttpClient> httpClient;
@property(nonatomic)NSDictionary* settings;
@property(nonatomic)id<AWSMobileAnalyticsPreferences> preferences;
@property(nonatomic)id<AWSMobileAnalyticsConnectivity> connectivity;
@property(nonatomic)NSOperationQueue* operationQueue;
@property(nonatomic)NSString* uniqueId;
@property(nonatomic)NSString* applicationKey;
@property(nonatomic)id<AWSMobileAnalyticsFileManager> fileManager;
@property(nonatomic)AWSMobileAnalyticsFile* file;
@property(nonatomic)NSTimeInterval lastConfigSyncTimestamp;
@property(nonatomic)NSRecursiveLock *fileLock;
@end

@implementation AWSMobileAnalyticsHttpCachingConfiguration

+(AWSMobileAnalyticsHttpCachingConfiguration*)configurationWithContext:(id<AWSMobileAnalyticsContext>)context
                                       withFileManager:(id<AWSMobileAnalyticsFileManager>)fileManager
                                  withOverrideSettings:(NSDictionary*)overrideSettings
                                    withOperationQueue:(NSOperationQueue*)operationQueue
{
    return [[AWSMobileAnalyticsHttpCachingConfiguration alloc] initWithContext:context
                                               withFileManager:fileManager
                                          withOverrideSettings:overrideSettings
                                            withOperationQueue:operationQueue
                         ];
}

-(id)  initWithContext:(id<AWSMobileAnalyticsContext>)context
       withFileManager:(id<AWSMobileAnalyticsFileManager>)fileManager
  withOverrideSettings:(NSDictionary*)overrideSettings
    withOperationQueue:(NSOperationQueue*)operationQueue

{
    if(self = [super init])
    {
        self.httpClient = [context httpClient];
        self.applicationKey = context.identifier;
        self.fileManager = fileManager;
   
        self.preferences = context.system.preferences;
        self.connectivity = context.system.connectivity;
        self.lastConfigSyncTimestamp = [self.preferences doubleForKey:CONFIG_KEY_LAST_SYNC withOptValue:0.0];
        self.operationQueue = operationQueue;
        NSError *createError;
        self.file = [self.fileManager createFileWithPath:AWSConfigurationFileStoreFilename error:&createError];
        if(self.file != nil && createError == nil)
        {
            self.settings = [self loadPersistedSettingsAndMergeWith:overrideSettings];
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

-(NSDictionary*)loadPersistedSettingsAndMergeWith:(NSDictionary*)overrideSettings
{
    // get settings from prefs
    NSMutableDictionary* finalSettings = [NSMutableDictionary dictionary];
    NSError *error = nil;
    NSDictionary* serializedSettings = [NSDictionary dictionary];
    [self.fileLock lock];
    @try
    {
        serializedSettings = [self.fileManager readDataFromFile:self.file withFormat:JSON withError:&error];
    }
    @finally
    {
        [self.fileLock unlock];
    }
    
    if(error != nil || serializedSettings == nil)
    {
        if(error != nil)
        {
            AWSLogWarn( @"Unable to load the configuration from the file. %@, it is common if the file has not been created yet.", [error localizedDescription]);
            // Reset to never synchronized status if the file cannot be read due to missing file or corrupted file
            [self.preferences putDouble:0.0 forKey:CONFIG_KEY_LAST_SYNC];
            self.lastConfigSyncTimestamp = 0.0;
        }
        else
        {
            AWSLogError( @"There was an error while attempting to load the confinguration from the file.");
        }
        return overrideSettings;
    }

    [finalSettings addEntriesFromDictionary:serializedSettings];
    
    // overwrite any settings in the override dictionary
    for(NSString* key in [overrideSettings allKeys])
    {
        [finalSettings setValue:[overrideSettings objectForKey:key] forKey:key];
    }
    return finalSettings;
}

-(void)saveConfiguration:(NSDictionary*)configurationSettings
{
    NSError *error = nil;
    [self.fileLock lock];
    BOOL success = NO;
    @try
    {
        success = [self.fileManager writeData:configurationSettings toFile:self.file withFormat:JSON withError:&error];
    }
    @finally
    {
        [self.fileLock unlock];
    }
    if(error != nil || !success)
    {
        if(error != nil)
        {
            AWSLogError( @"There was an error while attempting to write the configuration to the file. %@", [error localizedDescription]);
        }
        else
        {
            AWSLogError( @"There was an error while attempting to write the configuration to the file.");
        }
    }
}

-(BOOL)boolForKey: (NSString*) key withOptValue:(BOOL)defaultValue
{
    BOOL value = defaultValue;
    @try {
        id idValue = [self objectForKey:key];
        if(idValue != nil)
        {
            value = [idValue boolValue];
        }
    }
    @catch (NSException *exception) {
        value = defaultValue;
    }
    return value;
}

- (int) intForKey: (NSString*) key withOptValue:(int) defaultValue
{
    int value = defaultValue;
    @try {
        id idValue = [self objectForKey:key];
        if(idValue != nil)
        {
            value = [idValue intValue];
        }
    }
    @catch (NSException *exception) {
        value = defaultValue;
    }
    return value;
}

- (long) longForKey: (NSString*) key withOptValue:(long) defaultValue
{
    long value = defaultValue;
    @try {
        id idValue = [self objectForKey:key];
        if(idValue != nil)
        {
            value = [idValue longValue];
        }
    }
    @catch (NSException *exception) {
        value = defaultValue;
    }
    return value;
}

- (long long) longLongForKey: (NSString*) key withOptValue:(long long) defaultValue
{
    long long value = defaultValue;
    @try {
        id idValue = [self objectForKey:key];
        if(idValue != nil)
        {
            value = [idValue longLongValue];
        };
    }
    @catch (NSException *exception) {
        value = defaultValue;
    }
    return value;
}

- (double) doubleForKey: (NSString*) key withOptValue:(double) defaultValue
{
    double value = defaultValue;
    @try {
        id idValue = [self objectForKey:key];
        if(idValue != nil)
        {
            value = [idValue doubleValue];
        }
    }
    @catch (NSException *exception) {
        value = defaultValue;
    }
    return value;
}

- (NSString *) stringForKey: (NSString*) key
{
    return [self objectForKey:key];
}

- (NSString *) stringForKey: (NSString*) key withOptValue:(NSString *) defaultValue
{
    NSString *value = [self stringForKey:key];
    if(value != nil)
    {
        return value;
    }
    else
    {
        return defaultValue;
    }
}

- (NSArray *) arrayForKey: (NSString*) key
{
    return [self objectForKey:key];
}

- (NSArray *) arrayForKey: (NSString*) key withOptValue:(NSArray *) defaultValue
{
    NSArray *value = [self arrayForKey:key];
    if(value != nil)
    {
        return value;
    }
    else
    {
        return defaultValue;
    }
}

- (id) objectForKey: (NSString*) key
{
    if(key == nil) 
    {
        return nil;
    }
    
    return [self.settings objectForKey:key];
}

-(void) refresh
{
//    [self.operationQueue addOperationWithBlock:^{
//        
//        // TODO: Note the Java and ios sdk use the same key for sync interval but one is for ms- and one for secs
//        NSTimeInterval syncInterval = [self doubleForKey:AWSKeySyncInterval withOptValue:AWSValueSyncInterval];
//        NSTimeInterval currentDate = [[NSDate date] timeIntervalSince1970];
//        if(currentDate > self.lastConfigSyncTimestamp + syncInterval && self.connectivity.isConnected)
//        {
//            // create a config request
//            id<AIRequest> configRequest = [AWSMobileAnalyticsHttpCachingConfiguration createConfigurationRequestWithClient:self.httpClient
//                                                                                                  withHost:[self stringForKey:AWSKeyConfigHost withOptValue:AWSValueConfigHost]
//                                                                                        withApplicationKey:self.applicationKey
//                                                                                              withUniqueId:self.uniqueId];
//            
//            id<AIResponse> configResponse = [self.httpClient execute:configRequest
//                                                         withRetries:[self intForKey:AWSKeyConfigMaxRetries withOptValue:AWSValueConfigMaxRetries]
//                                                         withTimeout:[self intForKey:AWSKeyConfigRequestTimeout withOptValue:AWSValueConfigRequestTimeout]];
//            
//            if ([configResponse code]/100 == 2)
//            {
//                // persist the response (which should be json)
//                NSDictionary* serverConfig = [[AWSMobileAnalyticsAISerializerFactory serializerFromFormatType:JSON] readObject:[configResponse response]];
//                [self saveConfiguration:serverConfig];
//                
//                // store the last sync time
//                NSTimeInterval nowTimestamp = [[NSDate date] timeIntervalSince1970];
//                [self.preferences putDouble:nowTimestamp forKey:CONFIG_KEY_LAST_SYNC];
//                
//                @synchronized(self)
//                {
//                    self.lastConfigSyncTimestamp = nowTimestamp;
//                }
//                
//                AWSLogDebug( @"\n==========Server-synced Configuration==========\n%@", serverConfig);
//            }
//        }
//    }];
}


+(id<AWSMobileAnalyticsRequest>)createConfigurationRequestWithClient:(id<AWSMobileAnalyticsHttpClient>)client
                                            withHost:(NSString*)host
                                  withApplicationKey:(NSString*)appId
                                        withUniqueId:(NSString*)uniqueId
{
    id<AWSMobileAnalyticsRequest> configRequest = [client freshRequest];
    NSString* url = [NSString stringWithFormat:CONFIG_URL_FORMAT, host, appId];
    [configRequest setUrl:[NSURL URLWithString:url]];
    [configRequest setMethod:GET];
    [configRequest addHeader:uniqueId forName:UNIQUE_ID_HEADER_NAME];

    return configRequest;
}




@end
