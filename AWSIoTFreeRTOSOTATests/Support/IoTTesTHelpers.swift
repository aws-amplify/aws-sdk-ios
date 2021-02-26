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

import Foundation
import AWSIoT

struct IoTTestHelpers {
    
    static var thingNameDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)!
        dateFormatter.dateFormat = "yyyy-MM-dd_HH:mm:ss-SSS"
        return dateFormatter
    }()

    // MARK: - Thing management

    /// Creates a Thing with `name`
    static func createThing(withName name: String,
                            attributes: [String: String]? = nil) throws {
        guard let attributePayload = AWSIoTAttributePayload() else {
            throw "Unable to create attributes"
        }
        attributePayload.attributes = attributes

        guard let request = AWSIoTCreateThingRequest() else {
            throw "Unable to create request"
        }
        request.thingName = name
        request.attributePayload = attributePayload

        let iot = AWSIoT.default()

        var responseFromTask: AWSIoTCreateThingResponse?
        iot.createThing(request).continueWith { task in
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

    static func deleteThing(withName name: String) throws {
        guard let request = AWSIoTDeleteThingRequest() else {
            throw "Unable to create request"
        }
        request.thingName = name

        let iot = AWSIoT.default()

        var responseFromTask: AWSIoTDeleteThingResponse?
        iot.deleteThing(request).continueWith { task in
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

    // MARK: - Derived topics and tokens

    /// clientToken is used in the counter that initializes the job, is passed back in the JobDocument, and used to
    /// request OTA data from the stream
    static func getClientToken(forThingName thingName: String) -> String {
        return "1:\(thingName)"
    }

    /// The topic to post a "ready" map to tell the OTA service to deliver the next block of data for the OTA job
    static func getDataTopic(forThingName thingName: String,
                             streamName: String) -> String {
        return "$aws/things/\(thingName)/streams/\(streamName)/get/cbor"
    }

    /// The topic to subscribe to receive CBOR-encoded job data
    static func getDataDownloadTopic(forThingName thingName: String,
                                     streamName: String) -> String {
        return "$aws/things/\(thingName)/streams/\(streamName)/data/cbor"
    }

    /// The topic to subscribe to be notified if a new job request is accepted. The response on this topic may not be a
    /// complete JobDocument if the Thing and Job are newly created.
    static func getOTAGetAcceptedJobTopic(forThingName thingName: String) -> String {
        return "$aws/things/\(thingName)/jobs/$next/get/accepted"
    }

    /// The topic to subscribe to be notified if a new job becomes available. This may never be invoked if a new job
    /// request can be immediately fulfilled, as in the case of a new job request for a Thing that already has a Pending
    /// job.
    static func getOTANotifyNextJobTopic(forThingName thingName: String) -> String {
        return "$aws/things/\(thingName)/jobs/notify-next"
    }

    /// The topic to which the client should publish a ready message after subscribing to the "/accepted" and
    /// "/notify-next" topics
    static func getOTAGetNextJobTopic(forThingName thingName: String) -> String {
        return "$aws/things/\(thingName)/jobs/$next/get"
    }

    static func getOTAUpdateJobTopic(forThingName thingName: String, jobId: String) -> String {
        return "$aws/things/\(thingName)/jobs/\(jobId)/update"
    }

    static func hexString(from data: Data) -> String {
        return hexString(from: [UInt8](data))
    }

    static func hexString(from byteArray: [UInt8]) -> String {
        if (byteArray.isEmpty) {
            return ""
        }

        let hexDigits = byteArray.map { String(format: "%02x", $0) }
        let hexString = hexDigits.joined()
        return hexString
    }
}

// MARK: - Extensions

extension String: Error { }

extension DispatchTimeInterval {
    init(timeInterval: TimeInterval) {
        let intValue = Int(timeInterval)
        self = .seconds(intValue)
    }
}
