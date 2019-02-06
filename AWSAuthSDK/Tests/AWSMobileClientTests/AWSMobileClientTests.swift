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
    
    static var UserPoolsAdminClient: AWSCognitoIdentityProvider?
    static var UserPoolId: String?
    static var Email: String?
    static var CognitoIdentity: AWSCognitoIdentity?
    static var IdentityPoolId: String?
    
    let sharedPassword: String = "Abc123@@!!"
    
    var userPoolsAdminClient: AWSCognitoIdentityProvider? {
        return AWSMobileClientTests.UserPoolsAdminClient
    }
    var sharedEmail: String? {
        return AWSMobileClientTests.Email
    }
    
    override static func setUp() {
        let filePath = Bundle(for: self).path(forResource: "credentials-mc", ofType: "json")
        var credentialsJson: [AnyHashable : Any]? = nil
        if let aPath = NSData(contentsOfFile: filePath ?? "") {
            credentialsJson = try! JSONSerialization.jsonObject(with: aPath as Data, options: .mutableContainers) as? [AnyHashable : Any]
        }
        
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: credentialsJson!["accessKey"] as! String, secretKey: credentialsJson!["secretKey"] as! String)
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialsProvider)
        UserPoolId = credentialsJson?["mc-userpool_id"] as? String
        AWSCognitoIdentityProvider.register(with: configuration!, forKey: "TEST")
        AWSCognitoIdentity.register(with: configuration!, forKey: "TEST")
        CognitoIdentity = AWSCognitoIdentity(forKey: "TEST")
        UserPoolsAdminClient = AWSCognitoIdentityProvider(forKey: "TEST")
        
        Email = credentialsJson?["mc-email"] as? String
        IdentityPoolId = credentialsJson?["mc-pool_id_dev_auth"] as? String
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let initalizeExpectaion = expectation(description: "successful initializtion for mobile client.")
        
        AWSMobileClient.sharedInstance().initialize { (userState, error) in
            if let userState = userState {
                if(userState != UserState.signedOut) {
                    AWSMobileClient.sharedInstance().signOut()
                }
            } else if let error = error {
                XCTFail("Encountered un-expected error in initialize: \(error.localizedDescription)")
            }
            initalizeExpectaion.fulfill()
        }
        wait(for: [initalizeExpectaion], timeout: 5)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        AWSMobileClient.sharedInstance().signOut()
    }
    
    func signUpUser(username: String) {
        let signUpExpectation = expectation(description: "successful sign up expectation.")
        AWSMobileClient.sharedInstance().signUp(username: username,
                                                password: self.sharedPassword,
                                                userAttributes: ["email":sharedEmail!]) { (signUpResult, error) in
            if let signUpResult = signUpResult {
                switch(signUpResult.signUpConfirmationState) {
                case .confirmed:
                    print("User is signed up and confirmed.")
                case .unconfirmed:
                    print("User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)")
                case .unknown:
                    print("Unexpected case")
                }
                XCTAssertTrue(signUpResult.signUpConfirmationState == .unconfirmed, "User is expected to be marked as unconfirmed.")
            } else if let error = error {
                if let error = error as? AWSMobileClientError {
                    switch(error) {
                    case .usernameExists(let message):
                        print(message)
                    default:
                        break
                    }
                }
                XCTFail("Unexpected failure: \(error.localizedDescription)")
                print("\(error.localizedDescription)")
            }
            signUpExpectation.fulfill()
        }
        
        wait(for: [signUpExpectation], timeout: 5)
    }
    
    func adminVerifyUser(username: String) {
        let adminConfirmSignUpRequest = AWSCognitoIdentityProviderAdminConfirmSignUpRequest.init()
        adminConfirmSignUpRequest?.username = username
        adminConfirmSignUpRequest?.userPoolId = AWSMobileClientTests.UserPoolId
        self.userPoolsAdminClient?.adminConfirmSignUp(adminConfirmSignUpRequest!).continueWith(block: { (task) -> Any? in
            if task.error != nil {
                XCTFail("Could not confirm user. Failing the test.")
            }
            return nil
        }).waitUntilFinished()
    }
    
    func signIn(username: String) {
        let signInExpectation = expectation(description: "successful sign in expectation")
        AWSMobileClient.sharedInstance().signIn(username: username, password: self.sharedPassword) { (signInResult, error) in
            if let signInResult = signInResult {
                switch(signInResult.signInState) {
                case .signedIn:
                    print("signed in")
                default:
                    XCTFail("User was not signed in, un-expected.")
                }
            } else if let error = error {
                XCTFail("User login was expected, but failed. \(error.localizedDescription)")
            }
            signInExpectation.fulfill()
        }
        wait(for: [signInExpectation], timeout: 5000)
    }
    
    func signUpAndVerifyUser(username: String) {
        signUpUser(username: username)
        adminVerifyUser(username: username)
    }
    
    func testSignUp() {
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username)
        adminVerifyUser(username: username)
    }
    
    func testResendConfirmationCode() {
        let username = "testUser" + UUID().uuidString
        signUpUser(username: username)
        let verificationCodeSentExpectation = expectation(description: "verification code should be sent via email.")
        AWSMobileClient.sharedInstance().resendSignUpCode(username: username) { (signUpResult, error) in
            if let signUpResult = signUpResult {
                switch(signUpResult.signUpConfirmationState){
                case .unconfirmed:
                    XCTAssertTrue(signUpResult.codeDeliveryDetails!.deliveryMedium == UserCodeDeliveryMedium.email, "Verification code should have been sent via email, but is not.")
                default:
                    XCTFail("User should be in un-confirmed state.")
                }
            } else if let error = error {
                XCTFail("Failed due to error: \(error.localizedDescription)")
            }
            verificationCodeSentExpectation.fulfill()
        }
        wait(for: [verificationCodeSentExpectation], timeout: 5)
    }
    
    func testSignIn() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
    }
    
    func testSignInFailCase() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        let failExpectation = expectation(description: "Sign In should fail")
        AWSMobileClient.sharedInstance().signIn(username: username, password: "WrongPassword") { (signInResult, error) in
            XCTAssertNil(signInResult)
            XCTAssertNotNil(error, "Expecting error for wrong password.")
            failExpectation.fulfill()
        }
        wait(for: [failExpectation], timeout: 5)
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
    
    func testGetAttributes() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let getAttrExpectation = expectation(description: "get attributes expectation.")
        
        AWSMobileClient.sharedInstance().getUserAttributes { (attributes, error) in
            if let attributes = attributes {
                XCTAssertTrue(attributes.count == 3, "Expected 3 attributes for user.")
                XCTAssertTrue(attributes["email_verified"] == "false", "Email should not be verified.")
            }else if let error = error {
                XCTFail("Received un-expected error: \(error.localizedDescription)")
            }
            getAttrExpectation.fulfill()
        }

        wait(for: [getAttrExpectation], timeout: 5)
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
    
    func testFederatedSignInDeveloperAuthenticatedIdentities() {
        let getOpendIdRequest = AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput()
        getOpendIdRequest?.identityPoolId = AWSMobileClientTests.IdentityPoolId
        getOpendIdRequest?.logins = ["login.test.awsmobileclient": "test_user"]
        var identityId: String?
        var token: String?
        AWSMobileClientTests.CognitoIdentity!.getOpenIdToken(forDeveloperIdentity: getOpendIdRequest!).continueWith { (task) -> Any? in
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
        XCTAssertTrue(AWSMobileClient.sharedInstance().listeners.count == 1, "Expecting only 1 listener.")
        AWSMobileClient.sharedInstance().removeUserStateListener(self)
        XCTAssertTrue(AWSMobileClient.sharedInstance().listeners.count == 0, "Expecting no listeners.")
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

}
