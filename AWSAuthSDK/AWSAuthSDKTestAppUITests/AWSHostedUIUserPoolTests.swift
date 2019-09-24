//
//  AWSHostedUIUserPoolTests.swift
//  AWSAuthSDKTestAppUITests
//
//  Created by Roy, Jithin on 9/23/19.
//  Copyright © 2019 Amazon Web Services. All rights reserved.
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

    func testHostedUIUsernamePasswordSignIn() {
        let app = XCUIApplication()
        let signinstatelabelElement = app.otherElements["signInStateLabel"]
        
        if signinstatelabelElement.label == "signedIn" {
            app.buttons["SignOut"].tap()
            let statusBarsQuery = app.statusBars
            statusBarsQuery.element.tap()
            let predicate = NSPredicate(format: "label CONTAINS[c] %@", "signedOut")
            let expectation1 = expectation(for: predicate, evaluatedWith: signinstatelabelElement,
                                           handler: nil)
            
            let _ = XCTWaiter().wait(for: [expectation1], timeout: 5)
        }
        XCTAssertEqual("signedOut", signinstatelabelElement.label)
        
        app.buttons["Hosted UI Userpool tests"].tap()
        XCTAssertTrue(app.navigationBars["UserPool"].exists)
        
        app.buttons["SignIn User"].tap()
        let statusBarsQuery = app.statusBars
        if #available(iOS 11.0, *) {
            statusBarsQuery.element.tap()
        } else {
            // or use some work around
        }
        
        let webViewsQuery = app.webViews
        webViewsQuery/*@START_MENU_TOKEN@*/.textFields["Username"]/*[[".otherElements[\"Signin\"].textFields[\"Username\"]",".textFields[\"Username\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        webViewsQuery/*@START_MENU_TOKEN@*/.textFields["Username"]/*[[".otherElements[\"Signin\"].textFields[\"Username\"]",".textFields[\"Username\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.typeText(AWSHostedUIUserPoolTests.userpoolUsername!)

        let passwordSecureTextField = webViewsQuery/*@START_MENU_TOKEN@*/.secureTextFields["Password"]/*[[".otherElements[\"Signin\"].secureTextFields[\"Password\"]",".secureTextFields[\"Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(AWSHostedUIUserPoolTests.userpoolPassword!)

        let signInButton = webViewsQuery/*@START_MENU_TOKEN@*/.buttons["Sign in"]/*[[".otherElements[\"Signin\"].buttons[\"Sign in\"]",".buttons[\"Sign in\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        signInButton.tap()
        
        let userPoolSignInStateLabelElement = XCUIApplication().otherElements["userPoolSignInStateLabel"]
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", "signedIn")
        let expectation1 = expectation(for: predicate,
                                       evaluatedWith: userPoolSignInStateLabelElement,
                                       handler: nil)
        
        let _ = XCTWaiter().wait(for: [expectation1], timeout: 5)
        
        app.buttons["User pool operations"].tap()
        XCTAssertTrue(app.navigationBars["User Details"].exists)
        
        let idTokenLabelElement = XCUIApplication().otherElements["idTokenLabel"]
        let idTokenPredicate = NSPredicate(format: "label CONTAINS[c] %@", "signedIn")
        let idTokenExpectation = expectation(for: idTokenPredicate,
                                       evaluatedWith: idTokenLabelElement,
                                       handler: nil)
        
        let _ = XCTWaiter().wait(for: [idTokenExpectation], timeout: 5)
        
    }

}
