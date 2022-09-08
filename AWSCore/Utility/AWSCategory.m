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
#import "AWSCategory.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import "AWSCocoaLumberjack.h"
#import "AWSGZIP.h"
#import "AWSMantle.h"

NSString *const AWSDateRFC822DateFormat1 = @"EEE, dd MMM yyyy HH:mm:ss z";
NSString *const AWSDateISO8601DateFormat1 = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
NSString *const AWSDateISO8601DateFormat2 = @"yyyyMMdd'T'HHmmss'Z'";
NSString *const AWSDateISO8601DateFormat3 = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
NSString *const AWSDateShortDateFormat1 = @"yyyyMMdd";
NSString *const AWSDateShortDateFormat2 = @"yyyy-MM-dd";

@interface AWSCategory : NSObject

+ (void)loadCategories;

@end

@implementation AWSCategory

+ (void)loadCategories {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        awsgzip_loadGZIP();
        awsmtl_loadMTLPredefinedTransformerAdditions();
        awsmtl_loadMTLNSCoding();
    });
}

@end

@implementation NSDate (AWS)

static NSTimeInterval _clockskew = 0.0;

+ (NSDate *)aws_clockSkewFixedDate {
    return [[NSDate date] dateByAddingTimeInterval:-1 * _clockskew];
}

+ (NSDate *)aws_dateFromString:(NSString *)string {
    NSDate *parsedDate = nil;
    NSArray *arrayOfDateFormat = @[AWSDateRFC822DateFormat1,
                                   AWSDateISO8601DateFormat1,
                                   AWSDateISO8601DateFormat2,
                                   AWSDateISO8601DateFormat3];

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
    if ([dateFormat isEqualToString:AWSDateRFC822DateFormat1]) {
        return [[NSDate aws_RFC822Date1Formatter] dateFromString:string];
    }
    if ([dateFormat isEqualToString:AWSDateISO8601DateFormat1]) {
        return [[NSDate aws_ISO8601Date1Formatter] dateFromString:string];
    }
    if ([dateFormat isEqualToString:AWSDateISO8601DateFormat2]) {
        return [[NSDate aws_ISO8601Date2Formatter] dateFromString:string];
    }
    if ([dateFormat isEqualToString:AWSDateISO8601DateFormat3]) {
        return [[NSDate aws_ISO8601Date3Formatter] dateFromString:string];
    }
    if ([dateFormat isEqualToString:AWSDateShortDateFormat1]) {
        return [[NSDate aws_ShortDateFormat1Formatter] dateFromString:string];
    }
    if ([dateFormat isEqualToString:AWSDateShortDateFormat2]) {
        return [[NSDate aws_ShortDateFormat2Formatter] dateFromString:string];
    }

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = dateFormat;

    return [dateFormatter dateFromString:string];
}

- (NSString *)aws_stringValue:(NSString *)dateFormat {
    if ([dateFormat isEqualToString:AWSDateRFC822DateFormat1]) {
        return [[NSDate aws_RFC822Date1Formatter] stringFromDate:self];
    }
    if ([dateFormat isEqualToString:AWSDateISO8601DateFormat1]) {
        return [[NSDate aws_ISO8601Date1Formatter] stringFromDate:self];
    }
    if ([dateFormat isEqualToString:AWSDateISO8601DateFormat2]) {
        return [[NSDate aws_ISO8601Date2Formatter] stringFromDate:self];
    }
    if ([dateFormat isEqualToString:AWSDateISO8601DateFormat3]) {
        return [[NSDate aws_ISO8601Date3Formatter] stringFromDate:self];
    }
    if ([dateFormat isEqualToString:AWSDateShortDateFormat1]) {
        return [[NSDate aws_ShortDateFormat1Formatter] stringFromDate:self];
    }
    if ([dateFormat isEqualToString:AWSDateShortDateFormat2]) {
        return [[NSDate aws_ShortDateFormat2Formatter] stringFromDate:self];
    }

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = dateFormat;

    return [dateFormatter stringFromDate:self];
}

+ (NSDateFormatter *)aws_RFC822Date1Formatter {
    static NSDateFormatter *_dateFormatter = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat = AWSDateRFC822DateFormat1;
    });

    return _dateFormatter;
}

+ (NSDateFormatter *)aws_ISO8601Date1Formatter {
    static NSDateFormatter *_dateFormatter = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat = AWSDateISO8601DateFormat1;
    });

    return _dateFormatter;
}

+ (NSDateFormatter *)aws_ISO8601Date2Formatter {
    static NSDateFormatter *_dateFormatter = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat = AWSDateISO8601DateFormat2;
    });

    return _dateFormatter;
}

