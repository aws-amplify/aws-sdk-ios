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
import AWSConnectParticipant

class AWSConnectParticipantTests: XCTestCase {

    // As of this writing (06-May-2020) Connect is not available for CDK setup, and doesn't expose the ListInstances
    // request. Further, any request we make without a valid instance ID returns an undifferentiated "AccessDenied"
    // error, so there isn't any meaningful test we can do on this service other than assert the client is created.
    func testClientIsCreated() {
        AWSTestUtility.setupSessionCredentialsProvider()
        XCTAssertNotNil(AWSConnectParticipant.default())
    }

}
