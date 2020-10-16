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

#import "AWSMantle.h"

@interface AWSModel : AWSMTLModel <AWSMTLJSONSerializing, NSSecureCoding>

@end

@interface AWSModelUtility : NSObject

+ (NSDictionary *)mapMTLDictionaryFromJSONArrayDictionary:(NSDictionary *)JSONArrayDictionary
                                         arrayElementType:(NSString *)arrayElementType
                                           withModelClass:(Class)modelClass;
+ (NSDictionary *)JSONArrayDictionaryFromMapMTLDictionary:(NSDictionary *)mapMTLDictionary
                                         arrayElementType:(NSString *)arrayElementType;

+ (NSArray *)mapMTLArrayFromJSONArray:(NSArray *)JSONArray
                       withModelClass:(Class)modelClass;
+ (NSArray *)JSONArrayFromMapMTLArray:(NSArray *)mapMTLArray;

+ (NSDictionary *)mapMTLDictionaryFromJSONDictionary:(NSDictionary *)JSONDictionary
                                      withModelClass:(Class)modelClass;
+ (NSDictionary *)JSONDictionaryFromMapMTLDictionary:(NSDictionary *)mapMTLDictionary;

@end
