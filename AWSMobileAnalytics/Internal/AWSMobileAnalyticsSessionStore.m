/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSMobileAnalyticsSessionStore.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSLogging.h"

NSString *const SESSION_FILE_NAME = @"sessionFile";
NSString *const KEY_SESSION_ID = @"sessionId";
NSString *const KEY_SESSION_START_TIME = @"sessionStartTime";
NSString *const KEY_SESSION_STOP_TIME = @"sessionStopTime";

@interface AWSMobileAnalyticsSessionStore()

@property (nonatomic, strong) NSRecursiveLock *fileLock;
@property (nonatomic, strong) id<AWSMobileAnalyticsFileManager> fileManager;
@property (nonatomic, strong) AWSMobileAnalyticsFile *file;

@end

@implementation AWSMobileAnalyticsSessionStore

- (instancetype)initWithFileManager:(id<AWSMobileAnalyticsFileManager>)fileManager {
    if(self = [super init]) {
        self.fileManager = fileManager;
        NSError *createError;
        self.file = [self.fileManager createFileWithPath:SESSION_FILE_NAME error:&createError];
        if(self.file == nil && createError != nil) {
            if(createError != nil) {
                AWSLogError( @"Error creating session file. %@", [createError localizedDescription]);
            } else {
                AWSLogError( @"The session file could not be created");
            }
            return nil;
        }

    }
    return self;
}

- (AWSMobileAnalyticsSession *)retrievePersistedSessionDetails {
    // get session from file
    NSError *error = nil;
    NSDictionary *serializedSession = [NSDictionary dictionary];

    [self.fileLock lock];
    @try {
        serializedSession = [self.fileManager readDataFromFile:self.file
                                                    withFormat:JSON
                                                     withError:&error];
        [self.fileManager deleteFile:self.file
                               error:&error];
    } @finally {
        [self.fileLock unlock];
    }

    AWSMobileAnalyticsSession* session = [self createSessionFromSerializedDictionary:serializedSession];
    if(session == nil) {
        AWSLogWarn( @"Can not obtain session details from the file. It is common if there is no previous paused session saved in the file.");
        return nil;
    }

    return session;
}

- (AWSMobileAnalyticsSession *)createSessionFromSerializedDictionary:(NSDictionary *)sessionDictionary {
    NSString *sessionId = [sessionDictionary objectForKey:KEY_SESSION_ID];
    NSString *startDateString = [sessionDictionary objectForKey:KEY_SESSION_START_TIME];
    NSString *stopDateString = [sessionDictionary objectForKey:KEY_SESSION_STOP_TIME];

    if(sessionId == nil || startDateString == nil || stopDateString == nil){
        return nil;
    }

    NSDate* startTime = nil;
    NSDate* stopTime = nil;

    // ios doesn't have a way to parse unsigned long longs out of strings,
    // but it does have a way to parse long longs. This should be ok since
    // the long longs still provide the ability to represent time stamps
    // well into the future (hundreds of years)
    long long startTimeMillis = 0;
    long long stopTimeMillis = 0;
    if(![AWSMobileAnalyticsStringUtils stringToLongLong:startDateString
                                           withLongLong:&startTimeMillis]){
        return nil;
    }
    if(![AWSMobileAnalyticsStringUtils stringToLongLong:stopDateString
                                           withLongLong:&stopTimeMillis]){
        return nil;
    }

    startTime = [AWSMobileAnalyticsDateUtils dateFromutcTimeMillis:startTimeMillis];
    stopTime = [AWSMobileAnalyticsDateUtils dateFromutcTimeMillis:stopTimeMillis];
    return [[AWSMobileAnalyticsSession alloc] initWithSessionId:sessionId
                                                  withStartTime:startTime
                                                   withStopTime:stopTime];
}

- (void)persistSessionDetails:(AWSMobileAnalyticsSession *)session {
    NSMutableDictionary* sessionDetails = [NSMutableDictionary new];

    [sessionDetails setObject:session.sessionId forKey:KEY_SESSION_ID];
    [sessionDetails setObject:[@([AWSMobileAnalyticsDateUtils utcTimeMillisFromDate:session.startTime]) stringValue]
                       forKey:KEY_SESSION_START_TIME];
    [sessionDetails setObject:[@([AWSMobileAnalyticsDateUtils utcTimeMillisFromDate:session.stopTime]) stringValue]
                       forKey:KEY_SESSION_STOP_TIME];

    NSError *error = nil;
    [self.fileLock lock];
    BOOL success = NO;
    @try {
        success = [self.fileManager writeData:sessionDetails toFile:self.file withFormat:JSON withError:&error];
    } @finally {
        [self.fileLock unlock];
    }

    if(error != nil || !success) {
        if(error != nil) {
            AWSLogError( @"There was an error while attempting to write the session to the file. %@", [error localizedDescription]);
        } else {
            AWSLogError( @"There was an error while attempting to write the session to the file.");
        }
    }
}

- (BOOL)deletePesistedSession {
    // get settings from prefs
    NSError *error = nil;
    BOOL deleteSuccessful = NO;

    [self.fileLock lock];
    @try {
        deleteSuccessful = [self.fileManager deleteFile:self.file error:&error];
    } @finally {
        [self.fileLock unlock];
    }

    if(error != nil || deleteSuccessful == NO) {
        if(error != nil) {
            AWSLogError( @"There was an error while attempting to delete the session file. %@", [error localizedDescription]);
        } else {
            AWSLogError( @"There was an error while attempting to delete the session file.");
        }
        
        return NO;
    }
    
    return YES;
}

@end