+ (NSDateFormatter *)aws_ISO8601Date3Formatter {
    static NSDateFormatter *_dateFormatter = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat = AWSDateISO8601DateFormat3;
    });

    return _dateFormatter;
}

+ (NSDateFormatter *)aws_ShortDateFormat1Formatter {
    static NSDateFormatter *_dateFormatter = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat = AWSDateShortDateFormat1;
    });

    return _dateFormatter;
}

+ (NSDateFormatter *)aws_ShortDateFormat2Formatter {
    static NSDateFormatter *_dateFormatter = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
        _dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat = AWSDateShortDateFormat2;
    });

    return _dateFormatter;
}

+ (void)aws_setRuntimeClockSkew:(NSTimeInterval)clockskew {
    @synchronized(self) {
        _clockskew = clockskew;
    }
}

+ (NSTimeInterval)aws_getRuntimeClockSkew {
    @synchronized(self) {
        return _clockskew;
    }
}

@end

@implementation NSDictionary (AWS)

- (NSDictionary *)aws_removeNullValues {
    return [self aws_recursivelyRemoveNullEntries:self];
}

- (NSDictionary *)aws_recursivelyRemoveNullEntries:(NSDictionary *)inputDictionary {
    
    NSMutableDictionary *resultMutableDictionary = [NSMutableDictionary new];
    
    for (NSString *key in inputDictionary) {
        id value = inputDictionary[key];
        if ([value isEqual:[NSNull null]]) {
            continue;
        }
        if([value isKindOfClass:[NSDictionary class]]) {
            [resultMutableDictionary setObject:[self aws_recursivelyRemoveNullEntries:value] forKey:key];
        } else {
            [resultMutableDictionary setObject:value forKey:key];
        }
    }
    return resultMutableDictionary;
}

-(id) aws_objectForCaseInsensitiveKey:(id)aKey {
    for (NSString *key in self.allKeys) {
        if ([key compare:aKey options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            return [self objectForKey:key];
        }
    }
    return  nil;
}

@end

@implementation NSJSONSerialization (AWS)

+ (NSData *)aws_dataWithJSONObject:(id)obj
                           options:(NSJSONWritingOptions)opt
                             error:(NSError **)error {
    if (!obj) {
        return nil;
    }
    if ([NSJSONSerialization isValidJSONObject:obj]) {
        return [NSJSONSerialization dataWithJSONObject:obj
                                               options:opt
                                                 error:error];
    } else {
        NSData *JSONData = [NSJSONSerialization dataWithJSONObject:@[obj]
                                                           options:opt
                                                             error:error];
        NSString *JSONString = [[NSString alloc] initWithData:JSONData
                                                     encoding:NSUTF8StringEncoding];
        if ([JSONString length] > 2) {
            JSONString = [JSONString substringWithRange:NSMakeRange(1, [JSONString length] - 2)];
            return [JSONString dataUsingEncoding:NSUTF8StringEncoding];
        } else {
            return nil;
        }
    }
}

@end

@implementation NSNumber (AWS)

+ (NSNumber *)aws_numberFromString:(NSString *)string {
    static NSNumberFormatter *numberFormatter = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        numberFormatter = [NSNumberFormatter new];
        numberFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    });

    return [numberFormatter numberFromString:string];
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

@end

@implementation NSString (AWS)

+ (NSString *)aws_base64md5FromData:(NSData *)data {
    
    if([data length] > UINT32_MAX)
    {
        //The NSData size is too large. The maximum allowable size is UINT32_MAX.
        return nil;
    }
    
    const void    *cStr = [data bytes];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (uint32_t)[data length], result);
    
    NSData *md5 = [[NSData alloc] initWithBytes:result length:CC_MD5_DIGEST_LENGTH];
    return [md5 base64EncodedStringWithOptions:kNilOptions];
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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (__bridge CFStringRef)[self aws_decodeURLEncoding],
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\();:@&=+$,/?%#[] ",
                                                                                 kCFStringEncodingUTF8));
#pragma clang diagnostic pop
}

- (NSString *)aws_stringWithURLEncodingPath {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (__bridge CFStringRef)[self aws_decodeURLEncoding],
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\();:@&=+$,?%#[] ",
                                                                                 kCFStringEncodingUTF8));
#pragma clang diagnostic pop
}

- (NSString *)aws_stringWithURLEncodingPathWithoutPriorDecoding {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (__bridge CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\();:@&=+$,?%#[] ",
                                                                                 kCFStringEncodingUTF8));
#pragma clang diagnostic pop
}

- (NSString *)aws_decodeURLEncoding {
    NSString *result = [self stringByRemovingPercentEncoding];
    return result?result:self;
}

