//
//  AWSMobileClientProxyTests.swift
//  AWSMobileClientTests
//
//  Created by Schmelter, Tim on 2/23/21.
//  Copyright © 2021 Amazon Web Services. All rights reserved.
//

import XCTest
import AWSMobileClient
import AWSTestResources

class AWSMobileClientProxyTests: XCTestCase {
    static let packageId = "mobileclient_proxy"
    static let networkRequestTimeout: TimeInterval = 60.0
    static var sharedEmail: String!
    static var sharedPassword: String!
    static var identityPoolId: String!
    static var userPoolId: String!
    static var userPoolsAdminClient: AWSCognitoIdentityProvider!
    static var cognitoIdentityClient: AWSCognitoIdentity!

    static var proxyMobileClient: AWSMobileClient!

    override class func setUp() {
        sharedEmail = AWSTestConfiguration.getIntegrationTestConfigurationValue(
            forPackageId: packageId,
            configKey: "email_address"
        )
        sharedPassword = AWSTestConfiguration.getIntegrationTestConfigurationValue(
            forPackageId: packageId,
            configKey: "test_password"
        )

        let awsConfig = getAWSConfiguration()
        let userPoolConfig = awsConfig["CognitoUserPool"] as! [String: [String: Any]]
        userPoolId = (userPoolConfig["Default"]!["PoolId"] as! String)

        let credentialProviderConfig = awsConfig["CredentialsProvider"] as! [String: [String: [String: String]]]
        identityPoolId = credentialProviderConfig["CognitoIdentity"]!["Default"]!["PoolId"]

        let testConfigurationJSON = loadTestConfigurationFromFile()
        let credentialsTestConfiguration = testConfigurationJSON["credentials"] as! [String: Any]
        let credentialsProvider = AWSBasicSessionCredentialsProvider(accessKey: credentialsTestConfiguration["accessKey"] as! String,
                                                                     secretKey: credentialsTestConfiguration["secretKey"] as! String,
                                                                     sessionToken: credentialsTestConfiguration["sessionToken"] as! String)

        let commonTestConfiguration = AWSTestConfiguration.getIntegrationTestConfiguration(
            forPackageId: "common"
        )

        let region = (commonTestConfiguration["region"] as! String).aws_regionTypeValue()
        let configuration = AWSServiceConfiguration(region: region, credentialsProvider: credentialsProvider)!

        AWSCognitoIdentityProvider.register(with: configuration, forKey: "TEST")
        AWSCognitoIdentity.register(with: configuration, forKey: "TEST")

        cognitoIdentityClient = AWSCognitoIdentity(forKey: "TEST")
        userPoolsAdminClient = AWSCognitoIdentityProvider(forKey: "TEST")

        proxyMobileClient = AWSMobileClient(configuration: awsConfig)
    }

    override func tearDown() {
        let signedOut = expectation(description: "signedOut")
        AWSMobileClientProxyTests.proxyMobileClient.signOut() { _ in
            signedOut.fulfill()
        }
        wait(for: [signedOut], timeout: 1.0)
    }

    func testSignIn() {
        let signedOut = expectation(description: "signedOut")
        AWSMobileClientProxyTests.proxyMobileClient.signOut() { _ in
            signedOut.fulfill()
        }
        wait(for: [signedOut], timeout: 1.0)

        let username = "awsmobileclient-\(UUID().uuidString)"

        signUpAndVerifyUser(username: username)

        let clientInitialized = expectation(description: "clientInitialized")
        AWSMobileClientProxyTests.proxyMobileClient.initialize { _, _ in
            clientInitialized.fulfill()
        }
        wait(for: [clientInitialized], timeout: 0.1)

        let signInComplete = expectation(description: "signInComplete")
        AWSMobileClientProxyTests.proxyMobileClient.signIn(
            username: username,
            password: AWSMobileClientProxyTests.sharedPassword
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
        wait(for: [signInComplete], timeout: AWSMobileClientProxyTests.networkRequestTimeout)
    }

    // MARK: - Utilities

    static func loadTestConfigurationFromFile() -> [String: Any] {
        return AWSTestConfiguration.getTestConfiguration() as! [String: Any]
    }

    static func getAWSConfiguration() -> [String: Any] {
        let mobileClientConfig = AWSTestConfiguration.getIntegrationTestConfiguration(
            forPackageId: packageId
        )
        let awsconfiguration = mobileClientConfig["awsconfiguration"] as! [String: Any]
        return awsconfiguration
    }

    func signUpUser(
        username: String,
        customUserAttributes: [String: String]? = nil,
        clientMetaData: [String: String]? = nil,
        signupState: SignUpConfirmationState = .unconfirmed
    ) {
        continueAfterFailure = false

        var userAttributes = ["email": AWSMobileClientProxyTests.sharedEmail!]
        if let customUserAttributes = customUserAttributes {
            userAttributes.merge(customUserAttributes) { current, _ in current }
        }

        let signUpExpectation = expectation(description: "successful sign up expectation.")
        AWSMobileClientProxyTests.proxyMobileClient.signUp(
            username: username,
            password: AWSMobileClientProxyTests.sharedPassword,
            userAttributes: userAttributes,
            clientMetaData: clientMetaData ?? [:]
        ) { signUpResult, error in
            defer {
                signUpExpectation.fulfill()
            }

            guard error == nil else {
                XCTFail("Unexpected failure: \(error!)")
                return
            }

            guard let signUpResult = signUpResult else {
                XCTFail("signUpResult unexpectedly nil")
                return
            }

            switch(signUpResult.signUpConfirmationState) {
            case .confirmed:
                print("User is signed up and confirmed.")
            case .unconfirmed:
                if let codeDeliveryDetails = signUpResult.codeDeliveryDetails {
                    print("User is not confirmed and needs verification via \(codeDeliveryDetails.deliveryMedium) sent at \(codeDeliveryDetails.destination!)")
                } else {
                    print("User is not confirmed but no code delivery details were set")
                }
            case .unknown:
                print("Unexpected case")
            }

            XCTAssertTrue(signUpResult.signUpConfirmationState == signupState, "User is expected to be marked as \(signupState).")
        }

        wait(for: [signUpExpectation], timeout: AWSMobileClientProxyTests.networkRequestTimeout)
    }

    func adminVerifyUser(username: String) {
        guard let adminConfirmSignUpRequest = AWSCognitoIdentityProviderAdminConfirmSignUpRequest() else {
            XCTFail("Unable to create adminConfirmSignUpRequest")
            return
        }

        adminConfirmSignUpRequest.username = username
        adminConfirmSignUpRequest.userPoolId = AWSMobileClientProxyTests.userPoolId

        AWSMobileClientProxyTests.userPoolsAdminClient.adminConfirmSignUp(adminConfirmSignUpRequest).continueWith(block: { (task) -> Any? in
            if let error = task.error {
                XCTFail("Could not confirm user. Failing the test: \(error)")
            }
            return nil
        }).waitUntilFinished()
    }

    func signUpAndVerifyUser(username: String, customUserAttributes: [String: String]? = nil) {
        signUpUser(username: username, customUserAttributes: customUserAttributes)
        adminVerifyUser(username: username)
    }

}
