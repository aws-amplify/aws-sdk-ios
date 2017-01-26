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

#import "AWSEC2Serializer.h"

@interface NSMutableURLRequest (AWSRequestSerializer)

- (void)aws_validateHTTPMethodAndBody;

@end

@implementation NSMutableURLRequest (AWSRequestSerializer)

- (void)aws_validateHTTPMethodAndBody {
    // GET and DELETE requests should not have a body or body stream.
    if ([self.HTTPMethod isEqualToString:@"GET"]
        || [self.HTTPMethod isEqualToString:@"DELETE"]) {
        if (self.HTTPBody) {
            self.HTTPBody = nil;
        }
        if (self.HTTPBodyStream) {
            self.HTTPBodyStream = nil;
        }
    }
}

@end

@interface AWSQueryStringRequestSerializer()

@property (nonatomic, strong) NSDictionary *serviceDefinitionJSON;
@property (nonatomic, strong) NSString *actionName;

- (void)processParameters:(NSDictionary *)parameters queryString:(NSMutableString *)queryString;

@end

@implementation AWSEC2RequestSerializer

//overwrite serializeRequest method for EC2
- (AWSTask *)serializeRequest:(NSMutableURLRequest *)request
                      headers:(NSDictionary *)headers
                   parameters:(NSDictionary *)parameters {
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    
    parameters = [parameters mutableCopy];
    [self.additionalParameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [parameters setValue:obj forKey:key];
    }];
    
    //Need to add version and actionName
    NSError *error = nil;
    NSDictionary *formattedParams = [AWSEC2ParamBuilder buildFormattedParams:parameters
                                                                  actionName:self.actionName
                                                       serviceDefinitionRule:self.serviceDefinitionJSON error:&error];
    if (error) {
        return [AWSTask taskWithError:error];
    }
    
    NSMutableString *queryString = [NSMutableString new];
    [self processParameters:formattedParams queryString:queryString];
    
    if ([queryString length] > 0) {
        request.HTTPBody = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    //contruct additional headers
    if (headers) {
        //generate HTTP header here
        for (NSString *key in headers.allKeys) {
            [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    if (!request.allHTTPHeaderFields[@"Content-Type"]) {
        [request addValue:@"application/x-www-form-urlencoded; charset=utf-8"
       forHTTPHeaderField:@"Content-Type"];
    }
    
    [request aws_validateHTTPMethodAndBody];
    
    return [AWSTask taskWithResult:nil];
}

@end
