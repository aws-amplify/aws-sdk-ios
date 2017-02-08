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
#import "AWSMobileAnalyticsEventClient.h"
#import "AWSMobileAnalyticsEvent.h"

/**
 Base class for handling the required attributes and metrics for monetization Events. This
 class is not meant to be instantiated. Instead, create instances specific to the purchase
 you are trying to record. Currently, AWSMobileAnalyticsVirtualMonetizationEventBuilder is used to create
 monetization events for virtual purchases, and AWSMobileAnalyticsAppleMonetizationEventBuilder is used
 to create monetization events for purchases with Apple's IAP framework.
 
 This class can be extended if you need to record monetization events from other 
 purchase frameworks. Derived classes must override the AWSMobileAnalyticsMonetizationEventBuilder::isValid
 method so that AWSMobileAnalyticsMonetizationEventBuilder knows if the derived builder is in a valid state.
 */
@interface AWSMobileAnalyticsMonetizationEventBuilder : NSObject

/**
 Builds an AWSMobileAnalyticsEvent using the current state of the builder.
 @returns an AWSMobileAnalyticsEvent or nil, if the builder is in an invalid state
 */
-(id<AWSMobileAnalyticsEvent>) build;

/**
 Determines if this builder is in a valid state. This method must be overridden in derived classes.
 @returns YES if the Builder is valid, NO otherwise.
 */
-(BOOL) isValid;

/**
 Initializes the AWSMobileAnalyticsMonetizationEventBuilder. This class is not meant to be initialized directly. This method should
 only be called/overridden by derived builders.
 */
-(id)initWithEventClient:(id<AWSMobileAnalyticsEventClient>)theEventClient;

/**
 The product id that will be used to build the monetization event
 @returns The product id
 */
-(NSString *)productId;

/**
 Sets the product id to use when building the monetization event
 @param theProductId the product id of the item being purchased
 */
-(void)setProductId:(NSString *)theProductId;

/**
 The quantity that will be used to build the monetization event
 @returns The quantity of items purchased
 */
-(NSInteger)quantity;

/**
 Sets the quantity to use when building the monetization event
 @param theQuantity the quantity of the item being purchased
 */
-(void)setQuantity:(NSInteger)theQuantity;

/**
 The numerical price of the item being purchased that will be used to build the monetization event
 @returns The numerical item price
 */
-(double)itemPrice;

/**
 Sets the numerical item price to use when building the monetization event
 @param theItemPrice the price of the item being purchased
 */
-(void)setItemPrice:(double)theItemPrice;

/**
 The formatted item price that will be used to build the monetization event
 @returns The item price formatted with its currency
 */
-(NSString *)formattedItemPrice;

/**
 Sets the formatted item price in its local currency to use when building the monetization event
 @param theFormattedItemPrice the formatted item price in its local currency
 */
-(void)setFormattedItemPrice:(NSString *)theFormattedItemPrice;

/**
 The transaction id that will be used to build the monetization event
 @returns The transaction id
 */
-(NSString *)transactionId;

/**
 Sets the transaction id to use when building the monetization event
 @param theTransactionId the transaction id of the purchase
 */
-(void)setTransactionId:(NSString *)theTransactionId;

/**
 The currency that be used to build the monetization event
 @returns The currency
 */
-(NSString *)currency;

/**
 Sets the currency of the item price to use when building the monetization event
 @param theCurrency the ISO currency code or virtual curreny name of the item price
 */
-(void)setCurrency:(NSString *)theCurrency;

/**
 The name of the Store where this purchase was made. For example "Apple" for purchases
 originating from the Apple IAP Store, or "Virtual" if the purchase was performed in your in-game store.
 @returns The store of the purchase
 */
-(NSString *)store;

/**
 Sets the name of the Store to use when building the monetization event
 @param theStore the store where the purchase originated from (i.e. "Apple" or "Virtual")
 */
-(void)setStore:(NSString *)theStore;

@end
