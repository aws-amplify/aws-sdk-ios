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

// MARK: `AWSIdentityProviderManager` protocol methods
extension AWSMobileClient: AWSIdentityProviderManager {

    /// Each entry in logins represents a single login with an identity provider. The key is the domain of the login provider
    /// (e.g. 'graph.facebook.com') and the value is the OAuth/OpenId Connect token that results from an authentication
    /// with that login provider.
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
