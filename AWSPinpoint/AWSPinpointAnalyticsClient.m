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

#import "AWSPinpointAnalyticsClient.h"
#import "AWSPinpointEvent.h"
#import "AWSPinpointEventRecorder.h"
#import "AWSPinpointConfiguration.h"
#import "AWSPinpointContext.h"
#import "AWSPinpointDateUtils.h"
#import "AWSPinpointSessionClient.h"

static NSString* const PURCHASE_EVENT_NAME = @"_monetization.purchase";
static NSString* const PURCHASE_EVENT_APPLE_STORE = @"Apple";
static NSString* const PURCHASE_EVENT_VIRTUAL = @"Virtual";
static NSString* const PURCHASE_EVENT_PRODUCT_ID_ATTR = @"_product_id";
static NSString* const PURCHASE_EVENT_QUANTITY_METRIC = @"_quantity";
static NSString* const PURCHASE_EVENT_ITEM_PRICE_METRIC = @"_item_price";
static NSString* const PURCHASE_EVENT_PRICE_FORMATTED_ATTR = @"_item_price_formatted";
static NSString* const PURCHASE_EVENT_CURRENCY_ATTR = @"_currency";
static NSString* const PURCHASE_EVENT_STORE_ATTR = @"_store";
static NSString* const PURCHASE_EVENT_TRANSACTION_ID_ATTR = @"_transaction_id";

NSString *const AWSPinpointAnalyticsClientErrorDomain = @"com.amazonaws.AWSPinpointAnalyticsClientErrorDomain";

@interface AWSPinpointAnalyticsClient()

@property (nonatomic, strong) NSMutableDictionary* eventTypeAttributes;
@property (nonatomic, strong) NSMutableDictionary* eventTypeMetrics;
@property (nonatomic, strong) NSMutableDictionary* globalAttributes;
@property (nonatomic, strong) NSMutableDictionary* globalMetrics;
@property (nonatomic, strong) NSDictionary* globalCampaignAttributes;
@property (nonatomic, strong) AWSPinpointEventRecorder *eventRecorder;
@property (nonatomic, strong) AWSPinpointContext *context;

@end

@interface AWSPinpointEventRecorder ()
- (instancetype)initWithContext:(AWSPinpointContext *) context;
- (AWSTask*) updateSessionStartWithCampaignAttributes:(NSDictionary*) attributes;
@end

@implementation AWSPinpointAnalyticsClient

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"You must not initialize this class directly. Access the AWSPinpointAnalyticsClient from AWSPinpoint."
                                 userInfo:nil];
}

- (nonnull AWSPinpointAnalyticsClient *)initWithContext:(nonnull AWSPinpointContext*) context {
    if (self = [super init]) {
        _context = context;
        _eventRecorder = [[AWSPinpointEventRecorder alloc] initWithContext:context];
    }
    
    return self;
}

#pragma mark - Lazy instantiate
- (NSMutableDictionary*) eventTypeAttributes {
    if (!_eventTypeAttributes) {
        _eventTypeAttributes = [NSMutableDictionary new];
    }
    return _eventTypeAttributes;
}

- (NSMutableDictionary*) eventTypeMetrics {
    if (!_eventTypeMetrics) {
        _eventTypeMetrics = [NSMutableDictionary new];
    }
    return _eventTypeMetrics;
}

- (NSMutableDictionary*) globalAttributes {
    if (!_globalAttributes) {
        _globalAttributes = [NSMutableDictionary new];
    }
    return _globalAttributes;
}

- (NSMutableDictionary*) globalMetrics {
    if (!_globalMetrics) {
        _globalMetrics = [NSMutableDictionary new];
    }
    return _globalMetrics;
}

#pragma mark - Events
- (AWSPinpointEvent *) createEventWithEventType:(NSString *) theEventType {
    if (theEventType == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil event type provided to createInternalEvent"
                                     userInfo:nil];
    } else {
        [self verifyMinimumLengthForEventType:theEventType];
    }
    
    return [[AWSPinpointEvent alloc] initWithEventType:theEventType
                                        eventTimestamp:[AWSPinpointDateUtils utcTimeMillisNow]
                                               session:self.context.sessionClient.session];
}


