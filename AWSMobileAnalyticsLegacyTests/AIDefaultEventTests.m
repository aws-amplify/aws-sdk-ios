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

#import "AIDefaultEventTests.h"
#import "AIInsightsContextBuilder.h"
#import "AWSMobileAnalyticsSerializerFactory.h"
#import "AWSMockFileManager.h"

@interface AIDefaultEventTests()

@property (nonatomic, readwrite) AWSMobileAnalyticsDefaultEvent *target;
@property (nonatomic, readwrite) id<AWSMobileAnalyticsContext> mockContext;

@end

@implementation AIDefaultEventTests

-(void)setUp
{
     
    
    AIInsightsContextBuilder* builder = [AIInsightsContextBuilder builder];
    [builder withAppKey:@"appKey"];
    [builder withSdkName:@"AmazonInsights" andSDKVersion:@"2.0"];
    [builder withUniqueId:@"BEEF"];
    [builder withPlatformVersion:@"7.1" withPlatform:@"iOS Mega" withManufacturer:@"mama apple" withModel:@"super iPhone" withLocale:@"en_US"];
    [builder withApplicationVersion:@"1.2.3" withBuild:@"9876" withPackageName:@"com.amazon.beefapp"];

    
    self.mockContext = [builder build];
    self.target = [AWSMobileAnalyticsDefaultEvent defaultEventWithInsightsContext:self.mockContext
                                               withEventTimestamp:1000l withEventType:@"event_type"];
    
    assertThat(self.target.eventType, is(@"event_type"));
    assertThatLongLong(self.target.eventTimestamp, is(@1000l));
    assertThatInteger(self.target.allAttributes.count, is(@0));
    assertThatInteger(self.target.allMetrics.count, is(@0));
}

-(void)tearDown
{
}

-(void)test_createEvent_andVerifyTimestamp
{
    UTCTimeMillis TIME_STAMP = 1370111901909l;
    NSString* ISO_DATE_TIME_STAMP = @"2013-06-01T18:38:21.909Z";
    
    self.target = [AWSMobileAnalyticsDefaultEvent defaultEventWithInsightsContext:self.mockContext
                                               withEventTimestamp:TIME_STAMP
                                                    withEventType:@"event_type"];
    
    NSDictionary* serializedEvent = [self.target toDictionary];
    assertThat([serializedEvent objectForKey:@"timestamp"], is(equalTo(ISO_DATE_TIME_STAMP)));
    
    
    assertThatUnsignedLongLong(self.target.eventTimestamp, is(equalToUnsignedLongLong(TIME_STAMP)));
    
}

-(void)test_addAttribute_then_retrieve
{
    [self.target addAttribute:@"otherthing" forKey:@"something"];
    
    assertThatBool([self.target hasAttributeForKey:@"something"], is(equalToBool(YES)));
    assertThatInteger(self.target.allAttributes.count, is(@1));
    assertThat([self.target attributeForKey:@"something"], is(@"otherthing"));
}

-(void)test_addAttribute_override_then_retrieve
{
    [self.target addAttribute:@"1" forKey:@"something"];
    [self.target addAttribute:@"2" forKey:@"something"];
    
    assertThatBool([self.target hasAttributeForKey:@"something"], is(equalToBool(YES)));
    assertThatInteger(self.target.allAttributes.count, is(@1));
    assertThat([self.target attributeForKey:@"something"], is(@"2"));
}

-(void)test_hasAttribute
{
    [self.target addAttribute:@"1" forKey:@"a1"];
    [self.target addAttribute:@"2" forKey:@"a2"];
    [self.target addAttribute:@"3" forKey:@"a3"];
    
    assertThatInteger(self.target.allAttributes.count, is(@3));
    assertThatBool([self.target hasAttributeForKey:@"a1"], is(equalToBool(YES)));
    assertThatBool([self.target hasAttributeForKey:@"a2"], is(equalToBool(YES)));
    assertThatBool([self.target hasAttributeForKey:@"a3"], is(equalToBool(YES)));
}

-(void)test_addMetric_then_retrieve
{
    [self.target addMetric:@100 forKey:@"something"];
    
    assertThatBool([self.target hasMetricForKey:@"something"], is(equalToBool(YES)));
    assertThatInteger(self.target.allMetrics.count, is(@1));
    assertThat([self.target metricForKey:@"something"], is(@100));
}

-(void)test_addMetric_override_then_retrieve
{
    [self.target addMetric:@100 forKey:@"something"];
    [self.target addMetric:@200 forKey:@"something"];
    
    assertThatBool([self.target hasMetricForKey:@"something"], is(equalToBool(YES)));
    assertThatInteger(self.target.allMetrics.count, is(@1));
    assertThat([self.target metricForKey:@"something"], is(@200));
}

