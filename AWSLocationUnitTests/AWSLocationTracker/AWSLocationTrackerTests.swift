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

class AWSLocationTrackerTests: XCTestCase {
    
    let trackerName = "trackerName"
    let locationService = MockAWSLocation()
    
    func testInstantiateAWSLocationTracker() throws {
        let expectedEmitTaskId = "com.amazonaws.AWSLocationTrackerEmit.\(trackerName)"
        let expectedRetrieveTaskId = "com.amazonaws.AWSLocationTrackerRetrieve.\(trackerName)"
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: locationService)
        XCTAssertEqual(locationTracker.trackerName, trackerName)
        XCTAssertNil(locationTracker.trackerOptions)
        XCTAssertFalse(locationTracker.isTracking())
        XCTAssertEqual(locationTracker.backgroundEmitTaskId, expectedEmitTaskId)
        XCTAssertEqual(locationTracker.backgroundRetrieveTaskId, expectedRetrieveTaskId)
    }
    
    func testStartTracking() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: locationService)
        
        XCTAssertFalse(locationTracker.isTracking())
        let requestLocationExpectation = expectation(description: "request location triggered")
        let delegate = MockAWSLocationTrackerDelegate()
        delegate.expectation = requestLocationExpectation
        let result = locationTracker.startTracking(delegate: delegate,
                                                   options: TrackerOptions(retrieveLocationFrequency: TimeInterval(1),
                                                                           emitLocationFrequency: TimeInterval(2)))
        if case let .failure(trackingError) = result {
            XCTFail("Failed to start tracking, error: \(trackingError)")
        }
        XCTAssertTrue(locationTracker.isTracking())
        XCTAssertEqual(locationTracker.trackerOptions?.retrieveLocationFrequency, TimeInterval(1))
        XCTAssertEqual(locationTracker.trackerOptions?.emitLocationFrequency, TimeInterval(2))
        wait(for: [requestLocationExpectation], timeout: 3)
    }
    
    func testStartTrackingForTrackingEnabledWillReturnFailure() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: locationService)
        XCTAssertFalse(locationTracker.isTracking())
        let delegate = MockAWSLocationTrackerDelegate()
        let result = locationTracker.startTracking(delegate: delegate)
        if case let .failure(trackingError) = result {
            XCTFail("Failed to start tracking, error: \(trackingError)")
        }
        XCTAssertTrue(locationTracker.isTracking())
        let failedResult = locationTracker.startTracking(delegate: delegate)
        guard case let .failure(trackingError) = failedResult,
              case .trackerAlreadyStarted = trackingError.errorType else {
            XCTFail("Should be failed result with `trackerAlreadyStarted`")
            return
        }
    }
    
    func testStopTracking() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: locationService)
        XCTAssertFalse(locationTracker.isTracking())
        let onStopExpectation = expectation(description: "stop tracking event triggered")
        let result = locationTracker.startTracking(delegate: MockAWSLocationTrackerDelegate()) { listener in
            switch listener {
            case .onDataPublicationError(let trackingError):
                XCTFail("Unexpected onDataPublicationError, error: \(trackingError)")
            case .onDataPublished(let publishedEvent):
                XCTFail("Unexpected onDataPublished, publishedEvent: \(publishedEvent)")
            case .onStop:
                onStopExpectation.fulfill()
            }
        }
        
        XCTAssertTrue(locationTracker.isTracking())
        if case let .failure(trackingError) = result {
            XCTFail("Failed to start tracking, error: \(trackingError)")
        }
        locationTracker.stopTracking()
        wait(for: [onStopExpectation], timeout: 1)
        XCTAssertFalse(locationTracker.isTracking())
        XCTAssertNil(locationTracker.delegate)
        XCTAssertNil(locationTracker.listener)
        XCTAssertNil(locationTracker.retrieveLocationsTimer)
        XCTAssertNil(locationTracker.emitLocationsTimer)
        XCTAssertTrue(locationTracker.locationsQueue.get().isEmpty)
    }
    
    func testStopTrackingForTrackingDisabledWillDoNothing() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: locationService)
        XCTAssertFalse(locationTracker.isTracking())
        let onStopExpectation = expectation(description: "stop tracking event triggered")
        let result = locationTracker.startTracking(delegate: MockAWSLocationTrackerDelegate()) { listener in
            switch listener {
            case .onDataPublicationError(let trackingError):
                XCTFail("Unexpected onDataPublicationError, error: \(trackingError)")
            case .onDataPublished(let publishedEvent):
                XCTFail("Unexpected onDataPublished, publishedEvent: \(publishedEvent)")
            case .onStop:
                onStopExpectation.fulfill()
            }
        }
        
        XCTAssertTrue(locationTracker.isTracking())
        if case let .failure(trackingError) = result {
            XCTFail("Failed to start tracking, error: \(trackingError)")
        }
        locationTracker.stopTracking()
        wait(for: [onStopExpectation], timeout: 1)
        XCTAssertFalse(locationTracker.isTracking())
        
        locationTracker.stopTracking()
        XCTAssertFalse(locationTracker.isTracking())
    }
    
    // MARK: - InterceptLocationsRetrieved
    
    func testInterceptLocationsRetrieved() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: locationService)
        _ = locationTracker.startTracking(delegate: MockAWSLocationTrackerDelegate())
        XCTAssertTrue(locationTracker.isTracking())
        var locations = [CLLocation]()
        locations.append(CLLocation(latitude: 47.608013, longitude: -122.335167))
        locationTracker.interceptLocationsRetrieved(locations)
        let locationsQueue = locationTracker.locationsQueue.get()
        XCTAssertEqual(locationsQueue.count, 1)
    }
    
    func testInterceptLocationsRetrievedDoNothingWhileTrackingDisabled() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: locationService)
        XCTAssertFalse(locationTracker.isTracking())
        var locations = [CLLocation]()
        locations.append(CLLocation(latitude: 47.608013, longitude: -122.335167))
        locationTracker.interceptLocationsRetrieved(locations)
        let locationsQueue = locationTracker.locationsQueue.get()
        XCTAssertTrue(locationsQueue.isEmpty)
    }
    
    // MARK: - GetDefaultTrackerOptions
    
    func testGetDefaultTrackerOptionsWithNoPassedInOptionsReturnsDefaults() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: MockAWSLocation())
        let options = locationTracker.getDefaultTrackerOptions(options: nil)
        
        XCTAssertNotNil(options.customDeviceId)
        XCTAssertEqual(options.retrieveLocationFrequency, TrackerOptions.defaultRetrieveLocationFrequency)
        XCTAssertEqual(options.emitLocationFrequency, TrackerOptions.defaultEmitLocationFrequency)
    }
    
    func testGetDefaultTrackerOptionsWithCustomDeviceIdReturnsPassedInOptions() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: MockAWSLocation())
        let passedInOptions = TrackerOptions(customDeviceId: "customDeviceId",
                                             retrieveLocationFrequency: TimeInterval(11),
                                             emitLocationFrequency: TimeInterval(22))
        let options = locationTracker.getDefaultTrackerOptions(options: passedInOptions)
        
        XCTAssertEqual(options.customDeviceId, passedInOptions.customDeviceId)
        XCTAssertEqual(options.retrieveLocationFrequency, TimeInterval(11))
        XCTAssertEqual(options.emitLocationFrequency, TimeInterval(22))
    }
    
    func testGetDefaultTrackerOptionsWithoutCustomDeviceIdCreatesNew() {
        let uniqueTrackerName = UUID().uuidString
        guard let userDefaults = UserDefaults.init(suiteName: "com.amazonaws.AWSLocationTrackerTests") else {
            XCTFail("Could not set up custom userDefaults for testing")
            return
        }
        let locationTracker = AWSLocationTracker(trackerName: uniqueTrackerName,
                                                 locationService: MockAWSLocation())
        let passedInOptions = TrackerOptions()
        let options = locationTracker.getDefaultTrackerOptions(options: passedInOptions, userDefaults: userDefaults)
        
        let trackerNameKey = "com.amazonaws.AWSLocationTrackerKey.\(uniqueTrackerName)"
        guard let persistedDeviceIdForTracker = userDefaults.string(forKey: trackerNameKey) else {
            XCTFail("Failed to get persisted `deviceId` for tracker")
            return
        }
        
        XCTAssertEqual(options.customDeviceId, persistedDeviceIdForTracker)
        XCTAssertEqual(options.retrieveLocationFrequency, TrackerOptions.defaultRetrieveLocationFrequency)
        XCTAssertEqual(options.emitLocationFrequency, TrackerOptions.defaultEmitLocationFrequency)
    }
    
    func testGetDefaultTrackerOptionsWithoutCustomDeviceIdUsesPersisted() {
        let uniqueTrackerName = UUID().uuidString
        let expectedDeviceId = "expectedDeviceId"
        let trackerNameKey = "com.amazonaws.AWSLocationTrackerKey.\(uniqueTrackerName)"
        guard let userDefaults = UserDefaults.init(suiteName: "com.amazonaws.AWSLocationTrackerTests") else {
            XCTFail("Could not set up custom userDefaults for testing")
            return
        }
        userDefaults.setValue(expectedDeviceId, forKey: trackerNameKey)
        let locationTracker = AWSLocationTracker(trackerName: uniqueTrackerName,
                                                 locationService: MockAWSLocation())
        let passedInOptions = TrackerOptions()
        let options = locationTracker.getDefaultTrackerOptions(options: passedInOptions, userDefaults: userDefaults)
        
        guard let persistedDeviceIdForTracker = userDefaults.string(forKey: trackerNameKey) else {
            XCTFail("Failed to get persisted `deviceId` for tracker")
            return
        }
        
        XCTAssertEqual(persistedDeviceIdForTracker, expectedDeviceId)
        XCTAssertEqual(options.customDeviceId, expectedDeviceId)
        XCTAssertEqual(options.retrieveLocationFrequency, TrackerOptions.defaultRetrieveLocationFrequency)
        XCTAssertEqual(options.emitLocationFrequency, TrackerOptions.defaultEmitLocationFrequency)
    }
    
    // MARK: - TryGetDeviceId
    
    func testGetDefaultTrackerOptions() {
        let uniqueTrackerName = UUID().uuidString
        let locationTracker = AWSLocationTracker(trackerName: uniqueTrackerName,
                                                 locationService: MockAWSLocation())
        guard let userDefaults = UserDefaults.init(suiteName: "com.amazonaws.AWSLocationTrackerTests") else {
            XCTFail("Could not set up custom userDefaults for testing")
            return
        }
        let deviceId = locationTracker.tryGetDeviceId(for: uniqueTrackerName,
                                                      userDefaults: userDefaults)
        let trackerNameKey = "com.amazonaws.AWSLocationTrackerKey.\(uniqueTrackerName)"
        guard let persistedDeviceIdForTracker = userDefaults.string(forKey: trackerNameKey) else {
            XCTFail("Failed to get persisted `deviceId` for tracker")
            return
        }
        XCTAssertEqual(deviceId, persistedDeviceIdForTracker)
    }
    
    func testGetDefaultTrackerOptionsWithPersistedDeviceId() {
        let uniqueTrackerName = UUID().uuidString
        let locationTracker = AWSLocationTracker(trackerName: uniqueTrackerName,
                                                 locationService: MockAWSLocation())
        let expectedDeviceId = "expectedDeviceId"
        guard let userDefaults = UserDefaults.init(suiteName: "com.amazonaws.AWSLocationTrackerTests") else {
            XCTFail("Could not set up custom userDefaults for testing")
            return
        }
        let trackerNameKey = "com.amazonaws.AWSLocationTrackerKey.\(uniqueTrackerName)"
        userDefaults.setValue(expectedDeviceId, forKey: trackerNameKey)
        let deviceId = locationTracker.tryGetDeviceId(for: uniqueTrackerName,
                                                      userDefaults: userDefaults)
        guard let persistedDeviceIdForTracker = userDefaults.string(forKey: trackerNameKey) else {
            XCTFail("Failed to get persisted `deviceId` for tracker")
            return
        }
        XCTAssertEqual(persistedDeviceIdForTracker, expectedDeviceId)
        XCTAssertEqual(deviceId, expectedDeviceId)
    }
    
    // MARK: - SetUp timers
    
    func testSetUpRetrieveLocationsTimer() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: locationService)
        let delegate = MockAWSLocationTrackerDelegate()
        _ = locationTracker.startTracking(delegate: delegate)
        locationTracker.stopTracking()
        XCTAssertNil(locationTracker.retrieveLocationsTimer)
        
        locationTracker.setUpRetrieveLocationsTimer()
        
        XCTAssertNotNil(locationTracker.retrieveLocationsTimer)
        XCTAssertFalse(locationTracker.retrieveLocationsTimer!.isCancelled)
    }
    
    func testSetUpEmitLocationsTimer() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: locationService)
        let delegate = MockAWSLocationTrackerDelegate()
        _ = locationTracker.startTracking(delegate: delegate)
        locationTracker.stopTracking()
        XCTAssertNil(locationTracker.emitLocationsTimer)
        
        locationTracker.setUpEmitLocationsTimer()
        
        XCTAssertNotNil(locationTracker.emitLocationsTimer)
        XCTAssertFalse(locationTracker.emitLocationsTimer!.isCancelled)
    }
    
    // MARK: - Performance tests
    
    func testStartStopTracking() {
        let locationTracker = AWSLocationTracker(trackerName: trackerName,
                                                 locationService: locationService)
        let delegate = MockAWSLocationTrackerDelegate()
        DispatchQueue.concurrentPerform(iterations: 10_000) { _ in
            if Bool.random() {
                _ = locationTracker.startTracking(delegate: delegate)
            } else {
                locationTracker.stopTracking()
            }
        }
        _ = locationTracker.startTracking(delegate: delegate)
        XCTAssertTrue(locationTracker.isTracking())
        locationTracker.stopTracking()
        XCTAssertFalse(locationTracker.isTracking())
    }
}
