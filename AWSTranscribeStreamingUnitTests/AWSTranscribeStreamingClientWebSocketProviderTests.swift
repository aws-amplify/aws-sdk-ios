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
    
    var webSocketReal: AWSSRWebSocket!
    
    var clientDelegate: AWSTranscribeStreamingClientDelegate!
    
    var delegate: AWSSRWebSocketDelegateAdaptor!
    
    override init() {
        super.init()
        clientDelegate = nil
        webSocket = nil
        webSocketReal = nil
        delegate = nil
    }

    func send(_ data: Data) {
        self.webSocketReal.send(data)
    }

    func connect() {
        self.webSocketReal.open()
    }

    func disconnect() {
        self.webSocketReal.close()
    }

    func setDelegate(_ delegate: AWSTranscribeStreamingClientDelegate, dispatchQueue: DispatchQueue) {
        self.clientDelegate = delegate
        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: dispatchQueue)
        self.delegate = adaptor
    }

    func configure(with urlRequest: URLRequest) {
        self.webSocketReal = AWSSRWebSocket(urlRequest: urlRequest)
        self.webSocketReal.delegate = delegate
        self.webSocketReal.setDelegateDispatchQueue(delegate.callbackQueue)
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

class MockWebSocketProviderDelegate: NSObject, AWSSRWebSocketDelegate {
    
    var clientDelegate:AWSTranscribeStreamingClientDelegate!
    var callbackQueue: DispatchQueue!
    
    init(clientDelegate: AWSTranscribeStreamingClientDelegate, callbackQueue: DispatchQueue) {
        super.init()
        self.clientDelegate = clientDelegate
        self.callbackQueue = callbackQueue
    }
    
    func webSocket(_ webSocket: AWSSRWebSocket!, didReceiveMessage message: Any!) {

        let decodingError = NSError()
        let result = try! AWSTranscribeStreamingEventDecoder.decodeEvent(message as! Data)

        callbackQueue.async {
            self.clientDelegate.didReceiveEvent(result, decodingError: decodingError)
        }

    }
    
    private func webSocket(_ webSocket: AWSSRWebSocket!, didFailWithError error: NSError?) {
        
    }
    
    private func webSocketDidOpen(_ webSocket: AWSSRWebSocket!) {
        
    }
    
    private func webSocketDidCloseWithCode(_ webSocket: AWSSRWebSocket!, code: Int, reason: String, wasClean: Bool) {
        
    }
}
