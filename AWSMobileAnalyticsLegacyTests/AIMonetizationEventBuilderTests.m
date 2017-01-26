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

#import "AIMonetizationEventBuilderTests.h"
#import "AWSMobileAnalyticsMonetizationEventBuilder.h"
#import "AWSMobileAnalyticsAppleMonetizationEventBuilder.h"
#import "AWSMobileAnalyticsVirtualMonetizationEventBuilder.h"
#import "AWSMockFileManager.h"

@interface AITestEvent : NSObject<AWSMobileAnalyticsEvent>

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSMutableDictionary* attributes;
@property(nonatomic, strong) NSMutableDictionary* metrics;

-(NSString*) eventType;

+(AITestEvent*) eventWithName:(NSString*)theEventName;

- (void)addAttribute:(NSString *)theValue
              forKey:(NSString *)theKey;

- (void)addMetric:(NSNumber *)theValue
           forKey:(NSString *)theKey;

- (NSString *)attributeForKey:(NSString *)theKey;

- (NSNumber *)metricForKey:(NSString *)theKey;

- (BOOL)hasAttributeForKey:(NSString *)theKey;

- (BOOL)hasMetricForKey:(NSString *)theKey;

- (NSDictionary*) allAttributes;

- (NSDictionary*) allMetrics;
@end

@implementation AITestEvent

+(AITestEvent*) eventWithName:(NSString *)theEventName
{
    return [[AITestEvent alloc] initWithName:theEventName];
}

