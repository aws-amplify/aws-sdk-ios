//
//  AWSMobileOptions.swift
//  AWSMobileClient
//

import Foundation

/// The options object for drop-in UI which allows changing properties like logo image and background color.
@objc public class SignInUIOptions: NSObject {
    
    /// If true, the end user can cancel the sign-in operation and go back to previous view controller.
    @objc public let canCancel: Bool
    /// The logo image to be displayed on the sign-in screen.
    @objc public let logoImage: UIImage?
    /// The background color of the sign-in screen.
    @objc public let backgroundColor: UIColor?
    /// The secondary background color. It's applied to the bottom panel of the sign-in screen.
    @objc public let secondaryBackgroundColor: UIColor?
    /// The view primary color used for highlighted elements (button background, links).
    @objc public let primaryColor: UIColor?
    /// If set to true the sign up button is hidden from the UI.
    @objc public let disableSignUpButton: Bool
    
    /// Initializer for the drop-in UI configuration.
    @objc public init(canCancel: Bool = false,
                      logoImage: UIImage? = nil,
                      backgroundColor: UIColor? = nil,
                      secondaryBackgroundColor: UIColor? = nil,
                      primaryColor: UIColor? = .systemBlue,
                      disableSignUpButton: Bool = false) {
        self.canCancel = canCancel
        self.logoImage = logoImage
        self.backgroundColor = backgroundColor
        self.secondaryBackgroundColor = secondaryBackgroundColor
        self.primaryColor = primaryColor
        self.disableSignUpButton = disableSignUpButton
    }
}

/// Signout options to change the default behavior.
public struct SignOutOptions {
    let invalidateTokens: Bool
    let signOutGlobally: Bool
    
    /// Initializer: Signout options to change the default behavior.
    ///
    /// - Parameters:
    ///   - signOutGlobally: Invalidate all active sessions with the service. The user will be logged out of all devices.
    ///   - invalidateTokens: If functionality available, the access token, refresh token and id token will be invalidated and won't be usable.
    public init(signOutGlobally: Bool = false, invalidateTokens: Bool = true) {
        self.signOutGlobally = signOutGlobally
        self.invalidateTokens = invalidateTokens
    }
}


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
                signOutURIQueryParameters: [String: String]? = nil) {
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
    }
}

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
    
    func getHostedUIIdentityProvider() -> String? {
        switch self {
        case .facebook:
            return "Facebook"
        case .google:
            return "Google"
        case .amazon:
            return "LoginWithAmazon"
        default:
            return nil
        }
    }
}
