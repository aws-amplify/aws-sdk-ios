//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
import AWSLocation

class AWSLocationTests: XCTestCase {
    
    let timeout = 30.0
    var location: AWSLocation!
    var regionName: String!
    var host: String!
    var mapName: String!
    var placeIndexName: String!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        AWSTestUtility.setupSessionCredentialsProvider()
        location = AWSLocation.default()
        
        let region = AWSTestUtility.getRegionFromTestConfiguration()
        regionName = AWSEndpoint.regionName(from: region)
        XCTAssertNotNil(regionName, "Failed to get region name for region: \(region).")
        host = "maps.geo.\(regionName!).amazonaws.com"
        
        let testConfig = AWSTestUtility.getIntegrationTestConfiguration(forPackageId: "location")!
        mapName = testConfig["map_name"] as? String
        placeIndexName = testConfig["place_index"] as? String
        
        XCTAssertNotNil(mapName, "Failed to read map_name from test configuration.")
        XCTAssertNotNil(placeIndexName, "Failed to read place_index from test configuration.")
    }

    override func tearDown() {
        continueAfterFailure = true
        super.tearDown()
    }

    func testGetMapAssets() {
        let testURLs = [
            "https://\(host!)/maps/v0/maps/\(mapName!)/style-descriptor",
            "https://\(host!)/maps/v0/maps/\(mapName!)/tiles/8/53/98"
        ]
        testServiceCalls(testURLs)
    }

    func testGetMapAssetsWithSpecialChars() {
        let testURLs = [
            "https://\(host!)/maps/v0/maps/\(mapName!)/sprites/sprites@2x.json",
            "https://\(host!)/maps/v0/maps/\(mapName!)/glyphs/Noto%20Sans%20Regular/0-255.pbf"
        ]
        testServiceCalls(testURLs)
    }
    
    func testSearchForText() {
        let request = AWSLocationSearchPlaceIndexForTextRequest()!
        request.text = "coffee shops"
        request.biasPosition = [-104.9903, 39.7392]
        request.indexName = placeIndexName
        
        let expResponse = expectation(description: "Search response")
        
        location.searchPlaceIndex(forText: request) { response, error in
            XCTAssertNil(error, error!.localizedDescription)
            XCTAssertNotNil(response, "Failed to get search results.")
            guard let resultCount = response?.results?.count else {
                XCTFail("Failed to get search results.")
                return
            }
            XCTAssertGreaterThan(resultCount, 0, "Failed to get search results.")
            expResponse.fulfill()
        }
        
        waitForExpectations(timeout: timeout)
    }
    
    private func testServiceCalls(_ testURLs: [String]) {
        for testURL in testURLs {
            let signedRequest = getSignedURLRequest(testURL)
            
            let expResponse = expectation(description: "Completion with response")
            let expData = expectation(description: "Completion with data")
            
            let urlSession = URLSession(configuration: .default)
            let dataTask = urlSession.dataTask(with: signedRequest) { data, response, error in
                if let response = response as? HTTPURLResponse {
                    XCTAssertEqual(response.statusCode,
                                   200,
                                   "Received the following http status code: \(response.statusCode)")
                    expResponse.fulfill()
                }
                if let data = data {
                    XCTAssertGreaterThan(data.count,
                                         0,
                                         "Did not receive data.")
                    expData.fulfill()
                }
                if let error = error {
                    XCTFail(error.localizedDescription)
                }
            }
            dataTask.resume()
        }
        
        waitForExpectations(timeout: timeout)
    }
    
    private func getSignedURLRequest(_ testURL: String) -> URLRequest {
        let url: URL! = URL(string: testURL)
        XCTAssertNotNil(url, "Failed to create URL from String: \(testURL)")
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(host, forHTTPHeaderField: "host")
        
        let task = AWSSignatureV4Signer.sigV4SignedURL(with: urlRequest,
                                                       credentialProvider: AWSTestUtility.getDefaultCredentialsProvider(),
                                                       regionName: regionName,
                                                       serviceName: "geo",
                                                       date: Date(),
                                                       expireDuration: 60,
                                                       signBody: true,
                                                       signSessionToken: true)
        task.waitUntilFinished()
        urlRequest.url = task.result as URL?
        
        XCTAssertNil(task.error, "Get signed URL failed with error: \(task.error!)")
        XCTAssertNotNil(urlRequest.url, "Failed to get signed URL.")
        
        return urlRequest
    }
}
