# AWS SDK for iOS

[![Release](https://img.shields.io/github/release/aws/aws-sdk-ios.svg)](../../releases)
[![CocoaPods](https://img.shields.io/cocoapods/v/AWSCore.svg)](https://cocoapods.org/pods/AWSCore)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CircleCI](https://circleci.com/gh/aws-amplify/aws-sdk-ios.svg?style=svg)](https://circleci.com/gh/aws-amplify/aws-sdk-ios)
[![Discord](https://img.shields.io/discord/308323056592486420?logo=discord)](https://discord.gg/jWVbPfC) 

The AWS SDK for iOS provides a library and documentation for developers to build connected mobile applications using AWS.

### Features / APIs

- [__Authentication__](https://aws-amplify.github.io/docs/ios/authentication): APIs and building blocks for developers who want to create user authentication experiences.  
- [__Analytics__](https://aws-amplify.github.io/docs/ios/analytics): Easily collect analytics data for your app. Analytics data includes user sessions and other custom events that you want to track in your app.  
- [__API__](https://aws-amplify.github.io/docs/ios/api): Provides a simple solution when making HTTP requests. It provides an automatic, lightweight signing process which complies with AWS Signature Version 4.
- [__Storage__](https://aws-amplify.github.io/docs/ios/storage): Provides a simple mechanism for managing user content for your app in public, protected or private storage buckets.  
- [__Push Notifications__](https://aws-amplify.github.io/docs/ios/push-notifications): Allows you to integrate push notifications in your app with Amazon Pinpoint targeting and campaign management support.
- [__PubSub__](https://aws-amplify.github.io/docs/ios/pubsub): Provides connectivity with cloud-based message-oriented middleware.  
- [__Generated AWS Service Interfaces__](https://aws-amplify.github.io/docs/ios/manualsetup): Provides direct interaction with any AWS service. 

#### Visit our [Web Site](https://aws-amplify.github.io) to learn more about Amplify Framework.

* [Documentation](https://aws-amplify.github.io/docs)
* [Setup](#setup)
* [Examples](https://github.com/awslabs/aws-sdk-ios-samples)

## Setup

To get started with the AWS SDK for iOS, check out the [Developer Guide for iOS](https://aws-amplify.github.io/docs/ios/start). You can set up the SDK and start building a new project, or you integrate the SDK in an existing project. You can also run the samples to get a sense of how the SDK works.

To use the AWS SDK for iOS, you will need the following installed on your development machine:

* Xcode 11.0 or later
* Most SDKs require iOS 8 or later. AWSCognitoAuth, AWSMobileClient, and AWSTranscribeStreaming require iOS 9.

## Include the SDK for iOS in an Existing Application

We have a couple [samples](https://github.com/awslabs/aws-sdk-ios-samples) applications which showcase how to use the AWS SDK for iOS.  Please note that the code in these sample applications is not of production quality, and should be considered as exactly what we called them: samples.

There are three ways to integrate the AWS Mobile SDK for iOS into your own project:

* [CocoaPods](https://cocoapods.org/)
* [Carthage](https://github.com/Carthage/Carthage)
* [Dynamic Frameworks](https://aws.amazon.com/mobile/sdk/)

You should use ONE and only one of these ways to import the AWS Mobile SDK. Importing the SDK in multiple ways loads duplicate copies of the SDK into the project and causes compiler/linker errors.

### CocoaPods

1. The AWS Mobile SDK for iOS is available through [CocoaPods](http://cocoapods.org). If you have not installed CocoaPods, install CocoaPods by running the command:

        $ gem install cocoapods
        $ pod setup

    Depending on your system settings, you may have to use `sudo` for installing `cocoapods` as follows:

        $ sudo gem install cocoapods
        $ pod setup

2. In your project directory (the directory where your `*.xcodeproj` file is), run the following to create a `Podfile` in your project.

        $ pod init

3. Edit the podfile to include the pods you want to integrate into your project.  For example, if you need auth, you can use AWSMobileClient, and if you need analytics, you add AWSPinpoint.  As a result, your podfile might look something like this:
```
target 'YourTarget' do
    pod 'AWSMobileClient'
    pod 'AWSPinpoint'
end
```

For a complete list of our pods, check out the .podspec files in the root directory of this project.

3. Then run the following command:
    
        $ pod install --repo-update

4. To open your project, open the newly generated `*.xcworkspace` file in your project's directory with XCode.  You can do this by issuing the following command in your project folder:

        $ xed .

    **Note**: Do **NOT** use `*.xcodeproj`. If you open up a project file instead of a workspace, you may receive the following error:

        ld: library not found for -lPods-AWSCore
        clang: error: linker command failed with exit code 1 (use -v to see invocation)

### Carthage

1. Install the latest version of [Carthage](https://github.com/Carthage/Carthage#installing-carthage).

2. Add the following to your `Cartfile`:

        github "aws-amplify/aws-sdk-ios"

3. Then run the following command:
    
        $ carthage update

4. With your project open in Xcode, select your **Target**. Under **General** tab, find **Frameworks, Libraries, and Embedded Content** and then click the **+** button.

5. Click the **Add Other...** button, then "Add Files..." in the popup menu, then navigate to the `AWS<#ServiceName#>.framework` files under `Carthage` > `Build` > `iOS` and select them. Do not check the **Destination: Copy items if needed** checkbox if prompted.  Add the frameworks that you need for you specific use case.  For example, if you are using AWSMobileClient and AWSPinpoint, you will want to add the following frameworks:

    * `AWSAuthCore.framework`
    * `AWSCognitoIdentityProvider.framework`
    * `AWSCognitoIdentityProviderASF.framework`
    * `AWSCore.framework`
    * `AWSMobileClient.framework`
    * `AWSPinpoint.framework`

6. Under the **Build Phases** tab in your **Target**, click the **+** button on the top left and then select **New Run Script Phase**. Then setup the build phase as follows. Make sure this phase is below the `Embed Frameworks` phase.

        Shell /bin/sh
        
        bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/AWSCore.framework/strip-frameworks.sh"
        
        Show environment variables in build log: Checked
        Run script only when installing: Not checked
        
        Input Files: Empty
        Output Files: Empty

> Note: Currently, the AWS SDK for iOS builds the Carthage binaries using the latest released version of Xcode. To consume the pre-built binaries your Xcode version needs to be the same, else you have to build the frameworks on your machine by passing `--no-use-binaries` flag to `carthage update` command.

### Frameworks

1. Download the [latest SDK](https://sdk-for-ios.amazonwebservices.com/latest/aws-ios-sdk.zip). Older SDK versions can be downloaded from `https://sdk-for-ios.amazonwebservices.com/aws-ios-sdk-#.#.#.zip`, where `#.#.#` represents the version number. So for version 2.10.2, the download link is [https://sdk-for-ios.amazonwebservices.com/aws-ios-sdk-2.10.2.zip](https://sdk-for-ios.amazonwebservices.com/aws-ios-sdk-2.10.2.zip).

2. With your project open in Xcode, select your **Target**. Under **General** tab, find **Embedded Binaries** and then click the **+** button.

3. Click the **Add Other...** button, navigate to the `AWS<#ServiceName#>.framework` files and select them. Check the **Destination: Copy items if needed** checkbox when prompted.  Add the frameworks that you need for you specific use case.  For example, if you are using AWSMobileClient and AWSPinpoint, you will want to add the following frameworks:

    * `AWSAuthCore.framework`
    * `AWSCognitoIdentityProvider.framework`
    * `AWSCognitoIdentityProviderASF.framework`
    * `AWSCore.framework`
    * `AWSMobileClient.framework`
    * `AWSPinpoint.framework`

4. Under the **Build Phases** tab in your **Target**, click the **+** button on the top left and then select **New Run Script Phase**. Then setup the build phase as follows. Make sure this phase is below the `Embed Frameworks` phase.

        Shell /bin/sh
        
        bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/AWSCore.framework/strip-frameworks.sh"
        
        Show environment variables in build log: Checked
        Run script only when installing: Not checked
        
        Input Files: Empty
        Output Files: Empty

## Update the SDK to a Newer Version

When we release a new version of the SDK, you can pick up the changes as described below.

### CocoaPods

1. Run the following command in your project directory. CocoaPods automatically picks up the new changes.

        $ pod update

    **Note**: If your pod is having an issue, you can delete `Podfile.lock` and `Pods/` then run `pod install` to cleanly install the SDK.
    
    ![image](readme-images/cocoapods-setup-03.png?raw=true)

### Carthage

1. Run the following command in your project directory. Carthage automatically picks up the new changes.

        $ carthage update

### Frameworks

1. In Xcode's **Project Navigator**, type "AWS" to find the AWS frameworks that were manually added to your project.  Manually select all of the AWS frameworks and hit **delete** on your keyboard. Then select **Move to Trash**.  If you were following the example from above which uses AWSMobileClient and AWSPinpoint, you would remove:

    * `AWSAuthCore.framework`
    * `AWSCognitoIdentityProvider.framework`
    * `AWSCognitoIdentityProviderASF.framework`
    * `AWSCore.framework`
    * `AWSMobileClient.framework`
    * `AWSPinpoint.framework`

2. Follow the installation process above to include the new version of the SDK.

## Getting Started with Swift

1. Import the AWSCore header in the application delegate.

    ```swift
    import AWSCore
    ```

2. Create a default service configuration by adding the following code snippet in the `application:didFinishLaunchingWithOptions:` application delegate method.

    ```swift
    let credentialsProvider = AWSCognitoCredentialsProvider(
        regionType: CognitoRegionType,
        identityPoolId: CognitoIdentityPoolId)
    let configuration = AWSServiceConfiguration(
        region: DefaultServiceRegionType,
        credentialsProvider: credentialsProvider)
    AWSServiceManager.default().defaultServiceConfiguration = configuration
    ```

3. In Swift file you want to use the SDK, import the appropriate headers for the services you are using. The header file import convention is `import AWSServiceName`, as in the following examples:

    ```swift
    import AWSS3
    import AWSDynamoDB
    import AWSSQS
    import AWSSNS
    import AWSCognito
    ```
        
4. Make a call to the AWS services.

    ```swift
    let dynamoDB = AWSDynamoDB.default()
    let listTableInput = AWSDynamoDBListTablesInput()
    dynamoDB.listTables(listTableInput!).continueWith { (task:AWSTask<AWSDynamoDBListTablesOutput>) -> Any? in
        if let error = task.error as? NSError {
        print("Error occurred: \(error)")
            return nil
        }
    
        let listTablesOutput = task.result
    
        for tableName in listTablesOutput!.tableNames! {
            print("\(tableName)")
        }
    
        return nil
    }
    ```
        
**Note**: Most of the service client classes have a singleton method to get a default client. The naming convention is `+ defaultSERVICENAME` (e.g. `+ defaultDynamoDB` in the above code snippet). This singleton method creates a service client with `defaultServiceConfiguration`, which you set up in step 5, and maintains a strong reference to the client.

## Getting Started with Objective-C

1. Import the AWSCore header in the application delegate.
        
    ```objective-c
    @import AWSCore;
    ```

2. Create a default service configuration by adding the following code snippet in the `application:didFinishLaunchingWithOptions:` application delegate method.

    ```objective-c
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:CognitoRegionType
                                                                                                    identityPoolId:CognitoIdentityPoolId];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:DefaultServiceRegionType
                                                                         credentialsProvider:credentialsProvider];
    AWSServiceManager.defaultServiceManager.defaultServiceConfiguration = configuration;
    ```

3. Import the appropriate headers for the services you are using. The header file import convention is `@import AWSServiceName;`, as in the following examples:

    ```objective-c
    @import AWSS3;
    @import AWSDynamoDB;
    @import AWSSQS;
    @import AWSSNS;
    @import AWSCognito;
    ```

4. Make a call to the AWS services.

    ```objective-c
    AWSS3TransferManager *transferManager = [AWSS3TransferManager defaultS3TransferManager];
    AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
    uploadRequest.bucket = yourBucket;
    uploadRequest.key = yourKey;
    uploadRequest.body = yourDataURL;
    uploadRequest.contentLength = [NSNumber numberWithUnsignedLongLong:fileSize];
    
    [[transferManager upload:uploadRequest] continueWithBlock:^id(AWSTask *task) {
        // Do something with the response
        return nil;
    }];
    ```

**Note**: Most of the service client classes have a singleton method to get a default client. The naming convention is `+ defaultSERVICENAME` (e.g. `+ defaultS3TransferManager` in the above code snippet). This singleton method creates a service client with `defaultServiceConfiguration`, which you set up in step 5, and maintains a strong reference to the client.

## Working with AWSTask

The SDK returns `AWSTask` objects when operating on asynchronous operations to avoid blocking the UI thread.

The AWSTask class is a renamed version of BFTask from the Bolts framework. For complete documentation on Bolts, see the [Bolts-iOS repo](https://github.com/BoltsFramework/Bolts-ObjC)

## Logging

As of version 2.5.4 of this SDK, logging utilizes [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack), a flexible, fast, open source logging framework. It supports many capabilities including the ability to set logging level per output target, for instance, concise messages logged to the console and verbose messages to a log file.

CocoaLumberjack logging levels are additive such that when the level is set to verbose, all messages from the levels below verbose are logged. It is also possible to set custom logging to meet your needs. For more information, see [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack/blob/master/Documentation/CustomLogLevels.md)

### Changing Log Levels

**Swift**

```swift
AWSDDLog.sharedInstance.logLevel = .verbose
```

The following logging level options are available:

* `.off`
* `.error`
* `.warning`
* `.info`
* `.debug`
* `.verbose`

**Objective-C**

```objective-c
[AWSDDLog sharedInstance].logLevel = AWSDDLogLevelVerbose;
```

The following logging level options are available:

* `AWSDDLogLevelOff`
* `AWSDDLogLevelError`
* `AWSDDLogLevelWarning`
* `AWSDDLogLevelInfo`
* `AWSDDLogLevelDebug`
* `AWSDDLogLevelVerbose`

We recommend setting the log level to `Off` before publishing to the Apple App Store.

### Targeting Log Output

CocoaLumberjack can direct logs to file or used as a framework that integrates with the Xcode console.

To initialize logging to files, use the following code:

**Swift**

```swift
let fileLogger: AWSDDFileLogger = AWSDDFileLogger() // File Logger
fileLogger.rollingFrequency = TimeInterval(60*60*24)  // 24 hours
fileLogger.logFileManager.maximumNumberOfLogFiles = 7
AWSDDLog.add(fileLogger)
```

**Objective-C**

```objective-c
AWSDDFileLogger *fileLogger = [[AWSDDFileLogger alloc] init]; // File Logger
fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
[AWSDDLog addLogger:fileLogger];
```

To initialize logging to your Xcode console, use the following code:

**Swift**

```swift
AWSDDLog.add(AWSDDTTYLogger.sharedInstance) // TTY = Xcode console
```

**Objective-C**

```objective-c
[AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]]; // TTY = Xcode console
```

## Open Source Contributions

We welcome any and all contributions from the community! Make sure you read through our contribution guide [here](./CONTRIBUTING.md) before submitting any PR's. Thanks! <3

## Talk to Us

Visit our GitHub [Issues](https://github.com/aws-amplify/aws-sdk-ios/issues) to leave feedback and to connect with other users of the SDK.

## Author

Amazon Web Services

## License

See the **LICENSE** file for more info.
