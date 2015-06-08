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

@protocol AWSMobileAnalyticsResponse <NSObject>

@required
@property (nonatomic, readwrite) id<AWSMobileAnalyticsRequest> originatingRequest;

@required
@property (nonatomic, readwrite, assign) long requestSize;

@required
@property (nonatomic, readwrite, assign) long responseSize;

@required
@property (nonatomic, readonly) NSDictionary* headers;

@required
-(void) addHeader:(NSString*) theValue withName:(NSString*) theName;

@required
-(NSString*) getHeaderForName:(NSString*) theName;

@required
@property (nonatomic, readwrite, assign) int code;

@required
@property (nonatomic, readwrite) NSString* message;

@required
@property (nonatomic, readonly) NSData* response;

@required
@property (nonatomic, readonly) NSError *error;

@required
@property (nonatomic, readonly) NSTimeInterval timeToComplete;

@required
@property (nonatomic, readonly) int requiredAttempts;

@required
@property (nonatomic, readonly) NSTimeInterval connectionTimeout;

@required
@property (nonatomic, readonly) BOOL didTimeout;
@end
