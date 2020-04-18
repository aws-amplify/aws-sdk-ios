////
//// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
////
//// Licensed under the Apache License, Version 2.0 (the "License").
//// You may not use this file except in compliance with the License.
//// A copy of the License is located at
////
//// http://aws.amazon.com/apache2.0
////
//// or in the "license" file accompanying this file. This file is distributed
//// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
//// express or implied. See the License for the specific language governing
//// permissions and limitations under the License.
////

import XCTest
import AWSSSM

class AWSSSMTests: AWSSSMTestBase {
    
    var parameterName: String!
    override func tearDown() {
        super.tearDown()
        
        deleteExistingParameter(parameterName: parameterName)
    }
    
    /// Test put and get operations for string paramter
    ///
    /// - Given: A valid string paramater
    /// - When:
    ///    - The user tries to store a string parameter in paramater store
    ///    - The user then retrieves the stored paramter value from parameter store
    /// - Then:
    ///    - He should get back the same string value that he put in parameter store
    ///
    func testStringParameterPutGetOperations() {
        parameterName = "testStringParameterName" + UUID().uuidString
        let parameterValue = "testStringParameterValue"
        
        putValidTestParameter(parameterName: parameterName,
                              parameterValue: parameterValue,
                              parameterType: AWSSSMParameterType.string)
        
        
        let fetchedParameterValue = getValidTestParameterValue(parameterName: parameterName)
        
        XCTAssertEqual(fetchedParameterValue, parameterValue)
    }
    
    /// Test put and get operations for stringList  parameter type
    ///
    /// - Given: A valid stringList (A string with comma separated elements) paramater
    /// - When:
    ///    - The user tries to store a stringList parameter in paramater store
    ///    - The user then retrieves the stored paramter value from parameter store
    /// - Then:
    ///    - He should get back the same stringList value that he put in parameter store
    ///
    func testStringListParameterPutGetOperations() {
        parameterName = "testStringListParameterName" + UUID().uuidString
        let parameterValue = "testValue1, testValue2"
        
        putValidTestParameter(parameterName: parameterName,
                              parameterValue: parameterValue,
                              parameterType: AWSSSMParameterType.stringList)
        
        
        let fetchedParameterValue = getValidTestParameterValue(parameterName: parameterName)
        
        XCTAssertEqual(fetchedParameterValue, parameterValue)
    }
    
    /// Test put and get operations for secureString  parameter type
    ///
    /// - Given: A valid string parameter with sensitive data
    /// - When:
    ///    - The user tries to store the secure string parameter in paramater store
    ///    - The user then retrieves the stored paramter value from parameter store
    /// - Then:
    ///    - He should get the original string back if `withDecryption` is set
    ///    - Otherwise, He should get back the encrypted string
    ///
    func testSecureStringParameterPutGetOperations() {
        parameterName = "testSecureStringParameterName" + UUID().uuidString
        let parameterValue = "sensitive data"
        
        putValidTestParameter(parameterName: parameterName,
                              parameterValue: parameterValue,
                              parameterType: AWSSSMParameterType.secureString)
        
        
        let encryptedParameterValue = getValidTestParameterValue(parameterName: parameterName)
        
        XCTAssertNotEqual(encryptedParameterValue, parameterValue)
        
        let decryptedParameterValue = getValidTestParameterValue(parameterName: parameterName,
                                                                 withDecryption: true)
        
        XCTAssertEqual(decryptedParameterValue, parameterValue)
    }
}
