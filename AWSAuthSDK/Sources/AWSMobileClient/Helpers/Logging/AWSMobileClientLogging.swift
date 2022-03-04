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

    static func verbose(
        _ message: String,
        file: StaticString = #file,
        function: StaticString = #function,
        line: Int = #line
    ) {
        logMessage(
            message,
            level: .verbose,
            flag: .verbose,
            file: file,
            function: function,
            line: line
        )
    }
    
    static func error(
        _ message: String,
        file: StaticString = #file,
        function: StaticString = #function,
        line: Int = #line
    ) {
        logMessage(
            message,
            level: .error,
            flag: .error,
            file: file,
            function: function,
            line: line
        )
    }
    
    static func warning(
        _ message: String,
        file: StaticString = #file,
        function: StaticString = #function,
        line: Int = #line
    ) {
        logMessage(
            message,
            level: .warning,
            flag: .warning,
            file: file,
            function: function,
            line: line
        )
    }
    
    static func info(
        _ message: String,
        file: StaticString = #file,
        function: StaticString = #function,
        line: Int = #line
    ) {
        logMessage(
            message,
            level: .info,
            flag: .info,
            file: file,
            function: function,
            line: line
        )
    }

    static func logMessage(
        _ message: String,
        level: AWSDDLogLevel,
        flag: AWSDDLogFlag,
        file: StaticString,
        function: StaticString,
        line: Int
    ) {
        let fileStr = "\(file)"
        let functionStr = "\(function)"
        AWSDDLog.log(asynchronous: false,
                     level: level,
                     flag: flag,
                     context: 0,
                     file: fileStr.cString(using: .utf8) ?? [],
                     function: functionStr.cString(using: .utf8) ?? [],
                     line: UInt(line),
                     tag: nil,
                     format: message,
                     arguments: getVaList([]))
    }
}
