//
//  AWSMobileClientCustomEndpointTest.swift
//  AWSMobileClientCustomEndpointTest
//

import XCTest
import AWSMobileClient
import AWSTestResources

/// All tests in this class run against a configuration that specifies an "Endpoint" to override
/// the default User Pool endpoint construction of `cognito-idp.<region>.amazonaws.com`.
class AWSMobileClientCustomEndpointTest: AWSMobileClientTestBase {
    override class func setUp() {
        loadConfigurationForCustomEndpoint()
        super.setUp()
    }

    override func setUp() {
        _ = AWSMobileClient.default().getCredentialsProvider()
        continueAfterFailure = false
    }

    override func tearDown() {
        let signedOut = expectation(description: "signedOut")
        AWSMobileClient.default().signOut() { _ in
            signedOut.fulfill()
        }
        wait(for: [signedOut], timeout: 1.0)
        AWSMobileClient.default().clearKeychain()
        AWSMobileClient.default().clearCredentials()
    }

    /// Manipulates the configs in-memory to swap the Custom Endpoint config into the Default slot
    /// Since this modifies the config singleton, the custom endpoint tests must be run in a
    /// separate execution context from other tests. Also defensively removes unused configs to
    /// reduce possibility of conflict.
    static func loadConfigurationForCustomEndpoint() {
        var configurationJson = getAWSConfiguration()

        configurationJson.removeValue(forKey: "S3TransferUtility")

        // Use NSMutableDictionary rather than `var cognitoUserPoolConfig...` to retain class
        // semantics and make it easier to modify deeply-nested structures
        let cognitoUserPoolConfig = configurationJson["CognitoUserPool"] as! NSMutableDictionary
        cognitoUserPoolConfig["Default"] = cognitoUserPoolConfig["CustomEndpoint"]

        cognitoUserPoolConfig.removeObject(forKey: "DefaultCustomAuth")
        cognitoUserPoolConfig.removeObject(forKey: "CustomEndpoint")

        let authConfig = configurationJson["Auth"] as! NSMutableDictionary
        authConfig["Default"] = ["authenticationFlowType": "USER_SRP_AUTH"]
        authConfig.removeObject(forKey: "DefaultCustomAuth")

        AWSInfo.configureDefaultAWSInfo(configurationJson)
    }

    /// Simply tests that the method completes without errors. We make this an explicit test,
    /// even though `testSignIn` uses `AWSMobileClient.signUp` behind the scenes,
    /// so that we're not dependent on the internals of the test base `signUpAndVerifyUser`
    /// utility method
    func testSignUp() {
        let username = "awsmobileclient-testSignUp-\(UUID().uuidString)"
        let userAttributes = ["email": AWSMobileClientTestBase.sharedEmail!]

        let signUpComplete = expectation(description: "signUpComplete")

        AWSMobileClient.default().signUp(
            username: username,
            password: AWSMobileClientTestBase.sharedPassword,
            userAttributes: userAttributes
        ) { result, error in
            defer {
                signUpComplete.fulfill()
            }

            guard error == nil else {
                XCTAssertNil(error)
                return
            }

            guard let result = result else {
                XCTFail("result unexpectedly nil")
                return
            }

            XCTAssertEqual(result.signUpConfirmationState, .unconfirmed)
        }

        waitForExpectations(timeout: AWSMobileClientTestBase.networkRequestTimeout)
    }

    func testSignSRPIn() {
        let username = "awsmobileclient-testSignIn-\(UUID().uuidString)"

        signUpAndVerifyUser(username: username)

        let signInComplete = expectation(description: "signInComplete")
        AWSMobileClient.default().signIn(
            username: username,
            password: AWSMobileClientCustomEndpointTest.sharedPassword
        ) { result, error in
            defer {
                signInComplete.fulfill()
            }

            XCTAssertNil(error)

            guard let signInResult = result else {
                XCTAssertNotNil(result)
                return
            }

            XCTAssertEqual(signInResult.signInState, .signedIn)
        }

        wait(for: [signInComplete], timeout: AWSMobileClientCustomEndpointTest.networkRequestTimeout)
    }

