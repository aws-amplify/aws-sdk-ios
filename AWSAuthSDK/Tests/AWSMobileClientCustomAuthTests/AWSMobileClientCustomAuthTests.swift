//
//  AWSMobileClientCustomAuthTests.swift
//  AWSAuthSDKTestAppUITests
//

import XCTest
@testable import AWSMobileClient
import AWSCore
@testable import AWSCognitoIdentityProvider
import AWSTestResources

/// Test different custom auth use cases in AWSMobileClient
///
/// Test signUp, signIn, confirmSignIn and credentials api for an userpool configured with custom auth.
/// Please note that, the test doesnot cover any network related error workflows, like retryability for retryable errors,
/// these were manually tested.
class AWSMobileClientCustomAuthTests: AWSMobileClientTestBase {
    
    override class func setUp() {
        loadConfigurationForCustomAuth()
        super.setUp()
    }
    
    /// Load configuration for custom auth.
    ///
    /// Custom auth require a separate app client id, app secret
    /// and "authenticationFlowType": "CUSTOM_AUTH" in the configuration.
    /// Cognito Userpool should be configured with the following lambda triggers:
    ///
    /// **Define Auth Challenge**
    /// ```
    /// exports.handler = function(event, context) {
    ///     if (event.request.session.length == 1 && event.request.session[0].challengeName == 'SRP_A') {
    ///         event.response.issueTokens = false;
    ///         event.response.failAuthentication = false;
    ///         event.response.challengeName = 'CUSTOM_CHALLENGE';
    ///     } else if (event.request.session.length == 2 && event.request.session[1].challengeName == 'CUSTOM_CHALLENGE' && event.request.session[1].challengeResult == true) {
    ///         event.response.issueTokens = true;
    ///         event.response.failAuthentication = false;
    ///         event.response.challengeName = 'CUSTOM_CHALLENGE';
    ///     } else {
    ///         event.response.issueTokens = false;
    ///         event.response.failAuthentication = true;
    ///     }
    ///     context.done(null, event);
    /// };
    /// ```
    ///
    /// **Verify Auth Challenge Response**
    /// ```
    /// function verifyAuthChallengeResponse(event) {
    ///     if (event.request.privateChallengeParameters.answer === event.request.challengeAnswer) {
    ///         event.response.answerCorrect = true;
    ///     } else {
    ///         event.response.answerCorrect = false;
    ///     }
    /// }
    ///
    /// exports.handler = (event, context, callback) => {
    ///     verifyAuthChallengeResponse(event);
    ///     callback(null, event);
    /// };
    /// ```
    ///
    /// **Create Auth Challenge**
    /// ```
    /// function createAuthChallenge(event) {
    ///     if (event.request.challengeName === 'CUSTOM_CHALLENGE') {
    ///         event.response.publicChallengeParameters = { testKey: 'testResult' };
    ///         event.response.privateChallengeParameters = {};
    ///         event.response.privateChallengeParameters.answer = '1133';
    ///     }
    /// }
    ///
    /// exports.handler = (event, context, callback) => {
    ///     createAuthChallenge(event);
    ///     callback(null, event);
    /// };
    /// ```
    ///
    /// **Pre SignUp**
    /// ```
    /// "use strict";
    /// Object.defineProperty(exports, "__esModule", { value: true });
    /// exports.handler = async (event) => {
    ///     event.response.autoConfirmUser = true;
    ///     event.response.autoVerifyEmail = true;
    ///     return event;
    /// };
    /// ```
    ///
    static func loadConfigurationForCustomAuth() {
        let configurationJson = getAWSConfiguration()
        
        let cognitoUserPoolConfig = configurationJson["CognitoUserPool"] as! NSMutableDictionary
        cognitoUserPoolConfig["Default"] = cognitoUserPoolConfig["DefaultCustomAuth"]
        
        let authConfig = configurationJson["Auth"] as! NSMutableDictionary
        authConfig["Default"] = authConfig["DefaultCustomAuth"]
        AWSInfo.configureDefaultAWSInfo(configurationJson)
    }
    
