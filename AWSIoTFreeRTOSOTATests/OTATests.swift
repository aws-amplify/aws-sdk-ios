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

class OTATests: XCTestCase {

    /// Expectatioun timeout value for any network operations
    static let networkTimeout: TimeInterval = 120

    static let dataManagerServiceKey = "OTATests-datamanager"

    /// Membership in this Thing Group will cause the OTA job to be queued for the thing
    static let thingGroupName = "OTA_INTEG_TEST"

    // MARK: - Thing properties

    let thingName: String = {
        let timestamp = IoTTestHelpers.thingNameDateFormatter.string(from: Date())
        return "OTATests-TestThing-\(timestamp)"
    }()

    // MARK: - Test lifecycle

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

    override static func tearDown() {
        AWSIoT.remove(forKey: dataManagerServiceKey)
    }

    override func tearDown() {
        // Make a best effort attempt to delete the thing created for the tests below, but ignore any errors encountered
        // during the operation
        do {
            try IoTTestHelpers.deleteThing(withName: thingName)
        } catch {
            print("Ignoring error deleting thing: \(error)")
        }
    }

    // MARK: - Test

    /// - Given: A Thing added to an OTA-enabled group
    /// - When: I notify the system I am ready to receive an OTA job
    /// - Then: I am able to process a complete OTA job payload from start to finish
    func testFullOTAJob() throws {
        try IoTTestHelpers.createThing(withName: thingName)
        try OTATests.addThingToOTAGroup(thingName: thingName)
        let otaJobResponse = try OTATests.startOTAJob(for: thingName, testCase: self)

        let clientToken = IoTTestHelpers.getClientToken(forThingName: thingName)

        var otaFilePayload = OTAFilePayload(clientToken: clientToken, file: otaJobResponse.firstFile)

        let otaDataCallback: AWSIoTMQTTNewMessageBlock = { data in
            do {
                let byteArray = [UInt8](data)
                guard let cbor = try CBOR.decode(byteArray) else {
                    throw "Unable to decode CBOR in data callback"
                }

                guard let response = OTABlockResponse(fromCBOR: cbor) else {
                    throw "Unable to create response from cbor: \(cbor)"
                }

                otaFilePayload.fulfill(response: response)
            } catch {
                print("Unable to decode reponse: \(error)")
            }
        }

        let manager = AWSIoTDataManager(forKey: OTATests.dataManagerServiceKey)

        let dataDownloadTopic = IoTTestHelpers.getDataDownloadTopic(forThingName: thingName,
                                                                    streamName: otaJobResponse.streamName)

        let dataSubscriptionAcknowledged = DispatchSemaphore(value: 0)
        let dataSubscriptionACKCallback: AWSIoTMQTTAckBlock = {
            dataSubscriptionAcknowledged.signal()
        }

        // Wrap up the test
        defer {
            manager.unsubscribeTopic(dataDownloadTopic)
            manager.disconnect()

            // Wait a few seconds for the unsubscribe to finish, so we don't incur any bad access errors in the test
            sleep(3)
        }

        DispatchQueue.global().async {
            manager.subscribe(toTopic: dataDownloadTopic,
                              qoS: .messageDeliveryAttemptedAtMostOnce,
                              messageCallback: otaDataCallback,
                              ackCallback: dataSubscriptionACKCallback)
        }

        _ = dataSubscriptionAcknowledged
            .wait(timeout: .now() + DispatchTimeInterval(timeInterval: OTATests.networkTimeout))

        let jobDeadline = Date(timeIntervalSinceNow: OTATests.networkTimeout)
        while Date() < jobDeadline && otaFilePayload.unfufilledBlockCount > 0 {
            let windowRequest = otaFilePayload.nextWindowRequest()

            // Uncomment the line below to view the windowRequest--this is especially useful for seeing the bitmap
            // used to request the next set of blocks from the service.
            // print("windowRequest: \(windowRequest.debugDescription)")
            let windowRequestCBOR = windowRequest.cborEncoded

            let deadline = Date(timeIntervalSinceNow: 2.5)
            let expectedUnfulfilledBlocksAfterWindow = otaFilePayload.unfufilledBlockCount - windowRequest.numBlocks

            let getDataTopic = IoTTestHelpers.getDataTopic(forThingName: thingName,
                                                           streamName: otaJobResponse.streamName)

            manager.publishData(windowRequestCBOR,
                                onTopic: getDataTopic,
                                qoS: .messageDeliveryAttemptedAtMostOnce)

            // Wait for window to process, or for deadline to expire. If the deadline expires before we process all
            // blocks in the window, we'll re-request the block from the service
            while Date() < deadline && otaFilePayload.unfufilledBlockCount > expectedUnfulfilledBlocksAfterWindow {
                print("\(Date()) < \(deadline); \(otaFilePayload.unfufilledBlockCount) > \(expectedUnfulfilledBlocksAfterWindow)")
                sleep(1)
            }

        }

        XCTAssertEqual(otaFilePayload.unfufilledBlockCount, 0, "All blocks should be fulfilled at the end of the OTA job")

        var actualPayloadBytes = [UInt8]()
        otaFilePayload.responses.compactMap { $0 }.forEach {
            actualPayloadBytes.append(contentsOf: $0.payload)
        }
        let actualData = Data(actualPayloadBytes)

        let expectedDataPath = Bundle(for: type(of: self)).path(forResource: "ota_integ_test", ofType: "bin")!
        let expectedDataURL = URL(fileURLWithPath: expectedDataPath)
        let expectedData = try! Data(contentsOf: expectedDataURL)

        XCTAssertEqual(actualData, expectedData)

        // Send completion message
        let completionMessage = #"{"status":"succeeded","statusDetails":{"reason":"accepted v1.0.0"}}"#
        let completionTopic = IoTTestHelpers.getOTAUpdateJobTopic(forThingName: thingName,
                                                                  jobId: otaJobResponse.execution.jobId)
        manager.publishString(completionMessage,
                              onTopic: completionTopic,
                              qoS: .messageDeliveryAttemptedAtMostOnce)
    }

