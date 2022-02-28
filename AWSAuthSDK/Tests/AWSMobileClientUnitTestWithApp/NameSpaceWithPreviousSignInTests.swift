//
//  NameSpaceWithNoPreviousInstallTests.swift
//  AWSMobileClientUnitTestWithApp

import Foundation
import XCTest

@testable import AWSMobileClient
@testable import AWSCore

class NameSpaceWithPreviousSignInTests: NameSpaceBaseTests {
    
    /// Test user state remains the same on relaunching AWSMobilClient
    ///
    /// - Given: AWSMobileClient with previous information on keychain
    /// - When:
    ///    - I invoke `initialize` on AWSMobileClient
    /// - Then:
    ///    - I should get back the user state as signedIn
    func testRelaunchWithSameConfig() throws {
        let userPoolID = "userPoolID"
        let appClientID = "appClientID"
        let identityPoolID = "identityPoolID"
        try mockUserPoolSignedInUser()
        let configuration = createConfiguration(userPoolID: userPoolID,
                                                appClientID: appClientID,
                                                identityPoolID: identityPoolID)
        initializedAndUserstateUserPoolSignIn(configuration)
    }
}
