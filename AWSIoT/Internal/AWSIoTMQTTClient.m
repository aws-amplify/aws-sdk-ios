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

#import "AWSIoTMQTTClient.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSSignature.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSIOTService.h"

#import "MQTTSession.h"

#import <Security/Security.h>

#import "AWSIoTKeychain.h"

@implementation AWSIoTMQTTTopicModel
@end

@implementation AWSIoTMQTTQueueMessage
@end

@interface AWSIoTMQTTClient(){
    MQTTSession* _session;
    NSMutableDictionary * _topicsListners;

    BOOL _userDisconnect;
    BOOL _needReconnect;

    NSString *_host;
    UInt32 _port;
    BOOL _cleanSession;
    NSArray *_clientCerts;
}


@end

@interface AWSIoTMQTTClient() <MQTTSessionDelegate>
@property (nonatomic, copy) void (^connectStatusCallback)(AWSIoTMQTTStatus status);
@property (nonatomic, strong) NSMutableArray *queueMessages;
@end

@implementation AWSIoTMQTTClient


static AWSIoTMQTTClient *_defaultMQTTClient = nil;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultMQTTClient = [AWSIoTMQTTClient new];
    });


    return _defaultMQTTClient;
}

- (instancetype)init {
    if ( self = [super init]) {
        _topicsListners = [NSMutableDictionary dictionary];
        self.queueMessages = [NSMutableArray new];
    }
    return self;
}


- (BOOL)connectWithClientId:(NSString*)clientId
                     toHost:(NSString*)host
                       port:(UInt32)port
               cleanSession:(BOOL)cleanSession
                certificateId:(NSString*)certificateId
             statusCallback:(void (^)(AWSIoTMQTTStatus status))callback {
    SecIdentityRef identityRef = [AWSIoTKeychain getIdentityRef:[NSString stringWithFormat:@"%@%@",[AWSIoTKeychain privateKeyTag], certificateId ]];
    if (identityRef == NULL) {
        NSLog(@"Could not find SecIdentityRef");
        return NO;
    };

    _clientCerts = [[NSArray alloc] initWithObjects:(__bridge id)identityRef, nil];
    _host = host;
    _port = port;
    _cleanSession = cleanSession;
    self.connectStatusCallback = callback;

    if (_cleanSession) {
        [_topicsListners removeAllObjects];
        [self.queueMessages removeAllObjects];
    }

    _session = [[MQTTSession alloc] initWithClientId:clientId userName:@"" password:@"" keepAlive:60 cleanSession:cleanSession];

    self.connectStatusCallback(AWSIoTMQTTStatusConnecting);

    _session.delegate = self;

    [_session connectToHost:_host port:_port usingSSL:YES sslCertificated:_clientCerts];

    return YES;
}

- (void)disconnect {
    _userDisconnect = YES;
    [_session close];
    _session.delegate = nil;
    _session = nil;
}

- (void)reconnectToSession {
    _needReconnect = _cleanSession;
    [_session connectToHost:_host port:_port usingSSL:YES sslCertificated:_clientCerts];
}

- (void)resubscribeToTopics {
    _needReconnect = NO;

    for (AWSIoTMQTTTopicModel *topic in _topicsListners.allValues) {
        [_session subscribeToTopic:topic.topic atLevel:topic.qos];
    }
}


- (void)publishString:(NSString*)str onTopic:(NSString*)topic {
    [self publishData:[str dataUsingEncoding:NSUTF8StringEncoding] onTopic:topic];
}

- (void)publishData:(NSData*)data onTopic:(NSString*)topic {

    NSLog(@"isReadyToPublish: %i",[_session isReadyToPublish]);

    if ([_session isReadyToPublish]) {
        [_session publishData:data onTopic:topic];
    } else {
        AWSIoTMQTTQueueMessage *message = [AWSIoTMQTTQueueMessage new];
        message.topic = topic;
        message.message = data;
        [self.queueMessages addObject:message];
    }


}