- (AWSPinpointEvent *)createAppleMonetizationEventWithTransaction:(SKPaymentTransaction *) transaction
                                                      withProduct:(SKProduct *) product {
    
    AWSPinpointEvent *monetizationEvent = [[AWSPinpointEvent alloc] initWithEventType:PURCHASE_EVENT_NAME
                                                                       eventTimestamp:[AWSPinpointDateUtils utcTimeMillisNow]
                                                                              session:self.context.sessionClient.session];
    
    [monetizationEvent addAttribute:product.productIdentifier forKey:PURCHASE_EVENT_PRODUCT_ID_ATTR];
    [monetizationEvent addAttribute:PURCHASE_EVENT_APPLE_STORE forKey:PURCHASE_EVENT_STORE_ATTR];
    [monetizationEvent addMetric:[NSNumber numberWithInteger:transaction.payment.quantity] forKey:PURCHASE_EVENT_QUANTITY_METRIC];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setLocale:product.priceLocale];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLenient:YES];
    
    [monetizationEvent addAttribute:[numberFormatter stringFromNumber:[NSNumber numberWithDouble:[product.price doubleValue]]] forKey:PURCHASE_EVENT_PRICE_FORMATTED_ATTR];
    [monetizationEvent addAttribute:[product.priceLocale objectForKey:NSLocaleCurrencyCode] forKey:PURCHASE_EVENT_CURRENCY_ATTR];
    [monetizationEvent addMetric:[NSNumber numberWithDouble:[product.price doubleValue]] forKey:PURCHASE_EVENT_ITEM_PRICE_METRIC];
    [monetizationEvent addAttribute:transaction.transactionIdentifier forKey:PURCHASE_EVENT_TRANSACTION_ID_ATTR];
    
    return monetizationEvent;
}

- (AWSPinpointEvent *)createVirtualMonetizationEventWithProductId:(NSString *)theProductId
                                                    withItemPrice:(double)theItemPrice
                                                     withQuantity:(NSInteger)theQuantity
                                                     withCurrency:(NSString *)theCurrency {
    AWSPinpointEvent *monetizationEvent = [[AWSPinpointEvent alloc] initWithEventType:PURCHASE_EVENT_NAME
                                                                       eventTimestamp:[AWSPinpointDateUtils utcTimeMillisNow]
                                                                              session:self.context.sessionClient.session];
    
    [monetizationEvent addAttribute:theProductId forKey:PURCHASE_EVENT_PRODUCT_ID_ATTR];
    [monetizationEvent addAttribute:PURCHASE_EVENT_VIRTUAL forKey:PURCHASE_EVENT_STORE_ATTR];
    [monetizationEvent addMetric:[NSNumber numberWithInteger:theQuantity] forKey:PURCHASE_EVENT_QUANTITY_METRIC];
    [monetizationEvent addAttribute:theCurrency forKey:PURCHASE_EVENT_CURRENCY_ATTR];
    [monetizationEvent addMetric:[NSNumber numberWithDouble:theItemPrice] forKey:PURCHASE_EVENT_ITEM_PRICE_METRIC];
    
    return monetizationEvent;
}

-(AWSTask *) submitEvents {
    return [self.eventRecorder submitAllEvents];
}

- (nonnull AWSTask*) submitEventsWithCompletionBlock:(AWSPinpointCompletionBlock) completionBlock {
    return [[self.eventRecorder submitAllEvents] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (completionBlock) {
            return completionBlock(task);
        } else {
            return task;
        }
    }];
}

-(AWSTask *) recordEvent:(AWSPinpointEvent *) theEvent {
    if (theEvent == nil) {
        AWSDDLogError(@"Nil event provided to recordEvent");
        return [AWSTask taskWithError:[NSError errorWithDomain:AWSPinpointAnalyticsClientErrorDomain code:0 userInfo:@{@"InvalidParameter":@"Nil event provided to recordEvent"}]];
    }
    
    @synchronized(self) {
        NSDictionary* eventAttrs = [self.eventTypeAttributes objectForKey:[theEvent eventType]];
        // Apply Event-Type Attributes
        if (eventAttrs) {
            for (NSString *key in [eventAttrs allKeys]) {
                [theEvent addAttribute:[eventAttrs objectForKey:key] forKey:key];
            }
        }
        
        // Apply Global Attributes
        for (NSString *key in [self.globalAttributes allKeys]) {
            [theEvent addAttribute:[self.globalAttributes objectForKey:key] forKey:key];
        }
        
        NSDictionary* eventMets = [self.eventTypeMetrics objectForKey:[theEvent eventType]];
        // Apply Event-Type Metrics
        if (eventMets) {
            for (NSString *key in [eventMets allKeys]) {
                [theEvent addMetric:[eventMets objectForKey:key] forKey:key];
            }
        }
        // Apply Global Metrics
        for (NSString *key in [self.globalMetrics allKeys]) {
            [theEvent addMetric:[self.globalMetrics objectForKey:key] forKey:key];
        }
        
        //Apply Campaign Attributes
        for (NSString *key in [self.globalCampaignAttributes allKeys]) {
            [theEvent addAttribute:[self.globalCampaignAttributes objectForKey:key] forKey:key];
        }
    }
    
    return [self.eventRecorder saveEvent:theEvent];
}

- (void) verifyMinimumLengthForKey:(NSString*) key {
    if (key.length < 1) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Attributes and Metrics must have a key of length 1 and 50"
                                     userInfo:nil];
    }
}

- (void) verifyMinimumLengthForEventType:(NSString*) eventType {
    if (eventType.length < 1) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Event types must be at least 1 character in length."
                                     userInfo:nil];
    }
}

