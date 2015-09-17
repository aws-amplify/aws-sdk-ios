/*
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
#import "AWSMobileAnalyticsMonetizationEventBuilder.h"

/**
 AWSMobileAnalyticsVirtualMonetizationEventBuilder builds monetization events to track virtual purchases from your In-Game store.
 In order to build a Virtual monetization event, you must call all of the setters on this builder.

 The example below shows how to record a monetization event for the purchase of 1 sword that costs 500 Gold.

	 id<AWSMobileAnalyticsEventClient> eventClient = insights.eventClient;

	 // create a builder that can record purchase events from your In-Game Store
	 AWSMobileAnalyticsVirtualMonetizationEventBuilder* builder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:eventClient];

	 // set the product id of the purchased item
	 [builder withProductId:@"com.yourgame.sword"];

	 // set the item price
	 [builder withItemPrice:500];

	 // set the currency of the item price
	 [builder withCurrency:@"Gold"];

	 // set the quantity of item(s) purchased
	 [builder withQuantity:1];

	 // build/record the monetization event
	 id<AWSMobileAnalyticsEvent> virtualPurchaseEvent = [builder build];
	 [eventClient recordEvent:virtualPurchaseEvent];

 */
@interface AWSMobileAnalyticsVirtualMonetizationEventBuilder : AWSMobileAnalyticsMonetizationEventBuilder

/**
 Create a monetization builder that can record purchase events from your In-Game Store
 @param theEventClient The event client used to create the event
 @returns a monetization event builder for In-Game store purchases
 */
+(AWSMobileAnalyticsVirtualMonetizationEventBuilder*) builderWithEventClient:(id<AWSMobileAnalyticsEventClient>)theEventClient;

/**
 Sets the product id for the item(s) being purchased
 @param withProductId The product id of the item(s) being purchased
 */
-(void)withProductId:(NSString *)theProductId;

/**
 Sets the item price of the item being purchased
 @param theItemPrice The numerical item price
 */
-(void)withItemPrice:(double)theItemPrice;

/**
 Sets the quantity of item(s) being purchased.
 @param theQuantity The quantity of items purchased
 */
-(void)withQuantity:(NSInteger)theQuantity;

/**
 Sets the currency of the item price
 @param theCurrency The currency of the item price
 */
-(void)withCurrency:(NSString *)theCurrency;

/**
 Builds the monetization event using the parameters set on the builder. You must
 still record the event.
 @returns an AWSMobileAnalyticsEvent to record
 */
-(id<AWSMobileAnalyticsEvent>) build;

@end
