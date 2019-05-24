# AWS SDK for iOS

[![Release](https://img.shields.io/github/release/aws/aws-sdk-ios.svg)](../../releases)
[![CocoaPods](https://img.shields.io/cocoapods/v/AWSiOSSDKv2.svg)](https://cocoapods.org/pods/AWSiOSSDKv2)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CircleCI](https://circleci.com/gh/aws-amplify/aws-sdk-ios.svg?style=svg)](https://circleci.com/gh/aws-amplify/aws-sdk-ios)

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

* Xcode 9.2 or later
* iOS 8 or later

## Include the SDK for iOS in an Existing Application

The [samples](https://github.com/awslabs/aws-sdk-ios-samples) included with the SDK for iOS are standalone projects that are already set up for you. You can also integrate the SDK for iOS with your own existing project. There are three ways to import the AWS Mobile SDK for iOS into your project:

* [CocoaPods](https://cocoapods.org/)
* [Carthage](https://github.com/Carthage/Carthage)
* [Dynamic Frameworks](https://aws.amazon.com/mobile/sdk/)

You should use one of these three ways to import the AWS Mobile SDK but not multiple. Importing the SDK in multiple ways loads duplicate copies of the SDK into the project and causes compiler errors.

### CocoaPods

1. The AWS Mobile SDK for iOS is available through [CocoaPods](http://cocoapods.org). If you have not installed CocoaPods, install CocoaPods by running the command:

        $ gem install cocoapods
        $ pod setup

    Depending on your system settings, you may have to use `sudo` for installing `cocoapods` as follows:

        $ sudo gem install cocoapods
        $ pod setup

2. In your project directory (the directory where your `*.xcodeproj` file is), create a plain text file named `Podfile` (without any file extension) and add the lines below. Replace `YourTarget` with your actual target name.

        source 'https://github.com/CocoaPods/Specs.git'
        
        platform :ios, '8.0'
        use_frameworks!
        
        target :'YourTarget' do
            pod 'AWSAutoScaling'
            pod 'AWSCloudWatch'
            pod 'AWSCognito'
            pod 'AWSCognitoIdentityProvider'
            pod 'AWSDynamoDB'
            pod 'AWSEC2'
            pod 'AWSElasticLoadBalancing'
            pod 'AWSIoT'
            pod 'AWSKinesis'
            pod 'AWSLambda'
            pod 'AWSMachineLearning'
            pod 'AWSMobileAnalytics'
            pod 'AWSS3'
            pod 'AWSSES'
            pod 'AWSSimpleDB'
            pod 'AWSSNS'
            pod 'AWSSQS'
        end
        
    ![image](readme-images/cocoapods-setup-01.png?raw=true)
        
3. Then run the following command:
    
        $ pod install

4. Open up `*.xcworkspace` with Xcode and start using the SDK.

    ![image](readme-images/cocoapods-setup-02.png?raw=true)

    **Note**: Do **NOT** use `*.xcodeproj`. If you open up a project file instead of a workspace, you receive an error:

        ld: library not found for -lPods-AWSCore
        clang: error: linker command failed with exit code 1 (use -v to see invocation)

### Carthage

1. Install the latest version of [Carthage](https://github.com/Carthage/Carthage#installing-carthage).

2. Add the following to your `Cartfile`:

        github "aws-amplify/aws-sdk-ios"

3. Then run the following command:
    
        $ carthage update

4. With your project open in Xcode, select your **Target**. Under **General** tab, find **Embedded Binaries** and then click the **+** button.

5. Click the **Add Other...** button, navigate to the `AWS<#ServiceName#>.framework` files under `Carthage` > `Build` > `iOS` and select them. Do not check the **Destination: Copy items if needed** checkbox when prompted.

    * `AWSCore.framework`
    * `AWSAutoScaling.framework`
    * `AWSCloudWatch.framework`
    * `AWSCognito.framework`
    * `AWSCognitoIdentityProvider.framework`
    * `AWSDynamoDB.framework`
    * `AWSEC2.framework`
    * `AWSElasticLoadBalancing.framework`
    * `AWSIoT.framework`
    * `AWSKinesis.framework`
    * `AWSLambda.framework`
    * `AWSMachineLearning.framework`
    * `AWSMobileAnalytics.framework`
    * `AWSS3.framework`
    * `AWSSES.framework`
    * `AWSSimpleDB.framework`
    * `AWSSNS.framework`
    * `AWSSQS.framework`

6. Under the **Build Phases** tab in your **Target**, click the **+** button on the top left and then select **New Run Script Phase**. Then setup the build phase as follows. Make sure this phase is below the `Embed Frameworks` phase.

        Shell /bin/sh
        
        bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/AWSCore.framework/strip-frameworks.sh"
        
        Show environment variables in build log: Checked
        Run script only when installing: Not checked
        
        Input Files: Empty
        Output Files: Empty

> Note: Currently, the AWS SDK for iOS builds the Carthage binaries using Xcode 10.1.0. To consume the pre-built binaries your Xcode version needs to be the same, else you have to build the frameworks on your machine by passing `--no-use-binaries` flag to `carthage update` command.

### Frameworks

1. Download the SDK from our [AWS Mobile SDK](http://aws.amazon.com/mobile/sdk) page. The SDK is stored in a compressed file archive named `aws-ios-sdk-#.#.#` (where `#.#.#` represents the version number, so for version 2.7.0, the filename is `aws-ios-sdk-2.7.0`).

2. With your project open in Xcode, select your **Target**. Under **General** tab, find **Embedded Binaries** and then click the **+** button.

3. Click the **Add Other...** button, navigate to the `AWS<#ServiceName#>.framework` files and select them. Check the **Destination: Copy items if needed** checkbox when prompted.

    * `AWSCore.framework`
    * `AWSAutoScaling.framework`
    * `AWSCloudWatch.framework`
    * `AWSCognito.framework`
    * `AWSCognitoIdentityProvider.framework`
    * `AWSDynamoDB.framework`
    * `AWSEC2.framework`
    * `AWSElasticLoadBalancing.framework`
    * `AWSIoT.framework`
    * `AWSKinesis.framework`
    * `AWSLambda.framework`
    * `AWSMachineLearning.framework`
    * `AWSMobileAnalytics.framework`
    * `AWSS3.framework`
    * `AWSSES.framework`
    * `AWSSimpleDB.framework`
    * `AWSSNS.framework`
    * `AWSSQS.framework`

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

1. In Xcode select the following frameworks in **Project Navigator** and hit **delete** on your keyboard. Then select **Move to Trash**:

    * `AWSCore.framework`
    * `AWSAutoScaling.framework`
    * `AWSCloudWatch.framework`
    * `AWSCognito.framework`
    * `AWSCognitoIdentityProvider.framework`
    * `AWSDynamoDB.framework`
    * `AWSEC2.framework`
    * `AWSElasticLoadBalancing.framework`
    * `AWSIoT.framework`
    * `AWSKinesis.framework`
    * `AWSLambda.framework`
    * `AWSMachineLearning.framework`
    * `AWSMobileAnalytics.framework`
    * `AWSS3.framework`
    * `AWSSES.framework`
    * `AWSSimpleDB.framework`
    * `AWSSNS.framework`
    * `AWSSQS.framework`

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

## AWSTask

With native AWSTask support in the SDK for iOS, you can chain async requests instead of nesting them. It makes the logic cleaner, while keeping the code more readable. Read [Working with AWSTask](http://docs.aws.amazon.com/mobile/sdkforios/developerguide/awstask.html) to learn how to use AWSTask.

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
AWSDDLog.add(AWSDDTTYLogger.sharedInstance()) // TTY = Xcode console
```

**Objective-C**

```objective-c
[AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]]; // TTY = Xcode console
```

## Install the Reference Documentation in Xcode

The AWS Mobile SDK for iOS zip file includes documentation in the DocSets format that you can view within Xcode. The easiest way to install the documentation is to use the Mac OS X terminal.

1. Open the Mac OS X terminal and go to the directory containing the expanded archive. For example:

        $ cd ~/Downloads/aws-ios-sdk-2.7.0

    **Note**: Remember to replace 2.7.0 in the example above with the actual version number of the AWS SDK for iOS that you downloaded.

2. Create a directory called `~/Library/Developer/Shared/Documentation/DocSets`:

        $ mkdir -p ~/Library/Developer/Shared/Documentation/DocSets

3. Copy (or move) `Documentation/com.amazon.aws.ios.docset` from the SDK installation files to the directory you created in the previous step:

        $ mv Documentation/com.amazon.aws.ios.docset ~/Library/Developer/Shared/Documentation/DocSets/

4. If Xcode was running during this procedure, restart Xcode. To browse the documentation, go to **Help**, click **Documentation and API Reference**, and select **AWS Mobile SDK for iOS v2.7.0 Documentation** (where '2.7.0' is the appropriate version number).

## Talk to Us

Visit our GitHub [Issues](https://github.com/aws-amplify/aws-sdk-ios/issues) to leave feedback and to connect with other users of the SDK.

## Author

Amazon Web Services

## License

See the **LICENSE** file for more info.
