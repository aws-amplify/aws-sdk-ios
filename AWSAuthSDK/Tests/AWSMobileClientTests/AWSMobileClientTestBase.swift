//
//  AWSMobileClientBaseTests.swift
//  AWSMobileClientTests
//

import XCTest

@testable import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

class AWSMobileClientTestBase: XCTestCase {

    static var cognitoIdentity: AWSCognitoIdentity!
    static var userPoolsAdminClient: AWSCognitoIdentityProvider!
    
    static var userPoolId: String!
    static var sharedEmail: String!
    static var identityPoolId: String!

    // Test password that conforms to default UserPool password policies
    let sharedPassword: String = "Abc123@@!!"
    
    override class func setUp() {
        let credentialsJson = loadCredentialsFromFile()
        userPoolId = (credentialsJson["mc-userpool_id"] as! String)
        sharedEmail = (credentialsJson["mc-email"] as! String)
        identityPoolId = (credentialsJson["mc-pool_id_dev_auth"] as! String)
        
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: credentialsJson["accessKey"] as! String,
                                                               secretKey: credentialsJson["secretKey"] as! String)
        
        let region = (credentialsJson["mc-region"] as! String).aws_regionTypeValue()
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
    
    static func loadCredentialsFromFile() -> [String: Any] {
        let filePath = Bundle(for: AWSMobileClientTestBase.self).path(forResource: "credentials-mc", ofType: "json")!
        let fileData = try! NSData(contentsOfFile: filePath) as Data
        let credentialsJson = try! JSONSerialization.jsonObject(with: fileData, options: .mutableContainers) as! [String: Any]
        return credentialsJson
    }
    
    static func initializeMobileClient() {
        let testCase = XCTestCase()
        let mobileClientIsInitialized = testCase.expectation(description: "AWSMobileClient is initialized")
        AWSMobileClient.default().initialize { (userState, error) in
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
        let passwordToUse = password ?? sharedPassword
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
        wait(for: [signInWasSuccessful], timeout: 5)
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
        wait(for: [signInConfirmWasSuccessful], timeout: 5)
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
            password: sharedPassword,
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
                    print("User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)")
                case .unknown:
                    print("Unexpected case")
                }
                
                XCTAssertTrue(signUpResult.signUpConfirmationState == signupState, "User is expected to be marked as \(signupState).")
                
                signUpExpectation.fulfill()
        }
        
        wait(for: [signUpExpectation], timeout: 5)
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
    
}
