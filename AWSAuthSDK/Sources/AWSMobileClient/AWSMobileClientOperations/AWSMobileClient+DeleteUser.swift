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

extension AWSMobileClient {

    /// Asynchronous deleteUser method which requires network activity.
    ///
    /// - Parameters:
    ///   - completionHandler: completion handler for success or error callback.
    public func deleteUser(completionHandler: @escaping ((Error?) -> Void)) {
        guard let currentActiveUser = self.userpoolOpsHelper.currentActiveUser else {
            let errorMessage = "Invalid CognitoUserPool configuration. This should not happen."
            completionHandler(AWSMobileClientError.invalidConfiguration(message: errorMessage))
            return
        }
        let _ = currentActiveUser.delete().continueWith { [weak self] (task) -> Any? in
            guard let self = self else {
                let message = "Unexpectedly encountered nil when unwrapping self. This should not happen."
                completionHandler(AWSMobileClientError.unknown(message: message))
                return nil
            }
            if task.result != nil {
                // User was successfully deleted.
                // Attempt global signout, revoke access tokens, and sign out locally.
                //
                // In the case of hosted UI, launching a web session to remove the session cookie is
                // unnessary because the user's account is no longer valid to receive new tokens.
                let _ = currentActiveUser.globalSignOut().continueWith { _ in
                    // Attempt to revoke access tokens and sign out locally.
                    self.revokeAccessTokensAndSignOutLocally(completionHandler: completionHandler)
                }
            } else if let error = task.error {
                // If there is an error deleting the user, we notify the developer.
                completionHandler(AWSMobileClientError.makeMobileClientError(from: error))
            }
            return nil
        }
    }
}
