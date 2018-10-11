//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSGZIPEncodingJSONRequestSerializer.h"

@interface AWSGZIPEncodingJSONRequestSerializer()

@property BOOL shouldGZIPEncodeRequest;

@end

@implementation AWSGZIPEncodingJSONRequestSerializer

+ (NSSet<NSString *>*)GZIPEncodedOperationNames {
    static NSSet<NSString *>* _operationNames;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _operationNames = [NSSet setWithArray:@[@"PutRecord", @"PutRecords", @"PutRecordBatch"]];
    });
    return _operationNames;
}

- (instancetype)initWithJSONDefinition:(NSDictionary *)JSONDefinition
                            actionName:(NSString *)actionName {
    if (self = [super initWithJSONDefinition:JSONDefinition actionName:actionName]) {
        _shouldGZIPEncodeRequest = [[AWSGZIPEncodingJSONRequestSerializer GZIPEncodedOperationNames] containsObject:actionName];
    }
    return self;
}

- (AWSTask *)serializeRequest:(NSMutableURLRequest *)request
                      headers:(NSDictionary *)headers
                   parameters:(NSDictionary *)parameters {
    // Don't overwrite existing Content-Encoding, if any
    NSMutableDictionary *modifiedHeaders = [headers mutableCopy];
    if (self.shouldGZIPEncodeRequest && ![headers valueForKey:@"Content-Encoding"]) {
        [modifiedHeaders setValue:@"gzip" forKey:@"Content-Encoding"];
    }
    return [super serializeRequest:request headers:modifiedHeaders parameters:parameters];
}

@end
