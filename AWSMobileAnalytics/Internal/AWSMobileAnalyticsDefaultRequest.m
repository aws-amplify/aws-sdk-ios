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

#import "AWSMobileAnalyticsDefaultRequest.h"
#import "AWSLogging.h"

@implementation AWSMobileAnalyticsDefaultRequest

-(id) init
{
    if(self = [super init])
    {
        self->_params = [NSMutableDictionary dictionary];
        self->_headers = [NSMutableDictionary dictionary];
        self.url = nil;
        self.postBody = nil;
        self.method = GET;
    }
    return self;
}

-(void) addParam:(NSString*)theValue forName:(NSString*)theName
{
    [self->_params setValue:theValue forKey:theName];
}

-(void) addHeader:(NSString*)theValue forName:(NSString*)theName
{
    [self->_headers setValue:theValue forKey:theName];
}

-(void) removeHeader:(NSString*)theName
{
    [self->_headers removeObjectForKey:theName];
}

-(NSString *) headerForName:(NSString*)theName
{
    return [self->_headers valueForKey:theName];
}

-(NSDictionary *) params
{
    return [[NSDictionary alloc] initWithDictionary:self->_params
                                          copyItems:YES];
}

-(NSDictionary *) headers
{
    return [[NSDictionary alloc] initWithDictionary:self->_headers
                                          copyItems:YES];
}

-(NSString *) postBodyString
{
    return [[NSString alloc] initWithData:self.postBody
                                 encoding:NSUTF8StringEncoding];
}

-(void) setPostBodyString:(NSString*) thePostBodyString
{
    self.postBody = [thePostBodyString dataUsingEncoding:NSUTF8StringEncoding];
}

-(NSString *) description
{
    id<AWSMobileAnalyticsSerializer> serializer = [AWSMobileAnalyticsSerializerFactory serializerFromFormatType:JSON];
    return [AWSMobileAnalyticsStringUtils dataToString:[serializer writeObject:self]];
}

-(NSDictionary *) toDictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setValue:[self.url description] forKey:@"url"];
    if(self.method == GET)
    {
        [dictionary setValue:@"GET" forKey:@"method"];
    }
    else if(self.method == POST)
    {
        [dictionary setValue:@"POST" forKey:@"method"];
    }
    if(self.method == POST)
    {
        [dictionary setValue:self.postBodyString forKey:@"postBody"];
    }
    [dictionary setValue:self->_headers forKey:@"headers"];
    [dictionary setValue:self->_params forKey:@"params"];
    
    return dictionary;
}

-(id) initWithDictionary: (NSDictionary *) theDictionary
{
    AWSLogError( @"Initialization from NSDictionary is not supported for AWSMobileAnalyticsDefaultRequest");
    return [self init];
}

@end
