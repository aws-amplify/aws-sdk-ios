//
//  NameSpaceWithPreviousSignInWithCleanUpTests.swift
//  AWSMobileClientUnitTestWithApp

import Foundation
import XCTest

@testable import AWSMobileClient
@testable import AWSCore

/// Test different cases when the app is relaunched after adding the logic for cleanup.
/// To mock the behavior, we first add keychain values to mimic a user sign in and the namespace
/// value.
/// NOTE: These test are flaky, running the whole test case might result in some test failing. Test them
/// individually to see if the test are passing. The test are not stable because we could not reset the singleton
/// classes inside the legacy Cognito SDK. Once these singleton like AWSInfo are created, we could not
/// reset them with new configuration.
/// 
class NameSpaceWithPreviousSignInAndCleanUpTests: NameSpaceBaseTests {
    let userPoolID = "userPoolID"
    let appClientID = "appClientID"
    let identityPoolID = "identityPoolID"
    
    override func setUp() {
        super.setUp()
        do {
            try mockUserPoolSignedInUser()
        } catch {
            XCTFail("Error in mocking user pool signIn")
        }
        mockPreviousInstall(identityPoolID: identityPoolID)
    }
    
    /// Test user state remains the same on relaunching AWSMobilClient
    ///
    /// - Given: AWSMobileClient with previous information on keychain. Also mock the previous install with same configuration.
    /// - When:
    ///    - I invoke `initialize` on AWSMobileClient
    /// - Then:
    ///    - I should get back the user state as signedIn
    func testRelaunchWithSameConfig() throws {
       let configuration = createConfiguration(userPoolID: userPoolID,
                                                appClientID: appClientID,
                                                identityPoolID: identityPoolID)
        initializedAndUserstateUserPoolSignIn(configuration)
    }
    
    /// Test user state being cleared when launching with a different configuration
    ///
    /// - Given: AWSMobileClient with previous information on keychain
    /// - When:
    ///    - I invoke `initialize` on AWSMobileClient with different configuration
    /// - Then:
    ///    - I should get back the user state as signedOut
    func testRelaunchWithDifferentUserPoolID() throws {
        let configuration = createConfiguration(userPoolID: "userPoolID2",
                                                appClientID: appClientID,
                                                identityPoolID: identityPoolID)
        initializedAndUserstateSignedOut(configuration)
    }
    
    /// Test user state being cleared when launching with a different configuration
    ///
    /// - Given: AWSMobileClient with previous information on keychain
    /// - When:
    ///    - I invoke `initialize` on AWSMobileClient with different configuration
    /// - Then:
    ///    - I should get back the user state as signedOut
    func testRelaunchWithDifferentAppClientID() throws {

        let configuration = createConfiguration(userPoolID: userPoolID,
                                                appClientID: "appClientID2",
                                                identityPoolID: identityPoolID)
        initializedAndUserstateSignedOut(configuration)
    }
    
    /// Test user state being cleared when launching with a different configuration
    ///
    /// - Given: AWSMobileClient with previous information on keychain
    /// - When:
    ///    - I invoke `initialize` on AWSMobileClient with different configuration
    /// - Then:
    ///    - I should get back the user state as signedOut
    func testRelaunchWithDifferentIdentityPoolID() throws {

        let configuration = createConfiguration(userPoolID: userPoolID,
                                                appClientID: appClientID,
                                                identityPoolID: "identityPoolID2")
        initializedAndUserstateSignedOut(configuration)
    }
    
    /// Test user state being cleared when launching with a different configuration
    ///
    /// - Given: AWSMobileClient with previous information on keychain
    /// - When:
    ///    - I invoke `initialize` on AWSMobileClient with different configuration
    /// - Then:
    ///    - I should get back the user state as signedOut
    func testRelaunchWithOnlyUserPool() throws {

        let configuration = createConfiguration(userPoolID: userPoolID,
                                                appClientID: appClientID)
        initializedAndUserstateSignedOut(configuration)
    }
    
    /// Test user state being cleared when launching with a different configuration
    ///
    /// - Given: AWSMobileClient with previous information on keychain
    /// - When:
    ///    - I invoke `initialize` on AWSMobileClient with different configuration
    /// - Then:
    ///    - I should get back the user state as signedOut
    func testRelaunchWithOnlyIdentityPool() throws {

        let configuration = createConfiguration(identityPoolID: identityPoolID)
        initializedAndUserstateSignedOut(configuration)
    }
    
    /// Test user state being cleared when launching with a different configuration
    ///
    /// - Given: AWSMobileClient with previous information on keychain
    /// - When:
    ///    - I invoke `initialize` on AWSMobileClient with different configuration
    /// - Then:
    ///    - I should get back the user state as signedOut
    func testRelaunchWithNoCognitoService() throws {

        let configuration = createConfiguration()
        initializedAndUserstateSignedOut(configuration)
    }
}

