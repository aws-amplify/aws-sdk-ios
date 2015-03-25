/**
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AmazonInsightsSDKTests.h"
#import "AWSMobileAnalytics.h"
#import "AWSMobileAnalyticsContext.h"
#import "AWSMobileAnalyticsDefaultContext.h"
#import "AWSMobileAnalyticsDefaultOptions.h"
#import "AIInsightsContextBuilder.h"
#import "AWSMobileAnalyticsSDKInfo.h"
#import "AWSMobileAnalyticsIOSSystem.h"
#import "AITestConfiguration.h"
#import "AWSMobileAnalyticsDefaultDeliveryClient.h"
#import "AWSMobileAnalyticsRequest.h"
#import "AWSMobileAnalyticsResponse.h"
#import "AWSMobileAnalyticsDeliveryPolicyFactory.h"
#import "AWSMobileAnalyticsERSRequestBuilder.h"
#import "AWSMobileAnalyticsEventStore.h"
#import "AWSMobileAnalyticsDeliveryPolicyFactory.h"
#import "AWSMobileAnalyticsFileEventStore.h"
#import "AWSMobileAnalyticsSerializerFactory.h"
#import "AWSMobileAnalyticsHttpClient.h"
#import "AITestHttpClient.h"
#import "AWSMobileAnalyticsIOSLifeCycleManager.h"
#import "AWSMobileAnalyticsSession.h"
#import "AWSMobileAnalyticsDefaultEvent.h"
#import "AWSMobileAnalyticsDefaultEventClient.h"
#import "AWSMobileAnalyticsDefaultSessionClient.h"
#import "TestConstants.h"
#import "TestConnectivity.h"
#import "TestInsightsContext.h"
#import "AIInternalInterfaces.h"
#import "BlockingInterceptor.h"

@interface AIIntegrationTestBase : XCTestCase
{
    id<AWSMobileAnalyticsContext> _context;
    AITestConfiguration *_configuration;
    AITestHttpClient *_httpClient;
    TestConnectivity *_connectivity;
}

- (void)cleanInsightsDir;
- (void)buildMockContext;
- (void)buildTestContext;
- (void)buildTestContext:(NSDictionary *)settings;

@end
