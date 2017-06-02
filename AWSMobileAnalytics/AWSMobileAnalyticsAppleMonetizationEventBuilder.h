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
#import "AWSMobileAnalyticsMonetizationEventBuilder.h"

/**
 AWSMobileAnalyticsAppleMonetizationEventBuilder builds monetization events to track purchases from Apple's
 IAP Framework. In order to build a monetization event, you must call all of the setters on this builder.
 You will need to access properties on both the SKProduct class and the SKPurchaseTransaction class in order
 to build an Apple Monetization event.

 The example below demonstrates how to create a monetization event after you recieve a SKPaymentTransaction
 from the SKPaymentTransactionObserver. Since Apple does not give you any product information in the SKPaymentTransaction
 object, you must have a way to access your SKProduct store inventory when the purchase is being finalized. In the example
 below, we have a product catalog object that can return SKProduct's based on the product id returned in an SKPaymentTransaction object.
 This product catalog was built after receiving a SKProductsRequest from the SKProductsRequestDelegate.

 Example:

	 -(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
		for (SKPaymentTransaction* transaction in transactions) {
		   switch (transaction.transactionState) {
			  case SKPaymentTransactionStatePurchased:

			  // when an item is purchased, give the user access to the content, and
			  // record a monetization purchase event.
			  [self completeTransaction:transaction];
				 break;
			  case SKPaymentTransactionStateFailed:
				 // ... handle a failed transaction
				 break;
			  case SKPaymentTransactionStateRestored:
				 // ... restore the transaction
				 break;
		   }
		}
	 }

	 -(void)completeTransaction:(SKPaymentTransaction*)transaction{
		// provide the content that the user purchased
		[self provideContentForProductIdentifier:transaction.payment.productIdentifier];

		// get the SKProduct for the product identifier that was purchased
		SKProduct* product = [productCatalog objectForKey:transaction.payment.productIdentifier];

		// get the event client for the builder
		id<AWSMobileAnalyticsEventClient> eventClient = insights.eventClient;

		// create a builder that can record purchase events from Apple
		AWSMobileAnalyticsAppleMonetizationEventBuilder* builder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:eventClient];

		// set the product id of the purchased item (obtained from the SKPurchaseTransaction object)
		[builder withProductId:transaction.payment.productIdentifier];

		// set the item price and price locale (obtained from the SKProduct object)
		[builder withItemPrice:[product.price doubleValue]
				andPriceLocale:product.priceLocale];

		// set the quantity of item(s) purchased (obtained from the SKPurchaseTransaction object)
		[builder withQuantity:transaction.payment.quantity];

		// set the transactionId of the transaction (obtained from the SKPurchaseTransaction object)
		[builder withTransactionId:transaction.transactionIdentifier];

		// build the monetization event
		id<AWSMobileAnalyticsEvent> purchaseEvent = [builder build];

		// add any additional metrics/attributes and record
		[eventClient recordEvent:purchaseEvent];

		// finalize the transaction as required by Apple
		[[SKPaymentQueue defaultQueue] finishTransaction:transaction];
	 }
 */
@interface AWSMobileAnalyticsAppleMonetizationEventBuilder : AWSMobileAnalyticsMonetizationEventBuilder

/**
 Create a monetization builder that can record purchase events from Apple's
 IAP Framework.
 @param theEventClient The event client used to create the event
 @returns a monetization event builder for Apple purchases
 */
+(AWSMobileAnalyticsAppleMonetizationEventBuilder*) builderWithEventClient:(id<AWSMobileAnalyticsEventClient>)theEventClient;

/**
 Sets the product id for the item(s) being purchased
 @param theProductId The product id of the item(s) being purchased
 */
-(void)withProductId:(NSString *)theProductId;

/**
 Sets the item price and locale of the item being purchased. (Obtained from the SKProduct object)
 @param theItemPrice The numerical item price
 @param thePriceLocale The locale representing the item price's currency
 */
-(void)withItemPrice:(double)theItemPrice andPriceLocale:(NSLocale *)thePriceLocale;

/**
 Sets the quantity of item(s) being purchased. (Obtained from the SKPurchaseTransaction object)
 @param theQuantity The quantity of items purchased
 */
-(void)withQuantity:(NSInteger)theQuantity;

/**
 Sets the transaction id of the purchase (Obtained from the SKPurchaseTransaction object)
 @param theTransactionId The transaction id of the purchase
 */
-(void)withTransactionId:(NSString *)theTransactionId;

/**
 Builds the monetization event using the parameters set on the builder. You must
 still record the event.
 @returns an AWSMobileAnalyticsEvent to record
 */
-(id<AWSMobileAnalyticsEvent>) build;

@end
