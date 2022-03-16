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

    /// Asynchronous signout method which requires network activity. Based on the options specified in `SignOutOptions`, appropriate tasks will be performed.
    ///
    /// - Parameters:
    ///   - options: SignOutOptions which specify actions.
    ///   - presentationAnchor: If you have
    ///   - completionHandler: completion handler for success or error callback.
    @available(iOS 13, *)
    public func signOut(presentationAnchor: ASPresentationAnchor,
                        options: SignOutOptions = SignOutOptions(),
                        completionHandler: @escaping ((Error?) -> Void)) {
        internalSignOut(presentationAnchor: presentationAnchor,
                        options: options,
                        completionHandler: completionHandler)
    }

    /// Asynchronous signout method which requires network activity. Based on the options specified in `SignOutOptions`, appropriate tasks will be performed.
    ///
    /// - Parameters:
    ///   - options: SignOutOptions which specify actions.
    ///   - completionHandler: completion handler for success or error callback.
    public func signOut(options: SignOutOptions = SignOutOptions(),
                        completionHandler: @escaping ((Error?) -> Void)) {
        internalSignOut(presentationAnchor: nil,
                        options: options,
                        completionHandler: completionHandler)
    }

    /// Signs out the current logged in user and clears the local keychain store.
    /// Note: This does not invalidate the tokens from the service or sign out the user from other devices.
    public func signOut() {
        self.credentialsFetchCancellationSource.cancel()
        if federationProvider == .hostedUI {
            AWSCognitoAuth.init(forKey: CognitoAuthRegistrationKey).signOutLocallyAndClearLastKnownUser()
        }
        self.cachedLoginsMap = [:]
        self.customRoleArnInternal = nil
        self.setCustomRoleArnInternal(nil, for: self)
        self.saveLoginsMapInKeychain()
        self.setLoginProviderMetadataAndSaveInKeychain(provider: .none)
        self.performUserPoolSignOut()
        self.internalCredentialsProvider?.identityProvider.identityId = nil
        self.internalCredentialsProvider?.clearKeychain()
        self.mobileClientStatusChanged(userState: .signedOut, additionalInfo: [:])
        self.federationProvider = .none
        self.credentialsFetchCancellationSource = AWSCancellationTokenSource()
        self.clearHostedUIOptionsScopesFromKeychain()
    }

    /// Invoke this function to release any sign-in waits.
    /// When you receive a notifcation which is `signedOutFederatedTokensInvalid` or `signedOutUserPoolsTokensInvalid`
    /// you need to provide SDK the token via `federate` method or call the `signIn` method and complete the sign-in flow.
    /// If you can't get the latest token from the user, you can call this method to un-block any waiting calls.
    public func releaseSignInWait() {
        tokenOperations.forEach { item in
            item.acceptEvent(.releaseWait)
        }
        if self.federationProvider == .userPools {
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource?.set(error: AWSMobileClientError.unableToSignIn(message: AWSMobileClientConstants.noValidSignInSession))
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource = nil
            self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource?.set(error: AWSMobileClientError.unableToSignIn(message: AWSMobileClientConstants.noValidSignInSession))
            self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource = nil
        } else if self.federationProvider == .hostedUI {
            self.pendingGetTokensCompletion?(nil, AWSMobileClientError.unableToSignIn(message: "Could not get valid token from the user."))
            self.pendingGetTokensCompletion = nil
        } else if self.federationProvider == .oidcFederation {
            self.pendingAWSCredentialsCompletion?(nil, AWSMobileClientError.unableToSignIn(message: "Could not get valid federation token from the user."))
            self.pendingAWSCredentialsCompletion = nil
        }
    }

    private func handleHostedUISignOutResult(_ error: Error?, completionHandler: @escaping ((Error?) -> Void)) {
        if (error != nil) {
            completionHandler(AWSMobileClientError.makeMobileClientError(from: error!))
        } else {
            // If the cookie is successfully invalidated, we attempt to
            // revoke access tokens and then sign out locally.
            revokeAccessTokensAndSignOutLocally(completionHandler: completionHandler)
        }
    }

    private func internalSignOut(presentationAnchor: ASPresentationAnchor? = nil,
                                 options: SignOutOptions = SignOutOptions(),
                        completionHandler: @escaping ((Error?) -> Void)) {
        // If using hosted UI, we need to launch SFSafariVC/SFAuthSession/ASWebAuthenticationSession to invalidate cookie
        if federationProvider == .hostedUI {
            // Ensure UI actions are performed on the main thread since revoke token may be performed on a
            // background thread.
            DispatchQueue.main.async {
                if let anchor = presentationAnchor {
                    self.hostedUISignOut(presentationAnchor: anchor, completionHandler: completionHandler)
                } else {
                    self.hostedUILegacySignOut(completionHandler: completionHandler)
                }
            }
            return
        }
        // If using userpools sign in and global sign out is specified, we try logging out the user from all devices.
        if federationProvider == .userPools && options.signOutGlobally == true {
            let _ = self.userpoolOpsHelper.currentActiveUser!.globalSignOut().continueWith { [weak self] (task) -> Any? in
                guard let self = self else {
                    let message = "Unexpectedly encountered nil when unwrapping self. This should not happen."
                    completionHandler(AWSMobileClientError.unknown(message: message))
                    return nil
                }
                if task.result != nil {
                    // If global signout is successful, we attempt to revoke access tokens and sign out locally.
                    self.revokeAccessTokensAndSignOutLocally(completionHandler: completionHandler)
                } else if let error = task.error {
                    // If there is an error signing out globally, we notify the developer.
                    completionHandler(AWSMobileClientError.makeMobileClientError(from: error))
                }
                return nil
            }
            return
        }
        // If using userpools sign in (not global sign out or federated sign in), revoke the token before signing out
        if federationProvider == .userPools {
            revokeAccessTokensAndSignOutLocally(completionHandler: completionHandler)
            return
        }
        // If signing in with federated sign in, perform local sign out
        signOut()
        completionHandler(nil)
    }

    internal func revokeAccessTokensAndSignOutLocally(completionHandler: @escaping ((Error?) -> Void)) {
        revokeIfSessionIsRevocable { _ in
            self.signOut()
            completionHandler(nil)
        }
    }

    /// Returns if the session is not revocable, attempts to revoke the token if it is.
    private func revokeIfSessionIsRevocable(completionHandler: @escaping ((Error?) -> Void)) {
        guard let isSessionRevocable = self.userpoolOpsHelper.currentActiveUser?.isSessionRevocable,
              isSessionRevocable else {
            completionHandler(nil)
            return
        }

        let _ = self.userpoolOpsHelper.currentActiveUser?.revokeToken().continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(AWSMobileClientError.makeMobileClientError(from: error))
            } else if let _ = task.result {
                completionHandler(nil)
            }
            return nil
        }
    }

    private func hostedUISignOut(presentationAnchor: ASPresentationAnchor,
                                 completionHandler: @escaping ((Error?) -> Void)) {
        if #available(iOS 13, *) {
            AWSCognitoAuth.init(forKey: CognitoAuthRegistrationKey).signOut(withWebUI: presentationAnchor) { (error) in
                self.handleHostedUISignOutResult(error, completionHandler: completionHandler)
            }
        } else {
            // Fallback on earlier versions
            self.hostedUILegacySignOut(completionHandler: completionHandler)
        }
    }

    private func hostedUILegacySignOut(completionHandler: @escaping ((Error?) -> Void)) {
        AWSCognitoAuth.init(forKey: CognitoAuthRegistrationKey).signOut { (error) in
            self.handleHostedUISignOutResult(error, completionHandler: completionHandler)
        }
    }

    internal func performUserPoolSignOut() {
        if let task = self.userpoolOpsHelper.passwordAuthTaskCompletionSource?.task, !task.isCompleted {
            let error = AWSMobileClientError.unableToSignIn(message: "Could not get end user to sign in.")
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource?.set(error: error)
        }
        self.userpoolOpsHelper.passwordAuthTaskCompletionSource = nil

        if let task = self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource?.task, !task.isCompleted {
            let error = AWSMobileClientError.unableToSignIn(message: "Could not get end user to sign in.")
            self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource?.set(error: error)
        }
        self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource = nil
        invokeSignInCallback(signResult: nil, error: AWSMobileClientError.unableToSignIn(message: "Could not get end user to sign in."))
        self.userPoolClient?.clearAll()
    }
}
