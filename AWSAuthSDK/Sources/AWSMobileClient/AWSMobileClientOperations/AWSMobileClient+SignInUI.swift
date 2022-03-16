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

extension AWSMobileClient {

    /// Shows a fully managed sign in screen which allows users to sign up and sign in.
    ///
    /// - Parameters:
    ///   - presentationAnchor: The presentation Anchor to show the ASWEbAuthenticationSession
    ///   - hostedUIOptions: The options object which allows showSignIn to present a hosted web UI.
    ///   - completionHandler: The completion handler to be called when user finishes the sign in action.
    @available(iOS 13, *)
    public func showSignIn(presentationAnchor: ASPresentationAnchor,
                           hostedUIOptions: HostedUIOptions,
                           _ completionHandler: @escaping(UserState?, Error?) -> Void) {
        if case .signedIn = self.currentUserState {
            completionHandler(nil, AWSMobileClientError.invalidState(message: "There is already a user which is signed in. Please log out the user before calling showSignIn."))
            return
        }
        developerNavigationController = nil
        configureAndRegisterCognitoAuth(hostedUIOptions: hostedUIOptions, completionHandler)

        let cognitoAuth = AWSCognitoAuth.init(forKey: CognitoAuthRegistrationKey)
        cognitoAuth.delegate = self

        // Clear the keychain if there is an existing user details
        cognitoAuth.signOutLocally()

        cognitoAuth.launchSignIn(withWebUI: presentationAnchor) { (session, error) in
            self.handleCognitoAuthGetSession(hostedUIOptions: hostedUIOptions,
                                             session: session,
                                             error: error,
                                             completionHandler)
        }
    }

    /// Shows a fully managed sign in screen which allows users to sign up and sign in.
    ///
    /// - Parameters:
    ///   - navigationController: The navigation controller which would act as the anchor for this UI.
    ///   - signInUIOptions: The options object which allows changing logo, background color and if the user can cancel the sign in operation if using native auth UI. This options object will be ignored if `hostedUIOptions` is passed in.
    ///   - hostedUIOptions: The options object which allows showSignIn to present a hosted web UI. If passed, `signInUIOptions` are ignored since they are applicable only to native UI.
    ///   - completionHandler: The completion handler to be called when user finishes the sign in action.
    public func showSignIn(navigationController: UINavigationController,
                           signInUIOptions: SignInUIOptions = SignInUIOptions(),
                           hostedUIOptions: HostedUIOptions? = nil,
                           _ completionHandler: @escaping(UserState?, Error?) -> Void) {

        switch self.currentUserState {
        case .signedIn:
            completionHandler(nil, AWSMobileClientError.invalidState(message: "There is already a user which is signed in. Please log out the user before calling showSignIn."))
            return
        default:
            break
        }
        if let hostedUIOptions = hostedUIOptions {
            // Return early if the developer is trying private session without providing a presentation anchor. Private session
            // is only available through ASWebAuthenticationSession which is supported through the api
            // `showSignIn(presentationAnchor:hostedUIOptions:completionHandler:)`.
            if hostedUIOptions.signInPrivateSession {
                completionHandler(nil, AWSMobileClientError.invalidState(message: "Private session is only available if you use showSignIn(presentationAnchor:hostedUIOptions:completionHandler:) which is available for iOS > 13.0"))
                return
            }
            developerNavigationController = navigationController
            configureAndRegisterCognitoAuth(hostedUIOptions: hostedUIOptions, completionHandler)

            let cognitoAuth = AWSCognitoAuth.init(forKey: CognitoAuthRegistrationKey)
            cognitoAuth.delegate = self

            // Clear the keychain if there is an existing user details
            cognitoAuth.signOutLocally()

            cognitoAuth.launchSignIn(with: navigationController.viewControllers.first!) { (session, error) in
                self.handleCognitoAuthGetSession(hostedUIOptions: hostedUIOptions,
                                                 session: session,
                                                 error: error,
                                                 completionHandler)
            }

        } else {
            self.showSign(inScreen: navigationController, signInUIConfiguration: signInUIOptions, completionHandler: { providerName, token, error in
                if error == nil {
                    if (providerName == IdentityProvider.facebook.rawValue) || (providerName == IdentityProvider.google.rawValue || providerName == IdentityProvider.apple.rawValue) {
                        self.federatedSignIn(providerName: providerName!, token: token!, completionHandler: completionHandler)
                    } else {
                        self.currentUser?.getSession().continueWith(block: { (task) -> Any? in
                            if let session = task.result {
                                self.performUserPoolSuccessfulSignInTasks(session: session)
                                let tokenString = session.idToken!.tokenString
                                self.mobileClientStatusChanged(
                                    userState: .signedIn,
                                    additionalInfo: [
                                        AWSMobileClientConstants.ProviderKey:self.userPoolClient!.identityProviderName,
                                        AWSMobileClientConstants.TokenKey:tokenString])
                                completionHandler(.signedIn, nil)
                            } else {
                                completionHandler(nil, task.error)
                            }
                            return nil
                        })
                    }
                } else {
                    if ((error! as NSError).domain == "AWSMobileClientError") {
                        if error!._code == -1 {
                            completionHandler(nil, AWSMobileClientError.invalidState(message: "AWSAuthUI dependency is required to show the signIn screen. Please import the dependency before using this API."))
                            return
                        } else if error!._code == -2 {
                            completionHandler(nil, AWSMobileClientError.userCancelledSignIn(message: "The user cancelled the sign in operation."))
                            return
                        }
                    }
                    completionHandler(nil, error)
                }
            })
        }
    }

