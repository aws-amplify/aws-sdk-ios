//
//  KSReachability.m
//
//  Created by Karl Stenerud on 5/5/12.
//
//  Copyright (c) 2012 Karl Stenerud. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall remain in place
// in this source code.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "AWSKSReachability.h"
#import <netdb.h>
#import <arpa/inet.h>


// ----------------------------------------------------------------------
#pragma mark - ARC-Safe Memory Management -
// ----------------------------------------------------------------------

// Full version at https://github.com/kstenerud/ARCSafe-MemManagement
#if __has_feature(objc_arc)
    #define aws_as_release(X)
    #define aws_as_autorelease(X)        (X)
    #define aws_as_autorelease_noref(X)
    #define aws_as_superdealloc()
    #define aws_as_bridge                __bridge
#else
    #define aws_as_release(X)           [(X) release]
    #define aws_as_autorelease(X)       [(X) autorelease]
    #define aws_as_autorelease_noref(X) [(X) autorelease]
    #define aws_as_superdealloc()       [super dealloc]
    #define aws_as_bridge
#endif


#define kAWSKVOProperty_Flags     @"flags"
#define kAWSKVOProperty_Reachable @"reachable"
#define kAWSKVOProperty_WWANOnly  @"WWANOnly"


// ----------------------------------------------------------------------
#pragma mark - KSReachability -
// ----------------------------------------------------------------------

@interface AWSKSReachability ()

@property(nonatomic,readwrite,retain) NSString* hostname;
@property(nonatomic,readwrite,assign) SCNetworkReachabilityFlags flags;
@property(nonatomic,readwrite,assign) BOOL reachable;
@property(nonatomic,readwrite,assign) BOOL WWANOnly;
@property(nonatomic,readwrite,assign) SCNetworkReachabilityRef reachabilityRef;
@property(atomic,readwrite,assign) BOOL initialized;

@end

static void onReachabilityChanged(SCNetworkReachabilityRef target,
                                  SCNetworkReachabilityFlags flags,
                                  void* info);


@implementation AWSKSReachability

@synthesize onInitializationComplete = _onInitializationComplete;
@synthesize onReachabilityChanged = _onReachabilityChanged;
@synthesize flags = _flags;
@synthesize reachable = _reachable;
@synthesize WWANOnly = _WWANOnly;
@synthesize reachabilityRef = _reachabilityRef;
@synthesize hostname = _hostname;
@synthesize notificationName = _notificationName;
@synthesize initialized = _initialized;

+ (AWSKSReachability*) reachabilityToHost:(NSString*) hostname
{
    return aws_as_autorelease([[self alloc] initWithHost:hostname]);
}

+ (AWSKSReachability*) reachabilityToLocalNetwork
{
    struct sockaddr_in address;
    bzero(&address, sizeof(address));
    address.sin_len = sizeof(address);
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = htonl(IN_LINKLOCALNETNUM);

    return aws_as_autorelease([[self alloc] initWithAddress:(const struct sockaddr*)&address]);
}

+ (AWSKSReachability*) reachabilityToInternet
{
    struct sockaddr_in address;
    bzero(&address, sizeof(address));
    address.sin_len = sizeof(address);
    address.sin_family = AF_INET;
    
    return aws_as_autorelease([[self alloc] initWithAddress:(const struct sockaddr*)&address]);
}

- (id) initWithHost:(NSString*) hostname
{
    hostname = [self extractHostName:hostname];
    const char* name = [hostname UTF8String];

    struct sockaddr_in6 address;
    bzero(&address, sizeof(address));
    address.sin6_len = sizeof(address);
    address.sin6_family = AF_INET;

    if([hostname length] > 0)
    {
        if(inet_pton(address.sin6_family, name, &address.sin6_addr) != 1)
        {
            address.sin6_family = AF_INET6;
            if(inet_pton(address.sin6_family, name, &address.sin6_addr) != 1)
            {
                return [self initWithReachabilityRef:SCNetworkReachabilityCreateWithName(NULL, name)
                                            hostname:hostname];
            }
        }
    }

    return [self initWithAddress:(const struct sockaddr*)&address];
}

- (id) initWithAddress:(const struct sockaddr*) address
{
    return [self initWithReachabilityRef:SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, address)
                                hostname:nil];
}

