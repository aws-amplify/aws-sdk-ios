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

#import <Foundation/Foundation.h>

#define AWSLogFormat @"%@ line:%d | %s | "

#define AWSLogError(fmt, ...)    [[AWSLogger defaultLogger] log:AWSLogLevelError format:(AWSLogFormat fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__]
#define AWSLogWarn(fmt, ...)    [[AWSLogger defaultLogger] log:AWSLogLevelWarn format:(AWSLogFormat fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__]
#define AWSLogInfo(fmt, ...)    [[AWSLogger defaultLogger] log:AWSLogLevelInfo format:(AWSLogFormat fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__]
#define AWSLogDebug(fmt, ...)    [[AWSLogger defaultLogger] log:AWSLogLevelDebug format:(AWSLogFormat fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__]
#define AWSLogVerbose(fmt, ...)    [[AWSLogger defaultLogger] log:AWSLogLevelVerbose format:(AWSLogFormat fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__]

typedef NS_ENUM(NSInteger, AWSLogLevel) {
    AWSLogLevelUnknown = -1,
    AWSLogLevelNone = 0,
    AWSLogLevelError = 1,
    AWSLogLevelWarn = 2,
    AWSLogLevelInfo = 3,
    AWSLogLevelDebug = 4,
    AWSLogLevelVerbose = 5
};

/**
 `AWSLogger` is an utility class that handles logging to the console. Changing log levels during development may make debugging easier. You can change the log level by importing `AWSCore.h` and calling:

 *Swift*

     AWSLogger.defaultLogger().logLevel = .None

 The following logging level options are available:

     .None
     .Error
     .Warn
     .Info
     .Debug (This is the default.)
     .Verbose

 *Objective-C*

     [AWSLogger defaultLogger].logLevel = AWSLogLevelNone;

 The following logging level options are available:

     AWSLogLevelNone
     AWSLogLevelError
     AWSLogLevelWarn
     AWSLogLevelInfo
     AWSLogLevelDebug (This is the default.)
     AWSLogLevelVerbose

 @note We recommend setting the log level to `None` before publishing to the Apple App Store.
 */
@interface AWSLogger : NSObject

/**
 The log level setting. The default value is `Debug`.
 */
@property (atomic, assign) AWSLogLevel logLevel;

/**
 Returns the shared logger object.

 @return The shared logger object.
 */
+ (instancetype)defaultLogger;

/**
 Prints out the formatted logs to the console. You can use the following predefined shorthand methods instead:

     AWSLogError(fmt, ...)
     AWSLogWarn(fmt, ...)
     AWSLogInfo(fmt, ...)
     AWSLogDebug(fmt, ...)
     AWSLogVerbose(fmt, ...)

 @param logLevel The level of this log.
 @param fmt      The formatted string to log.
 */
- (void)log:(AWSLogLevel)logLevel
     format:(NSString *)fmt, ... NS_FORMAT_FUNCTION(2, 3);

@end
