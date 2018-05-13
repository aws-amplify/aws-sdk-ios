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
import AWSTranscribe

class AWSTranscribeTests: XCTestCase {
    
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
    }
    
    func testList() {
        let transcribeClient = AWSTranscribe.default()
        
        // We fetch the jobs we have in our account. This test checks basic request response from the service.
        let request = AWSTranscribeListTranscriptionJobsRequest()
        request?.maxResults = 2
        transcribeClient.listTranscriptionJobs(request!).continueWith { (task) -> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "Expected list of jobs but found error.")
                return nil
            }
            print("Job count: \(result.transcriptionJobSummaries!.count)")
            XCTAssertTrue(result.transcriptionJobSummaries!.count >= 0, "The service returned unexpected result.")
            
            return nil
        }.waitUntilFinished()
    }
    
    func testVocabularyOperations() {
        
        let vocabularyName = "hello-world-vocab"
        let transcribeClient = AWSTranscribe.default()
        let createVocabularyRequest = AWSTranscribeCreateVocabularyRequest()
        createVocabularyRequest?.languageCode = .enUS
        createVocabularyRequest?.phrases = ["hello", "world"]
        createVocabularyRequest?.vocabularyName = vocabularyName
        
        transcribeClient.createVocabulary(createVocabularyRequest!).continueWith { (task) -> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "Expected create vocabulory response, but got error.")
                return nil
            }
            
            XCTAssertTrue(result.vocabularyName! == vocabularyName, "Vocabulory names are different. This is unexpected.")
            return nil
        }.waitUntilFinished()
        
        
        let listVocabRequest = AWSTranscribeListVocabulariesRequest()
        transcribeClient.listVocabularies(listVocabRequest!).continueWith { (task) -> Any? in
            guard let result = task.result else {
                XCTAssertFalse(true, "Expected vocabulory list, but got error.")
                return nil
            }
            
            XCTAssertTrue(result.vocabularies!.count == 1, "Only 1 vocabulory expected, but found \(result.vocabularies!.count) instead.")
            return nil
        }.waitUntilFinished()
        
        let deleteVocabularyRequest = AWSTranscribeDeleteVocabularyRequest()
        deleteVocabularyRequest?.vocabularyName = vocabularyName
        
        transcribeClient.deleteVocabulary(deleteVocabularyRequest!).continueWith { (task) -> Any? in
            guard let _ = task.result else {
                XCTAssertTrue(false, "Expected delete confirmation, not error")
                return nil
            }
            return nil
        }.waitUntilFinished()
    }
    
    func testTranscribeRequests() {
        
        let transcribeJobName = "hello-world-job" + UUID().uuidString
        let transcribeClient = AWSTranscribe.default()
        
        let jobRequest = AWSTranscribeStartTranscriptionJobRequest()
        let media = AWSTranscribeMedia()
        
        jobRequest?.languageCode = .enUS
        jobRequest?.mediaFormat = .mp3
        jobRequest?.transcriptionJobName = transcribeJobName
        
        // Transcribe accepts media files stored in S3
        media?.mediaFileUri = "https://s3.amazonaws.com/transcribe-ios-sdk-test/hello_world.mp3"
        
        jobRequest?.media = media
        
        // kick off transcribe job to transcribe a simple "Hello, world" file stored in above specified location
        transcribeClient.startTranscriptionJob(jobRequest!).continueWith { (task) -> Any? in
            guard let result = task.result else {
                XCTAssertTrue(false, "Expected to start a transcribe job, not get error")
                return nil
            }
            
            XCTAssertTrue(result.transcriptionJob!.transcriptionJobStatus == .inProgress, "Status should have been in progress, but was \(result.transcriptionJob!.transcriptionJobStatus)")
            
            return nil
        }.waitUntilFinished()
        
        let getTranscribeJobRequest = AWSTranscribeGetTranscriptionJobRequest()
        getTranscribeJobRequest?.transcriptionJobName = transcribeJobName

        var sleepCount = 0
        var success = false
        while (sleepCount < 10) {
            // keep fetching the status of job till its completed successfully and check the status.
            transcribeClient.getTranscriptionJob(getTranscribeJobRequest!).continueWith(block: { (task) -> Any? in
                guard let result = task.result else {
                    XCTAssertTrue(false, "Failed to get status of job.")
                    return nil
                }
                
                if (result.transcriptionJob!.transcriptionJobStatus == .completed) {
                    let location = result.transcriptionJob!.transcript!.transcriptFileUri
                    // location contains a S3 pre-signed URL which contains the output.
                    print("Location: \(String(describing: location))")
                    success = true
                } else if (result.transcriptionJob!.transcriptionJobStatus == .failed) {
                    XCTAssertTrue(false, "Failed to transcribe.")
                }
                return nil
            }).waitUntilFinished()
            if (success) {
                break
            }
            // wait for 200 seconds for the job to finish
            sleepCount += 1
            sleep(20)
        }
        
        XCTAssertTrue(success, "Failed to do a successful transcribe.")
    }
    
    func startTranscribeJob(name transcribeJobName: String, expectation: XCTestExpectation) {
        
        let transcribeClient = AWSTranscribe.default()
        
        let jobRequest = AWSTranscribeStartTranscriptionJobRequest()
        let media = AWSTranscribeMedia()
        
        jobRequest?.languageCode = .enUS
        jobRequest?.mediaFormat = .mp3
        jobRequest?.transcriptionJobName = transcribeJobName
        
        // Transcribe accepts media files stored in S3
        media?.mediaFileUri = "https://s3.amazonaws.com/transcribe-ios-sdk-test/hello_world.mp3"
        jobRequest?.media = media
        
        // completion handler for start transcription job, calls get to verify state gets to completed.
        let startJobCompletion: (AWSTranscribeStartTranscriptionJobResponse?, Error?) -> Void = { (response, error) in
            guard let response = response else {
                XCTAssertTrue(false, "Expected to start a transcribe job, not get error")
                return
            }
            XCTAssertTrue(response.transcriptionJob!.transcriptionJobStatus == .inProgress,
                          "Status should have been in progress, but was \(response.transcriptionJob!.transcriptionJobStatus)")
            self.isTranscribeComplete(name: transcribeJobName, expectation: expectation)
        }
        
        DispatchQueue.global(qos: .background).async {
            // kick off transcribe job to transcribe a simple "Hello, world" file stored in above specified location
            transcribeClient.startTranscriptionJob(jobRequest!, completionHandler: startJobCompletion)
        }
    }
    
    func isTranscribeComplete(name transcribeJobName: String, expectation: XCTestExpectation) {
        
        let transcribeClient = AWSTranscribe.default()
        
        let getTranscribeJobRequest = AWSTranscribeGetTranscriptionJobRequest()
        getTranscribeJobRequest?.transcriptionJobName = transcribeJobName
        var sleepCount: Int = 1
        var success: Bool = false
        
        let statusCompletion: (AWSTranscribeGetTranscriptionJobResponse?, Error?) -> Void = { (response, error) in
            guard let response = response else {
                XCTAssertTrue(false, "Failed to get status of job.")
                return
            }
            
            if (response.transcriptionJob!.transcriptionJobStatus == .completed) {
                let location = response.transcriptionJob!.transcript!.transcriptFileUri
                // location contains a S3 pre-signed URL which contains the output.
                print("Location: \(String(describing: location))")
                success = true
                expectation.fulfill()
            } else if (response.transcriptionJob!.transcriptionJobStatus == .failed) {
                XCTAssertFalse(true, "Transcribe job failed.")
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            repeat {
                // keep fetching the status of job till its completed successfully and check the status.
                transcribeClient.getTranscriptionJob(getTranscribeJobRequest!, completionHandler: statusCompletion)
                // wait for 200 seconds for the job to finish
                sleepCount += 1
                sleep(20)
            } while (sleepCount < 10 && success == false)
        }
    }
    
    func testTranscribeRequestsCompletionHandlerMethods() {
        
        let transcribeJobName = "hello-world-job" + UUID().uuidString
        let expectation = self.expectation(description: "Transcribe functionality verified.")
        
        self.startTranscribeJob(name: transcribeJobName, expectation: expectation)
        
        wait(for: [expectation], timeout: 210)
    }
    
}
