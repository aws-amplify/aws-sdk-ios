//
// Copyright 2017-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

/// A HashTable that stores weak references to its contents and it's thread safe to access
class WeakHashTable<Element: AnyObject> {
    private var items: NSHashTable<Element> = NSHashTable.weakObjects()
    private let accessQueue: DispatchQueue = DispatchQueue(label:"AWSMobileClient.WeakHashTable.\(Element.self)",
                                                           attributes: .concurrent)

    func add(_ object: Element?) {
        accessQueue.sync(flags: .barrier) {
            items.add(object)
        }
    }

    func remove(_ object: Element?) {
        accessQueue.sync(flags: .barrier) {
            items.remove(object)
        }
    }

    var allObjects: [Element] {
        accessQueue.sync { items.allObjects }
    }
}
