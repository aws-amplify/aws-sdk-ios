//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

var testData = NSData()

class AWSS3TransferUtilityTests: XCTestCase {

    override class func setUp() {
        super.setUp()

        AWSTestUtility.setupCognitoCredentialsProvider()

        let serviceConfiguration = AWSServiceConfiguration(
            region: .EUWest1,
            credentialsProvider: AWSServiceManager.defaultServiceManager().defaultServiceConfiguration.credentialsProvider
        )

        let transferUtilityConfiguration = AWSS3TransferUtilityConfiguration()
        transferUtilityConfiguration.accelerateModeEnabled = true

        AWSS3TransferUtility.registerS3TransferUtilityWithConfiguration(
            serviceConfiguration,
            transferUtilityConfiguration: transferUtilityConfiguration,
            forKey: "transfer-acceleration"
        )

        var dataString = "1234567890"
        for _ in 1...5 {
            dataString += dataString
        }
        testData = dataString.dataUsingEncoding(NSUTF8StringEncoding)!
    }

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testUploadAndDownloadData() {
        let expectation = expectationWithDescription("The completion handler called.")

        // the test key is 1234567890123456
        let password = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI="
        let passwordMD5 = "dnF5x6K/8ZZRzpfSlMMM+w=="

        let transferUtility = AWSS3TransferUtility.defaultS3TransferUtility()
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        uploadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
        uploadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
        uploadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")

        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: NSError?) -> Void in
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)

                let downloadExpression = AWSS3TransferUtilityDownloadExpression()
                downloadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
                downloadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
                downloadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")

                let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: NSURL?, data: NSData?, error: NSError?) in
                    if let HTTPResponse = task.response {
                        XCTAssertEqual(HTTPResponse.statusCode, 200)
                        XCTAssertEqual(data, testData)
                        XCTAssertEqual(HTTPResponse.allHeaderFields["Content-Type"] as? String, "text/plain")
                    } else {
                        XCTFail()
                    }

                    expectation.fulfill()
                }

                transferUtility.downloadDataFromBucket(
                    "ios-v2-s3.periods",
                    key: "test-swift-upload",
                    expression: downloadExpression,
                    completionHander: downloadCompletionHandler).continueWithBlock({ (task) -> AnyObject? in
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
            completionHander: uploadCompletionHandler
            ).continueWithBlock { (task) -> AnyObject? in
                XCTAssertNil(task.error)

                return nil
        }

        waitForExpectationsWithTimeout(30) { (error) in
            XCTAssertNil(error)
        }
    }

    func testUploadFailure() {
        let expectation = expectationWithDescription("The completion handler called.")

        let password = "InvalidPassword"
        let passwordMD5 = "InvalidPasswordMD5"

        let transferUtility = AWSS3TransferUtility.defaultS3TransferUtility()
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        uploadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
        uploadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
        uploadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")

        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: NSError?) -> Void in
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.domain, AWSS3TransferUtilityErrorDomain)
            XCTAssertEqual(error?.code, AWSS3TransferUtilityErrorType.ClientError.rawValue)

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
            completionHander: uploadCompletionHandler
            ).continueWithBlock { (task) -> AnyObject? in
                XCTAssertNil(task.error)

                return nil
        }
        
        waitForExpectationsWithTimeout(30) { (error) in
            XCTAssertNil(error)
        }
    }

    func testTransferAcceleration() {
        let expectation = expectationWithDescription("The completion handler called.")

        let transferUtility = AWSS3TransferUtility.S3TransferUtilityForKey("transfer-acceleration")
        let uploadExpression = AWSS3TransferUtilityUploadExpression()

        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: NSError?) -> Void in
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)

                let downloadExpression = AWSS3TransferUtilityDownloadExpression()

                let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: NSURL?, data: NSData?, error: NSError?) in
                    if let HTTPResponse = task.response {
                        XCTAssertEqual(HTTPResponse.statusCode, 200)
                        XCTAssertEqual(data, testData)
                    } else {
                        XCTFail()
                    }

                    expectation.fulfill()
                }

                transferUtility.downloadDataFromBucket(
                    "ios-v2-s3-transfer-acceleration",
                    key: "test-swift-upload",
                    expression: downloadExpression,
                    completionHander: downloadCompletionHandler).continueWithBlock({ (task) -> AnyObject? in
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
            completionHander: uploadCompletionHandler
            ).continueWithBlock { (task) -> AnyObject? in
                XCTAssertNil(task.error)

                return nil
        }

        waitForExpectationsWithTimeout(30) { (error) in
            XCTAssertNil(error)
        }
    }

    func testInvalidBucketNameForTransferAcceleration() {
        let expectation = expectationWithDescription("The completion handler called.")

        let transferUtility = AWSS3TransferUtility.S3TransferUtilityForKey("transfer-acceleration")

        transferUtility.uploadData(
            testData,
            bucket: "invalid.bucket.name",
            key: "test-swift-upload",
            contentType: "application/octet-stream",
            expression: nil,
            completionHander: nil
            ).continueWithBlock { (task) -> AnyObject? in
                XCTAssertNotNil(task.error)
                XCTAssertEqual(task.error?.domain, AWSS3PresignedURLErrorDomain)
                XCTAssertEqual(task.error?.code, AWSS3PresignedURLErrorType.PresignedURLErrorInvalidBucketNameForAccelerateModeEnabled.rawValue)
                
                expectation.fulfill()
                
                return nil
        }
        
        waitForExpectationsWithTimeout(30) { (error) in
            XCTAssertNil(error)
        }
    }

    func testEmptyBucketNameForTransferAccelerationUpload() {
        let expectation = expectationWithDescription("The completion handler called.")

        let transferUtility = AWSS3TransferUtility.S3TransferUtilityForKey("transfer-acceleration")

        transferUtility.uploadData(
            testData,
            bucket: "",
            key: "test-swift-upload",
            contentType: "application/octet-stream",
            expression: nil,
            completionHander: nil
            ).continueWithBlock { (task) -> AnyObject? in
                XCTAssertNotNil(task.error)
                XCTAssertEqual(task.error?.domain, AWSS3PresignedURLErrorDomain)
                XCTAssertEqual(task.error?.code, AWSS3PresignedURLErrorType.PresignedURLErrorInvalidBucketNameForAccelerateModeEnabled.rawValue)

                expectation.fulfill()

                return nil
        }

        waitForExpectationsWithTimeout(30) { (error) in
            XCTAssertNil(error)
        }
    }

    func testEmptyBucketNameForTransferAccelerationDownload() {
        let expectation = expectationWithDescription("The completion handler called.")

        let transferUtility = AWSS3TransferUtility.S3TransferUtilityForKey("transfer-acceleration")

        transferUtility.downloadToURL(NSURL(string: "foo.bar")!,
            bucket: "",
            key: "test-swift-upload",
            expression: nil,
            completionHander: nil
            ).continueWithBlock { (task) -> AnyObject? in
                XCTAssertNotNil(task.error)
                XCTAssertEqual(task.error?.domain, AWSS3PresignedURLErrorDomain)
                XCTAssertEqual(task.error?.code, AWSS3PresignedURLErrorType.PresignedURLErrorBucketNameIsNil.rawValue)

                expectation.fulfill()

                return nil
        }

        waitForExpectationsWithTimeout(30) { (error) in
            XCTAssertNil(error)
        }
    }
}
