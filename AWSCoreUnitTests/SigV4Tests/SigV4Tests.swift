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

import AWSCore

class SigV4Tests: XCTestCase {

    func testPresignedURLCases() {
        // Uncomment these lines to add verbose logging for debugging test failures
        // AWSDDLog.sharedInstance.logLevel = .verbose
        // AWSDDLog.add(AWSDDTTYLogger.sharedInstance)

        var testCaseName: String?
        do {
            for testCase in SigV4PresignedURLTestCases.allCases {
                testCaseName = testCase.testCaseName
                try assertPresignedURL(for: testCase)
            }
        } catch {
            XCTFail("Error processing test: \(testCaseName ?? "(unknown name)")")
        }
    }

    func assertPresignedURL(for testCase: SigV4TestCase) throws {

        let expectedURL = testCase.expectedPresignedURL

        let originalRequest = try testCase.makeURLRequest(fromRequestString: testCase.originalRequest)

        let taskIsComplete = expectation(description: "Task is complete")

        let presignedURL = AWSSignatureV4Signer.sigV4SignedURL(
            with: originalRequest,
            credentialProvider: testCase.credentialsProvider,
            regionName: SigV4TestCredentials.regionName,
            serviceName: SigV4TestCredentials.serviceName,
            date: SigV4TestCredentials.testDate,
            expireDuration: SigV4TestCredentials.expiry,
            signBody: testCase.shouldSignBody,
            signSessionToken: testCase.shouldSignSecurityToken).continueWith { task in
                defer {
                    taskIsComplete.fulfill()
                }

                if let error = task.error {
                    XCTFail("Unexpected error getting presigned URL for \(testCase.testCaseName): \(error)")
                    return nil
                }

                guard let url = task.result else {
                    XCTFail("URL unexpectedly empty for \(testCase.testCaseName)")
                    return nil
                }

                XCTAssertEqual(url.absoluteString, expectedURL, "Test case failed: \(testCase)")

                return nil
        }

        waitForExpectations(timeout: 0.1)
    }

}
