//
//  AWSMobileClientHostedUITests.swift
//  AWSMobileClientTests
//

import XCTest

@testable import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

/// AWSMobileClient tests related to HostedUIOptions
class AWSMobileClientHostedUITests: AWSMobileClientTestBase {
    
    static let scopes = ["openid", "email"]
    override class func setUp() {
        // signs out the user
        super.setUp()
        XCTAssertNil(AWSMobileClient.default().scopes)
        
        // Assuming successful Sign-in, Set HostedUIScopes In Keychain
        AWSMobileClient.default().scopes = scopes
        AWSMobileClient.default().saveHostedUIOptionsScopesInKeychain()
    }
    
    /// Test the flow where custom scopes are retrieved from keychain
    ///  And they are cleared in keychain after signout
    /// - Given:
    ///     - The user accepts the custom scopes set using HostedUIOptions
    ///     - These custom scopes are set in the keychain
    /// - When:
    ///     - The custom scopes are fetched from keychain and the user successfully signs out
    /// - Then:
    ///    - loadHostedUIScopesFromKeychain correctly fetched the custom scopes from keychain
    ///    - Signing Out clears the custom scopes stored in the keychain
    ///
    func testSignOutClearsHostedUIScopesFromKeychain() {
        AWSMobileClient.default().loadHostedUIScopesFromKeychain()
        XCTAssertEqual(AWSMobileClient.default().scopes,
                       AWSMobileClientHostedUITests.scopes)
        
        AWSMobileClient.default().signOut()
        AWSMobileClient.default().loadHostedUIScopesFromKeychain()
        XCTAssertNil(AWSMobileClient.default().scopes)
    }
}
