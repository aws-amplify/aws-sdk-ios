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
//  JSONHelper.swift
//  AWSMobileClient
//

import Foundation

/// Helper class to convert json data
struct JSONHelper {
    
    /// Return a dictionary from the data
    ///
    /// - Parameter dictionaryAsData: data object to convert
    /// - Returns: dictonary of string to string
    static func dictionaryFromData(_ dictionaryAsData: Data?) -> [String: String]? {
        guard let dictionaryAsData = dictionaryAsData else {
            return nil
        }
        do {
            let dict = try JSONDecoder().decode([String: String].self, from: dictionaryAsData)
            return dict
        } catch {
            print("Could not read map from data")
        }
        return nil
    }

    /// Return a data from json dictionary
    ///
    /// - Parameter dictionary: Dictionary representation of json
    /// - Returns: data object with the json
    static func dataFromDictionary(_ dictionary: [String: String]?) -> Data? {
        guard let dictionary = dictionary else {
            return nil
        }
        do {
            let data = try Data.init(base64Encoded: JSONEncoder().encode(dictionary).base64EncodedData())
            return data
        } catch {
            print("Could not create data from map")
        }
        return nil
    }
    
    static func arrayFromData(_ arrayAsData: Data?) -> [String]? {
        guard let arrayAsData = arrayAsData else {
            return nil
        }
        do {
            let array = try JSONDecoder().decode([String].self, from: arrayAsData)
            return array
        } catch {
            print("Could not read array from data")
        }
        return nil
    }
    
    static func dataFromArray(_ array:[String]?) -> Data? {
        guard let array = array else {
            return nil
        }
        do {
            let data = try Data.init(base64Encoded: JSONEncoder().encode(array).base64EncodedData())
            return data
        } catch {
            print("Could not create data from array")
        }
        return nil
    }
}
