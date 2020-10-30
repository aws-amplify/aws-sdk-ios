//
//  AWSMobileClientIdentityIdTest.swift
//  AWSMobileClientTests
//
//  Created by Roy, Jithin on 10/30/20.
//  Copyright © 2020 Amazon Web Services. All rights reserved.
//

import XCTest
@testable import AWSMobileClient
import AWSCognitoIdentityProvider

class AWSMobileClientIdentityIdTest: AWSMobileClientTestBase {

    func testIdentityIdForGuest() {
        
        let guestIdentityIdExpectation = expectation(description: "Guest identity id received")
        AWSMobileClient.default().getIdentityId().continueWith { (task) -> Any? in
            if let _ = task.result {
                guestIdentityIdExpectation.fulfill()
            } else if let error = task.error {
                XCTFail("Identity id failed with error - \(error)")
            }
            return nil
        }
        wait(for: [guestIdentityIdExpectation], timeout: 5)
    }
    
    func testIdentityIdForNewSignedUpUser() {
        
        var guestIdentityId: NSString = ""
        let guestIdentityIdExpectation = expectation(description: "Guest identity id received")
        AWSMobileClient.default().getIdentityId().continueWith { (task) -> Any? in
            if let identityId = task.result {
                guestIdentityId = identityId
                guestIdentityIdExpectation.fulfill()
            } else if let error = task.error {
                XCTFail("Identity id failed with error - \(error)")
            }
            return nil
        }
        wait(for: [guestIdentityIdExpectation], timeout: 5)
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        var signedInIdentityId: NSString = ""
        let signedInIdentityIdExpectation = expectation(description: "SignedIn identity id received")
        AWSMobileClient.default().getIdentityId().continueWith { (task) -> Any? in
            if let identityId = task.result {
                signedInIdentityId = identityId
                signedInIdentityIdExpectation.fulfill()
            } else if let error = task.error {
                XCTFail("Identity id failed with error - \(error)")
            }
            return nil
        }
        wait(for: [signedInIdentityIdExpectation], timeout: 5)
        XCTAssertEqual(signedInIdentityId,
                       guestIdentityId,
                       "Signed in identity id of new user should be equal to the guest's id")
    }
    
    func testIdentityIdForExistingUser() {
        
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        AWSMobileClient.default().signOut()
        
        var guestIdentityId: NSString = ""
        let guestIdentityIdExpectation = expectation(description: "Guest identity id received")
        AWSMobileClient.default().getIdentityId().continueWith { (task) -> Any? in
            if let identityId = task.result {
                guestIdentityId = identityId
                guestIdentityIdExpectation.fulfill()
            } else if let error = task.error {
                XCTFail("Identity id failed with error - \(error)")
            }
            return nil
        }
        wait(for: [guestIdentityIdExpectation], timeout: 5)

        signIn(username: username)
        var signedInIdentityId: NSString = ""
        let signedInIdentityIdExpectation = expectation(description: "SignedIn identity id received")
        AWSMobileClient.default().getIdentityId().continueWith { (task) -> Any? in
            if let identityId = task.result {
                signedInIdentityId = identityId
                signedInIdentityIdExpectation.fulfill()
            } else if let error = task.error {
                XCTFail("Identity id failed with error - \(error)")
            }
            return nil
        }
        wait(for: [signedInIdentityIdExpectation], timeout: 5)
        XCTAssertNotEqual(signedInIdentityId,
                          guestIdentityId,
                          "Signed in identity id of an existing user should not be equal to the guest's id")
    }
    
}
