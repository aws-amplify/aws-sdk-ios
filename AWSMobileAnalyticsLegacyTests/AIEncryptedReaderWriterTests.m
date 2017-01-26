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

#import "AIEncryptedReaderWriterTests.h"
#import "AWSMobileAnalyticsBufferedReader.h"
#import "AWSMobileAnalyticsWriter.h"
#import "AWSMobileAnalyticsErrorUtils.h"
#import "AWSMockFileManager.h"

//static AIEncryptedWriter* writer = nil;
//static AIEncryptedBufferedReader* reader = nil;


@implementation AIEncryptedReaderWriterTests

-(void)setUp
{
     
}

-(void)test_readLine_encryptedStringsCanBeDecrypted
{
    
    NSOutputStream* outputStream = [NSOutputStream outputStreamToMemory];
    [outputStream open];
    
    AWSMobileAnalyticsWriter* writer = [AWSMobileAnalyticsWriter writerWithOutputStream:outputStream];
    [writer writeLine:@"dead beef is delicious" error:nil];
    [writer writeLine:@"but rice crispy treats are better" error:nil];
    [writer close];
    
    NSData* outputStreamData = [outputStream propertyForKey:NSStreamDataWrittenToMemoryStreamKey];

    NSInputStream* inputStream = [NSInputStream inputStreamWithData:outputStreamData];
    [inputStream open];
    AWSMobileAnalyticsBufferedReader* reader = [AWSMobileAnalyticsBufferedReader readerWithInputStream:inputStream];
 
    
    
    NSString* lineRead = nil;
    NSError* error = nil;
    BOOL success = [reader readLine:&lineRead withError:&error];
    assertThatBool(success, equalToBool(YES));
    assertThat(lineRead, is(@"dead beef is delicious"));
    assertThat(error, is(nilValue()));

    
    success = [reader readLine:&lineRead withError:&error];
    assertThatBool(success, equalToBool(YES));
    assertThat(lineRead, is(@"but rice crispy treats are better"));
    assertThat(error, is(nilValue()));
    
    success = [reader readLine:&lineRead withError:&error];
    assertThatBool(success, equalToBool(YES));
    assertThat(lineRead, is(nilValue()));
    assertThat(error, is(nilValue()));
    
    [reader close];
    
    success = [reader readLine:&lineRead withError:&error];
    assertThatBool(success, equalToBool(NO));
    assertThat(lineRead, is(nilValue()));
    assertThatInteger([error code], is(equalToInteger(AWSBufferedReaderErrorCode_IOStreamClosed)));
}

@end
