/*
 *  Copyright (c) 2014, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import "AWSCancellationTokenRegistration.h"

#import "AWSCancellationToken.h"

@interface AWSCancellationTokenRegistration ()

@property (nonatomic, weak) AWSCancellationToken *token;
@property (nonatomic, strong) AWSCancellationBlock cancellationObserverBlock;
@property (nonatomic, strong) NSObject *lock;
@property (nonatomic) BOOL disposed;

@end

@interface AWSCancellationToken (AWSCancellationTokenRegistration)

- (void)unregisterRegistration:(AWSCancellationTokenRegistration *)registration;

@end

@implementation AWSCancellationTokenRegistration

+ (instancetype)registrationWithToken:(AWSCancellationToken *)token delegate:(AWSCancellationBlock)delegate {
    AWSCancellationTokenRegistration *registration = [AWSCancellationTokenRegistration new];
    registration.token = token;
    registration.cancellationObserverBlock = delegate;
    return registration;
}

- (instancetype)init {
    self = [super init];
    if (!self) return nil;

    _lock = [NSObject new];
    
    return self;
}

- (void)dispose {
    @synchronized(self.lock) {
        if (self.disposed) {
            return;
        }
        self.disposed = YES;
    }

    AWSCancellationToken *token = self.token;
    if (token != nil) {
        [token unregisterRegistration:self];
        self.token = nil;
    }
    self.cancellationObserverBlock = nil;
}

- (void)notifyDelegate {
    @synchronized(self.lock) {
        [self throwIfDisposed];
        self.cancellationObserverBlock();
    }
}

- (void)throwIfDisposed {
    NSAssert(!self.disposed, @"Object already disposed");
}

@end
