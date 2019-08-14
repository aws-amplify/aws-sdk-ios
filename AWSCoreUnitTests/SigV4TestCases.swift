//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

/// We could store these as JSON or similar, but it's hard to do multiline
/// readably, so we'll cut straight to hardcoding them. The format
/// of the request strings is taken from the SigV4 test suite,
/// but the tests themselves aren't applicable to presigned URL
/// cases, since they do not include the authorization query params
/// in the canonical request definitions.
struct SigV4PresignedURLTestCases {
    static let allCases = [
        // MARK: - Test Case "get-s3-sample"
        // From S3 presigned URL example
        // https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html
        SigV4TestCase(

            testCaseName: "get-s3-sample",

            // Given
            credentialsProvider: SigV4TestCredentials.basicTestCredentials,
            shouldSignBody: false,
            shouldSignSessionToken: true,

            // When
            originalRequest:
            """
            GET /test.txt HTTP/1.1
            Host:examplebucket.s3.amazonaws.com
            """,

            // Then
            expectedPresignedURL: "https://examplebucket.s3.amazonaws.com/test.txt?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIOSFODNN7EXAMPLE%2F20130524%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20130524T000000Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=aeeed9bbccd4d02ee5c0109b86d86835f995330da4c265957d157751f604d404",

            canonicalRequest:
            """
            GET
            /test.txt
            X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIOSFODNN7EXAMPLE%2F20130524%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20130524T000000Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host
            host:examplebucket.s3.amazonaws.com

            host
            UNSIGNED-PAYLOAD
            """,

            stringToSign:
            """
            AWS4-HMAC-SHA256
            20130524T000000Z
            20130524/us-east-1/s3/aws4_request
            3bfa292879f6447bbcda7001decf97f4a54dc650c8942174ae0a9121cf58ad04
            """
        ),

        // MARK: - Test Case "s3-with-sts-creds"
        // Test the S3 sample using assume-role STS-based credentials
        SigV4TestCase(

            testCaseName: "s3-with-sts-creds",

            // Given
            credentialsProvider: SigV4TestCredentials.sessionTestCredentials,
            shouldSignBody: false,
            shouldSignSessionToken: true,

            // When
            originalRequest:
            """
            GET /test.txt HTTP/1.1
            Host:examplebucket.s3.amazonaws.com
            """,

            // Then
            expectedPresignedURL: "https://examplebucket.s3.amazonaws.com/test.txt?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIOSFODNN7EXAMPLE%2F20130524%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20130524T000000Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Security-Token=AQoDYXdzEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEXAMPLEtc764bNrC9SAPBSM22wDOk4x4HIZ8j4FZTwdQWLWsKWHGBuFqwAeMicRXmxfpSPfIeoIYRqTflfKD8YUuwthAx7mSEI%2FqkPpKPi%2FkMcGdQrmGdeehM4IC1NtBmUpp2wUE8phUZampKsburEDy0KPkyQDYwT7WZ0wq5VSXDvp75YU9HFvlRd8Tx6q6fE8YQcHNVXAkiY9q6d%2Bxo0rKwT38xVqr7ZD0u0iPPkUL64lIZbqBAz%2BscqKmlzm8FDrypNC9Yjc8fPOLn9FX9KSYvKTr4rvx3iSIlTJabIQwj2ICCR%2FoLxBA%3D%3D&X-Amz-Signature=888f6935ee956d644d5b57b03f961f04f25a777c8870a52d69045f2c49c7e716",

            canonicalRequest:
            """
            GET
            /test.txt
            X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIOSFODNN7EXAMPLE%2F20130524%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20130524T000000Z&X-Amz-Expires=86400&X-Amz-Security-Token=AQoDYXdzEPT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEXAMPLEtc764bNrC9SAPBSM22wDOk4x4HIZ8j4FZTwdQWLWsKWHGBuFqwAeMicRXmxfpSPfIeoIYRqTflfKD8YUuwthAx7mSEI%2FqkPpKPi%2FkMcGdQrmGdeehM4IC1NtBmUpp2wUE8phUZampKsburEDy0KPkyQDYwT7WZ0wq5VSXDvp75YU9HFvlRd8Tx6q6fE8YQcHNVXAkiY9q6d%2Bxo0rKwT38xVqr7ZD0u0iPPkUL64lIZbqBAz%2BscqKmlzm8FDrypNC9Yjc8fPOLn9FX9KSYvKTr4rvx3iSIlTJabIQwj2ICCR%2FoLxBA%3D%3D&X-Amz-SignedHeaders=host
            host:examplebucket.s3.amazonaws.com

            host
            UNSIGNED-PAYLOAD
            """,

            stringToSign:
            """
            AWS4-HMAC-SHA256
            20130524T000000Z
            20130524/us-east-1/s3/aws4_request
            451f89cda672dfe0848d09c1ccc079345148a0617903d8655f80be77b0f71fbd
            """
        ),

    ]
}
