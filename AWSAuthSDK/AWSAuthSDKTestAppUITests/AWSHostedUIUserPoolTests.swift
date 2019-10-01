//
//  AWSHostedUIUserPoolTests.swift
//  AWSAuthSDKTestAppUITests
//

import XCTest

class AWSHostedUIUserPoolTests: XCTestCase {
    
    static var userpoolUsername: String?
    static var userpoolPassword: String?
    
    override class func setUp() {
        let filePath = Bundle(for: self).path(forResource: "credentials-mc", ofType: "json")
        var credentialsJson: [AnyHashable : Any]? = nil
        if let aPath = NSData(contentsOfFile: filePath ?? "") {
            credentialsJson = try! JSONSerialization.jsonObject(with: aPath as Data, options: .mutableContainers) as? [AnyHashable : Any]
        }
        userpoolUsername = credentialsJson?["UserpoolUsername"] as? String
        userpoolPassword = credentialsJson?["UserpoolPassword"] as? String
    }
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    /// Test whether after update attribute, we have valid token and credentials
    ///
    /// - Given: An auth session with user attributes
    /// - When:
    ///    - I update the user attributes and then fetch token
    /// - Then:
    ///    - I should have all the valid tokens
    ///
    func testHostedUIUpdateAttribute() {
        let app = XCUIApplication()
        signOutUserpool(application: app)
        
        // Push the hosted UI view controller
        app.buttons["Hosted UI Userpool tests"].tap()
        XCTAssertTrue(app.navigationBars["UserPool"].exists)
        
        //Initiate signIn
        app.buttons["SignIn User"].tap()
        signInUserpool(application: app)
        
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
    
    /// Test successful authentication in user pool using hosted UI
    ///
    /// - Given: An unauthenticated user session
    /// - When:
    ///    - I try to sign in using hosted UI
    /// - Then:
    ///    - I should get a signed in session
    ///
    func testHostedUIUsernamePasswordSignIn() {
        let app = XCUIApplication()
        signOutUserpool(application: app)
        
        // Push the hosted UI view controller
        app.buttons["Hosted UI Userpool tests"].tap()
        XCTAssertTrue(app.navigationBars["UserPool"].exists)
        
        //Initiate signIn
        app.buttons["SignIn User"].tap()
        signInUserpool(application: app)
        
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
    
    /// Sign in the user
    func signInUserpool(application: XCUIApplication) {
        let statusBarsQuery = application.statusBars
        if #available(iOS 11.0, *) {
            statusBarsQuery.element.tap()
        } else {
            // or use some work around
        }
        
        let webViewsQuery = application.webViews
        webViewsQuery.textFields["Username"].tap()
        webViewsQuery/*@START_MENU_TOKEN@*/.textFields["Username"]/*[[".otherElements[\"Signin\"].textFields[\"Username\"]",".textFields[\"Username\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText(AWSHostedUIUserPoolTests.userpoolUsername!)
        
        let passwordSecureTextField = webViewsQuery/*@START_MENU_TOKEN@*/.secureTextFields["Password"]/*[[".otherElements[\"Signin\"].secureTextFields[\"Password\"]",".secureTextFields[\"Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(AWSHostedUIUserPoolTests.userpoolPassword!)
        
        let signInButton = webViewsQuery/*@START_MENU_TOKEN@*/.buttons["Sign in"]/*[[".otherElements[\"Signin\"].buttons[\"Sign in\"]",".buttons[\"Sign in\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
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
