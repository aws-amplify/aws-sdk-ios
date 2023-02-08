//
//  NameSpaceBaseTests.swift
//  AWSMobileClientUnitTestWithApp

import Foundation
import XCTest

@testable import AWSMobileClient

class NameSpaceBaseTests: XCTestCase {
    
    let keychainHelper = AWSMobileClientKeychainHelper()
    
    override func setUp() {
        keychainHelper.removeAllItems()
    }
    
    func initializedAndUserstateSignedOut(_ configuration: [String: Any] ) {
        let initializeExpectation = expectation(description: "AWSMobileClient initialization")
        let mobileClient = AWSMobileClientHelper.createAWSMobileClient(configuration)
        mobileClient._internalInitialize(userPoolHandler: UserPoolOperationsHandler()) {
            (userState, error) in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssertEqual(mobileClient.currentUserState, .signedOut)
        XCTAssertEqual(mobileClient.federationProvider, .none)
    }
    
    func initializedAndUserstateUserPoolSignIn(_ configuration: [String: Any] ) {
        let initializeExpectation = expectation(description: "AWSMobileClient initialization")

        let mobileClient = AWSMobileClientHelper.createAWSMobileClient(configuration)
        mobileClient._internalInitialize(userPoolHandler: UserPoolOperationsHandler()) {
            (userState, error) in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssertEqual(mobileClient.currentUserState, .signedIn)
        XCTAssertEqual(mobileClient.federationProvider, .userPools)
        mobileClient.signOut()
    }

}