    /// Tries to signIn the user
    func signInAndConfirm(user username: String) {
        let signInSuccessfulExpectation = expectation(description: "signIn was successful")
        AWSMobileClient.default().signIn(username: username,
                                         password: UUID().uuidString)
        { (signInResult, error) in
            
            defer {
                signInSuccessfulExpectation.fulfill()
            }
            if let error = error {
                XCTFail("User login failed: \(error.localizedDescription)")
                return
            }
            guard let signInResult = signInResult else {
                XCTFail("User login failed, signInResult unexpectedly nil")
                return
            }
            XCTAssertEqual(signInResult.signInState, .customChallenge, "SignIn state should be custom challenge")
            XCTAssertEqual(signInResult.parameters["testKey"], "testResult", "Should return challenge parameters")
        }
        wait(for: [signInSuccessfulExpectation], timeout: 10)
        
        let confirmSignInSuccessfulExpectation = expectation(description: "confirmSignIn was successful")
        AWSMobileClient.default().confirmSignIn(challengeResponse: "1133") { (signInResult, error) in
            defer {
                confirmSignInSuccessfulExpectation.fulfill()
            }
            if let error = error {
                XCTFail("User login failed: \(error.localizedDescription)")
                return
            }
            
            guard let signInResult = signInResult else {
                XCTFail("User login failed, signInResult unexpectedly nil")
                return
            }
            XCTAssertEqual(signInResult.signInState, .signedIn, "Could not verify sign in state")
        }
        wait(for: [confirmSignInSuccessfulExpectation], timeout: 10)
    }
    
    /// Test signIn using a custom auth flow.
    ///
    /// - Given:
    ///     - An unauthenticated session.
    /// - When:
    ///    - I try to signIn a user in custom auth
    ///    - Enter custom auth challenge
    /// - Then:
    ///    - I used get an authenticated session
    ///
    func testSuccesfulCustomAuthFlow() {
        XCTAssertFalse(AWSMobileClient.default().isSignedIn, "Should be in signOut state")
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username, customUserAttributes: nil, signupState: .confirmed)
        signInAndConfirm(user: username)
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
        signUpUser(username: username, customUserAttributes: nil, signupState: .confirmed)
        signInAndConfirm(user: username)
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
        invalidateRefreshToken(username: username)
        
