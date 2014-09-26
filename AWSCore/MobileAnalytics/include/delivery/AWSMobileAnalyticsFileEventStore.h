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

#import <Foundation/Foundation.h>
#import "../core/AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsEventStore.h"
#import "../core/io/AWSMobileAnalyticsBufferedReader.h"
#import "../core/io/AWSMobileAnalyticsWriter.h"
#import "../core/configuration/AWSMobileAnalyticsConfigurationKeys.h"
#import "../core/util/AWSMobileAnalyticsErrorUtils.h"

FOUNDATION_EXPORT NSString * const AWSEventsDirectoryName;
FOUNDATION_EXPORT NSString * const AWSEventsFilename;

@interface AWSMobileAnalyticsFileEventStore : NSObject<AWSMobileAnalyticsEventStore>
 
+(AWSMobileAnalyticsFileEventStore *) fileStoreWithContext:(id<AWSMobileAnalyticsContext>) theContext;

-(id) initWithContext: (id<AWSMobileAnalyticsContext>) theContext;

-(BOOL) put:(NSString *) theEvent withError:(NSError**) theError;

-(id<AWSMobileAnalyticsEventIterator>) iterator;

@property (nonatomic, readwrite) id<AWSMobileAnalyticsContext> context;

@property (nonatomic, readwrite) AWSMobileAnalyticsFile *eventsFile;

@property (nonatomic, readwrite) NSRecursiveLock *lock;


@end

@interface AWSFileEventIterator : NSObject<AWSMobileAnalyticsEventIterator>

-(id) initFileStore:(AWSMobileAnalyticsFileEventStore *) theEventStore;

-(void) removeReadEvents;

-(NSString *) peek;

-(BOOL) hasNext;

-(NSString *) next;

@property (nonatomic, readwrite) AWSMobileAnalyticsFileEventStore *eventStore;

@property (nonatomic, readwrite) int linesRead;

@property (nonatomic, readwrite) NSString* nextBuffer;

@property (nonatomic, readwrite) AWSMobileAnalyticsBufferedReader *reader;

@property (nonatomic, readwrite) BOOL isEndOfFile;

@end
