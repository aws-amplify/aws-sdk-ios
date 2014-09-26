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

#import "AWSMobileAnalyticsWriter.h"

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@interface AWSMobileAnalyticsWriter()
@property(nonatomic) NSOutputStream* outputStream;
@end

@implementation AWSMobileAnalyticsWriter

+(AWSMobileAnalyticsWriter*)writerWithOutputStream:(NSOutputStream*)outputStream
{
    return [[AWSMobileAnalyticsWriter alloc] initWithOutputStream:outputStream];
}

-(id)initWithOutputStream:(NSOutputStream*)outputStream
{
    if(self = [super init])
    {
        self.outputStream = outputStream;
        
    }
    return self;
}

-(BOOL)write:(NSString*)stringToWrite error:(NSError**)writeError;
{
    NSError* error = nil;
    
    NSData* originalData = [stringToWrite dataUsingEncoding:NSUTF8StringEncoding];
    NSInteger writeAmount = [self.outputStream write:[originalData bytes] maxLength:[originalData length]];
    
    // Write out result to output stream
    if(writeAmount == -1)
    {
        error = [self.outputStream streamError];
    }
    
    if(error != nil && writeError != nil)
    {
        *writeError = error;
    }
    
    return (error == nil);
}

-(BOOL)writeLine:(NSString*)stringToWrite error:(NSError**)writeError
{
    // check if this already ends with newline
    NSString* suffix = [stringToWrite substringFromIndex:[stringToWrite length] - 1];
    NSRange newlineOccurence = [suffix rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]];
    
    NSString* newLineString = stringToWrite;
    if(newlineOccurence.location == NSNotFound)
    {
        newLineString = [NSString stringWithFormat:@"%@\n", stringToWrite];
    }
    
    return [self write:newLineString error:writeError];
}

-(void)close
{
    [self.outputStream close];
}










@end
