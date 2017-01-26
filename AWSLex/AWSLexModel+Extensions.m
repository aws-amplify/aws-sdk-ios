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

#import "AWSLexModel+Extensions.h"

@implementation AWSLexPostContentRequest(Extension)

+ (NSValueTransformer *)sessionAttributesJSONTransformer{
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSDictionary<NSString *, NSString*> *(NSString *sessionAttributes) {
        NSData *data = [[NSData alloc]initWithBase64EncodedString:sessionAttributes options:kNilOptions];
        return (NSDictionary<NSString *, NSString*> *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    } reverseBlock:^NSString *(NSDictionary<NSString *, NSString*> * sessionAttributes) {
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:sessionAttributes
                                                           options:kNilOptions
                                                             error:nil];
        return [[NSString alloc]initWithData:[JSONData base64EncodedDataWithOptions:kNilOptions] encoding:NSUTF8StringEncoding];
    }];
}

@end

@implementation AWSLexPostContentResponse (Extension)

+ (NSValueTransformer *)slotsJSONTransformer{
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSDictionary *(NSString * slots) {
        NSData *data = [[NSData alloc]initWithBase64EncodedString:slots options:kNilOptions];
        return (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    } reverseBlock:^NSString *(NSDictionary * slots) {
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:slots
                                                           options:kNilOptions
                                                             error:nil];
        
        return [[NSString alloc]initWithData:[JSONData base64EncodedDataWithOptions:kNilOptions] encoding:NSUTF8StringEncoding];
     }];
}

+ (NSValueTransformer *)sessionAttributesJSONTransformer{
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSDictionary<NSString *, NSString*> *(NSString *sessionAttributes) {
        NSData *data = [[NSData alloc]initWithBase64EncodedString:sessionAttributes options:kNilOptions];
        return (NSDictionary<NSString *, NSString*> *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    } reverseBlock:^NSString *(NSDictionary<NSString *, NSString*> * sessionAttributes) {
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:sessionAttributes
                                                           options:kNilOptions
                                                             error:nil];
        
        return [[NSString alloc]initWithData:[JSONData base64EncodedDataWithOptions:kNilOptions] encoding:NSUTF8StringEncoding];
    }];
}

@end
