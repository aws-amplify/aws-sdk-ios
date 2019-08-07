//
//  AWSMobileClientTests.swift
//  AWSMobileClientTests
//

import XCTest

@testable import AWSMobileClient
@testable import AWSAuthCore
@testable import AWSCognitoIdentityProvider
@testable import AWSS3

class AWSMobileClientTests: XCTestCase {
    
    // Initialized from credentials-mc.json, or using data from credentials-mc.json
    var userPoolId: String!
    var sharedEmail: String!
    var cognitoIdentity: AWSCognitoIdentity!
    var identityPoolId: String!
    var userPoolsAdminClient: AWSCognitoIdentityProvider!
    
    // Test password that conforms to default UserPool password policies
    let sharedPassword: String = "Abc123@@!!"
    
    override func setUp() {
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
        
        let mobileClientIsInitialized = expectation(description: "AWSMobileClient is initialized")
        
        AWSMobileClient.sharedInstance().initialize { (userState, error) in
            if let error = error {
                XCTFail("Encountered unexpected error in initialize: \(error.localizedDescription)")
                return
            }
            
            guard let userState = userState else {
                XCTFail("userState is unexpectedly empty initializing AWSMobileClient")
                return
            }
            
            if userState != UserState.signedOut {
                AWSMobileClient.sharedInstance().signOut()
            }
            
            mobileClientIsInitialized.fulfill()
        }
        wait(for: [mobileClientIsInitialized], timeout: 5)
    }
    
    override func tearDown() {
        AWSMobileClient.sharedInstance().signOut()
        AWSMobileClient.sharedInstance().clearCredentials()
        AWSMobileClient.sharedInstance().clearKeychain()
    }
    
    func loadCredentialsFromFile() -> [String: Any] {
        let filePath = Bundle(for: type(of: self)).path(forResource: "credentials-mc", ofType: "json")!
        let fileData = try! NSData(contentsOfFile: filePath) as Data
        let credentialsJson = try! JSONSerialization.jsonObject(with: fileData, options: .mutableContainers) as! [String: Any]
        return credentialsJson
    }
    
    func signUpUser(username: String, customUserAttributes: [String: String]? = nil) {
        var userAttributes = ["email": sharedEmail!]
        if let customUserAttributes = customUserAttributes {
            userAttributes.merge(customUserAttributes) { current, _ in current }
        }
        
        let signUpExpectation = expectation(description: "successful sign up expectation.")
        AWSMobileClient.sharedInstance().signUp(
            username: username,
            password: sharedPassword,
            userAttributes: userAttributes) { (signUpResult, error) in
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
                
                XCTAssertTrue(signUpResult.signUpConfirmationState == .unconfirmed, "User is expected to be marked as unconfirmed.")
                
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
        adminConfirmSignUpRequest.userPoolId = userPoolId

        userPoolsAdminClient.adminConfirmSignUp(adminConfirmSignUpRequest).continueWith(block: { (task) -> Any? in
            if let error = task.error {
                XCTFail("Could not confirm user. Failing the test: \(error)")
            }
            return nil
        }).waitUntilFinished()
    }

    func signIn(username: String, password: String? = nil, verifySignState: SignInState = .signedIn) {
        let passwordToUse = password ?? sharedPassword
        let signInWasSuccessful = expectation(description: "signIn was successful")
        AWSMobileClient.sharedInstance().signIn(username: username, password: passwordToUse) { (signInResult, error) in
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
        AWSMobileClient.sharedInstance().confirmSignIn(challengeResponse: challengeResponse,
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
        adminCreateUserRequest.userPoolId = userPoolId
        userPoolsAdminClient.adminCreateUser(adminCreateUserRequest).continueWith { (task) -> Any? in
            if let error = task.error {
                XCTFail("Could not create user. Failing the test: \(error)")
            }
            return nil
        }.waitUntilFinished()
    }
    
    func testSignUp() {
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username)
        adminVerifyUser(username: username)
    }
    
    func testResendConfirmationCode() {
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username)

        let verificationCodeSent = expectation(description: "verification code should be sent via email.")
        AWSMobileClient.sharedInstance().resendSignUpCode(username: username) { (result, error) in
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
    
    func testSignIn() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
    }
    
    func testSignInWithListener() {
        let username = "testUser" + UUID().uuidString
        let signInListenerWasSuccessful = expectation(description: "signIn listener was successful")
        let signInWasSuccessful = expectation(description: "signIn was successful")
        signUpAndVerifyUser(username: username)

        AWSMobileClient.sharedInstance().addUserStateListener(self) { (userState, info) in
            switch (userState) {
            case .signedIn:
                signInListenerWasSuccessful.fulfill()
                print("Listener user is signed in.")
            default:
                print("Listener \(userState)")
            }
        }

        AWSMobileClient.sharedInstance().signIn(username: username, password: sharedPassword) { (signInResult, error) in
            if let error = error {
                XCTFail("User login failed: \(error.localizedDescription)")
                return
            }

            guard let signInResult = signInResult else {
                XCTFail("User login failed, signInResult unexpectedly nil")
                return
            }
            XCTAssertEqual(signInResult.signInState, .signedIn, "Could not verify sign in state")
            signInWasSuccessful.fulfill()
        }
        wait(for: [signInListenerWasSuccessful, signInWasSuccessful], timeout: 5, enforceOrder: true)
    }

    func testSignInFailCase() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        let signInShouldFail = expectation(description: "Sign In should fail")
        AWSMobileClient.sharedInstance().signIn(username: username, password: "WrongPassword") { (signInResult, error) in
            XCTAssertNil(signInResult)
            XCTAssertNotNil(error, "Expecting error for wrong password.")
            signInShouldFail.fulfill()
        }
        wait(for: [signInShouldFail], timeout: 5)
    }
    
    func testVerifyUserAttribute() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let verifyAttrExpectation = expectation(description: "verify attribute expectation.")
        
        AWSMobileClient.sharedInstance().verifyUserAttribute(attributeName: "email") { (codeDeliveryDetails, error) in
            if let codeDeliveryDetails = codeDeliveryDetails {
                print(codeDeliveryDetails.deliveryMedium)
            } else if let error = error {
                XCTFail("Received un-expected error: \(error.localizedDescription)")
            }
            verifyAttrExpectation.fulfill()
        }
        wait(for: [verifyAttrExpectation], timeout: 5)
    }
    