- (id) initWithReachabilityRef:(SCNetworkReachabilityRef) reachabilityRef
                      hostname:(NSString*)hostname
{
    if((self = [super init]))
    {
        if(reachabilityRef == NULL)
        {
            NSLog(@"KSReachability Error: %s: Could not resolve reachability destination", __PRETTY_FUNCTION__);
            goto init_failed;
        }
        else
        {
            self.hostname = hostname;
            self.reachabilityRef = reachabilityRef;

            SCNetworkReachabilityContext context = {0, (aws_as_bridge void*)self, NULL,  NULL, NULL};
            if(!SCNetworkReachabilitySetCallback(self.reachabilityRef,
                                                 onReachabilityChanged,
                                                 &context))
            {
                NSLog(@"KSReachability Error: %s: SCNetworkReachabilitySetCallback failed", __PRETTY_FUNCTION__);
                goto init_failed;
            }

            if(!SCNetworkReachabilityScheduleWithRunLoop(self.reachabilityRef,
                                                         CFRunLoopGetMain(),
                                                         kCFRunLoopDefaultMode))
            {
                NSLog(@"KSReachability Error: %s: SCNetworkReachabilityScheduleWithRunLoop failed", __PRETTY_FUNCTION__);
                goto init_failed;
            }

            // If you create a reachability ref using SCNetworkReachabilityCreateWithAddress(),
            // it won't trigger from the runloop unless you kick it with SCNetworkReachabilityGetFlags()
            if([hostname length] == 0)
            {
                SCNetworkReachabilityFlags flags;
                // Note: This won't block because there's no host to look up.
                if(!SCNetworkReachabilityGetFlags(self.reachabilityRef, &flags))
                {
                    NSLog(@"KSReachability Error: %s: SCNetworkReachabilityGetFlags failed", __PRETTY_FUNCTION__);
                    goto init_failed;
                }

                dispatch_async(dispatch_get_main_queue(), ^
                               {
                                   [self onReachabilityFlagsChanged:flags];
                               });
            }
        }
    }
    return self;

init_failed:
    aws_as_release(self);
    self = nil;
    return self;
}

- (void) dealloc
{
    if(_reachabilityRef != NULL)
    {
        SCNetworkReachabilityUnscheduleFromRunLoop(_reachabilityRef,
                                                   CFRunLoopGetMain(),
                                                   kCFRunLoopDefaultMode);
        CFRelease(_reachabilityRef);
    }
    aws_as_release(_hostname);
    aws_as_release(_notificationName);
    aws_as_release(_onReachabilityChanged);
    aws_as_superdealloc();
}

- (NSString*) extractHostName:(NSString*) potentialURL
{
    if(potentialURL == nil)
    {
        return nil;
    }

    NSString* host = [[NSURL URLWithString:potentialURL] host];
    if(host != nil)
    {
        return host;
    }
    return potentialURL;
}

- (BOOL) isReachableWithFlags:(SCNetworkReachabilityFlags) flags
{
    if(!(flags & kSCNetworkReachabilityFlagsReachable))
    {
        // Not reachable at all.
        return NO;
    }

    if(!(flags & kSCNetworkReachabilityFlagsConnectionRequired))
    {
        // Reachable with no connection required.
        return YES;
    }

    if((flags & (kSCNetworkReachabilityFlagsConnectionOnDemand |
                 kSCNetworkReachabilityFlagsConnectionOnTraffic)) &&
       !(flags & kSCNetworkReachabilityFlagsInterventionRequired))
    {
        // Automatic connection with no user intervention required.
        return YES;
    }

    return NO;
}

- (BOOL) isReachableWWANOnlyWithFlags:(SCNetworkReachabilityFlags) flags
{
#if TARGET_OS_IPHONE
    BOOL isReachable = [self isReachableWithFlags:flags];
    BOOL isWWANOnly = (flags & kSCNetworkReachabilityFlagsIsWWAN) != 0;
    return isReachable && isWWANOnly;
#else
#pragma unused(flags)
    return NO;
#endif
}

- (AWSKSReachabilityCallback) onInitializationComplete
{
    @synchronized(self)
    {
        return _onInitializationComplete;
    }
}

- (void) setOnInitializationComplete:(AWSKSReachabilityCallback) onInitializationComplete
{
    @synchronized(self)
    {
        aws_as_autorelease_noref(_onInitializationComplete);
        _onInitializationComplete = [onInitializationComplete copy];
        if(_onInitializationComplete != nil && self.initialized)
        {
            dispatch_async(dispatch_get_main_queue(), ^
                           {
                               [self callInitializationComplete];
                           });
        }
    }
}

- (void) callInitializationComplete
{
    // This method expects to be called on the main run loop so that
    // all callbacks occur on the main run loop.
    @synchronized(self)
    {
        AWSKSReachabilityCallback callback = self.onInitializationComplete;
        self.onInitializationComplete = nil;
        if(callback != nil)
        {
            callback(self);
        }
    }
}

