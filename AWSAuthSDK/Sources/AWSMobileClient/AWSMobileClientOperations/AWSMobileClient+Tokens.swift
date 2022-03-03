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

public typealias TokenCompletion = (Tokens?, Error?) -> Void

extension AWSMobileClient {

    /// Returns cached UserPools auth JWT tokens if valid.
    /// If the `idToken` is not valid, and a refresh token is available, refresh token is used to get a new `idToken`.
    /// If there is no refresh token and the user is signed in, a notification is dispatched to indicate requirement of user to re-signin.
    /// The call to wait will be synchronized so that if multiple threads call this method, they will block till the first thread gets the token.
    ///
    /// - Parameter completionHandler: Tokens if available, else error.
    public func getTokens(_ completionHandler: @escaping TokenCompletion) {

        switch self.federationProvider {

        case .userPools:
            AWSMobileClientLogging.verbose("Adding FetchUserPoolTokensOperation operation")
            let operation = FetchUserPoolTokensOperation(completion: completionHandler)
            operation.delegate = self
            operation.completionBlock = { [weak self] in
                guard let index = self?.tokenOperations.firstIndex(of: operation) else {return}
                self?.tokenOperations.remove(at: index)
            }
            tokenOperations.append(operation)
            tokenFetchOperationQueue.addOperation(operation)

        case .hostedUI:
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
                        completionHandler(session.mobileClientTokens, nil)
                        done()
                    } else {
                        completionHandler(nil, error)
                        done()
                    }
                })
            }
            tokenFetchOperationQueue.addOperation(operation)
        default:
            let message = AWSMobileClientConstants.notSignedInMessage
            let error = AWSMobileClientError.notSignedIn(message: message)
            completionHandler(nil, error)
        }
    }
}

extension AWSMobileClient: FetchUserPoolTokensDelegate {

    func tokenFetchNeedsAuthentication(operation: FetchUserPoolTokensOperation) {
        let state = self.currentUserState
        guard state == .signedIn || state == .signedOutUserPoolsTokenInvalid else {
            return
        }

        self.invalidateCachedTemporaryCredentials()
        self.mobileClientStatusChanged(
            userState: .signedOutUserPoolsTokenInvalid,
            additionalInfo: ["username":self.userPoolClient?.currentUser()?.username ?? ""])
    }

    func getCurrentUsername(operation: FetchUserPoolTokensOperation) -> String? {
        username
    }


}
