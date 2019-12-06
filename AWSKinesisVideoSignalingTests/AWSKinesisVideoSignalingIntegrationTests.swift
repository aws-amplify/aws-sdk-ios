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

import XCTest
import AWSKinesisVideoSignaling

class AWSKinesisVideoSignalingIntegrationTests: XCTestCase {

    override class func setUp() {
        super.setUp()
        // Setup cognito credentials to use for tests.
        AWSTestUtility.setupCognitoCredentialsProvider()
    }

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        let kvsClient = AWSKinesisVideoSignaling.default()
    }

    func testExample() {
        let kvsClient = AWSKinesisVideoSignaling.default()
    }
}
