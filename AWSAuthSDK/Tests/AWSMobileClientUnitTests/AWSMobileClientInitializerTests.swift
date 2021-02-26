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
    
    func testInitWithBothCognitoServiceConfigPreLoaded() {
        let initializeExpectation = expectation(description: "The AWSMobileClient initialization")
        
        let userPoolConfig = AWSServiceConfiguration(region: .USEast2, credentialsProvider: nil)
        let anonymousCredentialProvider = AWSAnonymousCredentialsProvider()
        let idpConfig = AWSServiceConfiguration(region: .USEast2, credentialsProvider: anonymousCredentialProvider)
        AWSMobileClient.updateCognitoService(userPoolConfiguration: userPoolConfig,
                                             identityPoolConfiguration: idpConfig)
        
        let mobileClient = AWSMobileClient(configuration: AWSMobileClientConfig)
        mobileClient.initialize { (userState, error) in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssert(mobileClient.currentUserState != .unknown)
    }
    
    func testInitWithUserPoolConfigPreLoaded() {
        let initializeExpectation = expectation(description: "The AWSMobileClient initialization")
        
        let config = AWSServiceConfiguration(region: .USEast2, credentialsProvider: nil)
        
        AWSMobileClient.updateCognitoService(userPoolConfiguration: config,
                                             identityPoolConfiguration: nil)
        
        let mobileClient = AWSMobileClient(configuration: AWSMobileClientConfig)
        mobileClient.initialize { (userState, error) in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssert(mobileClient.currentUserState != .unknown)
    }
    
    func testInitWithIdentityPoolConfigPreLoaded() {
        let initializeExpectation = expectation(description: "The AWSMobileClient initialization")
        
        let anonymousCredentialProvider = AWSAnonymousCredentialsProvider()
        let idpConfig = AWSServiceConfiguration(region: .USEast2, credentialsProvider: anonymousCredentialProvider)
        
        AWSMobileClient.updateCognitoService(userPoolConfiguration: nil,
                                             identityPoolConfiguration: idpConfig)
        
        let mobileClient = AWSMobileClient(configuration: AWSMobileClientConfig)
        mobileClient.initialize { (userState, error) in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssert(mobileClient.currentUserState != .unknown)
    }
    
    func testInitWithBothCognitoServiceConfigNil() {
        let initializeExpectation = expectation(description: "The AWSMobileClient initialization")
        AWSMobileClient.updateCognitoService(userPoolConfiguration: nil,
                                             identityPoolConfiguration: nil)
        
        let mobileClient = AWSMobileClient(configuration: AWSMobileClientConfig)
        mobileClient.initialize { (userState, error) in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssert(mobileClient.currentUserState != .unknown)
    }
    
}