#pragma mark - Attributes -
-(void) addGlobalAttribute:(NSString*) theValue
                    forKey:(NSString*) theKey {
    if (theValue == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil value provided to addGlobalAttribute"
                                     userInfo:nil];
    }
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil key provided to addGlobalAttribute"
                                     userInfo:nil];
    } else {
        [self verifyMinimumLengthForKey:theKey];
    }
    
    @synchronized(self) {
        [self.globalAttributes setValue:theValue forKey:theKey];
    }
}

-(void) addGlobalAttribute:(NSString*) theValue
                    forKey:(NSString*) theKey
              forEventType:(NSString*) theEventType {
    if (theEventType == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil event type passed into addGlobalAttribute"
                                     userInfo:nil];
    }
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil key passed into addGlobalAttribute"
                                     userInfo:nil];
    } else {
        [self verifyMinimumLengthForKey:theKey];
    }
    
    if (theValue == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil value passed into addGlobalAttribute"
                                     userInfo:nil];
    }
    
    @synchronized(self) {
        if (![self.eventTypeAttributes objectForKey:theEventType]) {
            [self.eventTypeAttributes setValue:[NSMutableDictionary dictionary] forKey:theEventType];
        }
        [[self.eventTypeAttributes objectForKey:theEventType] setValue:theValue forKey:theKey];
    }
}

-(void) addGlobalMetric:(NSNumber*) theValue
                 forKey:(NSString*) theKey {
    if (theValue == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil value provided to addGlobalMetric"
                                     userInfo:nil];
    }
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil key provided to addGlobalMetric"
                                     userInfo:nil];
    } else {
        [self verifyMinimumLengthForKey:theKey];
    }
    
    @synchronized(self) {
        [self.globalMetrics setValue:theValue forKey:theKey];
    }
}

-(void) addGlobalMetric:(NSNumber*) theValue
                 forKey:(NSString*) theKey
           forEventType:(NSString*) theEventType {
    if (theEventType == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil event type passed into addGlobalMetric"
                                     userInfo:nil];
    }
    if (theValue == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil value passed into addGlobalMetric"
                                     userInfo:nil];
    }
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil key passed into addGlobalMetric"
                                     userInfo:nil];
    } else {
        [self verifyMinimumLengthForKey:theKey];
    }
    
    
    @synchronized(self) {
        if (![self.eventTypeMetrics objectForKey:theEventType]){
            [self.eventTypeMetrics setValue:[NSMutableDictionary dictionary] forKey:theEventType];
        }
        [[self.eventTypeMetrics objectForKey:theEventType] setValue:theValue forKey:theKey];
    }
}

-(void) removeGlobalAttributeForKey:(NSString*) theKey {
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil key provided to removeGlobalAttributeForKey"
                                     userInfo:nil];
    }
    
    @synchronized(self) {
        [self.globalAttributes removeObjectForKey:theKey];
    }
}

-(void) removeGlobalAttributeForKey:(NSString*) theKey
                       forEventType:(NSString*) theEventType {
    if (theEventType == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil event type passed into removeGlobalAttributeForKey"
                                     userInfo:nil];
    }
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil key passed into removeGlobalAttribute"
                                     userInfo:nil];
    }
    
    @synchronized(self) {
        if ([self.eventTypeAttributes objectForKey:theEventType]) {
            [[self.eventTypeAttributes objectForKey:theEventType] removeObjectForKey:theKey];
        }
    }
}

-(void) removeGlobalMetricForKey:(NSString*) theKey {
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil key provided to removeGlobalMetric"
                                     userInfo:nil];
    }
    
    @synchronized(self) {
        [self.globalMetrics removeObjectForKey:theKey];
    }
}

-(void) removeGlobalMetricForKey:(NSString*) theKey
                    forEventType:(NSString*) theEventType {
    if (theEventType == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil event type passed into removeGlobalMetric"
                                     userInfo:nil];
        return;
    }
    if (theKey == nil) {
        @throw [NSException exceptionWithName:AWSPinpointAnalyticsClientErrorDomain
                                       reason:@"Nil key passed into removeGlobalMetric"
                                     userInfo:nil];
    }
    
    @synchronized(self) {
        if ([self.eventTypeMetrics objectForKey:theEventType]) {
            [[self.eventTypeMetrics objectForKey:theEventType] removeObjectForKey:theKey];
        }
    }
}

- (void) setCampaignAttributes:(NSDictionary*) campaign {
    _globalCampaignAttributes = campaign;
    [self.eventRecorder updateSessionStartWithCampaignAttributes:campaign];
}

- (void) removeAllGlobalCampaignAttributes {
    for (NSString *key in self.globalCampaignAttributes) {
        [self removeGlobalAttributeForKey:key];
    }
    _globalCampaignAttributes = nil;
}

@end
