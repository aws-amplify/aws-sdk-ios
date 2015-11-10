#Version 2 of the AWS SDK for iOS

##Setting Up

To get started with the AWS SDK for iOS, you can set up the SDK and start building a new project, or you can integrate the SDK in an existing project. You can also run the samples to get a sense of how the SDK works.

The AWS Mobile SDK for iOS supports the following versions of software:

* Xcode 7 and later
* iOS 7 and later

You can check out the [SDK source code](https://github.com/aws/aws-sdk-ios).

##Include the SDK for iOS in an Existing Application

The [sample apps](https://github.com/awslabs/aws-sdk-ios-samples) are standalone projects that are already set up for you. You can also integrate the SDK for iOS with an existing application. If you have an existing app in which you'd like to use AWS, there are two ways to import the AWS Mobile SDK for iOS into your project:

###CocoaPods

1. The AWS Mobile SDK for iOS is available through [CocoaPods](http://cocoapods.org). If you have not installed CocoaPods, install CocoaPods by running the command:

		$ sudo gem install cocoapods
		$ pod setup

1. In your project directory (the directory where your `*.xcodeproj` file is), create a plain text file named **Podfile** (without any file extension) and add the following lines.

        source 'https://github.com/CocoaPods/Specs.git'
        
        pod 'AWSCore'
        pod 'AWSAutoScaling'
        pod 'AWSCloudWatch'
        pod 'AWSDynamoDB'
        pod 'AWSEC2'
        pod 'AWSElasticLoadBalancing'
        pod 'AWSKinesis'
        pod 'AWSLambda'
        pod 'AWSMachineLearning'
        pod 'AWSMobileAnalytics'
        pod 'AWSS3'
        pod 'AWSSES'
        pod 'AWSSimpleDB'
        pod 'AWSSNS'
        pod 'AWSSQS'
        pod 'AWSCognito'
        
    ![image](readme-images/cocoapods-setup-01.png?raw=true)
        
1. Then run the following command:
	
		$ pod install

1. Open up `*.xcworkspace` with Xcode and start using the SDK.

    ![image](readme-images/cocoapods-setup-02.png?raw=true)

    **Note**: Do **NOT** use `*.xcodeproj`. If you open up a project file instead of a workspace, you receive an error:

        ld: library not found for -lPods-AWSiOSSDKv2
        clang: error: linker command failed with exit code 1 (use -v to see invocation)

###Frameworks

1. Download the SDK from our [AWS Mobile SDK](http://aws.amazon.com/mobile/sdk) page. The SDK is stored in a compressed file archive named `aws-ios-sdk-#.#.#` (where `#.#.#` represents the version number, so for version 2.0.0, the filename is `aws-ios-sdk-2.0.0`).

    **Note**: The size of **AWSiOSSDKv2.framework** is > 65MB; however, it does not add > 65MB to your app binary when imported to your project because:
    
    * **Only objects that you use in your app are included in your app binary from the framework**
    
        **AWSiOSSDKv2.framework** contains a static library, and object code in the library is incorporated in your app binary file at build time. When the `-ObjC` and `-all_load` linker flags are **NOT** used, Xcode is smart enough to figure out what objects from the framework are necessary for your app and include just those objects. **AWSiOSSDKv2.framework** is packaged so that you do not need to include these linker flags. (If you are using a third-party framework that requires you to include the `-ObjC` or `-all_load` linker flags, you can use `-force_load` instead to include those frameworks.)

        For example, if you only use Amazon DynamoDB in your app and none of the other supported services, your app won't include object code for those other services. Unless you use every single object from the framework, only a portion of the code from the framework will be included in your app.
    
    * **The framework contains five architectures, while apps on a device need at most three**
    
        We currently compile the AWS Mobile SDK for iOS for five architectures: `armv7`, `armv7s`, `arm64`, `i386`, and `x86_64`. If you want to optimize your app for 64-bit devices including iPhone 6 and iPhone 5S, you need to build your app with `arm64` support. 32-bit iOS devices that the AWS SDK for iOS supports use the `armv7` and `armv7s` architectures.

        The 64-bit iPhone simulators use `x86_64`, and 32-bit simulators use `i386` because they run on the Mac. We support these architectures so that the developers can run their apps with our framework on the simulator for testing. `x86_64` and `i386` support is essential for testing, but the code is unnecessary for apps on the App Store. Even if you use every single object from the AWS Mobile SDK, the app that you submit to Apple never includes about two fifths of the code included in the framework.
    
    * **Apps on the App Store are compressed**
    
        After you submit your app to Apple, it is encrypted for DRM purposes and re-compressed. This leads to an even smaller footprint.

1. With your project open in Xcode, Control+click **Frameworks** and then click **Add files to "\<project name\>"...**.

1. In Finder, navigate to the `AWS<#ServiceName#>.framework` files and select them.

    * `AWSCore.framework`
    * `AWSAutoScaling.framework`
    * `AWSCloudWatch.framework`
    * `AWSDynamoDB.framework`
    * `AWSEC2.framework`
    * `AWSElasticLoadBalancing.framework`
    * `AWSKinesis.framework`
    * `AWSLambda.framework`
    * `AWSMachineLearning.framework`
    * `AWSMobileAnalytics.framework`
    * `AWSS3.framework`
    * `AWSSES.framework`
    * `AWSSimpleDB.framework`
    * `AWSSNS.framework`
    * `AWSSQS.framework`
    * `extras/AWSCognito.framework` - for [Amazon Cognito Sync](http://aws.amazon.com/cognito/)

1. Open a target for your project, select **Build Phases**, expand **Link Binary With Libraries**, click the **+** button, and add `libsqlite3.dylib`, `libz.dylib`, and `SystemConfiguration.framework`.

##Update the SDK to a Newer Version

When we release a new version of the SDK, you can pick up the changes as described below.

###CocoaPods

1. Run the following command in your project directory. CocoaPods automatically picks up the new changes.

        $ pod update

    **Note**: If your pod is having an issue, you can delete `Podfile.lock` and `Pods/` then run `pod install` to cleanly install the SDK.
    
    ![image](readme-images/cocoapods-setup-03.png?raw=true)

###Frameworks

1. In Xcode select the following frameworks and hit **delete** on your keyboard. Then select **Move to Trash**:

    * `AWSCore.framework`
    * `AWSAutoScaling.framework`
    * `AWSCloudWatch.framework`
    * `AWSDynamoDB.framework`
    * `AWSEC2.framework`
    * `AWSElasticLoadBalancing.framework`
    * `AWSKinesis.framework`
    * `AWSLambda.framework`
    * `AWSMachineLearning.framework`
    * `AWSMobileAnalytics.framework`
    * `AWSS3.framework`
    * `AWSSES.framework`
    * `AWSSimpleDB.framework`
    * `AWSSNS.framework`
    * `AWSSQS.framework`
    * `AWSCognito.framework`

1. Follow the installation process above to include the new version of the SDK.

##Preparing your apps for iOS 9
The release of iOS 9 includes changes that might impact how your apps interact with some AWS services. If you compile your apps with Apple’s iOS 9 SDK (or Xcode 7), Apple’s [App Transport Security (ATS)](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html) feature may affect the ability of apps to connect to certain AWS service endpoints. In order to ensure affected apps continue to successfully connect to AWS endpoints, you’ll need to configure them to interact properly with Apple’s ATS by adding these properties to your `info.plist` file:

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

For detailed steps on how to do identify and resolve this issue if your app is affected, follow the instructions on [AWS Developer Guide](http://docs.aws.amazon.com/mobile/sdkforios/developerguide/ats.html).

##Getting Started with Swift

1. Create an Objective-C bridging header file using Xcode.

1. In the bridging header, import the appropriate headers for the services you are using. The header file import convention is `#import <AWSServiceName/AWSServiceName.h>`, as in the following examples:

        #import <AWSCore/AWSCore.h>
        #import <AWSS3/AWSS3.h>
        #import <AWSDynamoDB/AWSDynamoDB.h>
        #import <AWSSQS/AWSSQS.h>
        #import <AWSSNS/AWSSNS.h>
        #import <AWSCognito/AWSCognito.h>

    ![image](readme-images/objc-bridging-header-01.png?raw=true)

1. From **Your Target** > **Build Settings** > **Objective-C Bridging Header**, point **Objective-C Bridging Header** to the bridging header you just created.

    ![image](readme-images/objc-bridging-header-02.png?raw=true)

1. Create a default service configuration by adding the following code snippet in the `application:didFinishLaunchingWithOptions:` application delegate method.

        let credentialsProvider = AWSCognitoCredentialsProvider(
            regionType: CognitoRegionType,
            identityPoolId: CognitoIdentityPoolId)
        let configuration = AWSServiceConfiguration(
            region: DefaultServiceRegionType,
            credentialsProvider: credentialsProvider)
        AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

1. Make a call to the AWS services.

        let dynamoDB = AWSDynamoDB.defaultDynamoDB()
        let listTableInput = AWSDynamoDBListTablesInput()
        dynamoDB.listTables(listTableInput).continueWithBlock{ (task: AWSTask!) -> AnyObject! in
            if let error = task.error {
                print("Error occurred: \(error)")
                return nil
            }

            let listTablesOutput = task.result as AWSDynamoDBListTablesOutput

            for tableName : AnyObject in listTablesOutput.tableNames {
                print("\(tableName)")
            }

            return nil
        }
        
    **Note**: Most of the service client classes have a singleton method to get a default client. The naming convention is `+ defaultSERVICENAME` (e.g. `+ defaultDynamoDB` in the above code snippet). This singleton method creates a service client with `defaultServiceConfiguration`, which you set up in step 5, and maintains a strong reference to the client.

##Getting Started with Objective-C

1. Import the AWSCore header in the application delegate.

        #import <AWSCore/AWSCore.h>

1. Create a default service configuration by adding the following code snippet in the `application:didFinishLaunchingWithOptions:` application delegate method.

        AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:CognitoRegionType
                                                                                                        identityPoolId:CognitoIdentityPoolId];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:DefaultServiceRegionType
                                                                             credentialsProvider:credentialsProvider];
        AWSServiceManager.defaultServiceManager.defaultServiceConfiguration = configuration;

1. Import the appropriate headers for the services you are using. The header file import convention is `#import <AWSServiceName/AWSServiceName.h>`, as in the following examples:

        #import <AWSCore/AWSCore.h>
        #import <AWSS3/AWSS3.h>
        #import <AWSDynamoDB/AWSDynamoDB.h>
        #import <AWSSQS/AWSSQS.h>
        #import <AWSSNS/AWSSNS.h>
        #import <AWSCognito/AWSCognito.h>

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

With native AWSTask support in the SDK for iOS, you can chain async requests instead of nesting them. It makes the logic cleaner, while keeping the code more readable. Read this [blog post](http://mobile.awsblog.com/post/Tx2B17V9NSVLP3I/The-AWS-Mobile-SDK-for-iOS-How-to-use-BFTask) to learn how to use AWSTask.

##Logging

Changing log levels during development may make debugging easier. You can change the log level by importing AWSCore.h and calling:

**Swift**

    AWSLogger.defaultLogger().logLevel = .Verbose

The following logging level options are available:

* `.None`
* `.Error` (This is the default. Only error logs are printed to the console.)
* `.Warn`
* `.Info`
* `.Debug`
* `.Verbose`

**Objective-C**

    [AWSLogger defaultLogger].logLevel = AWSLogLevelVerbose;

The following logging level options are available:

* `AWSLogLevelNone`
* `AWSLogLevelError` (This is the default. Only error logs are printed to the console.)
* `AWSLogLevelWarn`
* `AWSLogLevelInfo`
* `AWSLogLevelDebug`
* `AWSLogLevelVerbose`

##Sample Apps

The AWS SDK for iOS includes sample apps that demonstrate common use cases.

###Cognito Sync Sample ([Objective-C](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/CognitoSync-Sample/Objective-C/))

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

##Install the Reference Documentation in Xcode

The AWS Mobile SDK for iOS zip file includes documentation in the DocSets format that you can view within Xcode. The easiest way to install the documentation is to use the Mac OS X terminal.

1. Open the Mac OS X terminal and go to the directory containing the expanded archive. For example:

        $ cd ~/Downloads/aws-ios-sdk-2.0.0

    **Note**: Remember to replace 2.0.0 in the example above with the actual version number of the AWS SDK for iOS that you downloaded.

1. Create a directory called `~/Library/Developer/Shared/Documentation/DocSets`:

        $ mkdir -p ~/Library/Developer/Shared/Documentation/DocSets

1. Copy (or move) `Documentation/com.amazon.aws.ios.docset` from the SDK installation files to the directory you created in the previous step:

        $ mv Documentation/com.amazon.aws.ios.docset ~/Library/Developer/Shared/Documentation/DocSets/

1. If Xcode was running during this procedure, restart Xcode. To browse the documentation, go to **Help**, click **Documentation and API Reference**, and select **AWS SDK for iOS v2.0 Documentation** (where '2.0' is the appropriate version number).

##Talk to Us

Visit our GitHub [Issues](https://github.com/aws/aws-sdk-ios/issues) to leave feedback and to connect with other users of the SDK.

##Author

Amazon Web Services

##License

The AWS Mobile SDK for iOS is available under the Apache License. See the **LICENSE** file for more info.
