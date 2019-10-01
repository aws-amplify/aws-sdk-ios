//
//  AWSDropInUIUserPoolTests.swift
//  AWSAuthSDKTestAppUITests
//

import XCTest
import AWSCognitoIdentityProvider

class AWSDropInUIUserPoolTests: XCTestCase {

    static var userpoolUsername: String?
    static var userpoolPassword: String?
    static var sharedEmail: String?
    
    static var userPoolsAdminClient: AWSCognitoIdentityProvider!
    static var userPoolId: String!
    override class func setUp() {
        let filePath = Bundle(for: self).path(forResource: "credentials-mc", ofType: "json")
        var credentialsJson: [String : Any]? = nil
        if let aPath = NSData(contentsOfFile: filePath ?? "") {
            credentialsJson = try! JSONSerialization.jsonObject(with: aPath as Data, options: .mutableContainers) as? [String : Any]
        }
        userpoolUsername = credentialsJson?["UserpoolUsername"] as? String
        userpoolPassword = credentialsJson?["UserpoolPassword"] as? String
        userPoolId = credentialsJson?["mc-userpool_id"] as? String
        sharedEmail = credentialsJson?["mc-email"] as? String
        
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: credentialsJson?["accessKey"] as! String,
                                                               secretKey: credentialsJson?["secretKey"] as! String)
        let region = (credentialsJson?["mc-region"] as! String).aws_regionTypeValue()
        let configuration = AWSServiceConfiguration(region: region, credentialsProvider: credentialsProvider)!
        AWSCognitoIdentityProvider.register(with: configuration, forKey: "ADMINCLIENT")
        userPoolsAdminClient = AWSCognitoIdentityProvider(forKey: "ADMINCLIENT")
    }
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    /// Test successful authentication in user pool using drop-in UI
    ///
    /// - Given: An unauthenticated user session
    /// - When:
    ///    - I try to sign in using drop-in UI
    /// - Then:
    ///    - I should get a signed in session
    ///
    func testDropInUIUsernamePasswordSignIn() {
        let app = XCUIApplication()
        signOutUserpool(application: app)
        
        // Push the DropIn UI view controller
        app.buttons["DropIn UI Tests"].tap()
        XCTAssertTrue(app.navigationBars["DropIn UI Tests"].exists)
        
        // Push the User pool DropIn UI view controller
        app.buttons["Drop In User Pool Tests"].tap()
        XCTAssertTrue(app.navigationBars["DropIn UserPool"].exists)
        
        //Initiate signIn
        app.buttons["SignIn User"].tap()
        signInUserpool(application: app,
                       username: AWSDropInUIUserPoolTests.userpoolUsername!,
                       password: AWSDropInUIUserPoolTests.userpoolPassword!)
        
        // Check if successfully signed in
        let userPoolSignInStateLabelElement = app.staticTexts["userPoolSignInStateLabel"]
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", "signedIn")
        let expectation1 = expectation(for: predicate,
                                       evaluatedWith: userPoolSignInStateLabelElement,
                                       handler: nil)
        wait(for: [expectation1], timeout: 5)
        
        // Push the user detail page
        app.buttons["User pool operations"].tap()
        XCTAssertTrue(app.navigationBars["User Details"].exists)
        
        // Check if all user details are present
        inspectTokenDetails(application: app)
        inspectCredentialDetails(application: app)
    }
    
    /// Test whether after update attribute, we have valid token and credentials
    ///
    /// - Given: An auth session with user attributes
    /// - When:
    ///    - I update the user attributes and then fetch token
    /// - Then:
    ///    - I should have all the valid tokens
    ///
    func testDropInUIUpdateAttribute() {
        let app = XCUIApplication()
        signOutUserpool(application: app)
        
        // Push the DropIn UI view controller
        app.buttons["DropIn UI Tests"].tap()
        XCTAssertTrue(app.navigationBars["DropIn UI Tests"].exists)
        
        // Push the User pool DropIn UI view controller
        app.buttons["Drop In User Pool Tests"].tap()
        XCTAssertTrue(app.navigationBars["DropIn UserPool"].exists)
        
        //Initiate signIn
        app.buttons["SignIn User"].tap()
        signInUserpool(application: app,
                       username: AWSDropInUIUserPoolTests.userpoolUsername!,
                       password: AWSDropInUIUserPoolTests.userpoolPassword!)
        
        // Check if successfully signed in
        let userPoolSignInStateLabelElement = app.staticTexts["userPoolSignInStateLabel"]
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", "signedIn")
        let expectation1 = expectation(for: predicate,
                                       evaluatedWith: userPoolSignInStateLabelElement,
                                       handler: nil)
        wait(for: [expectation1], timeout: 5)
        
        // Push the user detail page
        app.buttons["User pool operations"].tap()
        XCTAssertTrue(app.navigationBars["User Details"].exists)
        
        // Check if all user details are present
        inspectTokenDetails(application: app)
        inspectCredentialDetails(application: app)
        
        // Initiate attribute update
        app.buttons["Update User Attribute"].tap()
        
        // Check again if the values are present
        inspectTokenDetails(application: app)
        inspectCredentialDetails(application: app)
    }
    
    func testPasswordRequired() {
        let username = "testUser" + UUID().uuidString
        let tempPassword = "tempPassword" + UUID().uuidString
        guard let adminCreateUserRequest = AWSCognitoIdentityProviderAdminCreateUserRequest() else {
            XCTFail("Unable to create adminCreateUserRequest")
            return
        }
        let userAttributes: [String: String]  = ["email": AWSDropInUIUserPoolTests.sharedEmail!]
        let userAttributesTransformed = userAttributes.map {AWSCognitoIdentityUserAttributeType.init(name: $0, value: $1) }
        adminCreateUserRequest.username = username
        adminCreateUserRequest.temporaryPassword = tempPassword
        adminCreateUserRequest.userAttributes = userAttributesTransformed
        adminCreateUserRequest.userPoolId = AWSDropInUIUserPoolTests.userPoolId
        AWSDropInUIUserPoolTests.userPoolsAdminClient.adminCreateUser(adminCreateUserRequest).continueWith { (task) -> Any? in
            if let error = task.error {
                XCTFail("Could not create user. Failing the test: \(error)")
            }
            return nil
        }.waitUntilFinished()
        
        let app = XCUIApplication()
        signOutUserpool(application: app)
        
        // Push the DropIn UI view controller
        app.buttons["DropIn UI Tests"].tap()
        XCTAssertTrue(app.navigationBars["DropIn UI Tests"].exists)
        
        // Push the User pool DropIn UI view controller
        app.buttons["Drop In User Pool Tests"].tap()
        XCTAssertTrue(app.navigationBars["DropIn UserPool"].exists)
        
        //Initiate signIn
        app.buttons["SignIn User"].tap()
        signInUserpool(application: app, username: username, password: tempPassword)
        
        // Check for new password required UI
        let passReqUIText = app.staticTexts["Please enter your new password below"]
        let passReqUITextExists = NSPredicate(format: "exists == 1")
        let passReqUIExpectation = expectation(for: passReqUITextExists,
                                       evaluatedWith: passReqUIText,
                                       handler: nil)
        wait(for: [passReqUIExpectation], timeout: 25)
        
        let table = app.tables.element(boundBy: 0)
        let passwordCell = table.cells.element(boundBy: 0)
        passwordCell.tap()
        passwordCell.secureTextFields.element(boundBy: 0).typeText(AWSDropInUIUserPoolTests.userpoolPassword!)
        let signInButton = app.buttons["Update Password"]
        signInButton.tap()
        
        // Check if successfully signed in
        let userPoolSignInStateLabelElement = app.staticTexts["userPoolSignInStateLabel"]
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", "signedIn")
        let expectation1 = expectation(for: predicate,
                                       evaluatedWith: userPoolSignInStateLabelElement,
                                       handler: nil)
        wait(for: [expectation1], timeout: 25)
    }
    
    /// Sign in the user
    func signInUserpool(application: XCUIApplication,
                        username: String,
                        password: String) {
        let table = application.tables.element(boundBy: 0)
        let userNameCell = table.cells.element(boundBy: 0)
        userNameCell.tap()
        userNameCell.textFields.element(boundBy: 0).typeText(username)
        
        let passwordCell = table.cells.element(boundBy: 1)
        passwordCell.secureTextFields.element(boundBy: 0).tap()
        passwordCell.secureTextFields.element(boundBy: 0).typeText(password)
    
        let signInButton = application.buttons["Sign In"]
        signInButton.tap()
    }
    
    /// Sign out the active user in the home page.
    func signOutUserpool(application: XCUIApplication) {
        let signinstatelabelElement = application.otherElements["signInStateLabel"]
        if signinstatelabelElement.label == "signedIn" {
            application.buttons["SignOut"].tap()
            let statusBarsQuery = application.statusBars
            statusBarsQuery.element.tap()
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
