//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSNetworkingHelpers.h"

@implementation AWSNetworkingHelpers

+ (NSArray<NSURLQueryItem *> *)queryItemsFromDictionary:(NSDictionary<NSString *, id> *)requestParameters {
    NSMutableArray<NSURLQueryItem *> *queryItems = [[NSMutableArray alloc] init];

    for (NSString *key in requestParameters) {
        if ([requestParameters[key] isKindOfClass:[NSArray class]]) {
            NSArray<NSString *> *parameterValues = requestParameters[key];
            for (NSString *paramValue in parameterValues) {
                NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:key value:paramValue];
                [queryItems addObject:queryItem];
            }
        } else if ([requestParameters[key] isKindOfClass:[NSString class]]) {
            NSString *value = requestParameters[key];
            NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:key value:value];
            [queryItems addObject:queryItem];
        } else {
            // Only @[NSString: NSString] and @[NSString: NSArray<NSString>] supported currently
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"Invalid requestParameters dictionary. Supported Dictionaries include [NSString: NSString] and [NSString: NSArray<NSString>]"
                                         userInfo:nil];
        }
    }

    return queryItems;
}

@end
