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

/// Configuration options for tracking.
public struct TrackerOptions {
    static let defaultRetrieveLocationFrequency = TimeInterval(30) // 30 seconds
    static let defaultEmitLocationFrequency = TimeInterval(300) // 5 minutes
    
    /// The custom ID chosen to identify this device on the chosen tracker resource.
    public let customDeviceId: String?
    
    /// The frequency in seconds to get the current device location.
    public let retrieveLocationFrequency: TimeInterval
    
    /// The frequency in seconds to publish a batch of locations to Amazon Location Service.
    public let emitLocationFrequency: TimeInterval
    
    public init(customDeviceId: String? = nil,
                retrieveLocationFrequency: TimeInterval? = nil,
                emitLocationFrequency: TimeInterval? = nil) {
        self.customDeviceId = customDeviceId
        self.retrieveLocationFrequency = retrieveLocationFrequency ?? TrackerOptions.defaultRetrieveLocationFrequency
        self.emitLocationFrequency = emitLocationFrequency ?? TrackerOptions.defaultEmitLocationFrequency
    }
}
