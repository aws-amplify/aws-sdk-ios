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

#import "AIFileEventStoreTests.h"
#import "AWSMockFileManager.h"

static NSString *const APP_KEY = @"app_key";
static NSString *const PRIVATE_KEY = @"private_key";
static NSString *const UNIQUE_ID = @"BEEFBEEF-BEEF-BEEF-BEEF-BEEFBEEFBEEF";
static NSString *const SDK_NAME = @"MobileAnalyticsSDK-IOS";
static NSString *const SDK_VERSION = @"2.0.dev-build";

@interface AWSMobileAnalyticsIOSSystem(Testing)

+ (NSString *) rootFileDirectoryWithFileManager:(NSFileManager *) theFileManager;

@end

@implementation AIFileEventStoreTests

-(void) setUp
{
     
    [self tearDown];
    self.system = [[AWSMobileAnalyticsIOSSystem alloc] initWithIdentifier:APP_KEY];
}

-(void) tearDown
{
    NSFileManager *internalFileManager = [NSFileManager defaultManager];
    NSString *rootPath = [AWSMobileAnalyticsIOSSystem rootFileDirectoryWithFileManager:internalFileManager];
    NSString *absolutePath = [rootPath stringByAppendingPathComponent:AWSMobileAnalyticsRoot];
    
    NSError *error;
    [internalFileManager removeItemAtPath:absolutePath error:&error];
}

/* encrpytion has been removed from Analytics SDK, this test doesn't work any more */

//-(void) test_FileEventStoreWithChangedPrefix_verifyOnlyNewEventsAreReadAndOldEventsAreSkipped
//{
//    AIInsightsContextBuilder *builder = [[AIInsightsContextBuilder alloc] init];
//    [builder withAppKey:APP_KEY];
//    [builder withPrivateKey:PRIVATE_KEY];;
//    [builder withUniqueId:UNIQUE_ID];
//    [builder withSdkName:SDK_NAME andSDKVersion:SDK_VERSION];
//    [builder withFileManager:self.system.fileManager];
//    [builder withConfiguration:[AITestConfiguration configurationWithDictionary:[NSDictionary dictionary]]];
//    id<AIInsightsContext> context = [builder build];
//    
//    AWSMobileAnalyticsFileEventStore *eventStore = [AWSMobileAnalyticsFileEventStore fileStoreWithContext:context];
//    
//    NSDictionary *config = [NSDictionary dictionaryWithObject:@"different" forKey:@"encryptionPrefix"];
//    
//    AIInsightsContextBuilder *builderDifferent = [[AIInsightsContextBuilder alloc] init];
//    [builderDifferent withAppKey:APP_KEY];
//    [builderDifferent withPrivateKey:PRIVATE_KEY];;
//    [builderDifferent withUniqueId:UNIQUE_ID];
//    [builderDifferent withSdkName:SDK_NAME andSDKVersion:SDK_VERSION];
//    [builderDifferent withFileManager:self.system.fileManager];
//    [builderDifferent withConfiguration:[AITestConfiguration configurationWithDictionary:config]];
//
//    id<AIInsightsContext> newContext = [builderDifferent build];
//    AWSMobileAnalyticsFileEventStore *newEventStore = [AWSMobileAnalyticsFileEventStore fileStoreWithContext:newContext];
//    
//    NSError *error = nil;
//    [eventStore put:@"1" withError:&error];
//    [newEventStore put:@"2" withError:&error];
//    [eventStore put:@"3" withError:&error];
//    [newEventStore put:@"4" withError:&error];
//    [eventStore put:@"5" withError:&error];
//    [newEventStore put:@"6" withError:&error];
//    [eventStore put:@"7" withError:&error];
//    [newEventStore put:@"8" withError:&error];
//    [eventStore put:@"9" withError:&error];
//    [newEventStore put:@"10" withError:&error];
//    
//    int lineNumber = [self getNumberOfLinesInFile:context.system.fileManager withFileName:[eventStore eventsFile] ];
//    assertThatInt(lineNumber, is(equalToInt(10)));
//    
//    id<AIEventIterator> iter = newEventStore.iterator;
//    NSString *nextEvent = nil;
//    int counter = 0;
//    while((nextEvent = iter.next) != nil)
//    {
//        counter++;
//        assertThatInt([nextEvent intValue], is(equalToInt(counter * 2)));
//    }
//    assertThatInt(counter, is(equalToInt(5)));
//    [iter removeReadEvents];
//    
//    lineNumber = [self getNumberOfLinesInFile:context.system.fileManager withFileName:[eventStore eventsFile] ];
//    assertThatInt(lineNumber, is(equalToInt(0)));
//}


