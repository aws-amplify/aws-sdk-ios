//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    /*
     A base64 encoded representation of the raw event data for a transcript event:
        {
          "Transcript": {
            "Results": [
              {
                "Alternatives": [
                  {
                    "Items": [
                      {
                        "Content": "Hello",
                        "EndTime": 0.21,
                        "StartTime": 0.12,
                        "Type": "pronunciation"
                      },
                      {
                        "Content": "were",
                        "EndTime": 0.49,
                        "StartTime": 0.22,
                        "Type": "pronunciation"
                      }
                    ],
                    "Transcript": "Hello were"
                  }
                ],
                "EndTime": 0.53,
                "IsPartial": true,
                "ResultId": "94862f4a-3793-4e5b-8e85-1915c8d33f92",
                "StartTime": 0.12
              }
            ]
          }
        }
    */

    let transcript_event_data = Data(base64Encoded: "AAABsgAAAFXfePLDCzpldmVudC10eXBlBwAPVHJhbnNjcmlwdEV2ZW50DTpjb250ZW50LXR5cGUHABBhcHBsaWNhdGlvbi9qc29uDTptZXNzYWdlLXR5cGUHAAVldmVudHsiVHJhbnNjcmlwdCI6eyJSZXN1bHRzIjpbeyJBbHRlcm5hdGl2ZXMiOlt7Ikl0ZW1zIjpbeyJDb250ZW50IjoiSGVsbG8iLCJFbmRUaW1lIjowLjIxLCJTdGFydFRpbWUiOjAuMTIsIlR5cGUiOiJwcm9udW5jaWF0aW9uIn0seyJDb250ZW50Ijoid2VyZSIsIkVuZFRpbWUiOjAuNDksIlN0YXJ0VGltZSI6MC4yMiwiVHlwZSI6InByb251bmNpYXRpb24ifV0sIlRyYW5zY3JpcHQiOiJIZWxsbyB3ZXJlIn1dLCJFbmRUaW1lIjowLjUzLCJJc1BhcnRpYWwiOnRydWUsIlJlc3VsdElkIjoiOTQ4NjJmNGEtMzc5My00ZTViLThlODUtMTkxNWM4ZDMzZjkyIiwiU3RhcnRUaW1lIjowLjEyfV19fRMshLQ=")!

    // BadRequestException
    let transcript_error_data = Data(base64Encoded: "AAAAxwAAAGEEorpsDzpleGNlcHRpb24tdHlwZQcAE0JhZFJlcXVlc3RFeGNlcHRpb24NOmNvbnRlbnQtdHlwZQcAEGFwcGxpY2F0aW9uL2pzb24NOm1lc3NhZ2UtdHlwZQcACWV4Y2VwdGlvbnsiTWVzc2FnZSI6IllvdXIgcmVxdWVzdCB0aW1lZCBvdXQgYmVjYXVzZSBubyBuZXcgYXVkaW8gd2FzIHJlY2VpdmVkIGZvciAxNSBzZWNvbmRzLiJ9PblBbw==")!

    func testEventReceivedOnSpecifiedQueue() {
        let key = DispatchSpecificKey<UUID>()
        let uuid = UUID()
        let callbackQueue = DispatchQueue(label: "testEventReceivedOnSpecifiedQueue")
        callbackQueue.setSpecific(key: key, value: uuid)

        let delegate = MockDelegate()
        let callbackInvokedOnSpecifiedQueue = expectation(description: "Callback was received on specified queue")

        delegate.receiveEventCallback = { _, _ in
            if DispatchQueue.getSpecific(key: key) == uuid {
                callbackInvokedOnSpecifiedQueue.fulfill()
            }
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: callbackQueue)
        adaptor.webSocket(nil, didReceiveMessage: transcript_event_data)
        waitForExpectations(timeout: 0.1)
    }
    
    func testConnectionStatusDidChangeReceivedOnSpecifiedQueue() {
        let key = DispatchSpecificKey<UUID>()
        let uuid = UUID()
        let callbackQueue = DispatchQueue(label: "testConnectionStatusDidChangeReceivedOnSpecifiedQueue")
        callbackQueue.setSpecific(key: key, value: uuid)
        
        let delegate = MockDelegate()
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

    func testDecodesEventStreamWithTranscriptionEventPayload() {
        let delegate = MockDelegate()
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
        adaptor.webSocket(nil, didReceiveMessage: transcript_event_data)

        waitForExpectations(timeout: 0.1)
    }
    
    func testDecodesEventStreamWithErrorPayload() {
        let delegate = MockDelegate()
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
        adaptor.webSocket(nil, didReceiveMessage: transcript_error_data)

        waitForExpectations(timeout: 0.1)
    }

    /// Given: An adaptor with a delegate
    /// When: The adaptor's `didFailWithError` method is propagated with an error
    /// Then: the delegate receives the raw, untranslated error information
    func testDidFailWithErrorPropagatesRawErrorInformation() {
        let delegate = MockDelegate()
        let receivedErrorCallback = expectation(description: "Received error callback")

        delegate.connectionStatusCallback = { _, error in
            guard let error = error as NSError? else {
                XCTFail("Error unexpectedly nil in connectionStatusCallback")
                return
            }

            XCTAssertEqual(error.domain, AWSSRWebSocketErrorDomain)
            XCTAssertEqual(error.code, 1234)

            receivedErrorCallback.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        let error = NSError(domain: AWSSRWebSocketErrorDomain,
                            code: 1234,
                            userInfo: nil)
        adaptor.webSocket(nil, didFailWithError: error)

        waitForExpectations(timeout: 0.1)
    }

    /// Given: An adaptor with a delegate
    /// When: The adaptor's `didFailWithError` method is propagated with an error
    /// Then: the delegate receives the raw, untranslated error information
    func testDidCloseWithCodeTranslatesErrorInformation() {
        let delegate = MockDelegate()
        let receivedErrorCallback = expectation(description: "Received error callback")

        delegate.connectionStatusCallback = { _, error in
            guard let error = error as NSError? else {
                XCTFail("Error unexpectedly nil in connectionStatusCallback")
                return
            }

            XCTAssertEqual(error.domain, AWSTranscribeStreamingClientErrorDomain)
            XCTAssertEqual(error.code, AWSTranscribeStreamingClientErrorCode.webSocketClosedUnexpectedly.rawValue)

            receivedErrorCallback.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        adaptor.webSocket(nil,
                          didCloseWithCode: AWSSRStatusCodeGoingAway.rawValue,
                          reason: "Test reason",
                          wasClean: false)

        waitForExpectations(timeout: 0.1)
    }

    func testConnectionDidChangeErrorIsNilForCleanlyClosed() {
        let delegate = MockDelegate()
        let receivedErrorCallback = expectation(description: "Received error callback")

        delegate.connectionStatusCallback = { status, error in
            if let error = error {
                XCTFail("Unexpected error in testConnectionDidChangeErrorIsNilForCleanlyClosed: \(error)")
                return
            }
            XCTAssertEqual(status, AWSTranscribeStreamingClientDelegateConnectionStatus.closed)
            receivedErrorCallback.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        adaptor.webSocket(nil,
                          didCloseWithCode: AWSSRStatusCodeGoingAway.rawValue,
                          reason: "Test reason",
                          wasClean: true)

        waitForExpectations(timeout: 0.1)
    }
    
}

class MockDelegate: NSObject, AWSTranscribeStreamingClientDelegate {
    var receiveEventCallback: ((AWSTranscribeStreamingTranscriptResultStream?, Error?) -> Void)?
    var connectionStatusCallback: ((AWSTranscribeStreamingClientDelegateConnectionStatus, Error?) -> Void)?

    func didReceiveEvent(_ event: AWSTranscribeStreamingTranscriptResultStream?, decodingError: Error?) {
        receiveEventCallback?(event, decodingError)
    }
    
    func connectionStatusDidChange(_ connectionStatus: AWSTranscribeStreamingClientDelegateConnectionStatus,
                                   withError error: Error?) {
        connectionStatusCallback?(connectionStatus, error)
    }
}
