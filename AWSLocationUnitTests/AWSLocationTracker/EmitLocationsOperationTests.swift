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

class EmitLocationsOperationTests: XCTestCase {
    
    let trackerName = "trackerName"
    let deviceId = "deviceId"
    
    /// A single expired location should be dropped and operation completed successfully without any service calls
    func testEmitLocationsExpiredLocations() {
        let locationsQueue = AtomicValue<[CLLocation]>(initialValue: [])
        let location = createCLLocation(byAdding: .hour, value: -2)
        locationsQueue.append(location)
        let locationService = MockAWSLocation()
        let serviceCalled = expectation(description: "service was called")
        serviceCalled.isInverted = true
        locationService.expectation = serviceCalled
        let operationCompleted = expectation(description: "Operation completed")
        let operation = EmitLocationsOperation(trackerName: trackerName,
                                               deviceId: deviceId,
                                               locationsQueue: locationsQueue,
                                               locationService: locationService,
                                               isCalledFromBackgroundTask: false) { (event) in
            XCTFail("Unexpected event \(event)")
        }
        operation.completionBlock = {
            operationCompleted.fulfill()
        }
        
        operation.start()
        
        wait(for: [serviceCalled, operationCompleted], timeout: 1)
        XCTAssertTrue(locationsQueue.get().isEmpty)
    }
    
    // Unexpired locations should be sent to the service and published on the listener successfully
    func testEmitLocationsSuccess() throws {
        let locationsQueue = AtomicValue<[CLLocation]>(initialValue: [])
        let expiredLocation = createCLLocation(byAdding: .hour, value: -2)
        let location = createCLLocation(byAdding: .minute, value: -3)
        let expectedLocation = location.toAWSLocationDevicePositionUpdate(deviceId: deviceId)
        locationsQueue.append(contentsOf: [expiredLocation, location])
        let locationService = MockAWSLocation()
        let successfulResponse = AWSLocationBatchUpdateDevicePositionResponse()
        locationService.batchUpdateDevicePositionCompletionEvent = (successfulResponse, nil)
        let onDataPublishedExpectation = expectation(description: "Data was published successfully")
        let operation = EmitLocationsOperation(trackerName: trackerName,
                                               deviceId: deviceId,
                                               locationsQueue: locationsQueue,
                                               locationService: locationService,
                                               isCalledFromBackgroundTask: false) { (event) in
            switch event {
            case .onDataPublicationError(let trackingError):
                XCTFail("Unexpected `onStop` event, error \(trackingError)")
            case .onDataPublished(let publishedEvent):
                XCTAssertNotNil(publishedEvent.request.updates)
                XCTAssertEqual(publishedEvent.request.updates!.count, 1)
                XCTAssertEqual(publishedEvent.request.updates!.first!, expectedLocation)
                XCTAssertEqual(publishedEvent.response, successfulResponse)
                onDataPublishedExpectation.fulfill()
            case .onStop:
                XCTFail("Unexpected `onStop` event")
            }
        }
        
        operation.start()
        
        wait(for: [onDataPublishedExpectation], timeout: 1)
        XCTAssertTrue(locationsQueue.get().isEmpty)
    }
    
    // Number of location updates exceeding the service defined limit should be batched to make multiple concurrent
    // calls to the service
    func testEmitLocationsBatchSuccess() throws {
        let locationsQueue = AtomicValue<[CLLocation]>(initialValue: [])
        for _ in 1...20 {
            let location = createCLLocation(byAdding: .minute, value: -3)
            locationsQueue.append(location)
        }
        
        let locationService = MockAWSLocation()
        let serviceCalled = expectation(description: "Service was called")
        serviceCalled.expectedFulfillmentCount = 2
        locationService.expectation = serviceCalled
        let successfulResponse = AWSLocationBatchUpdateDevicePositionResponse()
        locationService.batchUpdateDevicePositionCompletionEvent = (successfulResponse, nil)
        let onDataPublishedExpectation = expectation(description: "Data was published successfully twice")
        onDataPublishedExpectation.expectedFulfillmentCount = 2
        let operation = EmitLocationsOperation(trackerName: trackerName,
                                               deviceId: deviceId,
                                               locationsQueue: locationsQueue,
                                               locationService: locationService,
                                               isCalledFromBackgroundTask: false) { (event) in
            switch event {
            case .onDataPublicationError(let trackingError):
                XCTFail("Unexpected `onStop` event, error \(trackingError)")
            case .onDataPublished(let publishedEvent):
                XCTAssertNotNil(publishedEvent.request.updates)
                XCTAssertEqual(publishedEvent.request.updates!.count, 10)
                XCTAssertEqual(publishedEvent.response, successfulResponse)
                onDataPublishedExpectation.fulfill()
            case .onStop:
                XCTFail("Unexpected `onStop` event")
            }
        }
        let operationCompleted = expectation(description: "Operation completed")
        operation.completionBlock = {
            operationCompleted.fulfill()
        }
        
        operation.start()
        
        wait(for: [serviceCalled, onDataPublishedExpectation, operationCompleted], timeout: 1)
        XCTAssertTrue(locationsQueue.get().isEmpty)
    }
    
