//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
        AWSTestUtility.setupCognitoCredentialsProvider()
        client = AWSLambdaMicroserviceClient.defaultClient()
        
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
        
        let stringBodyRequest = AWSAPIGatewayRequest(HTTPMethod: "POST",
                                                     URLString: "/TestBadPath",
                                                     queryParameters: nil,
                                                     headerParameters: headerParameters,
                                                     HTTPBody: bodyString)
        
        client!.invoke(stringBodyRequest).continueWithBlock { (task:AWSTask) -> AnyObject? in
            if let exception = task.exception {
                print("Exception occured: \(exception)")
                XCTFail("Encountered unexpected exception")
            }
            if let error = task.error {
                print("\(error)")
                XCTFail("Encountered unexpected error")
                return nil
            }
            if let result = task.result {
                let apiResponse = result as! AWSAPIGatewayResponse
                XCTAssertEqual(404, apiResponse.statusCode)
                return nil
            }
            return nil
            }.waitUntilFinished()
    }
    
    func testInvokeStringBody() {
        let bodyString = "{\"key3\": \"value3\",\"key2\": \"value2\",\"key1\": \"value1\"}"
        
        
        
        let stringBodyRequest = AWSAPIGatewayRequest(HTTPMethod: "POST",
                                                     URLString: "/TestFunction",
                                                     queryParameters: nil,
                                                     headerParameters: headerParameters,
                                                     HTTPBody: bodyString)
        
        client!.invoke(stringBodyRequest).continueWithBlock { (task:AWSTask) -> AnyObject? in
            if let exception = task.exception {
                print("Exception occured: \(exception)")
                XCTFail("Encountered unexpected exception")
            }
            if let error = task.error {
                print("\(error)")
                XCTFail("Encountered unexpected error")
                return nil
            }
            if let result = task.result {
                let apiResponse = result as! AWSAPIGatewayResponse
                let datastring = NSString(data: apiResponse.responseData!, encoding: NSUTF8StringEncoding)
                XCTAssertEqual(200, apiResponse.statusCode)
                XCTAssertEqual("\"value1\"", datastring)
                return nil
            }
            return nil
            }.waitUntilFinished()
        
    }
    
    func testInvokeRawDataBody() {
        
        let rawDataBody = "{\"key3\": \"value3\",\"key2\": \"value2\",\"key1\": \"value1\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
        let rawDataBodyRequest = AWSAPIGatewayRequest(HTTPMethod: "POST",
                                                      URLString: "/TestFunction",
                                                      queryParameters: nil,
                                                      headerParameters: headerParameters,
                                                      HTTPBody: rawDataBody!)
        
        client!.invoke(rawDataBodyRequest).continueWithBlock { (task:AWSTask) -> AnyObject? in
            if let exception = task.exception {
                print("Exception occured: \(exception)")
                XCTFail("Encountered unexpected exception")
            }
            if let error = task.error {
                print("\(error)")
                XCTFail("Encountered unexpected error")
                return nil
            }
            if let result = task.result {
                let apiResponse = result as! AWSAPIGatewayResponse
                let datastring = NSString(data: apiResponse.responseData!, encoding: NSUTF8StringEncoding)
                XCTAssertEqual(200, apiResponse.statusCode)
                XCTAssertEqual("\"value1\"", datastring)
                return nil
            }
            return nil
            }.waitUntilFinished()
    }
    
    func testInvokeInputStreamBody() {
        
        let rawDataBody = "{\"key3\": \"value3\",\"key2\": \"value2\",\"key1\": \"value1\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
        var headerParameter = headerParameters
        headerParameter!["Content-Length"] = "\(rawDataBody!.length)"
        print(headerParameter)
        
        let inputStream = NSInputStream(data: rawDataBody!)
        
        let rawDataBodyRequest = AWSAPIGatewayRequest(HTTPMethod: "POST",
                                                      URLString: "/TestFunction",
                                                      queryParameters: nil,
                                                      headerParameters: headerParameters,
                                                      HTTPBody: inputStream)
        
        client!.invoke(rawDataBodyRequest).continueWithBlock { (task:AWSTask) -> AnyObject? in
            if let exception = task.exception {
                print("Exception occured: \(exception)")
                XCTFail("Encountered unexpected exception")
            }
            if let error = task.error {
                print("\(error)")
                XCTFail("Encountered unexpected error")
                return nil
            }
            if let result = task.result {
                let apiResponse = result as! AWSAPIGatewayResponse
                let datastring = NSString(data: apiResponse.responseData!, encoding: NSUTF8StringEncoding)
                XCTAssertEqual(200, apiResponse.statusCode)
                XCTAssertEqual("\"value1\"", datastring)
                return nil
            }
            return nil
            }.waitUntilFinished()
    }
    
    func testInvokeDictionaryBody() {
        let bodyDictionary = [
            "key3": "value3",
            "key2": "value2",
            "key1": "value1",
            ]
        
        let dictionaryBodyRequest = AWSAPIGatewayRequest(HTTPMethod: "POST",
                                                         URLString: "/TestFunction",
                                                         queryParameters: nil,
                                                         headerParameters: headerParameters,
                                                         HTTPBody: bodyDictionary)
        
        client!.invoke(dictionaryBodyRequest).continueWithBlock { (task:AWSTask) -> AnyObject? in
            if let exception = task.exception {
                print("Exception occured: \(exception)")
                XCTFail("Encountered unexpected exception")
            }
            if let error = task.error {
                print("\(error)")
                XCTFail("Encountered unexpected error")
                return nil
            }
            if let result = task.result {
                let apiResponse = result as! AWSAPIGatewayResponse
                let datastring = NSString(data: apiResponse.responseData!, encoding: NSUTF8StringEncoding)
                XCTAssertEqual(200, apiResponse.statusCode)
                XCTAssertEqual("\"value1\"", datastring)
                return nil
            }
            return nil
            }.waitUntilFinished()
    }
    
    func testInvokeProxyPath() {
        
        let proxyPathRequest = AWSAPIGatewayRequest(HTTPMethod: "GET",
                                                         URLString: "/resource1/resource2/some/random/path{}",
                                                         queryParameters: nil,
                                                         headerParameters: headerParameters,
                                                         HTTPBody: nil)
        
        client!.invoke(proxyPathRequest).continueWithBlock { (task:AWSTask) -> AnyObject? in
            if let exception = task.exception {
                print("Exception occured: \(exception)")
                XCTFail("Encountered unexpected exception")
            }
            if let error = task.error {
                print("\(error)")
                XCTFail("Encountered unexpected error")
                return nil
            }
            if let result = task.result {
                let apiResponse = result as! AWSAPIGatewayResponse
                let datastring = NSString(data: apiResponse.responseData!, encoding: NSUTF8StringEncoding)
                XCTAssertEqual(200, apiResponse.statusCode)
                XCTAssertNotNil(datastring)
                return nil
            }
            return nil
            }.waitUntilFinished()
      
    }
    
    func testGet() {
        
        client!.helloWorldGet().continueWithBlock { (task:AWSTask) -> AnyObject? in
            if let exception = task.exception {
                print("Exception occured: \(exception)")
                XCTFail("Encountered unexpected exception")
            }
            if let error = task.error {
                print("\(error)")
                XCTFail("Encountered unexpected error")
                return nil
            }
            if let result = task.result {
                
                XCTAssertEqual("Hello World", result as? String);
                return nil
            }
            return nil
        }.waitUntilFinished()
    }
    
    func testPathParametersWithGet() {

        client!.userUsernameGet("myuser").continueWithBlock { (task:AWSTask) -> AnyObject? in
            if let exception = task.exception {
                print("Exception occured: \(exception)")
                XCTFail("Encountered unexpected exception")
            }
            if let error = task.error {
                print("\(error)")
                XCTFail("Encountered unexpected error")
                return nil
            }
            if let result = task.result {
                XCTAssertEqual("myuser", result as? String);
                return nil
            }
            return nil
            }.waitUntilFinished()
    }
    
    func testPathParametersWithInvoke() {
        
        let parameterPathRequest = AWSAPIGatewayRequest(HTTPMethod: "GET",
                                                    URLString: "/user/myuser2",
                                                    queryParameters: nil,
                                                    headerParameters: headerParameters,
                                                    HTTPBody: nil)
        
        client!.invoke(parameterPathRequest).continueWithBlock { (task:AWSTask) -> AnyObject? in
            if let exception = task.exception {
                print("Exception occured: \(exception)")
                XCTFail("Encountered unexpected exception")
            }
            if let error = task.error {
                print("\(error)")
                XCTFail("Encountered unexpected error")
                return nil
            }
            if let result = task.result {
                let apiResponse = result as! AWSAPIGatewayResponse
                let datastring = NSString(data: apiResponse.responseData!, encoding: NSUTF8StringEncoding)
                XCTAssertEqual(200, apiResponse.statusCode)
                XCTAssertNotNil(datastring)
                XCTAssertEqual(datastring, "\"myuser2\"")
                return nil
            }
            return nil
            }.waitUntilFinished()
    }
}
