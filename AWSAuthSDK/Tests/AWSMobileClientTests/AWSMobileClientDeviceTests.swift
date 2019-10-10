//
//  AWSMobileClientDeviceTests.swift
//  AWSMobileClientTests
//

import XCTest

import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider

/// AWSMobileClient tests related to device operation
class AWSMobileClientDeviceTests: AWSMobileClientTestBase {

    func testRememberDevice() {
        let username = "testRememberDeviceUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        let initialRememberDeviceExpectation = expectation(description: "initial remember device expectation.")
        
        AWSMobileClient.default().deviceOperations.updateStatus(remembered: true) { (result, error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            initialRememberDeviceExpectation.fulfill()
        }
        
        wait(for: [initialRememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation = expectation(description: "list devices expectation.")
        
        AWSMobileClient.default().deviceOperations.list(limit: 60) { (result, error) in
            defer {
                listDevicesExpectation.fulfill()
            }
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                return
            }
            
            XCTAssertEqual(result?.devices?.count,
                           1,
                           "Expecting current device to be remembered, get count 1. Service Response: \(String(describing:result?.devices?.count))")
        }
        
        wait(for: [listDevicesExpectation], timeout: 5)
    }
    
    func testDeviceOperations() {
        let username = "testRememberDeviceUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        
        let initialRememberDeviceExpectation = expectation(description: "initial remember device expectation.")
        
        AWSMobileClient.default().deviceOperations.updateStatus(remembered: true) { (result, error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            initialRememberDeviceExpectation.fulfill()
        }
        
        wait(for: [initialRememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation = expectation(description: "list devices expectation.")
        
        AWSMobileClient.default().deviceOperations.list(limit: 60) { (result, error) in
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                listDevicesExpectation.fulfill()
                return
            }
            XCTAssertTrue(result?.devices?.count == 1, "Expecting current device to be remembered, get count 1. Service Response: \(result!.devices!.count)")
            listDevicesExpectation.fulfill()
        }
        
        wait(for: [listDevicesExpectation], timeout: 5)
        
        let getDeviceExpectation = expectation(description: "get device expectation.")
        
        AWSMobileClient.default().deviceOperations.get { (device, error) in
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                getDeviceExpectation.fulfill()
                return
            }
            
            XCTAssertTrue(device!.createDate! < Date(), "Device create date should be before now.")
            print("Device create date: \(device!.createDate!)")
            getDeviceExpectation.fulfill()
        }
        
        wait(for: [getDeviceExpectation], timeout: 5)
        
        let notRememberDeviceExpectation = expectation(description: "forget device expectation.")
        
        AWSMobileClient.default().deviceOperations.updateStatus(remembered: false) { (result, error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            notRememberDeviceExpectation.fulfill()
        }
        
        wait(for: [notRememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation2 = expectation(description: "list devices expectation2.")
        
        AWSMobileClient.default().deviceOperations.list(limit: 60) { (result, error) in
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                listDevicesExpectation2.fulfill()
                return
            }
            XCTAssertTrue(result?.devices?.count == 0, "Expecting current device to be NOT remembered, get count 0. Service Response: \(result!.devices!.count)")
            listDevicesExpectation2.fulfill()
        }
        
        wait(for: [listDevicesExpectation2], timeout: 5)
        
        let rememberDeviceExpectation = expectation(description: "remember device expectation.")
        
        AWSMobileClient.default().deviceOperations.updateStatus(remembered: true) { (result, error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            rememberDeviceExpectation.fulfill()
            
        }
        
        wait(for: [rememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation3 = expectation(description: "list devices expectation3.")
        
        AWSMobileClient.default().deviceOperations.list(limit: 60) { (result, error) in
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                listDevicesExpectation3.fulfill()
                return
            }
            XCTAssertTrue(result?.devices?.count == 1, "Expecting current device to be remembered, get count 1. Service Response: \(result!.devices!.count)")
            listDevicesExpectation3.fulfill()
        }
        
        wait(for: [listDevicesExpectation3], timeout: 5)
    }
    
    func testDeviceOperationsFailCase() {
        let username = "testRememberDeviceUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        
        
        let initialRememberDeviceExpectation = expectation(description: "initial remember device expectation.")
        
        AWSMobileClient.default().deviceOperations.updateStatus(remembered: true) { (result, error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            initialRememberDeviceExpectation.fulfill()
        }
        
        wait(for: [initialRememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation = expectation(description: "list devices expectation.")
        
        AWSMobileClient.default().deviceOperations.list(limit: 60) { (result, error) in
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                listDevicesExpectation.fulfill()
                return
            }
            XCTAssertTrue(result?.devices?.count == 1, "Expecting current device to be remembered, get count 1. Service Response: \(result!.devices!.count)")
            listDevicesExpectation.fulfill()
        }
        
        wait(for: [listDevicesExpectation], timeout: 5)
        
        let getDeviceExpectation = expectation(description: "get device expectation.")
        
        AWSMobileClient.default().deviceOperations.get { (device, error) in
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                getDeviceExpectation.fulfill()
                return
            }
            
            XCTAssertTrue(device!.createDate! < Date(), "Device create date should be before now.")
            print("Device create date: \(device!.createDate!)")
            getDeviceExpectation.fulfill()
        }
        
        wait(for: [getDeviceExpectation], timeout: 5)
        
        let notRememberDeviceExpectation = expectation(description: "forget device expectation.")
        
        AWSMobileClient.default().deviceOperations.forget({ (error) in
            if error != nil {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
            }
            notRememberDeviceExpectation.fulfill()
        })
        
        wait(for: [notRememberDeviceExpectation], timeout: 5)
        
        let listDevicesExpectation2 = expectation(description: "list devices expectation2.")
        
        AWSMobileClient.default().deviceOperations.list(limit: 60) { (result, error) in
            
            guard error == nil else {
                XCTFail("Received un-expected error: \(error!.localizedDescription)")
                listDevicesExpectation2.fulfill()
                return
            }
            XCTAssertTrue(result?.devices?.count == 0, "Expecting current device to be NOT remembered, get count 0. Service Response: \(result!.devices!.count)")
            listDevicesExpectation2.fulfill()
        }
        
        wait(for: [listDevicesExpectation2], timeout: 5)
        
        let rememberDeviceExpectation = expectation(description: "remember device expectation.")
        
        AWSMobileClient.default().deviceOperations.updateStatus(remembered: true) { (result, error) in
            XCTAssertNotNil(error, "Expecting error but didn't get one.")
            if let mobileError = error as? AWSMobileClientError {
                
                switch(mobileError) {
                case .deviceNotRemembered(message: _):
                    break
                default:
                    XCTFail("Error should be of type device not remembered.")
                }
            }
            rememberDeviceExpectation.fulfill()
        }
        wait(for: [rememberDeviceExpectation], timeout: 5)
    }

}
