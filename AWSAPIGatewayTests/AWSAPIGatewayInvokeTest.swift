//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

import Foundation
import AWSAPIGateway
import XCTest

var client: AWSLambdaMicroserviceClient?
var headerParameters: [String:String]?

class TestAPIGatewayInvoke: XCTestCase {
    
    override func setUp() {
        super.setUp()
        AWSTestUtility.setupSessionCredentialsProvider()
        let testConfig = AWSTestUtility.getIntegrationTestConfiguration(forPackageId: "apigateway")
        client = AWSLambdaMicroserviceClient.defaultClient(testConfig!["endpointURL"] as! String)
        
        headerParameters = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            ]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInvokeFailure() {
        
        let bodyString = "{\"key3\": \"value3\",\"key2\": \"value2\",\"key1\": \"value1\"}"
        
        let stringBodyRequest = AWSAPIGatewayRequest(httpMethod: "POST",
                                                     urlString: "/TestBadPath",
                                                     queryParameters: nil,
                                                     headerParameters: headerParameters,
                                                     httpBody: bodyString)
        
        client!.invoke(stringBodyRequest).continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }
            
            guard let result = task.result else {
                XCTFail("Result unexpectedly nil")
                return nil
            }
            
            let apiResponse = result
            XCTAssertEqual(404, apiResponse.statusCode)

