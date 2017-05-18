// Software License Agreement (BSD License)
//
// Copyright (c) 2010-2016, Deusty, LLC
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

// Disable legacy macros
#ifndef AWSDD_LEGACY_MACROS
    #define AWSDD_LEGACY_MACROS 0
#endif

#import "AWSDDLog.h"

/**
 * Whether async should be used by log messages, excluding error messages that are always sent sync.
 **/
#ifndef AWSDD_LOG_ASYNC_ENABLED
    #define AWSDD_LOG_ASYNC_ENABLED YES
#endif

/**
 * These are the two macros that all other macros below compile into.
 * These big multiline macros makes all the other macros easier to read.
 **/
#define AWSDD_LOG_MACRO(isAsynchronous, lvl, flg, ctx, atag, fnct, frmt, ...) \
        [AWSDDLog log : isAsynchronous                                     \
             level : lvl                                                \
              flag : flg                                                \
           context : ctx                                                \
              file : __FILE__                                           \
          function : fnct                                               \
              line : __LINE__                                           \
               tag : atag                                               \
            format : (frmt), ## __VA_ARGS__]

#define LOG_MACRO_TO_AWSDDLOG(ddlog, isAsynchronous, lvl, flg, ctx, atag, fnct, frmt, ...) \
        [ddlog log : isAsynchronous                                     \
             level : lvl                                                \
              flag : flg                                                \
           context : ctx                                                \
              file : __FILE__                                           \
          function : fnct                                               \
              line : __LINE__                                           \
               tag : atag                                               \
            format : (frmt), ## __VA_ARGS__]

/**
 * Define version of the macro that only execute if the log level is above the threshold.
 * The compiled versions essentially look like this:
 *
 * if (logFlagForThisLogMsg & ddLogLevel) { execute log message }
 *
 * When LOG_LEVEL_DEF is defined as ddLogLevel.
 *
 * As shown further below, Lumberjack actually uses a bitmask as opposed to primitive log levels.
 * This allows for a great amount of flexibility and some pretty advanced fine grained logging techniques.
 *
 * Note that when compiler optimizations are enabled (as they are for your release builds),
 * the log messages above your logging threshold will automatically be compiled out.
 *
 * (If the compiler sees LOG_LEVEL_DEF/ddLogLevel declared as a constant, the compiler simply checks to see
 *  if the 'if' statement would execute, and if not it strips it from the binary.)
 *
 * We also define shorthand versions for asynchronous and synchronous logging.
 **/
#define AWSDD_LOG_MAYBE(async, lvl, flg, ctx, tag, fnct, frmt, ...) \
        do { AWSDD_LOG_MACRO(async, lvl, flg, ctx, tag, fnct, frmt, ##__VA_ARGS__); } while(0)

#define LOG_MAYBE_TO_AWSDDLOG(ddlog, async, lvl, flg, ctx, tag, fnct, frmt, ...) \
        do { LOG_MACRO_TO_AWSDDLOG(ddlog, async, lvl, flg, ctx, tag, fnct, frmt, ##__VA_ARGS__); } while(0)

/**
 * Ready to use log macros with no context or tag.
 **/
#define AWSDDLogError(frmt, ...)   AWSDD_LOG_MAYBE(NO,                [AWSDDLog sharedInstance].logLevel, AWSDDLogFlagError,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define AWSDDLogWarn(frmt, ...)    AWSDD_LOG_MAYBE(AWSDD_LOG_ASYNC_ENABLED, [AWSDDLog sharedInstance].logLevel, AWSDDLogFlagWarning, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define AWSDDLogInfo(frmt, ...)    AWSDD_LOG_MAYBE(AWSDD_LOG_ASYNC_ENABLED, [AWSDDLog sharedInstance].logLevel, AWSDDLogFlagInfo,    0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define AWSDDLogDebug(frmt, ...)   AWSDD_LOG_MAYBE(AWSDD_LOG_ASYNC_ENABLED, [AWSDDLog sharedInstance].logLevel, AWSDDLogFlagDebug,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define AWSDDLogVerbose(frmt, ...) AWSDD_LOG_MAYBE(AWSDD_LOG_ASYNC_ENABLED, [AWSDDLog sharedInstance].logLevel, AWSDDLogFlagVerbose, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)

#define AWSDDLogErrorToAWSDDLog(ddlog, frmt, ...)   LOG_MAYBE_TO_AWSDDLOG(ddlog, NO,                [AWSDDLog sharedInstance].logLevel, AWSDDLogFlagError,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define AWSDDLogWarnToAWSDDLog(ddlog, frmt, ...)    LOG_MAYBE_TO_AWSDDLOG(ddlog, AWSDD_LOG_ASYNC_ENABLED, [AWSDDLog sharedInstance].logLevel, AWSDDLogFlagWarning, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define AWSDDLogInfoToAWSDDLog(ddlog, frmt, ...)    LOG_MAYBE_TO_AWSDDLOG(ddlog, AWSDD_LOG_ASYNC_ENABLED, [AWSDDLog sharedInstance].logLevel, AWSDDLogFlagInfo,    0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define AWSDDLogDebugToAWSDDLog(ddlog, frmt, ...)   LOG_MAYBE_TO_AWSDDLOG(ddlog, AWSDD_LOG_ASYNC_ENABLED, [AWSDDLog sharedInstance].logLevel, AWSDDLogFlagDebug,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
#define AWSDDLogVerboseToAWSDDLog(ddlog, frmt, ...) LOG_MAYBE_TO_AWSDDLOG(ddlog, AWSDD_LOG_ASYNC_ENABLED, [AWSDDLog sharedInstance].logLevel, AWSDDLogFlagVerbose, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
