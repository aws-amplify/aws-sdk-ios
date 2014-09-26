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

#import "AWSCategory.h"
#import <objc/runtime.h>
#import "AWSLogging.h"

NSString *const AWSDateRFC822DateFormat1 = @"EEE, dd MMM yyyy HH:mm:ss z";
NSString *const AWSDateISO8601DateFormat1 = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
NSString *const AWSDateISO8601DateFormat2 = @"yyyyMMdd'T'HHmmss'Z'";
NSString *const AWSDateISO8601DateFormat3 = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
NSString *const AWSDateShortDateFormat1 = @"yyyyMMdd";

@implementation NSDate (AWS)

static NSTimeInterval _clockskew = 0.0;

+ (NSDate *)aws_dateFromString:(NSString *)string {
    NSDate *parsedDate = nil;
    NSArray *arrayOfDateFormat = @[AWSDateRFC822DateFormat1,AWSDateISO8601DateFormat1,AWSDateISO8601DateFormat2,AWSDateISO8601DateFormat3];

    for (NSString *dateFormat in arrayOfDateFormat) {
        if (!parsedDate) {
            parsedDate = [NSDate aws_dateFromString:string format:dateFormat];
        } else {
            break;
        }
    }

    return parsedDate;
}

+ (NSDate *)aws_dateFromString:(NSString *)string format:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = dateFormat;

    NSDate *parsed = [dateFormatter dateFromString:string];

    NSDate *localDate = [parsed dateByAddingTimeInterval:_clockskew];

    return localDate;
}

- (NSString *)aws_stringValue:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = dateFormat;

    //ClockSkew Correction
    NSDate *correctDate = [self dateByAddingTimeInterval:-1*_clockskew];
    NSString *formatted = [dateFormatter stringFromDate:correctDate];

    return formatted;
}

+ (void)aws_setRuntimeClockSkew:(NSTimeInterval)clockskew
{
    @synchronized(self) {
        _clockskew = clockskew;
    }
}

+ (NSTimeInterval)aws_getRuntimeClockSkew
{
    @synchronized(self) {
        return _clockskew;
    }
}

+ (NSDate *)aws_getDateFromMessageBody:(NSString *)messageBody
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

    return [self aws_dateFromString:time];
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

@implementation NSDictionary (AWS)

- (NSDictionary *)aws_removeNullValues {
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary new];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (obj != [NSNull null]) {
            [mutableDictionary setObject:obj forKey:key];
        }
    }];

    return mutableDictionary;
}

@end

@implementation NSObject (AWS)

- (NSDictionary *)aws_properties {
    NSMutableDictionary *propertyDictionary;
    if ([self superclass] != [NSObject class]) {
    	propertyDictionary = [NSMutableDictionary dictionaryWithDictionary:[[self superclass] aws_properties]];
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

- (void)aws_copyPropertiesFromObject:(NSObject *)object {
    NSDictionary *propertiesToObject = [self aws_properties];
    NSDictionary *propertiesFromObject = [object aws_properties];
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

- (BOOL)aws_isDNSBucketName:(NSString *)theBucketName;
{
    if (theBucketName == nil) {
        return NO;
    }
    
    if ( [theBucketName length] < 3 || [theBucketName length] > 63) {
        return NO;
    }
    
    if ( [theBucketName hasSuffix:@"-"]) {
        return NO;
    }
    
    if ( [self aws_contains:theBucketName searchString:@"_"]) {
        return NO;
    }
    
    if ( [self aws_contains:theBucketName searchString:@"-."] ||
        [self aws_contains:theBucketName searchString:@".-"]) {
        return NO;
    }
    
    if ( [[theBucketName lowercaseString] isEqualToString:theBucketName] == NO) {
        return NO;
    }
    
    return YES;
}

- (BOOL)aws_isVirtualHostedStyleCompliant:(NSString *)theBucketName
{
    if (![self aws_isDNSBucketName:theBucketName]) {
        return NO;
    } else {
        return ![self aws_contains:theBucketName searchString:@"."];
    }
}

- (BOOL)aws_contains:(NSString *)sourceString searchString:(NSString *)searchString
{
    NSRange range = [sourceString rangeOfString:searchString];
    
    return (range.location != NSNotFound);
}

@end

@implementation NSString (AWS)

+ (NSString *)aws_randomStringWithLength:(NSUInteger)length {
    NSMutableString *randomString = [NSMutableString new];
    for (int32_t i = 0; i < length; i++) {
        @autoreleasepool {
            [randomString appendString:[NSString stringWithFormat:@"%c", arc4random_uniform(26) + 'a']];
        }
    }
    return randomString;
}

- (BOOL)aws_isBase64Data {
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

- (NSString *)aws_stringWithURLEncoding {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (__bridge CFStringRef)[self aws_decodeURLEncoding],
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\();:@&=+$,/?%#[] ",
                                                                                 kCFStringEncodingUTF8));
}

- (NSString *)aws_stringWithURLEncodingPath {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (__bridge CFStringRef)[self aws_decodeURLEncoding],
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\();:@&=+$,?%#[] ",
                                                                                 kCFStringEncodingUTF8));
}

- (NSString *)aws_decodeURLEncoding {
    NSString *result = [self stringByRemovingPercentEncoding];
    return result?result:self;
}

@end

@implementation NSURL (AWS)

- (NSURL *)aws_URLByAppendingQuery:(NSDictionary *)query {
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
            AWSLogWarn(@"Query value is neither NSString nor NSNumber. This method should properly handle this datatype. [%@]", query[key]);
        }
        [queryString appendString:[NSString stringWithFormat:@"%@=%@",
                                   [correctedKey aws_stringWithURLEncoding],
                                   [value aws_stringWithURLEncoding]]];
    }

    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",
                                 [self absoluteString],
                                 [self query] ? @"&" : @"?",
                                 queryString]];
}

@end

@implementation NSDictionary (caseInsensitive)

-(id) aws_objectForCaseInsensitiveKey:(id)aKey {
    for (NSString *key in self.allKeys) {
        if ([key compare:aKey options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            return [self objectForKey:key];
        }
    }
    return  nil;
}
@end