- (void)subscribeToTopic:(NSString*)topic qos:(UInt8)qos messageCallback:(AWSIoTMQTTNewMessageBlock)callback {
    AWSIoTMQTTTopicModel *topicModel = [AWSIoTMQTTTopicModel new];
    topicModel.topic = topic;
    topicModel.qos = qos;
    topicModel.callback = callback;
    [_topicsListners setObject:topicModel forKey:topic];

    if (_session) {
        [_session subscribeToTopic:topicModel.topic atLevel:topicModel.qos];
    }
}


- (void)unsubscribeTopic:(NSString*)topic {
    if (_session) {
        [_session unsubscribeTopic:topic];
    }
    [_topicsListners removeObjectForKey:topic];
}

- (void)publishMessagesFromQueue {
    NSLog(@"publishMessagesFromQueue");
    AWSIoTMQTTQueueMessage *message = [self.queueMessages firstObject];
    if (message && [_session isReadyToPublish]) {
        NSLog(@"publishData on topic %@",message.topic);
        [_session publishData:message.message onTopic:message.topic];
        [self.queueMessages removeObjectAtIndex:0];
    }

    if (self.queueMessages.count) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            if ([_session isReadyToPublish]) {
                [self publishMessagesFromQueue];
            }
        });
    }
}

#pragma-mark MQTTSessionDelegate

- (void)session:(MQTTSession*)session handleEvent:(MQTTSessionEvent)eventCode {
    NSLog(@"MQTTSessionDelegate handleEvent: %i",eventCode);

    switch (eventCode) {
        case MQTTSessionEventConnected:
            self.connectStatusCallback(AWSIoTMQTTStatusConnected);
            if (_needReconnect) {
                [self resubscribeToTopics];
            }
            if (self.queueMessages.count) {
                [self publishMessagesFromQueue];
            }
            break;
        case MQTTSessionEventConnectionRefused:
            self.connectStatusCallback(AWSIoTMQTTStatusConnectionRefused);
            break;
        case MQTTSessionEventConnectionClosed:
            if (!_userDisconnect && _session) {
                [self reconnectToSession];
            } else {
                _userDisconnect = NO;
                self.connectStatusCallback(AWSIoTMQTTStatusDisconnected);
                self.connectStatusCallback = nil;
            }
            break;
        case MQTTSessionEventConnectionError:
            self.connectStatusCallback(AWSIoTMQTTStatusConnectionError);
            if (!_userDisconnect && _session) {
                [self reconnectToSession];
            }
            break;
        case MQTTSessionEventProtocolError:
            self.connectStatusCallback(AWSIoTMQTTStatusProtocolError);
            break;
        default:
            break;
    }

}

- (void)session:(MQTTSession*)session newMessage:(NSData*)data onTopic:(NSString*)topic {
    NSLog(@"MQTTSessionDelegate newMessage: %@\n onTopic: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding], topic);

    NSArray *topicParts = [topic componentsSeparatedByString: @"/"];

    for (NSString *topicKey in _topicsListners.allKeys) {
        NSArray *topicKeyParts = [topicKey componentsSeparatedByString: @"/"];

        BOOL topicsIsSame = true;
        for (int i = 0; i < topicKeyParts.count; i++) {
            if (i >= topicParts.count) {
                topicsIsSame = false;
                break;
            }

            NSString *topicPart = topicParts[i];
            NSString *topicKeyPart = topicKeyParts[i];

            if ([topicKeyPart rangeOfString:@"#"].location == NSNotFound && [topicKeyPart rangeOfString:@"+"].location == NSNotFound) {
                if (![topicPart isEqualToString:topicKeyPart]) {
                    topicsIsSame = false;
                    break;
                }
            }
        }

        if (topicsIsSame) {
            AWSIoTMQTTTopicModel *topicModel = [_topicsListners objectForKey:topicKey];
            if (topicModel) {
                topicModel.callback(data);
            }
        }
    }
    
}


@end
