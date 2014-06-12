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

#import "AZLogging.h"

@implementation AZLogger

- (instancetype)init {
    if (self = [super init]) {
        _logLevel = AZLogLevelNone;
    }

    return self;
}

+ (instancetype)defaultLogger {
    static AZLogger *_defaultLogger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultLogger = [AZLogger new];
    });

    return _defaultLogger;
}

- (void)log:(AZLogLevel)logLevel format:(NSString *)fmt, ... NS_FORMAT_FUNCTION(2, 3) {
    if(self.logLevel >= logLevel) {
        va_list args;
        va_start(args, fmt);
        NSLog(@"%@/%@", [self logLevelLabel:logLevel], [[NSString alloc] initWithFormat:fmt arguments:args]);
        va_end(args);
    }
}

- (NSString *)logLevelLabel:(AZLogLevel)logLevel {
    switch (logLevel) {
        case AZLogLevelError:
            return @"E";

        case AZLogLevelWarn:
            return @"W";

        case AZLogLevelInfo:
            return @"I";

        case AZLogLevelDebug:
            return @"D";

        case AZLogLevelVerbose:
            return @"V";

        case AZLogLevelUnknown:
        case AZLogLevelNone:
        default:
            return @"?";
    }
}

@end