    private func handleCognitoAuthGetSession(hostedUIOptions: HostedUIOptions,
                                             session: AWSCognitoAuthUserSession?,
                                             error: Error?,
                                             _ completionHandler: @escaping(UserState?, Error?) -> Void) {
        guard error == nil else {
            completionHandler(nil, error)
            return
        }
        guard let session = session else {
            let unknownError = AWSMobileClientError.unknown(message: "Received nil value for session and no error from the service.")
            completionHandler(nil, unknownError)
            return
        }

        var signInInfo = [String: String]()
        var federationToken: String? = nil
        if let idToken = session.idToken?.tokenString {
            federationToken = idToken
        } else if let accessToken = session.accessToken?.tokenString {
            federationToken = accessToken
        }

        guard federationToken != nil else {
            completionHandler(nil, AWSMobileClientError.idTokenAndAcceessTokenNotIssued(message: "No ID token or access token was issued."))
            return
        }

        if let identityProvider = hostedUIOptions.identityProvider {
            signInInfo["identityProvider"] = identityProvider
        }
        if let idpIdentifier = hostedUIOptions.idpIdentifier {
            signInInfo["idpIdentifier"] = idpIdentifier
        }
        signInInfo[AWSMobileClientConstants.TokenKey] = session.accessToken!.tokenString
        signInInfo[AWSMobileClientConstants.ProviderKey] = "OAuth"

        // Upon successful sign in, store scopes specified using HostedUIOptions in Keychain
        if hostedUIOptions.scopes != nil {
            self.saveHostedUIOptionsScopesInKeychain()
        }
        let federationProviderIdentifier = hostedUIOptions.federationProviderName

        self.performHostedUISuccessfulSignInTasks(disableFederation: hostedUIOptions.disableFederation, session: session, federationToken: federationToken!, federationProviderIdentifier: federationProviderIdentifier, signInInfo: &signInInfo)
        self.mobileClientStatusChanged(userState: .signedIn, additionalInfo: signInInfo)
        completionHandler(.signedIn, nil)
        self.pendingGetTokensCompletion?(session.mobileClientTokens, nil)
        self.pendingGetTokensCompletion = nil
    }

    private func performHostedUISuccessfulSignInTasks(disableFederation: Bool = false,
                                                       session: AWSCognitoAuthUserSession,
                                                       federationToken: String,
                                                       federationProviderIdentifier: String? = nil,
                                                       signInInfo: inout [String: String]) {
        federationDisabled = disableFederation
        if federationProviderIdentifier == nil {
            self.cachedLoginsMap = [self.userPoolClient!.identityProviderName: federationToken]
        } else {
            self.cachedLoginsMap = [federationProviderIdentifier!: federationToken]
        }
        postSignInKeychainAndCredentialsUpdate(provider: .hostedUI,
                                               additionalInfo: signInInfo)
    }

