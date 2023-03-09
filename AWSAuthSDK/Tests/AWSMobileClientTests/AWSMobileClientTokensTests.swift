//
//  AWSMobileClientTokensTests.swift
//  AWSMobileClientTests
//

import XCTest

import AWSMobileClient

/// AWSMobileClient tests related to AWS Cognito User Pool Tokens
class AWSMobileClientTokensTests: AWSMobileClientTestBase {

    func testGetTokens() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let tokensExpectation = expectation(description: "Successfully fetch AWS Cognito Tokens")
        AWSMobileClient.default().getTokens { (tokens, error) in
            if let tokens = tokens {
                XCTAssertNotNil(tokens.accessToken)
                XCTAssertNotNil(tokens.idToken)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            tokensExpectation.fulfill()
        }
        wait(for: [tokensExpectation], timeout: 2)
    }

    func testMultipleGetTokens() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let tokensExpectation = expectation(description: "Successfully fetch AWS Cognito Tokens")
        tokensExpectation.expectedFulfillmentCount = 50
        for _ in 1...tokensExpectation.expectedFulfillmentCount {
            AWSMobileClient.default().getTokens { (tokens, error) in
                if let tokens = tokens {
                    XCTAssertNotNil(tokens.accessToken)
                    XCTAssertNotNil(tokens.idToken)
                } else if let error = error {
                    XCTFail("Unexpected failure: \(error.localizedDescription)")
                }
                tokensExpectation.fulfill()
            }
        }
        wait(for: [tokensExpectation], timeout: 2)
    }
}
