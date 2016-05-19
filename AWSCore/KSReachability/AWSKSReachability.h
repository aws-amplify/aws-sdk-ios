//
//  KSReachability.h
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

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>


/** This is the notification name used in the Apple reachability example.
 * It is not used internally, and is merely a suggested notification name.
 */
#define kAWSDefaultNetworkReachabilityChangedNotification @"kAWSNetworkReachabilityChangedNotification"


@class AWSKSReachability;

typedef void(^AWSKSReachabilityCallback)(AWSKSReachability* reachability);


/** Monitors network connectivity.
 *
 * You can elect to be notified via blocks (onReachabilityChanged),
 * notifications (notificationName), or KVO (flags, reachable, and WWANOnly).
 *
 * All notification methods are disabled by default.
 *
 * Note: Upon construction, this object will fetch its initial reachability
 * state in the background. This means that the reachability status will ALWAYS
 * be "unreachable" until some time after object construction (possibly up to 10
 * seconds, depending on how long the DNS lookup takes). Use the "initialized"
 * property to monitor initialization, or set the callback "onInitializationComplete".
 */
@interface AWSKSReachability : NSObject

#pragma mark Constructors

/** Reachability to a specific host. Returns nil if an initialization error occurs.
 *
 * @param hostname The name or IP address of the host to monitor. If nil or
 *                 empty string, check reachability to the internet in general.
 */
+ (AWSKSReachability*) reachabilityToHost:(NSString*) hostname;

/** Reachability to the local (wired or wifi) network. Returns nil if an initialization error occurs.
 */
+ (AWSKSReachability*) reachabilityToLocalNetwork;

/** Reachability to the internet. Returns nil if an initialization error occurs.
 */
+ (AWSKSReachability*) reachabilityToInternet;


#pragma mark General Information

/** The host we are monitoring reachability to, if any. */
@property(nonatomic,readonly,retain) NSString* hostname;


#pragma mark Notifications and Callbacks

/** If non-nil, called when the KSReachability object has finished initializing.
 * If initialization has already completed, calls on the next main thread run loop.
 * This block will only be called once, and then discarded (released).
 * Block will be invoked on the main thread.
 */
@property(atomic,readwrite,copy) AWSKSReachabilityCallback onInitializationComplete;

/** If non-nil, called whenever reachability flags change.
 * Block will be invoked on the main thread.
 */
@property(atomic,readwrite,copy) AWSKSReachabilityCallback onReachabilityChanged;

/** The notification to send when reachability changes (nil = don't send).
 * Default = nil
 */
@property(nonatomic,readwrite,retain) NSString* notificationName;


#pragma mark KVO Compliant Status Properties

/** The current reachability flags.
 * This property will always report 0 while "initialized" property = NO.
 */
@property(nonatomic,readonly,assign) SCNetworkReachabilityFlags flags;

/** Whether the host is reachable or not.
 * This property will always report NO while "initialized" property = NO.
 */
@property(nonatomic,readonly,assign) BOOL reachable;

/* If YES, the host is only reachable by WWAN (iOS only).
 * This property will always report NO while "initialized" property = NO.
 */
@property(nonatomic,readonly,assign) BOOL WWANOnly;

/** If YES, this object's status properties are valid. */
@property(atomic,readonly,assign) BOOL initialized;

@end



/** A one-time operation to perform as soon as a host is deemed reachable.
 * The operation will only be performed once, regardless of how many times a
 * host becomes reachable.
 */
@interface AWSKSReachableOperation: NSObject

/** Constructor. Returns nil if an initialization error occurs.
 *
 * @param hostname The name or IP address of the host to monitor. If nil or
 *                 empty string, check reachability to the internet in general.
 *                 If hostname is a URL string, it will use the host portion.
 *
 * @param allowWWAN If NO, a WWAN-only connection is not enough to trigger
 *                  this operation.
 *
 * @param onReachabilityAchieved Invoke when the host becomes reachable.
 *                               This will be invoked ONE TIME ONLY, no matter
 *                               how many times reachability changes.
 *                               Block will be invoked on the main thread.
 */
+ (AWSKSReachableOperation*) operationWithHost:(NSString*) hostname
                                  allowWWAN:(BOOL) allowWWAN
                     onReachabilityAchieved:(dispatch_block_t) onReachabilityAchieved;

/** Constructor. Returns nil if an initialization error occurs.
 *
 * @param reachability A reachability instance. Note: This object will overwrite
 *                     the onReachabilityChanged property.
 *
 * @param allowWWAN If NO, a WWAN-only connection is not enough to trigger
 *                  this operation.
 *
 * @param onReachabilityAchieved Invoke when the host becomes reachable.
 *                               This will be invoked ONE TIME ONLY, no matter
 *                               how many times reachability changes.
 *                               Block will be invoked on the main thread.
 */
+ (AWSKSReachableOperation*) operationWithReachability:(AWSKSReachability*) reachability
                                          allowWWAN:(BOOL) allowWWAN
                             onReachabilityAchieved:(dispatch_block_t) onReachabilityAchieved;

/** Initializer. Returns nil if an initialization error occurs.
 *
 * @param hostname The name or IP address of the host to monitor. If nil or
 *                 empty string, check reachability to the internet in general.
 *                 If hostname is a URL string, it will use the host portion.
 *
 * @param allowWWAN If NO, a WWAN-only connection is not enough to trigger
 *                  this operation.
 *
 * @param onReachabilityAchieved Invoke when the host becomes reachable.
 *                               This will be invoked ONE TIME ONLY, no matter
 *                               how many times reachability changes.
 *                               Block will be invoked on the main thread.
 */
- (id) initWithHost:(NSString*) hostname
          allowWWAN:(BOOL) allowWWAN
onReachabilityAchieved:(dispatch_block_t) onReachabilityAchieved;

/** Initializer. Returns nil if an initialization error occurs.
 *
 * @param reachability A reachability instance. Note: This object will overwrite
 *                     the onReachabilityChanged property.
 *
 * @param allowWWAN If NO, a WWAN-only connection is not enough to trigger
 *                  this operation.
 *
 * @param onReachabilityAchieved Invoke when the host becomes reachable.
 *                               This will be invoked ONE TIME ONLY, no matter
 *                               how many times reachability changes.
 *                               Block will be invoked on the main thread.
 */
- (id) initWithReachability:(AWSKSReachability*) reachability
                  allowWWAN:(BOOL) allowWWAN
     onReachabilityAchieved:(dispatch_block_t) onReachabilityAchieved;

/** Access to internal reachability instance. Use this to monitor for errors. */
@property(nonatomic,readonly,retain) AWSKSReachability* reachability;

@end
