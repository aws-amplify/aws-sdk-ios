// Software License Agreement (BSD License)
//
// Copyright (c) 2010-2024, Deusty, LLC
// All rights reserved.
//
// Redistribution and use of this software in source and binary forms,
// with or without modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//
// * Neither the name of Deusty nor the names of its contributors may be used
//   to endorse or promote products derived from this software without specific
//   prior written permission of Deusty, LLC.

#import <TargetConditionals.h>

#if !TARGET_OS_WATCH

#if !__has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import <asl.h>

#import "AWSDDASLLogger.h"

const char* const kAWSDDASLKeyAWSDDLog = "AWSDDLog";
const char* const kAWSDDASLAWSDDLogValue = "1";

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
static AWSDDASLLogger *sharedInstance;
#pragma clang diagnostic pop

@interface AWSDDASLLogger () {
    aslclient _client;
}

@end


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
@implementation AWSDDASLLogger
#pragma clang diagnostic pop

+ (instancetype)sharedInstance {
    static dispatch_once_t AWSDDASLLoggerOnceToken;

    dispatch_once(&AWSDDASLLoggerOnceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });

    return sharedInstance;
}

- (instancetype)init {
    if (sharedInstance != nil) {
        return nil;
    }

    if ((self = [super init])) {
        // A default asl client is provided for the main thread,
        // but background threads need to create their own client.

        _client = asl_open(NULL, "com.apple.console", 0);
    }

    return self;
}

- (AWSDDLoggerName)loggerName {
    return AWSDDLoggerNameASL;
}

- (void)logMessage:(AWSDDLogMessage *)logMessage {
    // Skip captured log messages
    if ([logMessage->_fileName isEqualToString:@"AWSDDASLLogCapture"]) {
        return;
    }

    __auto_type message = _logFormatter ? [_logFormatter formatLogMessage:logMessage] : logMessage->_message;

    if (message) {
        __auto_type msg = [message UTF8String];

        size_t aslLogLevel;
        switch (logMessage->_flag) {
            // Note: By default ASL will filter anything above level 5 (Notice).
            // So our mappings shouldn't go above that level.
            case AWSDDLogFlagError     : aslLogLevel = ASL_LEVEL_CRIT;     break;
            case AWSDDLogFlagWarning   : aslLogLevel = ASL_LEVEL_ERR;      break;
            case AWSDDLogFlagInfo      : aslLogLevel = ASL_LEVEL_WARNING;  break; // Regular NSLog's level
            case AWSDDLogFlagDebug     :
            case AWSDDLogFlagVerbose   :
            default                 : aslLogLevel = ASL_LEVEL_NOTICE;   break;
        }

        static char const *const level_strings[] = { "0", "1", "2", "3", "4", "5", "6", "7" };

        // NSLog uses the current euid to set the ASL_KEY_READ_UID.
        const __auto_type readUID = geteuid();

        char readUIDString[16];
#ifndef NS_BLOCK_ASSERTIONS
        __auto_type l = (size_t)snprintf(readUIDString, sizeof(readUIDString), "%d", readUID);
#else
        snprintf(readUIDString, sizeof(readUIDString), "%d", readUID);
#endif

        NSAssert(l < sizeof(readUIDString),
                 @"Formatted euid is too long.");
        NSAssert(aslLogLevel < (sizeof(level_strings) / sizeof(level_strings[0])),
                 @"Unhandled ASL log level.");

        __auto_type m = asl_new(ASL_TYPE_MSG);
        if (m != NULL) {
            if (asl_set(m, ASL_KEY_LEVEL, level_strings[aslLogLevel]) == 0 &&
                asl_set(m, ASL_KEY_MSG, msg) == 0 &&
                asl_set(m, ASL_KEY_READ_UID, readUIDString) == 0 &&
                asl_set(m, kAWSDDASLKeyAWSDDLog, kAWSDDASLAWSDDLogValue) == 0) {
                asl_send(_client, m);
            }
            asl_free(m);
        }
        //TODO handle asl_* failures non-silently?
    }
}

@end

#endif
