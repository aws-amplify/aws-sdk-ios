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

import Foundation

/// Signout options to change the default behavior.
public struct SignOutOptions {
    let invalidateTokens: Bool
    let signOutGlobally: Bool

    /// Initializer: Signout options to change the default behavior.
    ///
    /// - Parameters:
    ///   - signOutGlobally: Invalidate all active sessions with the service. The user will be logged out of all devices.
    ///   - invalidateTokens: If functionality available, the access token, refresh token and id token will be invalidated and won't be usable.
    public init(signOutGlobally: Bool = false, invalidateTokens: Bool = true) {
        self.signOutGlobally = signOutGlobally
        self.invalidateTokens = invalidateTokens
    }
}
