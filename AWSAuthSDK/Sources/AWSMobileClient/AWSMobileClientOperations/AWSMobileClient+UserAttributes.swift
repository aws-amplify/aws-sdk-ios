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

/// Extension to hold user attribute operations
extension AWSMobileClient {

    /// Verify a user attribute like phone_number.
    ///
    /// This method is only valid for users signed in via UserPools (either directly or via HostedUI).
    ///
    /// - Parameters:
    ///   - attributeName: name of the attribute.
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func verifyUserAttribute(attributeName: String,
                                    clientMetaData: [String:String] = [:],
                                    completionHandler: @escaping ((UserCodeDeliveryDetails?, Error?) -> Void)) {
        guard self.federationProvider == .userPools || self.federationProvider == .hostedUI else {
            let message = AWSMobileClientConstants.notSignedInMessage
            let error = AWSMobileClientError.notSignedIn(message: message)
            completionHandler(nil, error)
            return
        }
        let userDetails = AWSMobileClientUserDetails(with: self.userpoolOpsHelper.currentActiveUser!)
        userDetails.verifyUserAttribute(attributeName: attributeName, clientMetaData: clientMetaData, completionHandler: completionHandler)
    }

    /// Update the attributes for a user.
    ///
    /// This method is only valid for users signed in via UserPools (either directly or via HostedUI).
    ///
    /// - Parameters:
    ///   - attributeMap: the attribute map of the user.
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func updateUserAttributes(attributeMap: [String: String],
                                     clientMetaData: [String:String] = [:],
                                     completionHandler: @escaping (([UserCodeDeliveryDetails]?, Error?) -> Void)) {
        guard self.federationProvider == .userPools || self.federationProvider == .hostedUI else {
            let message = AWSMobileClientConstants.notSignedInMessage
            let error = AWSMobileClientError.notSignedIn(message: message)
            completionHandler(nil, error)
            return
        }
        let userDetails = AWSMobileClientUserDetails(with: self.userpoolOpsHelper.currentActiveUser!)
        userDetails.updateUserAttributes(attributeMap: attributeMap, clientMetaData: clientMetaData, completionHandler: completionHandler)
    }

    /// Fetches the attributes for logged in user.
    ///
    /// This method is only valid for users signed in via UserPools (either directly or via HostedUI).
    ///
    /// - Parameter completionHandler: completion handler which will be invoked when result is available.
    public func getUserAttributes(completionHandler: @escaping (([String: String]?, Error?) -> Void)) {
        guard self.federationProvider == .userPools || self.federationProvider == .hostedUI else {
            let message = AWSMobileClientConstants.notSignedInMessage
            let error = AWSMobileClientError.notSignedIn(message: message)
            completionHandler(nil, error)
            return
        }
        guard let currentActiveUser = self.userpoolOpsHelper.currentActiveUser else {
            let message = AWSMobileClientConstants.notSignedInMessage
            let error = AWSMobileClientError.notSignedIn(message: message)
            completionHandler(nil, error)
            return
        }
        self.getTokens { _, error in
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            let userDetails = AWSMobileClientUserDetails(with: currentActiveUser)
            userDetails.getUserAttributes(completionHandler: completionHandler)
        }
    }

    /// Confirm the updated attributes using a confirmation code.
    ///
    /// This method is only valid for users signed in via UserPools (either directly or via HostedUI).
    ///
    /// - Parameters:
    ///   - attributeName: the attribute to be confirmed.
    ///   - code: the code sent to the user.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func confirmUpdateUserAttributes(attributeName: String, code: String, completionHandler: @escaping ((Error?) -> Void)) {
        guard self.federationProvider == .userPools || self.federationProvider == .hostedUI else {
            let message = AWSMobileClientConstants.notSignedInMessage
            let error = AWSMobileClientError.notSignedIn(message: message)
            completionHandler(error)
            return
        }
        self.confirmVerifyUserAttribute(attributeName: attributeName, code: code, completionHandler: completionHandler)
    }

    /// Confirm the attribute using a confirmation code.
    ///
    /// This method is only valid for users signed in via UserPools (either directly or via HostedUI).
    ///
    /// - Parameters:
    ///   - attributeName: the attribute to be verified.
    ///   - code: the code sent to the user.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func confirmVerifyUserAttribute(attributeName: String, code: String, completionHandler: @escaping ((Error?) -> Void)) {
        guard self.federationProvider == .userPools || self.federationProvider == .hostedUI else {
            let message = AWSMobileClientConstants.notSignedInMessage
            let error = AWSMobileClientError.notSignedIn(message: message)
            completionHandler(error)
            return
        }
        let userDetails = AWSMobileClientUserDetails(with: self.userpoolOpsHelper.currentActiveUser!)
        userDetails.confirmVerifyUserAttribute(attributeName: attributeName,
                                               code: code,
                                               completionHandler: completionHandler)
    }
}
