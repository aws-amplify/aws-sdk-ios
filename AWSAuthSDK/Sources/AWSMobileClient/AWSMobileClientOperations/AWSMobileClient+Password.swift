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

    /// When called, will send a confirmation code to user which can be used to reset the password.
    ///
    /// - Parameters:
    ///   - username: username of the user who forgot the password.
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when result is available.
    public func forgotPassword(username: String,
                               clientMetaData: [String:String] = [:],
                               completionHandler: @escaping ((ForgotPasswordResult?, Error?) -> Void)) {
        let user = self.userPoolClient?.getUser(username)
        user!.forgotPassword(clientMetaData).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, AWSMobileClientError.makeMobileClientError(from: error))
            } else if let result = task.result {
                var codeDeliveryDetails: UserCodeDeliveryDetails? = nil
                if let deliveryDetails = result.codeDeliveryDetails {
                    codeDeliveryDetails = UserCodeDeliveryDetails.getUserCodeDeliveryDetails(deliveryDetails)
                }
                completionHandler(ForgotPasswordResult(forgotPasswordState: .confirmationCodeSent, codeDeliveryDetails: codeDeliveryDetails), nil)
            }
            return nil
        }
    }

    /// Resets the password for the user if they have a valid confirmation code using the specified new password.
    ///
    /// - Parameters:
    ///   - username: username of the user who forgot the password
    ///   - newPassword: the new password which the user wants to set
    ///   - confirmationCode: the confirmation code sent to the user
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when a result is available.
    public func confirmForgotPassword(username: String,
                                      newPassword: String,
                                      confirmationCode: String,
                                      clientMetaData: [String:String] = [:],
                                      completionHandler: @escaping ((ForgotPasswordResult?, Error?) -> Void)) {
        let user = self.userPoolClient?.getUser(username)
        user!.confirmForgotPassword(confirmationCode, password: newPassword, clientMetaData: clientMetaData).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, AWSMobileClientError.makeMobileClientError(from: error))
            } else if let _ = task.result {
                completionHandler(ForgotPasswordResult(forgotPasswordState: .done, codeDeliveryDetails: nil), nil)
            }
            return nil
        }
    }

    /// Change password of a logged in user.
    ///
    /// - Parameters:
    ///   - currentPassword: current password of the user.
    ///   - proposedPassword: the new password which user wants to set.
    ///   - completionHandler: completionHandler which will be called when the result is avilable. If error is nil, the change was successful.
    public func changePassword(currentPassword: String, proposedPassword: String, completionHandler: @escaping ((Error?) -> Void)) {
        self.userpoolOpsHelper.currentActiveUser!.changePassword(currentPassword, proposedPassword: proposedPassword).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(AWSMobileClientError.makeMobileClientError(from: error))
            } else if let _ = task.result {
                completionHandler(nil)
            }
            return nil
        }
    }
}