-(void) test_FileEventStore_putIterateAndRemove
{
    AIInsightsContextBuilder *builder = [[AIInsightsContextBuilder alloc] init];
    [builder withAppKey:APP_KEY];
    [builder withPrivateKey:PRIVATE_KEY];;
    [builder withUniqueId:UNIQUE_ID];
    [builder withSdkName:SDK_NAME andSDKVersion:SDK_VERSION];
    [builder withFileManager:self.system.fileManager];
    [builder withConfiguration:[AITestConfiguration configurationWithDictionary:[NSDictionary dictionary]]];
    id<AWSMobileAnalyticsContext> context = [builder build];
    
    AWSMobileAnalyticsFileEventStore *eventStore = [AWSMobileAnalyticsFileEventStore fileStoreWithContext:context];
    
    //Put some events into the store
    NSError *error = nil;
    [eventStore put:@"1" withError:&error];
    [eventStore put:@"2" withError:&error];
    [eventStore put:@"3" withError:&error];
    [eventStore put:@"4" withError:&error];
    [eventStore put:@"5" withError:&error];
    [eventStore put:@"6" withError:&error];
    [eventStore put:@"7" withError:&error];
    [eventStore put:@"8" withError:&error];
    [eventStore put:@"9" withError:&error];
    [eventStore put:@"10" withError:&error];
    
    
    //Use the iterator to read through the events in the store
    int counter = 0;
    id<AWSMobileAnalyticsEventIterator> iter = eventStore.iterator;
    while([iter hasNext]) {
        counter++;
        NSString *event = [iter next];
        assertThatInt([event intValue], is(equalToInt(counter)));
        //If we read 5 events remove the 5 last read events
        if(counter % 5 == 0) {
            [iter removeReadEvents];
            int lineNumber = [self getNumberOfLinesInFile:context.system.fileManager withFileName:[eventStore eventsFile]];
            assertThatInt(lineNumber, is(equalToInt(10-counter)));
        }
    }
    
    //Put some events into the store
    [eventStore put:@"1" withError:&error];
    [eventStore put:@"2" withError:&error];
    [eventStore put:@"3" withError:&error];
    [eventStore put:@"4" withError:&error];
    [eventStore put:@"5" withError:&error];
    [eventStore put:@"6" withError:&error];
    [eventStore put:@"7" withError:&error];
    [eventStore put:@"8" withError:&error];
    [eventStore put:@"9" withError:&error];
    [eventStore put:@"10" withError:&error];
    NSString *nextEvent = nil;
    counter = 0;
    iter = eventStore.iterator;
    while((nextEvent = [iter next]) != nil) {
        counter++;
        assertThatInt([nextEvent intValue], is(equalToInt(counter)));
    }
    [iter removeReadEvents];
    int lineNumber = [self getNumberOfLinesInFile:context.system.fileManager withFileName:[eventStore eventsFile] ];
    assertThatInt(lineNumber, is(equalToInt(0)));
    
    
    //Try getting a new iterator while the store is empty and verify that hasNext is false
    iter = eventStore.iterator;
    assertThatBool([iter hasNext], is(equalToBool(NO)));
    assertThat(iter.next, is(nilValue()));
    
    //Put another event in the store and try to read it back out with a new iterator.
    [eventStore put:@"11" withError:&error];
    iter = eventStore.iterator;
    
    //Try peeking and the next event more than once and verify it will only show the next event each time
    assertThat([iter peek], is(equalTo(@"11")));
    assertThat([iter peek], is(equalTo(@"11")));
    
    while([iter hasNext]) {
        NSString *event = [iter next];
        assertThatInt([event intValue], is(equalToInt(11)));
    }
}


-(void) test_WhenEventsFileIsMissingAndEventsDirectoryIsReadOnly_error
{
    AIInsightsContextBuilder *builder = [[AIInsightsContextBuilder alloc] init];
    [builder withAppKey:APP_KEY];
    [builder withPrivateKey:PRIVATE_KEY];;
    [builder withUniqueId:UNIQUE_ID];
    [builder withSdkName:SDK_NAME andSDKVersion:SDK_VERSION];
    [builder withFileManager:self.system.fileManager];
    [builder withConfiguration:[AITestConfiguration configurationWithDictionary:[NSDictionary dictionary]]];
    id<AWSMobileAnalyticsContext> context = [builder build];
    
    AWSMobileAnalyticsFileEventStore *eventStore = [AWSMobileAnalyticsFileEventStore fileStoreWithContext:context];
    
    NSError *error;
    [[NSFileManager defaultManager] setAttributes:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:NSFileImmutable] ofItemAtPath:eventStore.eventsFile.absolutePath error:&error];
    
    [eventStore put:@"2" withError:&error];
    
    assertThat(error, is(notNilValue()));
    
    [[NSFileManager defaultManager] setAttributes:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:NSFileImmutable] ofItemAtPath:eventStore.eventsFile.absolutePath error:&error];
}


