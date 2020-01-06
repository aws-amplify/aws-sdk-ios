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

import AWSTranscribeStreaming

class AWSTranscribeStreamingSwiftTests: XCTestCase {
    private static let transcribeClientKey = "AWSTranscribeStreamingSwiftTests"
    
    /// Use this as our timeout value for any operation that hits the network. Note that this may need to be higher
    /// than you think, to account for CI systems running in shared environments
    private static let networkOperationTimeout = 30.0

    var transcribeStreamingClient: AWSTranscribeStreaming!
    
    override func setUp() {
        super.setUp()
        
        AWSTestUtility.setupCognitoCredentialsProvider()

        guard let config = AWSServiceManager.default().defaultServiceConfiguration else {
            XCTFail("Can't get default service configuration")
            return
        }

        AWSTranscribeStreaming.register(with: config, forKey: AWSTranscribeStreamingSwiftTests.transcribeClientKey)
        transcribeStreamingClient = AWSTranscribeStreaming(forKey: AWSTranscribeStreamingSwiftTests.transcribeClientKey)

        AWSDDLog.sharedInstance.logLevel = .info
        AWSDDLog.sharedInstance.add(AWSDDTTYLogger.sharedInstance)
    }

    func testStreamingExample() throws {
        AWSDDLog.sharedInstance.logLevel = .verbose
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        
        let bundle = Bundle(for: AWSTranscribeStreamingSwiftTests.self)
        guard let audioPath = bundle.path(forResource: "hello_world", ofType: "wav") else {
            XCTFail("Can't find audio path")
            return
        }
        
        let audioURL = URL(fileURLWithPath: audioPath)
        let audioData = try Data(contentsOf: audioURL)
        
        guard let request = AWSTranscribeStreamingStartStreamTranscriptionRequest() else {
            XCTFail("request unexpectedly nil")
            return
        }

        request.languageCode = .enUS
        request.mediaEncoding = .pcm
        request.mediaSampleRateHertz = 8000
        
        // Set up delegate and its expectations
        let delegate = MockTranscribeStreamingClientDelegate()

        // Connection open/close
        let webSocketIsConnected = expectation(description: "Web socket is connected")
        let webSocketIsClosed = expectation(description: "Web socket is closed")
        delegate.connectionStatusCallback = { status, error in
            if status == .connected {
                DispatchQueue.main.async {
                    webSocketIsConnected.fulfill()
                }
            }
            
            if status == .closed && error == nil {
                DispatchQueue.main.async {
                    webSocketIsClosed.fulfill()
                }
            }
        }

        // Event: for this test, we expect to only receive transcriptions, not errors
        let receivedFinalTranscription = expectation(description: "Received final transcription")
        delegate.receiveEventCallback = { event, error in
            if let error = error {
                XCTFail("Unexpected error receiving event: \(error)")
                return
            }
            
            guard let event = event else {
                XCTFail("event unexpectedly nil")
                return
            }
            
            guard let transcriptEvent = event.transcriptEvent else {
                XCTFail("transcriptEvent unexpectedly nil: event may be an error \(event)")
                return
            }

            guard let results = transcriptEvent.transcript?.results else {
                print("No results, waiting for next event")
                return
            }

            guard let firstResult = results.first else {
                print("firstResult nil--possibly a partial result: \(event)")
                return
            }

            guard let isPartial = firstResult.isPartial as? Bool else {
                XCTFail("isPartial unexpectedly nil, or cannot cast NSNumber to Bool")
                return
            }

            guard !isPartial else {
                print("Partial result received, waiting for next event (results: \(results))")
                return
            }

            print("Received final transcription event (results: \(results))")
            DispatchQueue.main.async {
                receivedFinalTranscription.fulfill()
            }
        }
        
        let callbackQueue = DispatchQueue(label: "testStreamingExample")
        transcribeStreamingClient.setDelegate(delegate, callbackQueue: callbackQueue)

        // Now that we have a delegate ready to receive the "open" event, we can start the transcription request
        transcribeStreamingClient.startTranscriptionWSS(request)

        wait(for: [webSocketIsConnected], timeout: AWSTranscribeStreamingSwiftTests.networkOperationTimeout)

        // Now that the web socket is connected, it is safe to proceed with streaming

        let headers = [
            ":content-type": "audio/wav",
            ":message-type": "event",
            ":event-type": "AudioEvent"
        ]
        
        let chunkSize = 4096
        let audioDataSize = audioData.count
        
        var currentStart = 0
        var currentEnd = min(chunkSize, audioDataSize - currentStart)

        while currentStart < audioDataSize {
            let dataChunk = audioData[currentStart ..< currentEnd]
            transcribeStreamingClient.send(dataChunk, headers: headers)

            currentStart = currentEnd
            currentEnd = min(currentStart + chunkSize, audioDataSize)
        }
        
        print("Sending end frame")
        self.transcribeStreamingClient.sendEndFrame()

        print("Waiting for final transcription event")
        wait(for: [receivedFinalTranscription], timeout: AWSTranscribeStreamingSwiftTests.networkOperationTimeout)
        
        print("Ending transcription")
        transcribeStreamingClient.endTranscription()
        
        print("Waiting for websocket to close")
        wait(for: [webSocketIsClosed], timeout: AWSTranscribeStreamingSwiftTests.networkOperationTimeout)
    }
}
