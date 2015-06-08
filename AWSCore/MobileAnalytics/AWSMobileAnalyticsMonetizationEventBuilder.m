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

#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSMobileAnalyticsMonetizationEventBuilder.h"
#import "AWSLogging.h"

static NSString* const PURCHASE_EVENT_NAME = @"_monetization.purchase";

static NSString* const PURCHASE_EVENT_QUANTITY_METRIC = @"_quantity";
static NSString* const PURCHASE_EVENT_ITEM_PRICE_METRIC = @"_item_price";

static NSString* const PURCHASE_EVENT_PRODUCT_ID_ATTR = @"_product_id";
static NSString* const PURCHASE_EVENT_PRICE_FORMATTED_ATTR = @"_item_price_formatted";
static NSString* const PURCHASE_EVENT_CURRENCY_ATTR = @"_currency";
static NSString* const PURCHASE_EVENT_STORE_ATTR = @"_store";
static NSString* const PURCHASE_EVENT_TRANSACTION_ID_ATTR = @"_transaction_id";

@implementation AWSMobileAnalyticsMonetizationEventBuilder{
    id<AWSMobileAnalyticsEventClient> eventClient;
    
    NSString* productId;
    NSInteger quantity;
    double itemPrice;
    NSString* formattedItemPrice;
    NSString* transactionId;
    NSString* currency;
    NSString* store;
    
    BOOL isItemPriceSet;
    BOOL isQuantitySet;
}

-(id<AWSMobileAnalyticsEvent>)build{
    id<AWSMobileAnalyticsEvent> purchaseEvent = nil;
    
    if([self isValid] && [self doBaseValidation]){
        purchaseEvent = [eventClient createEventWithEventType:PURCHASE_EVENT_NAME];
        
        [purchaseEvent addAttribute:productId forKey:PURCHASE_EVENT_PRODUCT_ID_ATTR];
        [purchaseEvent addAttribute:store forKey:PURCHASE_EVENT_STORE_ATTR];
        [purchaseEvent addMetric:[NSNumber numberWithInteger:quantity] forKey:PURCHASE_EVENT_QUANTITY_METRIC];
        
        
        if(formattedItemPrice != nil){
            [purchaseEvent addAttribute:formattedItemPrice forKey:PURCHASE_EVENT_PRICE_FORMATTED_ATTR];
        }
        
        if(isItemPriceSet){
            [purchaseEvent addMetric:[NSNumber numberWithDouble:itemPrice] forKey:PURCHASE_EVENT_ITEM_PRICE_METRIC];
        }
        
        if (currency != nil) {
            [purchaseEvent addAttribute:currency forKey:PURCHASE_EVENT_CURRENCY_ATTR];
        }
        
        if(transactionId != nil){
            [purchaseEvent addAttribute:transactionId forKey:PURCHASE_EVENT_TRANSACTION_ID_ATTR];
        }
    }
    
    return purchaseEvent;
}

-(BOOL) isValid{
    AWSLogWarn(@"You are required to override the isValid method of the monetization event builder");
    return false;
}

-(id)initWithEventClient:(id<AWSMobileAnalyticsEventClient>)theEventClient{
    if(self = [super init]){
        eventClient = theEventClient;
        
        productId = nil;
        quantity = 0;
        itemPrice = 0;
        formattedItemPrice = nil;
        transactionId = nil;
        currency = nil;
        store = nil;
    }
    return self;
}

-(NSString *)productId{
    return productId;
}
-(void)setProductId:(NSString *)theProductId{
    productId = theProductId;
}

-(NSInteger)quantity{
    return quantity;
}
-(void)setQuantity:(NSInteger)theQuantity{
    isQuantitySet = YES;
    quantity = theQuantity;
}

-(double)itemPrice{
    return itemPrice;
}
-(void)setItemPrice:(double)theItemPrice{
    isItemPriceSet = YES;
    itemPrice = theItemPrice;
}

-(NSString *)formattedItemPrice{
    return formattedItemPrice;
}
-(void)setFormattedItemPrice:(NSString *)theFormattedItemPrice{
    formattedItemPrice = theFormattedItemPrice;
}

-(NSString *)transactionId{
    return transactionId;
}
-(void)setTransactionId:(NSString *)theTransactionId{
    transactionId = theTransactionId;
}

-(NSString *)currency{
    return currency;
}
-(void)setCurrency:(NSString *)theCurrency{
    currency = theCurrency;
}

-(NSString *)store{
    return store;
}
-(void)setStore:(NSString *)theStore{
    store = theStore;
}

-(BOOL)doBaseValidation{
    if (eventClient == nil) {
        AWSLogError(@"Cannot build Monetization event: the eventClient is null");
        return false;
    }
    
    if ([AWSMobileAnalyticsStringUtils isBlank:productId]) {
        AWSLogError(@"Base Monetization event is not valid: it is missing the product id");
        return false;
    }
    
    if (!isQuantitySet) {
        AWSLogError(@"Base Monetization event is not valid: it is missing the quantity");
        return false;
    }
    
    if ([AWSMobileAnalyticsStringUtils isBlank:store]) {
        AWSLogError(@"Base Monetization event is not valid: it is missing the store");
        return false;
    }
    
    if ([AWSMobileAnalyticsStringUtils isBlank:currency] || !isItemPriceSet) {
        if([AWSMobileAnalyticsStringUtils isBlank:formattedItemPrice]){
            AWSLogError(@"Base Monetization event is not valid: it requires the formatted price or the currency and price");
            return false;
        }
    }
    
    return true;
}

@end
