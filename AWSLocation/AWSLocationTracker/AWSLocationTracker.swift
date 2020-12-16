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

/// Monitor your device's location and periodically send the tracked coordinates to the Amazon Location Service.
public class AWSLocationTracker {
    var backgroundEmitTaskId: String {
        get {
            return "com.amazonaws.AWSLocationTrackerEmit.\(trackerName)"
        }
    }
    var backgroundRetrieveTaskId: String {
        get {
            return "com.amazonaws.AWSLocationTrackerRetrieve.\(trackerName)"
        }
    }
    
    private let lock: NSLock = NSLock()
    let operationQueue: OperationQueue
    
    let trackerName: String
    let locationService: AWSLocationBehavior
    let locationsQueue: AtomicValue<[CLLocation]> = AtomicValue(initialValue: [])
    var trackerOptions: TrackerOptions?
    var trackingEnabled: AtomicValue<Bool> = AtomicValue(initialValue: false)
    
    weak var delegate: AWSLocationTrackerDelegate?
    var listener: ((TrackingListener) -> Void)?
    var retrieveLocationsTimer: DispatchSourceTimer?
    var emitLocationsTimer: DispatchSourceTimer?
    
    /// Create a new tracker instance to retrieve and send location data to Amazon Location Servies.
    /// By calling this method, make sure you call `interceptLocationsRetrieved(locations)` from the periodic
    /// locations retrieved back to the tracker.
    ///
    /// - Parameters:
    ///   - trackerName: The name of your tracker resource
    ///   - region: The region of your tracker resource
    ///   - credentialsProvider: Your auth provider - most likely `AWSMobileClient.default()`
    public convenience init(trackerName: String,
                            region: AWSRegionType,
                            credentialsProvider: AWSCredentialsProvider) {
        guard let config = AWSServiceConfiguration(region: region,
                                                   credentialsProvider: credentialsProvider) else {
            fatalError("Could not create `AWSServiceConfiguration` with \(region) and \(credentialsProvider)")
        }
        
        AWSLocation.remove(forKey: trackerName)
        AWSLocation.register(with: config, forKey: trackerName)
        
        self.init(trackerName: trackerName,
                  locationService: AWSLocationAdapter(location: AWSLocation(forKey: trackerName)))
    }
    
    /// Internal constructor for testing
    init(trackerName: String,
         locationService: AWSLocationBehavior) {
        self.trackerName = trackerName
        self.locationService = locationService
        self.operationQueue = OperationQueue()
        operationQueue.name = "com.amazonaws.AWSLocationTrackerOperationQueue"
        operationQueue.maxConcurrentOperationCount = 1
    }
    
    /// Start monitoring your device's location and sending the tracked coordinates to Amazon Location Service.
    ///
    /// - Parameters:
    ///   - delegate: Configure the delegate for AWSLocationTracker
    ///   - options: Configure details of how tracking will work.
    ///   - listener: Contains the various callback methods to listen to the different events which will be emitted.
    public func startTracking(delegate: AWSLocationTrackerDelegate,
                              options: TrackerOptions? = nil,
                              listener: ((TrackingListener) -> Void)? = nil) -> Result<Void, TrackingError> {
        lock.lock()
        defer {
            lock.unlock()
        }
        if trackingEnabled.get() {
            return .failure(.init(errorType: .trackerAlreadyStarted,
                                  message: "Tracker for \(trackerName) has already started.",
                                  recoverySuggestion: "Call `stopTracking` before calling `startTracking` again."))
            
        }
        
        self.trackerOptions = getDefaultTrackerOptions(options: options)
        self.delegate = delegate
        self.listener = listener
        self.setUpRetrieveLocationsTimer()
        self.setUpEmitLocationsTimer()
        self.trackingEnabled.set(true)
        return .success(())
    }
    
    /// Call this method from `locationManager(_:didUpdateLocations)` to pass the location data back to the tracker.
    ///
    /// - Parameters:
    ///   - locations: List of locations to track
    public func interceptLocationsRetrieved(_ locations: [CLLocation]) {
        guard trackingEnabled.get() else {
            AWSLocationTrackerLogger.info("Locations intercepted, do nothing. Tracking is stopped.")
            return
        }
        AWSLocationTrackerLogger.info("Adding \(locations.count) locations to the queue.")
        locationsQueue.append(contentsOf: locations)
    }
    
