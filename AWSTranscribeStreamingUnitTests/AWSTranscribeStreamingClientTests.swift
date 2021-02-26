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

class AWSTranscribeStreamingClientTests: XCTestCase {

    // Given: A configuration that returns an error when attempting to retrieve credentials
    // When: An app invokes `startTranscriptionWSS`
    // Then: The delegate receives an error callback
    func testWSSInitWithError() {
        guard let config = AWSServiceConfiguration(
            region: .USEast1,
            credentialsProvider: MockErrorReturningCredentialsProvider()) else {
                XCTFail("Couldn't initialize config with MockErrorReturningCredentialsProvider")
                return
        }

        AWSTranscribeStreaming.register(with: config, forKey: "testWSSInitWithError")
        let errorClient = AWSTranscribeStreaming(forKey: "testWSSInitWithError")

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

        errorClient.setDelegate(delegate, callbackQueue: DispatchQueue.global())

        errorClient.startTranscriptionWSS(request)

        wait(for: [receiveError], timeout: 0.1)
    }

}

class MockErrorReturningCredentialsProvider: NSObject, AWSCredentialsProvider {
    func credentials() -> AWSTask<AWSCredentials> {
        let error = NSError(domain: "TestErrorDomain", code: 1, userInfo: nil)
        return AWSTask(error: error)
    }

    func invalidateCachedTemporaryCredentials() {
        // Do nothing
    }
}
