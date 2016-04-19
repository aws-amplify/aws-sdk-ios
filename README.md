#AWS Mobile SDK for iOS

##Setting Up

To get started with the AWS SDK for iOS, you can set up the SDK and start building a new project, or you integrate the SDK in an existing project. You can also run the samples to get a sense of how the SDK works.

To use the AWS SDK for iOS, you will need the following installed on your development machine:

* Xcode 7 or later
* iOS 8 or later

At the AWS GitHub repo, you can check out the [SDK source code](https://github.com/aws/aws-sdk-ios).

For more information, see  [AWS Mobile SDK for iOS Developer Guide](http://docs.aws.amazon.com/mobile/sdkforios/developerguide/).

##Include the SDK for iOS in an Existing Application

The [samples](https://github.com/awslabs/aws-sdk-ios-samples) included with the SDK for iOS are standalone projects that are already set up for you. You can also integrate the SDK for iOS with your own existing project. There are three ways to import the AWS Mobile SDK for iOS into your project:

* [CocoaPods](https://cocoapods.org/)
* [Carthage](https://github.com/Carthage/Carthage)
* [Dynamic Frameworks](https://aws.amazon.com/mobile/sdk/)

You should use one of these three ways to import the AWS Mobile SDK but not multiple. Importing the SDK in multiple ways loads duplicate copies of the SDK into the project and causes compiler errors.

###CocoaPods

1. The AWS Mobile SDK for iOS is available through [CocoaPods](http://cocoapods.org). If you have not installed CocoaPods, install CocoaPods by running the command:

		$ gem install cocoapods
		$ pod setup

    Depending on your system settings, you may have to use `sudo` for installing `cocoapods` as follows:

		$ sudo gem install cocoapods
		$ pod setup

1. In your project directory (the directory where your `*.xcodeproj` file is), create a plain text file named `Podfile` (without any file extension) and add the lines below.

        source 'https://github.com/CocoaPods/Specs.git'
        
        platform :ios, '8.0'
        
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
        
    ![image](readme-images/cocoapods-setup-01.png?raw=true)
        
1. Then run the following command:
	
		$ pod install

1. Open up `*.xcworkspace` with Xcode and start using the SDK.

    ![image](readme-images/cocoapods-setup-02.png?raw=true)

    **Note**: Do **NOT** use `*.xcodeproj`. If you open up a project file instead of a workspace, you receive an error:

        ld: library not found for -lPods-AWSCore
        clang: error: linker command failed with exit code 1 (use -v to see invocation)

###Carthage

1. Install the latest version of [Carthage](https://github.com/Carthage/Carthage#installing-carthage).

1. Add the following to your `Cartfile`:

        github "aws/aws-sdk-ios"

1. Then run the following command:
	
		$ carthage update

1. With your project open in Xcode, select your **Target**. Under **General** tab, find **Embedded Binaries** and then click the **+** button.

1. Click the **Add Other...** button, navigate to the `AWS<#ServiceName#>.framework` files under `Carthage` > `Build` > `iOS` and select them. Do not check the **Destination: Copy items if needed** checkbox when prompted.

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

1. Under the **Buid Phases** tab in your **Target**, click the **+** button on the top left and then select **New Run Script Phase**. Then setup the build phase as follows. Make sure this phase is below the `Embed Frameworks` phase.

        Shell /bin/sh
        
        bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/AWSCore.framework/strip-frameworks.sh"
        
        Show environment variables in build log: Checked
        Run script only when installing: Not checked
        
        Input Files: Empty
        Output Files: Empty

###Frameworks

1. Download the SDK from our [AWS Mobile SDK](http://aws.amazon.com/mobile/sdk) page. The SDK is stored in a compressed file archive named `aws-ios-sdk-#.#.#` (where `#.#.#` represents the version number, so for version 2.4.0, the filename is `aws-ios-sdk-2.4.0`).

1. With your project open in Xcode, select your **Target**. Under **General** tab, find **Embedded Binaries** and then click the **+** button.

1. Click the **Add Other...** button, navigate to the `AWS<#ServiceName#>.framework` files and select them. Check the **Destination: Copy items if needed** checkbox when prompted.

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

1. Under the **Buid Phases** tab in your **Target**, click the **+** button on the top left and then select **New Run Script Phase**. Then setup the build phase as follows. Make sure this phase is below the `Embed Frameworks` phase.

        Shell /bin/sh
        
        bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/AWSCore.framework/strip-frameworks.sh"
        
        Show environment variables in build log: Checked
        Run script only when installing: Not checked
        
        Input Files: Empty
        Output Files: Empty

##Update the SDK to a Newer Version

When we release a new version of the SDK, you can pick up the changes as described below.

###CocoaPods

1. Run the following command in your project directory. CocoaPods automatically picks up the new changes.

        $ pod update

    **Note**: If your pod is having an issue, you can delete `Podfile.lock` and `Pods/` then run `pod install` to cleanly install the SDK.
    
    ![image](readme-images/cocoapods-setup-03.png?raw=true)

###Carthage

1. Run the following command in your project directory. Carthage automatically picks up the new changes.

        $ carthage update

###Frameworks

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

1. Follow the installation process above to include the new version of the SDK.

##Preparing your apps for iOS 9
The release of iOS 9 includes changes that might impact how your apps interact with some AWS services. If you compile your apps with Apple’s iOS 9 SDK (or Xcode 7), Apple’s [App Transport Security (ATS)](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html) feature may affect the ability of apps to connect to certain AWS service endpoints. In order to ensure affected apps continue to successfully connect to AWS endpoints, you’ll need to configure them to interact properly with Apple’s ATS by adding these properties to your `Info.plist` file:

	    <key>NSAppTransportSecurity</key>
	    <dict>
    	        <key>NSExceptionDomains</key>
    	        <dict>
        	    <key>amazonaws.com</key>
        	    <dict>
                        <key>NSThirdPartyExceptionMinimumTLSVersion</key>
                        <string>TLSv1.0</string>
                        <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
                        <false/>
                        <key>NSIncludesSubdomains</key>
                        <true/>
        	    </dict>
        	    <key>amazonaws.com.cn</key>
        	    <dict>
                        <key>NSThirdPartyExceptionMinimumTLSVersion</key>
                        <string>TLSv1.0</string>
                        <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
                        <false/>
                        <key>NSIncludesSubdomains</key>
                        <true/>
        	    </dict>
    	        </dict>
	    </dict>

For more information, see [Preparing Your Apps for iOS 9](http://docs.aws.amazon.com/mobile/sdkforios/developerguide/ats.html).

##Getting Started with Swift

1. Import the AWSCore header in the application delegate.

        import AWSCore

1. Create a default service configuration by adding the following code snippet in the `application:didFinishLaunchingWithOptions:` application delegate method.

        let credentialsProvider = AWSCognitoCredentialsProvider(
            regionType: CognitoRegionType,
            identityPoolId: CognitoIdentityPoolId)
        let configuration = AWSServiceConfiguration(
            region: DefaultServiceRegionType,
            credentialsProvider: credentialsProvider)
        AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

1. In Swift file you want to use the SDK, import the appropriate headers for the services you are using. The header file import convention is `import AWSServiceName`, as in the following examples:

        import AWSS3
        import AWSDynamoDB
        import AWSSQS
        import AWSSNS
        import AWSCognito
        
1. Make a call to the AWS services.

        let dynamoDB = AWSDynamoDB.defaultDynamoDB()
        let listTableInput = AWSDynamoDBListTablesInput()
        dynamoDB.listTables(listTableInput).continueWithBlock{ (task: AWSTask!) -> AnyObject? in
            if let error = task.error {
                print("Error occurred: \(error)")
                return nil
            }

            let listTablesOutput = task.result as AWSDynamoDBListTablesOutput

            for tableName in listTablesOutput.tableNames {
                print("\(tableName)")
            }

            return nil
        }
        
    **Note**: Most of the service client classes have a singleton method to get a default client. The naming convention is `+ defaultSERVICENAME` (e.g. `+ defaultDynamoDB` in the above code snippet). This singleton method creates a service client with `defaultServiceConfiguration`, which you set up in step 5, and maintains a strong reference to the client.

##Getting Started with Objective-C

1. Import the AWSCore header in the application delegate.

        @import AWSCore;

1. Create a default service configuration by adding the following code snippet in the `application:didFinishLaunchingWithOptions:` application delegate method.

        AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:CognitoRegionType
                                                                                                        identityPoolId:CognitoIdentityPoolId];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:DefaultServiceRegionType
                                                                             credentialsProvider:credentialsProvider];
        AWSServiceManager.defaultServiceManager.defaultServiceConfiguration = configuration;

1. Import the appropriate headers for the services you are using. The header file import convention is `@import AWSServiceName;`, as in the following examples:

        @import AWSS3;
        @import AWSDynamoDB;
        @import AWSSQS;
        @import AWSSNS;
        @import AWSCognito;

1. Make a call to the AWS services.

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

    **Note**: Most of the service client classes have a singleton method to get a default client. The naming convention is `+ defaultSERVICENAME` (e.g. `+ defaultS3TransferManager` in the above code snippet). This singleton method creates a service client with `defaultServiceConfiguration`, which you set up in step 5, and maintains a strong reference to the client.

##AWSTask

With native AWSTask support in the SDK for iOS, you can chain async requests instead of nesting them. It makes the logic cleaner, while keeping the code more readable. Read [Working with AWSTask](http://docs.aws.amazon.com/mobile/sdkforios/developerguide/awstask.html) to learn how to use AWSTask.

##Logging

Changing log levels during development may make debugging easier. You can change the log level by importing AWSCore.h and calling:

**Swift**

    AWSLogger.defaultLogger().logLevel = .Verbose

The following logging level options are available:

* `.None`
* `.Error`
* `.Warn`
* `.Info`
* `.Debug` (This is the default.)
* `.Verbose`

**Objective-C**

    [AWSLogger defaultLogger].logLevel = AWSLogLevelVerbose;

The following logging level options are available:

* `AWSLogLevelNone`
* `AWSLogLevelError`
* `AWSLogLevelWarn`
* `AWSLogLevelInfo`
* `AWSLogLevelDebug` (This is the default.)
* `AWSLogLevelVerbose`

##Sample Apps

The AWS SDK for iOS includes sample apps that demonstrate common use cases.

###Cognito Sync Sample ([Swift](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/CognitoSync-Sample/Swift/), [Objective-C](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/CognitoSync-Sample/Objective-C/))

This sample demonstrates how to securely manage and sync your mobile app data and create unique identities via login providers including Facebook, Google, and Login with Amazon.

####AWS Services Demonstrated:

* [Amazon Cognito Sync](http://aws.amazon.com/cognito/)
* [Amazon Cognito Identity](http://aws.amazon.com/cognito/)

###DynamoDB Object Mapper Sample ([Swift](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/DynamoDBObjectMapper-Sample/Swift/), [Objective-C](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/DynamoDBObjectMapper-Sample/Objective-C/))

This sample demonstrates how to insert / update / delete / query items using DynamoDB Object Mapper.

####AWS Services Demonstrated:

* [Amazon DynamoDB](http://aws.amazon.com/dynamodb/)
* [Amazon Cognito Identity](http://aws.amazon.com/cognito/)

###S3 Transfer Manager Sample ([Swift](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/S3TransferManager-Sample/Swift/), [Objective-C](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/S3TransferManager-Sample/Objective-C/))

This sample demonstrates how to upload / download multiple files simultaneously using S3 Transfer Manager. It also shows how to pause, resume, and cancel file upload / download.

####AWS Services Demonstrated:

* [Amazon S3](http://aws.amazon.com/s3/)
* [Amazon Cognito Identity](http://aws.amazon.com/cognito/)

###S3 Background Transfer Sample ([Swift](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/S3BackgroundTransfer-Sample/Swift/), [Objective-C](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/S3BackgroundTransfer-Sample/Objective-C/))

This sample demonstrates how to use the Amazon S3 PreSigned URL Builder to download / upload files in background.

####AWS Services Demonstrated:

* [Amazon S3](http://aws.amazon.com/s3/)
* [Amazon Cognito Identity](http://aws.amazon.com/cognito/)


###SNS Mobile Push and Mobile Analytics Sample ([Swift](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/SNS-MobileAnalytics-Sample/Swift/), [Objective-C](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/SNS-MobileAnalytics-Sample/Objective-C/))

This sample demonstrates how to set up Amazon SNS Mobile Push and record events using Amazon Mobile Analytics.

####AWS Services Demonstrated:

* [Amazon SNS Mobile Push](http://aws.amazon.com/sns/)
* [Amazon Mobile Analytics](http://aws.amazon.com/mobileanalytics/)
* [Amazon Cognito Identity](http://aws.amazon.com/cognito/)

###IoT Sample ([Swift](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/IoT-Sample/Swift/))

This sample demonstrates how to publish and subscribe to data using AWS IoT.

####AWS Services Demonstrated:

* [Amazon AWS IoT](http://aws.amazon.com/iot/)
* [Amazon Cognito Identity](http://aws.amazon.com/cognito/)

###IoT Temperature Control Sample ([Swift](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/IoTTemperatureControl-Sample/Swift/))

This sample demonstrates accessing device shadows using Cognito authentication; it works in conjunction with the Temperature Control Example Program in the [AWS IoT JavaScript SDK for Embedded Devices](https://github.com/aws/aws-iot-device-sdk-js).

####AWS Services Demonstrated:

* [Amazon AWS IoT](http://aws.amazon.com/iot/)
* [Amazon Cognito Identity](http://aws.amazon.com/cognito/)

##Install the Reference Documentation in Xcode

The AWS Mobile SDK for iOS zip file includes documentation in the DocSets format that you can view within Xcode. The easiest way to install the documentation is to use the Mac OS X terminal.

1. Open the Mac OS X terminal and go to the directory containing the expanded archive. For example:

        $ cd ~/Downloads/aws-ios-sdk-2.4.0

    **Note**: Remember to replace 2.4.0 in the example above with the actual version number of the AWS SDK for iOS that you downloaded.

1. Create a directory called `~/Library/Developer/Shared/Documentation/DocSets`:

        $ mkdir -p ~/Library/Developer/Shared/Documentation/DocSets

1. Copy (or move) `Documentation/com.amazon.aws.ios.docset` from the SDK installation files to the directory you created in the previous step:

        $ mv Documentation/com.amazon.aws.ios.docset ~/Library/Developer/Shared/Documentation/DocSets/

1. If Xcode was running during this procedure, restart Xcode. To browse the documentation, go to **Help**, click **Documentation and API Reference**, and select **AWS Mobile SDK for iOS v2.4.0 Documentation** (where '2.4.0' is the appropriate version number).

##Talk to Us

Visit our GitHub [Issues](https://github.com/aws/aws-sdk-ios/issues) to leave feedback and to connect with other users of the SDK.

##Author

Amazon Web Services

##License

See the **LICENSE** file for more info.
