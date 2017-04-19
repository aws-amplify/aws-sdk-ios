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

#define LOG_CONTEXT_ALL INT_MAX

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
#if !(TARGET_OS_OSX)
    // iOS or tvOS or watchOS
    #import <UIKit/UIColor.h>
    typedef UIColor AWSDDColor;
    static inline AWSDDColor* AWSDDMakeColor(CGFloat r, CGFloat g, CGFloat b) {return [AWSDDColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1.0f];}
#elif defined(AWSDD_CLI) || !__has_include(<AppKit/NSColor.h>)
    // OS X CLI
    #import "CLIColor.h"
    typedef CLIColor AWSDDColor;
    static inline AWSDDColor* AWSDDMakeColor(CGFloat r, CGFloat g, CGFloat b) {return [AWSDDColor colorWithCalibratedRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1.0f];}
#else
    // OS X with AppKit
    #import <AppKit/NSColor.h>
    typedef NSColor AWSDDColor;
    static inline AWSDDColor* AWSDDMakeColor(CGFloat r, CGFloat g, CGFloat b) {return [AWSDDColor colorWithCalibratedRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1.0f];}
#endif
#pragma clang diagnostic pop


/**
 * This class provides a logger for Terminal output or Xcode console output,
 * depending on where you are running your code.
 *
 * As described in the "Getting Started" page,
 * the traditional NSLog() function directs it's output to two places:
 *
 * - Apple System Log (so it shows up in Console.app)
 * - StdErr (if stderr is a TTY, so log statements show up in Xcode console)
 *
 * To duplicate NSLog() functionality you can simply add this logger and an asl logger.
 * However, if you instead choose to use file logging (for faster performance),
 * you may choose to use only a file logger and a tty logger.
 **/
@interface AWSDDTTYLogger : AWSDDAbstractLogger <AWSDDLogger>

/**
 *  Singleton method
 */
@property (class, readonly, strong) AWSDDTTYLogger *sharedInstance;

/* Inherited from the AWSDDLogger protocol:
 *
 * Formatters may optionally be added to any logger.
 *
 * If no formatter is set, the logger simply logs the message as it is given in logMessage,
 * or it may use its own built in formatting style.
 *
 * More information about formatters can be found here:
 * Documentation/CustomFormatters.md
 *
 * The actual implementation of these methods is inherited from AWSDDAbstractLogger.

   - (id <AWSDDLogFormatter>)logFormatter;
   - (void)setLogFormatter:(id <AWSDDLogFormatter>)formatter;

 */

/**
 * Want to use different colors for different log levels?
 * Enable this property.
 *
 * If you run the application via the Terminal (not Xcode),
 * the logger will map colors to xterm-256color or xterm-color (if available).
 *
 * Xcode does NOT natively support colors in the Xcode debugging console.
 * You'll need to install the XcodeColors plugin to see colors in the Xcode console.
 * https://github.com/robbiehanson/XcodeColors
 *
 * The default value is NO.
 **/
@property (readwrite, assign) BOOL colorsEnabled;

/**
 * When using a custom formatter you can set the `logMessage` method not to append
 * `\n` character after each output. This allows for some greater flexibility with
 * custom formatters. Default value is YES.
 **/
@property (nonatomic, readwrite, assign) BOOL automaticallyAppendNewlineForCustomFormatters;

/**
 * The default color set (foregroundColor, backgroundColor) is:
 *
 * - AWSDDLogFlagError   = (red, nil)
 * - AWSDDLogFlagWarning = (orange, nil)
 *
 * You can customize the colors however you see fit.
 * Please note that you are passing a flag, NOT a level.
 *
 * GOOD : [ttyLogger setForegroundColor:pink backgroundColor:nil forFlag:AWSDDLogFlagInfo];  // <- Good :)
 *  BAD : [ttyLogger setForegroundColor:pink backgroundColor:nil forFlag:AWSDDLogLevelInfo]; // <- BAD! :(
 *
 * AWSDDLogFlagInfo  = 0...00100
 * AWSDDLogLevelInfo = 0...00111 <- Would match AWSDDLogFlagInfo and AWSDDLogFlagWarning and AWSDDLogFlagError
 *
 * If you run the application within Xcode, then the XcodeColors plugin is required.
 *
 * If you run the application from a shell, then AWSDDTTYLogger will automatically map the given color to
 * the closest available color. (xterm-256color or xterm-color which have 256 and 16 supported colors respectively.)
 *
 * This method invokes setForegroundColor:backgroundColor:forFlag:context: and applies it to `LOG_CONTEXT_ALL`.
 **/
- (void)setForegroundColor:(AWSDDColor *)txtColor backgroundColor:(AWSDDColor *)bgColor forFlag:(AWSDDLogFlag)mask;

/**
 * Just like setForegroundColor:backgroundColor:flag, but allows you to specify a particular logging context.
 *
 * A logging context is often used to identify log messages coming from a 3rd party framework,
 * although logging context's can be used for many different functions.
 *
 * Use LOG_CONTEXT_ALL to set the deafult color for all contexts that have no specific color set defined.
 *
 * Logging context's are explained in further detail here:
 * Documentation/CustomContext.md
 **/
- (void)setForegroundColor:(AWSDDColor *)txtColor backgroundColor:(AWSDDColor *)bgColor forFlag:(AWSDDLogFlag)mask context:(NSInteger)ctxt;

/**
 * Similar to the methods above, but allows you to map AWSDDLogMessage->tag to a particular color profile.
 * For example, you could do something like this:
 *
 * static NSString *const PurpleTag = @"PurpleTag";
 *
 * #define AWSDDLogPurple(frmt, ...) LOG_OBJC_TAG_MACRO(NO, 0, 0, 0, PurpleTag, frmt, ##__VA_ARGS__)
 * 
 * And then where you configure CocoaLumberjack:
 *
 * purple = AWSDDMakeColor((64/255.0), (0/255.0), (128/255.0));
 *
 * or any UIColor/NSColor constructor.
 *
 * Note: For CLI OS X projects that don't link with AppKit use CLIColor objects instead
 *
 * [[AWSDDTTYLogger sharedInstance] setForegroundColor:purple backgroundColor:nil forTag:PurpleTag];
 * [AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]];
 *
 * This would essentially give you a straight NSLog replacement that prints in purple:
 *
 * AWSDDLogPurple(@"I'm a purple log message!");
 **/
- (void)setForegroundColor:(AWSDDColor *)txtColor backgroundColor:(AWSDDColor *)bgColor forTag:(id <NSCopying>)tag;

/**
 * Clearing color profiles.
 **/
- (void)clearColorsForFlag:(AWSDDLogFlag)mask;
- (void)clearColorsForFlag:(AWSDDLogFlag)mask context:(NSInteger)context;
- (void)clearColorsForTag:(id <NSCopying>)tag;
- (void)clearColorsForAllFlags;
- (void)clearColorsForAllTags;
- (void)clearAllColors;

@end
