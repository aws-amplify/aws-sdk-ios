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

#import "AWSMobileAnalyticsPrefsUniqueIdService.h"
#import "AWSMobileAnalyticsPreferences.h"
#import "AWSMobileAnalyticsUniqueIdGenerator.h"
#import "AWSMobileAnalyticsRandomUUIDGenerator.h"

static NSString* const EMPTY_ID = @"";
static NSString* const UNIQUE_ID_KEY = @"UniqueId";

@interface AWSMobileAnalyticsPrefsUniqueIdService()
@property(nonatomic) id<AWSMobileAnalyticsUniqueIdGenerator> generator;
@end

@implementation AWSMobileAnalyticsPrefsUniqueIdService

+(AWSMobileAnalyticsPrefsUniqueIdService*)idService
{
    return [AWSMobileAnalyticsPrefsUniqueIdService idServiceWithGenerator:[AWSMobileAnalyticsRandomUUIDGenerator generator]];
}

+(AWSMobileAnalyticsPrefsUniqueIdService*)idServiceWithGenerator:(id<AWSMobileAnalyticsUniqueIdGenerator>)generator
{
    return [[AWSMobileAnalyticsPrefsUniqueIdService alloc] initWithIdGenerator:generator];
}

-(id)initWithIdGenerator:(id<AWSMobileAnalyticsUniqueIdGenerator>)generator
{
    if(self = [super init])
    {
        self.generator = generator;
    }
    return self;
}

-(NSString*)getUniqueIdWithContext:(id<AWSMobileAnalyticsContext>)insightsContext;
{
    NSString* uniqueId = EMPTY_ID;
    
    id<AWSMobileAnalyticsPreferences> prefs = [[insightsContext system] preferences];
    if(prefs)
    {
        uniqueId = [prefs stringForKey:UNIQUE_ID_KEY withOptValue:nil];
        if(!uniqueId)
        {
            // an id doesn't exist for this context, create one and persist it
            uniqueId = [self.generator generateUniqueIdString];
            [prefs putString:uniqueId forKey:UNIQUE_ID_KEY];
        }
    }
    
    return uniqueId;
}

@end
