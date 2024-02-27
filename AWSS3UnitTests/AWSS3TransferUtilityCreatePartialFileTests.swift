//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

class AWSS3TransferUtilityCreatePartialFileTests: XCTestCase {
    enum Failure: Error {
        case unableToCreateServiceConfiguration
    }

    var transferUtility: AWSS3TransferUtility?

    override func setUpWithError() throws {
        guard transferUtility == nil else { return }
        let key = "UnitTests"
        guard let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: nil) else {
            throw Failure.unableToCreateServiceConfiguration
        }
        AWSS3TransferUtility.register(with: configuration, forKey: key)
        let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: key)
        self.transferUtility = transferUtility

        AWSDDLog.sharedInstance.logLevel = .verbose
        AWSDDLog.sharedInstance.add(AWSDDTTYLogger.sharedInstance)
    }

    func testCreatingPartialFile() throws {
        guard let transferUtility = transferUtility else {
            XCTFail("Unable to unwrap Transfer Utility")
            return
        }

        let parts: [String] = [
            Array(repeating: "a", count: 5120).joined(),
            Array(repeating: "b", count: 5120).joined(),
            Array(repeating: "c", count: 5120).joined(),
            Array(repeating: "d", count: 5120).joined(),
            Array(repeating: "e", count: 5120).joined(),
            Array(repeating: "f", count: 2560).joined()
        ]
        let string = parts.joined()

        guard let data = string.data(using: .utf8) else {
            XCTFail("Failed to create data for file")
            return
        }

        let fileURL = try createTemporaryFile(data: data)

        defer {
            removeFileIfExists(fileURL: fileURL)
        }
        var offset: UInt = 0

        let cachesURL = try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let baseURL = cachesURL.appendingPathComponent(UUID().uuidString)
        print("Base URL: \(baseURL)")
        try FileManager.default.createDirectory(at: baseURL, withIntermediateDirectories: true, attributes: nil)
        defer {
            var isDir : ObjCBool = false
            if FileManager.default.fileExists(atPath: baseURL.path, isDirectory: &isDir), isDir.boolValue {
                try? FileManager.default.removeItem(at: baseURL)
            }
        }

        var rebuild: [String] = []

        let exists = FileManager.default.fileExists(atPath: fileURL.path)
        XCTAssertTrue(exists)

        try parts.forEach { part in
            let length: UInt = UInt(part.count)
            let partFileURL = try transferUtility.createPartialFile(fileURL, offset: offset, length: length, baseURL: baseURL)
            offset += length

            let exists = FileManager.default.fileExists(atPath: partFileURL.path)
            XCTAssertTrue(exists)

            let fileContents = try String(contentsOf: partFileURL)
            XCTAssertEqual(fileContents, part)
            XCTAssertEqual(fileContents.first, fileContents.last)
            XCTAssertEqual(part.first, part.last)
            XCTAssertEqual(part.first, fileContents.last)
            XCTAssertEqual(fileContents.first, part.last)

            print("File Contents:\n\(fileContents)")

            rebuild.append(fileContents)
        }

        XCTAssertGreaterThan(parts.count, 0)
        XCTAssertGreaterThan(rebuild.count, 0)
        XCTAssertEqual(parts.count, rebuild.count)
        XCTAssertEqual(parts, rebuild)
    }

    private func createTemporaryFile(data: Data) throws -> URL {
        let cachesURL = try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileName = "\(UUID().uuidString).tmp"
        let fileURL = cachesURL.appendingPathComponent(fileName)
        try data.write(to: fileURL, options: .atomicWrite)

        return fileURL
    }

    private func removeFileIfExists(fileURL: URL) {
        if FileManager.default.fileExists(atPath: fileURL.path) {
            try? FileManager.default.removeItem(at: fileURL)
        }
    }

}
