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
//  AWSMobileClientExtensions.swift
//  AWSMobileClient
//

import Foundation
import AWSCognitoIdentityProvider

/// Contains the token string and the claims for the token.
public struct SessionToken {
    
    /// The token string if available.
    public let tokenString: String?
    
    /// The claims associated with this token.
    public var claims: [String: AnyObject]? {
        if tokenString == nil {
            return nil
        } else {
            let tokenSplit = tokenString!.split(separator: ".")
            guard tokenSplit.count > 2 else {
                print("Token is not valid base64 encoded string.")
                return nil
            }
            let claims = tokenSplit[1]
                .replacingOccurrences(of: "-", with: "+")
                .replacingOccurrences(of: "_", with: "/")
            
            let paddedLength = claims.count + (4 - (claims.count % 4)) % 4
            //JWT is not padded with =, pad it if necessary
            let updatedClaims = claims.padding(toLength: paddedLength, withPad: "=", startingAt: 0)
            let encodedData = Data(base64Encoded: updatedClaims, options: .ignoreUnknownCharacters)

            guard let claimsData = encodedData else {
                print("Cannot get claims in `Data` form. Token is not valid base64 encoded string.")
                return nil
            }
            
            let jsonObject = try? JSONSerialization.jsonObject(with: claimsData, options: [])
            guard let convertedDictionary = jsonObject as? [String: AnyObject] else {
                print("Cannot get claims in `Data` form. Token is not valid JSON string.")
                return nil
            }
            return convertedDictionary
        }
    }
    
    init(tokenString: String?) {
        self.tokenString = tokenString
    }
}

/// Contains the tokens for an active sign in session.
public struct Tokens {
    
    /// The ID token.
    public let idToken: SessionToken?

    /// The access token.
    public let accessToken: SessionToken?

    /// The refresh token.
    public let refreshToken: SessionToken?

    /// Expiration date if available.
    public let expiration: Date?
    
}

// MARK: `AWSIdentityProviderManager` protocol methods
extension AWSMobileClient: AWSIdentityProviderManager {

    /// Each entry in logins represents a single login with an identity provider. The key is the domain of the login provider (e.g. 'graph.facebook.com') and the value is the OAuth/OpenId Connect token that results from an authentication with that login provider.
    public func logins() -> AWSTask<NSDictionary> {
        let dict = NSMutableDictionary.init()
        if federationProvider == .none {
            // return empty dictionary
        } else if federationProvider == .userPools {
            
            let userPoolsTokenTask: AWSTaskCompletionSource<NSDictionary> = AWSTaskCompletionSource.init()
            self.getTokens { [weak self] (tokens, error) in
                self?.setLoginMap(using: tokens, and: error, to: userPoolsTokenTask)
            }
            return userPoolsTokenTask.task
        } else if federationProvider == .oidcFederation {
            dict.addEntries(from: self.cachedLoginsMap)
        } else if federationProvider == .hostedUI {
            if !federationDisabled {
                let hostedUITokenTask: AWSTaskCompletionSource<NSDictionary> = AWSTaskCompletionSource.init()
                self.getTokens { [weak self] (tokens, error) in
                    self?.setLoginMap(using: tokens, and: error, to: hostedUITokenTask)
                }
                return hostedUITokenTask.task
            }
            
        }
        let task = AWSTask.init(result: dict as NSDictionary)
        return task
    }
    
    func setLoginMap(using tokens: Tokens?, and error: Error?, to task: AWSTaskCompletionSource<NSDictionary>) {
        
        guard let tokens = tokens else {
            let idTokenError = error != nil ? error! :
                AWSMobileClientError.unknown(message: "Could not read the id token or error from the token response")
            task.set(error: idTokenError)
            return
        }
        guard let idToken = tokens.idToken, let tokenString = idToken.tokenString else {
            let errorString = "Could not read the id token from the token response"
            let error = AWSMobileClientError.idTokenNotIssued(message: errorString)
            task.set(error: error)
            return
        }
        let providerName = self.userPoolClient!.identityProviderName as NSString
        let dict = NSDictionary(object: tokenString, forKey: providerName)
        task.set(result: dict)
    }
}

// MARK: UserPool and Federated sign in methods
extension AWSMobileClient {
    
    internal convenience init(setDelegate: Bool) {
        self.init()
        if (setDelegate) {
            UserPoolOperationsHandler.sharedInstance.authHelperDelegate = self
        }
    }
    
    internal var userpoolOpsHelper: UserPoolOperationsHandler {
        return UserPoolOperationsHandler.sharedInstance
    }
    
