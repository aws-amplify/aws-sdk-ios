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

    func testSignIn() {
        let username = "awsmobileclient-\(UUID().uuidString)"

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

}
