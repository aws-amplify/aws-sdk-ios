//
//  AppDelegate.swift
//  AWSAuthSDKTestAppUnitTests
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// This app is to support keychain access for the test that require a hosted app.
    /// Do not initialize AWSMobileClient in this app, instead it should be done inside the
    /// test code.
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

