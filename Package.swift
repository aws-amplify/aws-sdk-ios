// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AWSSDKiOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AWSCore",
            targets: ["AWSCore"]),
        .library(
            name: "AWSMobileClient",
            targets: ["AWSMobileClient"]),
        .library(
            name: "AWSCognitoIdentityProvider",
            targets: ["AWSCognitoIdentityProvider"])
    ],
    dependencies: [
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
        .binaryTarget(
            name: "AWSCore",
            path:"./XCFrameworks/AWSCore.xcframework"
        ),
        .binaryTarget(
            name: "AWSMobileClient",
            path:"./XCFrameworks/AWSMobileClient.xcframework"
        ),
        .binaryTarget(
            name: "AWSCognitoIdentityProvider",
            path:"./XCFrameworks/AWSCognitoIdentityProvider.xcframework"
        )]
)
