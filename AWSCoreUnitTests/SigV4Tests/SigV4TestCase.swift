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

import Foundation
import AWSCore

/// A holder for test case data from the SigV4 test suite. The
/// important fields are the name, expectedPresignedURL, and
/// originalRequest, which we'll use to exercise our presigned URL
/// code. The remaining properties are useful for debugging if the
/// values do not match as expected.
struct SigV4TestCase {
    let testCaseName: String

    // Given these setups (plus the other configs in SigV4TestCredentials)
    let credentialsProvider: AWSCredentialsProvider
    let shouldSignBody: Bool
    let shouldSignSecurityToken: Bool

    // When we presign this original request
    let originalRequest: String

    // Then we get this presigned URL
    let expectedPresignedURL: String

    // Useful debugging properties
    let canonicalRequest: String
    let stringToSign: String
    let signature: String

}

extension SigV4TestCase {
    func makeURLRequest(fromRequestString requestString: String) throws -> URLRequest {
        var lines = requestString.split(separator: "\n", maxSplits: Int.max, omittingEmptySubsequences: false)

        let startLine = lines.remove(at: 0)
        let startLineComponents = startLine.components(separatedBy: .whitespaces)

        let httpMethod = startLineComponents[0]
        let target = startLineComponents[1]
        let httpVersion = startLineComponents[2]
        guard httpVersion.lowercased().hasPrefix("http") else {
            throw "Not an HTTP request: \(originalRequest)"
        }

        // Remaining lines are headers, up to the first empty line, then body
        var headers = [String: String]()
        var hostFromHeader: String?
        var portFromHeader: String?
        var currentHeaderName: String?
        while !lines.isEmpty {
            let line = lines.remove(at: 0)

            if line == "" {
                break
            }

            // Folded headers are obsoleted, but we still need to be able to canonicalize them
            if line.range(of: "^\\s+", options: .regularExpression) != nil, let currentHeaderName = currentHeaderName {
                if let currentHeaderValue = headers[currentHeaderName] {
                    headers[currentHeaderName] = currentHeaderValue + String(line)
                } else {
                    headers[currentHeaderName] = String(line)
                }
                continue
            }

            // Get key/value pair, respecting potential colons in the value (e.g., "host:www.example.com:80")
            let headerComponents = line
                .split(separator: ":", maxSplits: 1, omittingEmptySubsequences: false)
                .map { String($0) }

            let key = headerComponents[0]
            let value = headerComponents.last
            headers[key] = value
            currentHeaderName = key

            if key.lowercased() == "host" {
                hostFromHeader = value
                // If the incoming host header has a port, store it
                if headerComponents.count == 3 {
                    portFromHeader = headerComponents[2]
                }
            }
        }

        guard let host = hostFromHeader else {
            throw "No host in request: \(originalRequest)"
        }

        var portString = ""
        if let port = portFromHeader {
            portString = ":\(port)"
        }
        let urlString = "https://\(host)\(portString)\(target)"

        guard let url = URL(string: urlString) else {
            throw "Could not construct URL from \(urlString)"
        }

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = httpMethod

        if !lines.isEmpty {
            let body = lines.joined(separator: "\n")
            let bodyData = body.data(using: .utf8)
            request.httpBody = bodyData
        }

        return request
    }
}

extension SigV4TestCase: CustomStringConvertible {
    var description: String {
        let description =
        """
        ######################
        testCaseName: \(testCaseName)
        shouldSignBody: \(shouldSignBody)
        shouldSignSecurityToken: \(shouldSignSecurityToken)
        access_key: \(credentialsProvider)
        expectedPresignedURL: \(expectedPresignedURL)

        originalRequest:
        \(originalRequest)

        canonicalRequest:
        \(canonicalRequest)

        stringToSign:
        \(stringToSign)

        signature: \(signature)
        
        (end \(testCaseName))
        ######################
        """

        return description
    }
}