    // Note: This test relies on the configuration of the test UserPools to have at least one mutable custom attribute:
    // custom:mutableStringAttr1
    func testGetAttributes() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username, customUserAttributes: ["custom:mutableStringAttr1": "Value for mutableStringAttr1"])
        signIn(username: username)
        let getAttrExpectation = expectation(description: "get attributes expectation.")
        
        AWSMobileClient.sharedInstance().getUserAttributes { (attributes, error) in
            if let attributes = attributes {
                XCTAssertEqual(attributes.count, 4, "Expected 4 attributes for user.")
                XCTAssertEqual(attributes["email_verified"], "false", "Email should not be verified.")
            }else if let error = error {
                XCTFail("Received un-expected error: \(error.localizedDescription)")
            }
            getAttrExpectation.fulfill()
        }
        
        wait(for: [getAttrExpectation], timeout: 5)
    }
    
    // Note: This test relies on the configuration of the test UserPools to have two mutable custom attributes:
    // custom:mutableStringAttr1; custom:mutableStringAttr2
    func testUpdateAttributes() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        let updateUserAttributesResultHandlerInvoked = expectation(description: "updateUserAttributes result handler should be invoked")
        
        // Update attributes: one previously existing attribute and one new attribute
        let newUserAttributes = [
            "custom:mutableStringAttr1": "new value for previously set attribute",
            "custom:mutableStringAttr2": "value for never-before-set attribute"
        ]
        
        AWSMobileClient.sharedInstance().updateUserAttributes(attributeMap: newUserAttributes) { result, error in
            defer {
                updateUserAttributesResultHandlerInvoked.fulfill()
            }
            guard error == nil else {
                XCTFail("Received un-expected error: \(error.debugDescription)")
                return
            }
            
            // Result is expected to be an empty delivery details list
            guard let result = result else {
                XCTFail("updateUserAttributes result unexpectedtly nil")
                return
            }
            XCTAssertEqual(result.count, 0)
        }
        
        wait(for: [updateUserAttributesResultHandlerInvoked], timeout: 5)
        
        let getUserAttributesResultHandlerInvoked = expectation(description: "getUserAttributes result handler should be invoked")
        AWSMobileClient.sharedInstance().getUserAttributes { attributes, error in
            defer {
                getUserAttributesResultHandlerInvoked.fulfill()
            }
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error.debugDescription)")
                return
            }
            
            guard let attributes = attributes else {
                XCTFail("Attributes are nil")
                return
            }
            
            XCTAssertEqual(attributes["custom:mutableStringAttr1"], "new value for previously set attribute")
            XCTAssertEqual(attributes["custom:mutableStringAttr2"], "value for never-before-set attribute")
        }
        
        wait(for: [getUserAttributesResultHandlerInvoked], timeout: 5)
    }
    
    func testRememberDevice() {
        let username = "testRememberDeviceUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        let initialRememberDeviceExpectation = expectation(description: "initial remember device expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.updateStatus(remembered: true) { (result, error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            initialRememberDeviceExpectation.fulfill()
        }
        
        wait(for: [initialRememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation = expectation(description: "list devices expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.list(limit: 60) { (result, error) in
            defer {
                listDevicesExpectation.fulfill()
            }

            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                return
            }
            
            XCTAssertEqual(result?.devices?.count,
                           1,
                           "Expecting current device to be remembered, get count 1. Service Response: \(String(describing:result?.devices?.count))")
        }
        
        wait(for: [listDevicesExpectation], timeout: 5)
    }
    
    func testDeviceOperations() {
        let username = "testRememberDeviceUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        
        let initialRememberDeviceExpectation = expectation(description: "initial remember device expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.updateStatus(remembered: true) { (result, error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            initialRememberDeviceExpectation.fulfill()
        }
        
        wait(for: [initialRememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation = expectation(description: "list devices expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.list(limit: 60) { (result, error) in
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                listDevicesExpectation.fulfill()
                return
            }
            XCTAssertTrue(result?.devices?.count == 1, "Expecting current device to be remembered, get count 1. Service Response: \(result!.devices!.count)")
            listDevicesExpectation.fulfill()
        }
        
        wait(for: [listDevicesExpectation], timeout: 5)
        
        let getDeviceExpectation = expectation(description: "get device expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.get { (device, error) in
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                getDeviceExpectation.fulfill()
                return
            }
            
            XCTAssertTrue(device!.createDate! < Date(), "Device create date should be before now.")
            print("Device create date: \(device!.createDate!)")
            getDeviceExpectation.fulfill()
        }
        
        wait(for: [getDeviceExpectation], timeout: 5)
        
        let notRememberDeviceExpectation = expectation(description: "forget device expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.updateStatus(remembered: false) { (result, error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            notRememberDeviceExpectation.fulfill()
        }
        
        wait(for: [notRememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation2 = expectation(description: "list devices expectation2.")
        
        AWSMobileClient.sharedInstance().deviceOperations.list(limit: 60) { (result, error) in
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                listDevicesExpectation2.fulfill()
                return
            }
            XCTAssertTrue(result?.devices?.count == 0, "Expecting current device to be NOT remembered, get count 0. Service Response: \(result!.devices!.count)")
            listDevicesExpectation2.fulfill()
        }
        
        wait(for: [listDevicesExpectation2], timeout: 5)
        
        let rememberDeviceExpectation = expectation(description: "remember device expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.updateStatus(remembered: true) { (result, error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            rememberDeviceExpectation.fulfill()
            
        }
        
        wait(for: [rememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation3 = expectation(description: "list devices expectation3.")
        
        AWSMobileClient.sharedInstance().deviceOperations.list(limit: 60) { (result, error) in
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                listDevicesExpectation3.fulfill()
                return
            }
            XCTAssertTrue(result?.devices?.count == 1, "Expecting current device to be remembered, get count 1. Service Response: \(result!.devices!.count)")
            listDevicesExpectation3.fulfill()
        }
        
        wait(for: [listDevicesExpectation3], timeout: 5)
    }
    
    func testDeviceOperationsFailCase() {
        let username = "testRememberDeviceUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        
        let initialRememberDeviceExpectation = expectation(description: "initial remember device expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.updateStatus(remembered: true) { (result, error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            initialRememberDeviceExpectation.fulfill()
        }
        
        wait(for: [initialRememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation = expectation(description: "list devices expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.list(limit: 60) { (result, error) in
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                listDevicesExpectation.fulfill()
                return
            }
            XCTAssertTrue(result?.devices?.count == 1, "Expecting current device to be remembered, get count 1. Service Response: \(result!.devices!.count)")
            listDevicesExpectation.fulfill()
        }
        
        wait(for: [listDevicesExpectation], timeout: 5)
        
        let getDeviceExpectation = expectation(description: "get device expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.get { (device, error) in
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                getDeviceExpectation.fulfill()
                return
            }
            
            XCTAssertTrue(device!.createDate! < Date(), "Device create date should be before now.")
            print("Device create date: \(device!.createDate!)")
            getDeviceExpectation.fulfill()
        }
        
        wait(for: [getDeviceExpectation], timeout: 5)
        
        let notRememberDeviceExpectation = expectation(description: "forget device expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.forget({ (error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            notRememberDeviceExpectation.fulfill()
        })
        
        wait(for: [notRememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation2 = expectation(description: "list devices expectation2.")
        
        AWSMobileClient.sharedInstance().deviceOperations.list(limit: 60) { (result, error) in
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                listDevicesExpectation2.fulfill()
                return
            }
            XCTAssertTrue(result?.devices?.count == 0, "Expecting current device to be NOT remembered, get count 0. Service Response: \(result!.devices!.count)")
            listDevicesExpectation2.fulfill()
        }
        
        wait(for: [listDevicesExpectation2], timeout: 5)
        
        let rememberDeviceExpectation = expectation(description: "remember device expectation.")
        
        AWSMobileClient.sharedInstance().deviceOperations.updateStatus(remembered: true) { (result, error) in
            XCTAssertNotNil(error, "Expecting error but didn't get one.")
            if let mobileError = error as? AWSMobileClientError {
                
                switch(mobileError) {
                case .deviceNotRemembered(message: _):
                    break
                default:
                    XCTFail("Error should be of type device not remembered.")
                }
            }
            rememberDeviceExpectation.fulfill()
        }
        wait(for: [rememberDeviceExpectation], timeout: 5)
    }
    
    func testGetAWSCredentials() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let credentialsExpectation = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.sharedInstance().getAWSCredentials { (credentials, error) in
            if let credentials = credentials {
                XCTAssertNotNil(credentials.accessKey)
                XCTAssertNotNil(credentials.secretKey)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            credentialsExpectation.fulfill()
        }
        wait(for: [credentialsExpectation], timeout: 5)
    }
    
    func testGetTokens() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let tokensExpectation = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.sharedInstance().getTokens { (tokens, error) in
            if let tokens = tokens {
                XCTAssertNotNil(tokens.idToken)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            print("^^^^")
            tokensExpectation.fulfill()
        }
        wait(for: [tokensExpectation], timeout: 5000)
    }
    
    func testSignOut() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == true, "Expected to return true for isSignedIn")
        sleep(1)
        AWSMobileClient.sharedInstance().signOut()
        XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == false, "Expected to return false for isSignedIn")
    }
    
    func testSignOutWithCallback() {
        let username = "testUser" + UUID().uuidString
        let signoutExpectation = expectation(description: "Successfully signout")
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == true, "Expected to return true for isSignedIn")
        sleep(1)
        AWSMobileClient.sharedInstance().signOut { (error) in
            XCTAssertTrue(AWSMobileClient.sharedInstance().isSignedIn == false, "Expected to return false for isSignedIn")
            signoutExpectation.fulfill()
        }
        wait(for: [signoutExpectation], timeout: 2)
    }

    func testFederatedSignInDeveloperAuthenticatedIdentities() {
        let getOpendIdRequest = AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput()
        getOpendIdRequest?.identityPoolId = identityPoolId
        getOpendIdRequest?.logins = ["login.test.awsmobileclient": "test_users"]
        var identityId: String?
        var token: String?
        
        cognitoIdentity!.getOpenIdToken(forDeveloperIdentity: getOpendIdRequest!).continueWith { (task) -> Any? in
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
        
        AWSMobileClient.sharedInstance().federatedSignIn(providerName: IdentityProvider.developer.rawValue, token: token!, federatedSignInOptions: FederatedSignInOptions(cognitoIdentityId: identityId!)) { (userState, error) in
            XCTAssertNil(error, "Expected successful federation.")
        }
        
        let credentialsExpectation = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.sharedInstance().getAWSCredentials { (credentials, error) in
            if let credentials = credentials {
                XCTAssertNotNil(credentials.accessKey)
                XCTAssertNotNil(credentials.secretKey)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            credentialsExpectation.fulfill()
        }
        wait(for: [credentialsExpectation], timeout: 5)
        
        AWSMobileClient.sharedInstance().signOut()
        
        XCTAssertFalse(AWSMobileClient.sharedInstance().isSignedIn, "User should be signed out.")
        XCTAssertNil(AWSMobileClient.sharedInstance().identityId, "Identity Id should be nil after signing out.")
        
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        let credentialsExpectation2 = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.sharedInstance().getAWSCredentials { (credentials, error) in
            if let credentials = credentials {
                XCTAssertNotNil(credentials.accessKey)
                XCTAssertNotNil(credentials.secretKey)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            credentialsExpectation2.fulfill()
        }
        wait(for: [credentialsExpectation2], timeout: 5)
        
        AWSMobileClient.sharedInstance().signOut()
    }
    
    func testUserStateNotifications() {
        var signInExpectation = false
        var signOutExpectation = false
        XCTAssertTrue(AWSMobileClient.sharedInstance().listeners.count == 1, "Expecting only 1 listener.")
        AWSMobileClient.sharedInstance().addUserStateListener(self) { (userState, info) in
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
        AWSMobileClient.sharedInstance().signOut()
        sleep(1)
        XCTAssertTrue(signInExpectation, "Expected Sign In to be true")
        XCTAssertTrue(signOutExpectation, "Expected Sign Out to be true")
        XCTAssertTrue(AWSMobileClient.sharedInstance().listeners.count == 2, "Expecting 2 listeners.")
        AWSMobileClient.sharedInstance().removeUserStateListener(self)
        XCTAssertTrue(AWSMobileClient.sharedInstance().listeners.count == 1, "Expecting only 1 listener.")
    }
    
    func testForgotPassword() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        let forgotPasswordExpection = expectation(description: "Expecting code to be sent for forgot password.")
        AWSMobileClient.sharedInstance().forgotPassword(username: username) { (forgotPasswordResult, error) in
            XCTAssertNotNil(error, "should get error which mentions there is no verified email or phone.")
            forgotPasswordExpection.fulfill()
        }
        wait(for: [forgotPasswordExpection], timeout: 5)
    }
    
    func testChangePassword() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let changePasswordExpectation = expectation(description: "Change password should be successful")
        AWSMobileClient.sharedInstance().changePassword(currentPassword: sharedPassword, proposedPassword: "NewPassword123!@") { (error) in
            XCTAssertNil(error)
            changePasswordExpectation.fulfill()
        }
        wait(for: [changePasswordExpectation], timeout: 5)
    }
    
    func testChangePasswordFailCase() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let changePasswordExpectation = expectation(description: "Change password should fail")
        AWSMobileClient.sharedInstance().changePassword(currentPassword: "WronPassword", proposedPassword: "NewPassword123!@") { (error) in
            XCTAssertNotNil(error)
            guard let _ = error as? AWSMobileClientError else {
                XCTFail("Error should be of type AWSMobileClientError")
                changePasswordExpectation.fulfill()
                return
            }
            changePasswordExpectation.fulfill()
        }
        wait(for: [changePasswordExpectation], timeout: 5)
    }
    
    func testUploadPrivateFile() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let transferUtility = AWSS3TransferUtility.default()
        let verifyCredentialsExpectation = expectation(description: "Credentials should be retrieved successfully")
        AWSMobileClient.sharedInstance().getAWSCredentials { (creds, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(creds)
            verifyCredentialsExpectation.fulfill()
        }
        wait(for: [verifyCredentialsExpectation], timeout: 5)
        
        guard let identityId = AWSMobileClient.sharedInstance().identityId else {
            XCTFail("Could not find identityId to do private upload.")
            return
        }
        
        let uploadKey = "private/\(identityId)/file.txt"
        let uploadExpectation = expectation(description: "Successful file upload.")
        print("Uploading file to : \(uploadKey)")
        transferUtility.uploadData("Hello World".data(using: .utf8)!, key: uploadKey, contentType: "txt/plain", expression: nil) { (task, error) in
            XCTAssertNil(error)
            if let error = error {
                XCTFail("Upload File Failed: \(error.localizedDescription)")
            }
            uploadExpectation.fulfill()
        }
        wait(for: [uploadExpectation], timeout: 5)
    }
    
    func testDownloadPrivateFile() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let transferUtility = AWSS3TransferUtility.default()
        let verifyCredentialsExpectation = expectation(description: "Credentials should be retrieved successfully")
        AWSMobileClient.sharedInstance().getAWSCredentials { (creds, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(creds)
            verifyCredentialsExpectation.fulfill()
        }
        wait(for: [verifyCredentialsExpectation], timeout: 5)
        
        guard let identityId = AWSMobileClient.sharedInstance().identityId else {
            XCTFail("Could not find identityId to do private upload.")
            return
        }
        
        let uploadKey = "private/\(identityId)/file.txt"
        let uploadExpectation = expectation(description: "Successful file upload.")
        let content = "Hello World"
        print("Uploading file to : \(uploadKey)")
        
        transferUtility.uploadData(content.data(using: .utf8)!, key: uploadKey, contentType: "txt/plain", expression: nil) { (task, error) in
            XCTAssertNil(error)
            if let error = error {
                XCTFail("Upload File Failed: \(error.localizedDescription)")
            }
            uploadExpectation.fulfill()
        }
        wait(for: [uploadExpectation], timeout: 5)
        
        let downloadExpectation = expectation(description: "Successful file download.")
        transferUtility.downloadData(forKey: uploadKey, expression: nil) { (task, url, data, error) in
            XCTAssertNil(error)
            if let error = error {
                XCTFail("Upload File Failed: \(error.localizedDescription)")
            }
            XCTAssertNotNil(data)
            if let data = data {
                let dataText = String(data: data, encoding: .utf8)
                XCTAssertEqual(dataText!, content, "Expecting uploaded and downloaded contents to be same.")
            }
            downloadExpectation.fulfill()
        }
        wait(for: [downloadExpectation], timeout: 5)
        
    }
    
    func testGetIdentityId() {
        XCTAssertNil(AWSMobileClient.sharedInstance().identityId, "Identity Id should be nil after initialize.")

        let identityIdExpectation = expectation(description: "Request to GetIdentityID is complete")
        AWSMobileClient.sharedInstance().getIdentityId().continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result, "GetIdentityId should not return nil.")
            identityIdExpectation.fulfill()
            return nil
        })
        wait(for: [identityIdExpectation], timeout: 5)

        XCTAssertNotNil(AWSMobileClient.sharedInstance().identityId, "Identity Id should not be nil.")
    }
    
    func testPasswordResetChallenge() {
        let username = "testUser" + UUID().uuidString
        let tempPassword = "tempPassword" + UUID().uuidString
        adminCreateUser(username: username, temporaryPassword: tempPassword)
        signIn(username: username, password: tempPassword, verifySignState: .newPasswordRequired)
        confirmSign(challengeResponse: sharedPassword, userAttributes: ["email": sharedEmail])
    }

}

