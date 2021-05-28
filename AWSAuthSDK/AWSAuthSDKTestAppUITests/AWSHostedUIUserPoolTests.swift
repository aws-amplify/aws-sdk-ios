//
//  AWSHostedUIUserPoolTests.swift
//  AWSAuthSDKTestAppUITests
//

import XCTest
import AWSTestResources
import AWSAuthCore
import AWSCognitoIdentityProvider

class AWSHostedUIUserPoolTests: AWSAuthSDKUITestBase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    /// Test successful authentication in user pool using hosted UI
    ///
    /// - Given: A verified user
    /// - When:
    ///    - I try to sign in using hosted UI
    /// - Then:
    ///    - I should get a signed in session
    ///
    func testHostedUISignIn() {
        let username = "testUser" + UUID().uuidString
        let app = XCUIApplication()
        signInAndVerify(username: username, app: app)
    }

    /// Test successful re-authentication in user pool using hosted UI
    ///
    /// - Given: A signed In user
    /// - When:
    ///    - I try invalidate the refresh token and sign In again
    /// - Then:
    ///    - I should get a signed in session
    ///
    func testHostedUISignInAfterRefreshTokenInvalid() {
        let username = "testUser" + UUID().uuidString
        let app = XCUIApplication()
        signInAndVerify(username: username, app: app)
        
        app.buttons["invalidateRefreshToken"].tap()
        
        // Push the user detail page to trigger refresh token invalidate event.
        app.buttons["User pool operations"].tap()
        
        // Check if session expired
        let userPoolSignInStateLabelElement = app.staticTexts["userPoolSignInStateLabel"]
        let sessionExpiredPredicate = NSPredicate(format: "label CONTAINS[c] %@", "signedOutUserPoolsTokenInvalid")
        let sessionExpiredExpectation = expectation(for: sessionExpiredPredicate,
                                                    evaluatedWith: userPoolSignInStateLabelElement,
                                                    handler: nil)
        wait(for: [sessionExpiredExpectation], timeout: 5)
        XCTAssertTrue(app.navigationBars["UserPool"].exists)
        
        //Initiate signIn
        app.buttons["SignIn User"].tap()
        signInUserpoolWhenRefreshTokenExpires(application: app, username: username)
    }

    /// Test successful authentication in user pool using hosted UI and get user attributes
    ///
    /// - Given: An unauthenticated user session
    /// - When:
    ///    - I try to sign in using hosted UI
    /// - Then:
    ///    - I should get a signed in session
    ///    - I should get my user attributes
    ///
    func testHostedUIGetAttributes() {
        let username = "testUser" + UUID().uuidString
        let app = XCUIApplication()
        signInAndVerify(username: username, app: app)
        
        // Push the user detail page
        app.buttons["User pool operations"].tap()
        XCTAssertTrue(app.navigationBars["User Details"].exists)
        
        // Check if all user details are present
        inspectTokenDetails(application: app)
        inspectCredentialDetails(application: app)
    }

    /// Test successful refresh access token and get user attributes
    ///
    /// - Given: Invalidate the access token of an user after signing in
    /// - When:
    ///    - I try to get user attributes after access token is invalidated
    /// - Then:
    ///    - I should successfully get user attributes
    ///
    func testHostedUIGetAttributesWhenAccessTokenInvalidated() {
        let username = "testUser" + UUID().uuidString
        let app = XCUIApplication()
        signInAndVerify(username: username, app: app)

        app.buttons["invalidateAccessToken"].tap()

        // Push the user detail page
        app.buttons["User pool operations"].tap()
        XCTAssertTrue(app.navigationBars["User Details"].exists)
        
        // Check if all user details are present
        inspectTokenDetails(application: app)
        inspectCredentialDetails(application: app)
    }

    /// Test successful re-authentication in user pool with hosted UI when refresh token expires and get user attributes
    ///
    /// - Given: Invalidate the refresh token of an user after signing in
    /// - When:
    ///    - I try to get user attributes after refresh token is invalidated
    /// - Then:
    ///    - I should re-authenticate with hostedUI and successfully get user attributes
    ///
    func testHostedUIGetAttributesWhenRefreshTokenInvalidated() {
        let username = "testUser" + UUID().uuidString
        let app = XCUIApplication()
        signInAndVerify(username: username, app: app)

        app.buttons["invalidateRefreshToken"].tap()

        // Push the user detail page to trigger refresh token invalidate event.
        app.buttons["User pool operations"].tap()
        
        // Check if session expired
        let userPoolSignInStateLabelElement = app.staticTexts["userPoolSignInStateLabel"]
        let sessionExpiredPredicate = NSPredicate(format: "label CONTAINS[c] %@", "signedOutUserPoolsTokenInvalid")
        let sessionExpiredExpectation = expectation(for: sessionExpiredPredicate,
                                                    evaluatedWith: userPoolSignInStateLabelElement,
                                                    handler: nil)
        wait(for: [sessionExpiredExpectation], timeout: 5)
        XCTAssertTrue(app.navigationBars["UserPool"].exists)
        
        //Initiate signIn
        app.buttons["SignIn User"].tap()
        signInUserpoolWhenRefreshTokenExpires(application: app, username: username)
        
        // Push the user detail page
        app.buttons["User pool operations"].tap()
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
    func testHostedUIUpdateAttribute() {
        let username = "testUser" + UUID().uuidString
        let app = XCUIApplication()
        signInAndVerify(username: username, app: app)
        
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
    
    private func signInAndVerify(username: String, app: XCUIApplication) {
        signOutUserpool(application: app)
        
        signUpAndVerifyUser(username: username)
        
        // Push the hosted UI view controller
        app.buttons["Hosted UI Userpool tests"].tap()
        XCTAssertTrue(app.navigationBars["UserPool"].exists)
        
        //Initiate signIn
        app.buttons["SignIn User"].tap()
        signInUserpool(application: app, username: username)
        
        // Check if successfully signed in
        let userPoolSignInStateLabelElement = app.staticTexts["userPoolSignInStateLabel"]
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", "signedIn")
        let expectation1 = expectation(for: predicate,
                                       evaluatedWith: userPoolSignInStateLabelElement,
                                       handler: nil)
        wait(for: [expectation1], timeout: 5)
    }
}
