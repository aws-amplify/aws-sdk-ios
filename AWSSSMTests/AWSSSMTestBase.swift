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
@testable import AWSSSM

class AWSSSMTestBase: XCTestCase {
    
    override func setUp() {
        // Setup cognito credentials to use for tests.
        AWSTestUtility.setupCognitoCredentialsProvider()
    }
    
    func putValidTestParameter(parameterName: String,
                               parameterValue: String,
                               parameterType: AWSSSMParameterType) {
        let putParameterExpectation = self.expectation(description: "Put Parameter Success")
        let ssmClient = AWSSSM.default()
        
        let putParameterRequest = AWSSSMPutParameterRequest()
        putParameterRequest?.name = parameterName
        putParameterRequest?.value = parameterValue
        putParameterRequest?.types = parameterType
        putParameterRequest?.overwrite = true
        
        let putParameterCallback:(AWSSSMPutParameterResult?, Error?) -> Void = { (response, error) in
            guard let response = response else {
                XCTAssertTrue(false,"Got error \(String(describing: error))")
                return
            }
            XCTAssertNotNil(response.version)
            putParameterExpectation.fulfill()
        }
        
        ssmClient.putParameter(putParameterRequest!,
                               completionHandler: putParameterCallback)
        wait(for:[putParameterExpectation], timeout:5)
    }
    
    func getValidTestParameterValue(parameterName: String,
                                    withDecryption: Bool = false) -> String? {
        let getParameterExpectation = self.expectation(description: "Fetch Parameter Value Success")
        let ssmClient = AWSSSM.default()
        var testParameterValue: String?
        
        
        let getParamterRequest = AWSSSMGetParameterRequest()
        getParamterRequest?.name = parameterName
        getParamterRequest?.withDecryption = withDecryption as NSNumber?
        
        let getParameterCallback: (AWSSSMGetParameterResult?, Error?) -> Void = { (response, error) in
            guard let response = response else {
                XCTAssertTrue(false,"Got error \(String(describing: error))")
                return
            }
            XCTAssertNotNil(response.parameter)
            
            if let parameter = response.parameter {
                XCTAssertNotNil(parameter.value)
                testParameterValue = parameter.value
            }
            getParameterExpectation.fulfill()
        }
        
        ssmClient.getParameter(getParamterRequest!,
                               completionHandler: getParameterCallback)
        wait(for:[getParameterExpectation], timeout:5)
        
        return testParameterValue
    }
    
    func deleteExistingParameter(parameterName: String) {
        let deleteParameterExpectation = self.expectation(description: "Delete Parameter Success")
        let ssmClient = AWSSSM.default()
        
        let deleteParamterRequest = AWSSSMDeleteParameterRequest()
        deleteParamterRequest?.name = parameterName
        
        let deleteParameterCallback: (AWSSSMDeleteParameterResult?, Error?) -> Void = { (response, error) in
            guard let response = response else {
                XCTAssertTrue(false,"Got error \(String(describing: error))")
                return
            }
            XCTAssertNotNil(response)
            
            deleteParameterExpectation.fulfill()
        }
        
        ssmClient.deleteParameter(deleteParamterRequest!,
                               completionHandler: deleteParameterCallback)
        wait(for:[deleteParameterExpectation], timeout:5)
    }
}
