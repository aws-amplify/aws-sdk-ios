/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AZCategory.h"
#import <objc/runtime.h>
#import "AZLogging.h"

NSString *const AZDateRFC822DateFormat1 = @"EEE, dd MMM yyyy HH:mm:ss z";
NSString *const AZDateISO8601DateFormat1 = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
NSString *const AZDateISO8601DateFormat2 = @"yyyyMMdd'T'HHmmss'Z'";
NSString *const AZDateISO8601DateFormat3 = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
NSString *const AZDateShortDateFormat1 = @"yyyyMMdd";

@implementation NSData (AZ)

static char base64EncodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

- (NSString *)az_base64EncodedString {
    NSMutableString *result;
    unsigned char   *raw;
    unsigned long   length;
    short           i, nCharsToWrite;
    long            cursor;
    unsigned char   inbytes[3], outbytes[4];

    length = [self length];

    if (length < 1) {
        return @"";
    }

    result = [NSMutableString stringWithCapacity:length];
    raw    = (unsigned char *)[self bytes];
    // Take 3 chars at a time, and encode to 4
    for (cursor = 0; cursor < length; cursor += 3) {
        for (i = 0; i < 3; i++) {
            if (cursor + i < length) {
                inbytes[i] = raw[cursor + i];
            }
            else{
                inbytes[i] = 0;
            }
        }

        outbytes[0] = (inbytes[0] & 0xFC) >> 2;
        outbytes[1] = ((inbytes[0] & 0x03) << 4) | ((inbytes[1] & 0xF0) >> 4);
        outbytes[2] = ((inbytes[1] & 0x0F) << 2) | ((inbytes[2] & 0xC0) >> 6);
        outbytes[3] = inbytes[2] & 0x3F;

        nCharsToWrite = 4;

        switch (length - cursor) {
            case 1:
                nCharsToWrite = 2;
                break;

            case 2:
                nCharsToWrite = 3;
                break;
        }
        for (i = 0; i < nCharsToWrite; i++) {
            [result appendFormat:@"%c", base64EncodingTable[outbytes[i]]];
        }
        for (i = nCharsToWrite; i < 4; i++) {
            [result appendString:@"="];
        }
    }

    return [NSString stringWithString:result];
}

@end

@implementation NSDate (AZ)

static NSTimeInterval _clockskew = 0.0;

+ (NSDate *)az_dateFromString:(NSString *)string {
    NSDate *parsedDate = nil;
    NSArray *arrayOfDateFormat = @[AZDateRFC822DateFormat1,AZDateISO8601DateFormat1,AZDateISO8601DateFormat2,AZDateISO8601DateFormat3];

    for (NSString *dateFormat in arrayOfDateFormat) {
        if (!parsedDate) {
            parsedDate = [NSDate az_dateFromString:string format:dateFormat];
        } else {
            break;
        }
    }

    return parsedDate;
}

+ (NSDate *)az_dateFromString:(NSString *)string format:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = dateFormat;

    NSDate *parsed = [dateFormatter dateFromString:string];

    NSDate *localDate = [parsed dateByAddingTimeInterval:_clockskew];

    return localDate;
}

- (NSString *)az_stringValue:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = dateFormat;

    //ClockSkew Correction
    NSDate *correctDate = [self dateByAddingTimeInterval:-1*_clockskew];
    NSString *formatted = [dateFormatter stringFromDate:correctDate];

    return formatted;
}

+ (void)az_setRuntimeClockSkew:(NSTimeInterval)clockskew
{
    @synchronized(self) {
        _clockskew = clockskew;
    }
}

+ (NSTimeInterval)az_getRuntimeClockSkew
{
    @synchronized(self) {
        return _clockskew;
    }
}

+ (NSDate *)az_getDateFromMessageBody:(NSString *)messageBody
{
    if ([messageBody length] == 0) {
        return nil;
    }
    NSString *time = nil;
    // if local device time is behind than server time
    if ([messageBody rangeOfString:@" + 15"].location == NSNotFound) {
        time = [self getTimeUsingBeginTag:@" (" andEndTag:@" - 15 min.)" fromResponseBody:messageBody];
    }
    else {
        time =  [self getTimeUsingBeginTag:@" (" andEndTag:@" + 15 min.)" fromResponseBody:messageBody];
    }

    return [self az_dateFromString:time];
}

+ (NSString *)getTimeUsingBeginTag:(NSString *)bTag andEndTag:(NSString *)eTag fromResponseBody:(NSString *)responseBody {
    // Extract server time from response message body.
    @try {
        NSRange rLeft = [responseBody rangeOfString:bTag];
        NSRange rRight = [responseBody rangeOfString:eTag];
        NSUInteger loc = rLeft.location + rLeft.length;
        NSUInteger len = rRight.location - rLeft.location - rLeft.length;
        NSRange sub = NSMakeRange(loc, len);
        NSString *date = [responseBody substringWithRange:sub];
        return date;
    } @catch (NSException *e) {
        return nil;
    }
}

