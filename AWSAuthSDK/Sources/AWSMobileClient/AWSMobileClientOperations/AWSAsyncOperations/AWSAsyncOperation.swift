//
// Copyright 2017-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

enum AWSAsyncBlockState: String {
    case ready = "isReady"
    case executing = "isExecuting"
    case finished  = "isFinished"
    case cancelled = "isCancelled"
}

class AWSAsyncOperation: Operation {

    private var _state: AWSAsyncBlockState = .ready

    // Synchronizes access to `tokenFetchState`.
    private let stateQueue = DispatchQueue(
        label: "com.amazonaws.awsmobileClient.awsasyncoperation.state",
        target: DispatchQueue.global())

    private dynamic var state: AWSAsyncBlockState {
        get { return stateQueue.sync { _state } }
        set { stateQueue.sync { self._state = newValue } }
    }

    override var isReady: Bool {
        state == .ready
    }

    override var isExecuting: Bool {
        state == .executing
    }

    override var isFinished: Bool {
        state == .finished
    }

    override var isCancelled: Bool {
        state == .cancelled
    }

    override var isAsynchronous: Bool { true }

    override func start() {
        guard !isCancelled else {
            transition(to: .finished)
            return
        }
        transition(to: .executing)
        main()
    }

    /// Subclasses must implement this to perform their work and they must not call `super`.
    /// The default implementation of this function throws an exception.
    open override func main() {
        fatalError("Subclasses must implement `main`.")
    }

    override func cancel() {
        transition(to: .cancelled)
    }

    /// Call this function to finish an operation that is currently executing
    final func finish() {
        transition(to: .finished)
    }

    // handle KVO events before changing state
    private func transition(to newState: AWSAsyncBlockState) {
        guard state != newState else { return }

        willChangeValue(forKey: newState.rawValue)
        willChangeValue(forKey: state.rawValue)

        state = newState

        didChangeValue(forKey: state.rawValue)
        didChangeValue(forKey: newState.rawValue)
    }
}
