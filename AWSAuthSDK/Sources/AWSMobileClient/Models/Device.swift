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

/// The structure that holds information about a device.
public struct Device {

    /// Device attributes
    public let attributes: [String: String]?


    /// The date this device was created.
    public let createDate: Date?


    /// The service generated unique identifier for device.
    public let deviceKey: String?


    /// The date this device was last authenticated.
    public let lastAuthenticatedDate: Date?


    /// The date this device was last updated.
    public let lastModifiedDate: Date?

    internal init(attributes: [String: String]? = nil,
                  createDate: Date? = nil,
                  deviceKey: String? = nil,
                  lastAuthenticatedDate: Date? = nil,
                  lastModifiedDate: Date? = nil) {
        self.attributes = attributes
        self.createDate = createDate
        self.deviceKey = deviceKey
        self.lastAuthenticatedDate = lastAuthenticatedDate
        self.lastModifiedDate = lastModifiedDate
    }
}