    // MARK: - Error Response handling tests
    
    // A valid location triggering a service call that does not return a valid payload will still result in a
    // successfully completed operation
    func testEmitLocationsWithMissingServiceResponseAndError() throws {
        let locationsQueue = AtomicValue<[CLLocation]>(initialValue: [])
        let location = createCLLocation(byAdding: .minute, value: -3)
        locationsQueue.append(contentsOf: [location])
        let locationService = MockAWSLocation()
        locationService.batchUpdateDevicePositionCompletionEvent = (nil, nil)
        let serviceCalled = expectation(description: "Service was called")
        locationService.expectation = serviceCalled
        let operationCompleted = expectation(description: "Operation completed")
        let operation = EmitLocationsOperation(trackerName: trackerName,
                                               deviceId: deviceId,
                                               locationsQueue: locationsQueue,
                                               locationService: locationService,
                                               isCalledFromBackgroundTask: false) { (event) in
            XCTFail("Unexpected event \(event)")
        }
        
        operation.completionBlock = {
            operationCompleted.fulfill()
        }
        operation.start()
        
        wait(for: [serviceCalled, operationCompleted], timeout: 1)
        XCTAssertTrue(locationsQueue.get().isEmpty)
    }
    
    // A unkonwn error from the service will publish a `.serviceError`
    func testEmitLocationsWithUnknownError() {
        let locationsQueue = AtomicValue<[CLLocation]>(initialValue: [])
        let location = createCLLocation(byAdding: .minute, value: -3)
        locationsQueue.append(contentsOf: [location])
        let locationService = MockAWSLocation()
        let serviceCalled = expectation(description: "Service was called")
        locationService.expectation = serviceCalled
        let unknownError = NSError(domain: "", code: 0)
        locationService.batchUpdateDevicePositionCompletionEvent = (nil, unknownError)
        let onDataPublicationErrorExpectation = expectation(description: "Data publication error")
        let operation = EmitLocationsOperation(trackerName: trackerName,
                                               deviceId: deviceId,
                                               locationsQueue: locationsQueue,
                                               locationService: locationService,
                                               isCalledFromBackgroundTask: false) { (event) in
            switch event {
            case .onDataPublicationError(let trackingError):
                guard case let .serviceError(error) = trackingError.errorType else {
                    XCTFail("Expected serviceError from trackingError")
                    return
                }
                XCTAssertEqual(error as NSError, unknownError)
                onDataPublicationErrorExpectation.fulfill()
            case .onDataPublished(let publishedEvent):
                XCTFail("Unexpected `onDataPublished` event \(publishedEvent)")
            case .onStop:
                XCTFail("Unexpected `onStop` event")
            }
        }
        
        operation.start()
        
        wait(for: [serviceCalled, onDataPublicationErrorExpectation], timeout: 1)
        XCTAssertTrue(locationsQueue.get().isEmpty)
    }
    
