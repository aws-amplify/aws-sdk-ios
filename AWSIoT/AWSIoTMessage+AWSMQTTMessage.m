//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSIoTMessage+AWSMQTTMessage.h"

#import "AWSIoTMessage.h"
#import "AWSMQTTMessage.h"

@implementation AWSIoTMessage (AWSMQTTMessage)

- (instancetype)initWithMQTTMessage:(AWSMQTTMessage *)message {
    self = [super init];
    if (self) {
        self.type = (AWSIoTMQTTMessageType)message.type;
        self.qos = (AWSIoTMQTTQoS)message.qos;
        self.retainFlag = message.retainFlag;
        self.isDuplicate = message.isDuplicate;
        self.rawData = message.data;

        // Note: The code below comes from the handlePublish in AWSMQTTSession.m
        // and the value for messageData maintains the format that it was previously.

        // parse data to get the topic and message
        NSData *data = message.data;
        if (data.length < 2) {
            return nil;
        }
        UInt8 const *bytes = data.bytes;


        UInt16 topicLength = 256 * bytes[0] + bytes[1];

        if (data.length < 2 + topicLength) {
            return nil;
        }
        NSData *topicData = [data subdataWithRange:NSMakeRange(2, topicLength)];
        NSString *topic = [[NSString alloc] initWithData:topicData
                                                encoding:NSUTF8StringEncoding];
        self.topic = topic;

        // length bytes are 2 bytes long preceding topic and message bytes
        NSUInteger twoByteOffset = self.qos == AWSIoTMQTTQoSMessageDeliveryAttemptedAtMostOnce ? 0 : 2;
        NSUInteger offset = 2 + topicLength + twoByteOffset;
        NSRange messageRange = NSMakeRange(offset, data.length - offset);
        NSData *messageData = [data subdataWithRange:messageRange];
        self.messageData = messageData;

        if (messageData.length > 2) {
            NSRange textRange = NSMakeRange(0, messageData.length);
            NSData *textData = [messageData subdataWithRange:textRange];
            NSString *messageText = [[NSString alloc] initWithData:textData
                                                          encoding:NSUTF8StringEncoding];
            self.message = messageText;
        } else {
            self.message = @"";
        }
    }
    return self;
}

+ (int)getTwoByteInt:(NSData *)data {
    int i = 0;
    if (data.length >= 2) {
        const UInt8 *bytes = data.bytes;
        i = bytes[0] * 256 + bytes[1];
    }
    return i;
}

+ (NSString *)getUtf8String:(NSData *)data {
    NSString *s;
    int l = [self getTwoByteInt:data];
    if (data.length >= l + 2) {
        s = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(2, l)] encoding:NSUTF8StringEncoding];
    }
    return s;
}

@end