    private func configureAndRegisterCognitoAuth(hostedUIOptions: HostedUIOptions,
                                                 _ completionHandler: @escaping(UserState?, Error?) -> Void) {
        loadOAuthURIQueryParametersFromKeychain()

        let infoDictionaryMobileClient = AWSInfo.default().rootInfoDictionary["Auth"] as? [String: [String: Any]]
        let infoDictionary: [String: Any]? = infoDictionaryMobileClient?["Default"]?["OAuth"] as? [String: Any]

        let clientId = infoDictionary?["AppClientId"] as? String
        let secret = infoDictionary?["AppClientSecret"] as? String
        let webDomain = infoDictionary?["WebDomain"] as? String
        let hostURL = "https://\(webDomain!)"

        let signInRedirectURI = infoDictionary?["SignInRedirectURI"] as? String
        let signInURI = infoDictionary?["SignInURI"] as? String
        if self.signInURIQueryParameters == nil {
            self.signInURIQueryParameters = infoDictionary?["SignInURIQueryParameters"] as? [String: String]
        }

        let signOutRedirectURI = infoDictionary?["SignOutRedirectURI"] as? String
        let signOutURI = infoDictionary?["SignOutURI"] as? String
        if self.signOutURIQueryParameters == nil {
            self.signOutURIQueryParameters = infoDictionary?["SignOutURIQueryParameters"] as? [String: String]
        }

        let tokensURI = infoDictionary?["TokenURI"] as? String
        if self.tokenURIQueryParameters == nil {
            self.tokenURIQueryParameters = infoDictionary?["TokenURIQueryParameters"] as? [String: String]
        }

        let identityProvider = hostedUIOptions.identityProvider
        let idpIdentifier = hostedUIOptions.idpIdentifier

        if hostedUIOptions.scopes != nil {
            self.scopes = hostedUIOptions.scopes
        } else {
            self.scopes = infoDictionary?["Scopes"] as? [String]
            self.clearHostedUIOptionsScopesFromKeychain()
        }

        if hostedUIOptions.signInURIQueryParameters != nil {
            self.signInURIQueryParameters = hostedUIOptions.signInURIQueryParameters
        }

        if hostedUIOptions.tokenURIQueryParameters != nil {
            self.tokenURIQueryParameters = hostedUIOptions.tokenURIQueryParameters
        }

        if hostedUIOptions.signOutURIQueryParameters != nil {
            self.signOutURIQueryParameters = hostedUIOptions.signOutURIQueryParameters
        }

        saveOAuthURIQueryParametersInKeychain()

        if (clientId == nil || scopes == nil || signInRedirectURI == nil || signOutRedirectURI == nil) {
            completionHandler(nil, AWSMobileClientError.invalidConfiguration(message: "Please provide all configuration parameters to use the hosted UI feature."))
        }

        let cognitoAuthConfig: AWSCognitoAuthConfiguration = AWSCognitoAuthConfiguration.init(appClientId: clientId!,
                                         appClientSecret: secret,
                                         scopes: Set<String>(self.scopes!.map { $0 }),
                                         signInRedirectUri: signInRedirectURI!,
                                         signOutRedirectUri: signOutRedirectURI!,
                                         webDomain: hostURL,
                                         identityProvider: identityProvider,
                                         idpIdentifier: idpIdentifier,
                                         signInUri: signInURI,
                                         signOutUri: signOutURI,
                                         tokensUri: tokensURI,
                                         signInUriQueryParameters: self.signInURIQueryParameters,
                                         signOutUriQueryParameters: self.signOutURIQueryParameters,
                                         tokenUriQueryParameters: self.tokenURIQueryParameters,
                                         userPoolServiceConfiguration: AWSMobileClient.serviceConfiguration?.userPoolServiceConfiguration,
                                         signInPrivateSession: hostedUIOptions.signInPrivateSession)

        if (isCognitoAuthRegistered) {
            AWSCognitoAuth.remove(forKey: CognitoAuthRegistrationKey)
        }
        AWSCognitoAuth.registerCognitoAuth(with: cognitoAuthConfig, forKey: CognitoAuthRegistrationKey)
        isCognitoAuthRegistered = true
    }
}

extension AWSMobileClient: AWSCognitoAuthDelegate {

    public func getViewController() -> UIViewController {
        // This should never get called based on the design
        if (developerNavigationController?.visibleViewController != nil) {
            return developerNavigationController!.visibleViewController!
        }
        return UIApplication.shared.keyWindow!.rootViewController!
    }

    public func shouldLaunchSignInVCIfRefreshTokenIsExpired() -> Bool {
        return false
    }
}
