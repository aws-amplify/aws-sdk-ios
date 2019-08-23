//
//  AWSMobileClientTests.swift
//  AWSMobileClientTests
//

import XCTest

@testable import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

class AWSMobileClientTests: AWSMobileClientBaseTests {
    
    func testSignUp() {
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username)
        adminVerifyUser(username: username)
    }
    
    func testResendSignUpCode() {
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username)

        let verificationCodeSent = expectation(description: "verification code should be sent via email.")
        AWSMobileClient.sharedInstance().resendSignUpCode(username: username) { (result, error) in
            if let error = error {
                XCTFail("Failed due to error: \(error.localizedDescription)")
                return
            }

            guard let result = result else {
                XCTFail("result unexpectedly nil")
                return
            }

            switch result.signUpConfirmationState {
            case .unconfirmed:
                XCTAssertEqual(result.codeDeliveryDetails?.deliveryMedium,
                               UserCodeDeliveryMedium.email,
                               "Verification code should have been sent via email, but is not.")
            default:
                XCTFail("User should be in un-confirmed state.")
            }

            verificationCodeSent.fulfill()
        }
        wait(for: [verificationCodeSent], timeout: 5)
    }
    
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
        AWSMobileClient.sharedInstance().removeUserStateListener(self)
    }
    
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
    }
    
    func testGetTokens() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let tokensExpectation = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.sharedInstance().getTokens { (tokens, error) in
            if let tokens = tokens {
                XCTAssertNotNil(tokens.idToken)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            print("^^^^")
            tokensExpectation.fulfill()
        }
        wait(for: [tokensExpectation], timeout: 5000)
    }
    
    func testFederatedSignInDeveloperAuthenticatedIdentities() {
        let getOpendIdRequest = AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput()
        getOpendIdRequest?.identityPoolId = identityPoolId
        getOpendIdRequest?.logins = ["login.test.awsmobileclient": "test_users"]
        var identityId: String?
        var token: String?
        
        cognitoIdentity!.getOpenIdToken(forDeveloperIdentity: getOpendIdRequest!).continueWith { (task) -> Any? in
            if let result = task.result {
                identityId = result.identityId
                token = result.token
            } else if let _ = task.error {
                XCTAssertNil(task.error, "Unexpected Error. Expected IdentityId and Token.")
            }
            return nil
            }.waitUntilFinished()
        
        guard  identityId != nil, token != nil else {
            XCTFail("Could not retrieve identityId and token. Abandoning rest of the test.")
            return
        }
        
        AWSMobileClient.sharedInstance().federatedSignIn(providerName: IdentityProvider.developer.rawValue, token: token!, federatedSignInOptions: FederatedSignInOptions(cognitoIdentityId: identityId!)) { (userState, error) in
            XCTAssertNil(error, "Expected successful federation.")
        }
        
        let credentialsExpectation = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.sharedInstance().getAWSCredentials { (credentials, error) in
            if let credentials = credentials {
                XCTAssertNotNil(credentials.accessKey)
                XCTAssertNotNil(credentials.secretKey)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            credentialsExpectation.fulfill()
        }
        wait(for: [credentialsExpectation], timeout: 5)
        
        AWSMobileClient.sharedInstance().signOut()
        
        XCTAssertFalse(AWSMobileClient.sharedInstance().isSignedIn, "User should be signed out.")
        XCTAssertNil(AWSMobileClient.sharedInstance().identityId, "Identity Id should be nil after signing out.")
        
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        let credentialsExpectation2 = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.sharedInstance().getAWSCredentials { (credentials, error) in
            if let credentials = credentials {
                XCTAssertNotNil(credentials.accessKey)
                XCTAssertNotNil(credentials.secretKey)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            credentialsExpectation2.fulfill()
        }
        wait(for: [credentialsExpectation2], timeout: 5)
        
        AWSMobileClient.sharedInstance().signOut()
    }
    
    func testUserStateNotifications() {
        var signInExpectation = false
        var signOutExpectation = false
        XCTAssertTrue(AWSMobileClient.sharedInstance().listeners.count == 1, "Expecting only 1 listener.")
        AWSMobileClient.sharedInstance().addUserStateListener(self) { (userState, info) in
            switch(userState) {
            case .signedIn:
                signInExpectation = true
            case .signedOut:
                signOutExpectation = true
            default:
                XCTFail("Got unexpected notification")
            }
        }
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        sleep(1)
        AWSMobileClient.sharedInstance().signOut()
        sleep(1)
        XCTAssertTrue(signInExpectation, "Expected Sign In to be true")
        XCTAssertTrue(signOutExpectation, "Expected Sign Out to be true")
        XCTAssertTrue(AWSMobileClient.sharedInstance().listeners.count == 2, "Expecting 2 listeners.")
        AWSMobileClient.sharedInstance().removeUserStateListener(self)
        XCTAssertTrue(AWSMobileClient.sharedInstance().listeners.count == 1, "Expecting only 1 listener.")
    }
    
    func testGetIdentityId() {
        XCTAssertNil(AWSMobileClient.sharedInstance().identityId, "Identity Id should be nil after initialize.")

        let identityIdExpectation = expectation(description: "Request to GetIdentityID is complete")
        AWSMobileClient.sharedInstance().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdExpectation.fulfill()
            return nil
        })
        wait(for: [identityIdExpectation], timeout: 5)

        XCTAssertNotNil(AWSMobileClient.sharedInstance().identityId, "Identity Id should not be nil.")
    }
}
