//
//  AWSMobileClientSignoutTests.swift
//  AWSMobileClientTests
//

import XCTest

import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

/// AWSMobileClient tests related to deleteUser operation
class AWSMobileClientDeleteUserTests: AWSMobileClientTestBase {
    
    /// Test successful delete user with callback and on an Authenticated User
    ///
    /// - Given: An authenticated session
    /// - When:
    ///    - I invoke `deleteUser` with completion callback
    /// - Then:
    ///    - My `deleteUser` completion callback is invoked without an error
    ///    - The user state is `signedOut`
    ///
    func testDeleteUser() {
        let username = "testUser" + UUID().uuidString
        let expectation = expectation(description: "Successfully deleted user")
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.default().isSignedIn, "Expected to return true for isSignedIn")
        sleep(1)
        AWSMobileClient.default().deleteUser { (error) in
            XCTAssertNil(error, "Received an error from deleteUser: \(String(describing: error))")
            XCTAssertFalse(AWSMobileClient.default().isSignedIn, "Expected to return false for isSignedIn")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    /// Test successful delete user with callback on a Unauthenticated user
    ///
    /// - Given: An unauthenticated session
    /// - When:
    ///    - I invoke `deleteUser` with completion callback
    /// - Then:
    ///    - My `deleteUser` completion callback is invoked with a AWSMobileClientError.notSignedIn error.
    ///
    func testDeleteUserUnauthenticatedUser() {
        let username = "testUser" + UUID().uuidString
        let expectation = expectation(description: "Receive AWSMobileClientError.notSignedIn error.")
        signUpAndVerifyUser(username: username)
        XCTAssertTrue(AWSMobileClient.default().isSignedIn == false, "Expected to return false for isSignedIn")
        sleep(1)
        AWSMobileClient.default().deleteUser { (error) in
            guard case .notSignedIn = error as? AWSMobileClientError else {
                XCTFail("Expected to receive AWSMobileClientError.notSignedIn error.")
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
}

