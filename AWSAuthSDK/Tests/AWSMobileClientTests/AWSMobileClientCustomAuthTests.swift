//
//  AWSMobileClientCustomAuthTests.swift
//  AWSAuthSDKTestAppUITests
//

import XCTest
@testable import AWSMobileClient

class AWSMobileClientCustomAuthTests: XCTestCase {

    override func setUp() {
        AWSMobileClient.default().userPoolClient?.isCustomAuth = true
    }

    override func tearDown() {
        AWSMobileClient.default().userPoolClient?.isCustomAuth = false
    }

    func testExample() {
       
    }

}
