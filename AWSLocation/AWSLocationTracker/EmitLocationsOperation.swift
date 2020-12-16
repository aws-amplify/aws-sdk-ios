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
import CoreLocation

class EmitLocationsOperation: AsynchronousOperation {
    private static let locationExpiryTime = TimeInterval(60*60) // 1 hour before a location update is considered expired.
    private static let maximumBatchSize = 10 // 10 position updates per request as per service validation logic
    
    private let locationsQueue: AtomicValue<[CLLocation]>
    private let deviceId: String
    private let trackerName: String
    private let listener: ((TrackingListener) -> Void)?
    private let locationService: AWSLocationBehavior
    private let isCalledFromBackgroundTask: Bool
    
    let group = DispatchGroup()
    
    init(trackerName: String,
         deviceId: String,
         locationsQueue: AtomicValue<[CLLocation]>,
         locationService: AWSLocationBehavior,
         isCalledFromBackgroundTask: Bool = false,
         listener: ((TrackingListener) -> Void)?) {
        self.trackerName = trackerName
        self.deviceId = deviceId
        self.locationsQueue = locationsQueue
        self.locationService = locationService
        self.isCalledFromBackgroundTask = isCalledFromBackgroundTask
        self.listener = listener
    }
    
    override func main() {
        AWSLocationTrackerLogger.info("Emitting Locations, isCalledFromBackground:\(isCalledFromBackgroundTask)")
        
        guard !isCancelled else {
            finish()
            return
        }
        
        let unexpiredLocations = self.locationsQueue.getAndSet([]).filter { (location) -> Bool in
            return Date().timeIntervalSince(location.timestamp) < EmitLocationsOperation.locationExpiryTime
        }
        
        let totalPositionUpdates = unexpiredLocations.map { (location) -> AWSLocationDevicePositionUpdate in
            location.toAWSLocationDevicePositionUpdate(deviceId: deviceId)
        }
        
        guard totalPositionUpdates.count != 0 else {
            AWSLocationTrackerLogger.info("No locations to emit")
            finish()
            return
        }
        
        AWSLocationTrackerLogger.info("Emitting \(totalPositionUpdates.count) locations to Amazon Location Service.")
        
        let positionUpdateBatches = totalPositionUpdates.chunked(into: EmitLocationsOperation.maximumBatchSize)
        for (index, positionUpdates) in positionUpdateBatches.enumerated() {
            AWSLocationTrackerLogger.verbose(
                "Emitting locations to Amazon Location Service. Batch \(index + 1) of \(positionUpdates.count)")

            guard let request = AWSLocationBatchUpdateDevicePositionRequest() else {
                fatalError("Could not instantiate `AWSLocationBatchUpdateDevicePositionRequest()`")
            }
            request.trackerName = trackerName
            request.updates = positionUpdates
        
            group.enter()
            locationService.batchUpdateDevicePosition(request) { (response, error) in
                self.positionsUpdatedCompletionHandler(unexpiredLocations: unexpiredLocations,
                                                       request: request,
                                                       response: response,
                                                       error: error,
                                                       onComplete: {
                                                        self.group.leave()
                                                       })
            }
            group.wait()
        }
        finish()
    }

    // MARK: - Response Handling
    
    private func positionsUpdatedCompletionHandler(unexpiredLocations: [CLLocation],
                                                   request: AWSLocationBatchUpdateDevicePositionRequest,
                                                   response: AWSLocationBatchUpdateDevicePositionResponse?,
                                                   error: Error?,
                                                   onComplete: () -> Void) {
        if let error = error as NSError? {
            AWSLocationTrackerLogger.debug("Error: \(error)")
            if let urlError = error as? URLError {
                self.handleURLError(urlError, unexpiredLocations: unexpiredLocations)
            } else if error.domain == AWSLocationErrorDomain,
                      let errorType = AWSLocationErrorType.init(rawValue: error.code) {
                self.handleAWSLocationError(errorType, error: error)
            } else {
                self.listener?(.onDataPublicationError(.init(errorType: .serviceError(error),
                                                             message: getDefaultError(error),
                                                             recoverySuggestion: "Unknown Error occured")))
            }
        } else if let response = response {
            self.listener?(.onDataPublished(.init(request: request,
                                                  response: response)))
        }
        onComplete()
    }
    
    private func handleURLError(_ urlError: URLError, unexpiredLocations: [CLLocation]) {
        if urlError.code.rawValue == NSURLErrorNotConnectedToInternet {
            self.locationsQueue.append(contentsOf: unexpiredLocations)
        }
        
        self.listener?(.onDataPublicationError(
                        .init(errorType: .serviceError(urlError),
                              message: "This may indicate a connection error. Check the error code for exact reason.",
                              recoverySuggestion: "See the underlying URLError in `.serviceError(let error)` from `errorType` for more details.")))
    }
    
    private func handleAWSLocationError(_ errorType: AWSLocationErrorType, error: Error) {
        if case .resourceNotFound = errorType {
            self.listener?(.onDataPublicationError(
                            .init(errorType: .invalidTrackerName,
                                  message: "The `trackerName` supplied does not exist",
                                  recoverySuggestion: """
Create the trackerName \(trackerName) through the AWS Console or programmatically using Amazon Location Service's `createTracker` API.
""")))
        } else if case .accessDenied = errorType {
            self.listener?(
                .onDataPublicationError(
                    .init(errorType: .unauthorized,
                          message: "The user is unauthorized to send location data to Amazon Location Services.",
                          recoverySuggestion: """
Make sure you have the correct IAM policy is attached to the auth role or unauth role to make calls to Amazon Location Servies's
`batchUpdateDevicePosition` API. If the policy is attached to the auth role, call `startTracking` after the user has signed in,
and `stopTracking` after user has signed out.
""")))
        } else {
            self.listener?(
                .onDataPublicationError(
                    .init(errorType: .serviceError(error),
                          message: "This may indicate a service error. Check the error code for exact reason.",
                          recoverySuggestion: "See the underlying AWSLocationError in `.serviceError(let error)` from `errorType` for more details")))
        }
    }
    
    private func getDefaultError(_ error: NSError) -> String {
        let errorMessage = """
                           Domain: [\(error.domain)
                           Code: [\(error.code)
                           LocalizedDescription: [\(error.localizedDescription)
                           LocalizedFailureReason: [\(error.localizedFailureReason ?? "")
                           LocalizedRecoverySuggestion: [\(error.localizedRecoverySuggestion ?? "")
                           """
        return errorMessage
    }
}
