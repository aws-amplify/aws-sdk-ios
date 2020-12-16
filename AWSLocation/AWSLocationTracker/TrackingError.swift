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

public struct TrackingError: Error {
    public let errorType: ErrorType
    public let message: String
    public let recoverySuggestion: String
    
    init(errorType: ErrorType, message: String, recoverySuggestion: String) {
        self.errorType = errorType
        self.message = message
        self.recoverySuggestion = recoverySuggestion
    }
    
    public enum ErrorType {
        /// User provided a tracker name that doesn't match a created tracking resource.
        case invalidTrackerName
        
        /// Attempted to start tracking after it was already started.
        case trackerAlreadyStarted
        
        /// User is unauthorized to access service.
        case unauthorized
        
        /// An error came back from a service call.
        case serviceError(Error)
    }
}
