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
import AWSKinesisVideo
import AWSKinesisVideoArchivedMedia

class AWSKinesisVideoArchivedMediaTests: XCTestCase {
    
    let streamPrefix = "kinesisvideoarchivedmedia-integration-test-"
    
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
        
        let kvClient = AWSKinesisVideo.default()
        var currentNextToken: String? = nil
        
        repeat {
            let listStreamsRequest = AWSKinesisVideoListStreamsInput()
            listStreamsRequest?.streamNameCondition = AWSKinesisVideoStreamNameCondition()
            listStreamsRequest?.streamNameCondition?.comparisonOperator = .beginsWith
            listStreamsRequest?.streamNameCondition?.comparisonValue = streamPrefix
            listStreamsRequest?.nextToken = currentNextToken
            
            kvClient.listStreams(listStreamsRequest!) { (result, error) in
                guard let result = result else {
                    XCTFail("Failed to list streams")
                    return
                }
                
                currentNextToken = result.nextToken
                result.streamInfoList?.forEach({ (streamInfo) in
                    let deleteRequest = AWSKinesisVideoDeleteStreamInput()
                    deleteRequest?.streamARN = streamInfo.streamARN
                    // DeleteStream takes a long time to finish
                    // Best effort to kick off deletions
                    kvClient.deleteStream(deleteRequest!)
                })
            }
        } while currentNextToken != nil
        // Best effort to let the network requests through
        sleep(10)
    }
    
    func testGetHlsStreamingSessionUrl() {
        let expectation = self.expectation(description: "Got the endpoint")
        let streamName = streamPrefix + String(Date().timeIntervalSince1970)
        var clientDataEndpoint: String?
        
        let kvClient = AWSKinesisVideo.default()
        let createStreamRequest = AWSKinesisVideoCreateStreamInput()
        createStreamRequest?.streamName = streamName
        createStreamRequest?.dataRetentionInHours = 2
        createStreamRequest?.deviceName = "integration-test"
        createStreamRequest?.mediaType = "video/h264"
        
        kvClient.createStream(createStreamRequest!, completionHandler: {(createResult, error) -> Void in
            guard let _ = createResult else {
                XCTFail("Failed to create stream.")
                return
            }
            
            let getDataEndpointRequest = AWSKinesisVideoGetDataEndpointInput()
            getDataEndpointRequest?.streamName = streamName
            getDataEndpointRequest?.apiName = AWSKinesisVideoAPIName.getHlsStreamingSessionUrl
            kvClient.getDataEndpoint(getDataEndpointRequest!, completionHandler: { (dataEndpointResult, error) in
                guard let dataEndpointResult = dataEndpointResult else {
                    XCTFail("Failed to get data endpoint.")
                    return
                }
                
                guard let endpoint = dataEndpointResult.dataEndpoint else {
                    XCTFail("Data endpoint is null")
                    return
                }
                
                let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
                guard let match = detector.firstMatch(in: endpoint, options: [], range: NSRange(location: 0, length: endpoint.endIndex.encodedOffset)) else {
                    XCTFail("Data endpoint is malformed")
                    return
                }
                
                XCTAssertTrue(match.range.length == endpoint.endIndex.encodedOffset, "The data endpoint was not the only thing in the response, possible malformed URL")
                clientDataEndpoint = endpoint
                expectation.fulfill()
            })
        })
        wait(for: [expectation], timeout: 10)
        
        let streamExpectation = self.expectation(description: "Got the stream")
        let awsEndpoint = AWSEndpoint(region: .USEast1, service: .KinesisVideoArchivedMedia, url: URL(string: clientDataEndpoint!))
        let serviceConfig = AWSServiceConfiguration(region: .USEast1, endpoint: awsEndpoint, credentialsProvider: AWSServiceManager.default().defaultServiceConfiguration.credentialsProvider)
        let kvamClientKey = "testGetHlsStreamingSessionUrl"
        AWSKinesisVideoArchivedMedia.register(with: serviceConfig!, forKey: kvamClientKey)
        let kvamClient = AWSKinesisVideoArchivedMedia(forKey: kvamClientKey)
        
        let streamRequest = AWSKinesisVideoArchivedMediaGetHLSStreamingSessionURLInput()
        streamRequest?.streamName = streamName
        streamRequest?.playbackMode = .live
        kvamClient.getHLSStreamingSessionURL(streamRequest!) { (result, error) in
            guard let result = result,
                let endpoint = result.hlsStreamingSessionURL else {
                    let nsError = error! as NSError
                    // Nothing will be streaming during the test
                    // This error differentiates between another that says stream does not exist
                    // This error code does not sufficiently check that the stream has "No fragments found in the stream for the HLS streaming request"
                    // But it is all that is available in iOS
                    // TODO Stream data in parallel
                    XCTAssertTrue(nsError.code == AWSKinesisVideoArchivedMediaErrorType.resourceNotFound.rawValue)
                    streamExpectation.fulfill()
                    return
            }
            
            let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            guard let match = detector.firstMatch(in: endpoint, options: [], range: NSRange(location: 0, length: endpoint.endIndex.encodedOffset)) else {
                XCTFail("Streaming url is malformed")
                return
            }
            
            XCTAssertTrue(match.range.length == endpoint.endIndex.encodedOffset, "The streaming url was not the only thing in the response, possible malformed URL")
            streamExpectation.fulfill()
        }
        wait(for: [streamExpectation], timeout: 10)
    }
    
}
