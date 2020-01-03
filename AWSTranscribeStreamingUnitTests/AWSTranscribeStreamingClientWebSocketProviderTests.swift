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
    
    override class func setUp() {
        super.setUp()
        // Setup cognito credentials to use for tests.
        AWSTestUtility.setupCognitoCredentialsProvider()
        guard let config = AWSServiceManager.default().defaultServiceConfiguration else {
            XCTFail("Can't get default service configuration")
            return
        }
        
        let webSocketProvider = MockWebSocketProvider()
        AWSTranscribeStreaming.register(with: config, forKey: "testWSSInitWithWebSocketProvider", webSocketProvider: webSocketProvider)
    }
    
    // Given: A web socket provider
    // When: when registering the streaming client
    // Then: the streaming client is able to use a third party web socket provider and open the socket
    func testWSSInitWithError() {
  

        let client = AWSTranscribeStreaming(forKey: "testWSSInitWithWebSocketProvider")
        
        guard let request = AWSTranscribeStreamingStartStreamTranscriptionRequest() else {
            XCTFail("request unexpectedly nil")
            return
        }
//
//        request.languageCode = .enUS
//        request.mediaEncoding = .pcm
//        request.mediaSampleRateHertz = 8000
        
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

    var webSocket: AWSSRWebSocket
    
    var clientDelegate: AWSTranscribeStreamingClientDelegate
    
    override init() {
        
    }

    func send(_ data: Data) {
        self.webSocket.send(data)
    }

    func connect() {
        self.webSocket.open()
    }

    func disconnect() {
        self.webSocket.close()
    }

    func setDelegate(_ delegate: AWSTranscribeStreamingClientDelegate, dispatchQueue: DispatchQueue) {
        self.clientDelegate = delegate
        let adaptor = AWSSRWebSocketDelegateAdaptor(clientDelegate: delegate, callbackQueue: dispatchQueue)
        self.webSocket.delegate = adaptor
        self.webSocket.setDelegateDispatchQueue(dispatchQueue)
    }

    func configure(with urlRequest: URLRequest) {
        self.webSocket = AWSSRWebSocket(urlRequest: urlRequest)
    }
}
