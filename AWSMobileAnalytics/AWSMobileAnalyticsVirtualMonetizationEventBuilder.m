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

#import "AWSMobileAnalyticsVirtualMonetizationEventBuilder.h"
#import "AWSCocoaLumberjack.h"

static NSString* const AWSMobileAnalyticsVirtualStore = @"Virtual";

@interface AWSMobileAnalyticsVirtualMonetizationEventBuilder()

@property (nonatomic) BOOL isItemPriceSet;
@property (nonatomic) BOOL isQuantitySet;

@end

@implementation AWSMobileAnalyticsVirtualMonetizationEventBuilder

+(AWSMobileAnalyticsVirtualMonetizationEventBuilder*) builderWithEventClient:(id<AWSMobileAnalyticsEventClient>)theEventClient{
    return [[AWSMobileAnalyticsVirtualMonetizationEventBuilder alloc] initWithEventClient:theEventClient];
}
-(AWSMobileAnalyticsVirtualMonetizationEventBuilder*) initWithEventClient:(id<AWSMobileAnalyticsEventClient>)theEventClient{
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualMonetizationEventBuilder = [super initWithEventClient:theEventClient];
    [self setStore:AWSMobileAnalyticsVirtualStore];
    return virtualMonetizationEventBuilder;
}

-(void)withProductId:(NSString *)theProductId{
    [self setProductId:theProductId];
}
-(void)withItemPrice:(double)theItemPrice{
    self.isItemPriceSet = YES;
    [self setItemPrice:theItemPrice];
}
-(void)withQuantity:(NSInteger)theQuantity{
    self.isQuantitySet = YES;
    [self setQuantity:theQuantity];
}
-(void)withCurrency:(NSString *)theCurrency{
    [self setCurrency:theCurrency];
}

-(BOOL)isValid{
    if([self productId] == nil){
        AWSDDLogError(@"Virtual Monetization event is not valid: it requires the product id");
        return false;
    }
    
    if(!self.isQuantitySet){
        AWSDDLogError(@"Virtual Monetization event is not valid: it is missing the quantity");
        return false;
    }
    
    if(!self.isItemPriceSet){
        AWSDDLogError(@"Virtual Monetization event is not valid: it is missing the numerical price");
        return false;
    }
    
    if ([self currency] == nil){
        AWSDDLogError(@"Virtual Monetization event is not valid: it requires the currency");
        return false;
    }
    
    return true;
}

-(id<AWSMobileAnalyticsEvent>)build{
    return [super build];
}

@end
