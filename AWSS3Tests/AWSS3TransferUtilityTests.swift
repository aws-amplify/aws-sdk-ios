//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

import XCTest
import AWSS3

var testData = Data()

class AWSS3TransferUtilityTests: XCTestCase {

    override class func setUp() {
        super.setUp()

        AWSTestUtility.setupCognitoCredentialsProvider()

        let serviceConfiguration = AWSServiceConfiguration(
            region: .EUWest1,
            credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider
        )

        let transferUtilityConfiguration = AWSS3TransferUtilityConfiguration()
        transferUtilityConfiguration.isAccelerateModeEnabled = true

        AWSS3TransferUtility.register(
            with: serviceConfiguration!,
            transferUtilityConfiguration: transferUtilityConfiguration,
            forKey: "transfer-acceleration"
        )

        var dataString = "1234567890"
        for _ in 1...5 {
            dataString += dataString
        }
        testData = dataString.data(using: String.Encoding.utf8)!
    }

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testUploadAndDownloadData() {
        let expectation = self.expectation(description: "The completion handler called.")

        // the test key is 1234567890123456
        let password = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI="
        let passwordMD5 = "dnF5x6K/8ZZRzpfSlMMM+w=="

        let transferUtility = AWSS3TransferUtility.default()
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        uploadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
        uploadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
        uploadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")

        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)

                let downloadExpression = AWSS3TransferUtilityDownloadExpression()
                downloadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
                downloadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
                downloadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")

                let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
                    if let HTTPResponse = task.response {
                        XCTAssertEqual(HTTPResponse.statusCode, 200)
                        XCTAssertEqual(data, testData)
                        XCTAssertEqual(HTTPResponse.allHeaderFields["Content-Type"] as? String, "text/plain")
                    } else {
                        XCTFail()
                    }

