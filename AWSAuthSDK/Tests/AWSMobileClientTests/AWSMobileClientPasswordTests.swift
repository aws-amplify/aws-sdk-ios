//
//  AWSMobileClientPasswordTests.swift
//  AWSMobileClientTests
//

import XCTest

import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

/// AWSMobileClient tests related to password operation
class AWSMobileClientPasswordTests: AWSMobileClientTestBase {

    func testForgotPassword() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        let forgotPasswordExpection = expectation(description: "Expecting code to be sent for forgot password.")
        AWSMobileClient.default().forgotPassword(username: username) { (forgotPasswordResult, error) in
            XCTAssertNotNil(error, "should get error which mentions there is no verified email or phone.")
            forgotPasswordExpection.fulfill()
        }
        wait(for: [forgotPasswordExpection], timeout: AWSMobileClientTestBase.networkRequestTimeout)
    }
    
    func testForgotPasswordWithValidClientMetaData() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        let forgotPasswordExpection = expectation(description: "Expecting code to be sent for forgot password.")
        AWSMobileClient.default().forgotPassword(username: username,
                                                 clientMetaData: ["customKey":"cutomValue"]) { (forgotPasswordResult, error) in
            XCTAssertNotNil(error, "should get error which mentions there is no verified email or phone.")
            forgotPasswordExpection.fulfill()
        }
        wait(for: [forgotPasswordExpection], timeout: AWSMobileClientTestBase.networkRequestTimeout)
    }
    
    
    func testChangePassword() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let changePasswordExpectation = expectation(description: "Change password should be successful")
        AWSMobileClient.default().changePassword(currentPassword: AWSMobileClientTestBase.sharedPassword,
                                                 proposedPassword: "NewPassword123!@") { (error) in
            XCTAssertNil(error)
            changePasswordExpectation.fulfill()
        }
        wait(for: [changePasswordExpectation], timeout: AWSMobileClientTestBase.networkRequestTimeout)
    }
    
    func testChangePasswordFailCase() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let changePasswordExpectation = expectation(description: "Change password should fail")
        AWSMobileClient.default().changePassword(currentPassword: "WronPassword", proposedPassword: "NewPassword123!@") { (error) in
            XCTAssertNotNil(error)
            guard let _ = error as? AWSMobileClientError else {
                XCTFail("Error should be of type AWSMobileClientError")
                changePasswordExpectation.fulfill()
                return
            }
            changePasswordExpectation.fulfill()
        }
        wait(for: [changePasswordExpectation], timeout: AWSMobileClientTestBase.networkRequestTimeout)
    }
    
    func testPasswordResetChallenge() {
        let username = "testUser" + UUID().uuidString
        let tempPassword = "tempPassword" + UUID().uuidString
        adminCreateUser(username: username,
                        temporaryPassword: tempPassword,
                        userAttributes: ["email": AWSMobileClientTestBase.sharedEmail])
        signIn(username: username, password: tempPassword, verifySignState: .newPasswordRequired)
        confirmSign(challengeResponse: AWSMobileClientTestBase.sharedPassword)
    }

}
