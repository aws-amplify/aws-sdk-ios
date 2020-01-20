//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
import AWSIoT

/// Tests to exercise Stream management (create, delete, list, describe). At this time, there is no documentation to
/// cover subscription to stream topics; the stream API is used by FreeRTOS to stream OTA jobs.
/// https://docs.aws.amazon.com/freertos/latest/userguide/freertos-ota-dev.html
class StreamTests: XCTestCase {

    static let dataManagerServiceKey = "OTATests-datamanager"

    static let streamId = "AFR_OTA-StreamTests-stream"
    static let sourceFileBucketName = "ios-sdk-iot-ota-integ-test"
    static let sourceFileKeyName = "ota_integ_test.bin"
    static let roleArn: String = {
        guard let dict = AWSTestUtility.getCredentialsJsonAsDictionary() else {
            return "ERROR: Unable to load credentials dictionary"
        }

        guard let arn = dict["iot-freertos-ota-role-arn"] else {
            return "ERROR: Unable to retrieve `iot-freertos-ota-role-arn` from dictionary"
        }

        return arn
    }()

    override static func setUp() {
        AWSDDLog.sharedInstance.logLevel = .debug
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)

        AWSTestUtility.setupCognitoCredentialsProvider()

        // Default IoT will be used for managing Things and Groups
        // IoT DataManager used to subscribe to topics must use the ATS-enabled data endpoint
        let defaultCredentialsProvider = AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider
        let endpointString = AWSTestUtility.getIoTEndPoint("iot-us-east1-endpoint")!
        let endpoint = AWSEndpoint(urlString: endpointString)

        // Stream create/describe/list operations do not use the custom endpoint specified by
        // `AWSTestUtility.getIoTEndPoint("iot-us-east1-endpoint")`. Instead, these operations go to the global service
        // URL (e.g., "iot.us-east-1.amazonaws.com"
        let iotConfig = AWSServiceConfiguration(region: .USEast1,
                                                endpoint: endpoint,
                                                credentialsProvider: defaultCredentialsProvider)!

        let lwt = AWSIoTMQTTLastWillAndTestament()
        lwt.message = "OTATest-lwt"
        lwt.topic = "OTATest-lwt-topic"
        lwt.qos = .messageDeliveryAttemptedAtLeastOnce

        let mqttConfig = AWSIoTMQTTConfiguration(keepAliveTimeInterval: 30.0,
                                                 baseReconnectTimeInterval: 1.0,
                                                 minimumConnectionTimeInterval: 20,
                                                 maximumReconnectTimeInterval: 8,
                                                 runLoop: .current,
                                                 runLoopMode: RunLoop.Mode.default.rawValue,
                                                 autoResubscribe: true,
                                                 lastWillAndTestament: lwt)