            return nil
        }).waitUntilFinished()
    }
    
    func testInvokeStringBody() {
        let bodyString = "{\"key3\": \"value3\",\"key2\": \"value2\",\"key1\": \"value1\"}"
        
        let stringBodyRequest = AWSAPIGatewayRequest(httpMethod: "POST",
                                                     urlString: "/TestFunction",
                                                     queryParameters: nil,
                                                     headerParameters: headerParameters,
                                                     httpBody: bodyString)
        
        client!.invoke(stringBodyRequest).continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }

            guard let result = task.result else {
                XCTFail("Result unexpectedly nil")
                return nil
            }

            let apiResponse = result
            XCTAssertEqual(200, apiResponse.statusCode)

            guard let jsonObject = try? JSONSerialization.jsonObject(with: apiResponse.responseData!) else {
                XCTFail("Unable to convert response data to JSON Object")
                return nil
            }

            guard let json = jsonObject as? [String: Any] else {
                XCTFail("Expected JSON to be a dictionary")
                return nil
            }

            XCTAssertEqual(json["key1"] as? String, "value1")
            XCTAssertEqual(json["key2"] as? String, "value2")
            XCTAssertEqual(json["key3"] as? String, "value3")

            return nil
        }).waitUntilFinished()
        
    }
    
    func testInvokeRawDataBody() {
        
        let rawDataBody = "{\"key3\": \"value3\",\"key2\": \"value2\",\"key1\": \"value1\"}".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        let rawDataBodyRequest = AWSAPIGatewayRequest(httpMethod: "POST",
                                                      urlString: "/TestFunction",
                                                      queryParameters: nil,
                                                      headerParameters: headerParameters,
                                                      httpBody: rawDataBody!)
        
        client!.invoke(rawDataBodyRequest).continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }
            
            guard let result = task.result else {
                XCTFail("Result unexpectedly nil")
                return nil
            }
    
            let apiResponse = result
            XCTAssertEqual(200, apiResponse.statusCode)

            guard let jsonObject = try? JSONSerialization.jsonObject(with: apiResponse.responseData!) else {
                XCTFail("Unable to convert response data to JSON Object")
                return nil
            }
            guard let json = jsonObject as? [String: Any] else {
                XCTFail("Expected JSON to be a dictionary")
                return nil
            }

            XCTAssertEqual(json["key1"] as? String, "value1")
            XCTAssertEqual(json["key2"] as? String, "value2")
            XCTAssertEqual(json["key3"] as? String, "value3")

            return nil
        }).waitUntilFinished()
    }
    
    func testInvokeInputStreamBody() {
        
        let rawDataBody = "{\"key3\": \"value3\",\"key2\": \"value2\",\"key1\": \"value1\"}".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        var headerParameter = headerParameters
        headerParameter!["Content-Length"] = "\(rawDataBody!.count)"
        print(headerParameter!.description)
        
        let inputStream = InputStream(data: rawDataBody!)
        
        let rawDataBodyRequest = AWSAPIGatewayRequest(httpMethod: "POST",
                                                      urlString: "/TestFunction",
                                                      queryParameters: nil,
                                                      headerParameters: headerParameters,
                                                      httpBody: inputStream)
        
        client!.invoke(rawDataBodyRequest).continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }

            guard let result = task.result else {
                XCTFail("Result unexpectedly nil")
                return nil
            }
            
            let apiResponse = result
            XCTAssertEqual(200, apiResponse.statusCode)

            guard let jsonObject = try? JSONSerialization.jsonObject(with: apiResponse.responseData!) else {
                XCTFail("Unable to convert response data to JSON Object")
                return nil
            }

            guard let json = jsonObject as? [String: Any] else {
                XCTFail("Expected JSON to be a dictionary")
                return nil
            }

            XCTAssertEqual(json["key1"] as? String, "value1")
            XCTAssertEqual(json["key2"] as? String, "value2")
            XCTAssertEqual(json["key3"] as? String, "value3")

            return nil
        }).waitUntilFinished()
    }
    
    func testInvokeDictionaryBody() {
        let bodyDictionary = [
            "key3": "value3",
            "key2": "value2",
            "key1": "value1",
            ]
        
        let dictionaryBodyRequest = AWSAPIGatewayRequest(httpMethod: "POST",
                                                         urlString: "/TestFunction",
                                                         queryParameters: nil,
                                                         headerParameters: headerParameters,
                                                         httpBody: bodyDictionary)
        
        client!.invoke(dictionaryBodyRequest).continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }

            guard let result = task.result else {
                XCTFail("Result unexpectedly nil")
                return nil
            }
            
            let apiResponse = result
            XCTAssertEqual(200, apiResponse.statusCode)

            guard let jsonObject = try? JSONSerialization.jsonObject(with: apiResponse.responseData!) else {
                XCTFail("Unable to convert response data to JSON Object")
                return nil
            }

            guard let json = jsonObject as? [String: Any] else {
                XCTFail("Expected JSON to be a dictionary")
                return nil
            }

            XCTAssertEqual(json["key1"] as? String, "value1")
            XCTAssertEqual(json["key2"] as? String, "value2")
            XCTAssertEqual(json["key3"] as? String, "value3")
            
            return nil
            }).waitUntilFinished()
    }
    
    func testInvokeProxyPath() {
        
        let proxyPathRequest = AWSAPIGatewayRequest(httpMethod: "GET",
                                                         urlString: "/user/myuser{}",
                                                         queryParameters: nil,
                                                         headerParameters: headerParameters,
                                                         httpBody: nil)
        
        client!.invoke(proxyPathRequest).continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }
            
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }

            guard let result = task.result else {
                XCTFail("Result unexpectedly nil")
                return nil
            }
            
            let apiResponse = result
            XCTAssertEqual(200, apiResponse.statusCode)

            guard let jsonObject = try? JSONSerialization.jsonObject(with: apiResponse.responseData!) else {
                XCTFail("Unable to convert response data to JSON Object")
                return nil
            }
            
            guard let json = jsonObject as? [String: Any] else {
                XCTFail("Expected JSON to be a dictionary")
                return nil
            }

            guard let value = json["value"] as? String else {
                XCTFail("Can't get String 'value' from JSON object")
                return nil
            }
            
            XCTAssertEqual(value, "myuser%7B%7D")

            return nil
            }).waitUntilFinished()
      
    }
    
    func testInvokePathWithQueryString() {
        let proxyPathRequest = AWSAPIGatewayRequest(httpMethod: "GET",
                                                    urlString: "/TestFunction",
                                                    queryParameters: ["key1": "myuser{}"],
                                                    headerParameters: headerParameters,
                                                    httpBody: nil)
        
        client!.invoke(proxyPathRequest).continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }
            
            guard let result = task.result else {
                XCTFail("Result unexpectedly nil")
                return nil
            }
        
            let apiResponse = result
            XCTAssertEqual(200, apiResponse.statusCode)

            guard let jsonObject = try? JSONSerialization.jsonObject(with: apiResponse.responseData!) else {
                XCTFail("Can't create JSON object from apiResponse.responseData")
                return nil
            }
            
            guard let json = jsonObject as? [String: Any] else {
                XCTFail("Can't cast jsonObject as [String:Any]")
                return nil
            }
            
            guard let value = json["value"] as? String else {
                XCTFail("Can't get String 'value' from JSON object")
                return nil
            }

            XCTAssertEqual(value, "myuser{}")
            
            return nil

        }).waitUntilFinished()
        
    }
    
    func testGet() {
        client!.helloWorldGet().continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }
            
            guard let result = task.result as? String else {
                XCTFail("Result unexpectedly nil or not convertible to String")
                return nil
            }

            XCTAssertEqual("Hello World", result);

            return nil
        }).waitUntilFinished()
    }
    
    func testPathParametersWithGet() {
        client!.userUsernameGet("myuser{}").continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }
            
            guard let result = task.result as? AWSStringValue else {
                XCTFail("Result unexpectedly nil or does not cast to AWSStringValue")
                return nil
            }
            
            XCTAssertEqual("myuser%7B%7D", result.value);

            return nil
        }).waitUntilFinished()
    }
    
    func testQueryStringParametersWithGet() {
        client!.testFunctionGet("myuser{}").continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }
            
            guard let result = task.result as? AWSStringValue else {
                XCTFail("Result unexpectedly nil or does not cast to AWSStringValue")
                return nil
            }
            
            XCTAssertEqual("myuser{}", result.value);

            return nil
        }).waitUntilFinished()
    }
    
    func testPathParametersWithInvoke() {
        
        let parameterPathRequest = AWSAPIGatewayRequest(httpMethod: "GET",
                                                    urlString: "/user/myuser2",
                                                    queryParameters: nil,
                                                    headerParameters: headerParameters,
                                                    httpBody: nil)
        
        client!.invoke(parameterPathRequest).continueWith(block: { (task:AWSTask) -> AnyObject? in
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }
            
            if let error = task.error {
                XCTFail("Encountered unexpected error: \(error)")
                return nil
            }

            guard let result = task.result else {
                XCTFail("Result unexpectedly nil")
                return nil
            }
            
            let apiResponse = result
            XCTAssertEqual(200, apiResponse.statusCode)

            guard let jsonObject = try? JSONSerialization.jsonObject(with: apiResponse.responseData!) else {
                XCTFail("Unable to convert response data to JSON Object")
                return nil
            }
            
            guard let json = jsonObject as? [String: Any] else {
                XCTFail("Expected JSON to be a dictionary")
                return nil
            }
            
            guard let value = json["value"] as? String else {
                XCTFail("Can't get String 'value' from JSON object")
                return nil
            }
            
            XCTAssertEqual(value, "myuser2")
            
            return nil
        }).waitUntilFinished()
    }
}
