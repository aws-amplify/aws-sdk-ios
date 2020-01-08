//
//  AWSMobileClientCustomAuthTests.swift
//  AWSAuthSDKTestAppUITests
//

import XCTest
@testable import AWSMobileClient
import AWSCore
@testable import AWSCognitoIdentityProvider

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
    ///  Define Auth Challenge
    ///
    ///  ```
    ///     exports.handler = function(event, context) {
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
    ///     }
    ///  ```
    /// Verify Auth Challenge Response
    /// ```
    ///    function verifyAuthChallengeResponse(event) {
    ///         if (event.request.privateChallengeParameters.answer === event.request.challengeAnswer) {
    ///             event.response.answerCorrect = true;
    ///         } else {
    ///             event.response.answerCorrect = false;
    ///         }
    ///     }
    ///
    ///    exports.handler = (event, context, callback) => {
    ///         verifyAuthChallengeResponse(event);
    ///         callback(null, event);
    ///    };
    /// ```
    /// Create Auth Challenge
    /// ```
    ///    function createAuthChallenge(event) {
    ///         if (event.request.challengeName === 'CUSTOM_CHALLENGE') {
    ///             event.response.publicChallengeParameters = {};
    ///             event.response.privateChallengeParameters = {};
    ///             event.response.privateChallengeParameters.answer = '1133';
    ///         }
    ///    }
    ///
    ///    exports.handler = (event, context, callback) => {
    ///         createAuthChallenge(event);
    ///         callback(null, event);
    ///    };
    /// ```
    ///
    static func loadConfigurationForCustomAuth() {
        let bundle = Bundle(for: AWSMobileClientCustomAuthTests.self)
        let filePath = bundle.path(forResource: "awsconfiguration", ofType: "json")!
        let fileData = try! NSData(contentsOfFile: filePath) as Data
        let configurationJson = try! JSONSerialization.jsonObject(with: fileData,
                                                                  options: .mutableContainers) as! NSMutableDictionary
        
        let cognitoUserPoolConfig = configurationJson["CognitoUserPool"] as! NSMutableDictionary
        cognitoUserPoolConfig["Default"] = cognitoUserPoolConfig["DefaultCustomAuth"]
        
        let authConfig = configurationJson["Auth"] as! NSMutableDictionary
        authConfig["Default"] = authConfig["DefaultCustomAuth"]
        AWSInfo.configureDefaultAWSInfo(configurationJson as! [String : Any])
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
        invalidateSession(username: username)
        
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
    
}