        AWSIoTDataManager.register(with: iotConfig,
                                   with: mqttConfig,
                                   forKey: dataManagerServiceKey)
    }

    override func setUp() {
        // Try to delete any pre-existing stream, to ensure a clean starting state. If we encounter a "stream already
        // exists" error, we'll ignore it.
        do {
            try StreamTests.deleteStream()
        } catch {
            print("Ignoring error deleting stream during setUp: \(error)")
        }
    }

    override func tearDown() {
        // Best-effort attempt to delete any stream created during this test, but we'll ignore errors
        do {
            try StreamTests.deleteStream()
        } catch {
            print("Ignoring error deleting stream during tearDown: \(error)")
        }
    }

    /// A formal test for the create stream function, although since this is called during "list", "delete" and
    /// "describe" tests, it's redundant
    func testCreateStream() throws {
        try StreamTests.createStream(for: self)
    }

    func testDescribeStream() throws {
        try StreamTests.createStream()

        guard let describeStreamRequest = AWSIoTDescribeStreamRequest() else {
            throw "Unable to create describeStreamRequest"
        }
        describeStreamRequest.streamId = StreamTests.streamId

        let iot = AWSIoT.default()

        var responseFromTask: AWSIoTDescribeStreamResponse?
        iot.describeStream(describeStreamRequest).continueWith { task in
            if let error = task.error {
                print("Error in createStream: \(error)")
                return nil
            }

            responseFromTask = task.result
            return nil
        }.waitUntilFinished()

        guard let response = responseFromTask else {
            throw "Result unexpectedly nil in createStream"
        }

        XCTAssertNotNil(response.streamInfo)
        XCTAssertNotNil(response.streamInfo?.streamArn)
    }

    func testListStreams() throws {
        try StreamTests.createStream()

        guard let listStreamsRequest = AWSIoTListStreamsRequest() else {
            throw "Unable to create listStreamsRequest"
        }
        listStreamsRequest.ascendingOrder = true
        listStreamsRequest.maxResults = 10

        let iot = AWSIoT.default()

        var responseFromTask: AWSIoTListStreamsResponse?
        iot.listStreams(listStreamsRequest).continueWith { task in
            if let error = task.error {
                print("Error in createStream: \(error)")
                return nil
            }

            responseFromTask = task.result
            return nil
        }.waitUntilFinished()

        guard let response = responseFromTask else {
            throw "Result unexpectedly nil in createStream"
        }

        XCTAssertNotNil(response.streams)
    }

    /// A formal test for the delete stream function, although since this is called during `tearDown`, it's redundant
    func testDeleteStream() throws {
        try StreamTests.createStream()

        try StreamTests.deleteStream(for: self)
    }

    // MARK: - Utilities

    /// Used to create a test stream prior to the describe, list, and delete tests above. The "create" test invokes
    /// the same service calls, but asserts at the end.
    static func createStream(for testCase: XCTestCase? = nil,
                             file: String = #file,
                             line: Int = #line) throws {
        guard let s3Location = AWSIoTS3Location() else {
            testCase?.recordFailure(withDescription: "Unable to create s3Location",
                                    inFile: file,
                                    atLine: line,
                                    expected: true)
            throw "Unable to create s3Location"
        }

        s3Location.bucket = StreamTests.sourceFileBucketName
        s3Location.key = StreamTests.sourceFileKeyName

        guard let fileToStream = AWSIoTStreamFile() else {
            testCase?.recordFailure(withDescription: "Unable to create file",
                                    inFile: file,
                                    atLine: line,
                                    expected: true)
            throw "Unable to create file"
        }

        fileToStream.fileId = 1
        fileToStream.s3Location = s3Location

        guard let createStreamRequest = AWSIoTCreateStreamRequest() else {
            testCase?.recordFailure(withDescription: "Unable to create createStreamRequest",
                                    inFile: file,
                                    atLine: line,
                                    expected: true)
            throw "Unable to create createStreamRequest"
        }

        createStreamRequest.streamId = StreamTests.streamId
        createStreamRequest.detail = "\(StreamTests.streamId) stream for integration test"
        createStreamRequest.roleArn = StreamTests.roleArn
        createStreamRequest.files = [fileToStream]

        let iot = AWSIoT.default()

        var responseFromTask: AWSIoTCreateStreamResponse?
        iot.createStream(createStreamRequest).continueWith { task in
            if let error = task.error {
                testCase?.recordFailure(withDescription: "Error in createStream: \(error)",
                    inFile: file,
                    atLine: line,
                    expected: true)
                return nil
            }

            responseFromTask = task.result
            return nil
        }.waitUntilFinished()

        guard responseFromTask != nil else {
            testCase?.recordFailure(withDescription: "Result unexpectedly nil in createStream",
                                    inFile: file,
                                    atLine: line,
                                    expected: true)
            throw "Result unexpectedly nil in createStream"
        }

    }

    static func deleteStream(for testCase: XCTestCase? = nil,
                             file: String = #file,
                             line: Int = #line) throws {
        guard let deleteStreamRequest = AWSIoTDeleteStreamRequest() else {
            testCase?.recordFailure(withDescription: "Unable to create deleteStreamRequest",
                                    inFile: file,
                                    atLine: line,
                                    expected: true)
            throw "Unable to create deleteStreamRequest"
        }
        deleteStreamRequest.streamId = StreamTests.streamId

        let iot = AWSIoT.default()

        var responseFromTask: AWSIoTDeleteStreamResponse?
        iot.deleteStream(deleteStreamRequest).continueWith { task in
            if let error = task.error {
                testCase?.recordFailure(withDescription: "Error in deleteStream: \(error)",
                    inFile: file,
                    atLine: line,
                    expected: true)
                return nil
            }

            responseFromTask = task.result
            return nil
        }.waitUntilFinished()

        guard responseFromTask != nil else {
            testCase?.recordFailure(withDescription: "Result unexpectedly nil in deleteStream",
                                    inFile: file,
                                    atLine: line,
                                    expected: true)
            throw "Result unexpectedly nil in deleteStream"
        }

    }
}
