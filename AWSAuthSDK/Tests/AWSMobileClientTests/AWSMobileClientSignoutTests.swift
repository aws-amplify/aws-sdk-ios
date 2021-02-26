//
//  AWSMobileClientSignoutTests.swift
//  AWSMobileClientTests
//

import XCTest

import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

/// AWSMobileClient tests related to signout operation
class AWSMobileClientSignoutTests: AWSMobileClientTestBase {

    func testSignOut() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.default().isSignedIn == true, "Expected to return true for isSignedIn")
        sleep(1)
        AWSMobileClient.default().signOut()
        XCTAssertTrue(AWSMobileClient.default().isSignedIn == false, "Expected to return false for isSignedIn")
    }
    
    /// Test successful sign out with callback and no option on an Authenticated User
    ///
    /// - Given: An authenticated session
    /// - When:
    ///    - I invoke `signOut` with completion callback
    /// - Then:
    ///    - My `signOut` completion callback is invoked
    ///    - The user state is `signedOut`
    ///
    func testSignOutWithCallback() {
        let username = "testUser" + UUID().uuidString
        let signoutExpectation = expectation(description: "Successfully signout")
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.default().isSignedIn == true, "Expected to return true for isSignedIn")
        sleep(1)
        AWSMobileClient.default().signOut { (error) in
            XCTAssertTrue(AWSMobileClient.default().isSignedIn == false, "Expected to return false for isSignedIn")
            signoutExpectation.fulfill()
        }
        wait(for: [signoutExpectation], timeout: 2)
    }
    
    /// Test successful sign out with options and callback on an Authenticated User
    ///
    /// - Given: An authenticated session
    /// - When:
    ///    - I invoke `signOut` with signoutoptions and completion callback
    /// - Then:
    ///    - My `signOut` completion callback is invoked
    ///    - The user state is `signedOut`
    ///
    func testSignOutWithCallbackAndSignoutOption() {
        let username = "testUser" + UUID().uuidString
        let signoutExpectation = expectation(description: "Successfully signout")
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.default().isSignedIn == true, "Expected to return true for isSignedIn")
        sleep(1)
        
        let signoutOptions = SignOutOptions(signOutGlobally: true, invalidateTokens: true)
        AWSMobileClient.default().signOut(options: signoutOptions) { (error) in
            XCTAssertTrue(AWSMobileClient.default().isSignedIn == false, "Expected to return false for isSignedIn")
            signoutExpectation.fulfill()
        }
        wait(for: [signoutExpectation], timeout: 2)
    }
    
    /// Test successful sign out with callback and no option on a UnAuthenticated user
    ///
    /// - Given: An unauthenticated session
    /// - When:
    ///    - I invoke `signOut` with completion callback
    /// - Then:
    ///    - My `signOut` completion callback is invoked
    ///    - The user state is `signedOut`
    ///
    func testSignOutUnAuthenticatedUser() {
        let username = "testUser" + UUID().uuidString
        let signoutExpectation = expectation(description: "Successfully signout for unauthenticated User")
        signUpAndVerifyUser(username: username)
        XCTAssertTrue(AWSMobileClient.default().isSignedIn == false, "Expected to return false for isSignedIn")
        sleep(1)
        AWSMobileClient.default().signOut { (error) in
            XCTAssertTrue(AWSMobileClient.default().isSignedIn == false, "Expected to return false for isSignedIn")
            signoutExpectation.fulfill()
        }
        wait(for: [signoutExpectation], timeout: 2)
    }
    
    /// Test successfull sign out and check the state of AWSMobileClient
    ///
    /// - Given: An authenticated session
    /// - When:
    ///    - I invoke `signOut` without callback
    /// - Then:
    ///    - The user state is `signedOut` and isSignedIn is false
    ///
    func testSignOutState() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.default().isSignedIn, "Expected to return true for isSignedIn")
        AWSMobileClient.default().signOut()
        XCTAssertFalse(AWSMobileClient.default().isSignedIn, "Expected to return false for isSignedIn")
        XCTAssertEqual(AWSMobileClient.default().currentUserState, .signedOut, "User should be in signedOut state after signedOut")
    }
    
    /// Test successfull sign out using callback and check the state of AWSMobileClient
    ///
    /// - Given: An authenticated session
    /// - When:
    ///    - I invoke `signOut` with callback
    /// - Then:
    ///    - The user state is `signedOut` and isSignedIn is false
    ///
    func testSignOutStateWithCallback() {
        let username = "testUser" + UUID().uuidString
        let signoutExpectation = expectation(description: "Successfully signout")
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.default().isSignedIn, "Expected to return true for isSignedIn")
        let signoutOptions = SignOutOptions(signOutGlobally: true, invalidateTokens: true)
        AWSMobileClient.default().signOut(options: signoutOptions) { (error) in
            XCTAssertFalse(AWSMobileClient.default().isSignedIn, "Expected to return false for isSignedIn")
            XCTAssertEqual(AWSMobileClient.default().currentUserState, .signedOut, "User should be in signedOut state after signedOut")
            signoutExpectation.fulfill()
        }
        wait(for: [signoutExpectation], timeout: 2)
        
    }

}
