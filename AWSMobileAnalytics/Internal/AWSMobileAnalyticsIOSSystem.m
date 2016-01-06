//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <sys/xattr.h>
#import <UIKit/UIKit.h>
#import "AWSReachability.h"
#import "AWSMobileAnalyticsIOSSystem.h"
#import "AWSMobileAnalyticsIOSLifeCycleManager.h"
#import "AWSLogging.h"
#import "AWSCategory.h"
#import "AWSMobileAnalyticsIOSPreferences.h"

static NSString* const UNIQUE_ID_KEY = @"UniqueId";

@implementation AWSMobileAnalyticsIOSSystem

-(id) initWithIdentifier:(NSString*)theIdentifier {
    NSFileManager *internalFileManager = [NSFileManager defaultManager];
    return [self initWithIdentifier:theIdentifier
                 insightsPrivateKey:nil
                       withRootPath:[AWSMobileAnalyticsIOSSystem rootFileDirectoryWithFileManager:internalFileManager]];
}

-(id) initWithIdentifier:(NSString*)theIdentifier
      insightsPrivateKey:(NSString *)insightsPrivateKey {
    NSFileManager *internalFileManager = [NSFileManager defaultManager];
    return [self initWithIdentifier:theIdentifier
                 insightsPrivateKey:insightsPrivateKey
                       withRootPath:[AWSMobileAnalyticsIOSSystem rootFileDirectoryWithFileManager:internalFileManager]];
}

-(id) initWithIdentifier:(NSString *)theIdentifier
      insightsPrivateKey:(NSString *)insightsPrivateKey
            withRootPath:(NSString *)theRootPath {
    if(self = [super init]) {
        self.connectivity = nil;
        self.fileManager = nil;
        self.preferences = nil;

        _lifeCycleManager = [AWSMobileAnalyticsIOSLifeCycleManager manager];

        AWSReachability *reachability = [AWSReachability reachabilityForInternetConnection];
        self.connectivity = [[AWSMobileAnalyticsIOSConnectivity alloc] initWithReachability:reachability];

        NSFileManager *internalFileManager = [NSFileManager defaultManager];

        //create the directory path where the application's data will reside
        NSString *appDirPath = [AWSMobileAnalyticsRoot stringByAppendingPathComponent:theIdentifier];
        //Make the path absolute to the application current directory
        NSString *absolutePath = [theRootPath stringByAppendingPathComponent:appDirPath];

        AWSMobileAnalyticsFile *rootDirectory = [[AWSMobileAnalyticsFile alloc] initWithFileMananager: internalFileManager
                                                                                     withAbsolutePath: absolutePath];

        NSAssert(rootDirectory != nil, @"The root directory should not be nil");
        if(![rootDirectory exists])
        {
            if(![rootDirectory mkdirs])
            {
                AWSLogError( @"Failed to create data directory for path %@", absolutePath);
            }
        }
        
        //-----------------------Start Migration ----------------------------------------
        NSString *cachesClientId = nil;
        BOOL migration_result = [self migrateMobileAnalyticsDataWithIdentifier:theIdentifier
                                                            insightsPrivateKey:insightsPrivateKey
                                                                  absolutePath:absolutePath
                                                                  withRootFile:rootDirectory
                                                             cachesClientIDRef:&cachesClientId];
        if ( NO == migration_result) {
            AWSLogError(@"AMA Migration Failed");
        }
        //----------------------End Migration --------------------------------------------

        if([rootDirectory exists])
        {
            //Set cache attributes for the root directory
            [self addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:[theRootPath stringByAppendingPathComponent:AWSMobileAnalyticsRoot]]
                                    withFileManager:internalFileManager];

            self.fileManager = [[AWSMobileAnalyticsDefaultFileManager alloc] initWithFileManager: internalFileManager
                                                                                    withRootFile: rootDirectory];

            self.preferences = [AWSMobileAnalyticsIOSPreferences preferencesWithFileManager:self.fileManager
                                                                         insightsPrivateKey:insightsPrivateKey];
            
            //Part of Migration, set the clientID read from Caches Directory
            if (cachesClientId) {
                [self.preferences putString:cachesClientId forKey:UNIQUE_ID_KEY];
            }
        }
        else
        {
            AWSLogError( @"The Mobile Analytics root directory could not be created");
            NSAssert([rootDirectory exists], @"The Mobile Analytics root directory could not be created");
        }
    }
    return self;
}
- (BOOL)migrateMobileAnalyticsDataWithIdentifier:(NSString *)theIdentifier
                              insightsPrivateKey:(NSString *)insightsPrivateKey
                                    absolutePath:(NSString *)absolutePath
                                    withRootFile:(AWSMobileAnalyticsFile *)rootDirectory
                               cachesClientIDRef:(NSString **)cachesClientIDRef {
    
    NSFileManager *internalFileManager = [NSFileManager defaultManager];
    
    // Check if client_id can be retrieved from ApplicationSupport/com.amazonaws.MobileAnalytics/AppId/preferences
    AWSMobileAnalyticsDefaultFileManager *appSupportDirAMAFileManager = [[AWSMobileAnalyticsDefaultFileManager alloc] initWithFileManager: internalFileManager
                                                                                                                             withRootFile: rootDirectory];
    AWSMobileAnalyticsIOSPreferences *pref = [AWSMobileAnalyticsIOSPreferences preferencesWithFileManager:appSupportDirAMAFileManager
                                                                                       insightsPrivateKey:insightsPrivateKey];
    
    if ([[pref stringForKey:UNIQUE_ID_KEY withOptValue:nil] length] == 0) {
        
        NSURL *cachesDirectoryURL = [[internalFileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] firstObject];
        NSString *cachesRootPath = [cachesDirectoryURL path];
        
        
        // Check if Caches/mobile-analytics/AppId directory exists.
        NSString *cachesDirAbsolutePath = [[cachesRootPath stringByAppendingPathComponent:@"mobile-analytics"] stringByAppendingPathComponent:theIdentifier];
        if ([internalFileManager fileExistsAtPath: cachesDirAbsolutePath]) {
            return [self performMigrateMobileAnalyticsDataWithInsightsPrivateKey:insightsPrivateKey
                                                                    absolutePath:absolutePath
                                                               cachesClientIDRef:cachesClientIDRef
                                                     cachesDirectoryAbsolutePath:cachesDirAbsolutePath];
        }
        
    }
    return YES;
}