- (BOOL)aws_isDNSBucketName {
    if ([self length] < 3 || [self length] > 63) {
        return NO;
    }

    if ([self hasSuffix:@"-"]) {
        return NO;
    }

    if ([self aws_contains:@"_"]) {
        return NO;
    }

    if ([self aws_contains:@"-."] || [self aws_contains:@".-"]) {
        return NO;
    }

    if ([[self lowercaseString] isEqualToString:self] == NO) {
        return NO;
    }

    return YES;
}

- (BOOL)aws_isVirtualHostedStyleCompliant {
    if (![self aws_isDNSBucketName]) {
        return NO;
    } else {
        return ![self aws_contains:@"."];
    }
}

- (AWSRegionType)aws_regionTypeValue {
    if ([self isEqualToString:@"AWSRegionUSEast1"]
        || [self isEqualToString:@"USEast1"]
        || [self isEqualToString:@"us-east-1"]) {
        return AWSRegionUSEast1;
    }
    if ([self isEqualToString:@"AWSRegionUSEast2"]
        || [self isEqualToString:@"USEast2"]
        || [self isEqualToString:@"us-east-2"]) {
        return AWSRegionUSEast2;
    }
    if ([self isEqualToString:@"AWSRegionUSWest1"]
        || [self isEqualToString:@"USWest1"]
        || [self isEqualToString:@"us-west-1"]) {
        return AWSRegionUSWest1;
    }
    if ([self isEqualToString:@"AWSRegionUSWest2"]
        || [self isEqualToString:@"USWest2"]
        || [self isEqualToString:@"us-west-2"]) {
        return AWSRegionUSWest2;
    }
    if ([self isEqualToString:@"AWSRegionEUWest1"]
        || [self isEqualToString:@"EUWest1"]
        || [self isEqualToString:@"eu-west-1"]) {
        return AWSRegionEUWest1;
    }
    if ([self isEqualToString:@"AWSRegionEUWest2"]
        || [self isEqualToString:@"EUWest2"]
        || [self isEqualToString:@"eu-west-2"]) {
        return AWSRegionEUWest2;
    }
    if ([self isEqualToString:@"AWSRegionEUCentral1"]
        || [self isEqualToString:@"EUCentral1"]
        || [self isEqualToString:@"eu-central-1"]) {
        return AWSRegionEUCentral1;
    }
    if ([self isEqualToString:@"AWSRegionAPNortheast1"]
        || [self isEqualToString:@"APNortheast1"]
        || [self isEqualToString:@"ap-northeast-1"]) {
        return AWSRegionAPNortheast1;
    }
    if ([self isEqualToString:@"AWSRegionAPNortheast2"]
        || [self isEqualToString:@"APNortheast2"]
        || [self isEqualToString:@"ap-northeast-2"]) {
        return AWSRegionAPNortheast2;
    }
    if ([self isEqualToString:@"AWSRegionAPSoutheast1"]
        || [self isEqualToString:@"APSoutheast1"]
        || [self isEqualToString:@"ap-southeast-1"]) {
        return AWSRegionAPSoutheast1;
    }
    if ([self isEqualToString:@"AWSRegionAPSoutheast2"]
        || [self isEqualToString:@"APSoutheast2"]
        || [self isEqualToString:@"ap-southeast-2"]) {
        return AWSRegionAPSoutheast2;
    }
    if ([self isEqualToString:@"AWSRegionAPSoutheast3"]
        || [self isEqualToString:@"APSoutheast3"]
        || [self isEqualToString:@"ap-southeast-3"]) {
        return AWSRegionAPSoutheast3;
    }
    if ([self isEqualToString:@"AWSRegionAPSouth1"]
        || [self isEqualToString:@"APSouth1"]
        || [self isEqualToString:@"ap-south-1"]) {
        return AWSRegionAPSouth1;
    }
    if ([self isEqualToString:@"AWSRegionSAEast1"]
        || [self isEqualToString:@"SAEast1"]
        || [self isEqualToString:@"sa-east-1"]) {
        return AWSRegionSAEast1;
    }
    if ([self isEqualToString:@"AWSRegionCACentral1"]
        || [self isEqualToString:@"CACentral1"]
        || [self isEqualToString:@"ca-central-1"]) {
        return AWSRegionCACentral1;
    }
    if ([self isEqualToString:@"AWSRegionUSGovWest1"]
        || [self isEqualToString:@"USGovWest1"]
        || [self isEqualToString:@"us-gov-west-1"]) {
        return AWSRegionUSGovWest1;
    }

    if ([self isEqualToString:@"AWSRegionCNNorth1"]
        || [self isEqualToString:@"CNNorth1"]
        || [self isEqualToString:@"cn-north-1"]) {
        return AWSRegionCNNorth1;
    }
    
    if ([self isEqualToString:@"AWSRegionCNNorthWest1"]
        || [self isEqualToString:@"CNNorthWest1"]
        || [self isEqualToString:@"cn-northwest-1"]) {
        return AWSRegionCNNorthWest1;
    }
    
    if ([self isEqualToString:@"AWSRegionEUWest3"]
        || [self isEqualToString:@"EUWest3"]
        || [self isEqualToString:@"eu-west-3"]) {
        return AWSRegionEUWest3;
    }
    
    if ([self isEqualToString:@"AWSRegionUSGovEast1"]
        || [self isEqualToString:@"USGovEast1"]
        || [self isEqualToString:@"us-gov-east-1"]) {
        return AWSRegionUSGovEast1;
    }
    
    if ([self isEqualToString:@"AWSRegionEUNorth1"]
        || [self isEqualToString:@"EUNorth1"]
        || [self isEqualToString:@"eu-north-1"]) {
        return AWSRegionEUNorth1;
    }

    if ([self isEqualToString:@"AWSRegionAPEast1"]
        || [self isEqualToString:@"APEast1"]
        || [self isEqualToString:@"ap-east-1"]) {
        return AWSRegionAPEast1;
    }
    
    if ([self isEqualToString:@"AWSRegionMECentral1"]
        || [self isEqualToString:@"MECentral1"]
        || [self isEqualToString:@"me-central-1"]) {
        return AWSRegionMECentral1;
    }

    if ([self isEqualToString:@"AWSRegionMESouth1"]
        || [self isEqualToString:@"MESouth1"]
        || [self isEqualToString:@"me-south-1"]) {
        return AWSRegionMESouth1;
    }

    if ([self isEqualToString:@"AWSRegionAFSouth1"]
        || [self isEqualToString:@"AFSouth1"]
        || [self isEqualToString:@"af-south-1"]) {
        return AWSRegionAFSouth1;
    }

    if ([self isEqualToString:@"AWSRegionEUSouth1"]
        || [self isEqualToString:@"EUSouth1"]
        || [self isEqualToString:@"eu-south-1"]) {
        return AWSRegionEUSouth1;
    }

    return AWSRegionUnknown;
}

