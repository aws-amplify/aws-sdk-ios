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

#import "AWSMobileAnalyticsFileEventStore.h"
#import "AWSLogging.h"

NSString * const AWSEventsDirectoryName = @"events";
NSString * const AWSEventsFilename = @"eventsFile";

@implementation AWSMobileAnalyticsFileEventStore

+(AWSMobileAnalyticsFileEventStore *) fileStoreWithContext:(id<AWSMobileAnalyticsContext>) theContext
{
    NSAssert(theContext != nil, @"The context cannot be nil");
    NSAssert(theContext.identifier != nil, @"The context identifier cannot be nil");
    NSAssert(theContext.configuration != nil, @"The configuration cannot be nil");
    NSAssert(theContext.system != nil, @"The system cannot be nil");
    
    if(theContext == nil)
    {
        AWSLogError( @"Could not construct the AWSMobileAnalyticsFileEventStore because the context was nil");
        return nil;
    }
   
    return [[AWSMobileAnalyticsFileEventStore alloc] initWithContext:theContext
                                          ];
}

-(id) initWithContext:(id<AWSMobileAnalyticsContext>) theContext

{
    if(self = [super init])
    {
        NSAssert(theContext != nil, @"The context must not be nil");
        if(theContext == nil)
        {
            AWSLogError( @"The context must not be nil.");
            return nil;
        }
        self.context = theContext;
        id<AWSMobileAnalyticsFileManager> fileManager = self.context.system.fileManager;
        self.lock = [[NSRecursiveLock alloc] init];

        NSError* error;
		AWSMobileAnalyticsFile *eventsDirectory = [fileManager createDirectory:AWSEventsDirectoryName error:&error];
        NSAssert(error == nil, @"There should not be an error when creating the events directory. Error: %@", [error localizedDescription]);
        if(error != nil || eventsDirectory == nil || ![eventsDirectory exists])
        {
            AWSLogError( @"Unable to create events directory - An error occurred while attempting to create the events directory. Error: %@", [error localizedDescription]);
            return nil;
        }
        
		self.eventsFile = [fileManager createFileWithPath:self.eventsFileName error:&error];
		
        NSAssert(error == nil, @"There should not be an error when creating the events file. Error: %@", [error localizedDescription]);
        if(error != nil || self.eventsFile == nil || ![self.eventsFile exists])
        {
            AWSLogError( @"Unable to open events file - An error occurred while attempting to create/open the events file. Error: %@", [error localizedDescription]);
            return nil;
        }
        
       
    }
    return self;
}

-(NSString *) eventsFileName
{
    return [AWSEventsDirectoryName stringByAppendingPathComponent:AWSEventsFilename];
}

