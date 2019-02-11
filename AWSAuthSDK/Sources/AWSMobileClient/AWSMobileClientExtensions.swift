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
            
            let paddedLength = claims.count + (4 - (claims.count % 4)) % 4
            //JWT is not padded with =, pad it if necessary
            let updatedClaims = claims.padding(toLength: paddedLength, withPad: "=", startingAt: 0)
            let claimsData = Data.init(base64Encoded: updatedClaims, options: .ignoreUnknownCharacters)
            
            guard claimsData != nil else {
                print("Cannot get claims in `Data` form. Token is not valid base64 encoded string.")
                return nil
            }
            let jsonObject = try? JSONSerialization.jsonObject(with: claimsData!, options: [])
            guard jsonObject != nil else {
                print("Cannot get claims in `Data` form. Token is not valid JSON string.")
                return nil
            }
            return jsonObject as? [String: AnyObject]
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
    
    internal init(idToken: SessionToken?, accessToken: SessionToken?, refreshToken: SessionToken?, expiration: Date?) {
        self.idToken = idToken
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expiration = expiration
    }
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
            self.getTokens { (tokens, error) in
                if let tokens = tokens {
                    dict[self.userPoolClient!.identityProviderName] = tokens.idToken!.tokenString!
                    userPoolsTokenTask.set(result: dict as NSDictionary)
                } else if let error = error {
                    userPoolsTokenTask.set(error: error)
                }
            }
            
            return userPoolsTokenTask.task
        } else if federationProvider == .oidcFederation {
            dict.addEntries(from: self.cachedLoginsMap)
        }
        let task = AWSTask.init(result: dict as NSDictionary)
        return task
    }
    
    internal func saveLoginsMapInKeychain() {
        if self.cachedLoginsMap.count == 0 {
           self.keychain.removeItem(forKey: "loginsMap")
        } else {
            do {
                let data = try Data.init(base64Encoded: JSONEncoder().encode(self.cachedLoginsMap).base64EncodedData())
                self.keychain.setData(data, forKey: "loginsMap")
            } catch {
                print("could not save login map in cache")
            }
        }
    }
    
    internal func loadLoginsMapFromKeychain() {
        let data = self.keychain.data(forKey: "loginsMap")
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
    
    /// Federates a social provider like Google, Facebook, Amazon or Twitter.
    /// If user is already signed in through the `signIn` method, it will return `AWSMobileClientError.federationProviderExists` error.
    /// If federation provider name has changed, previous federation provider's token will be erased and the new token will be used going forward; the user state is un-affected in that case.
    ///
    /// - Parameters:
    ///   - providerName: Provider name for federation provider, e.g. graph.facebook.com, accounts.google.com
    ///   - token: The `idToken`
    ///   - completionHandler: completion handler on successful credentials fetch.
    public func federatedSignIn(providerName: String, token: String, federatedSignInOptions: FederatedSignInOptions = FederatedSignInOptions(), completionHandler: @escaping ((UserState?, Error?) -> Void)) {
        
        self.tokenFetchOperationQueue.addOperation {
            var error: Error?
            
            // At the end of operation if there is an error anywhere in the flow, we return it back to the developer; else return a successful signedIn state.
            defer {
                if error == nil {
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
                self.performFederatedSignInTasks(provider: providerName, token: token)
                // If any credentials operation is pending, we invoke the waiting block to resume with new credentials
                if (self.pendingAWSCredentialsCompletion != nil) {
                    self.internalCredentialsProvider?.credentials().continueWith(block: { (task) -> Any? in
                        if let credentials = task.result {
                            self.pendingAWSCredentialsCompletion?(credentials, nil)
                        } else if let error = task.error {
                            self.pendingAWSCredentialsCompletion?(nil, error)
                        }
                        self.credentialsFetchLock.leave()
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
                self.performFederatedSignInTasks(provider: providerName, token: token)
            }
        }
    }
    
    
    /// Utility class which maps a service error to `AWSMobileClientError`. If no mapping is available, returns the original error.
    internal func getMobileError(for error: Error) -> Error {
        if error._domain == AWSCognitoIdentityProviderErrorDomain {
            let message = (error as NSError).userInfo["message"] as! String
            let type = (error as NSError).userInfo["__type"] as! String
            let mobileError = AWSMobileClient.ErrorMappingHelper(errorCode: type, message: message, error: error as NSError)
            return mobileError
        }
        return error
    }
    
    
    /// Sign up with username, password and other attrbutes like phone, email.
    ///
    /// - Parameters:
    ///   - username: username of the user.
    ///   - password: password of the user
    ///   - userAttributes: user attributes which contain attributes like phone_number, email, etc.
    ///   - validationData: validation data for the user.
    ///   - completionHandler: completionHandler which will be called when a sign up result is available.
    public func signUp(username: String,
                       password: String,
                       userAttributes: [String: String] = [:],
                       validationData: [String: String] = [:],
                       completionHandler: @escaping ((SignUpResult?, Error?) -> Void)) {
        
        if (self.userPoolClient == nil) { completionHandler(nil, AWSMobileClientError.userPoolNotConfigured(message: "Cognito User Pools is not configured in `awsconfiguration.json`. Please add Cognito User Pools before using this API."))}
        
        let userAttributesTransformed = userAttributes.map {AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1) }
        let validationDataTransformed = validationData.map {AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1) }
        
        self.userPoolClient?.signUp(username, password: password,
                                   userAttributes: userAttributesTransformed.count == 0 ? nil : userAttributesTransformed,
                                   validationData: validationDataTransformed.count == 0 ? nil : validationDataTransformed).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, self.getMobileError(for: error))
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
    ///   - completionHandler: completionHandler which will be called when a result is available.
    public func confirmSignUp(username: String, confirmationCode: String, completionHandler: @escaping ((SignUpResult?, Error?) -> Void)) {
        if let uname = self.userpoolOpsHelper.signUpUser?.username, uname == username {
            confirmSignUp(user: self.userpoolOpsHelper.signUpUser!, confirmationCode: confirmationCode, completionHandler: completionHandler)
        } else {
            let user = self.userPoolClient?.getUser(username)
            confirmSignUp(user: user!, confirmationCode: confirmationCode, completionHandler: completionHandler)
        }
    }
    
    internal func confirmSignUp(user: AWSCognitoIdentityUser, confirmationCode: String, completionHandler: @escaping ((SignUpResult?, Error?) -> Void)) {
        user.confirmSignUp(confirmationCode).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, self.getMobileError(for: error))
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
    ///   - completionHandler: completionHandler which will be called when a result is available.
    public func resendSignUpCode(username: String, completionHandler: @escaping ((SignUpResult?, Error?) -> Void)) {
        if let uname = self.userpoolOpsHelper.signUpUser?.username, uname == username {
            resendSignUpCode(user: self.userpoolOpsHelper.signUpUser!, completionHandler: completionHandler)
        } else {
            let user = self.userPoolClient?.getUser(username)
            resendSignUpCode(user: user!, completionHandler: completionHandler)
        }
    }
    
    internal func resendSignUpCode(user: AWSCognitoIdentityUser, completionHandler: @escaping ((SignUpResult?, Error?) -> Void)) {
        user.resendConfirmationCode().continueWith(block: { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, self.getMobileError(for: error))
            } else if let result = task.result {
                let confirmedStatus: SignUpConfirmationState = .unconfirmed
                var codeDeliveryDetails: UserCodeDeliveryDetails? = nil
                if let deliveryDetails = result.codeDeliveryDetails {
                    codeDeliveryDetails = self.getUserCodeDeliveryDetails(deliveryDetails)
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
    ///   - completionHandler: completionHandler which will be called when result is available.
    public func forgotPassword(username: String, completionHandler: @escaping ((ForgotPasswordResult?, Error?) -> Void)) {
        let user = self.userPoolClient?.getUser(username)
        user!.forgotPassword().continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, self.getMobileError(for: error))
            } else if let result = task.result {
                var codeDeliveryDetails: UserCodeDeliveryDetails? = nil
                if let deliveryDetails = result.codeDeliveryDetails {
                    codeDeliveryDetails = self.getUserCodeDeliveryDetails(deliveryDetails)
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
    ///   - completionHandler: completionHandler which will be called when a result is available.
    public func confirmForgotPassword(username: String, newPassword: String, confirmationCode: String, completionHandler: @escaping ((ForgotPasswordResult?, Error?) -> Void)) {
        let user = self.userPoolClient?.getUser(username)
        user!.confirmForgotPassword(confirmationCode, password: newPassword).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, self.getMobileError(for: error))
            } else if let _ = task.result {
                completionHandler(ForgotPasswordResult(forgotPasswordState: .done, codeDeliveryDetails: nil), nil)
            }
            return nil
        }
    }
    
    
    /// Signs in a user with the given username and password.
    ///
    /// - Parameters:
    ///   - username: username of the user.
    ///   - password: password of the user.
    ///   - validationData: validation data for this sign in.
    ///   - completionHandler: completionHandler which will be called when result is available.
    public func signIn(username: String, password: String, validationData: [String: String]? = nil, completionHandler: @escaping ((SignInResult?, Error?) -> Void)) {
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
        } else {
            user!.getSession(username, password: password, validationData: validationAttributes).continueWith { (task) -> Any? in
                if let error = task.error {
                    self.userpoolOpsHelper.currentSignInHandlerCallback?(nil, self.getMobileError(for: error))
                    self.userpoolOpsHelper.currentSignInHandlerCallback = nil
                } else if let result = task.result {
                    self.internalCredentialsProvider?.clearCredentials()
                    self.federationProvider = .userPools
                    let signInResult = SignInResult(signInState: .signedIn)
                    self.userpoolOpsHelper.currentSignInHandlerCallback?(signInResult, nil)
                    self.userpoolOpsHelper.currentSignInHandlerCallback = nil
                    self.performUserPoolSuccessfulSignInTasks(session: result)
                }
                return nil
            }
        }
    }
    
    /// Signs out the current logged in user and clears the local keychain store.
    public func signOut() {
        self.cachedLoginsMap = [:]
        self.saveLoginsMapInKeychain()
        self.internalCredentialsProvider?.clearKeychain()
        self.performUserPoolSignOut()
        self.federationProvider = .none
        self.internalCredentialsProvider?.identityProvider.identityId = nil
        self.mobileClientStatusChanged(userState: .signedOut, additionalInfo: [:])
    }
    
    internal func performUserPoolSuccessfulSignInTasks(session: AWSCognitoIdentityUserSession) {
        let tokenString = session.idToken!.tokenString
        self.cachedLoginsMap = [self.userPoolClient!.identityProviderName: tokenString]
        self.mobileClientStatusChanged(userState: .signedIn, additionalInfo: [ProviderKey:self.userPoolClient!.identityProviderName, TokenKey:tokenString])
        self.federationProvider = .userPools
        self.saveLoginsMapInKeychain()
        self.internalCredentialsProvider?.clearCredentials()
        self.internalCredentialsProvider?.credentials()
    }
    
    internal func performFederatedSignInTasks(provider: String, token: String) {
        self.cachedLoginsMap = [provider:token]
        self.mobileClientStatusChanged(userState: .signedIn, additionalInfo: [ProviderKey:provider, TokenKey: token])
        self.federationProvider = .oidcFederation
        self.saveLoginsMapInKeychain()
        self.internalCredentialsProvider?.clearCredentials()
        self.internalCredentialsProvider?.credentials()
    }
    
    
    /// Confirm a sign in which requires additional validation via steps like SMS MFA.
    ///
    /// - Parameters:
    ///   - challengeResponse: confirmation code or TOTP token which is available to the user.
    ///   - completionHandler: completionHandler which will be called when result is available.
    public func confirmSignIn(challengeResponse: String, completionHandler: @escaping ((SignInResult?, Error?) -> Void)) {
        if (self.userpoolOpsHelper.mfaCodeCompletionSource != nil) {
            self.userpoolOpsHelper.currentSignInHandlerCallback = completionHandler
            self.userpoolOpsHelper.mfaCodeCompletionSource?.set(result: challengeResponse as NSString)
        } else if (self.userpoolOpsHelper.newPasswordRequiredTaskCompletionSource != nil) {
            self.userpoolOpsHelper.currentSignInHandlerCallback = completionHandler
            self.userpoolOpsHelper.newPasswordRequiredTaskCompletionSource?.set(result: AWSCognitoIdentityNewPasswordRequiredDetails.init(proposedPassword: challengeResponse, userAttributes: [String:String]()))
        } else {
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
                completionHandler(error)
            } else if let _ = task.result {
                completionHandler(nil)
            }
            return nil
        }
    }
    
    
    /// Verify a user attribute like phone_number.
    ///
    /// - Parameters:
    ///   - attributeName: name of the attribute.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func verifyUserAttribute(attributeName: String, completionHandler: @escaping ((UserCodeDeliveryDetails?, Error?) -> Void)) {
        self.userpoolOpsHelper.currentActiveUser!.getAttributeVerificationCode(attributeName).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, self.getMobileError(for: error))
            } else if let result = task.result {
                var codeDeliveryDetails: UserCodeDeliveryDetails? = nil
                if let deliveryDetails = result.codeDeliveryDetails {
                    codeDeliveryDetails = self.getUserCodeDeliveryDetails(deliveryDetails)
                }
                completionHandler(codeDeliveryDetails, nil)
            }
            return nil
        }
    }
    
    
    /// Update the attributes for a user.
    ///
    /// - Parameters:
    ///   - attributeMap: the attribute map of the user.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func updateUserAttributes(attributeMap: [String: String], completionHandler: @escaping (([UserCodeDeliveryDetails]?, Error?) -> Void)) {
        let attributes = attributeMap.map {AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1) }
        self.userpoolOpsHelper.currentActiveUser!.update(attributes).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(nil, self.getMobileError(for: error))
            } else if let result = task.result {
                var codeDeliveryDetailsList: [UserCodeDeliveryDetails] = []
                if result.codeDeliveryDetailsList != nil {
                    for codeDeliveryDetail in result.codeDeliveryDetailsList! {
                        codeDeliveryDetailsList.append(self.getUserCodeDeliveryDetails(codeDeliveryDetail))
                    }
                }
                completionHandler(codeDeliveryDetailsList, nil)
            }
            return nil
        }
    }
    
    
    /// Fetches the attributes for logged in user.
    ///
    /// - Parameter completionHandler: completion handler which will be invoked when result is available.
    public func getUserAttributes(completionHandler: @escaping (([String: String]?, Error?) -> Void)) {
        self.userpoolOpsHelper.currentActiveUser!.getDetails().continueWith { (task) -> Any? in
            if let error = task.error {
               completionHandler(nil, self.getMobileError(for: error))
            } else if let result = task.result {
                let userAttributes = result.userAttributes
                var attributesMap = [String: String]()
                if let userAttributes = userAttributes {
                    for attribute in userAttributes {
                        guard attribute.name != nil, attribute.value != nil else {continue}
                        attributesMap[attribute.name!] = attribute.value!
                    }
                }
                completionHandler(attributesMap, nil)
            }
            return nil
        }
    }
    
    
    /// Confirm the updated attributes using a confirmation code.
    ///
    /// - Parameters:
    ///   - attributeName: the attribute to be confirmed.
    ///   - code: the code sent to the user.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func confirmUpdateUserAttributes(attributeName: String, code: String, completionHandler: @escaping ((Error?) -> Void)) {
        self.confirmVerifyUserAttribute(attributeName: attributeName, code: code, completionHandler: completionHandler)
    }
    
    
    /// Confirm the attribute using a confirmation code.
    ///
    /// - Parameters:
    ///   - attributeName: the attribute to be verified.
    ///   - code: the code sent to the user.
    ///   - completionHandler: completionHandler which will be called when the result is avilable.
    public func confirmVerifyUserAttribute(attributeName: String, code: String, completionHandler: @escaping ((Error?) -> Void)) {
        self.userpoolOpsHelper.currentActiveUser!.verifyAttribute(attributeName, code: code).continueWith { (task) -> Any? in
            if let error = task.error {
                completionHandler(self.getMobileError(for: error))
            } else if let _ = task.result {
                completionHandler(nil)
            }
            return nil
        }
    }
    
    internal func getUserCodeDeliveryDetails(_ deliveryDetails: AWSCognitoIdentityProviderCodeDeliveryDetailsType) -> UserCodeDeliveryDetails {
        var codeDeliveryDetails: UserCodeDeliveryDetails?
        switch(deliveryDetails.deliveryMedium) {
        case .email:
            codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .email, destination: deliveryDetails.destination, attributeName: deliveryDetails.attributeName)
        case .sms:
            codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .sms, destination: deliveryDetails.destination, attributeName: deliveryDetails.attributeName)
        case .unknown:
            codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .unknown, destination: deliveryDetails.destination, attributeName: deliveryDetails.attributeName)
        }
        return codeDeliveryDetails!
    }
    
    internal func performUserPoolSignOut() {
        self.userpoolOpsHelper.passwordAuthTaskCompletionSource?.set(error: AWSMobileClientError.unableToSignIn(message: "Could not get end user to sign in."))
        self.userpoolOpsHelper.passwordAuthTaskCompletionSource = nil
        self.userpoolOpsHelper.currentSignInHandlerCallback?(nil, AWSMobileClientError.unableToSignIn(message: "Could not get end user to sign in."))
        self.userpoolOpsHelper.currentSignInHandlerCallback = nil
        self.userPoolClient?.clearAll()
    }
    
    
    /// Fetches the `AWSCredentials` asynchronously.
    ///
    /// - Parameter completionHandler: completionHandler which would have `AWSCredentials` if successfully retrieved, else error.
    public func getAWSCredentials(_ completionHandler: @escaping(AWSCredentials?, Error?) -> Void) {
        if self.internalCredentialsProvider == nil {
            completionHandler(nil, AWSMobileClientError.cognitoIdentityPoolNotConfigured(message: "There is no valid cognito identity pool configured in `awsconfiguration.json`."))
        }
        
        credentialsFetchOperationQueue.addOperation {
            self.credentialsFetchLock.enter()
            self.internalCredentialsProvider?.credentials().continueWith(block: { (task) -> Any? in
                if let error = task.error {
                    if error._domain == AWSCognitoIdentityErrorDomain
                        && error._code == AWSCognitoIdentityErrorType.notAuthorized.rawValue
                        && self.federationProvider == .none {
                        self.credentialsFetchLock.leave()
                        completionHandler(nil, AWSMobileClientError.guestAccessNotAllowed(message: "Your backend is not configured with cognito identity pool to allow guest acess. Please allow un-authenticated access to identity pool to use this feature."))
                    } else if error._domain == AWSCognitoIdentityErrorDomain
                        && error._code == AWSCognitoIdentityErrorType.notAuthorized.rawValue
                        && self.federationProvider == .oidcFederation {

                        self.mobileClientStatusChanged(userState: .signedOutFederatedTokensInvalid, additionalInfo: [self.ProviderKey:self.cachedLoginsMap.first!.key])
                        
                        // store a reference to the completion handler which we would be calling later on.
                        self.pendingAWSCredentialsCompletion = completionHandler
                    } else {
                        self.credentialsFetchLock.leave()
                        completionHandler(nil, error)
                    }
                } else if let result = task.result {
                    if(self.federationProvider == .none && self.currentUserState != .guest) {
                        self.mobileClientStatusChanged(userState: .guest, additionalInfo: [:])
                    }
                    self.credentialsFetchLock.leave()
                    completionHandler(result, nil)
                }
                return nil
            })
            self.credentialsFetchLock.wait()
        }
    }
    
    
    /// Invoke this function to release any sign-in waits.
    /// When you receive a notifcation which is `signedOutFederatedTokensInvalid` or `signedOutUserPoolsTokensInvalid` you need to proovide SDK the token via `federate` method or call the `signIn` method and complete the sign-in flow. If you can't get the latest token from the user, you can call this method to un-block any waiting calls.
    public func releaseSignInWait() {
        if self.federationProvider == .userPools {
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource?.set(error: AWSMobileClientError.unableToSignIn(message: "Unable to get valid sign in session from the end user."))
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource = nil
            self.tokenFetchLock.leave()
        } else if self.federationProvider == .oidcFederation {
            self.pendingAWSCredentialsCompletion?(nil, AWSMobileClientError.unableToSignIn(message: "Could not get valid federation token from."))
            self.pendingAWSCredentialsCompletion = nil
            self.credentialsFetchLock.leave()
        }
    }
    
    
    /// Returns cached UserPools auth JWT tokens if valid.
    /// If the `idToken` is not valid, and a refresh token is available, refresh token is used to get a new `idToken`.
    /// If there is no refresh token and the user is signed in, a notification is dispatched to indicate requirement of user to re-signin.
    /// The call to wait will be synchronized so that if multiple threads call this method, they will block till the first thread gets the token.
    ///
    /// - Parameter completionHandler: Tokens if available, else error.
    public func getTokens(_ completionHandler: @escaping (Tokens?, Error?) -> Void) {
        if (self.federationProvider !=  .userPools) {
            completionHandler(nil, AWSMobileClientError.notSignedIn(message: "User is not signed in, please sign in to use this API."))
            return
        }
        self.userpoolOpsHelper.userpoolClient?.delegate = self.userpoolOpsHelper
        self.userpoolOpsHelper.authHelperDelegate = self
        self.tokenFetchOperationQueue.addOperation {
            self.tokenFetchLock.enter()
            self.currentUser?.getSession().continueWith(block: { (task) -> Any? in
                if let error = task.error {
                    completionHandler(nil, error)
                    self.userpoolOpsHelper.currentSignInHandlerCallback?(nil, error)
                    self.userpoolOpsHelper.currentSignInHandlerCallback = nil
                } else if let session = task.result {
                    completionHandler(self.userSessionToTokens(userSession: session), nil)
                    self.federationProvider = .userPools
                    if (self.currentUserState != .signedIn) {
                        self.mobileClientStatusChanged(userState: .signedIn, additionalInfo: [:])
                    }
                    self.userpoolOpsHelper.currentSignInHandlerCallback?(SignInResult(signInState: .signedIn), nil)
                    self.userpoolOpsHelper.currentSignInHandlerCallback = nil
                }
                self.tokenFetchLock.leave()
                return nil
            })
            self.tokenFetchLock.wait()
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

extension AWSMobileClient: UserPoolAuthHelperlCallbacks{
    
    func getPasswordDetails(_ authenticationInput: AWSCognitoIdentityPasswordAuthenticationInput, passwordAuthenticationCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>) {
        if (self.federationProvider != .userPools) {
            passwordAuthenticationCompletionSource.set(error: AWSMobileClientError.notSignedIn(message: "User is not signed in, please sign in to use this API."))
        }
        switch self.currentUserState {
        case .signedIn, .signedOutUserPoolsTokenInvalid:
            self.userpoolOpsHelper.passwordAuthTaskCompletionSource = passwordAuthenticationCompletionSource
            self.mobileClientStatusChanged(userState: .signedOutUserPoolsTokenInvalid, additionalInfo: ["username":self.userPoolClient?.currentUser()?.username ?? ""])
        default:
            break
        }
    }
    
    func didCompletePasswordStepWithError(_ error: Error?) {
        if error != nil {
            self.userpoolOpsHelper.currentSignInHandlerCallback?(nil, self.getMobileError(for: error!))
            self.userpoolOpsHelper.currentSignInHandlerCallback = nil
        }
    }
    
    func getNewPasswordDetails(_ newPasswordRequiredInput: AWSCognitoIdentityNewPasswordRequiredInput, newPasswordRequiredCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails>) {
        self.userpoolOpsHelper.newPasswordRequiredTaskCompletionSource = newPasswordRequiredCompletionSource
        let result = SignInResult(signInState: .newPasswordRequired, codeDetails: nil)
        self.userpoolOpsHelper.currentSignInHandlerCallback?(result, nil)
        self.userpoolOpsHelper.currentSignInHandlerCallback = nil
    }
    
    func didCompleteNewPasswordStepWithError(_ error: Error?) {
        if error != nil {
            self.userpoolOpsHelper.currentSignInHandlerCallback?(nil, self.getMobileError(for: error!))
            self.userpoolOpsHelper.currentSignInHandlerCallback = nil
        }
    }
    
    func getCode(_ authenticationInput: AWSCognitoIdentityMultifactorAuthenticationInput, mfaCodeCompletionSource: AWSTaskCompletionSource<NSString>) {
        self.userpoolOpsHelper.mfaCodeCompletionSource = mfaCodeCompletionSource
        var codeDeliveryDetails: UserCodeDeliveryDetails? = nil
            switch(authenticationInput.deliveryMedium) {
            case .email:
                codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .email, destination: authenticationInput.destination, attributeName: "email")
            case .sms:
                codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .sms, destination: authenticationInput.destination, attributeName: "phone")
            case .unknown:
                codeDeliveryDetails = UserCodeDeliveryDetails(deliveryMedium: .unknown, destination: authenticationInput.destination, attributeName: "unknown")
            }
        
        let result = SignInResult(signInState: .smsMFA, codeDetails: codeDeliveryDetails)
        self.userpoolOpsHelper.currentSignInHandlerCallback?(result, nil)
        self.userpoolOpsHelper.currentSignInHandlerCallback = nil
    }
    
    func didCompleteMultifactorAuthenticationStepWithError(_ error: Error?) {
        if error != nil {
            self.userpoolOpsHelper.currentSignInHandlerCallback?(nil, self.getMobileError(for: error!))
            self.userpoolOpsHelper.currentSignInHandlerCallback = nil
        }
    }
    
}
