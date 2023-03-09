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

import Foundation

/// Represents identity provider keys.
///
/// - facebook: The provider key for Facebook.
/// - google: The provider key for Google.
/// - twitter: The provider key for Twitter.
/// - amazon: The provider key for Amazon.
/// - developer: The provider key for Developer Authenticated Identities.
public enum IdentityProvider: String {
    case facebook = "graph.facebook.com"
    case google = "accounts.google.com"
    case twitter = "api.twitter.com"
    case amazon = "www.amazon.com"
    case developer = "cognito-identity.amazonaws.com"
    case apple = "appleid.apple.com"
    
    func getHostedUIIdentityProvider() -> String? {
        switch self {
        case .facebook:
            return "Facebook"
        case .google:
            return "Google"
        case .amazon:
            return "LoginWithAmazon"
        case .apple:
            return "SignInWithApple"
        default:
            return nil
        }
    }
}
