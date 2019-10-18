//
//  AWSMobileClientSignInTests.swift
//  AWSMobileClientTests
//

import XCTest
@testable import AWSMobileClient
import AWSCognitoIdentityProvider

class AWSMobileClientSignInTests: AWSMobileClientTestBase {

    func testSignIn() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
    }
    
    /// Test successful sign in with callback
    ///
    /// - Given: An unauthenticated session
    /// - When:
    ///    - I set listener to AWSMobileClient
    ///    - I invoke `signIn` with completion callback
    /// - Then:
    ///    - My `signIn` completion callback is invoked
    ///    - My listener is invoked with signedIn state
    ///    - The user state is `signedIn`
    ///
    func testSignInCallbacks() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        
        let signInListenerWasSuccessful = expectation(description: "signIn listener was successful")
        AWSMobileClient.default().addUserStateListener(self) { (userState, info) in
            switch (userState) {
            case .signedIn:
                signInListenerWasSuccessful.fulfill()
                print("Listener user is signed in.")
            default:
                print("Listener \(userState)")
            }
        }
        
        let signInWasSuccessful = expectation(description: "signIn was successful")
        AWSMobileClient.default().signIn(username: username, password: sharedPassword) { (signInResult, error) in
            if let error = error {
                XCTFail("User login failed: \(error.localizedDescription)")
                return
            }
            
            guard let signInResult = signInResult else {
                XCTFail("User login failed, signInResult unexpectedly nil")
                return
            }
            XCTAssertEqual(signInResult.signInState, .signedIn, "Could not verify sign in state")
            signInWasSuccessful.fulfill()
        }
        wait(for: [signInWasSuccessful, signInListenerWasSuccessful], timeout: 10)
        XCTAssertNil(AWSMobileClient.default().userpoolOpsHelper.currentSignInHandlerCallback,
                     "Current sign callback should be nil after callback is invoked")
        AWSMobileClient.default().removeUserStateListener(self)
    }
    
    /// Test unsuccessful sign in
    ///
    /// - Given: An unauthenticated session with confirmed user
    /// - When:
    ///    - I invoke `signIn` with completion callback and wrong password
    /// - Then:
    ///    - My `signIn` callback should be called with error.
    ///
    func testSignInFailCase() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        let signInShouldFail = expectation(description: "Sign In should fail")
        AWSMobileClient.default().signIn(username: username, password: "WrongPassword") { (signInResult, error) in
            XCTAssertNil(signInResult)
            XCTAssertNotNil(error, "Expecting error for wrong password.")
            signInShouldFail.fulfill()
        }
        wait(for: [signInShouldFail], timeout: 10)
        XCTAssertNil(AWSMobileClient.default().userpoolOpsHelper.currentSignInHandlerCallback,
                     "Current sign callback should be nil after callback is invoked")
    }

    /// Test whether the confirm sign in callback is set and is not nil
    ///
    /// - Given: An unauthenticated session with MFA
    /// - When:
    ///    - I invoke `signIn` with completion callback
    ///    - And then invoke `confirmSignIn` from the above callback
    /// - Then:
    ///    - My `confirmSignIn` callback should not be nil
    ///
    func testConfirmSignCallbacksValue() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        let signInWasSuccessfulExpectation = expectation(description: "signIn was successful")
        
        AWSMobileClient.default().signIn(username: username, password: sharedPassword) { (signInResult, error) in
            if let error = error {
                XCTFail("User login failed: \(error.localizedDescription)")
                return
            }
            
            if signInResult == nil {
                XCTFail("User login failed, signInResult unexpectedly nil")
                return
            }
            
            // Manually set password completion task to mock confirm signIn flow.
            let newPasswordRequiredTask = AWSTaskCompletionSource<AWSCognitoIdentityNewPasswordRequiredDetails>()
            AWSMobileClient.default().userpoolOpsHelper.newPasswordRequiredTaskCompletionSource = newPasswordRequiredTask
            AWSMobileClient.default().confirmSignIn(challengeResponse: "code") { (signInResult, error) in
                // Completion will not be called because the continuation is mocked above.
            }
            signInWasSuccessfulExpectation.fulfill()
        }
        wait(for: [signInWasSuccessfulExpectation], timeout: 10)
        XCTAssertNotNil(AWSMobileClient.default().userpoolOpsHelper.currentConfirmSignInHandlerCallback,
                        "Current confirmsign callback should not be nil")
        XCTAssertNil(AWSMobileClient.default().userpoolOpsHelper.currentSignInHandlerCallback,
                     "Current sign callback should be nil")
    }
    
    /// Test whether signIn operation works as intended after a signIn and signOut call
    ///
    /// - Given: An unauthenticated session
    /// - When:
    ///    - I invoke the signIn operation
    ///    - I invoke signOut operation
    ///    - Then invoke signIn again
    /// - Then:
    ///    - The callbacks for each operation should produce the expected result.
    ///    - ie after the first signIn the user should be in signIn state
    ///    - then after signOut, the user should be in signOut state
    ///    - and the last signIn call should end the user in signIn state.
    ///
    func testSignInAfterASignOut() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        let firstSignInExpectation = expectation(description: "First signIn was successful")
        let secondSignInExpectation = expectation(description: "Second signIn was successful")
        AWSMobileClient.default().signIn(username: username, password: sharedPassword) { (signInResult, error) in
            
            defer {
                firstSignInExpectation.fulfill()
            }
            if let error = error {
                XCTFail("User login failed: \(error.localizedDescription)")
                return
            }
            
            guard let signInResult = signInResult else {
                XCTFail("User login failed, signInResult unexpectedly nil")
                return
            }
            XCTAssertEqual(signInResult.signInState, .signedIn, "Could not verify sign in state for first signIn")
            XCTAssertEqual(AWSMobileClient.default().currentUserState, .signedIn, "User should be in signedIn state after first signIn")
            AWSMobileClient.default().signOut()
            XCTAssertEqual(AWSMobileClient.default().currentUserState, .signedOut, "User should be in signedOut state after signedOut")
            
            // Second signIn call
            AWSMobileClient.default().signIn(username: username, password: self.sharedPassword) { (signInResult, error) in
                defer {
                    secondSignInExpectation.fulfill()
                }
                
                if let error = error {
                    XCTFail("User login failed: \(error.localizedDescription)")
                    return
                }
                
                guard let signInResult = signInResult else {
                    XCTFail("User login failed, signInResult unexpectedly nil")
                    return
                }
                XCTAssertEqual(signInResult.signInState, .signedIn, "Could not verify sign in state for second signIn")
                XCTAssertEqual(AWSMobileClient.default().currentUserState, .signedIn, "User should be in signedIn state after second signIn")
            }
            
        }
        wait(for: [firstSignInExpectation, secondSignInExpectation], timeout: 10)
    }
    
    /// Test whether the state of AWSMobileClient is current after signIn
    ///
    /// - Given:  An unauthenticated session
    /// - When:
    ///    - I invoke `signIn` valid username and password
    /// - Then:
    ///    - I should successfully signIn with AWSMobileClient.default().currentUserState
    ///    - with state signedIn and AWSMobileClient.default().isSignedIn to be true
    ///
    func testUserStateAfterSignIn() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        let firstSignInExpectation = expectation(description: "First signIn was successful")
        AWSMobileClient.default().signIn(username: username, password: sharedPassword) { (signInResult, error) in
            if let error = error {
                XCTFail("User login failed: \(error.localizedDescription)")
                return
            }
            
            guard let signInResult = signInResult else {
                XCTFail("User login failed, signInResult unexpectedly nil")
                return
            }
            XCTAssertEqual(signInResult.signInState, .signedIn, "Could not verify sign in state")
            XCTAssertEqual(AWSMobileClient.default().currentUserState, .signedIn, "User should be in signedIn state after signIn")
            XCTAssertTrue(AWSMobileClient.default().isSignedIn, "AWSMobileClient isSignedIn should be true after signIn")
            firstSignInExpectation.fulfill()
        }
        wait(for: [firstSignInExpectation], timeout: 10)
    }
    
    /// Test if invalidating refresh token displays signOut message and the user is able to signIn after that.
    ///
    /// - Given: An authenticated session and token
    /// - When:
    ///    - I manually invalidate token and then call get Token.
    /// - Then:
    ///    - I should get signedOutUserPoolsTokenInvalid in user state listener
    ///    - After that signIn should be successful and the prevous token call also succeeds.
    ///
    func testSignInAfterTokenInvalidation() {
        XCTAssertFalse(AWSMobileClient.default().isSignedIn, "Should be in signOut state")
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let tokenFetchExpectation = expectation(description: "token fetch was successful")
        AWSMobileClient.default().getTokens { (token, error) in
            defer {
                tokenFetchExpectation.fulfill()
            }
            if let error = error {
                XCTFail("Get token failed: \(error.localizedDescription)")
                return
            }
        }
        wait(for: [tokenFetchExpectation], timeout: 20)
        invalidateSession(username: username)
        
        let signOutExpectation = expectation(description: "signout was called")
        AWSMobileClient.default().addUserStateListener(self) { (userstate, info) in
            if (userstate == .signedOutUserPoolsTokenInvalid) {
                DispatchQueue.main.async {
                    signOutExpectation.fulfill()
                    self.signIn(username: username)
                }
            }
        }
        
        let tokenFetchExpectation2 = expectation(description: "token fetch was successful")
        AWSMobileClient.default().getTokens { (token, error) in
            defer {
                tokenFetchExpectation2.fulfill()
            }
            if let error = error {
                XCTFail("Get token failed: \(error.localizedDescription)")
                return
            }
        }
        
        wait(for: [signOutExpectation, tokenFetchExpectation2], timeout: 35, enforceOrder: true)
        AWSMobileClient.default().removeUserStateListener(self)
    }
}
