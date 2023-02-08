//
//  AWSMobileClientInitialStateTests.swift
//  AWSMobileClientUnitTestWithApp
//

import Foundation
import XCTest

@testable import AWSMobileClient

class AWSMobileClientInitialStateTests: XCTestCase {

    let keychainHelper = AWSMobileClientKeychainHelper(identityPoolId: "someIdentityPoolID")
    let configuration = AWSMobileClientHelper.createConfiguration(
        userPoolID: "someUserPoolID",
        appClientID: "someAppClientID",
        identityPoolID: "someIdentityPoolID")

    override func setUp() {
        keychainHelper.removeAllItems()
    }


    /// Test if saved guest keychain initialise AWSMobileClient to a guest state
    ///
    /// - Given: AWSMobileClient with already saved keychain items for guest
    /// - When:
    ///    - I invoke AWSMobileClient.initialize
    /// - Then:
    ///    - I should get currentstate as guest
    ///
    func testSavedKeychainForGuest() {
        let initializeExpectation = expectation(description: "AWSMobileClient initialization")
        keychainHelper.mobileClientKeychain.setString("none", forKey: "federationProvider")
        keychainHelper.identityPoolSDKKeychain.setString("someidentityId", forKey: "identityId")
        let mobileClient = AWSMobileClientHelper.createAWSMobileClient(configuration)
        mobileClient._internalInitialize(userPoolHandler: UserPoolOperationsHandler()) {
            state, error in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssertEqual(mobileClient.currentUserState, .guest)
    }

    /// Test if saved federation keychain initialise AWSMobileClient to a signedIn state
    ///
    /// - Given: AWSMobileClient with already saved keychain items for federation to Identity Pool
    /// - When:
    ///    - I invoke AWSMobileClient.initialize
    /// - Then:
    ///    - I should get currentstate as signedIn
    ///
    func testSavedKeychainForFederation() {
        let initializeExpectation = expectation(description: "AWSMobileClient initialization")
        keychainHelper.mobileClientKeychain.setString("oidcFederation", forKey: "federationProvider")
        keychainHelper.identityPoolSDKKeychain.setString("someidentityId", forKey: "identityId")
        let mobileClient = AWSMobileClientHelper.createAWSMobileClient(configuration)
        mobileClient._internalInitialize(userPoolHandler: UserPoolOperationsHandler()) {
            state, error in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssertEqual(mobileClient.currentUserState, .signedIn)
    }

    /// Test if saved invalid federation keychain initialise AWSMobileClient
    ///
    /// - Given: AWSMobileClient with already saved invalid keychain items for federation to Identity Pool
    /// - When:
    ///    - I invoke AWSMobileClient.initialize
    /// - Then:
    ///    - I should get currentstate as signedOut
    ///
    func testSavedKeychainForFailedFederation() {
        let initializeExpectation = expectation(description: "AWSMobileClient initialization")
        keychainHelper.mobileClientKeychain.setString("oidcFederation", forKey: "federationProvider")
        let mobileClient = AWSMobileClientHelper.createAWSMobileClient(configuration)
        mobileClient._internalInitialize { state, error in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssertEqual(mobileClient.currentUserState, .signedOut)
    }

    /// Test if saved userpool keychain initialise AWSMobileClient to a signedIn state
    ///
    /// - Given: AWSMobileClient with already saved keychain items for signed in to User Pool
    /// - When:
    ///    - I invoke AWSMobileClient.initialize
    /// - Then:
    ///    - I should get currentstate as signedIn
    ///
    func testSavedKeychainForUserPool() throws {
        let initializeExpectation = expectation(description: "AWSMobileClient initialization")
        try keychainHelper.mockUserPoolSignedInUser(appClientID: "someAppClientID")
        let mobileClient = AWSMobileClientHelper.createAWSMobileClient(configuration)
        mobileClient._internalInitialize(userPoolHandler: UserPoolOperationsHandler()) {
            state, error in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssertEqual(mobileClient.currentUserState, .signedIn)
    }
}