                    expectation.fulfill()
                }

                transferUtility.downloadData(
                    fromBucket: "ios-v2-s3.periods",
                    key: "test-swift-upload",
                    expression: downloadExpression,
                    completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                        XCTAssertNil(task.error)
                        return nil
                    })
            } else {
                XCTFail()
            }
        }

        transferUtility.uploadData(
            testData,
            bucket: "ios-v2-s3.periods",
            key: "test-swift-upload",
            contentType: "text/plain",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)

                return nil
        })

        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }

    func testUploadFailure() {
        let expectation = self.expectation(description: "The completion handler called.")

        let password = "InvalidPassword"
        let passwordMD5 = "InvalidPasswordMD5"

        let transferUtility = AWSS3TransferUtility.default()
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        uploadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
        uploadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
        uploadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")

        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNotNil(error)
            XCTAssertEqual(error?._domain, AWSS3TransferUtilityErrorDomain)
            XCTAssertEqual(error?._code, AWSS3TransferUtilityErrorType.clientError.rawValue)

            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 400)
            } else {
                XCTFail()
            }

            expectation .fulfill()
        }

        transferUtility.uploadData(
            testData,
            bucket: "ios-v2-s3.periods",
            key: "test-swift-upload",
            contentType: "application/octet-stream",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)

                return nil
        })
        
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }

    func testTransferAcceleration() {
        let expectation = self.expectation(description: "The completion handler called.")

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "transfer-acceleration")
        let uploadExpression = AWSS3TransferUtilityUploadExpression()

        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)

                let downloadExpression = AWSS3TransferUtilityDownloadExpression()

                let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
                    if let HTTPResponse = task.response {
                        XCTAssertEqual(HTTPResponse.statusCode, 200)
                        XCTAssertEqual(data, testData)
                    } else {
                        XCTFail()
                    }

                    expectation.fulfill()
                }

                transferUtility.downloadData(
                    fromBucket: "ios-v2-s3-transfer-acceleration",
                    key: "test-swift-upload",
                    expression: downloadExpression,
                    completionHandler: downloadCompletionHandler).continueWith (block: { (task) -> AnyObject? in
                        XCTAssertNil(task.error)
                        return nil
                    })
            } else {
                XCTFail()
            }
        }

        transferUtility.uploadData(
            testData,
            bucket: "ios-v2-s3-transfer-acceleration",
            key: "test-swift-upload",
            contentType: "application/octet-stream",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)

                return nil
        })

        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }

    func testInvalidBucketNameForTransferAcceleration() {
        let expectation = self.expectation(description: "The completion handler called.")

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "transfer-acceleration")

        transferUtility.uploadData(
            testData,
            bucket: "invalid.bucket.name",
            key: "test-swift-upload",
            contentType: "application/octet-stream",
            expression: nil,
            completionHandler: nil
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNotNil(task.error)
                XCTAssertEqual(task.error?._domain, AWSS3PresignedURLErrorDomain)
                XCTAssertEqual(task.error?._code, AWSS3PresignedURLErrorType.presignedURLErrorInvalidBucketNameForAccelerateModeEnabled.rawValue)
                
                expectation.fulfill()
                
                return nil
        })
        
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }

    func testEmptyBucketNameForTransferAccelerationUpload() {
        let expectation = self.expectation(description: "The completion handler called.")

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "transfer-acceleration")

        transferUtility.uploadData(
            testData,
            bucket: "",
            key: "test-swift-upload",
            contentType: "application/octet-stream",
            expression: nil,
            completionHandler: nil
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNotNil(task.error)
                XCTAssertEqual(task.error?._domain, AWSS3PresignedURLErrorDomain)
                XCTAssertEqual(task.error?._code, AWSS3PresignedURLErrorType.presignedURLErrorInvalidBucketNameForAccelerateModeEnabled.rawValue)

                expectation.fulfill()

                return nil
        })

        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }

    func testEmptyBucketNameForTransferAccelerationDownload() {
        let expectation = self.expectation(description: "The completion handler called.")

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "transfer-acceleration")

        transferUtility.download(to: URL(string: "foo.bar")!,
            bucket: "",
            key: "test-swift-upload",
            expression: nil,
            completionHandler: nil
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNotNil(task.error)
                XCTAssertEqual(task.error?._domain, AWSS3PresignedURLErrorDomain)
                XCTAssertEqual(task.error?._code, AWSS3PresignedURLErrorType.presignedURLErrorBucketNameIsNil.rawValue)

                expectation.fulfill()

                return nil
        })

        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testBadFilePathUpload() {
        let transferUtility = AWSS3TransferUtility.default()
        
        transferUtility.uploadFile(URL(fileURLWithPath: "~/abc.txt"),
                                   bucket: "ios-v2-s3.periods",
                                      key: "should-have-failed-testBadFilePathUpload.txt",
                              contentType: "text/plain",
                               expression: nil,
                        completionHandler: nil)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNotNil(task.error)
                XCTAssertNil(task.result)
                
                let error = task.error! as NSError
                XCTAssertEqual(error.code, AWSS3TransferUtilityErrorType.localFileNotFound.rawValue)
                return nil
            }.waitUntilFinished()
    }
    
    func testGoodFilePathUpload() {
        let transferUtility = AWSS3TransferUtility.default()
        
        let filePath = NSTemporaryDirectory() + "testGoodFilePathUpload.tmp"
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: "Test".data(using: .utf8), attributes: nil)
        
        transferUtility.uploadFile(fileURL,
                                    bucket: "ios-v2-s3.periods",
                                       key: "testGoodFilePathUpload.txt",
                               contentType: "text/plain",
                                expression: nil,
                         completionHandler: nil)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
    }

    func testGoodFilePathWithSpacesUpload() {
        let transferUtility = AWSS3TransferUtility.default()

        let filePath = NSTemporaryDirectory() + "test Good File Path Upload.tmp"
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: "Test".data(using: .utf8), attributes: nil)

        transferUtility.uploadFile(fileURL,
                                   bucket: "ios-v2-s3.periods",
                                   key: "test-spaces-Good-spaces-File-spaces-Path-spaces-Upload.txt",
                                   contentType: "text/plain",
                                   expression: nil,
                                   completionHandler: nil)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
    }
}
