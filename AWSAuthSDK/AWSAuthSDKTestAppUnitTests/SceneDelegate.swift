//
//  SceneDelegate.swift
//  AWSAuthSDKTestAppUnitTests
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    /// This app is to support keychain access for the test that require a hosted app.
    /// Do not initialize AWSMobileClient in this app, instead it should be done inside the
    /// test code.
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
      
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
