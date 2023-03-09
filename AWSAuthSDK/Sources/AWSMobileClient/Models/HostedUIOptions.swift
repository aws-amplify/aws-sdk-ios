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

/// The options object for `showSignIn` API when using Hosted Auth solution like Amazon Cognito UserPools or AUth0.
///
/// NOTE: If specified, some of the values in this type will override the corresponding values in `awsconfiguration.json`. See
/// the `init` method below.
public struct HostedUIOptions {
    let scopes: [String]?

    let identityProvider: String?
    let idpIdentifier: String?

    let disableFederation: Bool
    let federationProviderName: String?

    let signInURIQueryParameters: [String: String]?
    let tokenURIQueryParameters: [String: String]?
    let signOutURIQueryParameters: [String: String]?

    let signInPrivateSession: Bool

    /// Initializer for hosted UI options.
    ///
    /// - Parameters:
    ///   - disableFederation: If set to true, will not federate with Cognito Identity service to fetch AWSCredentials. `true` by default.
    ///   - scopes: The scopes for the current login session. If specified here, the scopes specified in `awsconfiguration.json` would be over-ridden.
    ///   - identityProvider: The IdentityProvider to be used for hosted UI. If using Cognito UserPools it could be `Google`, `Facebook`, etc.
    ///   - idpIdentifier: The IdentityProvider identifier if using multiple instances of same identity provider.
    ///   - federationProviderName: If federating with Cognito Identity and using a provider like Auth0 specify the provider name, e.g. <your_domain>.auth0.com.
    ///   - signInURIQueryParameters: The additional query parameters apart from standard OAuth w/ open id connect parameters for signInURI. If specified here, the signInURIQueryParameters specified in `awsconfiguration.json` would be over-ridden.
    ///   - tokenURIQueryParameters: The additional query parameters apart from standard OAuth w/ open id connect parameters for tokenURI. If specified here, the tokenURIQueryParameters specified in `awsconfiguration.json` would be over-ridden.
    ///   - signOutURIQueryParameters: The additional query parameters apart from standard OAuth w/ open id connect parameters for signOutURI. If specified here, the signOutURIQueryParameters specified in `awsconfiguration.json` would be over-ridden.
    public init(disableFederation: Bool = false,
                scopes: [String]? = nil,
                identityProvider: String? = nil,
                idpIdentifier: String? = nil,
                federationProviderName: String? = nil,
                signInURIQueryParameters: [String: String]? = nil,
                tokenURIQueryParameters: [String: String]? = nil,
                signOutURIQueryParameters: [String: String]? = nil,
                signInPrivateSession: Bool = false) {
        self.disableFederation = disableFederation
        self.scopes = scopes
        if let identityProvider = identityProvider {
            if let hostedUIMappedIdentityProvider = IdentityProvider.init(rawValue: identityProvider)?.getHostedUIIdentityProvider() {
                self.identityProvider = hostedUIMappedIdentityProvider
            } else {
                self.identityProvider = identityProvider
            }
        } else {
            self.identityProvider = nil
        }

        self.idpIdentifier = idpIdentifier
        self.federationProviderName = federationProviderName
        self.signInURIQueryParameters = signInURIQueryParameters
        self.tokenURIQueryParameters = tokenURIQueryParameters
        self.signOutURIQueryParameters = signOutURIQueryParameters
        self.signInPrivateSession = signInPrivateSession
    }
}
