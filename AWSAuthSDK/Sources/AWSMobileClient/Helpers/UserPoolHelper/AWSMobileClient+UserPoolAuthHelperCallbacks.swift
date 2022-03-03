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

/// Extension to hold UserPoolAuthHelperlCallbacks methods
extension AWSMobileClient: UserPoolAuthHelperCallbacks {

    func getPasswordDetails(_ authenticationInput: AWSCognitoIdentityPasswordAuthenticationInput,
                            passwordAuthenticationCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>) {

        // getPasswordDetails for customAuth will be called when the session expires.
        // This call would be triggered from getSession(). In this case we donot need
        // to inform the user that the session is expired, because that is handled by
        // getCustomAuthenticationDetails.
        if(self.userPoolClient?.isCustomAuth ?? false) {
            let authDetails = AWSCognitoIdentityPasswordAuthenticationDetails(
                username: self.currentUser?.username ?? "",
                password: userPassword ?? "dummyPassword")
            passwordAuthenticationCompletionSource.set(result: authDetails)
            userPassword = nil
            return
        }
        if (self.federationProvider != .userPools) {
            let message = AWSMobileClientConstants.notSignedInMessage
            let error = AWSMobileClientError.notSignedIn(message: message)
            passwordAuthenticationCompletionSource.set(error: error)
        }
        switch self.currentUserState {
        case .signedIn, .signedOutUserPoolsTokenInvalid:
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource = passwordAuthenticationCompletionSource
            self.invalidateCachedTemporaryCredentials()
            self.mobileClientStatusChanged(userState: .signedOutUserPoolsTokenInvalid, additionalInfo: ["username":self.userPoolClient?.currentUser()?.username ?? ""])
        default:
            break
        }
    }

    func didCompletePasswordStepWithError(_ error: Error?) {
        if let error = error {
            invokeSignInCallback(signResult: nil, error: AWSMobileClientError.makeMobileClientError(from: error))
        }
        self.userpoolOpsHelper.passwordAuthTaskCompletionSource = nil
    }

    func getNewPasswordDetails(_ newPasswordRequiredInput: AWSCognitoIdentityNewPasswordRequiredInput,
                               newPasswordRequiredCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails>) {
        self.userpoolOpsHelper.newPasswordRequiredTaskCompletionSource = newPasswordRequiredCompletionSource
        let result = SignInResult(signInState: .newPasswordRequired, codeDetails: nil)
        invokeSignInCallback(signResult: result, error: nil)
    }

    func didCompleteNewPasswordStepWithError(_ error: Error?) {
        if let error = error {
            invokeSignInCallback(signResult: nil, error: AWSMobileClientError.makeMobileClientError(from: error))
        }
        self.userpoolOpsHelper.newPasswordRequiredTaskCompletionSource = nil
    }

    func getCustomAuthenticationDetails(_ customAuthenticationInput: AWSCognitoIdentityCustomAuthenticationInput,
                                        customAuthCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityCustomChallengeDetails>) {

        self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource = customAuthCompletionSource

        // getCustomAuthenticationDetails will be invoked in a signIn process or when the token expires.
        // If this get invoked when the token expires, we first inform the listener that the user got signedOut. This
        // delegate is called in token expiry if the user state is .signedIn or .signedOutUserPoolsTokenInvalid with
        // customAuthenticationInput.challengeParameters empty
        if ((self.currentUserState == .signedIn || self.currentUserState == .signedOutUserPoolsTokenInvalid) &&
            customAuthenticationInput.challengeParameters.isEmpty) {
            let username = self.userPoolClient?.currentUser()?.username ?? ""
            self.invalidateCachedTemporaryCredentials()
            self.mobileClientStatusChanged(userState: .signedOutUserPoolsTokenInvalid,
                                           additionalInfo: ["username": username])
        } else {
            // If user is not signedIn, we reach here as part of the signIn flow. Next step
            // is to inform the user to enter custom auth challenge.
            let result = SignInResult(signInState: .customChallenge,
                                      parameters: customAuthenticationInput.challengeParameters,
                                      codeDetails: nil)
            invokeSignInCallback(signResult: result, error: nil)
        }
    }

    func didCompleteCustomAuthenticationStepWithError(_ error: Error?) {
        if let error = error {
            invokeSignInCallback(signResult: nil, error: AWSMobileClientError.makeMobileClientError(from: error))
        }
        self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource = nil
    }

    func getCode(_ authenticationInput: AWSCognitoIdentityMultifactorAuthenticationInput,
                 mfaCodeCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityMfaCodeDetails>) {
        self.userpoolOpsHelper.mfaCodeCompletionSource = mfaCodeCompletionSource
        var codeDeliveryDetails: UserCodeDeliveryDetails? = nil
            switch(authenticationInput.deliveryMedium) {
            case .email:
                codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .email, destination: authenticationInput.destination, attributeName: "email")
            case .sms:
                codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .sms, destination: authenticationInput.destination, attributeName: "phone")
            case .unknown:
                codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .unknown, destination: authenticationInput.destination, attributeName: "unknown")
            @unknown default:
                codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .unknown, destination: authenticationInput.destination, attributeName: "unknown")
        }

        let result = SignInResult(signInState: .smsMFA, codeDetails: codeDeliveryDetails)
        invokeSignInCallback(signResult: result, error: nil)
    }

    func didCompleteMultifactorAuthenticationStepWithError(_ error: Error?) {
        if let error = error {
            invokeSignInCallback(signResult: nil, error: AWSMobileClientError.makeMobileClientError(from: error))
        }
        self.userpoolOpsHelper.mfaCodeCompletionSource = nil
    }
}


