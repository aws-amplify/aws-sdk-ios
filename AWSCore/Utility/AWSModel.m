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

#import "AWSModel.h"

@implementation AWSModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

- (NSDictionary *)dictionaryValue {
    NSDictionary *dictionaryValue = [super dictionaryValue];
    NSMutableDictionary *mutableDictionaryValue = [dictionaryValue mutableCopy];

    [dictionaryValue enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([self valueForKey:key] == nil) {
            [mutableDictionaryValue removeObjectForKey:key];
        }
    }];

    return mutableDictionaryValue;
}

@end

@implementation AWSModelUtility

+ (NSDictionary *)mapMTLDictionaryFromJSONArrayDictionary:(NSDictionary *)JSONArrayDictionary arrayElementType:(NSString *)arrayElementType withModelClass:(Class) modelClass {

    NSMutableDictionary *mutableDictionary = [NSMutableDictionary new];
    for (NSString *key in [JSONArrayDictionary allKeys]) {
        if ([arrayElementType isEqualToString:@"map"]) {
            [mutableDictionary setObject:[AWSModelUtility mapMTLArrayFromJSONArray:JSONArrayDictionary[key] withModelClass:modelClass] forKey:key];
        } else if  ([arrayElementType isEqualToString:@"structure"]) {
            NSValueTransformer *valueFransformer =  [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[modelClass class]];
            [mutableDictionary setObject:[valueFransformer transformedValue:JSONArrayDictionary[key]] forKey:key];
        }
    }
    return mutableDictionary;
}

+ (NSDictionary *)JSONArrayDictionaryFromMapMTLDictionary:(NSDictionary *)mapMTLDictionary arrayElementType:(NSString *)arrayElementType{
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary new];
    for (NSString *key in [mapMTLDictionary allKeys]) {
        if ([arrayElementType isEqualToString:@"map"]) {
            [mutableDictionary setObject:[AWSModelUtility JSONArrayFromMapMTLArray:mapMTLDictionary[key]] forKey:key];
        } else if ([arrayElementType isEqualToString:@"structure"]) {
            NSValueTransformer *valueFransformer = [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSModel class]];
            [mutableDictionary setObject:[valueFransformer reverseTransformedValue:mapMTLDictionary[key]] forKey:key];
        }
    }
    return mutableDictionary;
}

//Forward transformation For Array of Map Type
+ (NSArray *)mapMTLArrayFromJSONArray:(NSArray *)JSONArray withModelClass:(Class)modelClass {
    NSMutableArray *mutableArray = [NSMutableArray new];
    for (NSDictionary *aDic in JSONArray) {
        NSDictionary *tmpDic = [AWSModelUtility mapMTLDictionaryFromJSONDictionary:aDic withModelClass:[modelClass class]];
        [mutableArray addObject:tmpDic];
    };
    return mutableArray;
}

//Reverse transform for Array of Map Type
+ (NSArray *)JSONArrayFromMapMTLArray:(NSArray *)mapMTLArray {
    NSMutableArray *mutableArray = [NSMutableArray new];
    for (NSDictionary *aDic in mapMTLArray) {
        NSDictionary *tmpDic = [AWSModelUtility JSONDictionaryFromMapMTLDictionary:aDic];
        [mutableArray addObject:tmpDic];
    };
    return mutableArray;
}

//Forward transformation for JSONDefinition Map Type
+ (NSDictionary *)mapMTLDictionaryFromJSONDictionary:(NSDictionary *)JSONDictionary withModelClass:(Class)modelClass {

    NSMutableDictionary *mutableDictionary = [NSMutableDictionary new];
    for (NSString *key in [JSONDictionary allKeys]) {
        [mutableDictionary setObject:[AWSMTLJSONAdapter modelOfClass:modelClass fromJSONDictionary:JSONDictionary[key] error:nil] forKey:key];
    }
    return mutableDictionary;
}

//Reverse transfrom for JSONDefinition Map Type
+ (NSDictionary *)JSONDictionaryFromMapMTLDictionary:(NSDictionary *)mapMTLDictionary {

    NSMutableDictionary *mutableDictionary = [NSMutableDictionary new];
    for (NSString *key in [mapMTLDictionary allKeys]) {
        [mutableDictionary setObject:[AWSMTLJSONAdapter JSONDictionaryFromModel:[mapMTLDictionary objectForKey:key]]
                              forKey:key];
    }
    return mutableDictionary;
}

@end
