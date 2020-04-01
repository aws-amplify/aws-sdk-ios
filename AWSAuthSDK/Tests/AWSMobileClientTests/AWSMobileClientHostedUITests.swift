//
//  AWSMobileClientHostedUITests.swift
//  AWSMobileClientHostedUITests
//

import XCTest

@testable import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

class AWSMobileClientHostedUITests: AWSMobileClientTestBase {
    
    static var scopes = ["openid", "email"]
    
    override class func setUp() {
        // signs out the user
        super.setUp()
        XCTAssertNil(AWSMobileClient.default().scopes)
        
        // assuming successful signin using custom scopes with HostedUIOptions
        // set custom scopes in keychain
        AWSMobileClientHostedUITests.setHostedUIScopesInKeychain()
    }
    
    static func setHostedUIScopesInKeychain() {
        AWSMobileClient.default().scopes = scopes
        AWSMobileClient.default().saveHostedUIOptionsScopesInKeychain()
        
        // assert if custom scopes are correctly stored in the keychain
        AWSMobileClient.default().loadHostedUIScopesFromKeychain()
        XCTAssertEqual(AWSMobileClient.default().scopes, scopes)
    }
    
    func reInitializeMobileClient() {
        let testCase = XCTestCase()
        let mobileClientIsInitialized = testCase.expectation(description: "AWSMobileClient is initialized")
        AWSMobileClient.default().initialize { (userState, error) in
            if let error = error {
                XCTFail("Encountered unexpected error in initialize: \(error.localizedDescription)")
                return
            }
            
            guard userState != nil else {
                XCTFail("userState is unexpectedly empty initializing AWSMobileClient")
                return
            }
            
            mobileClientIsInitialized.fulfill()
        }
        testCase.wait(for: [mobileClientIsInitialized], timeout: 5)
    }
    
    /// Test to check if MobileClient instance is initialized from custom scopes if they exist
    ///  And also that a sign out clears the custom scopes from keychain
    /// - Given:
    ///     - The user accepts the custom scopes set using HostedUIOptions
    ///     - These custom scopes are set in the keychain
    /// - When:
    ///    - The user successfully signs in
    /// - Then:
    ///    - Re-Intializing the MobileClient Instance(possibly during app restart), uses these custom scopes
    ///    - Signing Out clears the custom scopes stored in the keychain
    ///
    func testHostedUIScopesFlow() {
        
        reInitializeMobileClient()
        XCTAssertEqual(AWSMobileClientHostedUITests.scopes, AWSMobileClient.default().scopes)
        
        AWSMobileClient.default().signOut()
        AWSMobileClient.default().loadHostedUIScopesFromKeychain()
        XCTAssertNil(AWSMobileClient.default().scopes)
    }
}
