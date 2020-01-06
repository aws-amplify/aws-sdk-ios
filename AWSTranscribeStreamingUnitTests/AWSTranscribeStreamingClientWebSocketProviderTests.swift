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

class AWSTranscribeStreamingClientWebSocketProviderTest: XCTestCase {
    
    
    // Given: A web socket provider
    // When: when registering the streaming client
    // Then: the streaming client is able to use a third party web socket provider and open the socket
    func testWSSInitWithError() {
        
        let mockWebSocketProvider = MockWebSocketProvider()
        guard let config = AWSServiceConfiguration(
            region: .USEast1,
            credentialsProvider: MockReturningCredentialsProvider()) else {
                XCTFail("Couldn't initialize config with MockErrorReturningCredentialsProvider")
                return
        }
        
        AWSTranscribeStreaming.register(with: config, forKey: "testWSSInitWithWebSocketProvider", webSocketProvider: mockWebSocketProvider)

        let client = AWSTranscribeStreaming(forKey: "testWSSInitWithWebSocketProvider")
        
        guard let request = AWSTranscribeStreamingStartStreamTranscriptionRequest() else {
            XCTFail("request unexpectedly nil")
            return
        }

        request.languageCode = .enUS
        request.mediaEncoding = .pcm
        request.mediaSampleRateHertz = 8000
        
        let delegate = MockTranscribeStreamingClientDelegate()
        let receiveError = expectation(description: "Callback received error")
        delegate.connectionStatusCallback = { status, error in
            if let error = error as NSError? {
                receiveError.fulfill()
                XCTAssertEqual(error.domain, AWSTranscribeStreamingClientErrorDomain)
                XCTAssertEqual(error.code, AWSTranscribeStreamingClientErrorCode.webSocketCouldNotInitialize.rawValue)
                XCTAssertNotNil(error.userInfo[NSUnderlyingErrorKey])
            }
        }
        
        client.setDelegate(delegate, callbackQueue: DispatchQueue.global())
        
        client.startTranscriptionWSS(request)
        
        wait(for: [receiveError], timeout: 0.1)
    }
    
}


class MockWebSocketProvider: NSObject, AWSTranscribeStreamingWebSocketProvider{
    
    var webSocket: AWSTranscribeStreamingWebSocketProvider!
    
    var clientDelegate: AWSTranscribeStreamingClientDelegate!
    
    var delegate: MockWebSocketProviderDelegate?
    
    override init() {
        super.init()
        clientDelegate = nil
        webSocket = nil
        delegate = nil
    }

    func send(_ data: Data) {
        self.webSocket.send(data)
    }

    func connect() {
        self.delegate?.webSocketDidOpen(webSocket)
    }

    func disconnect() {
        self.delegate?.webSocketDidCloseWithCode(webSocket, code: 0, reason: "clean", wasClean: true)
    }

    func setDelegate(_ delegate: AWSTranscribeStreamingClientDelegate, dispatchQueue: DispatchQueue) {
        self.clientDelegate = delegate
        let adaptor = MockWebSocketProviderDelegate(clientDelegate: delegate, callbackQueue: dispatchQueue)
        self.delegate = adaptor
    }

    func configure(with urlRequest: URLRequest) {
        self.webSocket = AWSSRWebSocket(urlRequest: urlRequest)
    }
}

class MockReturningCredentialsProvider: NSObject, AWSCredentialsProvider {
    func credentials() -> AWSTask<AWSCredentials> {
        let credentials = AWSCredentials(accessKey: "memem", secretKey: "hahah", sessionKey: "lskdjflkd", expiration: nil)
        return AWSTask(result: credentials)
    }
    
    func invalidateCachedTemporaryCredentials() {
        // Do nothing
    }
}

class MockWebSocketProviderDelegate: NSObject {
    
    var clientDelegate:AWSTranscribeStreamingClientDelegate!
    var callbackQueue: DispatchQueue!
    
    init(clientDelegate: AWSTranscribeStreamingClientDelegate, callbackQueue: DispatchQueue) {
        super.init()
        self.clientDelegate = clientDelegate
        self.callbackQueue = callbackQueue
    }
    
    func webSocket(_ webSocket: AWSTranscribeStreamingWebSocketProvider, didReceiveMessage message: Any!) {

        let decodingError = NSError()
        let result = try! AWSTranscribeStreamingEventDecoder.decodeEvent(message as! Data)

        callbackQueue.async {
            self.clientDelegate.didReceiveEvent(result, decodingError: decodingError)
        }

    }
    
    func webSocket(_ webSocket: AWSTranscribeStreamingWebSocketProvider, didFailWithError error: NSError?) {
        let status = AWSTranscribeStreamingClientConnectionStatus.unknown
        
        callbackQueue.async {
            self.clientDelegate.connectionStatusDidChange(status, withError: error)
        }
    }
    
    func webSocketDidOpen(_ webSocket: AWSTranscribeStreamingWebSocketProvider) {

        let status = AWSTranscribeStreamingClientConnectionStatus.connected
        callbackQueue.async {
            self.clientDelegate.connectionStatusDidChange(status, withError: nil)
        }

    }
    
    func webSocketDidCloseWithCode(_ webSocket: AWSTranscribeStreamingWebSocketProvider, code: Int, reason: String, wasClean: Bool) {
        
        let status = AWSTranscribeStreamingClientConnectionStatus.closed
        var error: NSError? = nil
        if !wasClean {
        let errorCode = AWSTranscribeStreamingClientErrorCode.unknown
        let userInfo: Dictionary<String, Any> = ["AWSSRStatusCode": code,
                                            "AWSSRStatusReason": reason,
                                            "AWSSRWasClean": wasClean]
        let statusCode = AWSSRStatusCode(rawValue: code)

        switch (statusCode) {

            
            default:
                break
            }

            error = NSError(domain: AWSTranscribeStreamingClientErrorDomain, code: errorCode.rawValue, userInfo: userInfo)

        }
    
        callbackQueue.async {
            self.clientDelegate.connectionStatusDidChange(status, withError: error)
        }
    }
}
