//
//  AWSMobileClientInitializerTests.swift
//  AWSMobileClientInitializerTests
//

import Foundation
import XCTest

import AWSMobileClient

class AWSMobileClientInitializerTests: XCTestCase {

    func testInitWithConfiguration() {
        let initializeExpectation = expectation(description: "The AWSMobileClient initialization")
        let mobileClient = AWSMobileClient(configuration: AWSMobileClientConfig)
        mobileClient.initialize { (userState, error) in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssert(mobileClient.currentUserState != .unknown)
    }

}
