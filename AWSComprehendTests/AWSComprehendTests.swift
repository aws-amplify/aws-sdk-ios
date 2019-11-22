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
import AWSComprehend

class AWSComprehendTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        // Setup cognito credentials to use for tests.
        AWSTestUtility.setupCognitoCredentialsProvider()
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDetectDominantLanguageEnglish() {
        let comprehendClient = AWSComprehend.default()
        let detectDominantLanguageRequest = AWSComprehendDetectDominantLanguageRequest()
        detectDominantLanguageRequest!.text = "The sun shines in Seattle";
        
        comprehendClient.detectDominantLanguage(detectDominantLanguageRequest!).continueWith { (task) -> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "got error.")
                return nil
            }
            XCTAssertNotNil(result)
            XCTAssertGreaterThan(result.languages!.count, 0, "Got at least 1 dominant language")
            XCTAssertEqual(result.languages!.first?.languageCode, "en", "Dominant language is English")
            return nil
        }.waitUntilFinished()
    }
    
    func testDetectDominantLanguageSpanish() {
        let comprehendClient = AWSComprehend.default()
        let detectDominantLanguageRequest = AWSComprehendDetectDominantLanguageRequest()
        detectDominantLanguageRequest!.text = "El sol brilla en Seattle";
        
        comprehendClient.detectDominantLanguage(detectDominantLanguageRequest!).continueWith { (task) -> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "got error.")
                return nil
            }
            XCTAssertNotNil(result)
            XCTAssertGreaterThan(result.languages!.count, 0, "Got at least 1 dominant language")
            XCTAssertEqual(result.languages!.first?.languageCode, "es", "Dominant language is Spanish")
            return nil
            }.waitUntilFinished()
    }
    
    func testDetectNamedEntities() {
        let comprehendClient = AWSComprehend.default()
        let detectEntitiesRequest = AWSComprehendDetectEntitiesRequest()
        detectEntitiesRequest!.languageCode = AWSComprehendLanguageCode.en
        detectEntitiesRequest!.text = "The sun shines in Seattle"
        
        comprehendClient.detectEntities(detectEntitiesRequest!).continueWith{ (task) -> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "got error: \(String(describing: task.error))")
                return nil
            }
            XCTAssertNotNil(result)
            XCTAssertGreaterThan(result.entities!.count, 0, "Found least 1 entity")
            XCTAssertEqual(result.entities!.first?.text, "Seattle", "Entity is Seattle")
            return nil
        }.waitUntilFinished()
    }
   
    func testDetectKeyPhrases() {
        let comprehendClient = AWSComprehend.default()
        let detectKeyPhrasesRequest = AWSComprehendDetectKeyPhrasesRequest()
        detectKeyPhrasesRequest!.languageCode = AWSComprehendLanguageCode.en
        detectKeyPhrasesRequest!.text = "The sun shines in Seattle"
        
        comprehendClient.detectKeyPhrases(detectKeyPhrasesRequest!).continueWith{ (task)-> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "got error.")
                return nil
            }
            XCTAssertNotNil(result)
            XCTAssertGreaterThan(result.keyPhrases!.count, 0, "Found least 1 key phrase")
            XCTAssertEqual(result.keyPhrases!.first?.text, "The sun", "Key phrase is 'the sun'")
            return nil
        }.waitUntilFinished()
    }
    
    func testDetectSentimentPositive() {
        let comprehendClient = AWSComprehend.default()
        let detectSentimentRequest = AWSComprehendDetectSentimentRequest()
        detectSentimentRequest!.languageCode = AWSComprehendLanguageCode.en
        detectSentimentRequest!.text = "The sun shines in Seattle!!"
        
        comprehendClient.detectSentiment(detectSentimentRequest!).continueWith{ (task)-> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "got error.")
                return nil
            }
            XCTAssertNotNil(result)
            XCTAssertEqual(result.sentiment, AWSComprehendSentimentType.positive, "Detected positive sentiment")
            return nil
            }.waitUntilFinished()
    }
    
    func testDetectSentimentNeutral() {
        let comprehendClient = AWSComprehend.default()
        let detectSentimentRequest = AWSComprehendDetectSentimentRequest()
        detectSentimentRequest!.languageCode = AWSComprehendLanguageCode.en
        detectSentimentRequest!.text = "It is raining in Seattle"
        
        comprehendClient.detectSentiment(detectSentimentRequest!).continueWith{ (task)-> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "got error.")
                return nil
            }
            XCTAssertNotNil(result)
            XCTAssertEqual(result.sentiment, AWSComprehendSentimentType.neutral, "Detected neutral sentiment")
            return nil
            }.waitUntilFinished()
    }
    
    func testDetectSentimentNegative() {
        let comprehendClient = AWSComprehend.default()
        let detectSentimentRequest = AWSComprehendDetectSentimentRequest()
        detectSentimentRequest!.languageCode = AWSComprehendLanguageCode.en
        detectSentimentRequest!.text = "This view is horrible"
        
        comprehendClient.detectSentiment(detectSentimentRequest!).continueWith{ (task)-> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "got error.")
                return nil
            }
            XCTAssertNotNil(result)
            XCTAssertEqual(result.sentiment, AWSComprehendSentimentType.negative, "Detected negative sentiment")
            return nil
            }.waitUntilFinished()
    }

    func testDetectBatchEntities() {
        let comprehendClient = AWSComprehend.default()
        let inputStrings:[String] = ["I love AWS Mobile SDK", "Today is Sunday", "Tomorrow is Monday","I love AWS Amplify"]
        let batchEntityRequest = AWSComprehendBatchDetectEntitiesRequest()
        batchEntityRequest!.languageCode = AWSComprehendLanguageCode.en
        batchEntityRequest!.textList = inputStrings
        
        comprehendClient.batchDetectEntities(batchEntityRequest!).continueWith{ (task)-> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "got error.")
                return nil
            }
            XCTAssertNotNil(result)
            XCTAssertNotNil(result.resultList)
            XCTAssertEqual(result.resultList!.count, 4, "Should return 4 results")
            return nil
        }.waitUntilFinished()
    }
}
