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

import UIKit
import XCTest
import AWSDynamoDB

var tableName = ""

class TestObjectV2: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var hashKeyRenamed: String?
    var rangeKeyRenamed: String?

    var stringAttributeRenamed: String?
    var numberAttributeRenamed: NSNumber?
    var binaryAttributeRenamed: NSData?

    var stringSetAttributeRenamed: Set<String>?
    var numberSetAttributeRenamed: Set<NSNumber>?
    var binarySetAttributeRenamed: Set<NSData>?

    var bool2ElementRenamed: NSNumber?
    var listElementRenamed: Array<NSObject>?
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

    override class func JSONKeyPathsByPropertyKey() -> [NSObject: AnyObject] {
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

        let timeIntervalSinceReferenceDate = Int(NSDate().timeIntervalSinceReferenceDate)
        tableName = "DynamoDBOMTestSwift-\(timeIntervalSinceReferenceDate)"

        AWSDynamoDBTestUtility.createTable(tableName)
    }

    override func tearDown() {
        AWSDynamoDBTestUtility.deleteTable(tableName)
        super.tearDown()
    }

    func testBooleanNumber() {
        let boolNumberArray:Array<AnyObject> = [true, false, NSNumber(bool: true), NSNumber(bool: false)]
        let nonBoolNumberArray:Array<AnyObject> = [20, 500.34, NSNumber(integer: 34), NSNumber(char: 3), NSNumber(float: 23.4)]
        let myboolClass = NSNumber(bool: true).dynamicType
        let klass: AnyClass = object_getClass(NSNumber(bool: true))

        for myNum in boolNumberArray {
            let result = myNum.isKindOfClass(myboolClass)
            XCTAssertTrue(result,"\(myNum) should be a boolClass")
        }

        for myNum in nonBoolNumberArray {
            let result2 = myNum.isKindOfClass(myboolClass)
            XCTAssertFalse(result2, "\(myNum) should be a boolClass")
        }

        for myNum in boolNumberArray {
            let result = myNum.isKindOfClass(klass)
            XCTAssertTrue(result,"\(myNum) should be a boolClass")
        }

        for myNum in nonBoolNumberArray {
            let result2 = myNum.isKindOfClass(klass)
            XCTAssertFalse(result2, "\(myNum) should be a boolClass")
        }
    }

    func testSaveBehaviorUpdateV2() {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let hashKeyValue = "hash-v2-swift-\(#function)"
        let rangeKeyValue = "range-v2-swift-\(#function)"

        let stringElement = "testString"
        let numberElement = 123.4
        let binaryElement = "testData".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!

        let stringSet = Set(["StringSet1", "stringSet2", "stringSet3"])
        let numberSet = Set([1, 2, 3])
        let data1 = "testDataSet1".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        let data2 = "testDataSet2".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        let data3 = "testDataSet4".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        let binarySet = Set([data1, data2, data3])
        let boolElement = true
        let listElement = ["StringInList", 55, binaryElement, stringSet, numberSet, binarySet, true, ["stringInListOfList", 57]]
        let mapElement = ["mapStringKey" : "mapStringValue",
                          "mapNumberKey" : 98,
                          "mapBinaryKey" : binaryElement,
                          "mapStringSetKey" : stringSet,
                          "mapNumberSetKey" : numberSet,
                          "mapBoolKey" : true,
                          "mapListKey" : listElement,
                          "mapMapKey" : [
                            "str" : "strValue",
                            "num" : 5,
                            "lst" : listElement]]

        let objv2 = TestObjectV2()
        objv2.hashKeyRenamed = hashKeyValue
        objv2.rangeKeyRenamed = rangeKeyValue
        objv2.stringAttributeRenamed = stringElement
        objv2.numberAttributeRenamed = numberElement
        objv2.binaryAttributeRenamed = binaryElement;
        objv2.stringSetAttributeRenamed = stringSet
        objv2.numberSetAttributeRenamed = numberSet
        objv2.binarySetAttributeRenamed = binarySet
        objv2.bool2ElementRenamed = boolElement
        objv2.listElementRenamed = listElement
        objv2.mapElementRenamed = mapElement

        objectMapper.save(objv2).continueWithSuccessBlock { (task) -> AnyObject? in
            return objectMapper.load(TestObjectV2.self, hashKey: hashKeyValue, rangeKey: rangeKeyValue)
            }.continueWithBlock { (task) -> AnyObject? in
                if (task.error != nil) {
                    XCTFail("Error: \(task.error)")
                }
                if (task.exception != nil) {
                    XCTFail("Exception: \(task.exception)")
                }
                if let obj = task.result as? TestObjectV2 {
                    XCTAssertEqual(obj.hashKeyRenamed, hashKeyValue)
                    XCTAssertEqual(obj.rangeKeyRenamed, rangeKeyValue)
                    XCTAssertEqual(obj.stringAttributeRenamed, stringElement)
                    XCTAssertEqual(obj.numberAttributeRenamed, numberElement)
                    XCTAssertEqual(obj.binaryAttributeRenamed, binaryElement)
                    XCTAssertEqual(obj.stringSetAttributeRenamed, stringSet)
                    XCTAssertEqual(obj.numberSetAttributeRenamed, numberSet)
                    XCTAssertEqual(obj.binarySetAttributeRenamed, binarySet)
                    XCTAssertEqual(obj.bool2ElementRenamed, boolElement)
                    XCTAssertEqual(obj.listElementRenamed!, listElement)
                    XCTAssertEqual(obj.mapElementRenamed!, mapElement)
                    XCTAssertNil(obj.emptyElement)
                }
                return nil
            }.waitUntilFinished()
    }
}
