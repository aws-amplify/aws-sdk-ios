//
//  AWSMobileClientJsonHelperTests.swift
//  AWSMobileClient
//
//  Created by Edupuganti, Phani Srikar on 4/1/20.
//  Copyright © 2020 Amazon Web Services. All rights reserved.
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
