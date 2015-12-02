/*
* Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

import UIKit
import XCTest

let tableName:String = "dynamoDBOMTestSwift";

class TestObjectV2: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var hashKey:String?
    var rangeKey:String?
    var stringAttribute:String?
    var numberAttribute:Double?
    var binaryAttribute:NSData?
    var stringSetAttribute:NSSet?
    var numberSetAttribute:NSSet?
    var binarySetAttribute:NSSet?

    var bool2Element:NSNumber?
    var listElement:Array<AnyObject>?
    var mapElement:Dictionary<String,AnyObject>?

    class func dynamoDBTableName() -> String {
        return tableName
    }

    class func hashKeyAttribute() -> String {
        return "hashKey"
    }

    class func rangeKeyAttribute() -> String {
        return "rangeKey"
    }

    override func isEqual(anObject: AnyObject?) -> Bool {
        return super.isEqual(anObject)
    }
}

class AWSDynamoDBObjectMapperSwiftTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        AWSTestUtility.setupCognitoCredentialsProvider()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBooleanNumber() {
        let boolNumberArray:Array<AnyObject> = [true,false,NSNumber(bool: true),NSNumber(bool: false)]
        let nonBoolNumberArray:Array<AnyObject> = [20,500.34,NSNumber(integer: 34),NSNumber(char: 3),NSNumber(float: 23.4)]
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
        let updateMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let hashKeyValue = "hash-v2-swift-\(__FUNCTION__)"
        let rangeKeyValue = "range-v2-swift-\(__FUNCTION__)"

        let binaryElement = "testData".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!

        let stringSet = NSSet(objects: "StringSet1","stringSet2","stringSet3")
        let numberSet = NSSet(objects: 1,2,3)
        let data1 = "testDataSet1".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        let data2 = "testDataSet2".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        let data3 = "testDataSet4".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        let binarySet = NSSet(objects: data1,data2,data3)
        let boolElement = true
        let listElement = ["StringInList",55,binaryElement,stringSet,numberSet,binarySet,true,["stringInListOfList",57]]
        let mapElement = ["mapStringKey":"mapStringValue","mapNumberKey":98,"mapBinaryKey":binaryElement,"mapStringSetKey":stringSet,"mapNumberSetKey":numberSet,"mapBoolKey":true,"mapListKey":listElement,"mapMapKey":["str":"strValue","num":5,"lst":listElement]]

        let objv2 = TestObjectV2()
        objv2.hashKey = hashKeyValue
        objv2.rangeKey = rangeKeyValue
        objv2.stringSetAttribute = stringSet
        objv2.numberSetAttribute = numberSet
        objv2.binarySetAttribute = binarySet
        objv2.bool2Element = boolElement
        objv2.listElement = listElement
        objv2.mapElement = mapElement

        updateMapper.save(objv2).continueWithBlock() { (task) -> AnyObject? in
            if (task.error != nil) {
                XCTFail("Error: \(task.error)")
            }

            return nil
            }.waitUntilFinished()
    }
}