extension AWSMobileClientError {
    var message: String {
        switch self {
        case .aliasExists(let message): return message
        case .codeDeliveryFailure(let message): return message
        case .codeMismatch(let message): return message
        case .expiredCode(let message): return message
        case .groupExists(let message): return message
        case .internalError(let message): return message
        case .invalidLambdaResponse(let message): return message
        case .invalidOAuthFlow(let message): return message
        case .invalidParameter(let message): return message
        case .invalidPassword(let message): return message
        case .invalidUserPoolConfiguration(let message): return message
        case .limitExceeded(let message): return message
        case .mfaMethodNotFound(let message): return message
        case .notAuthorized(let message): return message
        case .passwordResetRequired(let message): return message
        case .resourceNotFound(let message): return message
        case .scopeDoesNotExist(let message): return message
        case .softwareTokenMFANotFound(let message): return message
        case .tooManyFailedAttempts(let message): return message
        case .tooManyRequests(let message): return message
        case .unexpectedLambda(let message): return message
        case .userLambdaValidation(let message): return message
        case .userNotConfirmed(let message): return message
        case .userNotFound(let message): return message
        case .usernameExists(let message): return message
        case .unknown(let message): return message
        case .notSignedIn(let message): return message
        case .identityIdUnavailable(let message): return message
        case .guestAccessNotAllowed(let message): return message
        case .federationProviderExists(let message): return message
        case .cognitoIdentityPoolNotConfigured(let message): return message
        case .unableToSignIn(let message): return message
        case .invalidState(let message): return message
        case .userPoolNotConfigured(let message): return message
        case .userCancelledSignIn(let message): return message
        case .badRequest(let message): return message
        case .expiredRefreshToken(let message): return message
        case .errorLoadingPage(let message): return message
        case .securityFailed(let message): return message
        case .idTokenNotIssued(let message): return message
        case .idTokenAndAcceessTokenNotIssued(let message): return message
        case .invalidConfiguration(let message): return message
        case .deviceNotRemembered(let message): return message
        }
    }
}
