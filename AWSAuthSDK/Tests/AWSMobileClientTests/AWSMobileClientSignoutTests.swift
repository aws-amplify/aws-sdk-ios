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
    
    /// Test successful sign out with callback on an Authenticated User.
    /// Explicitly set the "origin_jti" claim on the access token. In case the feature is disabled on Cognito, revoke
    /// token API call made during sign out will still be successfully with the message "This feature is not enabled
    /// for this client".
    ///
    /// - Given: An authenticated session and an access token with "origin_jti" claim
    /// - When:
    ///    - I invoke `signOut` with completion callback
    /// - Then:
    ///    - RevokeToken API is called, with a successful response.
    ///    - My `signOut` completion callback is invoked
    ///    - The user state is `signedOut`
    ///
    func testSignOutWithCallbackWithRevokeToken() {
        let username = "testUser" + UUID().uuidString
        let signoutExpectation = expectation(description: "Successfully signout")
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.default().isSignedIn == true, "Expected to return true for isSignedIn")
        sleep(1)
        setAccessToken(for: username, using: AWSMobileClientTestBase.testAccessTokenWithOriginJTI)
        AWSMobileClient.default().signOut { (error) in
            XCTAssertTrue(AWSMobileClient.default().isSignedIn == false, "Expected to return false for isSignedIn")
            signoutExpectation.fulfill()
        }
        wait(for: [signoutExpectation], timeout: 2)
    }
    
    /// Test successful sign out with callback on an Authenticated User.
    /// Explicitly do not set the "origin_jti" claim on the access token.
    ///
    /// - Given: An authenticated session and an access token without "origin_jti" claim
    /// - When:
    ///    - I invoke `signOut` with completion callback
    /// - Then:
    ///    - RevokeToken API is not called.
    ///    - My `signOut` completion callback is invoked
    ///    - The user state is `signedOut`
    ///
    func testSignOutWithCallbackWithoutRevokeToken() {
        let username = "testUser" + UUID().uuidString
        let signoutExpectation = expectation(description: "Successfully signout")
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.default().isSignedIn == true, "Expected to return true for isSignedIn")
        sleep(1)
        setAccessToken(for: username, using: AWSMobileClientTestBase.testAccessTokenWithSub)
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