- (BOOL)aws_contains:(NSString *)searchString {
    NSRange range = [self rangeOfString:searchString];

    return (range.location != NSNotFound);
}

@end

@implementation NSFileManager (AWS)

- (BOOL)aws_atomicallyCopyItemAtURL:(NSURL *)sourceURL
                              toURL:(NSURL *)destinationURL
                     backupItemName:(NSString *)backupItemName
                              error:(NSError **)outError {
    
    NSURL *tempDir = [self URLForDirectory:NSItemReplacementDirectory
                                  inDomain:NSUserDomainMask
                         appropriateForURL:destinationURL
                                    create:YES
                                     error:outError];
    
    if (!tempDir) return NO;
    
    NSURL *tempURL = [tempDir URLByAppendingPathComponent:[destinationURL lastPathComponent]];
    
    BOOL result = [self copyItemAtURL:sourceURL toURL:tempURL error:outError];
    if (result) {
        
        result = [self replaceItemAtURL:destinationURL
                          withItemAtURL:tempURL
                         backupItemName:backupItemName
                                options:NSFileManagerItemReplacementUsingNewMetadataOnly
                       resultingItemURL:nil
                                  error:outError];
        if (NO == result) {
            if (backupItemName) {
                NSURL *backupItemURL = [[destinationURL URLByDeletingLastPathComponent] URLByAppendingPathComponent:backupItemName];
                NSError *error = nil;
                BOOL success = [self replaceItemAtURL:destinationURL
                                        withItemAtURL:backupItemURL
                                       backupItemName:nil
                                              options:NSFileManagerItemReplacementUsingNewMetadataOnly
                                     resultingItemURL:nil error:&error];
                if (NO == success) {
                    if (error) {
                        AWSDDLogError(@"Failed to move backupItemURL directory(%@) to destinationURL(%@): %@" ,backupItemURL,destinationURL,error);
                    }
                    if ([self fileExistsAtPath:[destinationURL path]]) {
                        NSError *removeError = nil;
                        if (NO == [self removeItemAtURL:destinationURL error:&removeError]) {
                            AWSDDLogError(@"Failed to remove destinationURL(%@): %@",destinationURL,removeError);
                        }
                    }
                    
                }
            }
        }
    }
    
    NSError *error;
    if (![self removeItemAtURL:tempDir error:&error])
    {
        AWSDDLogError(@"Failed to remove temp(%@) directory after atomic copy: %@",tempDir,error);
    }
    
    return result;
}

@end
