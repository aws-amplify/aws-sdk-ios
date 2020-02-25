//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
var generalTestBucket = ""
var transferAccelerationBucket = "ios-v2-s3-transfer-acceleration"

class AWSS3TransferUtilityTests: XCTestCase {

    override class func setUp() {
        super.setUp()

        //Setup Log level
        AWSDDLog.sharedInstance.logLevel = .debug
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
        transferUtilityConfigurationWithRetry.retryLimit = 10
        transferUtilityConfigurationWithRetry.multiPartConcurrencyLimit = 6
        transferUtilityConfigurationWithRetry.timeoutIntervalForResource = 15*60 //15 minutes
        
        AWSS3TransferUtility.register(
            with: serviceConfiguration2!,
            transferUtilityConfiguration: transferUtilityConfigurationWithRetry,
            forKey: "with-retry"
        )
      
        let serviceConfiguration3 = AWSServiceManager.default().defaultServiceConfiguration
        let transferUtilityConfigurationShortExpiry = AWSS3TransferUtilityConfiguration()
        transferUtilityConfigurationShortExpiry.isAccelerateModeEnabled = false
        transferUtilityConfigurationShortExpiry.retryLimit = 5
        transferUtilityConfigurationShortExpiry.multiPartConcurrencyLimit = 6
        transferUtilityConfigurationShortExpiry.timeoutIntervalForResource = 2 //2 seconds
        
        AWSS3TransferUtility.register(
            with: serviceConfiguration3!,
            transferUtilityConfiguration: transferUtilityConfigurationShortExpiry,
            forKey: "short-expiry"
        )
        
        let serviceConfiguration4 = AWSServiceManager.default().defaultServiceConfiguration
        AWSS3TransferUtility.register(
            with: serviceConfiguration4!,
            transferUtilityConfiguration: nil,
            forKey: "nil-configuration"
        )
        
        let invalidStaticCredentialProvider = AWSStaticCredentialsProvider(accessKey: "Invalid", secretKey: "AlsoInvalid")
        let invalidServiceConfig = AWSServiceConfiguration(region: .USEast1, credentialsProvider: invalidStaticCredentialProvider)
        AWSS3TransferUtility.register(with: invalidServiceConfig!, forKey: "invalid")
        
        
        var dataString = "1234567890"
        for _ in 1...5 {
            dataString += dataString
        }
        testData = dataString.data(using: String.Encoding.utf8)!
        
        let timeInterval = (Int)((Date.timeIntervalSinceReferenceDate * 1000).rounded())
        generalTestBucket = "s3-integ-transferutil-test-\(timeInterval)"
        AWSS3TestHelper.createBucket(withName: generalTestBucket, andRegion: AWSRegionType.USEast1)
    }

    override func setUp() {
        super.setUp()
    }

