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

#import "AWSMobileAnalyticsERSRequestBuilder.h"
#import "AWSMobileAnalyticsConstants.h"
#import "AWSMobileAnalyticsConfigurationKeys.h"
#import "GZIP.h"
#import "AWSMobileAnalyticsSerializable.h"
#import "AWSMobileAnalyticsSerializerFactory.h"

static NSString* const ENDPOINT_PATH = @"%@/events";

static NSString* const CONTENT_ENCODING_KEY = @"Content-Encoding";

/**************Request Factory****************/

@interface AWSMobileAnalyticsERSRequestBuilder()
@property(nonatomic)id<AWSMobileAnalyticsConfiguring> configuration;
@property(nonatomic)id<AWSMobileAnalyticsHttpClient> httpClient;
@property(nonatomic)NSString* applicationKey;
@property(nonatomic)NSString* uniqueId;
@end

@implementation AWSMobileAnalyticsERSRequestBuilder

+(AWSMobileAnalyticsERSRequestBuilder *)builderWithConfiguration:(id<AWSMobileAnalyticsConfiguring>)configuration
                                  withHttpClient:(id<AWSMobileAnalyticsHttpClient>)httpClient
                              withApplicationKey:(NSString*)applicationKey
                                    withUniqueId:(NSString*)uniqueId
{
    return [[AWSMobileAnalyticsERSRequestBuilder alloc] initWithConfiguration:configuration
                                               withHttpClient:httpClient
                                           withApplicationKey:applicationKey
                                                 withUniqueId:uniqueId];
}


- (id)initWithConfiguration:(id<AWSMobileAnalyticsConfiguring>)configuration
             withHttpClient:(id<AWSMobileAnalyticsHttpClient>)httpClient
         withApplicationKey:(NSString *)applicationKey
               withUniqueId:(NSString*)uniqueId
{
    if (self = [super init])
    {
        self.configuration = configuration;
        self.httpClient = httpClient;
        self.applicationKey = applicationKey;
        self.uniqueId = uniqueId;
    }
    return self;
}


- (id<AWSMobileAnalyticsRequest>)buildWithObjects:(NSArray *)theObjects
{
    NSString* endpoint = [self.configuration stringForKey:AWSKeyEventRecorderHost withOptValue:AWSValueEventRecorderHost];
    NSString* appEndpoint = [NSString stringWithFormat:ENDPOINT_PATH, endpoint];
    
    id<AWSMobileAnalyticsRequest> request = [self.httpClient freshRequest];
    [request setUrl:[NSURL URLWithString:appEndpoint]];
    
    [request setMethod:POST];
    
    NSData* jsonData = [self createBodyFromObjects:theObjects];

    // compress the string and set the compressed header
    NSData* compressedBody = [jsonData gzippedData];
    [request setPostBody:compressedBody];
    [request addHeader:@"gzip" forName:CONTENT_ENCODING_KEY];
    
    return request;
}

- (NSData *)createBodyFromObjects:(NSArray *)theObjects
{
    // use the array of strings to build an array of JSON
    NSMutableString* jsonArray = [[NSMutableString alloc] init];
    [jsonArray appendString:@"["];
    
    for(int i =0; i < [theObjects count]; i++)
    {
        if(i)
        {
            // append the comma before items to make list generation easier
            [jsonArray appendString:@","];
        }
        [jsonArray appendString:[theObjects objectAtIndex:i]];
    }
    
    [jsonArray appendString:@"]"];
    
    return [jsonArray dataUsingEncoding:NSUTF8StringEncoding];
}


@end







