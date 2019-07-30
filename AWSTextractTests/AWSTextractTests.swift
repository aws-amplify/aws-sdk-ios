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
    
    override func setUp() {
        super.setUp()
        AWSTestUtility.setupCognitoCredentialsProvider()
    }
    
    func testAnalyzeDocumentInS3() {
        let awsTextractClient = AWSTextract.default()
        
        let credentialsJson = AWSTestUtility.getCredentialsJsonAsDictionary()
        let s3ObjectName = credentialsJson?["textract-s3-object-name"]
        let s3BucketName = credentialsJson?["textract-s3-bucket-name"]
        
        let analyzeDocumentRequest = AWSTextractAnalyzeDocumentRequest()
        analyzeDocumentRequest?.featureTypes = ["TABLES","FORMS"]
        
        let s3Object = AWSTextractS3Object()
        s3Object?.name = s3ObjectName
        s3Object?.bucket = s3BucketName
        
        let document = AWSTextractDocument()
        document?.s3Object = s3Object
        analyzeDocumentRequest?.document = document
        
        awsTextractClient.analyzeDocument(analyzeDocumentRequest!).continueWith { (task) -> Any? in
            guard let result = task.result else {
                let error =  task.error as NSError?
                XCTFail("Should not produce error: \(error.debugDescription)")
                return nil
            }
            XCTAssertNotNil(result.documentMetadata, "Should return a document metadata")
            XCTAssertEqual(1, result.documentMetadata?.pages, "Pages count should be 1")
            return nil
            }.waitUntilFinished()
    }
}
