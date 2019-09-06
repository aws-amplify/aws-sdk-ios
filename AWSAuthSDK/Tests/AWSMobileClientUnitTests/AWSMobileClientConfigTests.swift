//
//  AWSMobileClientConfigTests.swift
//  AWSMobileClientConfigTests
//

import Foundation
import XCTest

import AWSCore
@testable import AWSMobileClient

class AWSMobileClientConfigTests: XCTestCase {

    func testInMemoryConfiguration() {
        let initializeExpectation = expectation(description: "The AWSMobileClient initialization")
        let mobileClient = AWSMobileClient(configuration: AWSMobileClientConfig)
        mobileClient.initialize { (userState, error) in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssert((mobileClient.awsInfo.rootInfoDictionary as NSDictionary).isEqual(to: AWSMobileClientConfig))
    }

    func testSharedInstanceReference() {
        XCTAssertEqual(AWSMobileClient.sharedInstance(), AWSMobileClient.default())
    }

}
