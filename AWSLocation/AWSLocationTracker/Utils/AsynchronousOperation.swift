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

import Foundation

// Copied from Amplify and internal for internal usage

/// This class is to facilitate executing asychronous requests. The caller can transition the operation to its finished
/// state by calling finish() in the callback of an asychronous request to ensure that the operation is only removed
/// from the OperationQueue after it has completed all its work. This class is not inherently thread safe. Although it
/// is a subclass of Foundation's Operation, it contains private state to support pausing, resuming, and finishing, that
/// must be managed by callers.
class AsynchronousOperation: Operation {

    /// State for this operation.
    @objc private enum OperationState: Int {
        case notExecuting
        case executing
        case finished
    }

    /// Synchronizes access to `state`.
    private let stateQueue = DispatchQueue(label: "com.amazonaws.amplify.AsynchronousOperation.state",
                                           target: DispatchQueue.global())

    /// Private backing stored property for `state`.
    private var _state: OperationState = .notExecuting

    /// The state of the operation
    @objc private dynamic var state: OperationState {
        get { return stateQueue.sync { _state } }
        set { stateQueue.sync { self._state = newValue } }
    }

    // MARK: - Various `Operation` properties

    /// `true` if the operation is ready to be executed
    override var isReady: Bool {
        return state == .notExecuting && super.isReady
    }

    /// `true` if the operation is currently executing
    final override var isExecuting: Bool {
        return state == .executing
    }

    /// `true` if the operation has completed executing, either successfully or with an error
    final override var isFinished: Bool {
        return state == .finished
    }

    /// KVN for dependent properties
    override class func keyPathsForValuesAffectingValue(forKey key: String) -> Set<String> {
        if ["isReady", "isFinished", "isExecuting"].contains(key) {
            return [#keyPath(state)]
        }

        return super.keyPathsForValuesAffectingValue(forKey: key)
    }

    /// Starts the operation
    final override func start() {
        if isCancelled {
            state = .finished
            return
        }

        state = .executing
        main()
    }

    /// Subclasses must implement this to perform their work and they must not call `super`.
    /// The default implementation of this function throws an exception.
    override func main() {
        fatalError("Subclasses must implement `main`.")
    }

    /// Call this function to pause an operation that is currently executing
    func pause() {
        if isExecuting {
            state = .notExecuting
        }
    }

    /// Call this function to resume an operation that is currently ready
    func resume() {
        if isReady {
            state = .executing
        }
    }

    /// Call this function to finish an operation that is currently executing
    final func finish() {
        if !isFinished {
            state = .finished
        }
    }
}
