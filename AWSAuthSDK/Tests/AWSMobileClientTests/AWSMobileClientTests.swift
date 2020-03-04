//
//  AWSMobileClientTests.swift
//  AWSMobileClientTests
//

import XCTest

@testable import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

class AWSMobileClientTests: AWSMobileClientTestBase {
    
    func testSignUp() {
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username)
        adminVerifyUser(username: username)
    }
    
    func testSignUpWithValidClientMetaData() {
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username,
                   clientMetaData: ["customKey":"cutomValue"])
        adminVerifyUser(username: username)
    }
    
    func testResendSignUpCode() {
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username)

        let verificationCodeSent = expectation(description: "verification code should be sent via email.")
        AWSMobileClient.default().resendSignUpCode(username: username) { (result, error) in
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
    
    func testGetTokens() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let tokensExpectation = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.default().getTokens { (tokens, error) in
            if let tokens = tokens {
                XCTAssertNotNil(tokens.idToken)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            print("^^^^")
            tokensExpectation.fulfill()
        }
        wait(for: [tokensExpectation], timeout: 15)
    }
    
    func testFederatedSignInDeveloperAuthenticatedIdentities() {
        let getOpendIdRequest = AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput()
        getOpendIdRequest?.identityPoolId = AWSMobileClientTestBase.identityPoolId
        getOpendIdRequest?.logins = ["login.test.awsmobileclient": "test_users"]
        var identityId: String?
        var token: String?
        
        AWSMobileClientTestBase.cognitoIdentity!.getOpenIdToken(forDeveloperIdentity: getOpendIdRequest!).continueWith { (task) -> Any? in
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
        
        AWSMobileClient.default().federatedSignIn(providerName: IdentityProvider.developer.rawValue, token: token!, federatedSignInOptions: FederatedSignInOptions(cognitoIdentityId: identityId!)) { (userState, error) in
            XCTAssertNil(error, "Expected successful federation.")
        }
        
        let credentialsExpectation = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.default().getAWSCredentials { (credentials, error) in
            if let credentials = credentials {
                XCTAssertNotNil(credentials.accessKey)
                XCTAssertNotNil(credentials.secretKey)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            credentialsExpectation.fulfill()
        }
        wait(for: [credentialsExpectation], timeout: 10)
        
        AWSMobileClient.default().signOut()
        
        XCTAssertFalse(AWSMobileClient.default().isSignedIn, "User should be signed out.")
        XCTAssertNil(AWSMobileClient.default().identityId, "Identity Id should be nil after signing out.")
        
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        let credentialsExpectation2 = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.default().getAWSCredentials { (credentials, error) in
            if let credentials = credentials {
                XCTAssertNotNil(credentials.accessKey)
                XCTAssertNotNil(credentials.secretKey)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            credentialsExpectation2.fulfill()
        }
        wait(for: [credentialsExpectation2], timeout: 10)
        
        AWSMobileClient.default().signOut()
    }
    
    func testUserStateNotifications() {
        var signInExpectation = false
        var signOutExpectation = false
        XCTAssertTrue(AWSMobileClient.default().listeners.count == 1, "Expecting only 1 listener.")
        AWSMobileClient.default().addUserStateListener(self) { (userState, info) in
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
        AWSMobileClient.default().signOut()
        sleep(1)
        XCTAssertTrue(signInExpectation, "Expected Sign In to be true")
        XCTAssertTrue(signOutExpectation, "Expected Sign Out to be true")
        XCTAssertTrue(AWSMobileClient.default().listeners.count == 2, "Expecting 2 listeners.")
        AWSMobileClient.default().removeUserStateListener(self)
        XCTAssertTrue(AWSMobileClient.default().listeners.count == 1, "Expecting only 1 listener.")
    }
    
    func testGetIdentityId() {
        XCTAssertNil(AWSMobileClient.default().identityId, "Identity Id should be nil after initialize.")

        let identityIdExpectation = expectation(description: "Request to GetIdentityID is complete")
        AWSMobileClient.default().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdExpectation.fulfill()
            return nil
        })
        wait(for: [identityIdExpectation], timeout: 5)

        XCTAssertNotNil(AWSMobileClient.default().identityId, "Identity Id should not be nil.")
    }
    
    func testMultipleGetIdentityId() {
        XCTAssertNil(AWSMobileClient.default().identityId, "Identity Id should be nil after initialize.")
        
        let identityIdExpectation1 = expectation(description: "Request to GetIdentityID 1 is complete")
        let identityIdExpectation2 = expectation(description: "Request to GetIdentityID 2 is complete")
        let identityIdExpectation3 = expectation(description: "Request to GetIdentityID 3 is complete")
        let identityIdExpectation4 = expectation(description: "Request to GetIdentityID 4 is complete")
        let identityIdExpectation5 = expectation(description: "Request to GetIdentityID 5 is complete")
        AWSMobileClient.default().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdExpectation1.fulfill()
            return nil
        })
        AWSMobileClient.default().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdExpectation2.fulfill()
            return nil
        })
        AWSMobileClient.default().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdExpectation3.fulfill()
            return nil
        })
        AWSMobileClient.default().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdExpectation4.fulfill()
            return nil
        })
        AWSMobileClient.default().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdExpectation5.fulfill()
            return nil
        })
        wait(for: [identityIdExpectation1, identityIdExpectation2, identityIdExpectation3, identityIdExpectation4, identityIdExpectation5],
             timeout: 15)
    }
    
    /// Test whether we are getting same identity id for unauth to auth transition.
    ///
    /// - Given: An unauthenticated user session
    /// - When:
    ///    - I fetch Identity Id, id1
    ///    - Then I signIn and fetch identity id , id2
    ///    - Then I signOut and fetch another id , id3
    ///    - Then I signIn again and fetch identity id , id4
    /// - Then:
    ///    - All identity id1 == id2 and id2 != id3 and id3 == id4.
    ///
    func testGetIdentityWithSignOutAndSignIn() {
        XCTAssertNil(AWSMobileClient.default().identityId, "Identity Id should be nil after initialize.")
        var identityIdBeforeSignIn: String?
        var identityIdAfterSignIn: String?
        var identityIdAfterSignOut: String?
        var identityIdAfterSignIn2: String?
        
        let signOutIdentityIdExpectation = expectation(description: "Request to GetIdentityID before signIn is complete")
        let signInIdentityIdExpectation = expectation(description: "Request to GetIdentityID after signIn is complete")
        let signOutIdentityIdExpectation2 = expectation(description: "Request to GetIdentityID before signOut is complete")
        let signInIdentityIdExpectation2 = expectation(description: "Request to GetIdentityID before second signIn is complete")
        
        AWSMobileClient.default().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdBeforeSignIn = task.result as String?
            signOutIdentityIdExpectation.fulfill()
            return nil
        })
        wait(for: [signOutIdentityIdExpectation], timeout: 5)
        XCTAssertNotNil(AWSMobileClient.default().identityId, "Identity Id should not be nil.")
        
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        AWSMobileClient.default().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdAfterSignIn = task.result as String?
            signInIdentityIdExpectation.fulfill()
            return nil
        })
        wait(for: [signInIdentityIdExpectation], timeout: 5)
        XCTAssertNotNil(AWSMobileClient.default().identityId, "Identity Id should not be nil.")
        XCTAssertEqual(identityIdBeforeSignIn, identityIdAfterSignIn)
        AWSMobileClient.default().signOut()
        
        AWSMobileClient.default().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdAfterSignOut = task.result as String?
            signOutIdentityIdExpectation2.fulfill()
            return nil
        })
        wait(for: [signOutIdentityIdExpectation2], timeout: 5)
        XCTAssertNotNil(AWSMobileClient.default().identityId, "Identity Id should not be nil.")
        XCTAssertNotEqual(identityIdAfterSignIn, identityIdAfterSignOut)
        
        let username2 = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username2)
        signIn(username: username2)
        
        AWSMobileClient.default().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdAfterSignIn2 = task.result as String?
            signInIdentityIdExpectation2.fulfill()
            return nil
        })
        wait(for: [signInIdentityIdExpectation2], timeout: 5)
        XCTAssertNotNil(AWSMobileClient.default().identityId, "Identity Id should not be nil.")
        XCTAssertEqual(identityIdAfterSignIn2, identityIdAfterSignOut)
    }
}