-(AITestEvent*) initWithName:(NSString*) theName
{
    if(self = [super init])
    {
        self.name = theName;
        self.attributes = [NSMutableDictionary dictionary];
        self.metrics = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addAttribute:(NSString *)theValue
              forKey:(NSString *)theKey;
{
    [self.attributes setObject:theValue forKey:theKey];
}

- (void)addMetric:(NSNumber *)theValue
           forKey:(NSString *)theKey;
{
    [self.metrics setObject:theValue forKey:theKey];
}

-(NSString*) eventType
{
    return self.name;
}

- (NSString *)attributeForKey:(NSString *)theKey;
{
    return [self.attributes objectForKey:theKey];
}

- (NSNumber *)metricForKey:(NSString *)theKey;
{
    return [self.metrics objectForKey:theKey];
}

- (BOOL)hasAttributeForKey:(NSString *)theKey;
{
    return [self.attributes objectForKey:theKey] != nil;
}

- (BOOL)hasMetricForKey:(NSString *)theKey;
{
    return [self.metrics objectForKey:theKey] != nil;
}

- (NSDictionary*) allAttributes;
{
    return self.attributes;
}

- (NSDictionary*) allMetrics;
{
    return self.metrics;
}

@end

static id mockEventClient;

@implementation AIMonetizationEventBuilderTests

-(void)setUp{
     
    
    id<AWSMobileAnalyticsEvent> testEvent = [[AITestEvent alloc] initWithName:@"_monetization.purchase"];
    mockEventClient = [OCMockObject mockForProtocol:@protocol(AWSMobileAnalyticsEventClient)];
    
    [[[mockEventClient stub] andReturn:testEvent] createEventWithEventType:@"_monetization.purchase"];
}

-(void) test_appleMonetizationEvent_initialize
{
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    
    id<AWSMobileAnalyticsEvent> monetizationEvent = [appleBuilder build];
    
    assertThat(monetizationEvent, is(nilValue()));
    
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSInteger quantity = 1;
    
    appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    
    [appleBuilder withItemPrice:0.99 andPriceLocale:usLocale];
    [appleBuilder withProductId:@"com.rovio.angrybirds.porkProduct"];
    [appleBuilder withQuantity:quantity];
    [appleBuilder withTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
    
    monetizationEvent = [appleBuilder build];
    
    assertThat(monetizationEvent, is(notNilValue()));
}

-(void) test_appleMonetizationEvent_hasMonetizationMetricsAttributes
{
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSInteger quantity = 1;
    
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    
    [appleBuilder withItemPrice:0.99 andPriceLocale:usLocale];
    [appleBuilder withProductId:@"com.rovio.angrybirds.porkProduct"];
    [appleBuilder withQuantity:quantity];
    [appleBuilder withTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
    
    id<AWSMobileAnalyticsEvent> monetizationEvent = [appleBuilder build];
    
    assertThat(monetizationEvent, is(notNilValue()));
    assertThat([monetizationEvent eventType], is(equalTo(@"_monetization.purchase")));
    assertThatBool([monetizationEvent hasMetricForKey:@"_item_price"], is(equalToBool(YES)));
    assertThatBool([monetizationEvent hasMetricForKey:@"_quantity"], is(equalToBool(YES)));
    assertThatBool([monetizationEvent hasAttributeForKey:@"_product_id"], is(equalToBool(YES)));
    assertThatBool([monetizationEvent hasAttributeForKey:@"_item_price_formatted"], is(equalToBool(YES)));
    assertThatBool([monetizationEvent hasAttributeForKey:@"_currency"], is(equalToBool(YES)));
    assertThatBool([monetizationEvent hasAttributeForKey:@"_store"], is(equalToBool(YES)));
    assertThatBool([monetizationEvent hasAttributeForKey:@"_transaction_id"], is(equalToBool(YES)));
}

-(void) test_appleMonetizationEvent_correctMonetizationMetricsAttributes
{
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSInteger quantity = 1;
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setLocale:usLocale];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLenient:YES];
    
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    
    [appleBuilder withItemPrice:1.99 andPriceLocale:usLocale];
    [appleBuilder withProductId:@"com.rovio.angrybirds.porkProduct"];
    [appleBuilder withQuantity:quantity];
    [appleBuilder withTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
    
    id<AWSMobileAnalyticsEvent> monetizationEvent = [appleBuilder build];
    
    [monetizationEvent addAttribute:@"value1" forKey:@"attr1"];
    [monetizationEvent addAttribute:@"value2" forKey:@"attr2"];
    [monetizationEvent addAttribute:@"value3" forKey:@"attr3"];
    
    [monetizationEvent addMetric:[NSNumber numberWithInt:1] forKey:@"metric1"];
    [monetizationEvent addMetric:[NSNumber numberWithDouble:234.56] forKey:@"metric2"];
    [monetizationEvent addMetric:[NSNumber numberWithInt:781] forKey:@"metric3"];
    
    assertThat(monetizationEvent, is(notNilValue()));
    assertThat([monetizationEvent eventType], is(equalTo(@"_monetization.purchase")));
    assertThat([monetizationEvent metricForKey:@"_item_price"], is(equalTo([NSNumber numberWithDouble:1.99])));
    assertThat([monetizationEvent metricForKey:@"_quantity"], is(equalTo([NSNumber numberWithInt:1])));
    assertThat([monetizationEvent attributeForKey:@"_product_id"], is(equalTo(@"com.rovio.angrybirds.porkProduct")));
    assertThat([monetizationEvent attributeForKey:@"_item_price_formatted"], is(equalTo([numberFormatter stringFromNumber:[NSNumber numberWithDouble:1.99]])));
    assertThat([monetizationEvent attributeForKey:@"_currency"], is(equalTo([usLocale objectForKey:NSLocaleCurrencyCode])));
    assertThat([monetizationEvent attributeForKey:@"_store"], is(equalTo(@"Apple")));
    assertThat([monetizationEvent attributeForKey:@"_transaction_id"], is(equalTo(@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:==")));
    
    assertThat([monetizationEvent metricForKey:@"metric1"], is(equalTo([NSNumber numberWithInt:1])));
    assertThat([monetizationEvent metricForKey:@"metric2"], is(equalTo([NSNumber numberWithDouble:234.56])));
    assertThat([monetizationEvent metricForKey:@"metric3"], is(equalTo([NSNumber numberWithInt:781])));
    
    assertThat([monetizationEvent attributeForKey:@"attr1"], is(equalTo(@"value1")));
    assertThat([monetizationEvent attributeForKey:@"attr2"], is(equalTo(@"value2")));
    assertThat([monetizationEvent attributeForKey:@"attr3"], is(equalTo(@"value3")));
}

-(void) test_appleMonetizationEvent_nilValues
{    
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSInteger quantity = 1;
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setLocale:usLocale];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLenient:YES];
    
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    
    [appleBuilder withItemPrice:0.99 andPriceLocale:usLocale];
    [appleBuilder withProductId:nil];
    [appleBuilder withQuantity:quantity];
    [appleBuilder withTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
    
    id<AWSMobileAnalyticsEvent> monetizationEvent = [appleBuilder build];
    assertThat(monetizationEvent, is(nilValue())); //nil product id
    
    appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [appleBuilder withItemPrice:0.99 andPriceLocale:nil];
    [appleBuilder withProductId:nil];
    [appleBuilder withQuantity:quantity];
    [appleBuilder withTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
    
    monetizationEvent = [appleBuilder build];
    assertThat(monetizationEvent, is(nilValue())); //nil locale
    
    appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [appleBuilder withItemPrice:0.99 andPriceLocale:usLocale];
    [appleBuilder withProductId:nil];
    [appleBuilder withQuantity:quantity];
    [appleBuilder withTransactionId:nil];
    
    monetizationEvent = [appleBuilder build];
    assertThat(monetizationEvent, is(nilValue())); //nil transaction id
}

-(void) test_appleMonetizationEvent_manyLocaleCurrencyConversions {
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = nil;
    
    NSInteger quantity = 1;
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLenient:YES];
    
    for (NSString* localeIdentifier in [NSLocale availableLocaleIdentifiers]) {
        NSLocale *newLocale = [[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier];
        NSString* currencyCode = [newLocale objectForKey:NSLocaleCurrencyCode]; if(currencyCode == nil){continue;}
        [numberFormatter setLocale:newLocale];
        for (double price = -10; price <= 10; price += 2.5) {
            appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
            [appleBuilder withItemPrice:price andPriceLocale:newLocale];
            [appleBuilder withProductId:@"com.rovio.angrybirds.porkProduct"];
            [appleBuilder withQuantity:quantity];
            [appleBuilder withTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
            
            id<AWSMobileAnalyticsEvent> monetizationEvent = [appleBuilder build];
            
            assertThat(monetizationEvent, is(notNilValue()));
            assertThat([monetizationEvent attributeForKey:@"_item_price_formatted"], is(equalTo([numberFormatter stringFromNumber:[NSNumber numberWithDouble:price]])));
            assertThat([monetizationEvent attributeForKey:@"_currency"], is(equalTo([newLocale objectForKey:NSLocaleCurrencyCode])));
        }
        
        double extremelyLargePrice = 10000000.1;
        appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
        [appleBuilder withItemPrice:extremelyLargePrice andPriceLocale:newLocale];
        [appleBuilder withProductId:@"com.rovio.angrybirds.porkProduct"];
        [appleBuilder withQuantity:quantity];
        [appleBuilder withTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
        
        id<AWSMobileAnalyticsEvent> monetizationEventLarge = [appleBuilder build];
        
        assertThat(monetizationEventLarge, is(notNilValue()));
        assertThat([monetizationEventLarge attributeForKey:@"_item_price_formatted"], is(equalTo([numberFormatter stringFromNumber:[NSNumber numberWithDouble:extremelyLargePrice]])));
        assertThat([monetizationEventLarge attributeForKey:@"_currency"], is(equalTo([newLocale objectForKey:NSLocaleCurrencyCode])));
        
        double extremelySmallPrice = -10000000.1;
        appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
        [appleBuilder withItemPrice:extremelySmallPrice andPriceLocale:newLocale];
        [appleBuilder withProductId:@"com.rovio.angrybirds.porkProduct"];
        [appleBuilder withQuantity:quantity];
        [appleBuilder withTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
        
        id<AWSMobileAnalyticsEvent> monetizationEventSmall = [appleBuilder build];
        
        assertThat(monetizationEventSmall, is(notNilValue()));
        assertThat([monetizationEventSmall attributeForKey:@"_item_price_formatted"], is(equalTo([numberFormatter stringFromNumber:[NSNumber numberWithDouble:extremelySmallPrice]])));
        assertThat([monetizationEventSmall attributeForKey:@"_currency"], is(equalTo([newLocale objectForKey:NSLocaleCurrencyCode])));
    }
}

-(void) test_appleBuild_eventClientNotSet_returnsNil{
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:nil];
    [self verifyAppleMonetizationEventWithBuilder:appleBuilder andIsSuccessful:NO andItemPrice:0.99 andLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] andProductId:@"com.rovio.angrybirds.porkProduct" andQuantity:YES andTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
}

-(void) test_appleBuild_localeNotSet_returnsNil{
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyAppleMonetizationEventWithBuilder:appleBuilder andIsSuccessful:NO andItemPrice:0.99 andLocale:nil andProductId:@"com.rovio.angrybirds.porkProduct" andQuantity:YES andTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
}

-(void) test_appleBuild_productIdNotSet_returnsNil{
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyAppleMonetizationEventWithBuilder:appleBuilder andIsSuccessful:NO andItemPrice:0.99 andLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] andProductId:nil andQuantity:YES andTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
}

-(void) test_appleBuild_productIdEmpty_returnsNil{
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyAppleMonetizationEventWithBuilder:appleBuilder andIsSuccessful:NO andItemPrice:0.99 andLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] andProductId:@"" andQuantity:YES andTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
}

-(void) test_appleBuild_quantityNotSet_returnsNil{
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyAppleMonetizationEventWithBuilder:appleBuilder andIsSuccessful:NO andItemPrice:0.99 andLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] andProductId:@"com.rovio.angrybirds.porkProduct" andQuantity:NO andTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
}

-(void) test_appleBuild_transactionIdNotSet_returnsNil{
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyAppleMonetizationEventWithBuilder:appleBuilder andIsSuccessful:NO andItemPrice:0.99 andLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] andProductId:@"com.rovio.angrybirds.porkProduct" andQuantity:YES andTransactionId:nil];
}

-(void) test_appleBuild_allValuesSet_returnsEvent{
    AWSMobileAnalyticsAppleMonetizationEventBuilder* appleBuilder = [AWSMobileAnalyticsAppleMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyAppleMonetizationEventWithBuilder:appleBuilder andIsSuccessful:YES andItemPrice:0.99 andLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] andProductId:@"com.rovio.angrybirds.porkProduct" andQuantity:YES andTransactionId:@"12345ABCDEFGZYXDFGJSDFG=SJFGSDFG:=="];
}

-(void) verifyAppleMonetizationEventWithBuilder:(AWSMobileAnalyticsAppleMonetizationEventBuilder*)builder andIsSuccessful:(BOOL)isSuccessful andItemPrice:(double)itemPrice andLocale:(NSLocale*)locale andProductId:(NSString*)productId andQuantity:(BOOL)hasQuantity andTransactionId:(NSString*)transactionId
{
    NSInteger quantity = 1;
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLenient:YES];
    
    if(locale != nil){
        [builder withItemPrice:itemPrice andPriceLocale:locale];
        [numberFormatter setLocale:locale];
    }
    if(productId != nil){
        [builder withProductId:productId];
    }
    if(hasQuantity){
        [builder withQuantity:quantity];
    }
    if(transactionId != nil){
        [builder withTransactionId:transactionId];
    }
    
    id<AWSMobileAnalyticsEvent> monetizationEvent = [builder build];
    
    if(isSuccessful){
        assertThat(monetizationEvent, is(notNilValue()));
        assertThat([monetizationEvent eventType], is(equalTo(@"_monetization.purchase")));
        assertThat([monetizationEvent metricForKey:@"_item_price"], is(equalTo([NSNumber numberWithDouble:itemPrice])));
        assertThat([monetizationEvent metricForKey:@"_quantity"], is(equalTo([NSNumber numberWithInteger:quantity])));
        assertThat([monetizationEvent attributeForKey:@"_product_id"], is(equalTo(productId)));
        assertThat([monetizationEvent attributeForKey:@"_item_price_formatted"], is(equalTo([numberFormatter stringFromNumber:[NSNumber numberWithDouble:itemPrice]])));
        assertThat([monetizationEvent attributeForKey:@"_currency"], is(equalTo([locale objectForKey:NSLocaleCurrencyCode])));
        assertThat([monetizationEvent attributeForKey:@"_store"], is(equalTo(@"Apple")));
        assertThat([monetizationEvent attributeForKey:@"_transaction_id"], is(equalTo(transactionId)));
    }else{
        assertThat(monetizationEvent, is(nilValue()));
    }
}


-(void) test_virtualCurrencyMonetizationEvent_initialize
{
    NSInteger quantity = 1;
    
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    
    [virtualBuilder withItemPrice:200];
    [virtualBuilder withProductId:@"bomb.smallPack"];
    [virtualBuilder withQuantity:quantity];
    [virtualBuilder withCurrency:@"AngryBucks"];
    
    id<AWSMobileAnalyticsEvent> monetizationEvent = [virtualBuilder build];
    
    assertThat(monetizationEvent, is(notNilValue()));
}

-(void) test_virtualCurrencyMonetizationEvent_hasMonetizationMetricsAttributes
{
    NSInteger quantity = 1;
    
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    
    [virtualBuilder withItemPrice:200];
    [virtualBuilder withProductId:@"bomb.smallPack"];
    [virtualBuilder withQuantity:quantity];
    [virtualBuilder withCurrency:@"AngryBucks"];
    
    id<AWSMobileAnalyticsEvent> monetizationEvent = [virtualBuilder build];
    
    assertThat(monetizationEvent, is(notNilValue()));
    assertThat([monetizationEvent eventType], is(equalTo(@"_monetization.purchase")));
    assertThatBool([monetizationEvent hasMetricForKey:@"_item_price"], is(equalToBool(YES)));
    assertThatBool([monetizationEvent hasMetricForKey:@"_quantity"], is(equalToBool(YES)));
    assertThatBool([monetizationEvent hasAttributeForKey:@"_product_id"], is(equalToBool(YES)));
    assertThatBool([monetizationEvent hasAttributeForKey:@"_currency"], is(equalToBool(YES)));
    assertThatBool([monetizationEvent hasAttributeForKey:@"_store"], is(equalToBool(YES)));
    
}

-(void) test_virtualCurrencyMonetizationEvent_correctMonetizationMetricsAttributes
{
    NSInteger quantity = 1;
    
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    
    [virtualBuilder withItemPrice:200];
    [virtualBuilder withProductId:@"bomb.smallPack"];
    [virtualBuilder withQuantity:quantity];
    [virtualBuilder withCurrency:@"AngryBucks"];
    
    id<AWSMobileAnalyticsEvent> monetizationEvent = [virtualBuilder build];
    
    [monetizationEvent addAttribute:@"value1" forKey:@"attr1"];
    [monetizationEvent addAttribute:@"value2" forKey:@"attr2"];
    [monetizationEvent addAttribute:@"value3" forKey:@"attr3"];
    
    [monetizationEvent addMetric:[NSNumber numberWithInt:1] forKey:@"metric1"];
    [monetizationEvent addMetric:[NSNumber numberWithDouble:234.56] forKey:@"metric2"];
    [monetizationEvent addMetric:[NSNumber numberWithInt:781] forKey:@"metric3"];
    
    assertThat(monetizationEvent, is(notNilValue()));
    assertThat([monetizationEvent eventType], is(equalTo(@"_monetization.purchase")));
    assertThat([monetizationEvent metricForKey:@"_item_price"], is(equalTo([NSNumber numberWithDouble:200])));
    assertThat([monetizationEvent metricForKey:@"_quantity"], is(equalTo([NSNumber numberWithInt:1])));
    assertThat([monetizationEvent attributeForKey:@"_product_id"], is(equalTo(@"bomb.smallPack")));
    assertThat([monetizationEvent attributeForKey:@"_currency"], is(equalTo(@"AngryBucks")));
    assertThat([monetizationEvent attributeForKey:@"_store"], is(equalTo(@"Virtual")));
    
    assertThat([monetizationEvent metricForKey:@"metric1"], is(equalTo([NSNumber numberWithInt:1])));
    assertThat([monetizationEvent metricForKey:@"metric2"], is(equalTo([NSNumber numberWithDouble:234.56])));
    assertThat([monetizationEvent metricForKey:@"metric3"], is(equalTo([NSNumber numberWithInt:781])));
    
    assertThat([monetizationEvent attributeForKey:@"attr1"], is(equalTo(@"value1")));
    assertThat([monetizationEvent attributeForKey:@"attr2"], is(equalTo(@"value2")));
    assertThat([monetizationEvent attributeForKey:@"attr3"], is(equalTo(@"value3")));
}

-(void) test_virtualCurrencyMonetizationEvent_nilValues
{
    NSInteger quantity = 1;
    
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    
    [virtualBuilder withItemPrice:200];
    [virtualBuilder withProductId:nil];
    [virtualBuilder withQuantity:quantity];
    [virtualBuilder withCurrency:@"AngryBucks"];
    
    id<AWSMobileAnalyticsEvent> monetizationEvent = [virtualBuilder build];
    assertThat(monetizationEvent, is(nilValue())); //nil product id
    
    virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [virtualBuilder withItemPrice:200];
    [virtualBuilder withProductId:@"bomb.smallPack"];
    [virtualBuilder withQuantity:quantity];
    [virtualBuilder withCurrency:nil];
    
    monetizationEvent = [virtualBuilder build];
    assertThat(monetizationEvent, is(nilValue())); //nil currency name
}

-(void) test_virtualBuild_eventClientNotSet_returnsNil{
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:nil];
    [self verifyVirtualMonetizationEventWithBuilder:virtualBuilder andIsSuccessful:NO andItemPrice:YES andProductId:@"bomb.smallPack" andQuantity:YES andCurrency:@"AngryBucks"];
}

