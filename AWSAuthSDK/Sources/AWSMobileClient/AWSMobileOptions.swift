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
    
    
    /// Initializer for the drop-in UI configuration.
    ///
    /// - Parameters:
    ///   - canCancel: If set to true, the end user can cancel the sign-in operation and go back to previous view controller.
    ///   - logoImage: The logo image to be displayed on the sign-in screen.
    ///   - backgroundColor: The background color of the sign-in screen.
    @objc public init(canCancel: Bool = false,logoImage: UIImage? = nil, backgroundColor: UIColor? = nil) {
        self.canCancel = canCancel
        self.logoImage = logoImage
        self.backgroundColor = backgroundColor
    }
}


/// The options object for `federatedSignIn` API.
public struct FederatedSignInOptions {
    
    /// The `Cognito IdentityId` to be used for federation. This should be set when using `Developer Authenticated Identities`.
    public let cognitoIdentityId:  String?
    
    
    /// Initializer for federatedSignIn options.
    ///
    /// - Parameter cognitoIdentityId: The Cognito IdentityId to be used for fetching AWS Credentials. Set this when using Developer Authenticated Identities.
    public init(cognitoIdentityId: String? = nil) {
        self.cognitoIdentityId = cognitoIdentityId
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
}
