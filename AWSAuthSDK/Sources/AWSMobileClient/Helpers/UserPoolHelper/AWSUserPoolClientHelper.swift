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

struct AWSUserPoolClientHelper {

    static func userPoolClient(for key: String = "key") -> AWSCognitoIdentityUserPool {
        if let pool = AWSCognitoIdentityUserPool(forKey: key) {
            return pool
        }

        var serviceConfiguration: AWSServiceConfiguration? = nil
        let serviceInfo = AWSInfo.default().defaultServiceInfo("CognitoUserPool")
        if let serviceInfo = serviceInfo {
            let endpointOverride = Self.resolveEndpointOverride(from: serviceInfo)
            if (endpointOverride != nil) {
                serviceConfiguration = AWSServiceConfiguration(region: serviceInfo.region,
                                                               endpoint: endpointOverride,
                                                               credentialsProvider: nil,
                                                               localTestingEnabled: false)
            } else {
                serviceConfiguration = AWSServiceConfiguration(region: serviceInfo.region,
                                                               credentialsProvider: nil)
            }
        }
        let userPoolConfiguration = AWSCognitoIdentityUserPool.buildConfiguration(serviceInfo)
        AWSCognitoIdentityUserPool.register(with: serviceConfiguration,
                                            userPoolConfiguration: userPoolConfiguration,
                                            forKey: "key")
        return AWSCognitoIdentityUserPool(forKey: "key")!

    }

    static func resolveEndpointOverride(from serviceInfo: AWSServiceInfo) -> AWSEndpoint? {
        guard let endpointOverride = serviceInfo.infoDictionary["Endpoint"] as? String else {
            return nil
        }

        var components = URLComponents()
        components.scheme = "https"
        components.percentEncodedHost = endpointOverride;

        guard let endpointURL = components.url else {
            let message = """
            Invalid Endpoint value '\(endpointOverride)'. Expected a fully-qualified hostname.
            """
            fatalError(message)
        }
        return AWSEndpoint(region: serviceInfo.region,
                           service: .CognitoIdentityProvider,
                           url: endpointURL)
    }
}
