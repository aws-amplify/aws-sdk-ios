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

#import <sys/xattr.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "AWSMobileAnalyticsIOSSystem.h"
#import "AWSMobileAnalyticsIOSLifeCycleManager.h"
#import "AWSLogging.h"

@implementation AWSMobileAnalyticsIOSSystem

-(id) initWithIdentifier: (NSString*) theIdentifier
{
    NSFileManager *internalFileManager = [NSFileManager defaultManager];
    return [self initWithIdentifier:theIdentifier withRootPath:[AWSMobileAnalyticsIOSSystem rootFileDirectoryWithFileManager:internalFileManager]];
}

-(id) initWithIdentifier: (NSString*) theIdentifier withRootPath:(NSString*) theRootPath
{
    if(self = [super init])
    {
        self.connectivity = nil;
        self.fileManager = nil;
        self.preferences = nil;

        _lifeCycleManager = [AWSMobileAnalyticsIOSLifeCycleManager manager];

        Reachability *reachability = [Reachability reachabilityForInternetConnection];
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

        if([rootDirectory exists])
        {
            //Set cache attributes for the root directory
            [self addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:[theRootPath stringByAppendingPathComponent:AWSMobileAnalyticsRoot]]
                                    withFileManager:internalFileManager];

            self.fileManager = [[AWSMobileAnalyticsDefaultFileManager alloc] initWithFileManager: internalFileManager
                                                                                    withRootFile: rootDirectory];

            self.preferences = [AWSMobileAnalyticsIOSPreferences preferencesWithFileManager:self.fileManager];
        }
        else
        {
            AWSLogError( @"The Mobile Analytics root directory could not be created");
            NSAssert([rootDirectory exists], @"The Mobile Analytics root directory could not be created");
        }
    }
    return self;
}

+ (NSString *) rootFileDirectoryWithFileManager:(NSFileManager *) theFileManager
{
    NSArray* possibleURLs = [theFileManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask];
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
