//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AWSNetworkingHelpers : NSObject

/**
 Returns an array of NSURLQueryItems constructed from the request parameters. The query items in the array are not
 URL encoded.

 Supported value types of the dictionary are String or Array. Any other type of value will throw an
 NSInternalInconsistencyException. If the value is an array, each value will be added to the resulting array using the
 key, for example: `{"key1", ["value1", "value2"]}` would result in an array `[("key1", "value1"), ("key1", "value2")]`.

 @param requestParameters an NSDictionary<NSString *, (NSString * | NSArray<NSString *>)>
 @return an array of NSURLQueryItems
 */
+ (NSArray<NSURLQueryItem *> * _Nonnull)queryItemsFromDictionary:(NSDictionary<NSString *, id> * _Nonnull)requestParameters;

@end

NS_ASSUME_NONNULL_END