    func testForgotPassword() {
        let username = "awsmobileclient-testForgotPassword-\(UUID().uuidString)"

        signUpAndVerifyUser(username: username)

        let confirmEmailRequest = AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest()!
        confirmEmailRequest.username = username
        confirmEmailRequest.userPoolId = AWSMobileClientTestBase.userPoolId
        confirmEmailRequest.userAttributes = [
            AWSCognitoIdentityUserAttributeType(name: "email_verified", value: "true")
        ]

        AWSMobileClientTestBase
            .userPoolsAdminClient
            .adminUpdateUserAttributes(confirmEmailRequest)
            .continueWith(block: { task in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            })
            .waitUntilFinished()

        let forgotPasswordComplete = expectation(description: "forgotPasswordComplete")
        AWSMobileClient.default().forgotPassword(username: username) { result, error in
            defer {
                forgotPasswordComplete.fulfill()
            }

            XCTAssertNil(error)

            guard let forgotPasswordResult = result else {
                XCTAssertNotNil(result)
                return
            }

            XCTAssertEqual(forgotPasswordResult.forgotPasswordState, .confirmationCodeSent)
        }

        wait(for: [forgotPasswordComplete], timeout: AWSMobileClientCustomEndpointTest.networkRequestTimeout)
    }

    func testResendConfirmationCode() {
        let username = "awsmobileclient-testResendConfirmationCode-\(UUID().uuidString)"
        let userAttributes = ["email": AWSMobileClientTestBase.sharedEmail!]

        let signUpComplete = expectation(description: "signUpComplete")
        AWSMobileClient.default().signUp(
            username: username,
            password: AWSMobileClientTestBase.sharedPassword,
            userAttributes: userAttributes
        ) { result, error in
            defer {
                signUpComplete.fulfill()
            }

            guard error == nil else {
                XCTAssertNil(error)
                return
            }

            guard let result = result else {
                XCTFail("result unexpectedly nil")
                return
            }

            XCTAssertEqual(result.signUpConfirmationState, .unconfirmed)
        }
        waitForExpectations(timeout: AWSMobileClientTestBase.networkRequestTimeout)

        let resendSignUpCodeComplete = expectation(description: "resendSignUpCodeComplete")
        AWSMobileClient.default().resendSignUpCode(username: username) { result, error in
            defer {
                resendSignUpCodeComplete.fulfill()
            }

            guard error == nil else {
                XCTAssertNil(error)
                return
            }

            guard let result = result else {
                XCTFail("result unexpectedly nil")
                return
            }

            XCTAssertNotNil(result.codeDeliveryDetails)
        }

        waitForExpectations(timeout: AWSMobileClientTestBase.networkRequestTimeout)
    }

    func testRefreshToken() {
        let username = "awsmobileclient-testRefreshToken-\(UUID().uuidString)"

        signUpAndVerifyUser(username: username)

        let signInComplete = expectation(description: "signInComplete")
        AWSMobileClient.default().signIn(
            username: username,
            password: AWSMobileClientCustomEndpointTest.sharedPassword
        ) { result, error in
            defer {
                signInComplete.fulfill()
            }

            XCTAssertNil(error)

            guard let signInResult = result else {
                XCTAssertNotNil(result)
                return
            }

            XCTAssertEqual(signInResult.signInState, .signedIn)
        }

        wait(for: [signInComplete], timeout: AWSMobileClientCustomEndpointTest.networkRequestTimeout)

        invalidateAccessToken(username: username)

        let getTokensComplete = expectation(description: "getTokensComplete")
        AWSMobileClient.default().getTokens { result, error in
            defer {
                getTokensComplete.fulfill()
            }

            guard error == nil else {
                XCTAssertNil(error)
                return
            }

            guard let tokens = result else {
                XCTAssertNotNil(result)
                return
            }

            XCTAssertNotNil(tokens.accessToken)
        }

        wait(for: [getTokensComplete], timeout: AWSMobileClientCustomEndpointTest.networkRequestTimeout)
    }

}