-(BOOL) put:(NSString *) theEvent withError:(NSError **) theError
{
    
    NSError *error = nil;
    AWSMobileAnalyticsWriter *writer = nil;
    [self.lock lock];
    @try
    {
        [self tryInitializeWriter:&writer error:&error];
        if(error != nil || writer == nil)
        {
            AWSLogError( @"Unable to write event to file - There was an error while attempting to create the writer. Error: %@", [error localizedDescription]);
            [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
            return NO;
        }
        int maxStorageSize = [self.context.configuration intForKey:AWSKeyMaxStorageSize withOptValue:AWSValueMaxStorageSize];
        if([theEvent length] + [self.eventsFile length] <= maxStorageSize)
        {
            [writer writeLine:theEvent error:&error];
        }
        else
        {
            AWSLogError( @"The events file exceeded its allowed size of %d bytes.", maxStorageSize);
        }
        
        if(error != nil)
        {
            AWSLogError( @"Unable to write event to file - There was an error while attempting to write to the writer. Error: %@", [error localizedDescription]);
        }
        [writer close];
    }
    @finally
    {
        [self.lock unlock];
    }
    
    [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
    
    return error?NO:YES;
}

-(BOOL) tryInitializeWriter:(AWSMobileAnalyticsWriter **) theWriter error:(NSError **) theError
{
    NSError *error = nil;
    *theWriter = nil;
    NSOutputStream *stream = [self.context.system.fileManager newOutputStream:self.eventsFile appendMode:YES error:&error];
    AWSMobileAnalyticsWriter *writer = [AWSMobileAnalyticsWriter writerWithOutputStream:stream];
    if(error != nil)
    {
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return NO;
    } else {
        *theWriter = writer;
        [AWSMobileAnalyticsErrorUtils safeSetError:theError withError:error];
        return YES;
    }
}

-(id<AWSMobileAnalyticsEventIterator>) iterator
{
    return [[AWSFileEventIterator alloc] initFileStore:self];
}

-(AWSMobileAnalyticsFile *) deleteReadEvents:(int) theLineNumber
{
    //Write all events after line number to a temporary file
    id<AWSMobileAnalyticsFileManager> fileManager = self.context.system.fileManager;
    AWSMobileAnalyticsFile *origEventsFile = self.eventsFile;

    NSError *error = nil;
    AWSMobileAnalyticsFile *tempEventsFile = [fileManager createFileWithPath:[self.eventsFileName stringByAppendingString:@".tmp"] error:&error];
    if(error != nil || tempEventsFile == nil || ![tempEventsFile exists])
    {
        AWSLogError( @"There was an error while attempting to create temporary events file. Error: %@", [error localizedDescription]);
        return self.eventsFile;
    }
    
    if([origEventsFile exists])
    {
        NSInputStream *inStream = [fileManager newInputStream:origEventsFile error:&error];
        AWSMobileAnalyticsBufferedReader *reader = [AWSMobileAnalyticsBufferedReader readerWithInputStream:inStream];
        
        NSOutputStream *outStream = [fileManager newOutputStream:tempEventsFile appendMode:YES error:&error];
        AWSMobileAnalyticsWriter *writer = [AWSMobileAnalyticsWriter writerWithOutputStream:outStream];

        if(error == nil)
        {
            NSString *line = nil;
            int currentLineNumber = 0;
            while ([reader readLine:&line withError:&error] && line != nil && error == nil)
            {
                currentLineNumber++;
                if (currentLineNumber > theLineNumber)
                {
                    [writer writeLine:line error:&error];
                    if(error != nil)
                    {
                        break;
                    }
                }
            }
            [writer close];
            [reader close];
        }
        
        if(error == nil)
        {
            if([origEventsFile deleteFile])
            {
                if([tempEventsFile renameTo:AWSEventsFilename])
                {
                    self.eventsFile = [fileManager createFileWithPath:self.eventsFileName error:&error];
                }
                else
                {
                    AWSLogError( @"Failed to rename temp file to events file");
                }
            }
            else
            {
                AWSLogError( @"Failed to delete previous events file");
            }
        }
        else
        {
            if([tempEventsFile exists] && [tempEventsFile length] == 0)
            {
                if(![tempEventsFile deleteFile])
                {
                    AWSLogError( @"Failed to delete the empty temp events file");
                }
            }
        }
    }

    return self.eventsFile;
}

@end

@implementation AWSFileEventIterator

-(id) initFileStore:(AWSMobileAnalyticsFileEventStore *) theEventStore
{
    if(self = [super init])
    {
        self.eventStore = theEventStore;
        self.linesRead = 0;
        self.nextBuffer = nil;
        self.reader = nil;
        self.isEndOfFile = NO;
    }
    return self;
}

-(BOOL) tryOpenReader
{
    if(self.reader != nil)
    {
        return YES;
    }
    
    if(!self.isEndOfFile)
    {
        NSError *error;
        id<AWSMobileAnalyticsFileManager> fileManager = self.eventStore.context.system.fileManager;
        NSInputStream *inputStream = [fileManager newInputStream:self.eventStore.eventsFile error:&error];
        
        if(error != nil || inputStream == nil)
        {
            AWSLogError( @"There was an error while attempting to create output stream to event file. Error: %@", [error localizedDescription]);
            return NO;
        }
        
        AWSMobileAnalyticsBufferedReader *bufferedReader = [AWSMobileAnalyticsBufferedReader readerWithInputStream:inputStream];
        
        self.reader = bufferedReader;
        
        return YES;
    }
    return NO;
}

-(void) tryCloseReader
{
    if(self.reader != nil) {
        [self.eventStore.lock lock];
        @try
        {
            [self.reader close];
        }
        @finally
        {
            self.reader = nil;
            [self.eventStore.lock unlock];
        }
    }
}

-(void) removeReadEvents
{
    [self.eventStore.lock lock];
    @try
    {
        [self.eventStore deleteReadEvents:self.linesRead];
        [self resetReader];
    }
    @finally
    {
        [self.eventStore.lock unlock];
    }
}

-(NSString *) peek
{
    [self hasNext];
    return self.nextBuffer;
}

-(BOOL) hasNext
{
    BOOL hasNext = NO;
    
    //If there is something already buffered then there is a next
    if(self.nextBuffer != nil) {
        hasNext = YES;
    } else {
        [self.eventStore.lock lock];
        @try
        {
            if(![self tryOpenReader])
            {
                return hasNext;
            }
            //Nothing was previously buffered so try to read one more line
            BOOL found = NO;
            while(!found)
            {
                NSString *line = nil;
                NSError *error = nil;
                BOOL success = [self.reader readLine:&line withError:&error];
                
                if(success)
                {
                    self.nextBuffer = line;
                    found = YES;
                }
                else if(error)
                {
                    self.linesRead++;
                    found = NO;
                }
                else
                {
                    self.nextBuffer = nil;
                    found = YES;
                }
            }
            if(self.nextBuffer != nil)
            {
                //There was at least one more line so there is a next
                hasNext = YES;
            }
            else
            {
                //The next line was nil so it should be the end of the file. Try to close the reader
                self.isEndOfFile = YES;
                [self tryCloseReader];
            }
        }
        @finally
        {
            [self.eventStore.lock unlock];
        }
    }
    return hasNext;
}

-(NSString *) next
{
    NSString *next = nil;
    
    if(self.nextBuffer != nil)
    {
        next = self.nextBuffer;
        self.linesRead++;
        self.nextBuffer = nil;
    }
    else
    {
        [self.eventStore.lock lock];
        @try
        {
            if(![self tryOpenReader]) {
                return next;
            }
            BOOL found = NO;
            while(!found) {
                NSString *line = nil;
                NSError *error = nil;
                BOOL success = [self.reader readLine:&line withError:&error];
                
                if(success)
                {
                    next = line;
                    found = YES;
                }
                else if(error)
                {
                    self.linesRead++;
                    found = NO;
                }
                else
                {
                    next = nil;
                    found = YES;
                }
            }
            
            if(next != nil)
            {
                self.linesRead++;
            }
            else
            {
                self.isEndOfFile = true;
                [self tryCloseReader];
            }
        }
        @finally
        {
            [self.eventStore.lock unlock];
        }
    }
    
    return next;
}

-(void) resetReader
{
    [self tryCloseReader];
    self.linesRead = 0;
    self.nextBuffer = nil;
}

@end