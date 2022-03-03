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
import AWSCore

extension AWSMobileClient {

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
            AWSMobileClientLogging.verbose("Invoking hostedUI getTokens")
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
                        self.mobileClientStatusChanged(
                            userState: .signedOutUserPoolsTokenInvalid,
                            additionalInfo: [AWSMobileClientConstants.ProviderKey:"OAuth"])
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
            AWSMobileClientLogging.verbose("Invoking userPools getTokens")
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

    internal func getTokensForCognitoAuthSession(session: AWSCognitoAuthUserSession) -> Tokens {
        return Tokens(idToken: SessionToken(tokenString: session.idToken?.tokenString),
                      accessToken: SessionToken(tokenString: session.accessToken?.tokenString),
                      refreshToken: SessionToken(tokenString: session.refreshToken?.tokenString),
                      expiration: session.expirationTime)
    }
}
