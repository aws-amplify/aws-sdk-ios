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


@protocol AWSMobileAnalyticsRequest <NSObject>

typedef NS_ENUM(NSInteger, HttpMethod) {
    GET = 0,
    POST = 1,
    PUT = 2,
    DELETE = 3,
};

@required
-(void) addParam:(NSString*)theValue forName:(NSString*)theName;

@required
-(void) addHeader:(NSString*)theValue forName:(NSString*)theName;

@required
-(void) removeHeader:(NSString*)theName;

@required
-(NSString *) headerForName:(NSString*)theName;

@required
@property (nonatomic, readonly) NSDictionary* params;

@required
@property (nonatomic, readonly) NSDictionary* headers;

@required
@property (nonatomic, readwrite) NSString* postBodyString;

@required
@property (nonatomic, readwrite) NSData* postBody;

@required
@property (nonatomic, readwrite, assign) HttpMethod method;

@required
@property (nonatomic, readwrite) NSURL* url;

@end
