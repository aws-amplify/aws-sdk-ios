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

        //Setup Log level
        AWSDDLog.sharedInstance.logLevel = .verbose
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        
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
        
        let serviceConfiguration2 = AWSServiceManager.default().defaultServiceConfiguration
        let transferUtilityConfigurationWithRetry = AWSS3TransferUtilityConfiguration()
        transferUtilityConfigurationWithRetry.isAccelerateModeEnabled = false
        transferUtilityConfigurationWithRetry.retryLimit = 3
        transferUtilityConfigurationWithRetry.multiPartConcurrencyLimit = 2
        
        AWSS3TransferUtility.register(
            with: serviceConfiguration2!,
            transferUtilityConfiguration: transferUtilityConfigurationWithRetry,
            forKey: "with-retry"
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

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        uploadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
        uploadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
        uploadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)

                let downloadExpression = AWSS3TransferUtilityDownloadExpression()
                downloadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
                downloadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
                downloadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
                downloadExpression.progressBlock = {(task, progress) in
                    print("Download progress: ", progress.fractionCompleted)
                }
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

    func testUploadAndDownloadLargeData() {
        let expectation = self.expectation(description: "The completion handler called.")
        var dataString = "Test1234"
        for _ in 1...21 {
            dataString = dataString + dataString;
        }
        
        // the test key is 1234567890123456
        let password = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI="
        let passwordMD5 = "dnF5x6K/8ZZRzpfSlMMM+w=="
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        uploadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
        uploadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
        uploadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)
                
                let downloadExpression = AWSS3TransferUtilityDownloadExpression()
                downloadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
                downloadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
                downloadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
                downloadExpression.progressBlock = {(task, progress) in
                    print("Download progress: ", progress.fractionCompleted)
                }
                let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
                    if let HTTPResponse = task.response {
                        XCTAssertEqual(HTTPResponse.statusCode, 200)
                        XCTAssertEqual(data, dataString.data(using: String.Encoding.utf8)!)
                        XCTAssertEqual(HTTPResponse.allHeaderFields["Content-Type"] as? String, "text/plain")
                    } else {
                        XCTFail()
                    }
                    
                    expectation.fulfill()
                }
                
                transferUtility.downloadData(
                    fromBucket: "ios-v2-s3.periods",
                    key: "testUploadAndDownloadLargeData.txt",
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
            dataString.data(using: String.Encoding.utf8)!,
            bucket: "ios-v2-s3.periods",
            key: "testUploadAndDownloadLargeData.txt",
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
    
    func testSuspendResumeUploadAndDownloadLargeData() {
        let expectation = self.expectation(description: "The completion handler called.")
        var dataString = "Test1234"
        for _ in 1...22 {
            dataString = dataString + dataString;
        }
        
        // the test key is 1234567890123456
        let password = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI="
        let passwordMD5 = "dnF5x6K/8ZZRzpfSlMMM+w=="
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        uploadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
        uploadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
        uploadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)
                
                let downloadExpression = AWSS3TransferUtilityDownloadExpression()
                downloadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
                downloadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
                downloadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
                downloadExpression.progressBlock = {(task, progress) in
                    print("Download progress: ", progress.fractionCompleted)
                }
                let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
                    if let HTTPResponse = task.response {
                        XCTAssertEqual(HTTPResponse.statusCode, 200)
                        XCTAssertEqual(data, dataString.data(using: String.Encoding.utf8)!)
                        XCTAssertEqual(HTTPResponse.allHeaderFields["Content-Type"] as? String, "text/plain")
                    } else {
                        XCTFail()
                    }
                    
                    expectation.fulfill()
                }
                
                var refDownloadTask:AWSS3TransferUtilityDownloadTask?
                
                transferUtility.downloadData(
                    fromBucket: "ios-v2-s3.periods",
                    key: "testSuspendResumeUploadAndDownloadLargeData.txt",
                    expression: downloadExpression,
                    completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                        XCTAssertNil(task.error)
                        refDownloadTask = task.result
                        return nil
                    })
                
                sleep(2)
                refDownloadTask?.suspend()
                sleep(5)
                refDownloadTask?.resume()
                
            } else {
                XCTFail()
            }
        }
        
        var refUploadTask: AWSS3TransferUtilityUploadTask?
        
        transferUtility.uploadData(
            dataString.data(using: String.Encoding.utf8)!,
            bucket: "ios-v2-s3.periods",
            key: "testSuspendResumeUploadAndDownloadLargeData.txt",
            contentType: "text/plain",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)
                refUploadTask = task.result
                return nil
            })
        
       sleep(2)
        refUploadTask?.suspend()
        sleep(5)
        refUploadTask?.resume()
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    
    func testCancelDownload() {
        let expectation = self.expectation(description: "Cancel called.")
        var dataString = "Test1234"
        for _ in 1...20 {
            dataString = dataString + dataString;
        }
        
        // the test key is 1234567890123456
        let password = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI="
        let passwordMD5 = "dnF5x6K/8ZZRzpfSlMMM+w=="
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        uploadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
        uploadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
        uploadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)
                
                let downloadExpression = AWSS3TransferUtilityDownloadExpression()
                downloadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
                downloadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
                downloadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
                downloadExpression.progressBlock = {(task, progress) in
                    print("Download progress: ", progress.fractionCompleted)
                }
                let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
                    if let HTTPResponse = task.response {
                        XCTAssertEqual(HTTPResponse.statusCode, 200)
                        XCTAssertEqual(data, dataString.data(using: String.Encoding.utf8)!)
                        XCTAssertEqual(HTTPResponse.allHeaderFields["Content-Type"] as? String, "text/plain")
                    } else {
                        XCTFail()
                    }
                    
                }
                
                var refDownloadTask:AWSS3TransferUtilityDownloadTask?
                
                transferUtility.downloadData(
                    fromBucket: "ios-v2-s3.periods",
                    key: "testCancelDownload.txt",
                    expression: downloadExpression,
                    completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                        XCTAssertNil(task.error)
                        refDownloadTask = task.result
                        return nil
                    })
                
               sleep(2)
                refDownloadTask?.cancel()
                expectation.fulfill()
                
            } else {
                XCTFail()
            }
        }
        
        
        transferUtility.uploadData(
            dataString.data(using: String.Encoding.utf8)!,
            bucket: "ios-v2-s3.periods",
            key: "testCancelDownload.txt",
            contentType: "text/plain",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)
                return nil
            })
        waitForExpectations(timeout: 60) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testSuspendResumeUploadAndDownloadLargeDataLongDelay() {
        let expectation = self.expectation(description: "The completion handler called.")
        var dataString = "Test12"
        for _ in 1...22 {
            dataString = dataString + dataString;
        }
        
        // the test key is 1234567890123456
        let password = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI="
        let passwordMD5 = "dnF5x6K/8ZZRzpfSlMMM+w=="
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        uploadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
        uploadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
        uploadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)
                
                let downloadExpression = AWSS3TransferUtilityDownloadExpression()
                downloadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
                downloadExpression.setValue(password, forRequestHeader: "x-amz-server-side-encryption-customer-key")
                downloadExpression.setValue(passwordMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
                downloadExpression.progressBlock = {(task, progress) in
                    print("Download progress: ", progress.fractionCompleted)
                }
                let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
                    if let HTTPResponse = task.response {
                        XCTAssertEqual(HTTPResponse.statusCode, 200)
                        XCTAssertEqual(data, dataString.data(using: String.Encoding.utf8)!)
                        XCTAssertEqual(HTTPResponse.allHeaderFields["Content-Type"] as? String, "text/plain")
                    } else {
                        XCTFail()
                    }
                    
                    expectation.fulfill()
                }
                
                var refDownloadTask:AWSS3TransferUtilityDownloadTask?
                
                transferUtility.downloadData(
                    fromBucket: "ios-v2-s3.periods",
                    key: "testSuspendResumeUploadAndDownloadLargeDataLongDelay.txt",
                    expression: downloadExpression,
                    completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                        XCTAssertNil(task.error)
                        refDownloadTask = task.result
                        return nil
                    })
                
                sleep(2)
                refDownloadTask?.suspend()
                print("Sleeping for 30 seconds to allow server to Timeout on the download")
                sleep(30)
                refDownloadTask?.resume()
                
            } else {
                XCTFail()
            }
        }
        
        var refUploadTask: AWSS3TransferUtilityUploadTask?
        
        transferUtility.uploadData(
            dataString.data(using: String.Encoding.utf8)!,
            bucket: "ios-v2-s3.periods",
            key: "testSuspendResumeUploadAndDownloadLargeDataLongDelay.txt",
            contentType: "text/plain",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)
                refUploadTask = task.result
                return nil
            })
        
        sleep(2)
        refUploadTask?.suspend()
        print("Sleeping for 30 seconds to allow server to Timeout on the upload")
        sleep(30)
        refUploadTask?.resume()
        
        waitForExpectations(timeout: 300) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testUploadFailure() {
        let expectation = self.expectation(description: "The completion handler called.")

        let password = "InvalidPassword"
        let passwordMD5 = "InvalidPasswordMD5"

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
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
                sleep(2)
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
                XCTAssertEqual(task.error?._code, AWSS3PresignedURLErrorType.presignedURLErrorInvalidBucketNameForAccelerateModeEnabled.rawValue)

                expectation.fulfill()

                return nil
        })

        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testBadFilePathUpload() {
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        
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
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        
        let filePath = NSTemporaryDirectory() + "testGoodFilePathUpload.tmp"
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: "Test1234".data(using: .utf8), attributes: nil)
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        transferUtility.uploadFile(fileURL,
                                    bucket: "ios-v2-s3.periods",
                                       key: "testGoodFilePathUpload.txt",
                               contentType: "text/plain",
                                expression: expression,
                         completionHandler: nil)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
    }
    
    func testLargeFileUpload() {
        let expectation = self.expectation(description: "The completion handler called.")
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testLargeFileUpload.tmp"
        var testData = "Test1234"
        for _ in 1...20 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        transferUtility.uploadFile(fileURL,
                                   bucket: "ios-v2-s3.periods",
                                   key: "testLargeFileUpload.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testLargeFileUploadCancel() {
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testLargeFileUploadCancel.tmp"
        var testData = "Test1234"
        for _ in 1...20 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
        }
        
        var refUploadTask: AWSS3TransferUtilityUploadTask?
        
        transferUtility.uploadFile(fileURL,
                                   bucket: "ios-v2-s3.periods",
                                   key: "testLargeFileUploadCancel.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                refUploadTask = task.result
                return nil
            }.waitUntilFinished()
       sleep(2)
        refUploadTask?.cancel()
    }
    
    func testSuspendResumeLargeFileUpload() {
        let expectation = self.expectation(description: "The completion handler called.")
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testSuspendResumeLargeFileUpload.tmp"
        var testData = "Test1234"
        for _ in 1...20 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        var refUploadTask: AWSS3TransferUtilityUploadTask?
        
        transferUtility.uploadFile(fileURL,
                                   bucket: "ios-v2-s3.periods",
                                   key: "testSuspendResumeLargeFileUpload.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                refUploadTask = task.result
                return nil
            }.waitUntilFinished()
        
       sleep(2)
        refUploadTask?.suspend()
        
        sleep(5)
        refUploadTask?.resume()
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testSuspendResumeLargeFileUploadLongDelay() {
        let expectation = self.expectation(description: "The completion handler called.")
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testSuspendResumeLargeFileUploadLongDelay.tmp"
        var testData = "Test1234"
        for _ in 1...21 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        var refUploadTask: AWSS3TransferUtilityUploadTask?
        
        transferUtility.uploadFile(fileURL,
                                   bucket: "ios-v2-s3.periods",
                                   key: "testSuspendResumeLargeFileUploadLongDelay.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                refUploadTask = task.result
                return nil
            }.waitUntilFinished()
        
       sleep(2)
        refUploadTask?.suspend()
        print("Sleeping for 30 seconds to allow server to Timeout")
        sleep(30)
        refUploadTask?.resume()
        waitForExpectations(timeout: 300) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testGoodFilePathUploadDefaultBucket() {
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        
        
        let transferUtilityCongiguration = AWSS3TransferUtilityConfiguration()
        transferUtilityCongiguration.bucket = "ios-v2-s3.periods"
        AWSS3TransferUtility.register(with: transferUtility.configuration,
                                      transferUtilityConfiguration: transferUtilityCongiguration,
                                      forKey: "CustomConfig")
        
        let customTransferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "CustomConfig")
        let filePath = NSTemporaryDirectory() + "testGoodFilePathUpload.tmp"
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: "Test".data(using: .utf8), attributes: nil)
        
        customTransferUtility.uploadFile(fileURL,
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
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")

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
    
    func testMultiPartUploadSmallFile() {
        let expectation = self.expectation(description: "The completion handler called.")
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        
        let filePath = NSTemporaryDirectory() + "testMultiPartUploadSmallFile.tmp"
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: "This is a test".data(using: .utf8), attributes: nil)
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            expectation.fulfill()
        }
    
        transferUtility.uploadUsingMultiPart(fileURL:fileURL,
                                                 bucket: "ios-v2-s3.periods",
                                                 key: "testMultiPartUploadSmallFile.txt",
                                                 contentType: "text/plain",
                                                 expression: nil,
                                                 completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                                                    XCTAssertNil(task.error)
                                                    XCTAssertNotNil(task.result)
                                                    return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testMultiPartUploadLargeFile() {
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testMultiPartUploadLargeFile.tmp"
        var testData = "Test123456789"
        for _ in 1...21 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expectation = self.expectation(description: "The completion handler called.")
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        transferUtility.uploadUsingMultiPart(fileURL: fileURL, bucket: "ios-v2-s3.periods",
                                   key: "testMultiPartUploadLargeFile.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 240) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testMultiPartSinglePartEdgeCase() {
        //Create a large temp file that is exactly 5 MB;
        let filePath = NSTemporaryDirectory() + "testMultiPartSinglePartEdgeCase.tmp"
        var testData = "Test1"
        for _ in 1...20 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expectation = self.expectation(description: "The completion handler called.")
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        transferUtility.uploadUsingMultiPart(fileURL:fileURL, bucket: "ios-v2-s3.periods",
                                   key: "testMultiPartSinglePartEdgeCase.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 120) { (error) in
            XCTAssertNil(error)
        }
    }

    func testMultiPartEdgeCase() {
        //Create a large temp file that is exactly 10 MB;
        let filePath = NSTemporaryDirectory() + "testMultiPartEdgeCase.tmp"
        var testData = "Test1"
        for _ in 1...21 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expectation = self.expectation(description: "The completion handler called.")
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        transferUtility.uploadUsingMultiPart(fileURL:  fileURL, bucket: "ios-v2-s3.periods",
                                   key: "testMultiPartEdgeCase.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 120) { (error) in
            XCTAssertNil(error)
        }
    }
   
    func testCancelMultipartUpload() {
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testCancelMultipartUpload.tmp"
        var testData = "CancelT"
        for _ in 1...24 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        var refUploadTask: AWSS3TransferUtilityMultiPartUploadTask?
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        transferUtility.uploadUsingMultiPart(fileURL:  fileURL, bucket: "ios-v2-s3.periods",
                                   key: "testCancelMultipartUpload.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: nil)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                refUploadTask = task.result
                return nil;
            }
       sleep(2)
        refUploadTask?.cancel()
        
    }
    
    func testSuspendResumeMultipartUpload() {
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testSuspendResumeMultipartUpload.tmp"
        var testData = "PauseResumeTest"
        for _ in 1...20 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expectation = self.expectation(description: "The completion handler called.")
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        var refUploadTask: AWSS3TransferUtilityMultiPartUploadTask?
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        transferUtility.uploadUsingMultiPart(fileURL:  fileURL, bucket: "ios-v2-s3.periods",
                                   key: "testSuspendResumeMultipartUpload.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                refUploadTask = task.result
                return nil;
        }
       sleep(2)
        refUploadTask?.suspend()
        sleep(5)
        refUploadTask?.resume()
        
        waitForExpectations(timeout: 120) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testSuspendResumeMultipartUploadLongDelay() {
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testPauseResumeUploadLongDelay.tmp"
        var testData = "PauseResumeTest"
        for _ in 1...22 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expectation = self.expectation(description: "The completion handler called.")
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        var refUploadTask: AWSS3TransferUtilityMultiPartUploadTask?
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        
        transferUtility.uploadUsingMultiPart(fileURL:  fileURL, bucket: "ios-v2-s3.periods",
                                   key: "testPauseResumeUploadLongDelay.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                refUploadTask = task.result
                return nil;
        }
        sleep(2)
        refUploadTask?.suspend()
        print("Sleeping for 30 seconds to allow server to Timeout")
        sleep(30)
        refUploadTask?.resume()
    
        waitForExpectations(timeout: 300) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testMultiPartUploadTransferAcceleration() {
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testMultiPartUploadTransferAcceleration.tmp"
        var testData = "Test1234"
        for _ in 1...22 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expectation = self.expectation(description: "The completion handler called.")
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "transfer-acceleration")
        
        transferUtility.uploadUsingMultiPart(fileURL:fileURL, bucket: "ios-v2-s3-transfer-acceleration",
                                   key: "testMultiPartUploadTransferAcceleration.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 120) { (error) in
            XCTAssertNil(error)
        }
    }
    
}
