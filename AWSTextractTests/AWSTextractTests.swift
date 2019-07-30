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
import AWSTextract

class AWSTextractTests : XCTestCase {
    
    var instanceId: String?
    var destinationDialInPhoneNumber: String?
    
    //var textractClient: AWSTextract?
    
    override func setUp() {
        super.setUp()
        
        // Setup Verbose Log level
        AWSDDLog.sharedInstance.logLevel = .verbose
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        
        AWSTestUtility.setupCredentialsViaFile()
        
        let credentialsJson: [String : String]? = AWSTestUtility.getCredentialsJsonAsDictionary()
        
        textractClient = AWSTextract.default()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAnalyzeDocument() {
        XCTAssertNotNil(textractClient)
    }
}
