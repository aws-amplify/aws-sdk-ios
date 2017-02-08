//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSMobileAnalyticsIOSConnectivity.h"
#import "AWSKSReachability.h"

@interface AWSMobileAnalyticsIOSConnectivity()

@property (nonatomic, readwrite) AWSKSReachability* reachability;

@end

@implementation AWSMobileAnalyticsIOSConnectivity


+ (instancetype)defaultConnectivity
{
    static id reachability;
    static dispatch_once_t predicate;

    dispatch_once(&predicate, ^{
        reachability = [[self alloc] initWithReachability:[AWSKSReachability reachabilityToInternet]];
    });

    return reachability;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultConnectivity` instead."
                                 userInfo:nil];
    return nil;
}

-(id) initWithReachability:(AWSKSReachability*) theReachability
{
    if(self = [super init])
    {
        self.reachability = theReachability;
    }
    return self;
}

-(BOOL) isConnected
{
    return [self.reachability reachable];
}

-(BOOL) hasWifi
{
    return ![self.reachability WWANOnly];
}

-(BOOL) hasWANOnly
{
    return [self.reachability WWANOnly];
}

@end
