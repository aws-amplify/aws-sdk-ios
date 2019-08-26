//
//  AWSMobileClientSignInTests.swift
//  AWSMobileClientTests
//

import XCTest
@testable import AWSMobileClient
import AWSCognitoIdentityProvider

class AWSMobileClientSignInTests: AWSMobileClientBaseTests {

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
        AWSMobileClient.sharedInstance().addUserStateListener(self) { (userState, info) in
            switch (userState) {
            case .signedIn:
                signInListenerWasSuccessful.fulfill()
                print("Listener user is signed in.")
            default:
                print("Listener \(userState)")
            }
        }
        
        let signInWasSuccessful = expectation(description: "signIn was successful")
        AWSMobileClient.sharedInstance().signIn(username: username, password: sharedPassword) { (signInResult, error) in
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
        wait(for: [signInWasSuccessful, signInListenerWasSuccessful], timeout: 5)
        XCTAssertNil(AWSMobileClient.sharedInstance().userpoolOpsHelper.currentSignInHandlerCallback,
                     "Current sign callback should be nil after callback is invoked")
        AWSMobileClient.sharedInstance().removeUserStateListener(self)
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
        AWSMobileClient.sharedInstance().signIn(username: username, password: "WrongPassword") { (signInResult, error) in
            XCTAssertNil(signInResult)
            XCTAssertNotNil(error, "Expecting error for wrong password.")
            signInShouldFail.fulfill()
        }
        wait(for: [signInShouldFail], timeout: 5)
        XCTAssertNil(AWSMobileClient.sharedInstance().userpoolOpsHelper.currentSignInHandlerCallback,
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
        
        AWSMobileClient.sharedInstance().signIn(username: username, password: sharedPassword) { (signInResult, error) in
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
            AWSMobileClient.sharedInstance().userpoolOpsHelper.newPasswordRequiredTaskCompletionSource = newPasswordRequiredTask
            AWSMobileClient.sharedInstance().confirmSignIn(challengeResponse: "code") { (signInResult, error) in
                // Completion will not be called because the continuation is mocked above.
            }
            signInWasSuccessfulExpectation.fulfill()
        }
        wait(for: [signInWasSuccessfulExpectation], timeout: 5)
        XCTAssertNotNil(AWSMobileClient.sharedInstance().userpoolOpsHelper.currentConfirmSignInHandlerCallback,
                        "Current confirmsign callback should not be nil")
        XCTAssertNil(AWSMobileClient.sharedInstance().userpoolOpsHelper.currentSignInHandlerCallback,
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
        AWSMobileClient.sharedInstance().signIn(username: username, password: sharedPassword) { (signInResult, error) in
            if let error = error {
                XCTFail("User login failed: \(error.localizedDescription)")
                return
            }
            
            guard let signInResult = signInResult else {
                XCTFail("User login failed, signInResult unexpectedly nil")
                return
            }
            XCTAssertEqual(signInResult.signInState, .signedIn, "Could not verify sign in state")
            firstSignInExpectation.fulfill()
            
            XCTAssertEqual(AWSMobileClient.sharedInstance().currentUserState, .signedIn, "User should be in signedIn state after signIn")
            AWSMobileClient.sharedInstance().signOut()
            XCTAssertEqual(AWSMobileClient.sharedInstance().currentUserState, .signedOut, "User should be in signedOut state after signedOut")
            
            // Second signIn call
            AWSMobileClient.sharedInstance().signIn(username: username, password: self.sharedPassword) { (signInResult, error) in
                if let error = error {
                    XCTFail("User login failed: \(error.localizedDescription)")
                    return
                }
                
                guard let signInResult = signInResult else {
                    XCTFail("User login failed, signInResult unexpectedly nil")
                    return
                }
                XCTAssertEqual(signInResult.signInState, .signedIn, "Could not verify sign in state")
                XCTAssertEqual(AWSMobileClient.sharedInstance().currentUserState, .signedIn, "User should be in signedIn state after signIn")
                secondSignInExpectation.fulfill()
            }
            
        }
        wait(for: [firstSignInExpectation, secondSignInExpectation], timeout: 5)
        XCTAssertNil(AWSMobileClient.sharedInstance().userpoolOpsHelper.currentSignInHandlerCallback,
                     "Current sign callback should be nil after callback is invoked")
    }
    
    /// Test whether the state of AWSMobileClient is current after signIn
    ///
    /// - Given:  An unauthenticated session
    /// - When:
    ///    - I invoke `signIn` valid username and password
    /// - Then:
    ///    - I should successfully signIn with AWSMobileClient.sharedInstance().currentUserState
    ///    - with state signedIn and AWSMobileClient.sharedInstance().isSignedIn to be true
    ///
    func testUserStateAfterSignIn() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        let firstSignInExpectation = expectation(description: "First signIn was successful")
        AWSMobileClient.sharedInstance().signIn(username: username, password: sharedPassword) { (signInResult, error) in
            if let error = error {
                XCTFail("User login failed: \(error.localizedDescription)")
                return
            }
            
            guard let signInResult = signInResult else {
                XCTFail("User login failed, signInResult unexpectedly nil")
                return
            }
            XCTAssertEqual(signInResult.signInState, .signedIn, "Could not verify sign in state")
            XCTAssertEqual(AWSMobileClient.sharedInstance().currentUserState, .signedIn, "User should be in signedIn state after signIn")
            XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn, "AWSMobileClient isSignedIn should be true after signIn")
            firstSignInExpectation.fulfill()
        }
        wait(for: [firstSignInExpectation], timeout: 5)
    }
}
