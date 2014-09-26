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

#import <Foundation/Foundation.h>
#import "AWSMobileAnalyticsResponse.h"
#import "../util/AWSMobileAnalyticsStringUtils.h"
#import "../AWSMobileAnalyticsSerializerFactory.h"
#import "AWSMobileAnalyticsHttpConstants.h"

@interface AWSMobileAnalyticsDefaultResponse : NSObject<AWSMobileAnalyticsResponse>
{
    NSMutableDictionary *_headers;
}

-(void) addHeader:(NSString*) theValue withName:(NSString*) theName;

-(NSString*) getHeaderForName:(NSString*) theName;

-(NSDictionary*) headers;

-(NSString *) responseAsString;

@property (nonatomic, readwrite) id<AWSMobileAnalyticsRequest> originatingRequest;

@property (nonatomic, readwrite, assign) long requestSize;

@property (nonatomic, readwrite, assign) long responseSize;

@property (nonatomic, readwrite, assign) int code;

@property (nonatomic, readwrite) NSString* message;

@property (nonatomic, readwrite) NSMutableData* response;

@property (nonatomic, readwrite, assign) BOOL isFinishedLoading;

-(BOOL) didTimeout;

@property (nonatomic, readwrite, assign) BOOL didConnectionTimeout;

@property (nonatomic, readwrite, assign) NSTimeInterval timeToComplete;

@property (nonatomic, readwrite, assign) int requiredAttempts;

@property (nonatomic, readwrite, assign) NSTimeInterval connectionTimeout;

@property (nonatomic, readwrite) NSError *error;

-(NSDictionary *) toDictionary;

-(id) initWithDictionary: (NSDictionary *) theDictionary;

-(void)processConnectionTimeout;

@end