    internal var userPoolClient: AWSCognitoIdentityUserPool? {
        return self.userpoolOpsHelper.userpoolClient
    }
    
    internal var currentUser: AWSCognitoIdentityUser? {
        return self.userPoolClient?.currentUser()
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
    
    internal func invalidateSignInCallbacks() {
        userpoolOpsHelper.currentSignInHandlerCallback = nil
        userpoolOpsHelper.currentConfirmSignInHandlerCallback = nil
    }
    
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
                    self.mobileClientStatusChanged(userState: .signedIn,
                                                   additionalInfo: [self.ProviderKey:self.userPoolClient!.identityProviderName,
                                                                    self.TokenKey:tokenString])
                    self.invokeSignInCallback(signResult: SignInResult(signInState: .signedIn), error: nil)
                }
                return nil
            }
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
                    self.mobileClientStatusChanged(userState: .signedIn,
                                                   additionalInfo: [self.ProviderKey:providerName, self.TokenKey: token])
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
        
        if (self.userPoolClient == nil) { completionHandler(nil, AWSMobileClientError.userPoolNotConfigured(message: "Cognito User Pools is not configured in `awsconfiguration.json`. Please add Cognito User Pools before using this API."))}
        
        let userAttributesTransformed = userAttributes.map {AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1) }
        let validationDataTransformed = validationData.map {AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1) }
        
        self.userPoolClient?.signUp(username, password: password,
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
                        codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .email, destination: deliveryDetails.destination, attributeName: deliveryDetails.attributeName)
                    case .sms:
                        codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .sms, destination: deliveryDetails.destination, attributeName: deliveryDetails.attributeName)
                    case .unknown:
                        codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .unknown, destination: deliveryDetails.destination, attributeName: deliveryDetails.attributeName)
                    @unknown default:
                        codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .unknown, destination: deliveryDetails.destination, attributeName: deliveryDetails.attributeName)
                    }
                }
                completionHandler(SignUpResult(signUpState: confirmedStatus!, codeDeliveryDetails: codeDeliveryDetails), nil)
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
    
    private func handleHostedUISignOutResult(_ error: Error?, completionHandler: @escaping ((Error?) -> Void)) {
        if (error != nil) {
            completionHandler(AWSMobileClientError.makeMobileClientError(from: error!))
        } else {
            // If the cookie is successfully invalidated, we attempt to
            // revoke access tokens and then sign out locally.
            revokeAccessTokensAndSignOutLocally(completionHandler: completionHandler)
        }
    }
    
    
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
    
    private func revokeAccessTokensAndSignOutLocally(completionHandler: @escaping ((Error?) -> Void)) {
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
    
    internal func performUserPoolSuccessfulSignInTasks(session: AWSCognitoIdentityUserSession) {
        let tokenString = session.idToken!.tokenString
        self.developerNavigationController = nil
        self.cachedLoginsMap = [self.userPoolClient!.identityProviderName: tokenString]
        postSignInKeychainAndCredentialsUpdate(provider: .userPools,
                                               additionalInfo: [ProviderKey:self.userPoolClient!.identityProviderName, TokenKey:tokenString])
    }
    
    internal func performHostedUISuccessfulSignInTasks(disableFederation: Bool = false,
                                                       session: AWSCognitoAuthUserSession,
                                                       federationToken: String,
                                                       federationProviderIdentifier: String? = nil,
                                                       signInInfo: inout [String: String]) {
        federationDisabled = disableFederation
        if federationProviderIdentifier == nil {
            self.cachedLoginsMap = [self.userPoolClient!.identityProviderName: federationToken]
        } else {
            self.cachedLoginsMap = [federationProviderIdentifier!: federationToken]
        }
        postSignInKeychainAndCredentialsUpdate(provider: .hostedUI,
                                               additionalInfo: signInInfo)
    }
    
    internal func performFederatedSignInTasks(provider: String, token: String) {
        self.cachedLoginsMap = [provider:token]
        self.federationProvider = .oidcFederation
        postSignInKeychainAndCredentialsUpdate(provider: .oidcFederation,
                                               additionalInfo: [ProviderKey:provider, TokenKey: token])
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

    /// Fetches the `AWSCredentials` asynchronously.
    ///
    /// - Parameter completionHandler: completionHandler which would have `AWSCredentials` if successfully retrieved, else error.
    public func getAWSCredentials(_ completionHandler: @escaping(AWSCredentials?, Error?) -> Void) {
        if self.internalCredentialsProvider == nil {
            completionHandler(nil, AWSMobileClientError.cognitoIdentityPoolNotConfigured(message: "There is no valid cognito identity pool configured in `awsconfiguration.json`."))
        }
        
        let cancellationToken = self.credentialsFetchCancellationSource
        let operation = AWSAsyncBlockOperation { done in
            self.internalCredentialsProvider?.credentials(withCancellationToken: cancellationToken).continueWith(block: { (task) -> Any? in
                // If we have called cancellation already, leave the block without doing anything
                // with the fetched credentials.
                if (task.isCancelled || cancellationToken.isCancellationRequested) {
                    completionHandler(task.result, task.error)
                    done()
                    return nil
                }

                if let error = task.error {
                    if error._domain == AWSCognitoIdentityErrorDomain
                        && error._code == AWSCognitoIdentityErrorType.notAuthorized.rawValue
                        && self.federationProvider == .none {

                        completionHandler(nil, AWSMobileClientError.guestAccessNotAllowed(message: "Your backend is not configured with cognito identity pool to allow guest access. Please allow un-authenticated access to identity pool to use this feature."))
                        done()
                    } else if error._domain == AWSCognitoIdentityErrorDomain
                        && error._code == AWSCognitoIdentityErrorType.notAuthorized.rawValue
                        && self.federationProvider == .oidcFederation {
                        // store a reference to the completion handler which we would be calling later on.
                        self.pendingAWSCredentialsCompletion = { credentials, error in
                            completionHandler(credentials, error)
                            done()
                        }
                        
                        self.mobileClientStatusChanged(userState: .signedOutFederatedTokensInvalid, additionalInfo: [self.ProviderKey:self.cachedLoginsMap.first!.key])
                    } else {
                        completionHandler(nil, error)
                        done()
                    }
                } else if let result = task.result {
                    if(self.federationProvider == .none && self.currentUserState != .guest) {
                        self.mobileClientStatusChanged(userState: .guest, additionalInfo: [:])
                    }
                    completionHandler(result, nil)
                    done()
                }
                
                return nil
            })
        }
        credentialsFetchOperationQueue.addOperation(operation)
    }

    /// Invoke this function to release any sign-in waits.
    /// When you receive a notifcation which is `signedOutFederatedTokensInvalid` or `signedOutUserPoolsTokensInvalid` you need to proovide SDK the token via `federate` method or call the `signIn` method and complete the sign-in flow. If you can't get the latest token from the user, you can call this method to un-block any waiting calls.
    public func releaseSignInWait() {
        if self.federationProvider == .userPools {
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource?.set(error: AWSMobileClientError.unableToSignIn(message: "Unable to get valid sign in session from the end user."))
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource = nil
            self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource?.set(error: AWSMobileClientError.unableToSignIn(message: "Unable to get valid sign in session from the end user."))
            self.userpoolOpsHelper.customAuthChallengeTaskCompletionSource = nil
        } else if self.federationProvider == .hostedUI {
            self.pendingGetTokensCompletion?(nil, AWSMobileClientError.unableToSignIn(message: "Could not get valid token from the user."))
            self.pendingGetTokensCompletion = nil
        } else if self.federationProvider == .oidcFederation {
            self.pendingAWSCredentialsCompletion?(nil, AWSMobileClientError.unableToSignIn(message: "Could not get valid federation token from the user."))
            self.pendingAWSCredentialsCompletion = nil
        }
    }

    /// Returns cached UserPools auth JWT tokens if valid.
    /// If the `idToken` is not valid, and a refresh token is available, refresh token is used to get a new `idToken`.
    /// If there is no refresh token and the user is signed in, a notification is dispatched to indicate requirement of user to re-signin.
    /// The call to wait will be synchronized so that if multiple threads call this method, they will block till the first thread gets the token.
    ///
    /// - Parameter completionHandler: Tokens if available, else error.
    public func getTokens(_ completionHandler: @escaping (Tokens?, Error?) -> Void) {
        switch self.federationProvider {
        case .userPools, .hostedUI:
            break
        default:
            completionHandler(nil, AWSMobileClientError.notSignedIn(message: notSignedInErrorMessage))
            return
        }
        
        if self.federationProvider == .hostedUI {
            let operation = AWSAsyncBlockOperation { done in
                AWSCognitoAuth(forKey: self.CognitoAuthRegistrationKey).getSession({ (session, error) in
                    if let sessionError = error,
                        (sessionError as NSError).domain == AWSCognitoAuthErrorDomain,
                        let errorType = AWSCognitoAuthClientErrorType(rawValue: (sessionError as NSError).code),
                        (errorType == .errorExpiredRefreshToken) {
                        self.pendingGetTokensCompletion = { tokens, error in
                            completionHandler(tokens, error)
                            done()
                        }
                        self.invalidateCachedTemporaryCredentials()
                        self.mobileClientStatusChanged(userState: .signedOutUserPoolsTokenInvalid,
                                                       additionalInfo: [self.ProviderKey:"OAuth"])
                        return
                    } else if let session = session {
                        completionHandler(self.getTokensForCognitoAuthSession(session: session), nil)
                        done()
                    } else {
                        completionHandler(nil, error)
                        done()
                    }
                })
            }
            tokenFetchOperationQueue.addOperation(operation)
            return
        }
        if self.federationProvider == .userPools {
            self.userpoolOpsHelper.userpoolClient?.delegate = self.userpoolOpsHelper
            self.userpoolOpsHelper.authHelperDelegate = self
            let operation = AWSAsyncBlockOperation { done in
                self.currentUser?.getSession().continueWith(block: { (task) -> Any? in
                    if let error = task.error {
                        completionHandler(nil, error)
                        self.invokeSignInCallback(signResult: nil, error: error)
                    } else if let session = task.result {
                        completionHandler(self.userSessionToTokens(userSession: session), nil)
                        self.federationProvider = .userPools
                        if (self.currentUserState != .signedIn) {
                            self.mobileClientStatusChanged(userState: .signedIn, additionalInfo: [:])
                        }
                        self.invokeSignInCallback(signResult: SignInResult(signInState: .signedIn), error: nil)
                    }
                    defer {
                        done()
                    }
                    return nil
                })
            }
            tokenFetchOperationQueue.addOperation(operation)
            return
        }
    }

    internal func userSessionToTokens(userSession: AWSCognitoIdentityUserSession) -> Tokens {
        var idToken: SessionToken?
        var accessToken: SessionToken?
        var refreshToken: SessionToken?
        if userSession.idToken != nil {
            idToken = SessionToken(tokenString: userSession.idToken?.tokenString)
        }
        if userSession.accessToken != nil {
            accessToken = SessionToken(tokenString: userSession.accessToken?.tokenString)
        }
        if userSession.refreshToken != nil {
            refreshToken = SessionToken(tokenString: userSession.refreshToken?.tokenString)
        }
        return Tokens(idToken: idToken, accessToken: accessToken, refreshToken: refreshToken, expiration: userSession.expirationTime)
    }

}

//MARK: Extension to hold user attribute operations
extension AWSMobileClient {

    var notSignedInErrorMessage: String {
        return "User is not signed in to Cognito User Pool, please sign in to use this API."
    }

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
            completionHandler(nil, AWSMobileClientError.notSignedIn(message: notSignedInErrorMessage))
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
            completionHandler(nil, AWSMobileClientError.notSignedIn(message: notSignedInErrorMessage))
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
            completionHandler(nil, AWSMobileClientError.notSignedIn(message: notSignedInErrorMessage))
            return
        }
        guard let currentActiveUser = self.userpoolOpsHelper.currentActiveUser else {
            completionHandler(nil, AWSMobileClientError.notSignedIn(message: self.notSignedInErrorMessage))
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
            completionHandler(AWSMobileClientError.notSignedIn(message: notSignedInErrorMessage))
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
            completionHandler(AWSMobileClientError.notSignedIn(message: notSignedInErrorMessage))
            return
        }
        let userDetails = AWSMobileClientUserDetails(with: self.userpoolOpsHelper.currentActiveUser!)
        userDetails.confirmVerifyUserAttribute(attributeName: attributeName,
                                               code: code,
                                               completionHandler: completionHandler)
    }
}

