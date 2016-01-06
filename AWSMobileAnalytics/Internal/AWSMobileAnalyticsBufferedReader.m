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
        self.streamBuffer = [NSMutableData new];
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
                uint8_t dataBuffer[self.bufferLength];
                NSInteger readAmount = [self.inputStream read:dataBuffer maxLength:self.bufferLength];
                
                if(readAmount > 0)
                {
                    [self.streamBuffer setLength:0];
                    [self.streamBuffer appendBytes:(const void *)dataBuffer length:readAmount];
                    
                    /* if readString is nil, we probably are reading a multibytes characters
                     (e.g. Euro Sign "U+20AC" is 3 bytes char, "U+10348" is a 4 bytes char) and encounter a partial character. We need to continue
                     read byte by byte to a max of 4 bytes until the whole character has been read from inputStream
                     */
                    NSString* readString = nil;
                    NSInteger count = 1;
                    while ((readString = [[NSString alloc] initWithData:self.streamBuffer encoding:NSUTF8StringEncoding]) == nil) {
                        uint8_t aByteBuff[1];
                        NSInteger len = [self.inputStream read:aByteBuff maxLength:1];
                        if (len > 0) {
                            [self.streamBuffer appendBytes:(const void *)aByteBuff length:len];
                        } else {
                            //break if it is end of stream or any error occured.
                            break;
                        }
                        
                        //according to RFC3629, no UTF8 encoded character has a length larger than 4 bytes.
                        if (count < 4) {
                            count++;
                        } else {
                            break;
                        }
                    }
                    
                    if (readString == nil) {
                        error = [AWSMobileAnalyticsErrorUtils errorWithDomain:AWSBufferedReaderErrorDomain
                                                              withDescription:@"unable to parse string, make sure it is a valid UTF8 string"
                                                                withErrorCode:AWSBufferedReaderErrorCode_UnableToParseString];
                        break;
                    }

                    
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
