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
import AWSCognitoIdentityProvider

class FetchUserPoolTokensOperation: AWSAsyncOperation {

    // Used to identify the operation.
    //
    // Identifier is mainly used in logs to identify different
    // operations and its lifecycle
    private let identifier: String = UUID().uuidString

    // Completion to be called when the operation completes.
    //
    private let completion: TokenCompletion

    // Holds an instance of the user pool low level SDK
    //
    private let userPool: CognitoUserPoolBehavior
    
    public weak var delegate: FetchUserPoolTokensDelegate?
    private var tokenFetchState: TokenFetchState = .notStarted

    // Synchronizes access to `tokenFetchState`. The state is mutated through this queue, we should
    // make sure that the state is not mutated/read outside this queue.
    private let stateQueue = DispatchQueue(
        label: "com.amazonaws.awsmobileClient.tokenFetch.state",
        target: DispatchQueue.global())

    init(userPool: CognitoUserPoolBehavior = AWSUserPoolClientHelper.userPoolClient(for: "tokenFetchUserPool"),
         completion: @escaping TokenCompletion) {
        self.completion = completion
        self.userPool = userPool
        AWSMobileClientLogging.verbose("\(identifier) Created FetchUserPoolTokensOperation")
    }

    override func main() {
        AWSMobileClientLogging.verbose("\(identifier) Start execution")
        acceptEvent(.startOperation)
    }

    func acceptEvent(_ event: TokenFetchEvent) {
        stateQueue.async { [weak self] in
            guard let self = self else { return }

            let newState = self.tokenFetchState.resolveState(event: event)
            AWSMobileClientLogging.verbose("""
            \(self.identifier) \(self.tokenFetchState): \(event) -> \(newState)
            """)
            if newState == self.tokenFetchState { return }
            self.tokenFetchState = newState

            // Based on the newState perform the effect
            switch self.tokenFetchState {
            case .fetching:
                DispatchQueue.global().async {
                    self.fetchToken()
                }
            case .waitingForSignIn:
                DispatchQueue.global().async {
                    self.delegate?.tokenFetchNeedsAuthentication(operation: self)
                }

            case .fetched(let tokens):
                self.finishWithResult(tokens: tokens)

            case .error(let internalError):
                switch internalError {
                case .unableToSignIn:
                    self.finishWithUnableToSignIn()
                case .noUserFound:
                    self.finishWithNotSignedInError()
                case .serviceError(let error):
                    self.finishWithError(error: error)
                }
            default:
                break
            }
        }
    }

    func authStateChanged(_ state: UserState) {
        switch state {
        case .signedOut, .guest:
            acceptEvent(.signedOut)
        case .signedIn:
            acceptEvent(.signedIn)
        default:
            break
        }
    }

    private func fetchToken() {

        AWSMobileClientLogging.verbose("\(self.identifier) Inside fetch token")

        guard
            !self.isCancelled
        else {
            AWSMobileClientLogging.verbose("\(self.identifier) Cancelled")
            finish()
            return
        }

        guard
            let username = self.delegate?.getCurrentUsername(operation: self),
            !username.isEmpty
        else {
            AWSMobileClientLogging.verbose("\(self.identifier)  No User name")
            self.acceptEvent(.noUserFound)
            return
        }

        let user = self.userPool.getIdentityUser(username)
        user.getSession().continueWith { [weak self] task in
            guard let self = self else { return nil }

            guard
                !self.isCancelled
            else {
                AWSMobileClientLogging.verbose("\(self.identifier) Cancelled")
                self.finish()
                return nil
            }

            if let tokens = task.result {
                self.acceptEvent(.tokenFetched(tokens.mobileClientTokens))
                return nil

            } else if let error = task.error {

                // If the error returned is `InvalidAuthenticationDelegate` it means that userPool
                // client is trying to get authentication details, which means that the refresh
                // token is expired. In this case, we let the delegate know that it require
                // re-authentication and wait for the user to signIn.
                if (error as NSError).isAuthDelegateError {
                    AWSMobileClientLogging.verbose("\(self.identifier) Need re-authentication")
                    self.acceptEvent(.tokenExpired)

                } else {
                    self.acceptEvent(.serviceError(error))
                }
            }
            return nil
        }
    }

    private func finishWithUnableToSignIn() {
        let message = AWSMobileClientConstants.noValidSignInSession
        let error = AWSMobileClientError.unableToSignIn(message: message)
        finishWithError(error: error)
    }

    private func finishWithNotSignedInError() {
        let message = AWSMobileClientConstants.notSignedInMessage
        let error = AWSMobileClientError.notSignedIn(message: message)
        finishWithError(error: error)
    }
    
    private func finishWithResult(tokens: Tokens) {
        AWSMobileClientLogging.verbose("\(self.identifier) Success")
        completion(tokens, nil)
        finish()
    }

    private func finishWithError(error: Error) {
        AWSMobileClientLogging.verbose("\(self.identifier) Error")
        completion(nil, error)
        finish()
    }
}

extension NSError {
    var isAuthDelegateError: Bool {
        let authCode = AWSCognitoIdentityClientErrorType.providerClientErrorInvalidAuthenticationDelegate.rawValue
        if domain == AWSCognitoIdentityProviderErrorDomain,
           code == authCode  {
            return true
        }
        return false
    }
}
