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

#import <UIKit/UIKit.h>
#import "AWSMobileAnalyticsRandomUUIDGenerator.h"


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@implementation AWSMobileAnalyticsRandomUUIDGenerator 

+(AWSMobileAnalyticsRandomUUIDGenerator*) generator
{
    return [[AWSMobileAnalyticsRandomUUIDGenerator alloc] init];
}

-(NSString*)generateUniqueIdString
{
    NSString *uuidStr;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0"))
    {
        uuidStr = [[NSClassFromString(@"NSUUID") performSelector:@selector(UUID)]
                   performSelector:@selector(UUIDString)];
    }
    else
    {
        CFUUIDRef uuid = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        0x40 | (arc4random() & 0xF),
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF,
                                                        arc4random() & 0xFF);
        uuidStr = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    }
    
    return uuidStr;
}


@end
