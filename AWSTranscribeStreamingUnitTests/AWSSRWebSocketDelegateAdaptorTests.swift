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

@testable import AWSTranscribeStreaming

class AWSSRWebSocketDelegateAdaptorTests: XCTestCase {

    // MARK: - General callback tests

    /// - Given: an adaptor with a delegate
    /// - When: The adaptor is constructed specifying a dispatch queue
    /// - Then: The delegate's `didReceiveEvent(_:decodingError:)` method is invoked on the specified queue
    func testEventReceivedOnSpecifiedQueue() {
        let key = DispatchSpecificKey<UUID>()
        let uuid = UUID()
        let callbackQueue = DispatchQueue(label: "testEventReceivedOnSpecifiedQueue")
        callbackQueue.setSpecific(key: key, value: uuid)

        let delegate = MockTranscribeStreamingClientDelegate()
        let callbackInvokedOnSpecifiedQueue = expectation(description: "Callback was received on specified queue")

        delegate.receiveEventCallback = { _, _ in
            if DispatchQueue.getSpecific(key: key) == uuid {
                callbackInvokedOnSpecifiedQueue.fulfill()
            }
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: callbackQueue)
        adaptor.webSocket(nil, didReceiveMessage: TestData.transcriptEventData)
        waitForExpectations(timeout: 0.1)
    }
    
    /// - Given: an adaptor with a delegate
    /// - When: The adaptor is constructed specifying a dispatch queue
    /// - Then: The delegate's `connectionStatusDidChange(_:withError:)` method is invoked on the specified queue
    func testConnectionStatusDidChangeReceivedOnSpecifiedQueue() {
        let key = DispatchSpecificKey<UUID>()
        let uuid = UUID()
        let callbackQueue = DispatchQueue(label: "testConnectionStatusDidChangeReceivedOnSpecifiedQueue")
        callbackQueue.setSpecific(key: key, value: uuid)
        
        let delegate = MockTranscribeStreamingClientDelegate()
        let callbackInvokedOnSpecifiedQueue = expectation(description: "Callback was received on specified queue")

        delegate.connectionStatusCallback = { _, _ in
            if DispatchQueue.getSpecific(key: key) == uuid {
                callbackInvokedOnSpecifiedQueue.fulfill()
            }
        }
        
        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: callbackQueue)
        adaptor.webSocketDidOpen(nil)
        waitForExpectations(timeout: 0.1)
    }

    // MARK: - webSocket:didReceiveMessage:

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's receives an event with a transcription event
    /// - Then: The delegate receives an event callback with transcription content
    func testDecodesEventStreamWithTranscriptionEventPayload() {
        let delegate = MockTranscribeStreamingClientDelegate()
        let receivedEventCallback = expectation(description: "Received event callback")
        
        delegate.receiveEventCallback = { event, _ in
            guard let event = event else {
                XCTFail("event unexpectedly nil")
                return
            }
            
            XCTAssertEqual(event.transcriptEvent?.transcript?.results?.first?.alternatives?.first?.items?.first?.content, "Hello")
            receivedEventCallback.fulfill()
        }
        
        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())
        adaptor.webSocket(nil, didReceiveMessage: TestData.transcriptEventData)

        waitForExpectations(timeout: 0.1)
    }

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didReceiveMessage:]` method is invoked with a payload of error type
    /// - Then: the delegate receives the raw, untranslated error information
    func testDecodesEventStreamWithErrorPayload() {
        let delegate = MockTranscribeStreamingClientDelegate()
        let eventContainsErrorPayload = expectation(description: "Event contains error payload")

        delegate.receiveEventCallback = { event, error in
            if let error = error {
                XCTFail("Unexpected decoding error in receiveEventCallback: \(error)")
                return
            }

            guard let event = event else {
                XCTFail("event unexpectedly nil")
                return
            }

            XCTAssertNotNil(event.badRequestException)
            eventContainsErrorPayload.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())
        adaptor.webSocket(nil, didReceiveMessage: TestData.transcriptErrorEvent)

        waitForExpectations(timeout: 0.1)
    }

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didReceiveMessage:]` method is invoked with junk data that is below the
    ///   minimum length specified by the protocol
    /// - Then: the delegate receives a AWSTranscribeStreamingClientErrorCodeEventSerializationError
    func testEventStreamWithShortJunkData() {
        let delegate = MockTranscribeStreamingClientDelegate()
        let callbackInvoked = expectation(description: "receiveEventCallback invoked")

        delegate.receiveEventCallback = { event, error in
            if let event = event {
                XCTFail("Event should not be present: \(event)")
                return
            }

            guard let error = error as NSError? else {
                XCTFail("error unexpectedly nil")
                return
            }

            XCTAssertEqual(error.code, AWSTranscribeStreamingClientErrorCode.invalidMessagePrelude.rawValue)
            callbackInvoked.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        let shortData = Data(repeating: 0x01, count: 4)
        adaptor.webSocket(nil, didReceiveMessage: shortData)

        waitForExpectations(timeout: 0.1)
    }

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didReceiveMessage:]` method is invoked with junk data that is below the
    ///   minimum length specified by the protocol
    /// - Then: the delegate receives a AWSTranscribeStreamingClientErrorCodeEventSerializationError
    func testEventStreamWithJunkData() {
        let delegate = MockTranscribeStreamingClientDelegate()
        let callbackInvoked = expectation(description: "receiveEventCallback invoked")

        delegate.receiveEventCallback = { event, error in
            if let event = event {
                XCTFail("Event should not be present: \(event)")
                return
            }

            guard let error = error as NSError? else {
                XCTFail("error unexpectedly nil")
                return
            }

            XCTAssertEqual(error.code, AWSTranscribeStreamingClientErrorCode.invalidMessageLengthHeader.rawValue)
            callbackInvoked.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())
        let junkData = Data(repeating: 0x01, count: 100)
        adaptor.webSocket(nil, didReceiveMessage: junkData)

        waitForExpectations(timeout: 0.1)
    }

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didReceivePong:]` method is invoked
    /// - Then: the delegate receives no callback, and the app does not crash
    func testIgnoresPong() {
        let delegate = MockTranscribeStreamingClientDelegate()

        let receiveEventNotInvoked = expectation(description: "didReceiveEvent callback was not invoked")
        receiveEventNotInvoked.isInverted = true
        delegate.receiveEventCallback = { _, _ in
            receiveEventNotInvoked.fulfill()
        }

        let connectionStatusNotInvoked = expectation(description: "connectionStatus callback was not invoked")
        connectionStatusNotInvoked.isInverted = true
        delegate.connectionStatusCallback = { _, _ in
            connectionStatusNotInvoked.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        adaptor.webSocket(nil, didReceivePong: Data())

        waitForExpectations(timeout: 0.1)
    }

}
