//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

import Foundation

public extension AWSDDLog {

    /**
     * Adds the logger to the system.
     *
     * This is equivalent to invoking `[AWSDDLog addLogger:logger withLogLevel:AWSDDLogLevelAll]`.
     */
    @available(*, deprecated, message: "Providing a nil logger will fail silently. Use add(_:) with a non-optional logger instead.")
    static func add(_ logger: AWSDDLogger?) {
        if let logger = logger {
            add(logger)
        }
    }

    /**
     * Adds the logger to the system.
     *
     * The level that you provide here is a preemptive filter (for performance).
     * That is, the level specified here will be used to filter out logMessages so that
     * the logger is never even invoked for the messages.
     *
     * More information:
     * When you issue a log statement, the logging framework iterates over each logger,
     * and checks to see if it should forward the logMessage to the logger.
     * This check is done using the level parameter passed to this method.
     *
     * For example:
     *
     * `[AWSDDLog addLogger:consoleLogger withLogLevel:AWSDDLogLevelVerbose];`
     * `[AWSDDLog addLogger:fileLogger    withLogLevel:AWSDDLogLevelWarning];`
     *
     * `AWSDDLogError(@"oh no");` => gets forwarded to consoleLogger & fileLogger
     * `AWSDDLogInfo(@"hi");`     => gets forwarded to consoleLogger only
     *
     * It is important to remember that Lumberjack uses a BITMASK.
     * Many developers & third party frameworks may define extra log levels & flags.
     * For example:
     *
     * `#define SOME_FRAMEWORK_LOG_FLAG_TRACE (1 << 6) // 0...1000000`
     *
     * So if you specify `AWSDDLogLevelVerbose` to this method, you won't see the framework's trace messages.
     *
     * `(SOME_FRAMEWORK_LOG_FLAG_TRACE & AWSDDLogLevelVerbose) => (01000000 & 00011111) => NO`
     *
     * Consider passing `AWSDDLogLevelAll` to this method, which has all bits set.
     * You can also use the exclusive-or bitwise operator to get a bitmask that has all flags set,
     * except the ones you explicitly don't want. For example, if you wanted everything except verbose & debug:
     *
     * `((AWSDDLogLevelAll ^ AWSDDLogLevelVerbose) | AWSDDLogLevelInfo)`
     */
    @available(*, deprecated, message: "Providing a nil logger will fail silently. Use add(_:with:) with a non-optional logger instead.")
    class func add(_ logger: AWSDDLogger?, with level: AWSDDLogLevel) {
        if let logger = logger {
            add(logger, with: level)
        }
    }

    /**
     * Adds the logger to the system.
     *
     * This is equivalent to invoking `[AWSDDLog addLogger:logger withLogLevel:AWSDDLogLevelAll]`.
     */
    @available(*, deprecated, message: "Providing a nil logger will fail silently. Use add(_:) with a non-optional logger instead.")
    func add(_ logger: AWSDDLogger?) {
        if let logger = logger {
            add(logger)
        }
    }

    /**
     * Adds the logger to the system.
     *
     * The level that you provide here is a preemptive filter (for performance).
     * That is, the level specified here will be used to filter out logMessages so that
     * the logger is never even invoked for the messages.
     *
     * More information:
     * When you issue a log statement, the logging framework iterates over each logger,
     * and checks to see if it should forward the logMessage to the logger.
     * This check is done using the level parameter passed to this method.
     *
     * For example:
     *
     * `[AWSDDLog addLogger:consoleLogger withLogLevel:AWSDDLogLevelVerbose];`
     * `[AWSDDLog addLogger:fileLogger    withLogLevel:AWSDDLogLevelWarning];`
     *
     * `AWSDDLogError(@"oh no");` => gets forwarded to consoleLogger & fileLogger
     * `AWSDDLogInfo(@"hi");`     => gets forwarded to consoleLogger only
     *
     * It is important to remember that Lumberjack uses a BITMASK.
     * Many developers & third party frameworks may define extra log levels & flags.
     * For example:
     *
     * `#define SOME_FRAMEWORK_LOG_FLAG_TRACE (1 << 6) // 0...1000000`
     *
     * So if you specify `AWSDDLogLevelVerbose` to this method, you won't see the framework's trace messages.
     *
     * `(SOME_FRAMEWORK_LOG_FLAG_TRACE & AWSDDLogLevelVerbose) => (01000000 & 00011111) => NO`
     *
     * Consider passing `AWSDDLogLevelAll` to this method, which has all bits set.
     * You can also use the exclusive-or bitwise operator to get a bitmask that has all flags set,
     * except the ones you explicitly don't want. For example, if you wanted everything except verbose & debug:
     *
     * `((AWSDDLogLevelAll ^ AWSDDLogLevelVerbose) | AWSDDLogLevelInfo)`
     */
    @available(*, deprecated, message: "Providing a nil logger will fail silently. Use add(_:with:) with a non-optional logger instead.")
    func add(_ logger: AWSDDLogger?, with level: AWSDDLogLevel) {
        if let logger = logger {
            add(logger, with: level)
        }
    }
}
