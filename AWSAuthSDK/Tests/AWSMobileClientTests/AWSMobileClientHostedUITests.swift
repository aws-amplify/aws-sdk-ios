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
    
    func testHostedUIScopesFlow() {
        // assuming successful signin using custom scopes with HostedUIOptions
        // set custom scopes in keychain
        AWSMobileClientHostedUITests.setHostedUIScopesInKeychain()
        
        // Given: the custom scopes are set using HostedUIOptions
        // When: AWSMobileClient is initialized
        // Then: use the custom scopes
        reInitializeMobileClient()
        XCTAssertEqual(AWSMobileClientHostedUITests.scopes, AWSMobileClient.default().scopes)
        
        // Given: the AWSMobileClient uses custom scopes
        // When: the user is signed out
        // Then: clear the custom scopes from keychain
        AWSMobileClient.default().signOut()
        AWSMobileClient.default().loadHostedUIScopesFromKeychain()
        XCTAssertNil(AWSMobileClient.default().scopes)
    }
}
