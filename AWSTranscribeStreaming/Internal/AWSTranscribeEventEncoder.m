//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSTranscribeEventEncoder.h"
#import "AWSTranscribeStreamingModel.h"
#import <CommonCrypto/CommonDigest.h>
#import <zlib.h>
#import <AWSCore/AWSCore.h>

@implementation AWSTranscribeEventEncoder

+(NSData *)getEndFrameData {
    NSDictionary<NSString *, NSString *> *endHeaders = @{
                                                        @":message-type": @"event",
                                                        @":event-type": @"AudioEvent"
                                                        };
    
    return [AWSTranscribeEventEncoder encodeChunk:[@"" dataUsingEncoding:NSUTF8StringEncoding]
                                          headers:endHeaders];
}

+(NSData *)encodeChunk:(NSData *)data
               headers:(NSDictionary<NSString *, NSString *> *)headers {
    
    NSUInteger headersLen = 0;
    for (NSString *key in headers) {
        headersLen += [key length];
        headersLen += [headers[key] length];
        headersLen += 4;
    }
    
    NSUInteger payloadLength = [data length];
    NSUInteger headerLength = headersLen;
    NSUInteger messageLength = 16 + payloadLength + headerLength;
    
    NSMutableData *resultData = [[NSMutableData alloc] initWithCapacity:messageLength];
    
    int messageLengthToEncode = (int)messageLength;
    messageLengthToEncode = CFSwapInt32HostToBig(messageLengthToEncode);
    [resultData appendBytes:&messageLengthToEncode length:sizeof(messageLengthToEncode)];
    int headerLengthToEncode = (int)headerLength;
    headerLengthToEncode = CFSwapInt32HostToBig(headerLengthToEncode);
    [resultData appendBytes:&headerLengthToEncode length:sizeof(headerLengthToEncode)];
    NSData *preludeData = [resultData subdataWithRange:NSMakeRange(0, 8)];
    
    unsigned long crc = crc32(0, preludeData.bytes, (int)preludeData.length);
    
    uint32_t crcInt = CFSwapInt32HostToBig((uint32_t)crc);
    [resultData appendBytes:&crcInt length:sizeof(crcInt)];
    
    for (NSString *headerKey in headers) {
        UInt8 headerKeyLen = (UInt8)[headerKey length];
        
        uint16_t headerValLen = (uint16_t)[headers[headerKey] length];
        headerValLen = CFSwapInt16(headerValLen);
        
        [resultData appendBytes:&headerKeyLen length:sizeof(headerKeyLen)];
        NSData *headerData = [headerKey dataUsingEncoding:NSUTF8StringEncoding];
        [resultData appendBytes:[headerData bytes] length:[headerData length]];
        UInt8 headerType = 7;
        [resultData appendBytes:&headerType length:sizeof(headerType)];
        [resultData appendBytes:&headerValLen length:sizeof(headerValLen)];
        NSData *headerValueData = [headers[headerKey] dataUsingEncoding:NSUTF8StringEncoding];
        [resultData appendBytes:[headerValueData bytes] length:[headerValueData length]];
    }
    [resultData appendBytes:[data bytes] length:[data length]];
    
    unsigned long crcMessage = crc32(0, resultData.bytes, (int)resultData.length);
    
    uint32_t crcMessageInt = CFSwapInt32HostToBig((uint32_t)crcMessage);
    [resultData appendBytes:&crcMessageInt length:sizeof(crcMessageInt)];
    
    return resultData;
}

@end