-(void)test_hasMetric
{
    [self.target addMetric:@1 forKey:@"a1"];
    [self.target addMetric:@2 forKey:@"a2"];
    [self.target addMetric:@3 forKey:@"a3"];
    
    assertThatInteger(self.target.allMetrics.count, is(@3));
    assertThatBool([self.target hasMetricForKey:@"a1"], is(equalToBool(YES)));
    assertThatBool([self.target hasMetricForKey:@"a2"], is(equalToBool(YES)));
    assertThatBool([self.target hasMetricForKey:@"a3"], is(equalToBool(YES)));
}

-(void)test_copyevent_initializer
{    
    [self.target addAttribute:@"attr" forKey:@"key"];
    [self.target addMetric:@1 forKey:@"key"];
    
    AWSMobileAnalyticsDefaultEvent* copiedEvent = [AWSMobileAnalyticsDefaultEvent defaultEventFromEvent:self.target
                                                    withInsightsContext:self.mockContext
                                                     withEventTimestamp:2000l];
    
    assertThat(copiedEvent.eventType, is(@"event_type"));
    assertThatInteger(copiedEvent.allAttributes.count, is(@1));
    assertThatInteger(copiedEvent.allMetrics.count, is(@1));
    assertThatUnsignedLongLong(copiedEvent.eventTimestamp, is(equalToUnsignedLongLong(2000l)));
}

//-(void)test_event_description_is_valid_json
//{
//    NSString* expectedJson = @"{\"sdk_name\":\"AmazonInsights\",\"sdk_version\":\"2.0\",\"application_key\":\"appKey\",\"metrics\":{\"metr1\":1},\"timestamp\":\"1970-01-01T00:00:01.000Z\",\"event_type\":\"event_type\",\"attributes\":{\"attr1\":\"val1\"},\"platform\":\"iOS\"}";
//    
//    id<AISerializer> deserializer = [AWSMobileAnalyticsAISerializerFactory serializerFromFormatType:JSON];
//    NSDictionary *expectedDictionary = [deserializer readObject:[expectedJson dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [self.target addAttribute:@"val1" forKey:@"attr1"];
//    [self.target addMetric:@1 forKey:@"metr1"];
//    
//    NSString* json = [self.target description];
//    NSDictionary *actualDictionary = [deserializer readObject:[json dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    assertThat(json, is(notNilValue()));
//    assertThatBool([json length], is(equalToBool(YES)));
//    assertThatBool([actualDictionary isEqualToDictionary:expectedDictionary], is(equalToBool(YES)));
//}

-(void)test_toDictionary
{
    [self.target addAttribute:@"val1" forKey:@"attr1"];
    [self.target addMetric:@1 forKey:@"metr1"];
    
    NSDictionary* serializedEvent = [self.target toDictionary];
    assertThat([serializedEvent objectForKey:@"application_key"],   is(nilValue()));
    assertThat([serializedEvent objectForKey:@"event_type"],        is(equalTo(@"event_type")));
    assertThat([serializedEvent objectForKey:@"sdk_version"],       is(nilValue()));
    assertThat([serializedEvent objectForKey:@"sdk_name"],          is(nilValue()));
    assertThat([serializedEvent objectForKey:@"platform"],          is(nilValue()));
    assertThat([serializedEvent objectForKey:@"platform_version"],  is(nilValue()));
    assertThat([serializedEvent objectForKey:@"make"],              is(nilValue()));
    assertThat([serializedEvent objectForKey:@"model"],             is(nilValue()));
    assertThat([serializedEvent objectForKey:@"locale"],            is(nilValue()));
    assertThat([serializedEvent objectForKey:@"app_version_code"],  is(nilValue()));
    assertThat([serializedEvent objectForKey:@"app_version_name"],  is(nilValue()));
    assertThat([serializedEvent objectForKey:@"app_package_name"],  is(nilValue()));
    assertThat([serializedEvent objectForKey:@"unique_id"],         is(nilValue()));
    assertThat([serializedEvent objectForKey:@"timestamp"],         is(equalTo(@"1970-01-01T00:00:01.000Z")));

    NSDictionary* attrs = [serializedEvent objectForKey:@"attributes"];
    assertThat(attrs, is(notNilValue()));
    assertThat([attrs objectForKey:@"attr1"],   is(equalTo(@"val1")));
    
    NSDictionary* metrics = [serializedEvent objectForKey:@"metrics"];
    assertThat(metrics, is(notNilValue()));
    assertThat([metrics objectForKey:@"metr1"],   is(equalTo(@1)));
}

@end
