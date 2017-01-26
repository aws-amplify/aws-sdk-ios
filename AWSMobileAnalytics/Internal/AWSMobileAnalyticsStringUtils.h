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

#import <Foundation/Foundation.h>

@interface AWSMobileAnalyticsStringUtils : NSObject

+(BOOL) isBlank:(NSString *) theString;

+(BOOL) isNotBlank:(NSString *) theString;

+ (NSString *) trimString: (NSString *) origin_string
                 toLength: (int) target_length
                orPadWith: (char)       pad_char;

+ (NSString *) appendTo:(NSString *) theFirstString
              theString:(NSString *) theSecondString;

+ (NSString *) appendTo:(NSString *) theFirstString
              theString:(NSString *) theSecondString
             withFormat:(NSString *) theFormat;

+ (NSString *) dataToString: (NSData *) theData;

+ (NSString *)clipString:(NSString*)theString
              toMaxChars:(unsigned int)maxChars
       andAppendEllipses:(BOOL)appendEllipses;

+ (BOOL) stringToDouble:(NSString *) theString withDouble:(double *) theValue;

+ (BOOL) stringToFloat:(NSString *) theString withFloat:(float *) theValue;

+ (BOOL) stringToInt:(NSString *) theString withInt:(int *) theValue
;

+ (BOOL) stringToLongLong:(NSString *) theString withLongLong:(long long*) theValue;

+ (BOOL) stringToBool:(NSString *) theString withBool:(BOOL*) theValue;

@end
