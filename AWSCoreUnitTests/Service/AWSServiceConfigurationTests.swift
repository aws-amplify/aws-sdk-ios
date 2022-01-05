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
import AWSCore

/// This replicates a subclass identical to the downstream usages of `AWSServiceConfiguration` by Amplify
/// https://github.com/aws-amplify/amplify-ios/blob/main/AmplifyPlugins/Core/AWSPluginsCore/ServiceConfiguration/AmplifyAWSServiceConfiguration.swift
class MockAWSServiceConfiguration: AWSServiceConfiguration {
    static let version = "0.0.0"
    
    override public class func baseUserAgent() -> String! {
        return "baseUserAgentOverride"
    }
    
    override public var userAgent: String  {
        return MockAWSServiceConfiguration.baseUserAgent()
    }
    
    override public func copy(with zone: NSZone? = nil) -> Any {
        return super.copy(with: zone)
    }
    
    override init() {
        super.init(region: .Unknown, credentialsProvider: nil)
    }
    
    override public init!(region regionType: AWSRegionType, credentialsProvider: AWSCredentialsProvider!) {
        super.init(region: regionType, credentialsProvider: credentialsProvider)
    }
    
    public init(region regionType: AWSRegionType) {
        super.init(region: regionType, credentialsProvider: nil)
    }
    
    override public init!(region regionType: AWSRegionType,
                          endpoint: AWSEndpoint,
                          credentialsProvider: AWSCredentialsProvider,
                          localTestingEnabled: Bool) {
        super.init(region: regionType,
                   endpoint: endpoint,
                   credentialsProvider: credentialsProvider,
                   localTestingEnabled: localTestingEnabled)
    }
}

class AWSServiceConfigurationTests: XCTestCase {

    /// Test instantiating a subclass of `AWSServiceConfiguration` to ensure no breaking changes for downstream usages of this class.
    func testInstantiation() throws {
        let credentialProvider = MockCredentialsProvider()
        let configuration = MockAWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        XCTAssertNotNil(configuration)
        XCTAssertNotNil(configuration?.userAgent)
    }
}


