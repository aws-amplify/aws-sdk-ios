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

import UIKit
import XCTest
import AWSDynamoDB

var tableName = ""

class TestObjectV2: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var hashKeyRenamed: String?
    var rangeKeyRenamed: String?

    var stringAttributeRenamed: String?
    var numberAttributeRenamed: NSNumber?
    var binaryAttributeRenamed: Data?

    var stringSetAttributeRenamed: Set<String>?
    var numberSetAttributeRenamed: Set<NSNumber>?
    var binarySetAttributeRenamed: Set<Data>?

    var bool2ElementRenamed: NSNumber?
    var listElementRenamed:  Array<NSObject>?
    var mapElementRenamed: Dictionary<String, NSObject>?

    var emptyElement: NSString?

    class func dynamoDBTableName() -> String {
        return tableName
    }

    class func hashKeyAttribute() -> String {
        return "hashKeyRenamed"
    }

    class func rangeKeyAttribute() -> String {
        return "rangeKeyRenamed"
    }

    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return ["hashKeyRenamed" : "hashKey1",
                "rangeKeyRenamed" : "rangeKey1",
                "stringAttributeRenamed" : "stringAttribute",
                "numberAttributeRenamed" : "numberAttribute",
                "binaryAttributeRenamed" : "binaryAttribute",
                "stringSetAttributeRenamed" : "stringSetAttribute",
                "numberSetAttributeRenamed" : "numberSetAttribute",
                "binarySetAttributeRenamed" : "binarySetAttribute",
                "bool2ElementRenamed" : "bool2Element",
                "listElementRenamed" : "listElement",
                "mapElementRenamed" : "mapElement",];
    }
}

class AWSDynamoDBObjectMapperSwiftTests: XCTestCase {
    override func setUp() {
        super.setUp()
        AWSTestUtility.setupCognitoCredentialsProvider()

        let timeIntervalSinceReferenceDate = Int(Date().timeIntervalSinceReferenceDate)
        tableName = "DynamoDBOMTestSwift-\(timeIntervalSinceReferenceDate)"

        AWSDynamoDBTestUtility.createTable(tableName)
    }

    override func tearDown() {
        AWSDynamoDBTestUtility.deleteTable(tableName)
        super.tearDown()
    }

    func testBooleanNumber() {
        let boolNumberArray:Array<AnyObject> = [true as AnyObject, false as AnyObject, NSNumber(value: true as Bool), NSNumber(value: false as Bool)]
        let nonBoolNumberArray:Array<AnyObject> = [20 as AnyObject, 500.34 as AnyObject, NSNumber(value: 34 as Int), NSNumber(value: 3 as Int8), NSNumber(value: 23.4 as Float)]
        let myboolClass = type(of: NSNumber(value: true as Bool))
        let klass: AnyClass = object_getClass(NSNumber(value: true as Bool))

        for myNum in boolNumberArray {
            let result = myNum.isKind(of: myboolClass)
            XCTAssertTrue(result,"\(myNum) should be a boolClass")
        }

        for myNum in nonBoolNumberArray {
            let result2 = myNum.isKind(of: myboolClass)
            XCTAssertFalse(result2, "\(myNum) should be a boolClass")
        }

        for myNum in boolNumberArray {
            let result = myNum.isKind(of: klass)
            XCTAssertTrue(result,"\(myNum) should be a boolClass")
        }

        for myNum in nonBoolNumberArray {
            let result2 = myNum.isKind(of: klass)
            XCTAssertFalse(result2, "\(myNum) should be a boolClass")
        }
    }

    func testSaveBehaviorUpdateV2() {
        let objectMapper = AWSDynamoDBObjectMapper.default()
        let hashKeyValue = "hash-v2-swift-\(#function)"
        let rangeKeyValue = "range-v2-swift-\(#function)"

        let stringElement = "testString"
        let numberElement = 123.4
        let binaryElement = "testData".data(using: String.Encoding.utf8, allowLossyConversion: false)!

        let stringSet = Set(["StringSet1", "stringSet2", "stringSet3"])
        let numberSet = Set([1, 2, 3])
        let data1 = "testDataSet1".data(using: String.Encoding.utf8, allowLossyConversion: false)!
        let data2 = "testDataSet2".data(using: String.Encoding.utf8, allowLossyConversion: false)!
        let data3 = "testDataSet4".data(using: String.Encoding.utf8, allowLossyConversion: false)!
        let binarySet = Set([data1, data2, data3])
        let boolElement = true
        let listElement = ["StringInList" as NSString, 55 as NSNumber, binaryElement as NSData, stringSet as NSSet, numberSet as NSSet, binarySet as NSSet, true as NSNumber, ["stringInListOfList", 57] as NSArray] as Array<NSObject>
        let mapElement = ["mapStringKey" : "mapStringValue" as NSString,
                          "mapNumberKey" : 98 as NSNumber,
                          "mapBinaryKey" : binaryElement as NSData,
                          "mapStringSetKey" : stringSet as NSSet,
                          "mapNumberSetKey" : numberSet as NSSet,
                          "mapBoolKey" : true as NSNumber,
                          "mapListKey" : listElement as NSArray,
                          "mapMapKey" : [
                            "str" : "strValue",
                            "num" : 5,
                            "lst" : listElement] as NSDictionary] as Dictionary<String, NSObject>

        let objv2 = TestObjectV2()
        objv2?.hashKeyRenamed = hashKeyValue
        objv2?.rangeKeyRenamed = rangeKeyValue
        objv2?.stringAttributeRenamed = stringElement
        objv2?.numberAttributeRenamed = numberElement as NSNumber?
        objv2?.binaryAttributeRenamed = binaryElement;
        objv2?.stringSetAttributeRenamed = stringSet
        objv2?.numberSetAttributeRenamed = numberSet as Set<NSNumber>?
        objv2?.binarySetAttributeRenamed = binarySet
        objv2?.bool2ElementRenamed = boolElement as NSNumber?
        objv2?.listElementRenamed = listElement as Array<NSObject>
        objv2?.mapElementRenamed = mapElement as Dictionary<String, NSObject>?

        objectMapper.save(objv2!).continueWith(block: { (task) -> AnyObject? in
            return objectMapper.load(TestObjectV2.self, hashKey: hashKeyValue, rangeKey: rangeKeyValue)
        }).continueWith (block: { (task) -> AnyObject? in
                if (task.error != nil) {
                    XCTFail("Error: \(task.error)")
                }
                if let obj = task.result as? TestObjectV2 {
                    XCTAssertEqual(obj.hashKeyRenamed, hashKeyValue)
                    XCTAssertEqual(obj.rangeKeyRenamed, rangeKeyValue)
                    XCTAssertEqual(obj.stringAttributeRenamed, stringElement)
                    XCTAssertEqual(obj.numberAttributeRenamed, numberElement as NSNumber?)
                    XCTAssertEqual(obj.binaryAttributeRenamed, binaryElement)
                    XCTAssertEqual(obj.stringSetAttributeRenamed, stringSet)
                    XCTAssertEqual(obj.numberSetAttributeRenamed, numberSet as Set<NSNumber>?)
                    XCTAssertEqual(obj.binarySetAttributeRenamed, binarySet)
                    XCTAssertEqual(obj.bool2ElementRenamed, boolElement as NSNumber?)
                    XCTAssertEqual(obj.listElementRenamed!, listElement)
                    XCTAssertEqual(obj.mapElementRenamed!, mapElement)
                    XCTAssertNil(obj.emptyElement)
                }
                return nil
            }).waitUntilFinished()
    }
}
