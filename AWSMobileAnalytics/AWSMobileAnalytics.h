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

#import <Foundation/Foundation.h>

/*!
 Project version number for the AWSMobileAnalytics framework.

 @warning The AWSMobileAnalytics SDK is deprecated. Please use AWSPinpoint for analytics.
 @deprecated Please use AWSPinpoint for analytics.
 */
FOUNDATION_EXPORT double AWSMobileAnalyticsVersionNumber DEPRECATED_MSG_ATTRIBUTE("Use AWSPinpoint instead.");

/*!
 Project version string for the AWSMobileAnalytics framework.

 @warning The AWSMobileAnalytics SDK is deprecated. Please use AWSPinpoint for analytics.
 @deprecated Please use AWSPinpoint for analytics.
 */
FOUNDATION_EXPORT const unsigned char AWSMobileAnalyticsVersionString[] DEPRECATED_MSG_ATTRIBUTE("Use AWSPinpoint instead.");

#import <AWSCore/AWSCore.h>

#import "AWSMobileAnalyticsService.h"
#import "AWSMobileAnalyticsOptions.h"

#import "AWSMobileAnalyticsEvent.h"
#import "AWSMobileAnalyticsEventClient.h"
#import "AWSMobileAnalyticsMonetizationEventBuilder.h"
#import "AWSMobileAnalyticsAppleMonetizationEventBuilder.h"
#import "AWSMobileAnalyticsVirtualMonetizationEventBuilder.h"

#import "AWSMobileAnalyticsERSService.h"
