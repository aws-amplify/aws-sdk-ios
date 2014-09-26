/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AWSMobileAnalyticsAppleMonetizationEventBuilder.h"
#import "AWSLogging.h"

static NSString* const AWSMobileAnalyticsAppleStore = @"Apple";

@interface AWSMobileAnalyticsAppleMonetizationEventBuilder()

@property (nonatomic) BOOL isItemPriceSet;
@property (nonatomic) BOOL isQuantitySet;

@end

@implementation AWSMobileAnalyticsAppleMonetizationEventBuilder

+(AWSMobileAnalyticsAppleMonetizationEventBuilder*) builderWithEventClient:(id<AWSMobileAnalyticsEventClient>)theEventClient{
    return [[AWSMobileAnalyticsAppleMonetizationEventBuilder alloc] initWithEventClient:theEventClient];
}

-(AWSMobileAnalyticsAppleMonetizationEventBuilder*) initWithEventClient:(id<AWSMobileAnalyticsEventClient>)theEventClient{
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleMonetizationEventBuilder = [super initWithEventClient:theEventClient];
    [self setStore:AWSMobileAnalyticsAppleStore];
    return appleMonetizationEventBuilder;
}

-(void)withProductId:(NSString *)theProductId{
    [self setProductId:theProductId];
}

-(void)withItemPrice:(double)theItemPrice andPriceLocale:(NSLocale *)thePriceLocale{
    self.isItemPriceSet = YES;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setLocale:thePriceLocale];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLenient:YES];
    
    [self setItemPrice:theItemPrice];
    [self setFormattedItemPrice:[numberFormatter stringFromNumber:[NSNumber numberWithDouble:theItemPrice]]];
    [self setCurrency:[thePriceLocale objectForKey:NSLocaleCurrencyCode]];

}
-(void)withQuantity:(NSInteger)theQuantity{
    self.isQuantitySet = YES;
    [self setQuantity:theQuantity];
}
-(void)withTransactionId:(NSString *)theTransactionId{
    [self setTransactionId:theTransactionId];
}

-(BOOL)isValid{
    if([self productId] == nil){
        AWSLogError(@"Apple Monetization event is not valid: it requires the product id");
        return false;
    }
    
    if([self transactionId] == nil){
        AWSLogError(@"Apple Monetization event is not valid: it requires the transaction id");
        return false;
    }
    
    if(self.isItemPriceSet != YES){
        AWSLogError(@"Apple Monetization event is not valid: it requires the item price and locale");
        return false;
    }
    
    if(self.isQuantitySet != YES){
        AWSLogError(@"Apple Monetization event is not valid: it requires the quantity");
        return false;
    }
    
    return true;
}

-(id<AWSMobileAnalyticsEvent>)build{
    return [super build];
}

@end