-(void) test_virtualBuild_productIdNotSet_returnsNil{
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyVirtualMonetizationEventWithBuilder:virtualBuilder andIsSuccessful:NO andItemPrice:YES andProductId:nil andQuantity:YES andCurrency:@"AngryBucks"];
}

-(void) test_virtualBuild_ProductIdEmpty_returnsNil{
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyVirtualMonetizationEventWithBuilder:virtualBuilder andIsSuccessful:NO andItemPrice:YES andProductId:@"" andQuantity:YES andCurrency:@"AngryBucks"];
}

-(void) test_virtualBuild_quantityNotSet_returnsNil{
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyVirtualMonetizationEventWithBuilder:virtualBuilder andIsSuccessful:NO andItemPrice:YES andProductId:@"bomb.smallPack" andQuantity:NO andCurrency:@"AngryBucks"];
}

-(void) test_virtualBuild_itemPriceNotSet_returnsNil{
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyVirtualMonetizationEventWithBuilder:virtualBuilder andIsSuccessful:NO andItemPrice:NO andProductId:@"bomb.smallPack" andQuantity:YES andCurrency:@"AngryBucks"];
}

-(void) test_virtualBuild_currencyNotSet_returnsNil{
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyVirtualMonetizationEventWithBuilder:virtualBuilder andIsSuccessful:NO andItemPrice:YES andProductId:@"bomb.smallPack" andQuantity:YES andCurrency:nil];
}

