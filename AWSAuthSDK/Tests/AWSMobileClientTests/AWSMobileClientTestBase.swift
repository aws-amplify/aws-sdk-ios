//
//  AWSMobileClientBaseTests.swift
//  AWSMobileClientTests
//

import XCTest

@testable import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider
import AWSTestResources

class AWSMobileClientTestBase: XCTestCase {
    static let networkRequestTimeout: TimeInterval = 60.0
    
    static var cognitoIdentity: AWSCognitoIdentity!
    static var userPoolsAdminClient: AWSCognitoIdentityProvider!
    
    static var userPoolId: String!
    static var sharedEmail: String!
    static var identityPoolId: String!
    static var sharedPassword: String!
    
    override class func setUp() {
        sharedEmail = AWSTestConfiguration.getIntegrationTestConfigurationValue(forPackageId: "mobileclient",
                                                                                configKey: "email_address")
        sharedPassword = AWSTestConfiguration.getIntegrationTestConfigurationValue(forPackageId: "mobileclient",
                                                                                configKey: "test_password")

        let commonTestConfiguration = AWSTestConfiguration.getIntegrationTestConfiguration(forPackageId: "common")
        
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
        
        let region = (commonTestConfiguration["region"] as! String).aws_regionTypeValue()
        let configuration = AWSServiceConfiguration(region: region, credentialsProvider: credentialsProvider)!
        
        AWSCognitoIdentityProvider.register(with: configuration, forKey: "TEST")
        AWSCognitoIdentity.register(with: configuration, forKey: "TEST")
        
        cognitoIdentity = AWSCognitoIdentity(forKey: "TEST")
        userPoolsAdminClient = AWSCognitoIdentityProvider(forKey: "TEST")
        initializeMobileClient()
    }
    
    override func tearDown() {
        AWSMobileClient.default().signOut()
        AWSMobileClient.default().clearCredentials()
        AWSMobileClient.default().clearKeychain()
    }
    
    //MARK: Helper methods
    
    static func loadTestConfigurationFromFile() -> [String: Any] {
        return AWSTestConfiguration.getTestConfiguration() as! [String: Any]
    }
    
    static func initializeMobileClient() {
        let testCase = XCTestCase()
        let mobileClientIsInitialized = testCase.expectation(description: "AWSMobileClient is initialized")
        
        AWSMobileClient.default().initialize() { (userState, error) in
            if let error = error {
                XCTFail("Encountered unexpected error in initialize: \(error.localizedDescription)")
                return
            }
            
            guard let userState = userState else {
                XCTFail("userState is unexpectedly empty initializing AWSMobileClient")
                return
            }
            
            if userState != UserState.signedOut {
                AWSMobileClient.default().signOut()
            }
            mobileClientIsInitialized.fulfill()
        }
        testCase.wait(for: [mobileClientIsInitialized], timeout: 5)
    }
    
    func signIn(username: String, password: String? = nil, verifySignState: SignInState = .signedIn) {
        let passwordToUse = password ?? AWSMobileClientTestBase.sharedPassword!
        let signInWasSuccessful = expectation(description: "signIn was successful")
        AWSMobileClient.default().signIn(username: username, password: passwordToUse) { (signInResult, error) in
            if let error = error {
                XCTFail("User login failed: \(error.localizedDescription)")
                return
            }
            
            guard let signInResult = signInResult else {
                XCTFail("User login failed, signInResult unexpectedly nil")
                return
            }
            XCTAssertEqual(signInResult.signInState, verifySignState, "Could not verify sign in state")
            signInWasSuccessful.fulfill()
        }
        wait(for: [signInWasSuccessful], timeout: AWSMobileClientTestBase.networkRequestTimeout)
    }
    
