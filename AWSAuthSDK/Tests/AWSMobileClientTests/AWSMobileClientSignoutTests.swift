//
//  AWSMobileClientSignoutTests.swift
//  AWSMobileClientTests
//

import XCTest

import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

/// AWSMobileClient tests related to signout operation
class AWSMobileClientSignoutTests: AWSMobileClientBaseTests {

    func testSignOut() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == true, "Expected to return true for isSignedIn")
        sleep(1)
        AWSMobileClient.sharedInstance().signOut()
        XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == false, "Expected to return false for isSignedIn")
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
        XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == true, "Expected to return true for isSignedIn")
        sleep(1)
        AWSMobileClient.sharedInstance().signOut { (error) in
            XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == false, "Expected to return false for isSignedIn")
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
        XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == true, "Expected to return true for isSignedIn")
        sleep(1)
        
        let signoutOptions = SignOutOptions(signOutGlobally: true, invalidateTokens: true)
        AWSMobileClient.sharedInstance().signOut(options: signoutOptions) { (error) in
            XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == false, "Expected to return false for isSignedIn")
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
        XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == false, "Expected to return false for isSignedIn")
        sleep(1)
        AWSMobileClient.sharedInstance().signOut { (error) in
            XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == false, "Expected to return false for isSignedIn")
            signoutExpectation.fulfill()
        }
        wait(for: [signoutExpectation], timeout: 2)
    }

}