    // MARK: - Utilities

    static func addThingToOTAGroup(thingName: String) throws {
        guard let request = AWSIoTAddThingToThingGroupRequest() else {
            throw "Unable to create request"
        }

        request.thingName = thingName
        request.thingGroupName = OTATests.thingGroupName

        let iot = AWSIoT.default()

        var responseFromTask: AWSIoTAddThingToThingGroupResponse?
        iot.addThing(toThingGroup: request).continueWith { task in
            if let error = task.error {
                print("Error in task: \(error)")
                return nil
            }

            responseFromTask = task.result
            return nil
        }.waitUntilFinished()

        guard responseFromTask != nil else {
            throw "Response unexpectedly nil"
        }
    }

    static func startOTAJob(for thingName: String,
                            testCase: XCTestCase? = nil,
                            file: String = #file,
                            line: Int = #line) throws -> OTAJobResponse {

        let manager = AWSIoTDataManager(forKey: OTATests.dataManagerServiceKey)

        let connected = DispatchSemaphore(value: 0)
        manager.connectUsingWebSocket(withClientId: thingName, cleanSession: true) { status in
            switch status {
            case .connected:
                connected.signal()
            default:
                break;
            }
        }
        _ = connected.wait(timeout: .now()
            + DispatchTimeInterval(timeInterval: OTATests.networkTimeout))

        let allSubscriptionsAcknowledged = DispatchGroup()

        let acceptedACKCallback: AWSIoTMQTTAckBlock = {
            allSubscriptionsAcknowledged.leave()
        }

        let notifyNextACKCallback: AWSIoTMQTTAckBlock = {
            allSubscriptionsAcknowledged.leave()
        }

        // We could receive this document on either the /accepted or /notify-next callback, so we simply wait for it to
        // be received by one of them by reusing the callback. Subsequent invocations of the callback will have no
        // meaningful effect.
        var otaJobResponseFromResponse: OTAJobResponse?
        let otaJobResponseReceived = DispatchSemaphore(value: 0)

        let jobDocumentCallback: AWSIoTMQTTExtendedNewMessageBlock = { mqttClient, topic, data in
            do {
                let stringFromData = String(data: data, encoding: .utf8) ?? "<unable to decode>"
                print("Received response on \(topic): \(stringFromData)")
                otaJobResponseFromResponse = try OTAJobResponse(jsonData: data)
                print("jobId \(otaJobResponseFromResponse!.execution.jobId) is ready")
                otaJobResponseReceived.signal()
            } catch {
                // Uncomment lines below to view decoding errors. These are innocuous during normal test execution,
                // since the first response for a newly-created job won't include all the response info needed to
                // deserialize.
                // let stringFromData = String(data: data, encoding: .utf8) ?? "(unable to decode)"
                // print("Callback received on \(topic), but could not extract jobID: \(error); data: \(stringFromData)")
                return
            }
        }

        allSubscriptionsAcknowledged.enter()
        manager.subscribe(toTopic: IoTTestHelpers.getOTAGetAcceptedJobTopic(forThingName: thingName),
                          qoS: .messageDeliveryAttemptedAtMostOnce,
                          extendedCallback: jobDocumentCallback,
                          ackCallback: acceptedACKCallback)

        allSubscriptionsAcknowledged.enter()
        manager.subscribe(toTopic: IoTTestHelpers.getOTANotifyNextJobTopic(forThingName: thingName),
                          qoS: .messageDeliveryAttemptedAtMostOnce,
                          extendedCallback: jobDocumentCallback,
                          ackCallback: notifyNextACKCallback)

        _ = allSubscriptionsAcknowledged
            .wait(timeout: .now() + DispatchTimeInterval(timeInterval: OTATests.networkTimeout))

        // Both subscriptions are active, now publish a "ready" message
        let clientToken = IoTTestHelpers.getClientToken(forThingName: thingName)
        manager.publishString(#"{"clientToken":"\#(clientToken)"}"#,
            onTopic: IoTTestHelpers.getOTAGetNextJobTopic(forThingName: thingName),
            qoS: .messageDeliveryAttemptedAtMostOnce)

        _ = otaJobResponseReceived
            .wait(timeout: .now() + DispatchTimeInterval(timeInterval: OTATests.networkTimeout))

        guard let otaJobResponse = otaJobResponseFromResponse else {
            testCase?.recordFailure(withDescription: "otaJobResponse should not be nil",
                                    inFile: file,
                                    atLine: line,
                                    expected: true)
            throw "otaJobResponse should not be nil"
        }

        return otaJobResponse
    }

}
