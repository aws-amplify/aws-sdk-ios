//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

import AWSCore

/// Based on the macros defined in AWSDDLogMacros.h
struct AWSLocationTrackerLogger {
    
    static func error(_ message: String, file: String = #file, function: String = #function, line: UInt = #line) {
        let message = getAWSDDLogMessage(message, logFlag: AWSDDLogFlag.error, file: file, function: function, line: line)
        // error messages are always sent sync.
        AWSDDLog.sharedInstance.log(asynchronous: false, message: message)
    }
    
    static func warning(_ message: String, file: String = #file, function: String = #function, line: UInt = #line) {
        let message = getAWSDDLogMessage(message, logFlag: AWSDDLogFlag.warning, file: file, function: function, line: line)
        AWSDDLog.sharedInstance.log(asynchronous: true, message: message)
    }
    
    static func info(_ message: String, file: String = #file, function: String = #function, line: UInt = #line) {
        let message = getAWSDDLogMessage(message, logFlag: AWSDDLogFlag.info, file: file, function: function, line: line)
        AWSDDLog.sharedInstance.log(asynchronous: true, message: message)
    }
    
    static func debug(_ message: String, file: String = #file, function: String = #function, line: UInt = #line) {
        let message = getAWSDDLogMessage(message, logFlag: AWSDDLogFlag.debug, file: file, function: function, line: line)
        AWSDDLog.sharedInstance.log(asynchronous: true, message: message)
    }
    
    static func verbose(_ message: String, file: String = #file, function: String = #function, line: UInt = #line) {
        let message = getAWSDDLogMessage(message, logFlag: AWSDDLogFlag.verbose, file: file, function: function, line: line)
        AWSDDLog.sharedInstance.log(asynchronous: true, message: message)
    }
    
    private static func getAWSDDLogMessage(_ message: String,
                                           logFlag: AWSDDLogFlag,
                                           file: String,
                                           function: String,
                                           line: UInt) -> AWSDDLogMessage {
        AWSDDLogMessage(message: message,
                        level: AWSDDLog.sharedInstance.logLevel,
                        flag: logFlag,
                        context: 0,
                        file: file,
                        function: function,
                        line: line,
                        tag: nil,
                        timestamp: nil)
    }
}
