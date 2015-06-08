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

#import "AWSLogging.h"

@implementation AWSLogger

- (instancetype)init {
    if (self = [super init]) {
        _logLevel = AWSLogLevelNone;
    }

    return self;
}

+ (instancetype)defaultLogger {
    static AWSLogger *_defaultLogger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultLogger = [AWSLogger new];
        _defaultLogger.logLevel = AWSLogLevelError; //set default logLevel
    });

    return _defaultLogger;
}

- (void)log:(AWSLogLevel)logLevel format:(NSString *)fmt, ... NS_FORMAT_FUNCTION(2, 3) {
    if(self.logLevel >= logLevel) {
        va_list args;
        va_start(args, fmt);
        NSLog(@"AWSiOSSDKv2 [%@] %@", [self logLevelLabel:logLevel], [[NSString alloc] initWithFormat:fmt arguments:args]);
        va_end(args);
    }
}

- (NSString *)logLevelLabel:(AWSLogLevel)logLevel {
    switch (logLevel) {
        case AWSLogLevelError:
            return @"Error";

        case AWSLogLevelWarn:
            return @"Warn";

        case AWSLogLevelInfo:
            return @"Info";

        case AWSLogLevelDebug:
            return @"Debug";

        case AWSLogLevelVerbose:
            return @"Verbose";

        case AWSLogLevelUnknown:
        case AWSLogLevelNone:
        default:
            return @"?";
    }
}

@end
