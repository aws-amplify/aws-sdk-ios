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

}
