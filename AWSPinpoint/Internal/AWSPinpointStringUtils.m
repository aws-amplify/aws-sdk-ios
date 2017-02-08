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

#import "AWSPinpointStringUtils.h"

@implementation AWSPinpointStringUtils

+ (NSString *)clipString:(NSString*) theString
              toMaxChars:(unsigned int) maxChars
       andAppendEllipses:(BOOL) appendEllipses {
    if(theString == nil) {
        return nil;
    }
    double numChars = maxChars;
    double stringLength = [theString length];
    
    int end = fmin(numChars, stringLength);
    NSMutableString* output = [NSMutableString stringWithString:[theString substringToIndex:end]];
    if(appendEllipses) {
        // add an ellipse if the string has been clipped
        if([output length] < [theString length]) {
            [output appendString:@"..."];
        }
    }
    return output;
}

+ (NSString *) trimString:(NSString *) origin_string
                 toLength:(int) target_length
                orPadWith:(char) pad_char {
    if (target_length < 1) {
        return @"";
    }
    if (! origin_string) {
        origin_string = @"";
    }
    
    NSUInteger str_len = [origin_string length];
    if (str_len > target_length - 1) {
        return [origin_string substringFromIndex: str_len - target_length];
    }
    
    NSMutableString *padding = [NSMutableString stringWithCapacity: target_length-str_len];
    for (int i = 0; i < (target_length-str_len); i++) {
        [padding appendFormat:@"%c", pad_char];
    }
    return [NSString stringWithFormat:@"%@%@", padding, origin_string];
}

@end
