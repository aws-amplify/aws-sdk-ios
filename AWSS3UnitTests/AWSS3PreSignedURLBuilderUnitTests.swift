//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
import AWSS3

final class AWSS3PreSignedURLBuilderUnitTests: XCTestCase {
    override func setUp() {
        AWSS3PreSignedURLBuilder.register(
            with: .init(
                region: .USEast1,
                credentialsProvider: self
            ),
            forKey: "AWSS3PreSignedURLBuilderUnitTests"
        )
    }

    private var builder: AWSS3PreSignedURLBuilder {
        AWSS3PreSignedURLBuilder.s3PreSignedURLBuilder(
            forKey: "AWSS3PreSignedURLBuilderUnitTests"
        )
    }

    private func createRequest(
        bucket: String,
        key: String,
        preferredAccessStyle: AWSS3BucketAccessStyle
    ) -> AWSS3GetPreSignedURLRequest {
        let request = AWSS3GetPreSignedURLRequest()
        request.bucket = bucket
        request.key = key
        request.httpMethod = .GET
        request.expires = Date().addingTimeInterval(3600)
        request.preferredAccessStyle = preferredAccessStyle
        return request
    }

    /// Given: a `AWSS3GetPreSignedURLRequest` with `preferredAccessStyle` set to `.path`
    /// When: `AWSS3PreSignedURLBuilder.getPresignedURL(_:)` is invoked
    /// Then: The generated request uses path style to create the URL.
    func testPreferredAccessStyle_withPathStyle() {
        let request = createRequest(
            bucket: "pathbucket",
            key: "PathKey",
            preferredAccessStyle: .path
        )

        let expectation = expectation(description: "getPresignedURL")
        builder.getPreSignedURL(request).continueWith { task in
            defer {
                expectation.fulfill()
            }

            XCTAssertNil(task.error)
            guard let presignedURL = task.result as? URL else {
                XCTFail("Expected result")
                return
            }

            guard let components = URLComponents(url: presignedURL, resolvingAgainstBaseURL: true) else {
                XCTFail("Unable to retrieve components")
                return
            }

            XCTAssertEqual(components.host, "s3.us-east-1.amazonaws.com")
            XCTAssertEqual(components.path, "/pathbucket/PathKey")
            return nil
        }
        waitForExpectations(timeout: 1)
    }

    /// Given: a `AWSS3GetPreSignedURLRequest` with `preferredAccessStyle` set to `.virtualHosted` and a `bucketName` that is compliant.
    /// When: `AWSS3PreSignedURLBuilder.getPresignedURL(_:)` is invoked
    /// Then: The generated request uses Virtual-Hosted style to create the URL.
    func testPreferredAccessStyle_withVirtualHostedStyle() {
        let request = createRequest(
            bucket: "virtualhostedbucket",
            key: "virtualHostedKey",
            preferredAccessStyle: .virtualHosted
        )

        let expectation = expectation(description: "getPresignedURL")
        builder.getPreSignedURL(request).continueWith { task in
            defer {
                expectation.fulfill()
            }

            XCTAssertNil(task.error)
            guard let presignedURL = task.result as? URL else {
                XCTFail("Expected result")
                return
            }

            guard let components = URLComponents(url: presignedURL, resolvingAgainstBaseURL: true) else {
                XCTFail("Unable to retrieve components")
                return
            }

            XCTAssertEqual(components.host, "virtualhostedbucket.s3.us-east-1.amazonaws.com")
            XCTAssertEqual(components.path, "/virtualHostedKey")
            return nil
        }
        waitForExpectations(timeout: 1)
    }

    /// Given: a `AWSS3GetPreSignedURLRequest` with `preferredAccessStyle` set to `.virtualHosted` and a `bucketName` that is not compliant.
    /// When: `AWSS3PreSignedURLBuilder.getPresignedURL(_:)` is invoked
    /// Then: The generated request uses path style to create the URL.
    func testPreferredAccessStyle_withVirtualHostedStyle_andInvalidBucket() {
        let request = createRequest(
            bucket: "invalid_virtual_hosted_bucket_name",
            key: "virtualHostedKey",
            preferredAccessStyle: .virtualHosted
        )

        let expectation = expectation(description: "getPresignedURL")
        builder.getPreSignedURL(request).continueWith { task in
            defer {
                expectation.fulfill()
            }
            XCTAssertNil(task.error)
            guard let presignedURL = task.result as? URL else {
                XCTFail("Expected result")
                return
            }

            guard let components = URLComponents(url: presignedURL, resolvingAgainstBaseURL: true) else {
                XCTFail("Unable to retrieve components")
                return
            }

            XCTAssertEqual(components.host, "s3.us-east-1.amazonaws.com")
            XCTAssertEqual(components.path, "/invalid_virtual_hosted_bucket_name/virtualHostedKey")
            return nil
        }
        waitForExpectations(timeout: 1)
    }
}

extension AWSS3PreSignedURLBuilderUnitTests: AWSCredentialsProvider {
    func credentials() -> AWSTask<AWSCredentials> {
        return AWSTask(result: .init(
            accessKey: "accessKey",
            secretKey: "secretKey",
            sessionKey: "sessionKey",
            expiration: nil)
        )
    }
    
    func invalidateCachedTemporaryCredentials() {}
}
