//
//  AWSAuthSDKTestAppUITests.swift
//  AWSAuthSDKTestAppUITests
//

import XCTest

class AWSAuthSDKTestAppUITests: XCTestCase {
    
    static var FacebookUsername: String?
    static var FacebookPassword: String?
    static var GoogleUsername: String?
    static var GooglePassword: String?
    static var UserpoolUsername: String?
    static var UserpoolPassword: String?
    
    override class func setUp() {
        let filePath = Bundle(for: self).path(forResource: "credentials-mc", ofType: "json")
        var credentialsJson: [AnyHashable : Any]? = nil
        if let aPath = NSData(contentsOfFile: filePath ?? "") {
            credentialsJson = try! JSONSerialization.jsonObject(with: aPath as Data, options: .mutableContainers) as? [AnyHashable : Any]
        }
        
        FacebookUsername = credentialsJson?["FacebookUsername"] as? String
        FacebookPassword = credentialsJson?["FacebookPassword"] as? String
        GoogleUsername = credentialsJson?["GoogleUsername"] as? String
        GooglePassword = credentialsJson?["GooglePassword"] as? String
        UserpoolUsername = credentialsJson?["UserpoolUsername"] as? String
        UserpoolPassword = credentialsJson?["UserpoolPassword"] as? String
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testGoogleSignInHostedUI() {
        
        let app = XCUIApplication()
        
        let signinstatelabelElement = XCUIApplication().otherElements["signInStateLabel"]
        
        print(signinstatelabelElement.label)
        
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
        
        app.buttons["Launch CognitoAuth SignIn Google"].tap()
        
        let statusBarsQuery = app.statusBars
        if #available(iOS 11.0, *) {
            statusBarsQuery.element.tap()
        } else {
            // or use some work around
        }
        
        // set up an expectation predicate to test whether elements exist
        let exists = NSPredicate(format: "exists == true")
        
        let emailOrPhoneTextField = app.webViews.textFields["Email or phone"]
        let continueButtonExpectation = expectation(for: exists, evaluatedWith: emailOrPhoneTextField, handler: nil)
        let buttonWaiter = XCTWaiter().wait(for: [continueButtonExpectation], timeout: 5)
        
        // Google user not logged in
        if buttonWaiter == .completed {
            // found the email or phone button; likely a new login
            // We will try to enter email and password here to log the user in.
            let webViewsQuery = app.webViews
            webViewsQuery.textFields["Email or phone"].tap()
            webViewsQuery.textFields["Email or phone"].clearText()
            webViewsQuery.textFields["Email or phone"].typeText(AWSAuthSDKTestAppUITests.GoogleUsername!)
            
            let nextButton = webViewsQuery/*@START_MENU_TOKEN@*/.buttons["Next"]/*[[".otherElements[\"Sign in - Google Accounts\"].buttons[\"Next\"]",".buttons[\"Next\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            nextButton.tap()
            
            webViewsQuery.secureTextFields["Enter your password"].tap()
            webViewsQuery.secureTextFields["Enter your password"].typeText(AWSAuthSDKTestAppUITests.GooglePassword!)
            nextButton.tap()
        } else if buttonWaiter == .timedOut {
            // Google sign in was already done, should have the status label as signedIn
            // We will verify that next
        }
        
        
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", "signedIn")
        let expectation1 = expectation(for: predicate, evaluatedWith: signinstatelabelElement,
                                       handler: nil)
        
        let _ = XCTWaiter().wait(for: [expectation1], timeout: 5)
        
        print(signinstatelabelElement.label)
        
        app.buttons["SignOut"].tap()
        
        statusBarsQuery.element.tap()
        let predicate1 = NSPredicate(format: "label CONTAINS[c] %@", "signedOut")
        let expectation2 = expectation(for: predicate1, evaluatedWith: signinstatelabelElement,
                                       handler: nil)
        
        let _ = XCTWaiter().wait(for: [expectation2], timeout: 5)
        
        print(signinstatelabelElement.label)
    }
    
    func testFacebookSignInHostedUI() {
        let app = XCUIApplication()
        
        let signinstatelabelElement = app.staticTexts["signInStateLabel"]
        
        print(signinstatelabelElement.label)
        
        //declaring here for reuse below
        let predicateLabelContainsSignedOut = NSPredicate(format: "label CONTAINS[c] %@", "signedOut")
        let labelContainsSignedOut = expectation(for: predicateLabelContainsSignedOut, evaluatedWith: signinstatelabelElement)
        
        let predicateLabelContainsSignedIn = NSPredicate(format: "label CONTAINS[c] %@", "signedIn")
        let labelContainsSignedIn = expectation(for: predicateLabelContainsSignedIn, evaluatedWith: signinstatelabelElement)
        
        if signinstatelabelElement.label == "signedIn" {
            
            app.buttons["SignOut"].tap()
            
            //in order to continue with alert properly have to call addUIInterruptionMonitor and then tap Continue.
            addUIInterruptionMonitor(withDescription: "Continue Alert") { (alert) -> Bool in
                alert.buttons["Continue"].tap()
                return true
            }
            
            app.tap()
            
            _ = XCTWaiter().wait(for: [labelContainsSignedOut], timeout: 15)
            
        }
        
        app.buttons["Launch CognitoAuth SignIn Facebook"].tap()
        
        addUIInterruptionMonitor(withDescription: "Continue Alert") { (alert) -> Bool in
            alert.buttons["Continue"].tap()
            return true
        }
        
        app.tap()
        
        // set up an expectation predicate to test whether elements exist
        let continueBtnExists = NSPredicate(format: "exists == true")
        
        // wait for the "Confirm" title at the top of facebook's sign in screen
        let continueButton = app.webViews.buttons["Continue"]
        let continueButtonExpectation = expectation(for: continueBtnExists, evaluatedWith: continueButton, handler: nil)
        let buttonWaiter = XCTWaiter().wait(for: [continueButtonExpectation], timeout: 5)
        
        // Facebook user already logged in
        if buttonWaiter == .completed {
            app.webViews.buttons["Continue"].tap()
        } else if buttonWaiter == .timedOut {
            // could not find the continue button, likely a new login if iOS 11+, for iOS < 11, it means user already signed in to Facebook
            if signinstatelabelElement.label == "signedIn" {
                // break outside of else if
            } else {
                // We will try to enter email and password here to log the user in.
                let webViewsQuery = app.webViews
                
                webViewsQuery.textFields["Mobile Number or Email"].tap()
                webViewsQuery.textFields["Mobile Number or Email"].clearText()
                webViewsQuery.textFields["Mobile Number or Email"].typeText(AWSAuthSDKTestAppUITests.FacebookUsername!)
                
                webViewsQuery.secureTextFields["Facebook Password"].tap()
                webViewsQuery.secureTextFields["Facebook Password"].typeText(AWSAuthSDKTestAppUITests.FacebookPassword!)
                
                webViewsQuery/*@START_MENU_TOKEN@*/.buttons["Log In"]/*[[".otherElements[\"Log into Facebook | Facebook\"]",".otherElements[\"main\"].buttons[\"Log In\"]",".buttons[\"Log In\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
                
                let continueButton = app.webViews.buttons["Continue"]
                
                let continueButtonExpectation = expectation(for: continueBtnExists, evaluatedWith: continueButton)
                
                let buttonWaiter = XCTWaiter().wait(for: [continueButtonExpectation], timeout: 10)
                
                if buttonWaiter == .completed {
                    
                    app.webViews.buttons["Continue"].tap()
                    
                } else if buttonWaiter == .timedOut {
                    
                    XCTFail("Could not finish Facebook login.")
                    return
                }
            }
        }
        
        _ = XCTWaiter().wait(for: [labelContainsSignedIn], timeout: 5)
        
        print(signinstatelabelElement.label)
        
        app.buttons["SignOut"].tap()
        
        addUIInterruptionMonitor(withDescription: "Continue Alert") { (alert) -> Bool in
            alert.buttons["Continue"].tap()
            return true
        }
        
        app.tap()
        
        _ = XCTWaiter().wait(for: [labelContainsSignedOut], timeout: 5)
        
        print(signinstatelabelElement.label)
        
    }

}

extension XCUIElement {
    
    func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }
        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        
        deleteString += XCUIKeyboardKey.delete.rawValue
        deleteString += XCUIKeyboardKey.delete.rawValue
        deleteString += XCUIKeyboardKey.delete.rawValue
        
        self.typeText(deleteString)
    }
}

