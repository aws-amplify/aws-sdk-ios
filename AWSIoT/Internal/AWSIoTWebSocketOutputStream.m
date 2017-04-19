/*
 Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 
 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at
 
 http://aws.amazon.com/apache2.0
 
 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "AWSCocoaLumberjack.h"
#import "AWSIoTWebSocketOutputStream.h"
#import "AWSSRWebSocket.h"

@interface AWSIoTWebSocketOutputStreamFactory()

@property (nonatomic, strong) NSOutputStream *actualDelegate;
@property (nonatomic, strong) AWSSRWebSocket *webSocket;

@end

#pragma mark create instances

@implementation AWSIoTWebSocketOutputStreamFactory

+ (AWSIoTWebSocketOutputStream *)createAWSIoTWebSocketOutputStreamWithWebSocket:(AWSSRWebSocket *)webSocket
{
    return (AWSIoTWebSocketOutputStream *) [[self alloc] initToMemoryWithWebSocket:webSocket];
}

#pragma mark initialization
- (instancetype)initToMemoryWithWebSocket:(AWSSRWebSocket *)webSocket {
    self = [super init];
    if (self)
    {
        self.actualDelegate = [NSOutputStream outputStreamToMemory];
        self.webSocket = webSocket;
    }
    return self;
}

#pragma mark override write method
- (NSInteger)write:(const uint8_t *)buffer maxLength:(NSUInteger)limit
{
    [self.webSocket send:[NSData dataWithBytes:(void *)buffer length:limit]];
    AWSDDLogVerbose(@"sending %lu bytes", (unsigned long)limit);
    return limit;     // writes always succeed
}

#pragma mark forward all other messages to actualDelegate
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (class_respondsToSelector([self class], aSelector)) { return self; }
    if ([self.actualDelegate respondsToSelector:aSelector]) { return self.actualDelegate; }
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if (class_respondsToSelector([self class], aSelector)) { return YES; }
    if ([self.actualDelegate respondsToSelector:aSelector]) { return YES; }
    return [super respondsToSelector:aSelector];
}
@end
