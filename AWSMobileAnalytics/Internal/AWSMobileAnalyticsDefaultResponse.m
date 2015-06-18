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

#import "AWSMobileAnalyticsDefaultResponse.h"
#import "AWSLogging.h"

@implementation AWSMobileAnalyticsDefaultResponse

-(id) init
{
    if(self = [super init])
    {
        self->_headers = [NSMutableDictionary dictionary];
        self.requestSize= 0L;
        self.responseSize = 0L;
        self.code = 0;
        self.originatingRequest = nil;
        self.message = nil;
        self.response = [NSMutableData data];
        self.didConnectionTimeout = NO;
        self.isFinishedLoading = NO;
        self.timeToComplete = 0;
        self.requiredAttempts = 0;
        self.connectionTimeout = 0;
        self.error = nil;
    }
    return self;
}

-(void) addHeader:(NSString*) theValue withName:(NSString*) theName
{
    [self->_headers setValue:theValue forKey:theName];
}

-(NSString*) getHeaderForName:(NSString*) theName
{
    return [self->_headers objectForKey:theName];
}

-(NSDictionary*) headers
{
    return [[NSDictionary alloc] initWithDictionary:self->_headers
                                          copyItems:YES];
}

-(NSString *) responseAsString
{
    if(!self.isFinishedLoading)
    {
        AWSLogWarn( @"Attempting to access the response before its finished loading");
    }
    if(self.response == nil || [self.response length] == 0)
    {
        AWSLogWarn( @"The response was nil or empty");
        return [NSString string];
    }
    return [AWSMobileAnalyticsStringUtils dataToString:self.response];
}

-(void)processConnectionTimeout
{
    if (!self.isFinishedLoading && !self.error) {
        AWSLogVerbose( @"AWSMobileAnalyticsDefaultResponse: processConnectionTimeout");
        self.didConnectionTimeout = YES;
        self.isFinishedLoading = YES;
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    self.code = (int)[httpResponse statusCode] ;
    
    AWSLogVerbose( @"AWSMobileAnalyticsDefaultResponse: connection:didReceiveResponse: %ld", (long)[httpResponse statusCode]);
    
    self->_headers = [NSMutableDictionary dictionaryWithDictionary:httpResponse.allHeaderFields];
    
    //Reset the length of the data inorder to recieve new data
    [self.response setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    AWSLogVerbose( @"AWSMobileAnalyticsDefaultResponse: connection:didReceiveData: %lu", (unsigned long)[data length]);
    //append data to the body
    [self.response appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    AWSLogVerbose( @"AWSMobileAnalyticsDefaultResponse: connectionDidFinishLoading");
    
    self.responseSize = [self.response length];
    
    self.isFinishedLoading = YES;
    
    // it may be possible for the timer that controls the connectionTimeout
    // to fire at the exact same as this method. To ensure a correct state,
    // reset the connection timeout since we truly did succeed if this method is
    // called. We do not process the connectionTimeout if this method
    // is called before the timer
    self.didConnectionTimeout = NO;
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    //Log the error
    AWSLogError( @"AWSMobileAnalyticsDefaultResponse: didFailWithError: %@", error);
    self.error = error;
    self.isFinishedLoading = YES;
}

-(BOOL)didTimeout
{
    return self.didRequestTimeout || [self didConnectionTimeout];
}

-(BOOL)didRequestTimeout
{
    return self.error ? [self.error code] == NSURLErrorTimedOut : NO;
}


-(NSString *) description
{
    id<AWSMobileAnalyticsSerializer> serializer = [AWSMobileAnalyticsSerializerFactory serializerFromFormatType:JSON];
    return [AWSMobileAnalyticsStringUtils dataToString:[serializer writeObject:self]];
}

-(NSDictionary *) toDictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setValue:[NSNumber numberWithInt:self.code] forKey:@"code"];
    
    [dictionary setValue:self.message forKey:@"mesage"];
    
    NSString *encoding = [self->_headers valueForKey:CONTENT_ENCODING_HEADER_KEY];
    if([encoding isEqualToString:CONTENT_ENCODING_GZIP])
    {
        [dictionary setValue:[self.response base64EncodedStringWithOptions:kNilOptions] forKey:@"response"];
    }
    else
    {
        [dictionary setValue:[AWSMobileAnalyticsStringUtils dataToString:self.response] forKey:@"response"];
    }
    
    [dictionary setValue:[NSNumber numberWithLong:self.requestSize] forKey:@"requestSize"];
    
    [dictionary setValue:[NSNumber numberWithLong:self.responseSize] forKey:@"responseSize"];
    
    [dictionary setValue:self->_headers forKey:@"headers"];
    
    if([self.originatingRequest respondsToSelector:@selector(toDictionary)])
    {
        [dictionary setValue:[self.originatingRequest performSelector:@selector(toDictionary)]
                      forKey:@"originatingRequest"];
    }
    else
    {
        [dictionary setValue:[self.originatingRequest description]
                      forKey:@"originatingRequest"];
    }
    return dictionary;
}

-(id) initWithDictionary: (NSDictionary *) theDictionary
{
    AWSLogError( @"Initialization from NSDictionary is not supported for AWSMobileAnalyticsDefaultResponse");
    return [self init];
}

@end
