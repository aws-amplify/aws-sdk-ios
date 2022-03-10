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

    /// Signs in a user with the given username and password.
    ///
    /// - Parameters:
    ///   - username: username of the user.
    ///   - password: password of the user.
    ///   - validationData: validation data for this sign in. Overrides any key-value pairs in `clientMetadata` when the
    ///   same key exists in validation data.
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when result is available.
    public func signIn(username: String,
                       password: String,
                       validationData: [String: String]? = nil,
                       clientMetaData: [String: String] = [:],
                       completionHandler: @escaping ((SignInResult?, Error?) -> Void)) {

        switch self.currentUserState {
        case .signedIn:
            completionHandler(nil, AWSMobileClientError.invalidState(message: "There is already a user which is signed in. Please log out the user before calling showSignIn."))
            return
        default:
            break
        }
        self.userpoolOpsHelper.userpoolClient?.delegate = self.userpoolOpsHelper
        self.userpoolOpsHelper.authHelperDelegate = self
        let user = self.userPoolClient?.getUser(username)
        self.userpoolOpsHelper.currentSignInHandlerCallback = completionHandler
        var validationAttributes: [AWSCognitoIdentityUserAttributeType]? = nil
        if (validationData != nil) {
            validationAttributes = validationData!.map {AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1) }
        }
        if (self.userpoolOpsHelper.passwordAuthTaskCompletionSource != nil) {
            let authDetails = AWSCognitoIdentityPasswordAuthenticationDetails(username: username, password: password)
            authDetails?.validationData = validationAttributes
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource!.set(result: authDetails)
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource = nil
        } else if (self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource != nil) {
            let details = AWSCognitoIdentityCustomChallengeDetails(challengeResponses: ["USERNAME": username])
            details.initialChallengeName = "SRP_A"
            self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource?.set(result: details)
            self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource = nil
        } else {
            let isCustomAuth = self.userPoolClient?.isCustomAuth ?? false
            if (isCustomAuth) {
                userPassword = password
            }
            user!.getSession(username,
                             password: password,
                             validationData: validationAttributes,
                             clientMetaData: clientMetaData,
                             isInitialCustomChallenge: isCustomAuth).continueWith { (task) -> Any? in
                if let error = task.error {
                    self.invokeSignInCallback(signResult: nil, error: AWSMobileClientError.makeMobileClientError(from: error))
                } else if let result = task.result {
                    self.internalCredentialsProvider?.clearCredentials()
                    self.federationProvider = .userPools
                    self.performUserPoolSuccessfulSignInTasks(session: result)
                    let tokenString = result.idToken!.tokenString
                    self.mobileClientStatusChanged(
                        userState: .signedIn,
                        additionalInfo: [
                            AWSMobileClientConstants.ProviderKey:self.userPoolClient!.identityProviderName,
                            AWSMobileClientConstants.TokenKey:tokenString])
                    self.invokeSignInCallback(signResult: SignInResult(signInState: .signedIn), error: nil)
                }
                return nil
            }
        }
    }

    /// Confirm a sign in which requires additional validation via steps like SMS MFA.
    ///
    /// - Parameters:
    ///   - challengeResponse: confirmation code or TOTP token which is available to the user.
    ///   - userAttributes: user attributes required for the operation.
    ///   - clientMetaData: A map of custom key-value pairs that you can provide as input for any
    ///   custom workflows that this action triggers.
    ///   - completionHandler: completionHandler which will be called when result is available.
    public func confirmSignIn(challengeResponse: String,
                              userAttributes: [String:String] = [:],
                              clientMetaData: [String:String] = [:],
                              completionHandler: @escaping ((SignInResult?, Error?) -> Void)) {
        if (self.userpoolOpsHelper.mfaCodeCompletionSource != nil) {
            self.userpoolOpsHelper.currentConfirmSignInHandlerCallback = completionHandler
            let mfaDetails = AWSCognitoIdentityMfaCodeDetails.init(mfaCode: challengeResponse);
            mfaDetails.clientMetaData = clientMetaData;
            self.userpoolOpsHelper.mfaCodeCompletionSource?.set(result: mfaDetails)
        } else if (self.userpoolOpsHelper.newPasswordRequiredTaskCompletionSource != nil) {
            self.userpoolOpsHelper.currentConfirmSignInHandlerCallback = completionHandler
            let passwordDetails = AWSCognitoIdentityNewPasswordRequiredDetails.init(proposedPassword: challengeResponse,
                                                                                    userAttributes: userAttributes)
            passwordDetails.clientMetaData = clientMetaData
            self.userpoolOpsHelper.newPasswordRequiredTaskCompletionSource?.set(result: passwordDetails)
        } else if (self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource != nil) {
            self.userpoolOpsHelper.currentConfirmSignInHandlerCallback = completionHandler
            let customAuthDetails = AWSCognitoIdentityCustomChallengeDetails.init(challengeResponses: ["ANSWER": challengeResponse])
            customAuthDetails.clientMetaData = clientMetaData
            self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource?.set(result: customAuthDetails)
            self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource = nil
        }
        else {
            completionHandler(nil, AWSMobileClientError.invalidState(message: "Please call `signIn` before calling this method."))
        }
    }

    /// Federates a social provider like Google, Facebook, Amazon or Twitter.
    /// If user is already signed in through the `signIn` method, it will return `AWSMobileClientError.federationProviderExists` error.
    /// If federation provider name has changed, previous federation provider's token will be erased and the new token will be used going forward; the user state is un-affected in that case.
    ///
    /// - Parameters:
    ///   - providerName: Provider name for federation provider, e.g. graph.facebook.com, accounts.google.com
    ///   - token: The `idToken`
    ///   - completionHandler: completion handler on successful credentials fetch.
    public func federatedSignIn(providerName: String, token: String,
                                federatedSignInOptions: FederatedSignInOptions = FederatedSignInOptions(),
                                completionHandler: @escaping ((UserState?, Error?) -> Void)) {

        self.tokenFetchOperationQueue.addOperation {
            var error: Error?

            // At the end of operation if there is an error anywhere in the flow, we return it back to the developer; else return a successful signedIn state.
            defer {
                if error == nil {
                    self.mobileClientStatusChanged(
                        userState: .signedIn,
                        additionalInfo: [
                            AWSMobileClientConstants.ProviderKey:providerName,
                            AWSMobileClientConstants.TokenKey: token])
                    completionHandler(UserState.signedIn, nil)
                } else {
                    completionHandler(nil, error)
                }
            }

            // If there is a userpools federation already active, we return an error.
            // Developer cannot initiate a federatedSignIn when a UserPools sign in is active.
            guard self.federationProvider != .userPools else {
                error = AWSMobileClientError.federationProviderExists(message: "User is already signed in. Please sign out before calling this method.")
                return
            }

            if self.federationProvider == .oidcFederation { // developer is providing an updated token for federatedSignIn
                // Update the identityId if required
                if let devAuthenticatedIdentityId = federatedSignInOptions.cognitoIdentityId {
                    self.internalCredentialsProvider?.identityProvider.identityId = devAuthenticatedIdentityId
                }
                // Update the Custom Role ARN if specified
                if let customRoleArn = federatedSignInOptions.customRoleARN {
                    self.customRoleArnInternal = customRoleArn
                    self.setCustomRoleArnInternal(customRoleArn, for: self)
                }
                self.performFederatedSignInTasks(provider: providerName, token: token)
                // If any credentials operation is pending, we invoke the waiting block to resume with new credentials
                if (self.pendingAWSCredentialsCompletion != nil) {
                    self.internalCredentialsProvider?.credentials().continueWith(block: { (task) -> Any? in
                        if let credentials = task.result {
                            self.pendingAWSCredentialsCompletion?(credentials, nil)
                        } else if let error = task.error {
                            self.pendingAWSCredentialsCompletion?(nil, error)
                        }
                        self.pendingAWSCredentialsCompletion = nil
                        return nil
                    })
                }
            } else { // first time calling federatedSignIn
                // If using developer authenticated identities, identityId is required.
                // Check if identityId is specified by the developer, else return error.
                if providerName == IdentityProvider.developer.rawValue {
                    if let devAuthenticatedIdentityId = federatedSignInOptions.cognitoIdentityId {
                        self.internalCredentialsProvider?.identityProvider.identityId = devAuthenticatedIdentityId
                    } else {
                        error = AWSMobileClientError.invalidParameter(message: "For using developer authenticated identities, you need to specify the `CognitoIdentityId` in `FederatedSignInOptions`.")
                        return
                    }
                }
                if let customRoleArn = federatedSignInOptions.customRoleARN {
                    self.customRoleArnInternal = customRoleArn
                    self.setCustomRoleArnInternal(customRoleArn, for: self)
                }
                self.performFederatedSignInTasks(provider: providerName, token: token)
            }
        }
    }

    /// SignIn can be a two phase process where the developer has to call signIn first and then
    /// call the confirmSignIn method. Both of these apis can result in the same callback path.
    /// This method is called for any signIn related callback. We check whether the callback
    /// is available and then invoke the callback. Before invoking the callback we make sure that the
    /// internal callback reference is set to nil.
    /// - Parameters:
    ///     - signResult: signIn result if there is no error
    ///     - error: error occured
    internal func invokeSignInCallback(signResult: SignInResult?, error: Error?) {
        if let signCallback = userpoolOpsHelper.currentSignInHandlerCallback {
            invalidateSignInCallbacks()
            signCallback(signResult, error)

        } else if let confirmSignCallback = userpoolOpsHelper.currentConfirmSignInHandlerCallback {
            invalidateSignInCallbacks()
            confirmSignCallback(signResult, error)
        }
    }

    private func invalidateSignInCallbacks() {
        userpoolOpsHelper.currentSignInHandlerCallback = nil
        userpoolOpsHelper.currentConfirmSignInHandlerCallback = nil
    }

    internal func performUserPoolSuccessfulSignInTasks(session: AWSCognitoIdentityUserSession) {
        let tokenString = session.idToken!.tokenString
        self.developerNavigationController = nil
        self.cachedLoginsMap = [self.userPoolClient!.identityProviderName: tokenString]
        postSignInKeychainAndCredentialsUpdate(
            provider: .userPools,
            additionalInfo: [
                AWSMobileClientConstants.ProviderKey:self.userPoolClient!.identityProviderName,
                AWSMobileClientConstants.TokenKey:tokenString])
    }

    private func performFederatedSignInTasks(provider: String, token: String) {
        self.cachedLoginsMap = [provider:token]
        self.federationProvider = .oidcFederation
        postSignInKeychainAndCredentialsUpdate(
            provider: .oidcFederation,
            additionalInfo: [
                AWSMobileClientConstants.ProviderKey:provider,
                AWSMobileClientConstants.TokenKey: token])
    }

    /// Post signin operations. Saves the login maps and provider metadata in keychain. Refreshes the credentials.
    /// We dont wait for the credentials to be updated, it is an async task which happens in background.
    ///
    /// - Parameters
    ///     - provider: provider to be updated in keychain.
    internal func postSignInKeychainAndCredentialsUpdate(provider: FederationProvider, additionalInfo: [String: String]) {
        self.saveLoginsMapInKeychain()
        self.setLoginProviderMetadataAndSaveInKeychain(provider: provider)
        self.internalCredentialsProvider?.clearCredentials()
        self.internalCredentialsProvider?.credentials(withCancellationToken:self.credentialsFetchCancellationSource)
    }

}
