//
//  NameSpaceBaseTests.swift
//  AWSMobileClientUnitTestWithApp

import Foundation
import XCTest

@testable import AWSMobileClient

class NameSpaceBaseTests: XCTestCase {
    
    var keychain: AWSUICKeyChainStore!
    
    override func setUp() {
        let serviceName = "\(String(describing: Bundle.main.bundleIdentifier)).AWSMobileClient"
        keychain =  AWSUICKeyChainStore.init(service: serviceName)
        keychain.removeAllItems()
    }
    
    func initializedAndUserstateSignedOut(_ configuration: [String: Any] ) {
        let initializeExpectation = expectation(description: "AWSMobileClient initialization")
        let mobileClient = AWSMobileClient(configuration: configuration)
        mobileClient.initialize { (userState, error) in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssertEqual(mobileClient.currentUserState, .signedOut)
        XCTAssertEqual(mobileClient.federationProvider, .none)
    }
    
    func initializedAndUserstateUserPoolSignIn(_ configuration: [String: Any] ) {
        let initializeExpectation = expectation(description: "AWSMobileClient initialization")
        let mobileClient = AWSMobileClient(configuration: configuration)
        mobileClient.initialize { (userState, error) in
            XCTAssertNil(error)
            initializeExpectation.fulfill()
        }
        wait(for: [initializeExpectation], timeout: 5)
        XCTAssertEqual(mobileClient.currentUserState, .signedIn)
        XCTAssertEqual(mobileClient.federationProvider, .userPools)
    }
    
    func createConfiguration(userPoolID: String? = nil,
                             appClientID: String? = nil,
                             identityPoolID: String? = nil) ->  [String: Any]  {
        
        var configuration = [
            "IdentityManager": [
                "Default": [:]
            ]
        ]
        if let userPoolID = userPoolID,
           let appClientID = appClientID {
            configuration["CognitoUserPool"] = [
                "Default": [
                    "PoolId": userPoolID,
                    "AppClientId": appClientID,
                    "Region": "us-east-1"
                ]]
        }
        if let identityPoolID = identityPoolID {
            configuration["CredentialsProvider"] = [
                "CognitoIdentity": [
                    "Default": [
                        "PoolId": identityPoolID,
                        "Region": "us-east-1"
                    ]
                ]
            ]
        }
        
        return configuration
        
    }
    
    func mockUserPoolSignedInUser() throws {
        let data = try Data.init(base64Encoded: JSONEncoder().encode(["test": "data"]).base64EncodedData())
        self.keychain.setData(data, forKey: "loginsMap")
        self.keychain.setString("userPools", forKey: "federationProvider")
    }
    
    func mockPreviousInstall(userPoolID: String = "",
                             appClientID: String = "",
                             identityPoolID: String = "") {
        let configValue = "\(userPoolID)#\(appClientID)#\(identityPoolID)"
        self.keychain.setString(configValue, forKey: AWSMobileClientConstants.ConfigurationKey)
    }
}

