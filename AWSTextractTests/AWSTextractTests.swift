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
import AWSTextract
import AWSS3

class AWSTextractTests : XCTestCase {
    
    override func setUp() {
        super.setUp()
        AWSTestUtility.setupSessionCredentialsProvider()
    }
    
    func testAnalyzeDocument() throws {
        let awsTextractClient = AWSTextract.default()
        
        guard let analyzeDocumentRequest = AWSTextractAnalyzeDocumentRequest() else {
            XCTFail("analyzeDocumentRequest unexpectedly nil")
            return
        }
        analyzeDocumentRequest.featureTypes = ["TABLES","FORMS"]
        
        guard let document = AWSTextractDocument() else {
            XCTFail("document unexpectedly nil")
            return
        }
        
        document.bytes = try AWSTextractTests.getTestImageBytes()
        analyzeDocumentRequest.document = document
        awsTextractClient.analyzeDocument(analyzeDocumentRequest).continueWith { (task) -> Any? in
            if let error = task.error {
                XCTFail("Should not produce error: \(error)")
                return nil
            }
            guard let result = task.result else {
                XCTFail("Result unexpectedly nil")
                return nil
            }
            guard let documentMetadata = result.documentMetadata else {
                XCTFail("Should return a document metadata")
                return nil
            }
            XCTAssertEqual(1, documentMetadata.pages, "Pages count should be 1")
            return nil
        }.waitUntilFinished()
    }

    static func getTestImageBytes() throws -> Data {
        let bundle = Bundle(for: self)
        guard let imageUrl = bundle.url(forResource: "amazon-developer-tools", withExtension: "jpg") else {
            throw "Could not load test image"
        }
        
        let data = try Data(contentsOf: imageUrl)
        return data
    }
}

extension String: Error { }
