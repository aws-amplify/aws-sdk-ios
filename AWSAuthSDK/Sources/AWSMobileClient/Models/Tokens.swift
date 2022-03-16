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

extension AWSCognitoIdentityUserSession {

    var mobileClientTokens: Tokens {
        return Tokens(idToken: SessionToken(tokenString: idToken?.tokenString),
                      accessToken: SessionToken(tokenString: accessToken?.tokenString),
                      refreshToken: SessionToken(tokenString: refreshToken?.tokenString),
                      expiration: expirationTime)
    }
}

extension AWSCognitoAuthUserSession {
    var mobileClientTokens: Tokens {
        return Tokens(idToken: SessionToken(tokenString: idToken?.tokenString),
                      accessToken: SessionToken(tokenString: accessToken?.tokenString),
                      refreshToken: SessionToken(tokenString: refreshToken?.tokenString),
                      expiration: expirationTime)
    }
}