//MARK: Extension to hold UserPoolAuthHelperlCallbacks methods
extension AWSMobileClient: UserPoolAuthHelperlCallbacks {
    
    func getPasswordDetails(_ authenticationInput: AWSCognitoIdentityPasswordAuthenticationInput,
                            passwordAuthenticationCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>) {
        
        // getPasswordDetails for customAuth will be called when the session expires.
        // This call would be triggered from getSession(). In this case we donot need
        // to inform the user that the session is expired, because that is handled by
        // getCustomAuthenticationDetails.
        if(self.userPoolClient?.isCustomAuth ?? false) {
            let authDetails = AWSCognitoIdentityPasswordAuthenticationDetails(username: self.currentUser?.username ?? "",
                                                                              password: userPassword ?? "dummyPassword")
            passwordAuthenticationCompletionSource.set(result: authDetails)
            userPassword = nil
            return
        }
        if (self.federationProvider != .userPools) {
            passwordAuthenticationCompletionSource.set(error: AWSMobileClientError.notSignedIn(message: notSignedInErrorMessage))
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

//MARK: Extension to hold the keychain methods
extension AWSMobileClient {
    
    internal func setLoginProviderMetadataAndSaveInKeychain(provider: FederationProvider) {
        self.federationProvider = provider
        self.keychain.setString(provider.rawValue, forKey: FederationProviderKey)
        if let customRoleArn = self.customRoleArnInternal {
            self.keychain.setString(customRoleArn, forKey: CustomRoleArnKey)
        } else {
            self.keychain.removeItem(forKey: CustomRoleArnKey)
        }
        if federationDisabled {
            self.keychain.setString("true", forKey: FederationDisabledKey)
        }
    }
    
    internal func saveOAuthURIQueryParametersInKeychain() {
        self.keychain.setData(JSONHelper.dataFromDictionary(self.signInURIQueryParameters), forKey: SignInURIQueryParametersKey)
        self.keychain.setData(JSONHelper.dataFromDictionary(self.tokenURIQueryParameters), forKey: TokenURIQueryParametersKey)
        self.keychain.setData(JSONHelper.dataFromDictionary(self.signOutURIQueryParameters), forKey: SignOutURIQueryParametersKey)
    }
    
    internal func loadOAuthURIQueryParametersFromKeychain() {
        self.signInURIQueryParameters = JSONHelper.dictionaryFromData(self.keychain.data(forKey: SignInURIQueryParametersKey))
        self.tokenURIQueryParameters = JSONHelper.dictionaryFromData(self.keychain.data(forKey: TokenURIQueryParametersKey))
        self.signOutURIQueryParameters = JSONHelper.dictionaryFromData(self.keychain.data(forKey: SignOutURIQueryParametersKey))
    }
    
    internal func loadHostedUIScopesFromKeychain() {
        self.scopes = JSONHelper.arrayFromData(self.keychain.data(forKey: HostedUIOptionsScopesKey))
    }
    
    internal func saveHostedUIOptionsScopesInKeychain() {
        self.keychain.setData(JSONHelper.dataFromArray(self.scopes), forKey: HostedUIOptionsScopesKey)
    }
    
    internal func clearHostedUIOptionsScopesFromKeychain() {
        self.keychain.removeItem(forKey: HostedUIOptionsScopesKey)
    }
    
    internal func saveLoginsMapInKeychain() {
        if self.cachedLoginsMap.count == 0 {
            self.keychain.removeItem(forKey: LoginsMapKey)
            self.keychain.removeItem(forKey: FederationDisabledKey)
        } else {
            do {
                let data = try Data.init(base64Encoded: JSONEncoder().encode(self.cachedLoginsMap).base64EncodedData())
                self.keychain.setData(data, forKey: LoginsMapKey)
            } catch {
                print("could not save login map in cache")
            }
        }
    }
    
    internal func loadLoginsMapFromKeychain() {
        let data = self.keychain.data(forKey: LoginsMapKey)
        if data != nil {
            do {
                let dict = try JSONDecoder().decode([String: String].self, from: data!)
                self.cachedLoginsMap = dict
            } catch {
                print("Could not load login map from cache")
            }
        } else {
            self.cachedLoginsMap = [:]
        }
    }
    
    internal func loadFederationProviderMetadataFromKeychain() {
        if let federationProviderString = self.keychain.string(forKey: FederationProviderKey),
            let federationProvider = FederationProvider(rawValue: federationProviderString) {
            self.federationProvider = federationProvider
        }
        if let customRoleArnString = self.keychain.string(forKey: CustomRoleArnKey) {
            self.customRoleArnInternal = customRoleArnString
        }
        if let _ = self.keychain.string(forKey: FederationDisabledKey) {
            self.federationDisabled = true
        }
    }
}

extension AWSMobileClient: AWSCognitoAuthDelegate {
    
    public func getViewController() -> UIViewController {
        // This should never get called based on the design
        if (developerNavigationController?.visibleViewController != nil) {
            return developerNavigationController!.visibleViewController!
        }
        return UIApplication.shared.keyWindow!.rootViewController!
    }
    
    public func shouldLaunchSignInVCIfRefreshTokenIsExpired() -> Bool {
        return false
    }
}
