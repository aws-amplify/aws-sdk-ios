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

#import "AIERSRequestBuilderTests.h"

static NSString *const SDK_NAME = @"AppIntelligenceSDK";
static NSString *const SDK_VERSION = @"test";
static NSString *const APP_KEY = @"app_key";
static NSString *const PRIVATE_KEY = @"private_key";
static NSString *const UNIQUE_ID = @"abc123";

@implementation AIERSRequestBuilderTests

-(void) setUp
{
    self->_configuration = [AITestConfiguration configurationWithDictionary:[NSDictionary dictionary]];
       
    self->_target = [AWSMobileAnalyticsERSRequestBuilder builderWithConfiguration:self->_configuration
                                                   withHttpClient:[AWSMobileAnalyticsDefaultHttpClient httpClient]
                                               withApplicationKey:APP_KEY
                                                     withUniqueId:UNIQUE_ID];
}

-(void) tearDown
{
    
}

-(void) test_createHttpRequest_correctEndpointBasedOnAppKey
{
    id<AWSMobileAnalyticsRequest> request = [self->_target buildWithObjects:[NSArray array]];
    assertThat([[request url] absoluteString], is(equalTo([NSString stringWithFormat:@"http://mobileanalytics.amazonaws.com/2014-06-05/events"])));
}

-(void) test_createHttpRequest_correctEndpointBasedOnConfig
{
    [self->_configuration setObject:@"https://test.com/9.0" forKey:AWSKeyEventRecorderHost];
    
    id<AWSMobileAnalyticsRequest> request = [self->_target buildWithObjects:[NSArray array]];
    assertThat([[request url] absoluteString], is(equalTo([NSString stringWithFormat:@"https://test.com/9.0/events"])));
}

-(void) test_createHttpRequest_correctZippedPostBody
{
    NSDictionary *obj = [NSDictionary dictionaryWithObjectsAndKeys:@1, @"value1", @"2", @"value2", [NSNumber numberWithBool:NO], @"value3", nil];
    NSString *jsonString = [[NSString alloc] initWithData:[[AWSMobileAnalyticsSerializerFactory serializerFromFormatType:JSON] writeObject:obj] encoding:NSUTF8StringEncoding]; 
    
    NSArray *array = [NSArray arrayWithObjects:jsonString, jsonString, jsonString, nil];

    id<AWSMobileAnalyticsRequest> request = [self->_target buildWithObjects:array];
    
    NSArray *deSerArray = [AIERSRequestBuilderTests decompressData:request.postBody];
    assertThat(deSerArray, is(notNilValue()));
    
    assertThatInteger([deSerArray count], is(equalToInt(3)));
    
    for(int i=0;i<2;i++)
    {
        NSDictionary *deSerObj = [deSerArray objectAtIndex:i];
        assertThat(deSerArray, is(notNilValue()));
        assertThat([deSerObj objectForKey:@"value1"], is(equalTo([obj objectForKey:@"value1"])));
        assertThat([deSerObj objectForKey:@"value2"], is(equalTo([obj objectForKey:@"value2"])));
        assertThat([deSerObj objectForKey:@"value3"], is(equalTo([obj objectForKey:@"value3"])));
    }
}

+(NSArray*) decompressData:(NSData *)theCompressedData
{
    NSData *data = [theCompressedData gunzippedData];
    id<AWSMobileAnalyticsSerializer> deserializer = [AWSMobileAnalyticsSerializerFactory serializerFromFormatType:JSON];
    return [deserializer readArray:data];
}

@end
