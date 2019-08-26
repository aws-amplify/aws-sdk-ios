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
    
    /// Test that upload to s3 fails for a signedOut user
    ///
    /// - Given: An unauthenticated session
    /// - When:
    ///    - I try to upload a file to S3
    /// - Then:
    ///    - I should get an error
    ///
    func testUploadFileWithSignOutUser() {

        let transferUtility = AWSS3TransferUtility.default()
        let verifyCredentialsExpectation = expectation(description: "Credentials should be retrieved successfully")
        AWSMobileClient.sharedInstance().getAWSCredentials { (creds, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(creds)
            verifyCredentialsExpectation.fulfill()
        }
        wait(for: [verifyCredentialsExpectation], timeout: 5)
        
        XCTAssertFalse(AWSMobileClient.sharedInstance().isSignedIn, "User should be in signOut state")
        let uploadKey = "private/file.txt"
        let uploadExpectation = expectation(description: "Successful file upload.")
        let content = "Hello World"
        print("Uploading file to : \(uploadKey)")
        
        transferUtility.uploadData(content.data(using: .utf8)!, key: uploadKey, contentType: "txt/plain", expression: nil) { (task, error) in
            XCTAssertNotNil(error)
            uploadExpectation.fulfill()
        }
        wait(for: [uploadExpectation], timeout: 5)
    }
    
    /// Test that S3 upload works if we call it inside the user state listener
    ///
    /// - Given: An unauthenticated session
    /// - When:
    ///    - I invoke signIn
    ///    - I invoke upload to s3 inside the user state listener for signedIn case
    /// - Then:
    ///    - I should be able to upload to S3 without any error
    ///
    func testUploadFileInUserStateListener() {
        let username = "testUser" + UUID().uuidString
        let transferUtility = AWSS3TransferUtility.default()
        let uploadKey = "private/file.txt"
        let uploadExpectation = expectation(description: "Successful file upload.")
        let content = "Hello World"
        
        let signInListenerWasSuccessful = expectation(description: "signIn listener was successful")
        AWSMobileClient.sharedInstance().addUserStateListener(self) { (userState, info) in
            switch (userState) {
            case .signedIn:
                signInListenerWasSuccessful.fulfill()
                print("Listener user is signed in.")
                print("Uploading file to : \(uploadKey)")
                transferUtility.uploadData(content.data(using: .utf8)!, key: uploadKey, contentType: "txt/plain", expression: nil) { (task, error) in
                    XCTAssertNil(error, "Upload data should not produce any error.")
                    uploadExpectation.fulfill()
                }
            default:
                print("Listener \(userState)")
            }
        }
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        wait(for: [signInListenerWasSuccessful, uploadExpectation], timeout: 5)
        AWSMobileClient.sharedInstance().removeUserStateListener(self)
    }

}
