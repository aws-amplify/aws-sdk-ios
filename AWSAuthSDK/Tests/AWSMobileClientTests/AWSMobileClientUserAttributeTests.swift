//
//  AWSMobileClientUserAttributeTests.swift
//  AWSMobileClientTests
//

import XCTest
import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

/// AWSMobileClient tests related to user attributes
class AWSMobileClientUserAttributeTests: AWSMobileClientTestBase {
    
    func testVerifyUserAttribute() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let verifyAttrExpectation = expectation(description: "verify attribute expectation.")
        
        AWSMobileClient.default().verifyUserAttribute(attributeName: "email") { (codeDeliveryDetails, error) in
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
        
        AWSMobileClient.default().getUserAttributes { (attributes, error) in
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
        
        AWSMobileClient.default().updateUserAttributes(attributeMap: newUserAttributes) { result, error in
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
        AWSMobileClient.default().getUserAttributes { attributes, error in
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
    
    
    
    
    /// Test to verify that tokens are valid after an update attritbue
    /// Note: This test relies on the configuration of the test UserPools to have two mutable custom attributes:
    /// custom:mutableStringAttr1;
    ///
    /// - Given: An authenticated user session
    /// - When:
    ///    - I update user attritbutes
    /// - Then:
    ///    - Get token on the same user session should have valid values
    ///
    func testTokenAfterUpdateAttributes() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        let updateUserAttributesResultHandlerInvoked = expectation(description: "updateUserAttributes result handler should be invoked")
        let newUserAttributes = ["custom:mutableStringAttr1": "new value for previously set attribute"]
        
        AWSMobileClient.default().updateUserAttributes(attributeMap: newUserAttributes) { result, error in
            defer {
                updateUserAttributesResultHandlerInvoked.fulfill()
            }
            guard error == nil else {
                XCTFail("Received un-expected error: \(error.debugDescription)")
                return
            }
            guard let result = result else {
                XCTFail("updateUserAttributes result unexpectedtly nil")
                return
            }
            XCTAssertEqual(result.count, 0)
        }
        wait(for: [updateUserAttributesResultHandlerInvoked], timeout: 5)
        
        let getTokenExpectation = expectation(description: "Get token result handler should be invoked")
        AWSMobileClient.default().getTokens { (token, error) in
            defer {
                getTokenExpectation.fulfill()
            }
            guard error == nil else {
                XCTFail("Received un-expected error: \(error.debugDescription)")
                return
            }
            XCTAssertNotNil(token!.accessToken, "Access token should not be nil for a signed in user")
            XCTAssertNotNil(token!.idToken, "Id token should not be nil for a signed in user")
            XCTAssertNotNil(token!.expiration, "Expiration date should not be nil for a signed in user")
        }
        wait(for: [getTokenExpectation], timeout: 10)
    }

}
