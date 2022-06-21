//
//  AWSMobileClientIdentityIdTests.swift
//  AWSMobileClientTests
//

import XCTest

import AWSMobileClient

/// AWSMobileClient tests related to AWS identity ID
class AWSMobileClientIdentityIdTests: AWSMobileClientTestBase {

    func testGetIdentityId() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let identityIDExpectation = expectation(description: "Successfully fetch identity ID")
        AWSMobileClient.default().getIdentityId().continueWith { task in
            if let identityID = task.result {
                XCTAssertNotNil(identityID)
            } else if let error = task.error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            identityIDExpectation.fulfill()
            return nil
        }
        wait(for: [identityIDExpectation], timeout: 10)
    }

    func testConcurrentGetIdentityId() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let identityIDExpectation = expectation(description: "Successfully fetch identity ID")
        identityIDExpectation.expectedFulfillmentCount = 10
        for _ in 1...10 {
            DispatchQueue.global().async {
                AWSMobileClient.default().getIdentityId().continueWith(block: { task in
                    if let identityID = task.result {
                        XCTAssertNotNil(identityID)
                    } else if let error = task.error {
                        XCTFail("Unexpected failure: \(error.localizedDescription)")
                    }
                    identityIDExpectation.fulfill()
                    return nil
                })
            }
        }


        wait(for: [identityIDExpectation], timeout: 20)
    }
}
