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

#import "AWSMobileAnalyticsBase64Utils.h"

static const char base64EncodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

static const short base64DecodingTable[] =
{
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -2, -1, -1, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, 62, -2, -2, -2, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -2, -2, -2, -2, -2, -2,
    -2,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -2, -2, -2, -2, -2,
    -2, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2
};

@implementation AWSMobileAnalyticsBase64Utils

+(NSString *) base64EncodedString:(NSData*)theData
{
    NSMutableString *result;
    unsigned char   *raw;
    unsigned long         length;
    short           i, nCharsToWrite;
    long          cursor;
    unsigned char   inbytes[3], outbytes[4];
    
    length = [theData length];
    
    if (length < 1) {
        return @"";
    }
    
    result = [NSMutableString stringWithCapacity:length];
    raw    = (unsigned char *)[theData bytes];
    // Take 3 chars at a time, and encode to 4
    for (cursor = 0; cursor < length; cursor += 3) {
        for (i = 0; i < 3; i++) {
            if (cursor + i < length) {
                inbytes[i] = raw[cursor + i];
            }
            else{
                inbytes[i] = 0;
            }
        }
        
        outbytes[0] = (inbytes[0] & 0xFC) >> 2;
        outbytes[1] = ((inbytes[0] & 0x03) << 4) | ((inbytes[1] & 0xF0) >> 4);
        outbytes[2] = ((inbytes[1] & 0x0F) << 2) | ((inbytes[2] & 0xC0) >> 6);
        outbytes[3] = inbytes[2] & 0x3F;
        
        nCharsToWrite = 4;
        
        switch (length - cursor) {
            case 1:
                nCharsToWrite = 2;
                break;
                
            case 2:
                nCharsToWrite = 3;
                break;
        }
        for (i = 0; i < nCharsToWrite; i++) {
            [result appendFormat:@"%c", base64EncodingTable[outbytes[i]]];
        }
        for (i = nCharsToWrite; i < 4; i++) {
            [result appendString:@"="];
        }
    }
    
    return [NSString stringWithString:result]; // convert to immutable string
}

+(NSData *) dataWithBase64EncodedString:(NSString *)encodedString
{
    if (nil == encodedString || [encodedString length] < 1) {
        return [NSData data];
    }
    
    // If encodedString is not in base64 subset, return nil
    NSCharacterSet* base64Charset = [NSCharacterSet characterSetWithCharactersInString:
     [NSString stringWithCString:base64EncodingTable encoding:NSASCIIStringEncoding]];
    NSString* trimmedData = [encodedString stringByTrimmingCharactersInSet:
                             [NSCharacterSet characterSetWithCharactersInString:@"="]];
    if ([trimmedData rangeOfCharacterFromSet:[base64Charset invertedSet]].location != NSNotFound)
        return nil;
    
    const char    *inputPtr;
    unsigned char *buffer;
    
    NSInteger     length;
    
    inputPtr = [encodedString cStringUsingEncoding:NSASCIIStringEncoding];
    length   = strlen(inputPtr);
    char ch;
    NSInteger inputIdx = 0, outputIdx = 0, padIdx;
    
    buffer = calloc(length, sizeof(unsigned char));
    
    while (((ch = *inputPtr++) != '\0') && (length-- > 0)) {
        if (ch == '=') {
            if (*inputPtr != '=' && ((inputIdx % 4) == 1)) {
                free(buffer);
                return nil;
            }
            continue;
        }
        
        ch = base64DecodingTable[ch];
        
        if (ch < 0) { // whitespace or other invalid character
            continue;
        }
        
        switch (inputIdx % 4) {
            case 0:
                buffer[outputIdx] = ch << 2;
                break;
                
            case 1:
                buffer[outputIdx++] |= ch >> 4;
                buffer[outputIdx]    = (ch & 0x0f) << 4;
                break;
                
            case 2:
                buffer[outputIdx++] |= ch >> 2;
                buffer[outputIdx]    = (ch & 0x03) << 6;
                break;
                
            case 3:
                buffer[outputIdx++] |= ch;
                break;
        }
        
        inputIdx++;
    }
    
    padIdx = outputIdx;
    
    if (ch == '=') {
        switch (inputIdx % 4) {
            case 1:
                free(buffer);
                return nil;
                
            case 2:
                padIdx++;
                
            case 3:
                buffer[padIdx] = 0;
        }
    }
    
    NSData *objData = [[NSData alloc] initWithBytes:buffer length:outputIdx];
    free(buffer);
    return objData;
}


@end
