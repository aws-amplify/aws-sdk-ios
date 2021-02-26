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

class AWSSRWebSocketDelegateAdaptorDidFailWithErrorTests: XCTestCase {

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor receives `-[webSocket:didFailWithError:]` invocation
    /// - Then: the delegate receives a connectionDidChange
    func testAdaptor() {
        let delegate = MockTranscribeStreamingClientDelegate()
        let receivedErrorCallback = expectation(description: "Received error callback")

        delegate.connectionStatusCallback = { _, error in
            XCTAssertNotNil(error)
            receivedErrorCallback.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        let error = NSError(domain: AWSSRWebSocketErrorDomain,
                            code: 1234,
                            userInfo: nil)
        adaptor.webSocket(nil, didFailWithError: error)

        waitForExpectations(timeout: 0.1)
    }

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didFailWithError:]` method is invoked with an error
    /// - Then: the delegate receives the raw, untranslated error information
    func testAdaptorPropagatesRawErrorInformation() {
        let delegate = MockTranscribeStreamingClientDelegate()
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

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didFailWithError:]` method is invoked with `AWSSR_CONNECTING`
    /// - Then: the delegate receives the `AWSTranscribeStreamingClientDelegateConnectionStatus` appropriate
    ///   to the raw SocketRocket status
    func testAdaptorPropagatesConnectionStatus_CONNECTING() {
        let delegate = MockTranscribeStreamingClientDelegate()
        let receivedErrorCallback = expectation(description: "Received error callback")

        delegate.connectionStatusCallback = { status, _ in
            XCTAssertEqual(status, AWSTranscribeStreamingClientConnectionStatus.connecting)
            receivedErrorCallback.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        let webSocket = MockWebSocket()
        webSocket.overrideReadyState = .CONNECTING

        let error = NSError(domain: AWSSRWebSocketErrorDomain,
                            code: 1234,
                            userInfo: nil)

        adaptor.webSocket(webSocket, didFailWithError: error)

        waitForExpectations(timeout: 0.1)
    }

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didFailWithError:]` method is invoked with `AWSSR_OPEN`
    /// - Then: the delegate receives the `AWSTranscribeStreamingClientDelegateConnectionStatus` appropriate
    ///   to the raw SocketRocket status
    func testAdaptorPropagatesConnectionStatus_OPEN() {
        let delegate = MockTranscribeStreamingClientDelegate()
        let receivedErrorCallback = expectation(description: "Received error callback")

        delegate.connectionStatusCallback = { status, _ in
            XCTAssertEqual(status, AWSTranscribeStreamingClientConnectionStatus.connected)
            receivedErrorCallback.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        let webSocket = MockWebSocket()
        webSocket.overrideReadyState = .OPEN

        let error = NSError(domain: AWSSRWebSocketErrorDomain,
                            code: 1234,
                            userInfo: nil)

        adaptor.webSocket(webSocket, didFailWithError: error)

        waitForExpectations(timeout: 0.1)
    }

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didFailWithError:]` method is invoked with `AWSSR_CLOSING`
    /// - Then: the delegate receives the `AWSTranscribeStreamingClientDelegateConnectionStatus` appropriate
    ///   to the raw SocketRocket status
    func testAdaptorPropagatesConnectionStatus_CLOSING() {
        let delegate = MockTranscribeStreamingClientDelegate()
        let receivedErrorCallback = expectation(description: "Received error callback")

        delegate.connectionStatusCallback = { status, _ in
            XCTAssertEqual(status, AWSTranscribeStreamingClientConnectionStatus.closing)
            receivedErrorCallback.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        let webSocket = MockWebSocket()
        webSocket.overrideReadyState = .CLOSING

        let error = NSError(domain: AWSSRWebSocketErrorDomain,
                            code: 1234,
                            userInfo: nil)

        adaptor.webSocket(webSocket, didFailWithError: error)

        waitForExpectations(timeout: 0.1)
    }

    /// - Given: An adaptor with a delegate
    /// - When: The adaptor's `-[webSocket:didFailWithError:]` method is invoked with `AWSSR_CLOSED`
    /// - Then: the delegate receives the `AWSTranscribeStreamingClientDelegateConnectionStatus` appropriate
    ///   to the raw SocketRocket status
    func testAdaptorPropagatesConnectionStatus_CLOSED() {
        let delegate = MockTranscribeStreamingClientDelegate()
        let receivedErrorCallback = expectation(description: "Received error callback")

        delegate.connectionStatusCallback = { status, _ in
            XCTAssertEqual(status, AWSTranscribeStreamingClientConnectionStatus.closed)
            receivedErrorCallback.fulfill()
        }

        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: DispatchQueue.global())

        let webSocket = MockWebSocket()
        webSocket.overrideReadyState = .CLOSED

        let error = NSError(domain: AWSSRWebSocketErrorDomain,
                            code: 1234,
                            userInfo: nil)

        adaptor.webSocket(webSocket, didFailWithError: error)

        waitForExpectations(timeout: 0.1)
    }

}
