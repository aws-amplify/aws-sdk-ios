//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSTranscribeEventHandler.h"
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
    
    return [AWSTranscribeEventEncoder  encodeChunk:[@"" dataUsingEncoding:NSUTF8StringEncoding] headers:endHeaders];
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

@implementation AWSTranscribeEventDecoder

// TODO: The signature of this event should change to our desired object
// Specifically, the return type. We should either return error or an object which has both error or data
// `AWSTranscribeStreamingTranscriptResultStream`  is a good starting point since it has both error and return type available.
+ (AWSTranscribeStreamingTranscriptResultStream  *)decodeEvent:(NSData *)data  {
    
    if ([AWSTranscribeEventDecoder verifyMessageLengthHeaderForData:data expectedLengh:[data length]]) {
        
        if([AWSTranscribeEventDecoder verifyPreludeForData:data]) {
            NSDictionary<NSString *, NSString  *> *headers = [AWSTranscribeEventDecoder getHeadersForData:data];
            if ([headers[@":message-type"] isEqualToString:@"exception"]) {
                // handle exception here
                NSString *body = [AWSTranscribeEventDecoder getBodyForData:data];
                NSError *jsonError;
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[body dataUsingEncoding:NSUTF8StringEncoding]
                                                                     options:NSJSONReadingMutableContainers
                                                                       error:&jsonError];
                AWSDDLogError(@"Error JSON: %@", json);
                // Use the dictionary to convert the response to AWSTranscribeStreamingTranscriptResultStream and return it
                // return here

            } else  {
                // handle response data here.
                NSString *body = [AWSTranscribeEventDecoder getBodyForData:data];
                AWSDDLogDebug(@"body: %@", body);
                NSError *jsonError;
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[body dataUsingEncoding:NSUTF8StringEncoding]
                                                                     options:NSJSONReadingMutableContainers
                                                                       error:&jsonError];
                AWSDDLogDebug(@"Response JSON: %@", json);
                // Use the dictionary to convert the response to AWSTranscribeStreamingTranscriptResultStream and return it
                // return here
            }
        } else  {
            // probably  set an error and return here; a  generic error which we can add to the result type instead of re-using service error
            return nil;
        }
    } else {
        // probably  set an error and return here; a  generic error which we can add to the result type instead of re-using service error
        return nil;
    }
    
    
    
    return [AWSTranscribeStreamingTranscriptResultStream  new];
}

+(bool)verifyMessageLengthHeaderForData:(NSData *)data
                          expectedLengh:(NSUInteger)len {
    // TODO: Implement reverse process of encoding to verify the length
    return YES;
}

+(bool)verifyPreludeForData:(NSData *)data {
    // TODO: Implement reverse process of encoding to verify the prelude
    return YES;
}


+(int)getBodyStartPosition:(NSData *)data  {
    return 0;
}

+(NSDictionary<NSString *, NSString *> *)getHeadersForData:(NSData *)data {
    
    int headerLen = CFSwapInt32(*(UInt32 *)[[data subdataWithRange:NSMakeRange(4, 8)]  bytes]);
    NSData *headerData = [data subdataWithRange:NSMakeRange(12, headerLen)];
    int currentPosition = 0;
    NSMutableDictionary<NSString *, NSString *> *dictionary = [NSMutableDictionary new];
    while (currentPosition < headerLen) {
        int currentHeaderLen = *(int *)[[headerData subdataWithRange:NSMakeRange(currentPosition, 1)]  bytes];
        currentPosition++;
        NSString *headerKey = [[NSString alloc] initWithData:[headerData subdataWithRange:NSMakeRange(currentPosition, currentHeaderLen)] encoding:NSUTF8StringEncoding];
        AWSDDLogDebug(@"Header Name: %@", headerKey);
        currentPosition += currentHeaderLen;
        // skip header type info, always 7 while decoding
        currentPosition++;
        int currentHeaderValueLen = CFSwapInt16(*(UInt16 *)[[headerData subdataWithRange:NSMakeRange(currentPosition, 2)]  bytes]);
        currentPosition += 2;
        NSString *headerValue = [[NSString alloc] initWithData:[headerData subdataWithRange:NSMakeRange(currentPosition, currentHeaderValueLen)] encoding:NSUTF8StringEncoding];
        AWSDDLogDebug(@"Header Value: %@", headerValue);
        dictionary[headerKey] = headerValue;
        currentPosition += currentHeaderValueLen;
    }
    
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

+(NSString *)getBodyForData:(NSData *)data {
    NSUInteger headerLen = [AWSTranscribeEventDecoder getHeaderLengthForData:data];
    NSUInteger messageLen = [data length];
    NSUInteger dataStartPos = 4 + 4 + 4 + headerLen;
    NSUInteger dataLen = messageLen - dataStartPos - 4;
    NSString *dataString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(dataStartPos, dataLen)] encoding:NSUTF8StringEncoding];
    return dataString;
}

+(int)getHeaderLengthForData:(NSData *)data {
    return CFSwapInt32(*(UInt32 *)[[data subdataWithRange:NSMakeRange(4, 8)]  bytes]);;
}

@end
