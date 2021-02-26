//
//  AWSMobileClientConfig.swift
//  AWSMobileClientUnitTests
//

import Foundation

/// Configuration used by all unit tests in this target.
/// This is an alternative to the `awsconfiguration.json`.
///
/// **Notes:** This object should not contain real credentials or any other sensitive data.
/// Files in this target should be used for unit testing specific aspects of the Mobile Client that
/// don't depend on real credentials and/or access to the services. For that check `AWSMobileClientTests`.
let AWSMobileClientConfig: [String: Any] = [
    "IdentityManager": [
        "Default": [:]
    ],
    "Auth": [
        "Default": [
            "OAuth": [
                "AppClientId": "APP_CLIENT_ID",
                "AppClientSecret": "APP_CLIENT_SECRET",
                "Scopes": ["phone", "email"]
            ]
        ]
    ]
]