-(void) test_WhenWritingExceedsMaxStorageSize_noMoreEventWritten
{
    NSDictionary *config = [NSDictionary dictionaryWithObject:[NSNumber numberWithLongLong:80] forKey:@"maxStorageSize"];
    
    AIInsightsContextBuilder *builder = [[AIInsightsContextBuilder alloc] init];
    [builder withAppKey:APP_KEY];
    [builder withPrivateKey:PRIVATE_KEY];
    [builder withUniqueId:UNIQUE_ID];
    [builder withSdkName:SDK_NAME andSDKVersion:SDK_VERSION];
    [builder withFileManager:self.system.fileManager];
    [builder withConfiguration:[AITestConfiguration configurationWithDictionary:config]];
    
    id<AWSMobileAnalyticsContext> context = [builder build];
    AWSMobileAnalyticsFileEventStore *eventStore = [AWSMobileAnalyticsFileEventStore fileStoreWithContext:context];
    
    NSError *error;
    for(int i=0;i<7;i++) {
        [eventStore put:@"0123456789" withError:&error];
    }
    assertThatUnsignedLongLong([eventStore.eventsFile length], is(equalToInteger(77)));
    
    [eventStore put:@"0123456789" withError:&error];
    assertThatUnsignedLongLong([eventStore.eventsFile length], is(equalToInteger(77)));
}


-(void) test_multithreads_finishesInTimeAndNothingLost
{
    NSDictionary *config = [NSDictionary dictionaryWithObject:[NSNumber numberWithLongLong:1024 * 1024 * 50L] forKey:@"maxStorageSize"];
    
    AIInsightsContextBuilder *builder = [[AIInsightsContextBuilder alloc] init];
    [builder withAppKey:APP_KEY];
    [builder withPrivateKey:PRIVATE_KEY];
    [builder withUniqueId:UNIQUE_ID];
    [builder withSdkName:SDK_NAME andSDKVersion:SDK_VERSION];
    [builder withFileManager:self.system.fileManager];
    [builder withConfiguration:[AITestConfiguration configurationWithDictionary:config]];
    
    id<AWSMobileAnalyticsContext> context = [builder build];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue setMaxConcurrentOperationCount:10];
    
    __block AWSMobileAnalyticsFileEventStore *eventStore = [AWSMobileAnalyticsFileEventStore fileStoreWithContext:context];
    int operationCounts = 20;
    int eventCounts = 100;
    
    NSDate *start = [NSDate date];
    
    for(int i=0;i<operationCounts;i++)
    {
        [queue addOperationWithBlock:^(void) {
            NSError *error;
            
            for(int i=0;i<eventCounts;i++)
            {
                [eventStore put:[NSString stringWithFormat:@"%d", i] withError:&error];
            }
        }];
    }
    
    [queue waitUntilAllOperationsAreFinished];
    
    NSDate *end = [NSDate date];
    
    NSTimeInterval duration = [end timeIntervalSinceDate:start];
    NSLog(@"It took %f to write %d events", duration, operationCounts*eventCounts);
    assertThatBool(duration > 20.0, is(equalToBool(NO)));
    
    id<AWSMobileAnalyticsEventIterator> iter = eventStore.iterator;
    int linesRead = 0;
    NSMutableDictionary *values = [NSMutableDictionary dictionary];
    while([iter hasNext])
    {
        NSString *value = [iter next];
        linesRead++;
        NSNumber *counts = [values objectForKey:value];
        if(counts != nil)
        {
            NSNumber *newCounts = [NSNumber numberWithInt:[counts intValue] + 1];
            [values setObject:newCounts forKey:value];
        }
        else
        {
            [values setObject:[NSNumber numberWithInt:1] forKey:value];
        }
    }
    
    assertThatInt(linesRead, is(equalToInt(operationCounts * eventCounts)));
    for(NSNumber *count in [values allValues])
    {
        assertThatInt([count intValue], is(equalToInt(operationCounts)));
    }
}

-(int) getNumberOfLinesInFile:(id<AWSMobileAnalyticsFileManager>) theFileManager withFileName:(AWSMobileAnalyticsFile *) theFile
{
    AWSMobileAnalyticsBufferedReader *reader = [self getEventsFileReader:theFileManager withFileName:theFile];
    if(reader == nil)
    {
        return 0;
    }
    
    int counter = 0;
    NSError *error = nil;
    NSString *line = [NSString string];
    while(line != nil)
    {
        [reader readLine:&line withError:&error];
        if(line != nil)
        {
            counter++;
        }
    }
    return counter;
}

-(AWSMobileAnalyticsBufferedReader *) getEventsFileReader:(id<AWSMobileAnalyticsFileManager>) theFileManager withFileName:(AWSMobileAnalyticsFile *) theFile
{
    NSError *error = nil;
    NSInputStream *inputStream = [theFileManager newInputStream:theFile error:&error];
    
    if(error != nil || inputStream == nil)
    {
        return nil;
    }
    
    return [AWSMobileAnalyticsBufferedReader readerWithInputStream:inputStream withBufferLength:1024 * 10];
}

@end