    /// True if this tracker instance is currently monitoring and sending the device's location. False otherwise.
    /// - Returns: if tracking instance is currently monitoring and sending the device's location
    public func isTracking() -> Bool {
        return trackingEnabled.get()
    }
    
    /// Stop recording and sending the device's location. You can start tracking again with new options if you want.
    public func stopTracking() {
        lock.lock()
        defer {
            lock.unlock()
        }
        
        if let listener = listener {
            listener(.onStop)
        }
        
        reset()
    }
    
    // MARK: - Internal methods
    
    func getDefaultTrackerOptions(options: TrackerOptions?,
                                  userDefaults: UserDefaults = UserDefaults.init()) -> TrackerOptions {
        guard let trackerOptions = options else {
            // No options passed in, create a new one with the default values
            return TrackerOptions(
                customDeviceId: tryGetDeviceId(for: trackerName, userDefaults: userDefaults),
                retrieveLocationFrequency: TrackerOptions.defaultRetrieveLocationFrequency,
                emitLocationFrequency: TrackerOptions.defaultEmitLocationFrequency)
        }
        
        guard trackerOptions.customDeviceId == nil else {
            // `customDeviceId` was passed in, use the passed in options
            return trackerOptions
        }
        
        // `customDeviceId` is to be generated, reuse existing retrieve and emit location frequenceies
        return TrackerOptions(customDeviceId: tryGetDeviceId(for: trackerName,
                                                             userDefaults: userDefaults),
                              retrieveLocationFrequency: trackerOptions.retrieveLocationFrequency,
                              emitLocationFrequency: trackerOptions.emitLocationFrequency)
    }
    
    func tryGetDeviceId(for trackerName: String,
                        userDefaults: UserDefaults = UserDefaults.init()) -> String {
        let key = "com.amazonaws.AWSLocationTrackerKey.\(trackerName)"
        guard let deviceId = userDefaults.string(forKey: key) else {
            let deviceId = UUID.init().uuidString
            AWSLocationTrackerLogger.verbose("Creating new deviceId for \(trackerName): \(deviceId)")
            userDefaults.setValue(deviceId, forKey: key)
            return deviceId
        }
        AWSLocationTrackerLogger.verbose("Reusing existing deviceId for \(trackerName): \(deviceId)")
        return deviceId
    }
    
    func setUpRetrieveLocationsTimer() {
        guard let options = trackerOptions else {
            fatalError("TrackingOptions is nil")
        }
        retrieveLocationsTimer = RepeatingTimer.createRepeatingTimer(
            timeInterval: options.retrieveLocationFrequency,
            eventHandler: { [weak self] in
                AWSLocationTrackerLogger.verbose("RetrieveLocationsTimer triggered, call delegate.requestLocation()")
                self?.delegate?.requestLocation()
            })
        retrieveLocationsTimer?.resume()
    }
    
    func setUpEmitLocationsTimer() {
        guard let options = self.trackerOptions, let deviceId = options.customDeviceId else {
            fatalError("TrackingOptions is nil")
        }
        emitLocationsTimer = RepeatingTimer.createRepeatingTimer(
            timeInterval: options.emitLocationFrequency,
            eventHandler: { [weak self] in
                guard let self = self else {
                    return
                }
                
                AWSLocationTrackerLogger.verbose("EmitLocationsTimer triggered, attempt to send locations to Amazon Location Service")
                let operation = EmitLocationsOperation(trackerName: self.trackerName,
                                                       deviceId: deviceId,
                                                       locationsQueue: self.locationsQueue,
                                                       locationService: self.locationService,
                                                       listener: self.listener)
                self.operationQueue.addOperation(operation)
                
            })
        emitLocationsTimer?.resume()
    }
    
    private func reset() {
        if delegate != nil {
            delegate = nil
        }
        if listener != nil {
            listener = nil
        }
        
        if retrieveLocationsTimer != nil {
            retrieveLocationsTimer?.setEventHandler {}
            retrieveLocationsTimer = nil
        }
        
        if emitLocationsTimer != nil {
            emitLocationsTimer?.setEventHandler {}
            emitLocationsTimer = nil
        }
        
        locationsQueue.set([])
        trackingEnabled.set(false)
    }
    
    deinit {
        reset()
    }
}
