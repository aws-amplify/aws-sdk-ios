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
        wait(for: [credentialsExpectation], timeout: 10)
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
        wait(for: [verifyCredentialsExpectation], timeout: 10)
        
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
        wait(for: [uploadExpectation], timeout: 10)
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
        wait(for: [verifyCredentialsExpectation], timeout: 10)
        
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
        wait(for: [uploadExpectation], timeout: 10)
        
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
        wait(for: [downloadExpectation], timeout: 10)
        
    }
    
    /// Test to check aws credentials fetched for unauth user
    ///
    /// - Given: An unauthenticated session
    /// - When:
    ///    - I fetch AWS credentials
    /// - Then:
    ///    - I should get credentials
    ///
    func testUnAuthCredentialsForSignOutUser() {
        let verifyCredentialsExpectation = expectation(description: "Credentials should be retrieved successfully")
        AWSMobileClient.sharedInstance().getAWSCredentials { (credentials, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(credentials)
            XCTAssertNotNil(credentials?.accessKey)
            XCTAssertNotNil(credentials?.secretKey)
            XCTAssertNotNil(credentials?.sessionKey)
            XCTAssertNotNil(credentials?.expiration)
            verifyCredentialsExpectation.fulfill()
        }
        wait(for: [verifyCredentialsExpectation], timeout: 10)
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
        AWSMobileClient.sharedInstance().getAWSCredentials { (_, _) in
            verifyCredentialsExpectation.fulfill()
        }
        wait(for: [verifyCredentialsExpectation], timeout: 10)
        
        XCTAssertFalse(AWSMobileClient.sharedInstance().isSignedIn, "User should be in signOut state")
        let uploadKey = "private/file.txt"
        let s3UploadDataCompletionExpectation = expectation(description: "S3 transfer utility uploadData task completed")
        let content = "Hello World"
        print("Uploading file to : \(uploadKey)")
        
        transferUtility.uploadData(content.data(using: .utf8)!,
                                   key: uploadKey,
                                   contentType: "text/plain",
                                   expression: nil) { (_, error) in
            defer {
                s3UploadDataCompletionExpectation.fulfill()
            }
            guard let error = error as NSError? else {
                XCTFail("Error unexpectedly nil")
                return
            }
            XCTAssertEqual(error.domain, AWSS3TransferUtilityErrorDomain)
            XCTAssertEqual(error.code, AWSS3TransferUtilityErrorType.clientError.rawValue)
        }
        wait(for: [s3UploadDataCompletionExpectation], timeout: 10)
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
        let content = "Hello World"
        let uploadKey = "private/\(username)/file.txt"
        let s3UploadDataCompletionExpectation = expectation(description: "S3 transfer utility uploadData task completed")
        let signInListenerWasSuccessful = expectation(description: "signIn listener was successful")
        
        AWSMobileClient.sharedInstance().addUserStateListener(self) { (userState, info) in
            defer {
                signInListenerWasSuccessful.fulfill()
            }
            
            guard userState == .signedIn else {
                print("Listener \(userState)")
                XCTFail("User state should be signed In")
                return
            }
            
            print("Listener user is signed in.")
            print("Uploading file to : \(uploadKey)")
            transferUtility.uploadData(content.data(using: .utf8)!,
                                       key: uploadKey,
                                       contentType: "text/plain",
                                       expression: nil) { (_, error) in
                                        XCTAssertNil(error, "Upload data should not produce any error.")
                                        s3UploadDataCompletionExpectation.fulfill()
            }
        }
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        wait(for: [signInListenerWasSuccessful, s3UploadDataCompletionExpectation], timeout: 10)
        AWSMobileClient.sharedInstance().removeUserStateListener(self)
    }
    
    /// Test user state are in consistent state when we upload a file from state listener
    ///
    /// - Given: An unauthenticated session
    /// - When:
    ///    - I invoke signIn
    ///    - I invoke upload to s3 inside the user state listener for signedIn case
    /// - Then:
    ///    - I should be able to upload to S3 without any error
    ///    - Only state change that happen should be signedIn state
    ///
    func testUserStateWhileUploadingInsideStateListener() {
        let username = "testUser" + UUID().uuidString
        let transferUtility = AWSS3TransferUtility.default()
        let uploadKey = "private/\(username)/file.txt"
        let content = "Hello World"
        
        let uploadExpectation = expectation(description: "Successful file upload.")
        let signInListenerWasSuccessful = expectation(description: "signIn listener was successful")
        let noOtherSignInStateReceived = expectation(description: "No other state should be called")
        noOtherSignInStateReceived.isInverted = true
        
        AWSMobileClient.sharedInstance().addUserStateListener(self) { (userState, info) in
            
            switch (userState) {
            case .signedIn:
                signInListenerWasSuccessful.fulfill()
                print("Listener user is signed in.")
                print("Uploading file to : \(uploadKey)")
                transferUtility.uploadData(content.data(using: .utf8)!,
                                           key: uploadKey,
                                           contentType: "text/plain",
                                           expression: nil) { (_, error) in
                                            XCTAssertNil(error, "Upload data should not produce any error.")
                                            uploadExpectation.fulfill()
                }
            default:
                print("Listener \(userState)")
                noOtherSignInStateReceived.fulfill()
            }
        }
        signUpAndVerifyUser(username: username)
        signIn(username: username)
        wait(for: [signInListenerWasSuccessful, uploadExpectation, noOtherSignInStateReceived], timeout: 10)
        AWSMobileClient.sharedInstance().removeUserStateListener(self)
    }

}