    func confirmSign(challengeResponse: String, userAttributes:[String:String] = [:], verifySignState: SignInState = .signedIn) {
        
        let signInConfirmWasSuccessful = expectation(description: "signIn confirm was successful")
        AWSMobileClient.default().confirmSignIn(challengeResponse: challengeResponse,
                                                userAttributes: userAttributes) {
                                                    (signInResult, error) in
                                                    
                                                    if let error = error {
                                                        XCTFail("Sign in confirm failed: \(error.localizedDescription)")
                                                        return
                                                    }
                                                    if let signInResult = signInResult {
                                                        XCTAssertEqual(signInResult.signInState, verifySignState, "Could not verify sign in state")
                                                    }
                                                    
                                                    signInConfirmWasSuccessful.fulfill()
        }
        wait(for: [signInConfirmWasSuccessful], timeout: AWSMobileClientTestBase.networkRequestTimeout)
    }
    
    func signUpUser(username: String,
                    customUserAttributes: [String: String]? = nil,
                    clientMetaData: [String: String]? = nil,
                    signupState: SignUpConfirmationState = .unconfirmed) {
        var userAttributes = ["email": AWSMobileClientTestBase.sharedEmail!]
        if let customUserAttributes = customUserAttributes {
            userAttributes.merge(customUserAttributes) { current, _ in current }
        }
        
        let signUpExpectation = expectation(description: "successful sign up expectation.")
        AWSMobileClient.default().signUp(
            username: username,
            password: AWSMobileClientTestBase.sharedPassword,
            userAttributes: userAttributes,
            clientMetaData: clientMetaData ?? [:]) { (signUpResult, error) in
                if let error = error {
                    var errorMessage: String
                    if let mobileClientError = error as? AWSMobileClientError {
                        errorMessage = mobileClientError.message
                    } else {
                        errorMessage = error.localizedDescription
                    }
                    XCTFail("Unexpected failure: \(errorMessage)")
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
                
                signUpExpectation.fulfill()
        }
        
        wait(for: [signUpExpectation], timeout: AWSMobileClientTestBase.networkRequestTimeout)
    }
    
    func adminVerifyUser(username: String) {
        guard let adminConfirmSignUpRequest = AWSCognitoIdentityProviderAdminConfirmSignUpRequest() else {
            XCTFail("Unable to create adminConfirmSignUpRequest")
            return
        }
        
        adminConfirmSignUpRequest.username = username
        adminConfirmSignUpRequest.userPoolId = AWSMobileClientTestBase.userPoolId
        
        AWSMobileClientTestBase.userPoolsAdminClient.adminConfirmSignUp(adminConfirmSignUpRequest).continueWith(block: { (task) -> Any? in
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
    
    func adminCreateUser(username: String, temporaryPassword: String, userAttributes: [String: String] = [:]) {
        guard let adminCreateUserRequest = AWSCognitoIdentityProviderAdminCreateUserRequest() else {
            XCTFail("Unable to create adminCreateUserRequest")
            return
        }
        let userAttributesTransformed = userAttributes.map {AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1) }
        adminCreateUserRequest.username = username
        adminCreateUserRequest.temporaryPassword = temporaryPassword
        adminCreateUserRequest.userAttributes = userAttributesTransformed
        adminCreateUserRequest.userPoolId = AWSMobileClientTestBase.userPoolId
        AWSMobileClientTestBase.userPoolsAdminClient.adminCreateUser(adminCreateUserRequest).continueWith { (task) -> Any? in
            if let error = task.error {
                XCTFail("Could not create user. Failing the test: \(error)")
            }
            return nil
        }.waitUntilFinished()
    }
    
    func invalidateSession(username: String) {
        let bundleID = Bundle.main.bundleIdentifier
        let keychain = AWSUICKeyChainStore(service: "\(bundleID!).\(AWSCognitoIdentityUserPool.self)")
        let namespace = "\(AWSMobileClient.default().userPoolClient!.userPoolConfiguration.clientId).\(username)"
        let key = "\(namespace).tokenExpiration"
        keychain.removeItem(forKey: key)
    }
    
    static func getAWSConfiguration() -> [String: Any] {
        let mobileClientConfig = AWSTestConfiguration.getIntegrationTestConfiguration(forPackageId: "mobileclient")
        let awsconfiguration = mobileClientConfig["awsconfiguration"] as! [String: Any]
        return awsconfiguration
    }
}

