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

extension FetchUserPoolTokensOperation {
    enum TokenFetchState {
        case notStarted
        case fetching
        case waitingForSignIn
        case releasedSignInWait
        case fetched(Tokens)
        case error (TokenFetchError)

        func resolveState(event: TokenFetchEvent) -> TokenFetchState {
            switch self {
            case .notStarted:
                if event == .startOperation {
                    return .fetching
                }
                if event == .releaseWait {
                    return .releasedSignInWait
                }
            case .fetching:
                if event == .tokenExpired {
                    return .waitingForSignIn
                }
                if case .tokenFetched(let tokens) = event {
                    return .fetched(tokens)
                }
                if case .serviceError(let error) = event {
                    return .error(.serviceError(error))
                }
                if event == .signedOut {
                    return .error(.noUserFound)
                }
                if event == .noUserFound {
                    return .error(.noUserFound)
                }
            case .waitingForSignIn:
                if event == .signedIn {
                    return .fetching
                }
                if event == .releaseWait {
                    return .error(.unableToSignIn)
                }
                if event == .signedOut {
                    return .error(.unableToSignIn)
                }
            case .releasedSignInWait:
                if event == .startOperation {
                    return .error(.unableToSignIn)
                }
            case .fetched, .error:
                break
            }
            return self
        }
    }
}

extension FetchUserPoolTokensOperation {

    enum TokenFetchEvent {
        case cancelled
        case startOperation
        case tokenFetched(Tokens)
        case tokenExpired
        case serviceError(Error)
        case signedIn
        case signedOut
        case releaseWait
        case noUserFound
    }
}

extension FetchUserPoolTokensOperation {
    enum TokenFetchError {
        case noUserFound
        case unableToSignIn
        case serviceError(Error)
    }
}

extension FetchUserPoolTokensOperation.TokenFetchState: Equatable {

    static func == (lhs: FetchUserPoolTokensOperation.TokenFetchState,
                    rhs: FetchUserPoolTokensOperation.TokenFetchState) -> Bool {
        switch (lhs, rhs) {

        case (.notStarted, .notStarted):
            return true
        case (.fetching, .fetching):
            return true
        case (.waitingForSignIn, .waitingForSignIn):
            return true
        case (.releasedSignInWait, .releasedSignInWait):
            return true
        case (.fetched, .fetched):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
}

extension FetchUserPoolTokensOperation.TokenFetchEvent: Equatable {
    static func == (lhs: FetchUserPoolTokensOperation.TokenFetchEvent,
                    rhs: FetchUserPoolTokensOperation.TokenFetchEvent) -> Bool {
        switch (lhs, rhs) {
        case (.cancelled, .cancelled):
            return true
        case (.startOperation, .startOperation):
            return true
        case (.tokenFetched, .tokenFetched):
            return true
        case (.tokenExpired, .tokenExpired):
            return true
        case (.serviceError, .serviceError):
            return true
        case (.signedIn, .signedIn):
            return true
        case (.signedOut, .signedOut):
            return true
        case (.releaseWait, .releaseWait):
            return true
        case (.noUserFound, .noUserFound):
            return true
        default:
            return false
        }
    }
}

extension FetchUserPoolTokensOperation.TokenFetchError: Equatable {
    static func == (lhs: FetchUserPoolTokensOperation.TokenFetchError,
                    rhs: FetchUserPoolTokensOperation.TokenFetchError) -> Bool {
        switch (lhs, rhs) {
        case (.noUserFound, .noUserFound):
            return true
        case (.unableToSignIn, .unableToSignIn):
            return true
        case (.serviceError, .serviceError):
            return true
        default:
            return false
        }
    }
}