@end

@implementation NSDictionary (AZ)

- (NSDictionary *)az_removeNullValues {
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary new];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (obj != [NSNull null]) {
            [mutableDictionary setObject:obj forKey:key];
        }
    }];

    return mutableDictionary;
}

@end

@implementation NSObject (AZ)

- (NSDictionary *)az_properties {
    NSMutableDictionary *propertyDictionary;
    if ([self superclass] != [NSObject class]) {
    	propertyDictionary = [NSMutableDictionary dictionaryWithDictionary:[[self superclass] az_properties]];
    } else {
    	propertyDictionary = [NSMutableDictionary dictionary];
    }

    unsigned int propertyListCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyListCount);
    for(uint32_t i = 0; i < propertyListCount; i++) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        const char *attributes = property_getAttributes(property);
        if(propertyName) {
            NSString *propertyNameString = [NSString stringWithCString:propertyName
                                                              encoding:[NSString defaultCStringEncoding]];
            NSString *attributesString = [NSString stringWithCString:attributes
                                                            encoding:[NSString defaultCStringEncoding]];
            [propertyDictionary setObject:attributesString forKey:propertyNameString];
        }
    }
    free(properties);

    return propertyDictionary;
}

- (void)az_copyPropertiesFromObject:(NSObject *)object {
    NSDictionary *propertiesToObject = [self az_properties];
    NSDictionary *propertiesFromObject = [object az_properties];
    for (NSString *key in [propertiesFromObject allKeys]) {
        if ([propertiesToObject objectForKey:key]) {
            NSString *attributes = [propertiesFromObject valueForKey:key];
            /**
             * If it's not a readonly property
             * Ref. https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101-SW1
             */
            if ([attributes rangeOfString:@",R,"].location == NSNotFound) {
                if (![key isEqualToString:@"uploadProgress"] && ![key isEqualToString:@"downloadProgress"]) {
                    //do not copy progress block since they do not have getter method and they have already been copied via internalRequest. copy it again will result in overwrite the current value to nil.
                    [self setValue:[object valueForKey:key]
                            forKey:key];
                }
            }
        }
    }
}

@end

@implementation NSString (AZ)

+ (NSString *)az_randomStringWithLength:(NSUInteger)length {
    NSMutableString *randomString = [NSMutableString new];
    for (int32_t i = 0; i < length; i++) {
        @autoreleasepool {
            [randomString appendString:[NSString stringWithFormat:@"%c", arc4random_uniform(26) + 'a']];
        }
    }
    return randomString;
}

- (BOOL)az_isBase64Data {
    if ([self length] % 4 == 0) {
        static NSCharacterSet *invertedBase64CharacterSet = nil;
        if (invertedBase64CharacterSet == nil) {
            invertedBase64CharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="] invertedSet];
        }
        return [self rangeOfCharacterFromSet:invertedBase64CharacterSet
                                     options:NSLiteralSearch].location == NSNotFound;
    }
    return NO;
}

- (NSString *)az_stringWithURLEncoding {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)[self az_decodeURLEncoding],
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\();:@&=+$,/?%#[] ",
                                                                                 kCFStringEncodingUTF8));
}

- (NSString *)az_stringWithURLEncodingExceptSlash {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)[self az_decodeURLEncoding],
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\();:@&=+$,?%#[] ",
                                                                                 kCFStringEncodingUTF8));
}

- (NSString *)az_decodeURLEncoding {
    return (__bridge NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                        (__bridge CFStringRef)self,
                                                                                        CFSTR(""),
                                                                                        kCFStringEncodingUTF8);
}

@end

@implementation NSURL (AZ)

- (NSURL *)az_URLByAppendingQuery:(NSDictionary *)query {
    if ([query count] == 0) {
        return self;
    }

    NSMutableString *queryString = [NSMutableString new];
    for (NSString *key in query) {

        //lowercase first char
        //TODO this is a temporary fix, parse the query string properly and setup the dictionary with the key as the parameter, not the token
        NSString * correctedKey = [[[key substringToIndex:1] lowercaseString] stringByAppendingString: [key length]>1 ? [key substringFromIndex:1] : @"" ];

        if ([queryString length] > 0) {
            [queryString appendString:@"&"];
        }

        NSString *value = nil;
        if ([query[key] isKindOfClass:[NSString class]]) {
            value = query[key];
        } else if ([query[key] isKindOfClass:[NSNumber class]]) {
            value = [query[key] stringValue];
        } else {
            value = [query[key] description];
            AZLogWarn(@"Query value is neither NSString nor NSNumber. This method should properly handle this datatype. [%@]", query[key]);
        }
        [queryString appendString:[NSString stringWithFormat:@"%@=%@",
                                   [correctedKey az_stringWithURLEncoding],
                                   [value az_stringWithURLEncoding]]];
    }

    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",
                                 [self absoluteString],
                                 [self query] ? @"&" : @"?",
                                 queryString]];
}

@end
