//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSMobileAnalyticsStringUtils.h"

@implementation AWSMobileAnalyticsStringUtils

+(BOOL) isBlank:(NSString *) theString
{
    if(theString == nil || [theString length] == 0)
    {
        return YES;
    }
    
    return ([[theString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0);
}

+(BOOL) isNotBlank:(NSString *) theString
{
    return ![AWSMobileAnalyticsStringUtils isBlank:theString];
}

+ (NSString *)clipString:(NSString*)theString
              toMaxChars:(unsigned int)maxChars
       andAppendEllipses:(BOOL)appendEllipses
{
    if(theString == nil)
    {
        return nil;
    }
    double numChars = maxChars;
    double stringLength = [theString length];
    
    int end = fmin(numChars, stringLength);
    NSMutableString* output = [NSMutableString stringWithString:[theString substringToIndex:end]];
    if(appendEllipses)
    {
        // add an ellipse if the string has been clipped
        if([output length] < [theString length])
        {
            [output appendString:@"..."];
        }
    }
    return output;
}

+ (NSString *) trimString: (NSString *) origin_string
                 toLength: (int) target_length
                orPadWith: (char)       pad_char
{
    if (target_length < 1)
    {
        return @"";
    }
    if (! origin_string)
    {
        origin_string = @"";
    }
    
    NSUInteger str_len = [origin_string length];
    if (str_len > target_length - 1)
    {
        return [origin_string substringFromIndex: str_len - target_length];
    }
    
    NSMutableString *padding = [NSMutableString stringWithCapacity: target_length-str_len];
    for (int i = 0; i < (target_length-str_len); i++)
    {
        [padding appendFormat:@"%c", pad_char];
    }
    return [NSString stringWithFormat:@"%@%@", padding, origin_string];
}

+(NSString *) appendTo:(NSString *) theFirstString
             theString:(NSString *) theSecondString
{
    if(theFirstString == nil)
    {
        return theSecondString;
    }
    if(theSecondString == nil)
    {
        return theFirstString;
    }
    NSMutableString *str = [NSMutableString stringWithString:theFirstString];
    [str appendString:theSecondString];
    return str;
}

+(NSString *) appendTo:(NSString *) theFirstString
             theString:(NSString *) theSecondString
            withFormat:(NSString *) theFormat
{
    
    NSMutableString *str = [NSMutableString stringWithString:theFirstString];
    [str appendFormat:theFormat, theSecondString];
    return str;
}

+ (NSString *) dataToString: (NSData *) theData
{
    if(theData == nil)
    {
        return [NSString string];
    }
    
    return [[NSString alloc] initWithData:theData
                                 encoding:NSUTF8StringEncoding];
}

+ (BOOL) stringToFloat:(NSString *) theString withFloat:(float*) theValue
{
    if(theString != nil && theValue != nil)
    {
        NSScanner* scanner = [NSScanner scannerWithString:theString];
        BOOL success = [scanner scanFloat:theValue];
        if (success)
        {
            if(*theValue > FLT_MAX)
            {
                *theValue = FLT_MAX;
            }
            else if(*theValue < FLT_MIN)
            {
                *theValue = FLT_MIN;
            }
            return YES;
        }
    }
    return NO;
}

+ (BOOL) stringToDouble:(NSString *) theString withDouble:(double *) theValue
{
    if(theString != nil && theValue != nil)
    {
        NSScanner* scanner = [NSScanner scannerWithString:theString];
        BOOL success = [scanner scanDouble:theValue];
        if (success)
        {
            if(*theValue > DBL_MAX)
            {
                *theValue = DBL_MAX;
            }
            else if(*theValue < DBL_MIN)
            {
                *theValue = DBL_MIN;
            }
            return YES;
        }
    }
    return NO;
}

+ (BOOL) stringToInt:(NSString *) theString withInt:(int *) theValue
{
    if(theString != nil && theValue != nil)
    {
        NSScanner* scanner = [NSScanner scannerWithString:theString];
        BOOL success = [scanner scanInt:theValue];
        if (success)
        {
            if(*theValue > INT_MAX)
            {
                *theValue = INT_MAX;
            }
            else if(*theValue < INT_MIN)
            {
                *theValue = INT_MIN;
            }
            return YES;
        }
    }
    return NO;
}

+ (BOOL) stringToLongLong:(NSString *) theString withLongLong:(long long*) theValue
{
    if(theString != nil && theValue != nil)
    {
        NSScanner* scanner = [NSScanner scannerWithString:theString];
        BOOL success = [scanner scanLongLong:theValue];
        if (success)
        {
            if(*theValue > LONG_LONG_MAX)
            {
                *theValue = LONG_LONG_MAX;
            }
            else if(*theValue < LONG_LONG_MIN)
            {
                *theValue = LONG_LONG_MIN;
            }
            return YES;
        }
    }
    return NO;
}

+ (BOOL) stringToBool:(NSString *) theString withBool:(BOOL*) theValue
{
    if(theString != nil && theValue != nil)
    {
        if ([@"true" isEqualToString:[theString lowercaseString]])
        {
            *theValue = YES;
            return YES;
        }
        else if ([@"false" isEqualToString:[theString lowercaseString]])
        {
            *theValue = NO;
            return YES;
        }
        else if ([@"yes" isEqualToString:[theString lowercaseString]])
        {
            *theValue = YES;
            return YES;
        }
        else if ([@"no" isEqualToString:[theString lowercaseString]])
        {
            *theValue = NO;
            return YES;
        }
        else if ([@"1" isEqualToString:[theString lowercaseString]])
        {
            *theValue = YES;
            return YES;
        }
        else if ([@"0" isEqualToString:[theString lowercaseString]])
        {
            *theValue = NO;
            return YES;
        }
        return NO;
    }
    return NO;
}

@end
