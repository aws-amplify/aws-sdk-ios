//
//  AWSMobileClientCredentialsTest.swift
//  AWSMobileClientTests
//

import XCTest

import AWSMobileClient
import AWSAuthCore
import AWSCognitoIdentityProvider
import AWSS3

/// AWSMobileClient tests related to AWS credentials
class AWSMobileClientCredentialsTest: AWSMobileClientBaseTests {

    func testGetAWSCredentials() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let credentialsExpectation = expectation(description: "Successfully fetch AWS Credentials")
        AWSMobileClient.sharedInstance().getAWSCredentials { (credentials, error) in
            if let credentials = credentials {
                XCTAssertNotNil(credentials.accessKey)
                XCTAssertNotNil(credentials.secretKey)
            } else if let error = error {
                XCTFail("Unexpected failure: \(error.localizedDescription)")
            }
            credentialsExpectation.fulfill()
        }
        wait(for: [credentialsExpectation], timeout: 5)
    }
    
    func testUploadPrivateFile() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let transferUtility = AWSS3TransferUtility.default()
        let verifyCredentialsExpectation = expectation(description: "Credentials should be retrieved successfully")
        AWSMobileClient.sharedInstance().getAWSCredentials { (creds, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(creds)
            verifyCredentialsExpectation.fulfill()
        }
        wait(for: [verifyCredentialsExpectation], timeout: 5)
        
        guard let identityId = AWSMobileClient.sharedInstance().identityId else {
            XCTFail("Could not find identityId to do private upload.")
            return
        }
        
        let uploadKey = "private/\(identityId)/file.txt"
        let uploadExpectation = expectation(description: "Successful file upload.")
        print("Uploading file to : \(uploadKey)")
        transferUtility.uploadData("Hello World".data(using: .utf8)!, key: uploadKey, contentType: "txt/plain", expression: nil) { (task, error) in
            XCTAssertNil(error)
            if let error = error {
                XCTFail("Upload File Failed: \(error.localizedDescription)")
            }
            uploadExpectation.fulfill()
        }
        wait(for: [uploadExpectation], timeout: 5)
    }
    
    func testDownloadPrivateFile() {
        let username = "testUser" + UUID().uuidString
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        let transferUtility = AWSS3TransferUtility.default()
        let verifyCredentialsExpectation = expectation(description: "Credentials should be retrieved successfully")
        AWSMobileClient.sharedInstance().getAWSCredentials { (creds, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(creds)
            verifyCredentialsExpectation.fulfill()
        }
        wait(for: [verifyCredentialsExpectation], timeout: 5)
        
        guard let identityId = AWSMobileClient.sharedInstance().identityId else {
            XCTFail("Could not find identityId to do private upload.")
            return
        }
        
        let uploadKey = "private/\(identityId)/file.txt"
        let uploadExpectation = expectation(description: "Successful file upload.")
        let content = "Hello World"
        print("Uploading file to : \(uploadKey)")
        
        transferUtility.uploadData(content.data(using: .utf8)!, key: uploadKey, contentType: "txt/plain", expression: nil) { (task, error) in
            XCTAssertNil(error)
            if let error = error {
                XCTFail("Upload File Failed: \(error.localizedDescription)")
            }
            uploadExpectation.fulfill()
        }
        wait(for: [uploadExpectation], timeout: 5)
        
        let downloadExpectation = expectation(description: "Successful file download.")
        transferUtility.downloadData(forKey: uploadKey, expression: nil) { (task, url, data, error) in
            XCTAssertNil(error)
            if let error = error {
                XCTFail("Upload File Failed: \(error.localizedDescription)")
            }
            XCTAssertNotNil(data)
            if let data = data {
                let dataText = String(data: data, encoding: .utf8)
                XCTAssertEqual(dataText!, content, "Expecting uploaded and downloaded contents to be same.")
            }
            downloadExpectation.fulfill()
        }
        wait(for: [downloadExpectation], timeout: 5)
        
    }

}
