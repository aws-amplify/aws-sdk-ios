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

final class AtomicValue<T> {
    private let queue = DispatchQueue(label: "com.amazonaws.AtomicValue")

    private var value: T

    init(initialValue: T) {
        self.value = initialValue
    }

    func get() -> T {
        return queue.sync { value }
    }

    func set(_ newValue: T) {
        queue.sync { value = newValue }
    }

    /// Sets AtomicValue to `newValue` and returns the old value
    func getAndSet(_ newValue: T) -> T {
        return queue.sync {
            let oldValue = value
            value = newValue
            return oldValue
        }
    }
}

// MARK: - Bool

extension AtomicValue where T == Bool {
    func toggle() -> T {
        return queue.sync {
            let oldValue = value
            value.toggle()
            return oldValue
        }
    }
}

// MARK: - Numeric

extension AtomicValue where T: Numeric {
    func increment(by amount: T = 1) -> T {
        return queue.sync {
            value += amount
            return value
        }
    }

    func decrement(by amount: T = 1) -> T {
        return queue.sync {
            value -= amount
            return value
        }
    }
}

// MARK: - Collection

extension AtomicValue where T: RangeReplaceableCollection {
    var count: Int {
        return queue.sync {
            return value.count
        }
    }

    func append(element: T.Element) {
        queue.sync {
            value.append(element)
        }
    }
}
