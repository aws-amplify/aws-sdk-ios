//
//  NameSpaceWithNoPreviousInstallTests.swift
//  AWSMobileClientUnitTestWithApp

import Foundation

class NameSpaceWithNoPreviousInstallTests: NameSpaceBaseTests {
    

    /// Test user signedOut when initializing AWSMobileClient for the first time
    /// There was no previous installation of the app.
    ///
    /// - Given: AWSMobileClient with not previous keychain information
    /// - When:
    ///    - I invoke `initialize` on AWSMobileClient
    /// - Then:
    ///    - I should get back the user state as signedOut
    func testFreshInstall() {
        let configuration = createConfiguration()
        initializedAndUserstateSignedOut(configuration)
    }
}

