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

class AWSSRWebSocketDelegateAdaptorDidCloseTests: XCTestCase {

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didCloseWithCode:reason:wasClean:]` method is invoked with an error and
    ///         `wasClean` = false
    /// - Then: the delegate receives the raw, untranslated error information
    func testTranslatesErrorInformation() {
        let delegate = MockTranscribeStreamingClientDelegate()
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

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didCloseWithCode:reason:wasClean:]` method is invoked with `wasClean` = true
    /// - Then: the delegate receives a `closed` status and no error
    func testErrorIsNilForCleanlyClosed() {
        let delegate = MockTranscribeStreamingClientDelegate()
        let receivedStatusCallback = expectation(description: "Received status callback")

        delegate.connectionStatusCallback = { status, error in
            if let error = error {
                XCTFail("Unexpected error in testConnectionDidChangeErrorIsNilForCleanlyClosed: \(error)")
                return
            }
            XCTAssertEqual(status, AWSTranscribeStreamingClientConnectionStatus.closed)
            receivedStatusCallback.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        adaptor.webSocket(nil,
                          didCloseWithCode: AWSSRStatusCodeGoingAway.rawValue,
                          reason: "Test reason",
                          wasClean: true)

        waitForExpectations(timeout: 0.1)
    }

    // MARK: - Test specific AWSSRStatusCode translations

    func testCloseCodeUnknown() {
        assertDelegateReceivesError(
            withExpectedCode: AWSTranscribeStreamingClientErrorCode.unknown.rawValue,
            fromCloseCode: -999
        )
    }

    func testCloseCodeNormal() {
        assertDelegateReceivesError(
            withExpectedCode: AWSTranscribeStreamingClientErrorCode.unknown.rawValue,
            fromCloseCode: AWSSRStatusCodeNormal.rawValue
        )
    }

    func testCloseCodeGoingAway() {
        assertDelegateReceivesError(
            withExpectedCode: AWSTranscribeStreamingClientErrorCode.webSocketClosedUnexpectedly.rawValue,
            fromCloseCode: AWSSRStatusCodeGoingAway.rawValue
        )
    }

    func testCloseCodeProtocolError() {
        assertDelegateReceivesError(
            withExpectedCode: AWSTranscribeStreamingClientErrorCode.webSocketProtocolError.rawValue,
            fromCloseCode: AWSSRStatusCodeProtocolError.rawValue
        )
    }

    func testCloseCodeUnhandledType() {
        assertDelegateReceivesError(
            withExpectedCode: AWSTranscribeStreamingClientErrorCode.webSocketClosedUnexpectedly.rawValue,
            fromCloseCode: AWSSRStatusCodeUnhandledType.rawValue
        )
    }

    func testCloseCodeatusReceived() {
        assertDelegateReceivesError(
            withExpectedCode: AWSTranscribeStreamingClientErrorCode.webSocketClosedUnexpectedly.rawValue,
            fromCloseCode: AWSSRStatusNoStatusReceived.rawValue
        )
    }

    func testCloseCodeInvalidUTF8() {
        assertDelegateReceivesError(
            withExpectedCode: AWSTranscribeStreamingClientErrorCode.webSocketClosedUnexpectedly.rawValue,
            fromCloseCode: AWSSRStatusCodeInvalidUTF8.rawValue
        )
    }

    func testCloseCodePolicyViolated() {
        assertDelegateReceivesError(
            withExpectedCode: AWSTranscribeStreamingClientErrorCode.webSocketClosedUnexpectedly.rawValue,
            fromCloseCode: AWSSRStatusCodePolicyViolated.rawValue
        )
    }

    func testCloseCodeMessageTooBig() {
        assertDelegateReceivesError(
            withExpectedCode: AWSTranscribeStreamingClientErrorCode.webSocketClosedUnexpectedly.rawValue,
            fromCloseCode: AWSSRStatusCodeMessageTooBig.rawValue
        )
    }

    // MARK: - Utilities

    /// - Given: an adaptor with delegate
    /// - When: the adaptor's `-[webSocket:didCloseWithCode:reason:wasClean:]` method is invoked with a close code of
    ///   `closeCode`
    /// - Then: The delegate receives a connectionStatusCallback error with the expected, translated code
    func assertDelegateReceivesError(withExpectedCode expectedCode: Int,
                                     fromCloseCode closeCode: Int,
                                     file: StaticString = #file,
                                     line: UInt = #line) {
        let delegate = MockTranscribeStreamingClientDelegate()
        let receivedStatusCallback = expectation(description: "Received status callback")

        delegate.connectionStatusCallback = { _, error in
            guard let error = error as NSError? else {
                XCTFail("Error unexpectedly nil in testCloseCodeUnknown")
                return
            }
            XCTAssertEqual(error.code, expectedCode, "Did not get expected error code", file: file, line: line)
            receivedStatusCallback.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        adaptor.webSocket(nil,
                          didCloseWithCode: closeCode,
                          reason: "Test reason",
                          wasClean: false)

        waitForExpectations(timeout: 0.1)
    }

}
