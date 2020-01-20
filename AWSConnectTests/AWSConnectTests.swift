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
import AWSConnect

class AWSConnectTests : XCTestCase {
    
    var instanceId: String?
    var destinationDialInPhoneNumber: String?
    
    var connectClient: AWSConnect?
    
    override func setUp() {
        super.setUp()
        
        // Setup Verbose Log level
        AWSDDLog.sharedInstance.logLevel = .verbose
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        
        AWSTestUtility.setupCredentialsViaFile()

        let credentialsJson: [String : String]? = AWSTestUtility.getCredentialsJsonAsDictionary()
        if credentialsJson?["amazon-connect-instance-id"] != nil {
            instanceId = credentialsJson?["amazon-connect-instance-id"]
        }
        if credentialsJson?["amazon-connect-destination-dial-in-phone-number"] != nil {
            destinationDialInPhoneNumber = credentialsJson?["amazon-connect-destination-dial-in-phone-number"]
        }
        
        connectClient = AWSConnect.default()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testListUsers() {
        let listUsersRequest = AWSConnectListUsersRequest()
        listUsersRequest?.instanceId = instanceId
        connectClient?.listUsers(listUsersRequest!).continueWith(block: { (task) -> Any? in
            XCTAssertNil(task.error)
            XCTAssertNotNil(task.result)
            XCTAssertNotNil(task.result?.userSummaryList!)
            XCTAssertTrue((task.result?.userSummaryList!.count)! > 0)
            return nil;
        }).waitUntilFinished()
    }
}
