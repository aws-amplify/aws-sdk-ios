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

final class AtomicValue<Value> {
    let lock = NSLock()

    var value: Value

    init(initialValue: Value) {
        self.value = initialValue
    }

    func get() -> Value {
        lock.lock()
        defer {
            lock.unlock()
        }
        return value
    }

    func set(_ newValue: Value) {
        lock.lock()
        defer {
            lock.unlock()
        }
        value = newValue
    }

    /// Sets AtomicValue to `newValue` and returns the old value
    func getAndSet(_ newValue: Value) -> Value {
        lock.lock()
        defer {
            lock.unlock()
        }
        let oldValue = value
        value = newValue
        return oldValue
    }

    /// Performs `block` with the current value, preventing other access until the block exits.
    func atomicallyPerform(block: (Value) -> Void) {
        lock.lock()
        defer {
            lock.unlock()
        }
        block(value)
    }

    /// Performs `block` with an `inout` value, preventing other access until the block exits,
    /// and enabling the block to mutate the value
    func with(block: (inout Value) -> Void) {
        lock.lock()
        defer {
            lock.unlock()
        }
        block(&value)
    }

}
