//
//  AWSMobileClientBaseTests.swift
//  AWSMobileClientTests
//

import XCTest

@testable import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider
import AWSTestResources

class AWSAuthSDKUITestBase: XCTestCase {
    static let networkRequestTimeout: TimeInterval = 60.0
    
    static var userPoolsAdminClient: AWSCognitoIdentityProvider!
    
    static var userPoolId: String!
    static var sharedEmail: String!
    static var sharedPassword: String!
    
    override class func setUp() {
        sharedEmail = AWSTestConfiguration.getIntegrationTestConfigurationValue(forPackageId: "mobileclient",
                                                                                configKey: "email_address")
        sharedPassword = AWSTestConfiguration.getIntegrationTestConfigurationValue(forPackageId: "mobileclient",
                                                                                configKey: "test_password")

        let commonTestConfiguration = AWSTestConfiguration.getIntegrationTestConfiguration(forPackageId: "common")
        
        let awsConfig = getAWSConfiguration()
        AWSInfo.configureDefaultAWSInfo(awsConfig)
        let userPoolConfig = awsConfig["CognitoUserPool"] as! [String: [String: Any]]
        userPoolId = (userPoolConfig["Default"]!["PoolId"] as! String)
        
        let testConfigurationJSON = loadTestConfigurationFromFile()
        let credentialsTestConfiguration = testConfigurationJSON["credentials"] as! [String: Any]
        let credentialsProvider = AWSBasicSessionCredentialsProvider(accessKey: credentialsTestConfiguration["accessKey"] as! String,
                                                                     secretKey: credentialsTestConfiguration["secretKey"] as! String,
                                                                     sessionToken: credentialsTestConfiguration["sessionToken"] as! String)
        
        let region = (commonTestConfiguration["region"] as! String).aws_regionTypeValue()
        let configuration = AWSServiceConfiguration(region: region, credentialsProvider: credentialsProvider)!
        
        AWSCognitoIdentityProvider.register(with: configuration, forKey: "TEST")
        AWSCognitoIdentity.register(with: configuration, forKey: "TEST")
        
        userPoolsAdminClient = AWSCognitoIdentityProvider(forKey: "TEST")
        initializeMobileClient()
    }

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
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

