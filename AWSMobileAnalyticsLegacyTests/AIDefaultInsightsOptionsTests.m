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

#import "AIDefaultInsightsOptionsTests.h"
#import "AWSMockFileManager.h"

@implementation AIDefaultInsightsOptionsTests

- (void)setUp
{
     
}

- (void)test_DefaultIsightsOptions_AllowWANDelivery
{
    AWSMobileAnalyticsDefaultOptions* options = [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:YES withWANDelivery:YES];
    assertThatBool(options.allowWANDelivery, is(equalToBool(YES)));
    
    options = [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:YES withWANDelivery:NO];
    assertThatBool(options.allowWANDelivery, is(equalToBool(NO)));
    
    options = [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:NO withWANDelivery:YES];
    assertThatBool(options.allowWANDelivery, is(equalToBool(YES)));
    
    options = [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:NO withWANDelivery:NO];
    assertThatBool(options.allowWANDelivery, is(equalToBool(NO)));
}

- (void)test_DefaultIsightsOptions_AllowEventCollection
{
    AWSMobileAnalyticsDefaultOptions* options = [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:YES withWANDelivery:YES];
    assertThatBool(options.allowEventCollection, is(equalToBool(YES)));
    
    options = [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:NO withWANDelivery:YES];
    assertThatBool(options.allowEventCollection, is(equalToBool(NO)));
    
    options = [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:YES withWANDelivery:NO];
    assertThatBool(options.allowEventCollection, is(equalToBool(YES)));
    
    options = [AWSMobileAnalyticsDefaultOptions optionsWithAllowEventCollection:NO withWANDelivery:NO];
    assertThatBool(options.allowEventCollection, is(equalToBool(NO)));
}

@end
