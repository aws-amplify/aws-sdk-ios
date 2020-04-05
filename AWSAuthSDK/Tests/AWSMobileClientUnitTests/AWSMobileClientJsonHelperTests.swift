//
//  AWSMobileClientJsonHelperTests.swift
//  AWSMobileClientJsonHelperTests
//
import Foundation
import XCTest
import AWSCore
@testable import AWSMobileClient


class AWSMobileClientJsonHelperTests: XCTestCase {

    func testDataArrayTransform() {
        let testArray = ["elem1", "elem2"]
        let testArrayAsData = JSONHelper.dataFromArray(testArray)
        let dataToTestArray = JSONHelper.arrayFromData(testArrayAsData)
        XCTAssertEqual(testArray, dataToTestArray)
    }
}
