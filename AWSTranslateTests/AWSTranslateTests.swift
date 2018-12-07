//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
import AWSTranslate

class AWSTranslateTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        // Setup cognito credentials to use for tests.
        AWSTestUtility.setupCognitoCredentialsProvider()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTranslateText() {
        let expectation = self.expectation(description: "Translation complete")
        let translateClient = AWSTranslate.default()
        let translateRequest = AWSTranslateTranslateTextRequest()
        translateRequest?.sourceLanguageCode = "en"
        translateRequest?.targetLanguageCode = "es"
        translateRequest?.text = "Hello World"
        
        let callback: (AWSTranslateTranslateTextResponse?, Error?) -> Void = { (response, error) in
            guard let response = response else {
                XCTAssertTrue(false,"Got error \(String(describing: error))")
                return
            }
            XCTAssertNotNil(response.translatedText)
            
            if let translatedText = response.translatedText {
                XCTAssertEqual(translatedText, "Hola Mundo")
            }
            expectation.fulfill()
        }
        
        translateClient.translateText(translateRequest!, completionHandler: callback)
        wait(for:[expectation], timeout:5)
    }
    
    func testTranslateTextSameLanguageCode() {
        let expectation = self.expectation(description: "Translation complete")
        let translateClient = AWSTranslate.default()
        let translateRequest = AWSTranslateTranslateTextRequest()
        translateRequest?.sourceLanguageCode = "en"
        translateRequest?.targetLanguageCode = "en"
        translateRequest?.text = "Hello World"
        
        let callback: (AWSTranslateTranslateTextResponse?, Error?) -> Void = { (response, error) in
            guard let response = response else {
                XCTAssertTrue(false,"Got error \(String(describing: error))")
                return
            }
            XCTAssertNotNil(response.translatedText)
            
            if let translatedText = response.translatedText {
                XCTAssertEqual(translatedText, "Hello World")
            }
            expectation.fulfill()
        }
        
        translateClient.translateText(translateRequest!, completionHandler: callback)
        wait(for:[expectation], timeout:5)
    }
    
}