- (BOOL)performMigrateMobileAnalyticsDataWithInsightsPrivateKey:(NSString *)insightsPrivateKey
                                                   absolutePath:(NSString *)absolutePath
                                              cachesClientIDRef:(NSString **)cachesClientIDRef
                                    cachesDirectoryAbsolutePath:(NSString *)cachesDirAbsolutePath{
    
    NSFileManager *internalFileManager = [NSFileManager defaultManager];
    // Copy AWSPreferencesFilename file from Caches/mobile-analytics/AppId/preferences to ApplicationSupport/com.amazonaws.MobileAnalytics/AppId/preferences
    NSError *prefError = nil;
    NSString *cachesPrefPath = [cachesDirAbsolutePath stringByAppendingPathComponent:AWSPreferencesFilename];
    NSString *appSupportPrefPath = [absolutePath stringByAppendingPathComponent:AWSPreferencesFilename];
    BOOL prefCopySucceeded = [internalFileManager aws_atomicallyCopyItemAtURL:[NSURL fileURLWithPath:cachesPrefPath]
                                                                        toURL:[NSURL fileURLWithPath:appSupportPrefPath]
                                                               backupItemName:@"com.amazonaws.MobileAnalytics.backUpItem"
                                                                        error:&prefError];
    if ( NO == prefCopySucceeded) {
        AWSLogError(@"[Migration] Failed to copy preferences file. error:%@",prefError);
        
        if ( NO == [self readClientIDFromCachesDirectoryWithInsightsPrivateKey:insightsPrivateKey
                                                             cachesClientIDRef:cachesClientIDRef
                                                   cachesDirectoryAbsolutePath:cachesDirAbsolutePath]) {
            return NO;
        }
        
        
    }
    
    NSString *cachesEventsPath = [cachesDirAbsolutePath stringByAppendingPathComponent:@"events"];
    NSString *appSupportEventsPath = [absolutePath stringByAppendingPathComponent:@"events"];
    NSError *eventsError = nil;
    BOOL eventsCopySucceeded = [internalFileManager aws_atomicallyCopyItemAtURL:[NSURL fileURLWithPath:cachesEventsPath]
                                                                          toURL:[NSURL fileURLWithPath:appSupportEventsPath]
                                                                 backupItemName:@"com.amazonaws.MobileAnalytics.backUpItem"
                                                                          error:&eventsError];
    if (eventsCopySucceeded) {
        //remove events in caches directory
        NSError *removeError = nil;
        if ( NO == [internalFileManager removeItemAtPath:cachesEventsPath error:&removeError]) {
            AWSLogWarn(@"[Migration] Failed to remove cachesEventsPath. error:%@", removeError);
        }
        
    } else {
        AWSLogWarn(@"[Migration] Failed to copy Events directory. error:%@",eventsError);
    }
    
    return YES;
}

-(BOOL)readClientIDFromCachesDirectoryWithInsightsPrivateKey:(NSString *)insightsPrivateKey
                                           cachesClientIDRef:(NSString **)cachesClientIDRef
                                 cachesDirectoryAbsolutePath:(NSString *)cachesDirAbsolutePath {
    
    NSFileManager *internalFileManager = [NSFileManager defaultManager];
    
    // read the client_id from Caches/mobile-analytics/AppId/preferences,
    AWSMobileAnalyticsFile *cachesRootDirectory = [[AWSMobileAnalyticsFile alloc] initWithFileMananager: internalFileManager
                                                                                       withAbsolutePath: cachesDirAbsolutePath];
    
    AWSMobileAnalyticsDefaultFileManager *cachesDirAMAFileManager = [[AWSMobileAnalyticsDefaultFileManager alloc] initWithFileManager: internalFileManager
                                                                                                                         withRootFile: cachesRootDirectory];
    AWSMobileAnalyticsIOSPreferences *pref = [AWSMobileAnalyticsIOSPreferences preferencesWithFileManager:cachesDirAMAFileManager
                                                                                       insightsPrivateKey:insightsPrivateKey];
    
    NSString *clientID = [pref stringForKey:UNIQUE_ID_KEY withOptValue:nil];
    // If successfully read, cachesClientID will be write to self.preferences later.
    if (clientID && cachesClientIDRef) {
        *cachesClientIDRef = clientID;
        return YES;
    } else {
        return NO;
    }
}

+ (NSString *) rootFileDirectoryWithFileManager:(NSFileManager *) theFileManager
{
    NSArray* possibleURLs = [theFileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask];
    NSURL *url = [possibleURLs objectAtIndex:0];
    return [url path];
}


- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)theUrl withFileManager:(NSFileManager *)theFileManager
{
    NSError *error = nil;
    BOOL success = [theUrl setResourceValue: [NSNumber numberWithBool: YES]
                                     forKey: NSURLIsExcludedFromBackupKey
                                      error: &error];
    if(!success){
        AWSLogError( @"Error excluding %@ from backup %@", [theUrl lastPathComponent], error);
    }
    return success;
}

@end
