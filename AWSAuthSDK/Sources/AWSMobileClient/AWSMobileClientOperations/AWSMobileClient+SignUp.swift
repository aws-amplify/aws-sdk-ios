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

    /// Sign up with username, password and other attrbutes like phone, email.
    ///
    /// - Parameters:
    ///   - username: username of the user.
    ///   - password: password of the user
    ///   - userAttributes: user attributes which contain attributes like phone_number, email, etc.
    ///   - validationData: validation data for the user.
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when a sign up result is available.
    public func signUp(username: String,
                       password: String,
                       userAttributes: [String: String] = [:],
                       validationData: [String: String] = [:],
                       clientMetaData: [String:String] = [:],
                       completionHandler: @escaping ((SignUpResult?, Error?) -> Void)) {

        if (self.userPoolClient == nil) {
            let message = """
            Cognito User Pools is not configured in `awsconfiguration.json`.
            Please add Cognito User Pools before using this API.
            """
            let error = AWSMobileClientError.userPoolNotConfigured(message: message)
            completionHandler(nil, error)}

        let userAttributesTransformed = userAttributes.map {
            AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1)
        }
        let validationDataTransformed = validationData.map {
            AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1)
        }

        self.userPoolClient?.signUp(
            username,
            password: password,
            userAttributes: userAttributesTransformed.count == 0 ? nil : userAttributesTransformed,
            validationData: validationDataTransformed.count == 0 ? nil : validationDataTransformed,
            clientMetaData: clientMetaData).continueWith { (task) -> Any? in
                if let error = task.error {
                    completionHandler(nil, AWSMobileClientError.makeMobileClientError(from: error))
                } else if let result = task.result {
                    self.userpoolOpsHelper.signUpUser = task.result?.user
                    var confirmedStatus: SignUpConfirmationState?
                    if(result.userConfirmed!.intValue == 1) {
                        confirmedStatus = .confirmed
                    } else {
                        confirmedStatus = .unconfirmed
                    }

                    var codeDeliveryDetails: UserCodeDeliveryDetails? = nil
                    if let deliveryDetails = result.codeDeliveryDetails {
                        switch(deliveryDetails.deliveryMedium) {
                        case .email:
                            codeDeliveryDetails = UserCodeDeliveryDetails(
                                deliveryMedium: .email,
                                destination: deliveryDetails.destination,
                                attributeName: deliveryDetails.attributeName)
                        case .sms:
                            codeDeliveryDetails = UserCodeDeliveryDetails(
                                deliveryMedium: .sms,
                                destination: deliveryDetails.destination,
                                attributeName: deliveryDetails.attributeName)
                        case .unknown:
                            codeDeliveryDetails = UserCodeDeliveryDetails(
                                deliveryMedium: .unknown,
                                destination: deliveryDetails.destination,
                                attributeName: deliveryDetails.attributeName)
                        @unknown default:
                            codeDeliveryDetails = UserCodeDeliveryDetails(
                                deliveryMedium: .unknown,
                                destination: deliveryDetails.destination,
                                attributeName: deliveryDetails.attributeName)
                        }
                    }
                    completionHandler(
                        SignUpResult(signUpState: confirmedStatus!,
                                     codeDeliveryDetails: codeDeliveryDetails),
                        nil)
                }
                return nil
            }
    }

    /// Confirms a sign up for a user using a verification code.
    ///
    /// - Parameters:
    ///   - username: username of the user.
    ///   - confirmationCode: confirmation code sent to the user.
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when a result is available.
    public func confirmSignUp(username: String,
                              confirmationCode: String,
                              clientMetaData: [String:String] = [:],
                              completionHandler: @escaping ((SignUpResult?, Error?) -> Void)) {
        if let uname = self.userpoolOpsHelper.signUpUser?.username, uname == username {
            confirmSignUp(user: self.userpoolOpsHelper.signUpUser!,
                          confirmationCode: confirmationCode,
                          clientMetaData: clientMetaData,
                          completionHandler: completionHandler)
        } else {
            let user = self.userPoolClient?.getUser(username)
            confirmSignUp(user: user!,
                          confirmationCode: confirmationCode,
                          clientMetaData: clientMetaData,
                          completionHandler: completionHandler)
        }
    }

    internal func confirmSignUp(user: AWSCognitoIdentityUser,
                                confirmationCode: String,
                                clientMetaData: [String:String] = [:],
                                completionHandler: @escaping ((SignUpResult?, Error?) -> Void)) {
        user.confirmSignUp(confirmationCode, clientMetaData: clientMetaData).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, AWSMobileClientError.makeMobileClientError(from: error))
            } else if let _ = task.result {
                let signUpResult = SignUpResult(signUpState: .confirmed, codeDeliveryDetails: nil)
                completionHandler(signUpResult, nil)
            }
            return nil
        }
    }

    /// Re-sends the sign up code to the user via email or phone_number.
    ///
    /// - Parameters:
    ///   - username: username of the user who wants a new registration code.
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when a result is available.
    public func resendSignUpCode(username: String,
                                 clientMetaData: [String:String] = [:],
                                 completionHandler: @escaping ((SignUpResult?, Error?) -> Void)) {
        if let uname = self.userpoolOpsHelper.signUpUser?.username, uname == username {
            resendSignUpCode(user: self.userpoolOpsHelper.signUpUser!, clientMetaData: clientMetaData, completionHandler: completionHandler)
        } else {
            let user = self.userPoolClient?.getUser(username)
            resendSignUpCode(user: user!, clientMetaData: clientMetaData, completionHandler: completionHandler)
        }
    }

    internal func resendSignUpCode(user: AWSCognitoIdentityUser,
                                   clientMetaData: [String:String] = [:],
                                   completionHandler: @escaping ((SignUpResult?, Error?) -> Void)) {
        user.resendConfirmationCode(clientMetaData).continueWith(block: { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, AWSMobileClientError.makeMobileClientError(from: error))
            } else if let result = task.result {
                let confirmedStatus: SignUpConfirmationState = .unconfirmed
                var codeDeliveryDetails: UserCodeDeliveryDetails? = nil
                if let deliveryDetails = result.codeDeliveryDetails {
                    codeDeliveryDetails = UserCodeDeliveryDetails.getUserCodeDeliveryDetails(deliveryDetails)
                }
                completionHandler(SignUpResult(signUpState: confirmedStatus, codeDeliveryDetails: codeDeliveryDetails), nil)
            }
            return nil
        })
    }
}
