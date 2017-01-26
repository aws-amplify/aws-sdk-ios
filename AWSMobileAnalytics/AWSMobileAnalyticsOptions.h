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

/**
 The AWSMobileAnalyticsOptions protocol is implemented by all classes that can
 provide options such as enablement of event collection and allowance of event
 delivery on WAN within the SDK.
 */
@protocol AWSMobileAnalyticsOptions <NSObject>

/**
 Indicates whether or not event collection is enabled for the SDK.
 @returns YES/NO indicating if event collection is enabled
 */
@required
@property (nonatomic, readonly) BOOL allowEventCollection;

/**
 Indicates whether or not events will be sent to Mobile Analytics website over WAN (mobile) networks.
 @returns YES indicates events will be delivered via WAN or WIFI networks. NO indicates events will be delivered via WIFI network only.
 */
@required
@property (nonatomic, readonly) BOOL allowWANDelivery;

@end
