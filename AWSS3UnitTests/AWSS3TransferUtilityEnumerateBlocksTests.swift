//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

import AWSCore
import AWSS3

class AWSS3TransferUtilityEnumerateBlocksTests: XCTestCase {
    enum Failure: Error {
        case unableToCreateServiceConfiguration
    }

    var transferUtility: AWSS3TransferUtility?

    override func setUpWithError() throws {
        guard transferUtility == nil else { return }
        let key = "UnitTests"
        guard let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: nil) else {
            throw Failure.unableToCreateServiceConfiguration
        }
        AWSS3TransferUtility.register(with: configuration, forKey: key)
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: key)
        self.transferUtility = transferUtility
    }

    // https://github.com/aws-amplify/aws-sdk-ios/issues/3725
    func testEnumerateToAssignBlocks() {
        guard let transferUtility = transferUtility else {
            XCTFail("Unable to unwrap Transfer Utility")
            return
        }
        let tasks = createTasks()
        populateTasks(transferUtility: transferUtility, tasks: tasks)

        var uploadProgressCount = 0
        var multiPartUploadProgressCount = 0
        var downloadProgressCount = 0

        var uploadCompletedCount = 0
        var multiPartUploadCompletedCount = 0
        var downloadCompletedCount = 0

        let blocks = AWSS3TransferUtilityBlocks { _, _ in
            uploadProgressCount += 1
        } multiPartUploadProgress: { _, _ in
            multiPartUploadProgressCount += 1
        } downloadProgress: { _, _ in
            downloadProgressCount += 1
        } uploadCompleted: { _, _ in
            uploadCompletedCount += 1
        } multiPartUploadCompleted: { _, _ in
            multiPartUploadCompletedCount += 1
        } downloadCompleted: { _, _, _, _ in
            downloadCompletedCount += 1
        }

        var reportedTotal = 0
        var completedTotal = 0

        // blocks are not attached yet so counts should stay at 0
        reportedTotal = reportProgress(tasks: tasks)
        completedTotal = completeAll(tasks: tasks)

        XCTAssertEqual(reportedTotal, 0)
        XCTAssertEqual(completedTotal, 0)

        XCTAssertEqual(uploadProgressCount, 0)
        XCTAssertEqual(multiPartUploadProgressCount, 0)
        XCTAssertEqual(downloadProgressCount, 0)

        XCTAssertEqual(uploadCompletedCount, 0)
        XCTAssertEqual(multiPartUploadCompletedCount, 0)
        XCTAssertEqual(downloadCompletedCount, 0)

        // assign blocks for progress and completion handlers
        transferUtility.enumerateToAssign(blocks: blocks)

        reportedTotal = reportProgress(tasks: tasks)

        XCTAssertEqual(reportedTotal, tasks.count)

        XCTAssertEqual(uploadProgressCount, 1)
        XCTAssertEqual(multiPartUploadProgressCount, 1)
        XCTAssertEqual(downloadProgressCount, 1)

        XCTAssertEqual(uploadCompletedCount, 0)
        XCTAssertEqual(multiPartUploadCompletedCount, 0)
        XCTAssertEqual(downloadCompletedCount, 0)

        completedTotal = completeAll(tasks: tasks)

        XCTAssertEqual(completedTotal, tasks.count)

        XCTAssertEqual(uploadCompletedCount, 1)
        XCTAssertEqual(multiPartUploadCompletedCount, 1)
        XCTAssertEqual(downloadCompletedCount, 1)
    }

    func testEnumerateToAssignBlocksWithNilBlocks() {
        guard let transferUtility = transferUtility else {
            XCTFail("Unable to unwrap Transfer Utility")
            return
        }
        let tasks = createTasks()
        populateTasks(transferUtility: transferUtility, tasks: tasks)

        let blocks = AWSS3TransferUtilityBlocks(
            uploadProgress: nil,
            multiPartUploadProgress: nil,
            downloadProgress: nil,
            uploadCompleted: nil,
            multiPartUploadCompleted: nil,
            downloadCompleted: nil)

        // assign blocks for progress and completion handlers
        transferUtility.enumerateToAssign(blocks: blocks)

        let reportedTotal = reportProgress(tasks: tasks)

        XCTAssertEqual(reportedTotal, 0)

        let completedTotal = completeAll(tasks: tasks)

        XCTAssertEqual(completedTotal, 0)
    }

    func testCancelAllTasks() {
        guard let transferUtility = transferUtility else {
            XCTFail("Unable to unwrap Transfer Utility")
            return
        }
        let tasks = createTasks()
        populateTasks(transferUtility: transferUtility, tasks: tasks)

        var cancelled: [Bool] = []

        cancelled = getCancelledState(tasks: tasks)

        cancelled.forEach {
            XCTAssertFalse($0)
        }

        transferUtility.cancelAll()

        cancelled = getCancelledState(tasks: tasks)

        cancelled.forEach {
            XCTAssertTrue($0)
        }
    }

    private func createTasks() -> [Any] {
        let uploadTask = AWSS3TransferUtilityUploadTask()
        let multipartUploadTask = AWSS3TransferUtilityMultiPartUploadTask()
        let downloadTask = AWSS3TransferUtilityDownloadTask()

        let tasks = [uploadTask, multipartUploadTask, downloadTask]

        let uploadExpression = AWSS3TransferUtilityUploadExpression()
        uploadTask.expression = uploadExpression

        let multipartUploadExpression = AWSS3TransferUtilityMultiPartUploadExpression()
        multipartUploadTask.expression = multipartUploadExpression

        let downloadExpression = AWSS3TransferUtilityDownloadExpression()
        downloadTask.expression = downloadExpression

        return tasks
    }

    private func populateTasks(transferUtility: AWSS3TransferUtility,
                               tasks: [Any]) {
        tasks.forEach { task in
            if let uploadTask = task as? AWSS3TransferUtilityUploadTask {
                transferUtility.taskDictionary.setObject(uploadTask, forKey: UUID().uuidString as NSCopying)
            } else if let multipartUploadTask = task as? AWSS3TransferUtilityMultiPartUploadTask {
                transferUtility.taskDictionary.setObject(multipartUploadTask, forKey: UUID().uuidString as NSCopying)
            } else if let downloadTask = task as? AWSS3TransferUtilityDownloadTask {
                transferUtility.taskDictionary.setObject(downloadTask, forKey: UUID().uuidString as NSCopying)
            }
        }
    }

    private func reportProgress(tasks: [Any]) -> Int {
        let progress = Progress(totalUnitCount: 100)
        progress.completedUnitCount = 10

        var count = 0

        tasks.forEach { task in
            if let uploadTask = task as? AWSS3TransferUtilityUploadTask,
               let progressBlock = uploadTask.expression?.progressBlock {
                progressBlock(uploadTask, progress)
                count += 1
            } else if let multipartUploadTask = task as? AWSS3TransferUtilityMultiPartUploadTask,
                      let progressBlock = multipartUploadTask.expression?.progressBlock {
                progressBlock(multipartUploadTask, progress)
                count += 1
            } else if let downloadTask = task as? AWSS3TransferUtilityDownloadTask,
                      let progressBlock = downloadTask.expression?.progressBlock {
                progressBlock(downloadTask, progress)
                count += 1
            }
        }

        return count
    }

    private func completeAll(tasks: [Any]) -> Int {
        let progress = Progress(totalUnitCount: 100)
        progress.completedUnitCount = 10

        var count = 0

        tasks.forEach { task in
            if let uploadTask = task as? AWSS3TransferUtilityUploadTask,
               let completionHandler = uploadTask.expression?.completionHandler {
                completionHandler(uploadTask, nil)
                count += 1
            } else if let multipartUploadTask = task as? AWSS3TransferUtilityMultiPartUploadTask,
                      let completionHandler = multipartUploadTask.expression?.completionHandler {
                completionHandler(multipartUploadTask, nil)
                count += 1
            } else if let downloadTask = task as? AWSS3TransferUtilityDownloadTask,
                      let completionHandler = downloadTask.expression?.completionHandler {
                completionHandler(downloadTask, nil, nil, nil)
                count += 1
            }
        }

        return count
    }

    private func getCancelledState(tasks: [Any]) -> [Bool] {
        let result: [Bool]  = tasks.reduce(into: []) { result, task in
            if let uploadTask = task as? AWSS3TransferUtilityUploadTask {
                result.append(uploadTask.status == .cancelled)
            } else if let multipartUploadTask = task as? AWSS3TransferUtilityMultiPartUploadTask {
                result.append(multipartUploadTask.status == .cancelled)
            } else if let downloadTask = task as? AWSS3TransferUtilityDownloadTask {
                result.append(downloadTask.status == .cancelled)
            }
        }

        return result
    }
}
