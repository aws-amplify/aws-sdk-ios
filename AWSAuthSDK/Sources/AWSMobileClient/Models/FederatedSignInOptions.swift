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

/// The options object for `federatedSignIn` API.
public struct FederatedSignInOptions {

    /// The `Cognito IdentityId` to be used for federation. This should be set when using `Developer Authenticated Identities`.
    let cognitoIdentityId: String?

    /// The Amazon Resource Name (ARN) of the role to be assumed when multiple roles were received in the token from the identity provider. For example, a SAML-based identity provider. This parameter is optional for identity providers that do not support role customization.
    /// NOTE: Currently, setting customRoleARN is explicitly NOT supported. For SAML, only the flow which has a single role ARN in assertion token is supported. TODO: Supported customRoleARN through config via `awsconfiguration.json`.
    let customRoleARN: String?

    /// Initializer for federatedSignIn options.
    ///
    /// - Parameters:
    ///   - cognitoIdentityId: The `Cognito IdentityId` to be used for federation. This should be set when using `Developer Authenticated Identities`.
    public init(cognitoIdentityId: String? = nil, customRoleARN: String? = nil) {
        self.cognitoIdentityId = cognitoIdentityId
        self.customRoleARN = customRoleARN
    }
}
