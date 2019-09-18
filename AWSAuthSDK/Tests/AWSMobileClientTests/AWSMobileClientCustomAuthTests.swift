//
//  AWSMobileClientCustomAuthTests.swift
//  AWSAuthSDKTestAppUITests
//

import XCTest
@testable import AWSMobileClient

class AWSMobileClientCustomAuthTests: AWSMobileClientBaseTests {

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
        let filePath = bundle.path(forResource: "awsconfiguration_customAuth", ofType: "json")!
        let fileData = try! NSData(contentsOfFile: filePath) as Data
        let configurationJson = try! JSONSerialization.jsonObject(with: fileData, options: .mutableContainers) as! [String: Any]
        AWSInfo.configureDefaultAWSInfo(configurationJson)
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
        signUpAndVerifyUser(username: username)
        
        let signInSuccessfulExpectation = expectation(description: "signIn was successful")
        AWSMobileClient.default().signIn(username: username,
                                         password: "dummy")
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

}