-(void) test_virtualBuild_currencyEmpty_returnsNil{
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyVirtualMonetizationEventWithBuilder:virtualBuilder andIsSuccessful:NO andItemPrice:YES andProductId:@"bomb.smallPack" andQuantity:YES andCurrency:@""];
}

-(void) test_virtualBuild_allValuesSet_returnsEvent{
    AWSMobileAnalyticsVirtualMonetizationEventBuilder* virtualBuilder = [AWSMobileAnalyticsVirtualMonetizationEventBuilder builderWithEventClient:mockEventClient];
    [self verifyVirtualMonetizationEventWithBuilder:virtualBuilder andIsSuccessful:YES andItemPrice:YES andProductId:@"bomb.smallPack" andQuantity:YES andCurrency:@"AngryBucks"];
}

-(void) verifyVirtualMonetizationEventWithBuilder:(AWSMobileAnalyticsVirtualMonetizationEventBuilder*)builder andIsSuccessful:(BOOL)isSuccessful andItemPrice:(BOOL)hasItemPrice andProductId:(NSString*)productId andQuantity:(BOOL)hasQuantity andCurrency:(NSString*)currency
{
    NSInteger quantity = 1;
    double itemPrice = 0.99;
    
    if(productId != nil){
        [builder withProductId:productId];
    }
    if(hasQuantity){
        [builder withQuantity:quantity];
    }
    if(currency != nil){
        [builder withCurrency:currency];
    }
    if(hasItemPrice){
        [builder withItemPrice:itemPrice];
    }
    
    id<AWSMobileAnalyticsEvent> monetizationEvent = [builder build];
    
    if(isSuccessful){
        assertThat(monetizationEvent, is(notNilValue()));
        assertThat([monetizationEvent eventType], is(equalTo(@"_monetization.purchase")));
        assertThat([monetizationEvent metricForKey:@"_item_price"], is(equalTo([NSNumber numberWithDouble:itemPrice])));
        assertThat([monetizationEvent metricForKey:@"_quantity"], is(equalTo([NSNumber numberWithInteger:quantity])));
        assertThat([monetizationEvent attributeForKey:@"_product_id"], is(equalTo(productId)));
        assertThat([monetizationEvent attributeForKey:@"_store"], is(equalTo(@"Virtual")));
        assertThat([monetizationEvent attributeForKey:@"_currency"], is(equalTo(currency)));
    }else{
        assertThat(monetizationEvent, is(nilValue()));
    }
}

@end
