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

#import <Foundation/Foundation.h>

#define AZLogFormat @"%@ line:%d|%s|"

#define AZLogError(fmt, ...)    [[AZLogger defaultLogger] log:AZLogLevelError format:(AZLogFormat fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__]
#define AZLogWarn(fmt, ...)    [[AZLogger defaultLogger] log:AZLogLevelWarn format:(AZLogFormat fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__]
#define AZLogInfo(fmt, ...)    [[AZLogger defaultLogger] log:AZLogLevelInfo format:(AZLogFormat fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__]
#define AZLogDebug(fmt, ...)    [[AZLogger defaultLogger] log:AZLogLevelDebug format:(AZLogFormat fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__]
#define AZLogVerbose(fmt, ...)    [[AZLogger defaultLogger] log:AZLogLevelVerbose format:(AZLogFormat fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__]


typedef NS_ENUM(NSInteger, AZLogLevel) {
    AZLogLevelUnknown = -1,
    AZLogLevelNone = 0,
    AZLogLevelError = 1,
    AZLogLevelWarn = 2,
    AZLogLevelInfo = 3,
    AZLogLevelDebug = 4,
    AZLogLevelVerbose = 5
};

/**
 *  AZLogger is an utility class that handles logging to the console.
 *  You can specify the log level to control how verbose the output will be.
 */
@interface AZLogger : NSObject

/**
 *  The log level setting. The default is AZLogLevelNone.
 */
@property (atomic, assign) AZLogLevel logLevel;

/**
 *  Returns the shared logger object.
 *
 *  @return The shared logger object.
 */
+ (instancetype)defaultLogger;

/**
 *  Prints out the formatted logs to the console.
 *
 *  @param logLevel The level of this log.
 *  @param fmt      The formatted string to log.
 */
- (void)log:(AZLogLevel)logLevel
     format:(NSString *)fmt, ... NS_FORMAT_FUNCTION(2, 3);

@end