    static func getAWSConfiguration() -> [String: Any] {
        let mobileClientConfig = AWSTestConfiguration.getIntegrationTestConfiguration(forPackageId: "mobileclient")
        let awsconfiguration = mobileClientConfig["awsconfiguration"] as! [String: Any]
        return awsconfiguration
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
    
    func signUpUser(username: String,
                    customUserAttributes: [String: String]? = nil,
                    clientMetaData: [String: String]? = nil,
                    signupState: SignUpConfirmationState = .unconfirmed) {
        var userAttributes = ["email": AWSAuthSDKUITestBase.sharedEmail!]
        if let customUserAttributes = customUserAttributes {
            userAttributes.merge(customUserAttributes) { current, _ in current }
        }
        
        let signUpExpectation = expectation(description: "successful sign up expectation.")
        AWSMobileClient.default().signUp(
            username: username,
            password: AWSAuthSDKUITestBase.sharedPassword,
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
        
        wait(for: [signUpExpectation], timeout: AWSAuthSDKUITestBase.networkRequestTimeout)
    }
    
    func adminVerifyUser(username: String) {
        guard let adminConfirmSignUpRequest = AWSCognitoIdentityProviderAdminConfirmSignUpRequest() else {
            XCTFail("Unable to create adminConfirmSignUpRequest")
            return
        }
        
        adminConfirmSignUpRequest.username = username
        adminConfirmSignUpRequest.userPoolId = AWSAuthSDKUITestBase.userPoolId
        
        AWSAuthSDKUITestBase.userPoolsAdminClient.adminConfirmSignUp(adminConfirmSignUpRequest).continueWith(block: { (task) -> Any? in
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

    /// Sign in the user
    func signInUserpool(application: XCUIApplication, username: String) {
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        springboard.buttons["Continue"].tap()
        
        let webViewsQuery = application.webViews
        _ = webViewsQuery.textFields["Username"].waitForExistence(timeout: 5)
        webViewsQuery.textFields["Username"].tap()
        webViewsQuery/*@START_MENU_TOKEN@*/.textFields["Username"]/*[[".otherElements[\"Signin\"].textFields[\"Username\"]",".textFields[\"Username\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText(username)
        
        let passwordSecureTextField = webViewsQuery/*@START_MENU_TOKEN@*/.secureTextFields["Password"]/*[[".otherElements[\"Signin\"].secureTextFields[\"Password\"]",".secureTextFields[\"Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(AWSAuthSDKUITestBase.sharedPassword)
        
        application.buttons["Done"].tap()
        
        let signInButton = webViewsQuery.buttons["submit"]
                signInButton.tap()
    }
    
    func signInUserpoolWhenRefreshTokenExpires(application: XCUIApplication, username: String) {
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        _ = springboard.buttons["Continue"].waitForExistence(timeout: 5)
        springboard.buttons["Continue"].tap()
    }
    
    /// Sign out the active user in the home page.
    func signOutUserpool(application: XCUIApplication) {
        let signinstatelabelElement = application.staticTexts["signInStateLabel"]
        if signinstatelabelElement.label == "signedIn" {
            application.buttons["SignOut"].tap()
            let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
            springboard.buttons["Continue"].tap()
            let predicate = NSPredicate(format: "label CONTAINS[c] %@", "signedOut")
            let signOutExpectation = expectation(for: predicate, evaluatedWith: signinstatelabelElement,
                                                 handler: nil)
            wait(for: [signOutExpectation], timeout: 5)
        }
        XCTAssertEqual("signedOut", signinstatelabelElement.label)
    }
    
    /// Inspect if we have all the token details. We fail if
    /// the token values are still 'NA'
    func inspectTokenDetails(application: XCUIApplication) {
        
        let labelValidityPredicate = NSPredicate(format: "NOT label BEGINSWITH 'NA'")
        
        let idTokenLabelElement = application.staticTexts["idTokenLabel"]
        let accessTokenLabelElement = application.staticTexts["accessTokenLabel"]
        let refreshTokenLabelElement = application.staticTexts["refreshTokenLabel"]
        
        let idTokenExpectation = expectation(for: labelValidityPredicate,
                                             evaluatedWith: idTokenLabelElement,
                                             handler: nil)
        let accessTokenExpectation = expectation(for: labelValidityPredicate,
                                                 evaluatedWith: accessTokenLabelElement,
                                                 handler: nil)
        let refreshTokenExpectation = expectation(for: labelValidityPredicate,
                                                  evaluatedWith: refreshTokenLabelElement,
                                                  handler: nil)
        
        wait(for: [idTokenExpectation, accessTokenExpectation, refreshTokenExpectation], timeout: 10)
    }
    
    /// Inspect if we have all the credential details. We fail if
    /// the credential values are still 'NA'
    func inspectCredentialDetails(application: XCUIApplication) {
        
        let labelValidityPredicate = NSPredicate(format: "NOT label BEGINSWITH 'NA'")
        
        let accessKeyLabelElement = application.staticTexts["idTokenLabel"]
        let secretKeyLabelElement = application.staticTexts["accessTokenLabel"]
        let sessionKeyLabelElement = application.staticTexts["refreshTokenLabel"]
        
        let accessKeyExpectation = expectation(for: labelValidityPredicate,
                                               evaluatedWith: accessKeyLabelElement,
                                               handler: nil)
        let secretKeyExpectation = expectation(for: labelValidityPredicate,
                                               evaluatedWith: secretKeyLabelElement,
                                               handler: nil)
        let sessionKeyExpectation = expectation(for: labelValidityPredicate,
                                                evaluatedWith: sessionKeyLabelElement,
                                                handler: nil)
        
        wait(for: [accessKeyExpectation, secretKeyExpectation, sessionKeyExpectation], timeout: 10)
    }
}

