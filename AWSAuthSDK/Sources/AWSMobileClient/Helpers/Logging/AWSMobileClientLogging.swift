//
// Copyright 2017-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
import AWSCore

struct AWSMobileClientLogging {

    static func verbose(_ message: String) {
        logMessage(message,
                   level: .verbose,
                   flag: .verbose)
    }

    static func error(_ message: String) {
        logMessage(message,
                   level: .error,
                   flag: .error)
    }

    static func warning(_ message: String) {
        logMessage(message,
                   level: .warning,
                   flag: .warning)
    }

    static func info(_ message: String) {
        logMessage(message,
                   level: .info,
                   flag: .info)
    }

    static func debug(_ message: String) {
        logMessage(message,
                   level: .debug,
                   flag: .debug)
    }

    static func logMessage(_ message: String, level: AWSDDLogLevel, flag: AWSDDLogFlag) {
        AWSDDLog.log(asynchronous: false,
                     level: level,
                     flag: flag,
                     context: 0,
                     file: #file,
                     function: #function,
                     line: #line,
                     tag: nil,
                     format: message,
                     arguments: getVaList([]))
    }
}
