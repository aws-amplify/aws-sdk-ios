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

#import <Foundation/Foundation.h>
#import "AWSTimestampSerialization.h"
#import "AWSCategory.h"

NSString *const AWSTimestampSerializationErrorDomain = @"com.amazonaws.AWSTimestampSerializationErrorDomain";

@implementation AWSTimestampSerialization

+ (BOOL)failWithCode:(NSInteger)code description:(NSString *)description error:(NSError *__autoreleasing *)error {
    if (error) {
        *error = [NSError errorWithDomain:AWSTimestampSerializationErrorDomain
                                     code:code
                                 userInfo:@{NSLocalizedDescriptionKey : description}];
    }
    return NO;
}

+ (nullable NSDate *)parseTimestamp:(id)value{
    NSDate *timeStampDate;
    //maybe a NSDate type or NSNumber type or NSString type
    if ([value isKindOfClass:[NSString class]]) {
        //try parse the string to NSDate first
        timeStampDate = [NSDate aws_dateFromString:value];
        
        //if failed, then parse it as double value represented as string
        if (!timeStampDate) {
            timeStampDate = [NSDate dateWithTimeIntervalSince1970:[value doubleValue]];
        }
    } else if ([value isKindOfClass:[NSNumber class]]) {
        //need to convert to NSDate type
        timeStampDate = [NSDate dateWithTimeIntervalSince1970:[value doubleValue]];
        
    } else if ([value isKindOfClass:[NSDate class]]) {
        timeStampDate = value;
    }
    return timeStampDate;
}

// Check and handle `timestampFormat` trait if present on a timestamp object
+ (nullable NSString *)serializeTimestamp:(NSDictionary *)rules value:(id)value error:(NSError *__autoreleasing *)error {
    if (!value || [value isEqual:[NSNull null]] || ![rules[@"type"] isEqualToString:@"timestamp"]) {
        return nil;
    } else {
        //generate string presentation of timestamp
        NSString *timestampStr;
        
        NSDate *timeStampDate = [self parseTimestamp:value];
        if (timeStampDate == nil) {
            [self failWithCode:AWSTimestampParserError
                   description:[NSString stringWithFormat:@"the timestamp value is invalid:%@",value]
                         error:error];
        } else {
            // we are able to parse the value into NSDate
            if ([rules[@"timestampFormat"] isEqualToString:@"iso8601"]) {
                timestampStr = [timeStampDate aws_stringValue:AWSDateISO8601DateFormat1];
            } else if ([rules[@"timestampFormat"] isEqualToString:@"unixTimestamp"]) {
                timestampStr = [NSString stringWithFormat:@"%.lf",[timeStampDate timeIntervalSince1970]];
            } else if ([rules[@"timestampFormat"] isEqualToString:@"rfc822"]) {
                timestampStr = [timeStampDate aws_stringValue: AWSDateRFC822DateFormat1];
            }
        }
        return timestampStr;
    }
}

@end

@implementation AWSJSONTimestampSerialization

+ (nullable NSString *)serializeTimestamp:(NSDictionary *)rules value:(id)value error:(NSError *__autoreleasing *)error {
    NSString *timestampStr = [super serializeTimestamp:rules value:value error:error];
    
    if (!timestampStr.length){
        // valid `timestampFormat` trait is not present, use protocol specific default.
        NSDate *timeStampDate = [self parseTimestamp:value];
        timestampStr = [NSString stringWithFormat:@"%.lf",[timeStampDate timeIntervalSince1970]];
    }
    return timestampStr;
}

@end

@implementation AWSXMLTimestampSerialization

+ (nullable NSString *)serializeTimestamp:(NSDictionary *)rules value:(id)value error:(NSError *__autoreleasing *)error {
    NSString *timestampStr = [super serializeTimestamp:rules value:value error:error];
    
    if (!timestampStr.length){
        // valid `timestampFormat` trait is not present, use protocol specific default.
        NSDate *timeStampDate = [self parseTimestamp:value];
        timestampStr = [timeStampDate aws_stringValue: AWSDateRFC822DateFormat1];
    }
    return timestampStr;
}

@end

@implementation AWSQueryTimestampSerialization

+ (nullable NSString *)serializeTimestamp:(NSDictionary *)rules value:(id)value error:(NSError *__autoreleasing *)error {
    NSString *timestampStr = [super serializeTimestamp:rules value:value error:error];
    
    if (!timestampStr.length){
        // valid `timestampFormat` trait is not present, use protocol specific default.
        NSDate *timeStampDate = [self parseTimestamp:value];
        timestampStr = [timeStampDate aws_stringValue: AWSDateISO8601DateFormat1];
    }
    return timestampStr;
}

@end

@implementation AWSEC2TimestampSerialization

+ (nullable NSString *)serializeTimestamp:(NSDictionary *)rules value:(id)value error:(NSError *__autoreleasing *)error {
    NSString *timestampStr = [super serializeTimestamp:rules value:value error:error];
    
    if (!timestampStr.length){
        // valid `timestampFormat` trait is not present, use protocol specific default.
        NSDate *timeStampDate = [self parseTimestamp:value];
        timestampStr = [timeStampDate aws_stringValue: AWSDateISO8601DateFormat1];
    }
    return timestampStr;
}

@end