- (void) onReachabilityFlagsChanged:(SCNetworkReachabilityFlags) flags
{
    // This method expects to be called on the main run loop so that
    // all callbacks occur on the main run loop.
    @synchronized(self)
    {
        BOOL wasInitialized = self.initialized;

        if(_flags != flags || !wasInitialized)
        {
            BOOL reachable = [self isReachableWithFlags:flags];
            BOOL WWANOnly = [self isReachableWWANOnlyWithFlags:flags];
            BOOL rChanged = (_reachable != reachable) || !wasInitialized;
            BOOL wChanged = (_WWANOnly != WWANOnly) || !wasInitialized;

            [self willChangeValueForKey:kAWSKVOProperty_Flags];
            if(rChanged) [self willChangeValueForKey:kAWSKVOProperty_Reachable];
            if(wChanged) [self willChangeValueForKey:kAWSKVOProperty_WWANOnly];

            _flags = flags;
            _reachable = reachable;
            _WWANOnly = WWANOnly;

            if(!wasInitialized)
            {
                self.initialized = YES;
            }

            [self didChangeValueForKey:kAWSKVOProperty_Flags];
            if(rChanged) [self didChangeValueForKey:kAWSKVOProperty_Reachable];
            if(wChanged) [self didChangeValueForKey:kAWSKVOProperty_WWANOnly];

            if(self.onReachabilityChanged != nil)
            {
                self.onReachabilityChanged(self);
            }

            if(self.notificationName != nil)
            {
                NSNotificationCenter* nCenter = [NSNotificationCenter defaultCenter];
                [nCenter postNotificationName:self.notificationName object:self];
            }

            if(!wasInitialized)
            {
                [self callInitializationComplete];
            }
        }
    }
}


static void onReachabilityChanged(__unused SCNetworkReachabilityRef target,
                                  SCNetworkReachabilityFlags flags,
                                  void* info)
{
    AWSKSReachability* reachability = (aws_as_bridge AWSKSReachability*) info;
    [reachability onReachabilityFlagsChanged:flags];
}

@end


// ----------------------------------------------------------------------
#pragma mark - KSReachableOperation -
// ----------------------------------------------------------------------

@interface AWSKSReachableOperation ()

@property(nonatomic,readwrite,retain) AWSKSReachability* reachability;

@end


@implementation AWSKSReachableOperation

@synthesize reachability = _reachability;

+ (AWSKSReachableOperation*) operationWithHost:(NSString*) host
                                  allowWWAN:(BOOL) allowWWAN
                     onReachabilityAchieved:(dispatch_block_t) onReachabilityAchieved
{
    return aws_as_autorelease([[self alloc] initWithHost:host
                                           allowWWAN:allowWWAN
                              onReachabilityAchieved:onReachabilityAchieved]);
}

+ (AWSKSReachableOperation*) operationWithReachability:(AWSKSReachability*) reachability
                                          allowWWAN:(BOOL) allowWWAN
                             onReachabilityAchieved:(dispatch_block_t) onReachabilityAchieved
{
    return aws_as_autorelease([[self alloc] initWithReachability:reachability
                                                   allowWWAN:allowWWAN
                                      onReachabilityAchieved:onReachabilityAchieved]);
}

- (id) initWithHost:(NSString*) host
          allowWWAN:(BOOL) allowWWAN
onReachabilityAchieved:(dispatch_block_t) onReachabilityAchieved
{
    return [self initWithReachability:[AWSKSReachability reachabilityToHost:host]
                            allowWWAN:allowWWAN
               onReachabilityAchieved:onReachabilityAchieved];
}

- (id) initWithReachability:(AWSKSReachability*) reachability
                  allowWWAN:(BOOL) allowWWAN
     onReachabilityAchieved:(dispatch_block_t) onReachabilityAchieved
{
    if((self = [super init]))
    {
        self.reachability = reachability;
        if(self.reachability == nil || onReachabilityAchieved == nil)
        {
            aws_as_release(self);
            self = nil;
        }
        else
        {
            onReachabilityAchieved = aws_as_autorelease([onReachabilityAchieved copy]);
            AWSKSReachabilityCallback onReachabilityChanged = ^(AWSKSReachability* reachability2)
            {
                @synchronized(reachability2)
                {
                    if(reachability2.onReachabilityChanged != nil &&
                       reachability2.reachable &&
                       (allowWWAN || !reachability2.WWANOnly))
                    {
                        reachability2.onReachabilityChanged = nil;
                        onReachabilityAchieved();
                    }
                }
            };

            self.reachability.onReachabilityChanged = onReachabilityChanged;

            // Check once manually in case the host is already reachable.
            onReachabilityChanged(self.reachability);
        }
    }
    return self;
}

- (void) dealloc
{
    aws_as_release(_reachability);
    aws_as_superdealloc();
}

@end
