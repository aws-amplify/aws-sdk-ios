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
import AWSRekognition

class AWSRekognitionTests: XCTestCase {
    
    var rekognition: AWSRekognition!
    let collectionId = "MyCollectionID"
    
    override class func setUp() {
        super.setUp()
        AWSTestUtility.setupSessionCredentialsProvider()
    }

    override func setUp() {
        rekognition = AWSRekognition.default()
        let collectionRequest = AWSRekognitionCreateCollectionRequest()
        collectionRequest?.collectionId = collectionId
        rekognition.createCollection(collectionRequest!).continueWith { (response) -> Any? in
            if let error = response.error as NSError? {
                XCTAssertEqual(error.domain , AWSRekognitionErrorDomain)
                XCTAssertEqual(error.code, AWSRekognitionErrorType.resourceAlreadyExists.rawValue)
            } else {
                XCTAssertNotNil(response.result)
                if let result = response.result {
                    print(result)
                }
            }
            return nil
        }.waitUntilFinished()
    }
    
    func testFaceIndexSingleFace() {
        let faceRequest = AWSRekognitionIndexFacesRequest()
        let testBundle = Bundle(for: type(of: self))
        let fileURL = testBundle.url(forResource: "singleface", withExtension: "jpg")
        var data:Data?
        do {
            data = try Data(contentsOf:fileURL!)
            let image = AWSRekognitionImage()
            image?.bytes = data
            
            faceRequest!.image = image
            faceRequest!.collectionId = collectionId
            
            rekognition.indexFaces(faceRequest!).continueWith { (response) -> Any? in
                XCTAssertNil(response.error)
                XCTAssertNotNil(response.result)
                if let result = response.result {
                    XCTAssertNotNil(result.faceRecords)
                    if let fr = result.faceRecords {
                        XCTAssertEqual(fr.count, 1)
                    }
                }
                return nil
            }.waitUntilFinished()
        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testFaceIndexMultipleFaces() {
        let faceRequest = AWSRekognitionIndexFacesRequest()
        let testBundle = Bundle(for: type(of: self))
        let fileURL = testBundle.url(forResource: "family_thumb", withExtension: "jpg")
        var data:Data?
        do {
            data = try Data(contentsOf:fileURL!)
            let image = AWSRekognitionImage()
            image?.bytes = data
            
            faceRequest!.image = image
            faceRequest!.collectionId = collectionId
            
            rekognition.indexFaces(faceRequest!).continueWith { (response) -> Any? in
                XCTAssertNil(response.error)
                XCTAssertNotNil(response.result)
                if let result = response.result {
                    XCTAssertNotNil(result.faceRecords)
                    if let fr = result.faceRecords {
                        XCTAssertEqual(fr.count, 3)
                    }
                }
                return nil
            }.waitUntilFinished()
        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testFaceIndexNoFaces() {
        let faceRequest = AWSRekognitionIndexFacesRequest()
        let testBundle = Bundle(for: type(of: self))
        let fileURL = testBundle.url(forResource: "city_thumb", withExtension: "jpg")
        var data:Data?
        do {
            data = try Data(contentsOf:fileURL!)
            let image = AWSRekognitionImage()
            image?.bytes = data
            
            faceRequest!.image = image
            faceRequest!.collectionId = collectionId
            
            rekognition.indexFaces(faceRequest!).continueWith { (response) -> Any? in
                XCTAssertNil(response.error)
                XCTAssertNotNil(response.result)
                if let result = response.result {
                    XCTAssertNotNil(result.faceRecords)
                    if let fr = result.faceRecords {
                        XCTAssertEqual(fr.count, 0)
                    }
                }
                return nil
            }.waitUntilFinished()
        } catch {
            XCTAssertNil(error)
        }
    }
}
