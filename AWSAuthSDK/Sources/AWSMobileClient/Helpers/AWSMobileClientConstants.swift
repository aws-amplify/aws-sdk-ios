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

/// Callback type when registered to notifications for change in `UserState`. The dictionary contains information like `provider` which the user signed in with.
public typealias UserStateChangeCallback = (UserState, [String: String]) -> Void

struct AWSMobileClientConstants {

    static let ProviderKey = "provider"
    static let TokenKey = "token"
    static let LoginsMapKey = "loginsMap"
    static let FederationProviderKey = "federationProvider"
    static let SignInURIQueryParametersKey = "signInURIQueryParameters"
    static let TokenURIQueryParametersKey = "tokenURIQueryParameters"
    static let SignOutURIQueryParametersKey = "signOutURIQueryParameters"
    static let CustomRoleArnKey = "customRoleArn"
    static let FederationDisabledKey = "federationDisabled"
    static let HostedUIOptionsScopesKey = "hostedUIOptionsScopes"
    static let ConfigurationKey = "configurationKey"

    static let notSignedInMessage = """
    User is not signed in to Cognito User Pool, please sign in to use this API.
    """

    static let noValidSignInSession = """
    Unable to get valid sign in session from the end user.
    """
}
