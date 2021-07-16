//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

import AWSIoT

struct MQTTStatusCallBackWrapper {
    typealias BasicClosure = () -> Void
    let onConnecting: BasicClosure?
    let onConnected: BasicClosure?
    let onDisconnected: BasicClosure?
    let onConnectionRefused: BasicClosure?
    let onConnectionError: BasicClosure?
    let onProtocolError: BasicClosure?
    let onDefault: BasicClosure?

    init(onConnecting: BasicClosure? = nil,
         onConnected: BasicClosure? = nil,
         onDisconnected: BasicClosure? = nil,
         onConnectionRefused: BasicClosure? = nil,
         onConnectionError: BasicClosure? = nil,
         onProtocolError: BasicClosure? = nil,
         onDefault: BasicClosure? = nil) {
        self.onConnecting = onConnecting
        self.onConnected = onConnected
        self.onDisconnected = onDisconnected
        self.onConnectionRefused = onConnectionRefused
        self.onConnectionError = onConnectionError
        self.onProtocolError = onProtocolError
        self.onDefault = onDefault
    }

    func mqttStatusCallback(_ status: AWSIoTMQTTStatus) {
        switch(status)
        {
        case .connecting:
            if let onConnecting = self.onConnecting {
                onConnecting()
            }
        case .connected:
            if let onConnected = self.onConnected {
                onConnected()
            }
        case .disconnected:
            if let onDisconnected = self.onDisconnected {
                onDisconnected()
            }

        case .connectionRefused:
            if let onConnectionRefused = self.onConnectionRefused {
                onConnectionRefused()
            }

        case .connectionError:
            if let onConnectionError = self.onConnectionError {
                onConnectionError()
            }

        case .protocolError:
            if let onProtocolError = self.onProtocolError {
                onProtocolError()
            }
        default:
            if let onDefault = self.onDefault {
                onDefault()
            }
        }
    }
}
