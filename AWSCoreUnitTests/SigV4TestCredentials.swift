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

import Foundation
import AWSCore

/// Credentials provider for the various tests. The keys and tokens are taken from the AWS S3 presigned URL example:
/// https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html
struct SigV4TestCredentials {
    static let regionName = "us-east-1"
    static let serviceName = "s3"
    static let accessKey = "AKIAIOSFODNN7EXAMPLE"
    static let secretKey = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
    static let securityToken = "AQoDYXdzEPT//////////wEXAMPLEtc764bNrC9SAPBSM22wDOk4x4HIZ8j4FZTwdQWLWsKWHGBuFqwA" +
        "eMicRXmxfpSPfIeoIYRqTflfKD8YUuwthAx7mSEI/qkPpKPi/kMcGdQrmGdeehM4IC1NtBmUpp2wUE8p" +
        "hUZampKsburEDy0KPkyQDYwT7WZ0wq5VSXDvp75YU9HFvlRd8Tx6q6fE8YQcHNVXAkiY9q6d+xo0rKwT" +
        "38xVqr7ZD0u0iPPkUL64lIZbqBAz+scqKmlzm8FDrypNC9Yjc8fPOLn9FX9KSYvKTr4rvx3iSIlTJabI" +
    "Qwj2ICCR/oLxBA=="

    // Fri, 24 May 2013 00:00:00 GMT
    static let testDate = Date(timeIntervalSince1970: 1369353600)
    static let expiry: Int32 = 86400

    static let basicTestCredentials = AWSStaticCredentialsProvider(accessKey: accessKey,
                                                                   secretKey: secretKey)

    static let sessionTestCredentials = AWSBasicSessionCredentialsProvider(accessKey: accessKey,
                                                                           secretKey: secretKey,
                                                                           sessionToken: securityToken)


}