    // An URL error from the service will publish a `.serviceError`
    func testEmitLocationsWithURLError() {
        let locationsQueue = AtomicValue<[CLLocation]>(initialValue: [])
        let expiredLocation = createCLLocation(byAdding: .hour, value: -2)
        let location = createCLLocation(byAdding: .minute, value: -3)
        locationsQueue.append(contentsOf: [expiredLocation, location])
        let locationService = MockAWSLocation()
        let expectedUrlError = URLError(.badServerResponse)
        locationService.batchUpdateDevicePositionCompletionEvent = (nil, expectedUrlError)
        let onDataPublicationErrorExpectation = expectation(description: "Data publication error")
        let operation = EmitLocationsOperation(trackerName: trackerName,
                                               deviceId: deviceId,
                                               locationsQueue: locationsQueue,
                                               locationService: locationService,
                                               isCalledFromBackgroundTask: false) { (event) in
            switch event {
            case .onDataPublicationError(let trackingError):
                guard case let .serviceError(error) = trackingError.errorType,
                      let urlError = error as? URLError else {
                    XCTFail("Expected serviceError to contain urlError from trackingError")
                    return
                }
                XCTAssertEqual(urlError, expectedUrlError)
                onDataPublicationErrorExpectation.fulfill()
            case .onDataPublished(let publishedEvent):
                XCTFail("Unexpected `onDataPublished` event \(publishedEvent)")
            case .onStop:
                XCTFail("Unexpected `onStop` event")
            }
        }
        
        operation.start()
        
        wait(for: [onDataPublicationErrorExpectation], timeout: 1)
        XCTAssertTrue(locationsQueue.get().isEmpty)
    }
    
    // An URL error relating to network connectivity will publish a `.serviceError` and locations added back onto the
    // queue
    func testEmitLocationsNotConnectedToInternet() {
        let locationsQueue = AtomicValue<[CLLocation]>(initialValue: [])
        let expiredLocation = createCLLocation(byAdding: .hour, value: -2)
        let location = createCLLocation(byAdding: .minute, value: -3)
        locationsQueue.append(contentsOf: [expiredLocation, location])
        let locationService = MockAWSLocation()
        let expectedUrlError = URLError(.notConnectedToInternet)
        locationService.batchUpdateDevicePositionCompletionEvent = (nil, expectedUrlError)
        let onDataPublicationErrorExpectation = expectation(description: "Data publication error")
        let operation = EmitLocationsOperation(trackerName: trackerName,
                                               deviceId: deviceId,
                                               locationsQueue: locationsQueue,
                                               locationService: locationService,
                                               isCalledFromBackgroundTask: false) { (event) in
            switch event {
            case .onDataPublicationError(let trackingError):
                guard case let .serviceError(error) = trackingError.errorType,
                      let urlError = error as? URLError else {
                    XCTFail("Expected serviceError to contain urlError from trackingError")
                    return
                }
                XCTAssertEqual(urlError, expectedUrlError)
                onDataPublicationErrorExpectation.fulfill()
            case .onDataPublished(let publishedEvent):
                XCTFail("Unexpected `onDataPublished` event \(publishedEvent)")
            case .onStop:
                XCTFail("Unexpected `onStop` event")
            }
        }
        
        operation.start()
        
        wait(for: [onDataPublicationErrorExpectation], timeout: 1)
        let existingLocationsQueue = locationsQueue.get()
        XCTAssertEqual(existingLocationsQueue.count, 1)
        XCTAssertEqual(existingLocationsQueue.first!, location)
    }
    
    // A resource not found error from the service will publish an `.invalidTrackerName` error
    func testEmitLocationsWithResourceNotFound() {
        let locationsQueue = AtomicValue<[CLLocation]>(initialValue: [])
        let expiredLocation = createCLLocation(byAdding: .hour, value: -2)
        let location = createCLLocation(byAdding: .minute, value: -3)
        locationsQueue.append(contentsOf: [expiredLocation, location])
        let locationService = MockAWSLocation()
        let resourceNotFoundError = NSError(domain: AWSLocationErrorDomain,
                                            code: AWSLocationErrorType.resourceNotFound.rawValue)
        locationService.batchUpdateDevicePositionCompletionEvent = (nil, resourceNotFoundError)
        let onDataPublicationErrorExpectation = expectation(description: "Data publication error")
        let operation = EmitLocationsOperation(trackerName: trackerName,
                                               deviceId: deviceId,
                                               locationsQueue: locationsQueue,
                                               locationService: locationService,
                                               isCalledFromBackgroundTask: false) { (event) in
            switch event {
            case .onDataPublicationError(let trackingError):
                guard case .invalidTrackerName = trackingError.errorType else {
                    XCTFail("Expected invalidTrackerName from trackingError")
                    return
                }
                onDataPublicationErrorExpectation.fulfill()
            case .onDataPublished(let publishedEvent):
                XCTFail("Unexpected `onDataPublished` event \(publishedEvent)")
            case .onStop:
                XCTFail("Unexpected `onStop` event")
            }
        }
        
        operation.start()
        
        wait(for: [onDataPublicationErrorExpectation], timeout: 1)
        XCTAssertTrue(locationsQueue.get().isEmpty)
    }
    