    override class func tearDown() {
        AWSS3TestHelper.deleteAllObjects(fromBucket: generalTestBucket)
        AWSS3TestHelper.deleteBucket(withName: generalTestBucket)
        super.tearDown()
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
        XCTAssertNotNil(transferUtility)
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
                XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.completed)
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
                        XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.completed)
                    } else {
                        XCTFail()
                    }

                    expectation.fulfill()
                }

                transferUtility?.downloadData(
                    fromBucket: generalTestBucket,
                    key: "test-swift-upload&~:'()|[] i.txt",
                    expression: downloadExpression,
                    completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                        XCTAssertNil(task.error)
                        return nil
                    })
            } else {
                XCTFail()
            }
        }

        transferUtility?.uploadData(
            testData,
            bucket: generalTestBucket,
            key: "test-swift-upload&~:'()|[] i.txt",
            contentType: "text/plain",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)

                return nil
        })

        waitForExpectations(timeout: 90) { (error) in
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
        XCTAssertNotNil(transferUtility)
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
                
                transferUtility?.downloadData(
                    fromBucket: generalTestBucket,
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
        
        transferUtility?.uploadData(
            dataString.data(using: String.Encoding.utf8)!,
            bucket: generalTestBucket,
            key: "testUploadAndDownloadLargeData.txt",
            contentType: "text/plain",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)
                
                return nil
            })
        
        waitForExpectations(timeout: 90) { (error) in
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
        XCTAssertNotNil(transferUtility)
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
                
                transferUtility?.downloadData(
                    fromBucket: generalTestBucket,
                    key: "testSuspendResumeUploadAndDownloadLargeData.txt",
                    expression: downloadExpression,
                    completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                        XCTAssertNil(task.error)
                        refDownloadTask = task.result
                        return nil
                    })
                
                sleep(2)
                refDownloadTask?.suspend()
                XCTAssertEqual(refDownloadTask?.status, AWSS3TransferUtilityTransferStatusType.paused)
                sleep(5)
                refDownloadTask?.resume()
                XCTAssertEqual(refDownloadTask?.status, AWSS3TransferUtilityTransferStatusType.inProgress)

                
            } else {
                XCTFail()
            }
        }
        
        var refUploadTask: AWSS3TransferUtilityUploadTask?
        
        transferUtility?.uploadData(
            dataString.data(using: String.Encoding.utf8)!,
            bucket: generalTestBucket,
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
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.paused)
        sleep(5)
        refUploadTask?.resume()
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.inProgress)

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
        XCTAssertNotNil(transferUtility)
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
                
                transferUtility?.downloadData(
                    fromBucket: generalTestBucket,
                    key: "testCancelDownload.txt",
                    expression: downloadExpression,
                    completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                        XCTAssertNil(task.error)
                        refDownloadTask = task.result
                        return nil
                    })
                
               sleep(2)
                refDownloadTask?.cancel()
                XCTAssertEqual(refDownloadTask?.status, AWSS3TransferUtilityTransferStatusType.cancelled)
                expectation.fulfill()
                
            } else {
                XCTFail()
            }
        }
        
        
        transferUtility?.uploadData(
            dataString.data(using: String.Encoding.utf8)!,
            bucket: generalTestBucket,
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
        XCTAssertNotNil(transferUtility)
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
                
                transferUtility?.downloadData(
                    fromBucket: generalTestBucket,
                    key: "testSuspendResumeUploadAndDownloadLargeDataLongDelay.txt",
                    expression: downloadExpression,
                    completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                        XCTAssertNil(task.error)
                        refDownloadTask = task.result
                        return nil
                    })
                
                sleep(2)
                refDownloadTask?.suspend()
                XCTAssertEqual(refDownloadTask?.status, AWSS3TransferUtilityTransferStatusType.paused)

                print("Sleeping for 30 seconds to allow server to Timeout on the download")
                sleep(30)
                refDownloadTask?.resume()
                XCTAssertEqual(refDownloadTask?.status, AWSS3TransferUtilityTransferStatusType.inProgress)

                
            } else {
                XCTFail()
            }
        }
        
        var refUploadTask: AWSS3TransferUtilityUploadTask?
        
        transferUtility?.uploadData(
            dataString.data(using: String.Encoding.utf8)!,
            bucket: generalTestBucket,
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
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.paused)

        print("Sleeping for 30 seconds to allow server to Timeout on the upload")
        sleep(30)
        refUploadTask?.resume()
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.inProgress)

        waitForExpectations(timeout: 300) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testUploadFailure() {
        let expectation = self.expectation(description: "The completion handler called.")

        let password = "InvalidPassword"
        let passwordMD5 = "InvalidPasswordMD5"

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
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
        
        transferUtility?.uploadData(
            testData,
            bucket: generalTestBucket,
            key: "test-swift-upload",
            contentType: "application/octet-stream",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)

                return nil
        })
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }

    func testTransferAcceleration() {
        let expectation = self.expectation(description: "The completion handler called.")

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "transfer-acceleration")
        XCTAssertNotNil(transferUtility)
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

                transferUtility?.downloadData(
                    fromBucket: transferAccelerationBucket,
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

        transferUtility?.uploadData(
            testData,
            bucket: transferAccelerationBucket,
            key: "test-swift-upload",
            contentType: "application/octet-stream",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)

                return nil
        })

        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }

    func testInvalidBucketNameForTransferAcceleration() {
        let expectation = self.expectation(description: "The completion handler called.")

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "transfer-acceleration")
        XCTAssertNotNil(transferUtility)
        transferUtility?.uploadData(
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
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }

    func testEmptyBucketNameForTransferAccelerationUpload() {
        let expectation = self.expectation(description: "The completion handler called.")

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "transfer-acceleration")
        XCTAssertNotNil(transferUtility)
        transferUtility?.uploadData(
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

        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }

    func testEmptyBucketNameForTransferAccelerationDownload() {
        let expectation = self.expectation(description: "The completion handler called.")

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "transfer-acceleration")
        XCTAssertNotNil(transferUtility)
        transferUtility?.download(to: URL(string: "foo.bar")!,
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

        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testBadFilePathUpload() {
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        transferUtility?.uploadFile(URL(fileURLWithPath: "~/abc.txt"),
                                   bucket: generalTestBucket,
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
        let expectation = self.expectation(description: "The completion handler called.")
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        
        let filePath = NSTemporaryDirectory() + "testGoodFilePathUpload.tmp"
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: "Test1234".data(using: .utf8), attributes: nil)
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.setValue(author, forRequestHeader: "x-amz-meta-author");
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id");
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.completed)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testGoodFilePathUpload.txt"
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                
                expectation.fulfill()
                return nil
            })
        }
        
        transferUtility?.uploadFile(fileURL,
                                    bucket: generalTestBucket,
                                       key: "testGoodFilePathUpload.txt",
                               contentType: "text/plain",
                                expression: expression,
                         completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
       
        waitForExpectations(timeout: 240) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testLargeFileUpload() {
        let expectation = self.expectation(description: "The completion handler called.")
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testLargeFileUpload.tmp"
        var testData = "Test1234"
        for _ in 1...20 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.setValue(author, forRequestHeader: "x-amz-meta-author")
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id")
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.completed)

            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testLargeFileUpload.txt"
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                
                expectation.fulfill()
                return nil
            })
        }
        
        transferUtility?.uploadFile(fileURL,
                                   bucket: generalTestBucket,
                                   key: "testLargeFileUpload.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testLargeFileUploadCancel() {
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
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
        
        transferUtility?.uploadFile(fileURL,
                                   bucket: generalTestBucket,
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
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.cancelled)

    }
    
    func testSuspendResumeLargeFileUpload() {
        let expectation = self.expectation(description: "The completion handler called.")
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testSuspendResumeLargeFileUpload.tmp"
        var testData = "Test1234"
        for _ in 1...20 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.setValue(author, forRequestHeader: "x-amz-meta-author");
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id");
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testSuspendResumeLargeFileUpload.txt"
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                
                expectation.fulfill()
                return nil
            })
        }
        
        var refUploadTask: AWSS3TransferUtilityUploadTask?
        transferUtility?.uploadFile(fileURL,
                                   bucket: generalTestBucket,
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
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.paused)

        sleep(5)
        refUploadTask?.resume()
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.inProgress)

        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testSuspendResumeLargeFileUploadLongDelay() {
        let expectation = self.expectation(description: "The completion handler called.")
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testSuspendResumeLargeFileUploadLongDelay.tmp"
        var testData = "Test1234"
        for _ in 1...21 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.setValue(author, forRequestHeader: "x-amz-meta-author");
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id");
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testSuspendResumeLargeFileUploadLongDelay.txt"
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                
                expectation.fulfill()
                return nil
            })
        }
        var refUploadTask: AWSS3TransferUtilityUploadTask?
        
        transferUtility?.uploadFile(fileURL,
                                   bucket: generalTestBucket,
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
        let expectation = self.expectation(description: "The file was uploaded.")
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        let transferUtilityCongiguration = AWSS3TransferUtilityConfiguration()
        transferUtilityCongiguration.bucket = generalTestBucket
        AWSS3TransferUtility.register(with: transferUtility!.configuration,
                                      transferUtilityConfiguration: transferUtilityCongiguration,
                                      forKey: "CustomConfig")
        
        let customTransferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "CustomConfig")
        XCTAssertNotNil(customTransferUtility)
        let filePath = NSTemporaryDirectory() + "testGoodFilePathUpload.tmp"
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: "Test".data(using: .utf8), attributes: nil)
        
        let expression = AWSS3TransferUtilityUploadExpression()
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        expression.setValue(author, forRequestHeader: "x-amz-meta-author");
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id");
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testGoodFilePathUpload.txt"
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                
                expectation.fulfill()
                return nil
            })
        }
        customTransferUtility?.uploadFile(fileURL,
                                   key: "testGoodFilePathUpload.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 240) { (error) in
            XCTAssertNil(error)
        }
        
    }

    func testGoodFilePathWithSpacesUpload() {
        let expectation = self.expectation(description: "The file was uploaded.")
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        
        let filePath = NSTemporaryDirectory() + "test Good File Path Upload.tmp"
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: "Test".data(using: .utf8), attributes: nil)

        let expression = AWSS3TransferUtilityUploadExpression()
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        expression.setValue(author, forRequestHeader: "x-amz-meta-author");
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id");
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "test-spaces-Good-spaces-File-spaces-Path-spaces-Upload.txt"
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                expectation.fulfill()
                return nil
            })
        }
        
        transferUtility?.uploadFile(fileURL,
                                   bucket: generalTestBucket,
                                   key: "test-spaces-Good-spaces-File-spaces-Path-spaces-Upload.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testMultiPartUploadSmallFile() {
        let expectation = self.expectation(description: "The completion handler called.")
        let transferUtility = AWSS3TransferUtility.default()
        let filePath = NSTemporaryDirectory() + "testMultiPartUploadSmallFile.tmp"
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: "This is a test".data(using: .utf8), attributes: nil)
        
        var calculatedHash:(String) = ""
        if let digestData = sha256(url: fileURL) {
            calculatedHash = digestData.map { String(format: "%02hhx", $0) }.joined()
        }
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        expression.setValue(author, forRequestHeader: "x-amz-meta-author")
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id")
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.completed)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testMultiPartUploadSmallFile.txt"
            
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                //Download the file and make sure that contents are the same.
                self.verifyContent(tu: transferUtility, bucket: generalTestBucket, key: "testMultiPartUploadSmallFile.txt", hash: calculatedHash)
                
                expectation.fulfill()
                return nil
            })
        }
    
        transferUtility.uploadUsingMultiPart(fileURL:fileURL,
                                                 bucket: generalTestBucket,
                                                 key: "testMultiPartUploadSmallFile.txt",
                                                 contentType: "text/plain",
                                                 expression: expression,
                                                 completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                                                    XCTAssertNil(task.error)
                                                    XCTAssertNotNil(task.result)
                                                    return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testMultiPartUploadSmallFileNilTransferUtilityConfiguration() {
        let expectation = self.expectation(description: "The completion handler called.")
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "nil-configuration")
        XCTAssertNotNil( transferUtility)
        
        let filePath = NSTemporaryDirectory() + "testMultiPartUploadSmallFileNilTransferUtilityConfiguration.tmp"
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: "This is a test".data(using: .utf8), attributes: nil)

        var calculatedHash:(String) = ""
        if let digestData = sha256(url: fileURL) {
            calculatedHash = digestData.map { String(format: "%02hhx", $0) }.joined()
        }
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        expression.setValue(author, forRequestHeader: "x-amz-meta-author")
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id")
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }

        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.completed)

            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testMultiPartUploadSmallFileNilTransferUtilityConfiguration.txt"

            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                self.verifyContent(tu: transferUtility!, bucket: generalTestBucket, key: "testMultiPartUploadSmallFileNilTransferUtilityConfiguration.txt", hash: calculatedHash)
                expectation.fulfill()
                return nil
            })

        }

        transferUtility?.uploadUsingMultiPart(fileURL:fileURL,
                                             bucket: generalTestBucket,
                                             key: "testMultiPartUploadSmallFileNilTransferUtilityConfiguration.txt",
                                             contentType: "text/plain",
                                             expression: expression,
                                             completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()

        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }

    func testMultiPartUploadLargeFile() {
        //Create a large temp file;
      
        let customerKey = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI="
        let customerKeyMD5 = "dnF5x6K/8ZZRzpfSlMMM+w=="
        let filePath = NSTemporaryDirectory() + "testMultiPartUploadLargeFile.tmp"
        var testData = "Test123456789"
        for _ in 1...21 {
            testData = testData + testData;
        }
        
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        var calculatedHash:(String) = ""
        if let digestData = sha256(url: fileURL) {
            calculatedHash = digestData.map { String(format: "%02hhx", $0) }.joined()
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        
        
        let expectation = self.expectation(description: "The completion handler called.")
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        expression.setValue(author, forRequestHeader: "x-amz-meta-author")
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id")
        expression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption-customer-algorithm")
        expression.setValue(customerKey, forRequestHeader: "x-amz-server-side-encryption-customer-key")
        expression.setValue(customerKeyMD5, forRequestHeader: "x-amz-server-side-encryption-customer-key-MD5")
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testMultiPartUploadLargeFile.txt"
            headObjectRequest?.sseCustomerAlgorithm = "AES256"
            headObjectRequest?.sseCustomerKey = customerKey
            headObjectRequest?.sseCustomerKeyMD5 = customerKeyMD5
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                
                let headers =  [
                    "x-amz-server-side-encryption-customer-algorithm": "AES256",
                    "x-amz-server-side-encryption-customer-key": customerKey,
                    "x-amz-server-side-encryption-customer-key-MD5" : customerKeyMD5]
                
                self.verifyContent(tu: transferUtility!,
                                   bucket: generalTestBucket,
                                   key: "testMultiPartUploadLargeFile.txt",
                                   hash: calculatedHash,
                                   headerKeyValues: headers)
                
                expectation.fulfill()
                return nil
            })
            
        }
        
        transferUtility?.uploadUsingMultiPart(fileURL: fileURL, bucket: generalTestBucket,
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
        var calculatedHash:(String) = ""
        if let digestData = sha256(url: fileURL) {
            calculatedHash = digestData.map { String(format: "%02hhx", $0) }.joined()
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        
        let expectation = self.expectation(description: "The completion handler called.")
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        expression.setValue(author, forRequestHeader: "x-amz-meta-author")
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id")
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testMultiPartSinglePartEdgeCase.txt"
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                self.verifyContent(tu: transferUtility!,
                                   bucket: generalTestBucket,
                                   key: "testMultiPartSinglePartEdgeCase.txt",
                                   hash: calculatedHash)
                expectation.fulfill()
                return nil
            })
            
        }
        
       
        transferUtility?.uploadUsingMultiPart(fileURL:fileURL, bucket: generalTestBucket,
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
        var calculatedHash:(String) = ""
        if let digestData = sha256(url: fileURL) {
            calculatedHash = digestData.map { String(format: "%02hhx", $0) }.joined()
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)

        let expectation = self.expectation(description: "The completion handler called.")
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        expression.setValue(author, forRequestHeader: "x-amz-meta-author")
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id")
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testMultiPartEdgeCase.txt"
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                self.verifyContent(tu: transferUtility!,
                                   bucket: generalTestBucket,
                                   key: "testMultiPartEdgeCase.txt",
                                   hash: calculatedHash)
                expectation.fulfill()
                return nil
            })
            
        }
        
        transferUtility?.uploadUsingMultiPart(fileURL:  fileURL, bucket: generalTestBucket,
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
        XCTAssertNotNil(transferUtility)
        transferUtility?.uploadUsingMultiPart(fileURL:  fileURL, bucket: generalTestBucket,
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
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.cancelled)

    }

    func testRemovingTransferUtilityInvalidatesSession() {
        // setup a custom transfer utility that will be registered then removed
        let serviceConfiguration = AWSServiceManager.default().defaultServiceConfiguration
        let transferUtilityConfiguration = AWSS3TransferUtilityConfiguration()
        transferUtilityConfiguration.isAccelerateModeEnabled = false
        transferUtilityConfiguration.retryLimit = 10
        transferUtilityConfiguration.multiPartConcurrencyLimit = 6
        transferUtilityConfiguration.timeoutIntervalForResource = 15*60 //15 minutes

        AWSS3TransferUtility.register(
            with: serviceConfiguration!,
            transferUtilityConfiguration: transferUtilityConfiguration,
            forKey: "to-remove"
        )

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

        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "to-remove")
        XCTAssertNotNil(transferUtility)

        transferUtility?.uploadUsingMultiPart(fileURL:  fileURL, bucket: generalTestBucket,
                                   key: "testCancelMultipartUpload.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: nil)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }

        sleep(2)

        let sessionInvalidationExpectation = XCTNSNotificationExpectation(name: .AWSS3TransferUtilityURLSessionDidBecomeInvalid, object: nil, notificationCenter: NotificationCenter.default)

        // remove the utility and wait for the session invalidation notification
        AWSS3TransferUtility.remove(forKey: "to-remove")

        wait(for: [sessionInvalidationExpectation], timeout: 10)
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
        var calculatedHash:(String) = ""
        if let digestData = sha256(url: fileURL) {
            calculatedHash = digestData.map { String(format: "%02hhx", $0) }.joined()
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        let expectation = self.expectation(description: "The completion handler called.")

        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        expression.setValue(author, forRequestHeader: "x-amz-meta-author")
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id")
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }

        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testSuspendResumeMultipartUpload.txt"

            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                self.verifyContent(tu: transferUtility!,
                                   bucket: generalTestBucket,
                                   key: "testSuspendResumeMultipartUpload.txt",
                                   hash: calculatedHash)
                expectation.fulfill()
                return nil
            })
            
        }
        
        var refUploadTask: AWSS3TransferUtilityMultiPartUploadTask?
        
        
        transferUtility?.uploadUsingMultiPart(fileURL:  fileURL, bucket: generalTestBucket,
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
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.paused)
        
        sleep(5)
        refUploadTask?.resume()
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.inProgress)
        
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
        var calculatedHash:(String) = ""
        if let digestData = sha256(url: fileURL) {
            calculatedHash = digestData.map { String(format: "%02hhx", $0) }.joined()
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        let expectation = self.expectation(description: "The completion handler called.")
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        expression.setValue(author, forRequestHeader: "x-amz-meta-author")
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id")
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.completed)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testPauseResumeUploadLongDelay.txt"
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                if (task.result != nil) {
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata?["author"])
                    XCTAssertEqual(uuid, output.metadata?["id"])
                }
                
                self.verifyContent(tu: transferUtility!,
                                   bucket: generalTestBucket,
                                   key: "testPauseResumeUploadLongDelay.txt",
                                   hash: calculatedHash)
                
                expectation.fulfill()
                return nil
            })
            
        }
        
        var refUploadTask: AWSS3TransferUtilityMultiPartUploadTask?
        
        transferUtility?.uploadUsingMultiPart(fileURL:  fileURL, bucket: generalTestBucket,
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
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.paused)
        
        print("Sleeping for 30 seconds to allow server to Timeout")
        sleep(30)
        refUploadTask?.resume()
        XCTAssertEqual(refUploadTask?.status, AWSS3TransferUtilityTransferStatusType.inProgress)
        
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
        var calculatedHash:(String) = ""
        if let digestData = sha256(url: fileURL) {
            calculatedHash = digestData.map { String(format: "%02hhx", $0) }.joined()
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "transfer-acceleration")
        XCTAssertNotNil(transferUtility)
        let expectation = self.expectation(description: "The completion handler called.")
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.completed)
            self.verifyContent(tu: transferUtility!,
                               bucket: transferAccelerationBucket,
                               key: "testMultiPartUploadTransferAcceleration.txt",
                               hash: calculatedHash)
            expectation.fulfill()
        }
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
       
        transferUtility?.uploadUsingMultiPart(fileURL:fileURL, bucket: transferAccelerationBucket,
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

    func testUploadAndDownloadDataWithCustomMetaData() {
        let expectation = self.expectation(description: "The completion handler called.")
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        
        let transferUtility = AWSS3TransferUtility.default()
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        
        uploadExpression.setValue(author, forRequestHeader: "x-amz-meta-author");
        uploadExpression.setValue(uuid, forRequestHeader: "x-amz-meta-id");
        uploadExpression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption")
        uploadExpression.setValue("arbitrary", forRequestHeader: "x-amz-meta-category_id")
        uploadExpression.setValue("0", forRequestHeader: "x-amz-meta-description")
        uploadExpression.setValue("link", forRequestHeader: "x-amz-meta-facebook_post")
        uploadExpression.setValue("0", forRequestHeader: "x-amz-meta-push_notfication")
        uploadExpression.setValue("Title", forRequestHeader: "x-amz-meta-title")
        uploadExpression.setValue("2", forRequestHeader: "x-amz-meta-total_items")
        uploadExpression.setValue("Post", forRequestHeader: "x-amz-meta-twitter_post")
        uploadExpression.setValue("video", forRequestHeader: "x-amz-meta-type")
        uploadExpression.setValue("36uk2Tu", forRequestHeader: "x-amz-meta-upload_id")
        uploadExpression.setValue("The token", forRequestHeader: "x-amz-meta-user_token")
        
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)
                XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.completed)
                
                //Get Meta Data and verify that it has been updated
                let s3 = AWSS3.default()
                let headObjectRequest = AWSS3HeadObjectRequest()
                headObjectRequest?.bucket = generalTestBucket
                headObjectRequest?.key = "testUploadAndDownloadDataWithCustomMetaData"
                
                s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                    XCTAssertNil(task.error)
                    XCTAssertNotNil(task.result)
                    let output:(AWSS3HeadObjectOutput) = task.result!
                    XCTAssertNotNil(output)
                    XCTAssertNotNil(output.metadata)
                    XCTAssertEqual(author, output.metadata!["author"])
                    XCTAssertEqual(uuid, output.metadata!["id"])
                    
                    print(output.metadata!)
                    expectation.fulfill()
                    return nil
                })
            } else {
                XCTFail()
            }
        }
        
        transferUtility.uploadData(
            testData,
            bucket: generalTestBucket,
            key: "testUploadAndDownloadDataWithCustomMetaData",
            contentType: "video/mp4",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> Any? in
                XCTAssertNil(task.error)
                
                return nil
            })
        
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testMultiPartUploadLargeFileWithCustomMetaData() {
        let expectation = self.expectation(description: "The file was uploaded.")
        
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testMultiPartUploadLargeFileWithCustomMetaData.tmp"
        var testData = "Test123456789"
        for _ in 1...2 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let expression = AWSS3TransferUtilityMultiPartUploadExpression()
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        expression.setValue(author, forRequestHeader: "x-amz-meta-author")
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id")
        
        expression.setValue("arbitrary", forRequestHeader: "x-amz-meta-category_id")
        expression.setValue("0", forRequestHeader: "x-amz-meta-description")
        expression.setValue("link", forRequestHeader: "x-amz-meta-facebook_post")
        expression.setValue("0", forRequestHeader: "x-amz-meta-push_notfication")
        expression.setValue("Title", forRequestHeader: "x-amz-meta-title")
        expression.setValue("2", forRequestHeader: "x-amz-meta-total_items")
        expression.setValue("Post", forRequestHeader: "x-amz-meta-twitter_post")
        expression.setValue("video", forRequestHeader: "x-amz-meta-type")
        expression.setValue("36uk2Tu", forRequestHeader: "x-amz-meta-upload_id")
        expression.setValue("The token", forRequestHeader: "x-amz-meta-user_token")
        //expression.setValue("video/mp4", forRequestHeader:"content-type")
        
        expression.setValue("no-cache", forRequestHeader: "Cache-Control")
        expression.setValue("REDUCED_REDUNDANCY", forRequestHeader: "x-amz-storage-class")
        expression.setValue("public-read", forRequestHeader: "x-amz-acl")
        expression.setValue("Project=blue&Classification=confidential", forRequestHeader: "x-amz-tagging")
        expression.setValue("requester", forRequestHeader: "x-amz-request-payer")
        expression.setValue("AES256", forRequestHeader: "x-amz-server-side-encryption")
        expression.setValue("attachment", forRequestHeader: "Content-Disposition");
        print(expression.requestHeaders)
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.completed)
            
            //Get Meta Data and verify that it has been updated. This will indicate that the upload has succeeded.
            let s3 = AWSS3.default()
            let headObjectRequest = AWSS3HeadObjectRequest()
            headObjectRequest?.bucket = generalTestBucket
            headObjectRequest?.key = "testMultiPartUploadLargeFileWithCustomMetaData.txt"
            
            s3.headObject(headObjectRequest!).continueWith(block: { (task:AWSTask<AWSS3HeadObjectOutput> ) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                let output:(AWSS3HeadObjectOutput) = task.result!
                XCTAssertNotNil(output)
                XCTAssertNotNil(output.metadata)
                XCTAssertEqual(author, output.metadata!["author"])
                XCTAssertEqual(uuid, output.metadata!["id"])
                XCTAssertEqual(output.serverSideEncryption, AWSS3ServerSideEncryption.AES256)
                XCTAssertEqual("video/mp4", output.contentType)
                XCTAssertEqual("no-cache", output.cacheControl)
                XCTAssertEqual("attachment", output.contentDisposition)
                XCTAssertEqual(output.storageClass,AWSS3StorageClass.reducedRedundancy)
                
                expectation.fulfill()
                return nil
            })
            
        }
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        transferUtility?.uploadUsingMultiPart(fileURL: fileURL, bucket: generalTestBucket,
                                             key: "testMultiPartUploadLargeFileWithCustomMetaData.txt",
                                             contentType: "video/mp4" ,
                                             expression: expression,
                                             completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityMultiPartUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                return nil
            }.waitUntilFinished()
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error)
        }
    }
    
    
    func testUploadAndDownloadDataWithIfModified() {
        let expectation = self.expectation(description: "The completion handler called.")
        
        let transferUtility = AWSS3TransferUtility.default()
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
        
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)
                
                let downloadExpression = AWSS3TransferUtilityDownloadExpression()
                
                let fmt = DateFormatter()
                fmt.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
                //Sleep for 5 seconds to make sure that we can set the current date/time for the ifModifiedSince header.
                sleep(5)
                let ifModifiedSince = Date()
                
                downloadExpression.setValue(fmt.string(from:ifModifiedSince), forRequestHeader: "If-Modified-Since")
        
                downloadExpression.progressBlock = {(task, progress) in
                    print("Download progress: ", progress.fractionCompleted)
                }
                let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
                    if let HTTPResponse = task.response {
                        XCTAssertEqual(HTTPResponse.statusCode, 304)
                    } else {
                        XCTFail()
                    }
                    expectation.fulfill()
                }
                
                transferUtility.downloadData(
                    fromBucket: generalTestBucket,
                    key: "testDataForIfModifiedSince.txt",
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
            "1234567890".data(using: String.Encoding.utf8)!,
            bucket: generalTestBucket,
            key: "testDataForIfModifiedSince.txt",
            contentType: "text/plain",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)
                
                return nil
            })
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testInvalidCredentialsUpload() {
        let expectation = self.expectation(description: "The completion handler called.")
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "invalid")
        XCTAssertNotNil(transferUtility)
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNotNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.error)
            self.processServiceError(error)
            expectation.fulfill()
        }
        
        transferUtility?.uploadData(
            "1234567890".data(using: String.Encoding.utf8)!,
            bucket: "some-random-bucket",
            key: "any-file-which-gets-rejected.txt",
            contentType: "text/plain",
            expression: nil,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)
                return nil
            })
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testInvalidCredentialsMultiPartUpload() {
        let expectation = self.expectation(description: "The completion handler called.")
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "invalid")
        XCTAssertNotNil(transferUtility)
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNotNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.error)
            
            self.processServiceError(error)
            expectation.fulfill()
        }
        
        transferUtility?.uploadUsingMultiPart(
            data: "1234567890".data(using: String.Encoding.utf8)!,
            bucket: generalTestBucket,
            key: "any-file-which-gets-rejected.txt",
            contentType: "text/plain",
            expression: nil,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNotNil(task.error)
                expectation.fulfill()
                return nil
            })
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testDownloadInvalidKeyAndCredentials() {
        let expectation = self.expectation(description: "The completion handler called.")
        
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "invalid")
        XCTAssertNotNil(transferUtility)
        let downloadExpression = AWSS3TransferUtilityDownloadExpression()
        
        downloadExpression.progressBlock = {(task, progress) in
            print("Download progress: ", progress.fractionCompleted)
        }
        
        let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
            XCTAssertNotNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.error)
            
            self.processServiceError(error)
            expectation.fulfill()
        }
        
        transferUtility?.downloadData(
            fromBucket: generalTestBucket,
            key: "some-non-existent-key-" + UUID().uuidString,
            expression: downloadExpression,
            completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                XCTAssertNil(task.error)
                return nil
            })
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testDownloadInvalidKey() {
        let expectation = self.expectation(description: "The completion handler called.")
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        let downloadExpression = AWSS3TransferUtilityDownloadExpression()
        
        downloadExpression.progressBlock = {(task, progress) in
            print("Download progress: ", progress.fractionCompleted)
        }
        
        let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
            XCTAssertNotNil(error)
            XCTAssertEqual(task.status, AWSS3TransferUtilityTransferStatusType.error)
            self.processServiceError(error)
            expectation.fulfill()
        }
        
        transferUtility?.downloadData(
            fromBucket: generalTestBucket,
            key: "some-non-existent-key-" + UUID().uuidString,
            expression: downloadExpression,
            completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                XCTAssertNil(task.error)
                return nil
            })
        
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }

    func processServiceError(_ error: Error?) {
        guard let err = error as NSError? else {
            return
        }
        
        let errorInfo = err.userInfo["Error"] as? [String: Any]
        if errorInfo != nil {
            print("Found error in response. Details are:")
            for element in errorInfo! {
                print(">> \(element.key): \(element.value)")
            }
            XCTAssertNotNil(errorInfo!["Code"])
            XCTAssertNotNil(errorInfo!["Message"])
          }
    }
    
    func testUploadAndDownloadDataMultipleClients() {
        let expectation = self.expectation(description: "The completion handler called.")
        var count = 0;
        
        let transferUtility = AWSS3TransferUtility.default()
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            
            XCTAssertNil(error)
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)
                
                let downloadExpression = AWSS3TransferUtilityDownloadExpression()
                downloadExpression.progressBlock = {(task, progress) in
                    print("Download progress: ", progress.fractionCompleted)
                }
            
                let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
                    if let HTTPResponse = task.response {
                        XCTAssertEqual(HTTPResponse.statusCode, 200)
                        count = count+1;
                    } else {
                        XCTFail()
                    }
                    if count >= 25 {
                    expectation.fulfill()
                    }
                }
                
                
                for i in 1...25 {
                    let serviceConfiguration = AWSServiceManager.default().defaultServiceConfiguration
                    let transferUtilityConfigurationWithRetry = AWSS3TransferUtilityConfiguration()
                    transferUtilityConfigurationWithRetry.isAccelerateModeEnabled = false
                    transferUtilityConfigurationWithRetry.retryLimit = 10
                    transferUtilityConfigurationWithRetry.multiPartConcurrencyLimit = 6
                    print("starting download \(i)");
                  
                    AWSS3TransferUtility.register(
                        with: serviceConfiguration!,
                        transferUtilityConfiguration: transferUtilityConfigurationWithRetry,
                        forKey: "with-retry\(i)"
                    ) { (error) in
                        XCTAssertNil(error)
                    }
                    sleep(1)
                    
                    let url = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("file\(i)")
                    let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry\(i)")
                    XCTAssertNotNil(transferUtility)
                    
                    transferUtility?.download(to: url!,
                        bucket: generalTestBucket,
                        key: "testDataForConcurrentDownloads.txt",
                        expression: downloadExpression,
                        completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                            XCTAssertNil(task.error)
                            return nil
                    })
                }
                    
            } else {
                XCTFail()
            }
        }
        var testData = "Test123456789"
        for _ in 1...10 {
            testData = testData + testData;
        }
        transferUtility.uploadData(
            testData.data(using: String.Encoding.utf8)!,
            bucket: generalTestBucket,
            key: "testDataForConcurrentDownloads.txt",
            contentType: "text/plain",
            expression: uploadExpression,
            completionHandler: uploadCompletionHandler
            ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)
                
                return nil
            })
        
        waitForExpectations(timeout: 450) { (error) in
            XCTAssertNil(error)
        }
    }
 
    func testUploadAndDownloadDataSingleClientMultipleFiles() {
        let expectation = self.expectation(description: "The completion handler called.")
        var completedTransfers = 0;
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
        XCTAssertNotNil(transferUtility)
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        
        var testData = "Test123456789"
        for _ in 1...10 {
            testData = testData + testData;
        }
        
        for i in 1...25 {
            let key = "testDataForConcurrentDownloads\(i).txt"
            let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
                XCTAssertNil(error)
                if ( error != nil ) {
                    completedTransfers = completedTransfers + 1
                    if ( completedTransfers >= 25 ) {
                        expectation.fulfill()
                    }
                    return
                }
                
                if let HTTPResponse = task.response {
                    XCTAssertEqual(HTTPResponse.statusCode, 200)

                    let timeout = DispatchTime.now() + .seconds(30)
                    while(!AWSS3TestHelper.checkIfObjectIsPresent(key, bucket: generalTestBucket)) {
                        if (DispatchTime.now() > timeout )  {
                            XCTFail("Could not verify uploaded key \(key)")
                            return;
                        }
                        sleep(1)
                    }

                    let downloadExpression = AWSS3TransferUtilityDownloadExpression()
                    downloadExpression.progressBlock = {(task, progress) in
                        print("Download progress: ", progress.fractionCompleted)
                    }
                    
                    let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
                        if let HTTPResponse = task.response {
                            XCTAssertEqual(HTTPResponse.statusCode, 200)
                            completedTransfers = completedTransfers+1;
                        } else {
                            XCTFail()
                        }
                        if completedTransfers >= 25 {
                            expectation.fulfill()
                        }
                    }
                    
                    let url = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("file\(i)")
                    let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "with-retry")
                    XCTAssertNotNil(transferUtility)
                    transferUtility?.download(to: url!,
                                            bucket: generalTestBucket,
                                            key: key,
                                     expression: downloadExpression,
                              completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                                        XCTAssertNil(task.error)
                                        return nil
                                      })
                    }
                }
            
                transferUtility?.uploadData(
                    testData.data(using: String.Encoding.utf8)!,
                    bucket: generalTestBucket,
                    key: key,
                    contentType: "text/plain",
                    expression: uploadExpression,
                    completionHandler: uploadCompletionHandler
                    ).continueWith (block: { (task) -> AnyObject? in
                        XCTAssertNil(task.error)
                        
                        return nil
                    })
        }
        
        waitForExpectations(timeout: 300) { (error) in
            XCTAssertNil(error)
        }
    }
    
    //Renamed method to disable test as it was flaky.
    func tstLargeFileUploadCredentialsExpired() {
        let expectation = self.expectation(description: "The completion handler called.")
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: "short-expiry")
        XCTAssertNotNil(transferUtility)
        //Create a large temp file;
        let filePath = NSTemporaryDirectory() + "testShortExpiryLargeFileUpload.tmp"
        var testData = "Test1234"
        for _ in 1...24 {
            testData = testData + testData;
        }
        let fileURL = URL(fileURLWithPath: filePath)
        FileManager.default.createFile(atPath: filePath, contents: testData.data(using: .utf8), attributes: nil)
        
        let uuid:(String) = UUID().uuidString
        let author:(String) = "integration test"
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.setValue(author, forRequestHeader: "x-amz-meta-author");
        expression.setValue(uuid, forRequestHeader: "x-amz-meta-id");
        expression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        //Create Completion Handler
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        var refUploadTask: AWSS3TransferUtilityUploadTask?
        transferUtility?.uploadFile(fileURL,
                                   bucket: generalTestBucket,
                                   key: "testShortExpiryLargeFileUpload.txt",
                                   contentType: "text/plain",
                                   expression: expression,
                                   completionHandler: uploadCompletionHandler)
            .continueWith { (task: AWSTask<AWSS3TransferUtilityUploadTask>) -> Any? in
                XCTAssertNil(task.error)
                XCTAssertNotNil(task.result)
                refUploadTask = task.result
                return nil
            }.waitUntilFinished()
        
        refUploadTask?.suspend()
        
        //Sleep for 3 seconds to make sure that the URL has expired.
        sleep(3)
        refUploadTask?.resume()
        waitForExpectations(timeout: 90) { (error) in
            XCTAssertNil(error)
        }
    }
    
    
    func testTransferUtilityCompletionHandler() {
        let serviceConfiguration = AWSServiceConfiguration(
            region: .EUWest1,
            credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider
        )
        
        let transferUtilityConfiguration = AWSS3TransferUtilityConfiguration()
        
        let expectation1 = self.expectation(description: "test1 register completion handler called")
        AWSS3TransferUtility.register(
            with: serviceConfiguration!,
            transferUtilityConfiguration: transferUtilityConfiguration,
            forKey: "test1") { (error) in
                XCTAssertNil(error)
                expectation1.fulfill()
        }
        wait(for:[expectation1], timeout: 2)
        
        let expectation2 = self.expectation(description: "test2 register completion handler called")
        AWSS3TransferUtility.register(
        with: serviceConfiguration!,
        forKey: "test2") { (error) in
            XCTAssertNil(error)
            expectation2.fulfill()
        }
        wait(for:[expectation2], timeout: 2)
        
        let expectation4 = self.expectation(description: "test4 register completion handler called")
        AWSS3TransferUtility.register(
            with: serviceConfiguration!,
            transferUtilityConfiguration: nil,
            forKey: "test4") { (error) in
                XCTAssertNil(error)
                expectation4.fulfill()
        }
        wait(for:[expectation4], timeout: 2)
    }
    
    func testGetTasks() {
        var uploadCount = 0;
        var mpUploadCount = 0;
        var downloadCount = 0;
        let key = UUID().uuidString
        let uploadsCompleted = self.expectation(description: "Uploads completed")
        let multiPartUploadsCompleted = self.expectation(description: "Multipart uploads completed")
        let downloadsCompleted = self.expectation(description: "Downloads completed")
        
        let serviceConfiguration = AWSServiceConfiguration(
            region: .USEast1,
            credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider
        )
        
        let transferUtilityConfiguration = AWSS3TransferUtilityConfiguration()
        
        AWSS3TransferUtility.register(
            with: serviceConfiguration!,
            transferUtilityConfiguration: transferUtilityConfiguration,
            forKey: key
        )
        
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: key)
        XCTAssertNotNil(transferUtility)
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            uploadCount = uploadCount + 1
            if ( uploadCount >= 3 ) {
                uploadsCompleted.fulfill()
            }
            return
        
        }
        
        let multiPartUploadExpression = AWSS3TransferUtilityMultiPartUploadExpression()
        multiPartUploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
      
        let multiPartUploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            mpUploadCount = mpUploadCount + 1
            if ( mpUploadCount >= 3 ) {
                multiPartUploadsCompleted.fulfill()
            }
            return
        }
        
        let downloadExpression = AWSS3TransferUtilityDownloadExpression()
        downloadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
            XCTAssertNil(error)
            downloadCount = downloadCount + 1
            if ( downloadCount >= 6 ) {
                downloadsCompleted.fulfill()
            }
            return
        }
        
        var testData = "Test123456789"
        for _ in 1...15 {
            testData = testData + testData;
        }
        
        //Upload 3 files
        for i in 1...3 {
            transferUtility?.uploadData(
                testData.data(using: String.Encoding.utf8)!,
                bucket: generalTestBucket,
                key: "testFileForGetTasks\(i).txt",
                contentType: "text/plain",
                expression: uploadExpression,
                completionHandler: uploadCompletionHandler
                ).continueWith (block: { (task) -> AnyObject? in
                    XCTAssertNil(task.error)
                    return nil
                })
            sleep(1)
        }
        XCTAssertEqual(transferUtility?.getUploadTasks().result!.count, 3)
        XCTAssertEqual(transferUtility?.getDownloadTasks().result!.count, 0)
        XCTAssertEqual(transferUtility?.getMultiPartUploadTasks().result!.count, 0)
        XCTAssertEqual(transferUtility?.getAllTasks().result!.count, 3)
        
        wait(for:[uploadsCompleted],  timeout: 60)
        
        //upload 3 more files using multipart
        for i in 4...6 {
            transferUtility?.uploadUsingMultiPart(
                data: testData.data(using: String.Encoding.utf8)!,
                bucket: generalTestBucket,
                key: "testFileForGetTasks\(i).txt",
                contentType: "text/plain",
                expression: multiPartUploadExpression,
                completionHandler: multiPartUploadCompletionHandler
                ).continueWith (block: { (task) -> AnyObject? in
                XCTAssertNil(task.error)
                return nil
                })
            sleep(1)
        }
        XCTAssertEqual(transferUtility?.getUploadTasks().result!.count, 3)
        XCTAssertEqual(transferUtility?.getDownloadTasks().result!.count, 0)
        XCTAssertEqual(transferUtility?.getMultiPartUploadTasks().result!.count, 3)
        XCTAssertEqual(transferUtility?.getAllTasks().result!.count, 3)
        wait(for:[multiPartUploadsCompleted],  timeout: 60)
        
        //Download 6 files
        for i in 1...6 {
            let url = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("file\(i)")
            transferUtility?.download(to: url!,
                                 bucket: generalTestBucket,
                                    key: "testFileForGetTasks\(i).txt",
                expression: downloadExpression,
                completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                    XCTAssertNil(task.error)
                    return nil
                })
            sleep(1)
        }
        XCTAssertEqual(transferUtility?.getUploadTasks().result!.count, 3)
        XCTAssertEqual(transferUtility?.getDownloadTasks().result!.count, 6)
        XCTAssertEqual(transferUtility?.getMultiPartUploadTasks().result!.count, 3)
        XCTAssertEqual(transferUtility?.getAllTasks().result!.count, 9)
        wait(for:[downloadsCompleted],  timeout: 120)
        
        AWSS3TransferUtility.remove(forKey: key)
        
    }
    
    func testReRegisterTransferUtility() {
        var uploadCount = 0;
        var mpUploadCount = 0;
        var downloadCount = 0;
        let key = UUID().uuidString
        let uploadsCompleted = self.expectation(description: "Uploads completed")
        let multiPartUploadsCompleted = self.expectation(description: "Multipart uploads completed")
        let downloadsCompleted = self.expectation(description: "Downloads completed")
      
        
        //Register the TU
        let serviceConfiguration = AWSServiceConfiguration(
            region: .USEast1,
            credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider
        )
        
        let transferUtilityConfiguration = AWSS3TransferUtilityConfiguration()
        
        AWSS3TransferUtility.register(
            with: serviceConfiguration!,
            transferUtilityConfiguration: transferUtilityConfiguration,
            forKey: key
        )
        
        //Do some work with the TU
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: key)
        XCTAssertNotNil(transferUtility)
        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        
        uploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let uploadCompletionHandler = { (task: AWSS3TransferUtilityUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            uploadCount = uploadCount + 1
            if ( uploadCount >= 3 ) {
                uploadsCompleted.fulfill()
            }
            return
            
        }
        
        let multiPartUploadExpression = AWSS3TransferUtilityMultiPartUploadExpression()
        multiPartUploadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let multiPartUploadCompletionHandler = { (task: AWSS3TransferUtilityMultiPartUploadTask, error: Error?) -> Void in
            XCTAssertNil(error)
            mpUploadCount = mpUploadCount + 1
            if ( mpUploadCount >= 3 ) {
                multiPartUploadsCompleted.fulfill()
            }
            return
        }
        
        let downloadExpression = AWSS3TransferUtilityDownloadExpression()
        downloadExpression.progressBlock = {(task, progress) in
            print("Upload progress: ", progress.fractionCompleted)
        }
        
        let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
            XCTAssertNil(error)
            downloadCount = downloadCount + 1
            if ( downloadCount >= 6 ) {
                downloadsCompleted.fulfill()
            }
            return
        }
        
        var testData = "Test123456789"
        for _ in 1...15 {
            testData = testData + testData;
        }
        
        //Upload 3 files
        for i in 1...3 {
            transferUtility?.uploadData(
                testData.data(using: String.Encoding.utf8)!,
                bucket: generalTestBucket,
                key: "testFileForGetTasks\(i).txt",
                contentType: "text/plain",
                expression: uploadExpression,
                completionHandler: uploadCompletionHandler
                ).continueWith (block: { (task) -> AnyObject? in
                    XCTAssertNil(task.error)
                    return nil
                })
            sleep(1)
        }
        XCTAssertEqual(transferUtility?.getUploadTasks().result!.count, 3)
        XCTAssertEqual(transferUtility?.getDownloadTasks().result!.count, 0)
        XCTAssertEqual(transferUtility?.getMultiPartUploadTasks().result!.count, 0)
        
        wait(for:[uploadsCompleted],  timeout: 60)
        
        //upload 3 more files using multipart
        for i in 4...6 {
            transferUtility?.uploadUsingMultiPart(
                data: testData.data(using: String.Encoding.utf8)!,
                bucket: generalTestBucket,
                key: "testFileForGetTasks\(i).txt",
                contentType: "text/plain",
                expression: multiPartUploadExpression,
                completionHandler: multiPartUploadCompletionHandler
                ).continueWith (block: { (task) -> AnyObject? in
                    XCTAssertNil(task.error)
                    return nil
                })
            sleep(1)
        }
        XCTAssertEqual(transferUtility?.getUploadTasks().result!.count, 3)
        XCTAssertEqual(transferUtility?.getDownloadTasks().result!.count, 0)
        XCTAssertEqual(transferUtility?.getMultiPartUploadTasks().result!.count, 3)
        wait(for:[multiPartUploadsCompleted],  timeout: 60)
        
        //Download 6 files
        for i in 1...6 {
            let url = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("file\(i)")
            transferUtility?.download(to: url!,
                                      bucket: generalTestBucket,
                                      key: "testFileForGetTasks\(i).txt",
                expression: downloadExpression,
                completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                    XCTAssertNil(task.error)
                    return nil
                })
            sleep(1)
        }
        XCTAssertEqual(transferUtility?.getUploadTasks().result!.count, 3)
        XCTAssertEqual(transferUtility?.getDownloadTasks().result!.count, 6)
        XCTAssertEqual(transferUtility?.getMultiPartUploadTasks().result!.count, 3)
        wait(for:[downloadsCompleted],  timeout: 120)
        
    
        //Remove the TU
        AWSS3TransferUtility.remove(forKey: key)
        
        //Wait for the underlying NSURLSession invalidation to go through.
        sleep(5)
        
        //Register again.
        AWSS3TransferUtility.register(
            with: serviceConfiguration!,
            transferUtilityConfiguration: transferUtilityConfiguration,
            forKey: key
        ){ (error) in
            XCTAssertNil(error, "Registration of TransferUtility succeeded.")
        }
    }

    func sha256(url: URL) -> Data? {
        do {
            let bufferSize = 1024 * 1024
            // Open file for reading:
            let file = try FileHandle(forReadingFrom: url)
            defer {
                file.closeFile()
            }
            
            // Create and initialize SHA256 context:
            var context = CC_SHA256_CTX()
            CC_SHA256_Init(&context)
            
            // Read up to `bufferSize` bytes, until EOF is reached, and update SHA256 context:
            while autoreleasepool(invoking: {
                // Read up to `bufferSize` bytes
                let data = file.readData(ofLength: bufferSize)
                if data.count > 0 {
                    data.withUnsafeBytes {
                        _ = CC_SHA256_Update(&context, $0.baseAddress, numericCast(data.count))
                    }
                    // Continue
                    return true
                } else {
                    // End of file
                    return false
                }
            }) { }
            
            // Compute the SHA256 digest:
            var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
            digest.withUnsafeMutableBytes {
                let d = $0.bindMemory(to: UInt8.self)
                _ = CC_SHA256_Final(d.baseAddress, &context)
            }
            
            return digest
        } catch {
            print(error)
            return nil
        }
    }

    func verifyContent(tu:AWSS3TransferUtility, bucket: String, key:String, hash:String, headerKeyValues:[String:String] = [:] ) {
        let filePath = NSTemporaryDirectory() + UUID().uuidString
        let fileURL = URL(fileURLWithPath: filePath)
        let downloadExpression = AWSS3TransferUtilityDownloadExpression()
      
        for(headerKey, headerValue) in headerKeyValues {
            downloadExpression.setValue(headerValue, forRequestHeader: headerKey)
        }
        
        downloadExpression.progressBlock = {(task, progress) in
            print("Download progress: ", progress.fractionCompleted)
        }
      
        let group = DispatchGroup()
        group.enter()
        
        let downloadCompletionHandler = { (task: AWSS3TransferUtilityDownloadTask, URL: Foundation.URL?, data: Data?, error: Error?) in
            if let HTTPResponse = task.response {
                XCTAssertEqual(HTTPResponse.statusCode, 200)
                if let digestData = self.sha256(url: fileURL) {
                    let calculatedHash = digestData.map { String(format: "%02hhx", $0) }.joined()
                    print ("Original Hash [", hash, "], Hash of Downloaded file [", calculatedHash, "]")
                    XCTAssertEqual(hash, calculatedHash)
                }
            } else {
                XCTFail()
            }
            group.leave()
        }
        
        tu.download(to: fileURL,
                bucket: bucket,
                   key: key,
                 expression: downloadExpression,
                 completionHandler: downloadCompletionHandler).continueWith(block: { (task) -> Any? in
                    XCTAssertNil(task.error)
                    return nil
                 })
        
        group.wait()
    }
}
