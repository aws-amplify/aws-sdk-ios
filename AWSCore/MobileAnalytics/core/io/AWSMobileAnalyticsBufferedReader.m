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

#import "AWSMobileAnalyticsBufferedReader.h"
#import "AWSMobileAnalyticsErrorUtils.h"


unsigned int const AWSDefaultBufferSize = 8 * 1024;

NSString * const AWSBufferedReaderErrorDomain = @"com.amazon.insights-framework.AWSBufferedReaderErrorDomain";

@interface AWSMobileAnalyticsBufferedReader()

@property(nonatomic) NSInputStream* inputStream;
@property(nonatomic) NSMutableString* readFromStream;
@property(nonatomic) unsigned int bufferLength;
@property(nonatomic) NSMutableData* streamBuffer;
@property(nonatomic) NSObject* lockObject;

@end


@implementation AWSMobileAnalyticsBufferedReader

+(AWSMobileAnalyticsBufferedReader*)readerWithInputStream:(NSInputStream*)stream
{
    return [AWSMobileAnalyticsBufferedReader readerWithInputStream:stream withBufferLength:AWSDefaultBufferSize];
}

+(AWSMobileAnalyticsBufferedReader*)readerWithInputStream:(NSInputStream*)stream
                         withBufferLength:(unsigned int)bufferLength
{
    return [[AWSMobileAnalyticsBufferedReader alloc] initWithInputStream:stream withBufferLength:bufferLength];
}

-(id)initWithInputStream:(NSInputStream*)stream
        withBufferLength:(unsigned int)bufferLength
{
    if(self = [super init])
    {
        self.inputStream = stream;
        self.bufferLength = bufferLength;
        self.readFromStream = [[NSMutableString alloc] initWithCapacity:bufferLength];
        self.streamBuffer = [NSMutableData dataWithLength:bufferLength];
        self.lockObject = [[NSObject alloc] init];
    }
    return self;
}


-(BOOL)readLine:(NSString**)line withError:(NSError**)readError
{
    
    NSString* returnString = nil;
    NSError* error = nil;
    
    // do checks for improper state of underlying input stream
    if([self.inputStream streamStatus] == NSStreamStatusClosed)
    {
        error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSBufferedReaderErrorDomain
                              withDescription:@"The underlying stream is closed"
                                withErrorCode:AWSBufferedReaderErrorCode_IOStreamClosed];
    }
    
    
    if(self.readFromStream && error == nil)
    {
        // TODO: See if we can refactor this into a smaller critical section
        @synchronized (self.lockObject) {
            NSRange newlineOccurence = [self.readFromStream rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]];
            while (newlineOccurence.location == NSNotFound && [self.inputStream hasBytesAvailable])
            {
                uint8_t* dataBuffer = (uint8_t*)[self.streamBuffer mutableBytes];
                NSInteger readAmount = [self.inputStream read:dataBuffer maxLength:self.bufferLength];
                
                if(readAmount > 0)
                {
                    NSString* readString = [[NSString alloc] initWithBytes:dataBuffer
                                                                    length:readAmount
                                                                  encoding:NSUTF8StringEncoding];
                    
                    // append the new chunck of data to what we've read and re-evaluate the loop
                    [self.readFromStream appendString:readString];
                    newlineOccurence = [self.readFromStream rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]];
                }
                else
                {
                    error = [self.inputStream streamError];
                    break;
                }
            }
            
            if(error == nil)
            {
                if(newlineOccurence.location == NSNotFound)
                {
                    // we read through the entire file but couldn't find another new line, so just
                    // return what we have.
                    if([self.readFromStream length] > 0)
                    {
                        returnString = [self.readFromStream copy];
                    }

                    // at this point, we have nothing left to read
                    // so clear out buffers so that we always return
                    // nil until we are closed.
                    [self clearBuffers];

                }
                else
                {
                    // return the entire line (not including the newline char)
                    returnString = [self.readFromStream substringToIndex:newlineOccurence.location];
                    
                    // remove from the string buffer what we are returning (incluing the newline)
                    [self.readFromStream deleteCharactersInRange:NSMakeRange(0, newlineOccurence.location + 1)];
                }
            }
        }
    }
    
    if(line != nil)
    {
        *line = returnString;
    }

    if(error != nil && readError != nil)
    {
        *readError = error;
    }
    
    return (error == nil);
}



-(void)close
{
    [self.inputStream close];
    [self clearBuffers];
}

-(void)clearBuffers
{
    self.readFromStream  = nil;
    self.streamBuffer = nil;
}


@end