        let signOutExpectation = expectation(description: "signout was called")
        AWSMobileClient.default().addUserStateListener(self) { (userstate, info) in
            if (userstate == .signedOutUserPoolsTokenInvalid) {
                DispatchQueue.main.async {
                    signOutExpectation.fulfill()
                    self.signInAndConfirm(user: username)
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

    /// Test if calling releaseSignInWait after a session expiry releases the waiting getToken call
    ///
    /// - Given: A signedIn valid session
    /// - When:
    ///    - I call releaseSignInWait after receiving signedOutUserPoolsTokenInvalid
    /// - Then:
    ///    - The waiting getTokens call should complete with an .unableToSignIn error.
    ///
    func testReleaseSignInWaitOnSessionExpiry() {
        XCTAssertFalse(AWSMobileClient.default().isSignedIn, "Should be in signOut state")

        // SignIn the user and assert that the token is valid
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username, customUserAttributes: nil, signupState: .confirmed)
        signInAndConfirm(user: username)
        let tokenFetchExpectation = expectation(description: "Token fetch after signIn should be successful")
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

        // Setup a listener to call releaseSignInWait whenever you get signedOutUserPoolsTokenInvalid
        AWSMobileClient.default().addUserStateListener(self) { (userstate, info) in
            if (userstate == .signedOutUserPoolsTokenInvalid) {
                AWSMobileClient.default().releaseSignInWait()
            }
        }

        // Now invalidate the session and then try to call getToken
        invalidateRefreshToken(username: username)

        let tokenFetchFailExpectation = expectation(description: "Token fetch should complete")
        AWSMobileClient.default().getTokens { (token, error) in
            defer {
                tokenFetchFailExpectation.fulfill()
            }
            guard let error = error as? AWSMobileClientError,
                case .unableToSignIn = error else {
                XCTFail("Should receive an unable to signIn error")
                return
            }
        }
        wait(for: [tokenFetchFailExpectation], timeout: 20)
        AWSMobileClient.default().removeUserStateListener(self)
    }

    /// Test if calling releaseSignInWait after a session expiry releases all the waiting getToken call
    ///
    /// - Given: A signedIn valid session
    /// - When:
    ///    - I call releaseSignInWait after receiving signedOutUserPoolsTokenInvalid
    /// - Then:
    ///    - All the waiting getTokens call should complete with an .unableToSignIn error.
    ///
    func testReleaseSignInWaitOnMultipleSessionExpiry() {
        XCTAssertFalse(AWSMobileClient.default().isSignedIn, "Should be in signOut state")

        // SignIn the user and assert that the token is valid
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username, customUserAttributes: nil, signupState: .confirmed)
        signInAndConfirm(user: username)
        let tokenFetchExpectation = expectation(description: "Token fetch after signIn should be successful")
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

        // Setup a listener to call releaseSignInWait whenever you get signedOutUserPoolsTokenInvalid
        AWSMobileClient.default().addUserStateListener(self) { (userstate, info) in
            if (userstate == .signedOutUserPoolsTokenInvalid) {
                AWSMobileClient.default().releaseSignInWait()
            }
        }

        // Now invalidate the session and then try to call getToken
        invalidateRefreshToken(username: username)

        let tokenFetchFailExpectation = expectation(description: "Token fetch should complete")
        tokenFetchFailExpectation.expectedFulfillmentCount = 50

        for _ in 1...tokenFetchFailExpectation.expectedFulfillmentCount {
            AWSMobileClient.default().getTokens { (token, error) in
                defer {
                    tokenFetchFailExpectation.fulfill()
                }
                guard let error = error as? AWSMobileClientError,
                    case .unableToSignIn = error else {
                    XCTFail("Should receive an unable to signIn error")
                    return
                }
            }
        }

        wait(for: [tokenFetchFailExpectation], timeout: 20)
        AWSMobileClient.default().removeUserStateListener(self)
    }

    /// Test if calling signOut after a session expiry releases the waiting getToken call
    ///
    /// - Given: A signedIn valid session
    /// - When:
    ///    - I call signOut after receiving signedOutUserPoolsTokenInvalid
    /// - Then:
    ///    - The waiting getTokens call should complete with an  error.
    ///
    func testSignOutOnSessionExpiry() {
        XCTAssertFalse(AWSMobileClient.default().isSignedIn, "Should be in signOut state")

        // SignIn the user and assert that the token is valid
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username, customUserAttributes: nil, signupState: .confirmed)
        signInAndConfirm(user: username)
        let tokenFetchExpectation = expectation(description: "Token fetch after signIn should be successful")
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

        // Setup a listener to call signOut whenever you get signedOutUserPoolsTokenInvalid
        AWSMobileClient.default().addUserStateListener(self) { (userstate, info) in
            if (userstate == .signedOutUserPoolsTokenInvalid) {
                AWSMobileClient.default().signOut()
            }
        }

        // Now invalidate the session and then try to call getToken
        invalidateRefreshToken(username: username)

        let tokenFetchFailExpectation = expectation(description: "Token fetch should complete")
        AWSMobileClient.default().getTokens { (token, error) in
            defer {
                tokenFetchFailExpectation.fulfill()
            }
            guard let error = error as? AWSMobileClientError else {
                XCTFail("Should receive an unable to signIn error")
                return
            }
            switch error {
            case .notSignedIn, .unableToSignIn:
                break;
            default:
                XCTFail("Error should be either of notSignedIn or unableToSigIn but received \(error)")
            }
        }
        wait(for: [tokenFetchFailExpectation], timeout: 20)
        AWSMobileClient.default().removeUserStateListener(self)
    }

    /// Calling releaseSignInWait without signIn should not crash
    ///
    /// - Given: A signOut session
    /// - When:
    ///    - I call releaseSignInWait
    /// - Then:
    ///    - Should complete without crashing
    ///
    func testReleaseSignInWaitWithOutSignIn() {
        AWSMobileClient.default().releaseSignInWait()
        let tokenFetchExpectation = expectation(description: "Token fetch should be completed")
        AWSMobileClient.default().getTokens { (token, error) in
            defer {
                tokenFetchExpectation.fulfill()
            }
            guard error != nil else  {
                XCTFail("Should produce an error when getToken called withOut SignIn")
                return
            }
        }
        wait(for: [tokenFetchExpectation], timeout: 20)
    }
    
}
