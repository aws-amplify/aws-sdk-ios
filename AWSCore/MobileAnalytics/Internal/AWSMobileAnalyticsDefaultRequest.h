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

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsRequest.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSMobileAnalyticsSerializerFactory.h"

@interface AWSMobileAnalyticsDefaultRequest : NSObject<AWSMobileAnalyticsRequest>
{
    NSMutableDictionary *_params;
    NSMutableDictionary *_headers;
}

-(void) addParam:(NSString*)theValue forName:(NSString*)theName;

-(void) addHeader:(NSString*)theValue forName:(NSString*)theName;

-(void) removeHeader:(NSString*)theName;

-(NSString *) headerForName:(NSString*)theName;

-(NSDictionary*) params;

-(NSDictionary*) headers;

-(NSString*) postBodyString;

-(void) setPostBodyString:(NSString *)thePostBodyString;

@property (nonatomic, readwrite) NSData* postBody;

@property (nonatomic, readwrite, assign) HttpMethod method;

@property (nonatomic, readwrite) NSURL* url;

-(NSDictionary *) toDictionary;

@end
