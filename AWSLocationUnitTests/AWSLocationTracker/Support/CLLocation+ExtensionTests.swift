//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
import CoreLocation
@testable import AWSLocation

class CLLocation_ExtensionTests: XCTestCase {

    func testToAWSLocationDevicePositionUpdate() throws {
        let coordinate = CLLocationCoordinate2D(latitude: 10, longitude: 20)
        let date = Date()
        let deviceId = "deviceId"
        let location = CLLocation(coordinate: coordinate,
                                  altitude: CLLocationDistance(),
                                  horizontalAccuracy: CLLocationAccuracy(),
                                  verticalAccuracy: CLLocationAccuracy(),
                                  timestamp: date)
        
        let result = location.toAWSLocationDevicePositionUpdate(deviceId: deviceId)
        
        XCTAssertEqual(result.deviceId, deviceId)
        XCTAssertNotNil(result.position)
        XCTAssertEqual(result.position!.count, 2)
        XCTAssertEqual(result.position!.first!.doubleValue, coordinate.longitude)
        XCTAssertEqual(result.position!.last!.doubleValue, coordinate.latitude)
        XCTAssertNotNil(result.sampleTime)
        XCTAssertEqual(result.sampleTime!, date)
    }
}
