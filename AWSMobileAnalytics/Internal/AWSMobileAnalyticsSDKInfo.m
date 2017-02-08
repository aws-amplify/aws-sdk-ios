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

#import "AWSMobileAnalyticsSDKInfo.h"

// We should move to semantic versioning instead of versioning off of Brazil
#ifndef BUILD_VERSION
#define BUILD_VERSION @"2.0-alpha"
#endif

@implementation AWSMobileAnalyticsSDKInfo

+(AWSMobileAnalyticsSDKInfo*)sdkInfoFromBrazil
{
    return [AWSMobileAnalyticsSDKInfo sdkInfoWithName:@"MobileAnalyticsSDK-IOS"
                          withVersion:[BUILD_VERSION length] == 0 ? @"2.1.dev-build" : BUILD_VERSION];

}

+(AWSMobileAnalyticsSDKInfo*)sdkInfoWithName:(NSString*)name withVersion:(NSString*)version
{
    return [[AWSMobileAnalyticsSDKInfo alloc] initWithName:name withVersion:version];
}

-(id)initWithName:(NSString*)name withVersion:(NSString*)version
{
    if(self = [super init])
    {
        self.sdkVersion = version;
        self.sdkName = name;
    }
    return self;
}
@end
