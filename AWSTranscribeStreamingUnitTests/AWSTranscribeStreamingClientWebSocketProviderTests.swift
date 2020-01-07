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
    // Then: the streaming client is able to use a third party web socket provider and open the socket but error
    func testWSSConnectWithError() {
        let mockWebSocketProvider = MockWebSocketProvider()
        let errorOnConnectionStatus = NSError(domain: AWSTranscribeStreamingClientErrorDomain,
                                              code: AWSTranscribeStreamingClientErrorCode.webSocketCouldNotInitialize.rawValue,
                                              userInfo: [NSUnderlyingErrorKey:"errorKey"])
        mockWebSocketProvider.setErrorOnConnectionStatusDidChange(error: errorOnConnectionStatus)
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
                XCTAssertEqual(error.domain, AWSTranscribeStreamingClientErrorDomain)
                XCTAssertEqual(error.code, AWSTranscribeStreamingClientErrorCode.webSocketCouldNotInitialize.rawValue)
                XCTAssertNotNil(error.userInfo[NSUnderlyingErrorKey])
                
                receiveError.fulfill()
                
            }
        }
        
        client.setDelegate(delegate, callbackQueue: DispatchQueue.global())
        
        client.startTranscriptionWSS(request)
      
        wait(for: [receiveError], timeout: 0.1)
    }
    
    // Given: A web socket provider
    // When: when registering the streaming client
    // Then: the streaming client is able to use a third party web socket provider and open the socket
    func testWSSConnect() {
        let mockWebSocketProvider = MockWebSocketProvider()
        mockWebSocketProvider.setErrorOnConnectionStatusDidChange(error: nil)
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
        let receiveConnected = expectation(description: "Callback received connected status")
        delegate.connectionStatusCallback = { status, error in
            if status == AWSTranscribeStreamingClientConnectionStatus.connected {
                receiveConnected.fulfill()
            }
        }
        
        client.setDelegate(delegate, callbackQueue: DispatchQueue.global())
        
        client.startTranscriptionWSS(request)
        
        wait(for: [receiveConnected], timeout: 0.1)
    }
    
    // Given: A web socket provider
    // When: when registering the streaming client
    // Then: the streaming client is able to use a third party web socket provider and open the socket and disconnect from it
    func testWSSDisconnect() {
        let mockWebSocketProvider = MockWebSocketProvider()
        mockWebSocketProvider.setErrorOnConnectionStatusDidChange(error: nil)
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
        
        let receiveClosed = expectation(description: "Callback received closed status")
        delegate.connectionStatusCallback = { status, error in
            if status == AWSTranscribeStreamingClientConnectionStatus.closed {
                receiveClosed.fulfill()
            }
        }
        
        client.setDelegate(delegate, callbackQueue: DispatchQueue.global())
        
        client.startTranscriptionWSS(request)
        mockWebSocketProvider.disconnect()
        wait(for: [receiveClosed], timeout: 0.1)
    }
    
    // Given: A web socket provider
    // When: when registering the streaming client
    // Then: the streaming client is able to use a third party web socket provider and open the socket and send data
    func testWSSSendData() {
        let mockWebSocketProvider = MockWebSocketProvider()
        mockWebSocketProvider.setErrorOnConnectionStatusDidChange(error: nil)
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
        let transcription = "some transcription"
        let data = Data(transcription.utf8)
        
        request.languageCode = .enUS
        request.mediaEncoding = .pcm
        request.mediaSampleRateHertz = 8000
        
        let delegate = MockTranscribeStreamingClientDelegate()
        
        let receiveDataSend = expectation(description: "Callback received data")
        delegate.connectionStatusCallback = { status, error in
            
            if status == AWSTranscribeStreamingClientConnectionStatus.connected {
                //send data once socket is connected
                mockWebSocketProvider.send(data)
            }
        }
        delegate.receiveEventCallback = { data, error in
            if error == nil {
                receiveDataSend.fulfill()
            }
        }
        
        client.setDelegate(delegate, callbackQueue: DispatchQueue.global())
        
        client.startTranscriptionWSS(request)
        //add waiter to open web socket and make sure its connected before sending data.
        
        wait(for: [receiveDataSend], timeout: 0.1)
    }
}

class MockWebSocketProvider: NSObject, AWSTranscribeStreamingWebSocketProvider{
    
    var clientDelegate: AWSTranscribeStreamingClientDelegate
    var errorOnConnectionStatusDidChange: NSError?
    var callbackQueue: DispatchQueue!
    
    override init() {
        clientDelegate = MockTranscribeStreamingClientDelegate()
        errorOnConnectionStatusDidChange = nil
        super.init()
    }
    
    func setErrorOnConnectionStatusDidChange(error: NSError?) {
        errorOnConnectionStatusDidChange = error
    }
    
    func send(_ data: Data) {
        let result: AWSTranscribeStreamingTranscriptResultStream = AWSTranscribeStreamingTranscriptResultStream()
        let transcriptEvent:AWSTranscribeStreamingTranscriptEvent = AWSTranscribeStreamingTranscriptEvent()
        let str = String(decoding: data, as: UTF8.self)
        let results: AWSTranscribeStreamingTranscript = AWSTranscribeStreamingTranscript()
        let resultStream: AWSTranscribeStreamingResult = AWSTranscribeStreamingResult()
        let alternative: AWSTranscribeStreamingAlternative = AWSTranscribeStreamingAlternative()
        alternative.transcript = str
        resultStream.alternatives = [alternative]
        results.results = [resultStream]
        transcriptEvent.transcript = results
        result.transcriptEvent = transcriptEvent
        
        callbackQueue.async {
            self.clientDelegate.didReceiveEvent(result, decodingError: nil)
        }
    }
    
    func connect() {
        let status = AWSTranscribeStreamingClientConnectionStatus.connected
        callbackQueue.async {
            self.clientDelegate.connectionStatusDidChange(status, withError: self.errorOnConnectionStatusDidChange)
        }
    }
    
    func disconnect() {
        let status = AWSTranscribeStreamingClientConnectionStatus.closed
        
        callbackQueue.async {
            self.clientDelegate.connectionStatusDidChange(status, withError: self.errorOnConnectionStatusDidChange)
        }
    }
    
    func setDelegate(_ delegate: AWSTranscribeStreamingClientDelegate, dispatchQueue: DispatchQueue) {
        clientDelegate = delegate
        callbackQueue = dispatchQueue
    }
    
    func configure(with urlRequest: URLRequest) {
        
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