    // An access denied error from the service will publish an `.unauthorized` error
    func testEmitLocationsWithAccessDenied() {
        let locationsQueue = AtomicValue<[CLLocation]>(initialValue: [])
        let expiredLocation = createCLLocation(byAdding: .hour, value: -2)
        let location = createCLLocation(byAdding: .minute, value: -3)
        locationsQueue.append(contentsOf: [expiredLocation, location])
        let locationService = MockAWSLocation()
        let accessDeniedError = NSError(domain: AWSLocationErrorDomain,
                                        code: AWSLocationErrorType.accessDenied.rawValue)
        locationService.batchUpdateDevicePositionCompletionEvent = (nil, accessDeniedError)
        let onDataPublicationErrorExpectation = expectation(description: "Data publication error")
        let operation = EmitLocationsOperation(trackerName: trackerName,
                                               deviceId: deviceId,
                                               locationsQueue: locationsQueue,
                                               locationService: locationService,
                                               isCalledFromBackgroundTask: false) { (event) in
            switch event {
            case .onDataPublicationError(let trackingError):
                guard case .unauthorized = trackingError.errorType else {
                    XCTFail("Expected invalidTrackerName from trackingError")
                    return
                }
                onDataPublicationErrorExpectation.fulfill()
            case .onDataPublished(let publishedEvent):
                XCTFail("Unexpected `onDataPublished` event \(publishedEvent)")
            case .onStop:
                XCTFail("Unexpected `onStop` event")
            }
        }
        
        operation.start()
        
        wait(for: [onDataPublicationErrorExpectation], timeout: 1)
        XCTAssertTrue(locationsQueue.get().isEmpty)
    }
    
    // An unhandled Amazon Location Service type error publish an `.serviceError` error
    func testEmitLocationsWithAWSLocationError() {
        let locationsQueue = AtomicValue<[CLLocation]>(initialValue: [])
        let expiredLocation = createCLLocation(byAdding: .hour, value: -2)
        let location = createCLLocation(byAdding: .minute, value: -3)
        locationsQueue.append(contentsOf: [expiredLocation, location])
        let locationService = MockAWSLocation()
        let internalServiceError = NSError(domain: AWSLocationErrorDomain,
                                           code: AWSLocationErrorType.internalServer.rawValue)
        locationService.batchUpdateDevicePositionCompletionEvent = (nil, internalServiceError)
        let onDataPublicationErrorExpectation = expectation(description: "Data publication error")
        let operation = EmitLocationsOperation(trackerName: trackerName,
                                               deviceId: deviceId,
                                               locationsQueue: locationsQueue,
                                               locationService: locationService,
                                               isCalledFromBackgroundTask: false) { (event) in
            switch event {
            case .onDataPublicationError(let trackingError):
                guard case let .serviceError(error) = trackingError.errorType else {
                    XCTFail("Expected invalidTrackerName from trackingError")
                    return
                }
                XCTAssertEqual(error as NSError, internalServiceError)
                onDataPublicationErrorExpectation.fulfill()
            case .onDataPublished(let publishedEvent):
                XCTFail("Unexpected `onDataPublished` event \(publishedEvent)")
            case .onStop:
                XCTFail("Unexpected `onStop` event")
            }
        }
        
        operation.start()
        
        wait(for: [onDataPublicationErrorExpectation], timeout: 1)
        XCTAssertTrue(locationsQueue.get().isEmpty)
    }

    // MARK: - Helpers
    
    func createCLLocation(latitude: Double? = nil,
                          longitide: Double? = nil,
                          byAdding: Calendar.Component,
                          value: Int) -> CLLocation {
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude ?? 10, longitude: longitide ?? 20)
        guard let date = Calendar.current.date(byAdding: byAdding, value: value, to: Date()) else {
            fatalError("Could not get date")
        }
        
        return CLLocation(coordinate: coordinate,
                          altitude: CLLocationDistance(),
                          horizontalAccuracy: CLLocationAccuracy(),
                          verticalAccuracy: CLLocationAccuracy(),
                          timestamp: date)
    }
}
