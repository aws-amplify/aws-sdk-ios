#Version 2 of the AWS SDK for iOS

[![Version](http://cocoapod-badges.herokuapp.com/v/AWSiOSSDKv2/badge.png)](http://cocoadocs.org/docsets/AWSiOSSDKv2)
[![Platform](http://cocoapod-badges.herokuapp.com/p/AWSiOSSDKv2/badge.png)](http://cocoadocs.org/docsets/AWSiOSSDKv2)

**Version 2 of the AWS Mobile SDK for iOS has reached General Availability (GA) and is no longer in Developer Preview. Version 1 is deprecated as of September 29, 2014, and will continue to be available until December 31, 2014, in our [aws-sdk-ios-v1](https://github.com/aws/aws-sdk-ios-v1) repository. If you are building new apps, we recommend you use Version 2.**

##Highlights

* **Amazon Cognito** – A simple user identity and synchronization service that helps you securely manage and synchronize app data for your users across their mobile devices. With Amazon Cognito, you can save any kind of data, such as app preferences or game state, in the AWS cloud without writing any backend code or managing any infrastructure.
* **Amazon Mobile Analytics** – A service for collecting, visualizing, and understanding app usage data at scale. Amazon Mobile Analytics reports are typically updated within 60 minutes of data being received. Amazon Mobile Analytics is built to scale with the business and can collect and process billions of events from millions of endpoints.
* **Amazon Kinesis Recorder** – Enables you to reliably record data to an Amazon Kinesis data stream from your mobile app. Kinesis Recorder batches requests to handle intermittent network connections, and it enables you to record events even when the device is offline.
* **Amazon DynamoDB Object Mapper** - We have made it easier to use DynamoDB from the AWS SDK for iOS by providing the DynamoDB Object Mapper for iOS. The DynamoDB Object Mapper makes it easy to set up connections to a DynamoDB database and supports high-level operations like creating, getting, querying, updating, and deleting records.
* **Amazon S3 Transfer Manager** - We have rebuilt the S3TransferManager to utilize BFTask in the AWS SDK for iOS. It has a clean interface, and all of the operations are now asynchronous.
* **ARC support** - The AWS SDK for iOS is now ARC enabled from the ground up to improve overall memory management.
* **BFTask support** - With native BFTask support in the AWS SDK for iOS, you can chain async requests instead of nesting them. This makes the logic cleaner while keeping the code more readable.
* **Conforming Objective-C recommendations** - The AWS SDK for iOS conforms to Objective-C best practices. The SDK returns NSErrors instead of throwing exceptions. iOS developers will now feel at home when using the AWS Mobile SDK.
* **Official CocoaPods support** - Including the AWS SDK for iOS in your project is now easier than ever. You just need to add `pod 'AWSiOSSDKv2'` and `pod 'AWSCognitoSync'` to your Podfile.

##Setting Up

To get started with the AWS SDK for iOS, you can set up the SDK and start building a new project, or you can integrate the SDK in an existing project. You can also run the samples to get a sense of how the SDK works.

The AWS Mobile SDK for iOS supports the following versions of software:

* Xcode 5 and later
* iOS 7 and later

You can check out the [SDK source code](https://github.com/aws/aws-sdk-ios).

##Include the SDK for iOS in an Existing Application

The [sample apps](https://github.com/awslabs/aws-sdk-ios-samples) are standalone projects that are already set up for you. You can also integrate the SDK for iOS with an existing application. If you have an existing app in which you'd like to use AWS, there are two ways to import the AWS Mobile SDK for iOS into your project:

###CocoaPods

1. The AWS Mobile SDK for iOS is available through [CocoaPods](http://cocoapods.org). If you have not installed CocoaPods, install CocoaPods by running the command:

		$ sudo gem install cocoapods

1. In your project directory (the directory where your `*.xcodeproj` file is), create a plain text file named **Podfile** (without any file extension) and add the following lines. If you want to use [Amazon Cognito Sync](http://aws.amazon.com/cognito/), make sure to include `pod 'AWSCognitoSync'` as well.

        source 'https://github.com/CocoaPods/Specs.git'
        
        pod 'AWSiOSSDKv2'
        pod 'AWSCognitoSync'
        
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

1. In Finder, navigate to the `AWSiOSSDKv2.framework` file and select it. Click **Add**. If you want to use [Amazon Cognito Sync](http://aws.amazon.com/cognito/), you also need to add the `AWSCognitoSync.framework`, which is in the **extras** directory.

1. Following the same procedure, add the following frameworks, located in the **third-party** directory, into your project.

    * `Bolts.framework` (If your application uses the Facebook SDK, you may not need this framework, as it's already included with the Facebook SDK.)
    * `GZIP.framework`
    * `Mantle.framework`
    * `Reachability.framework`
    * `TMCache.framework`
    * `UICKeyChainStore.framework`
    * `XMLDictionary.framework`

1. Drag and drop the following JSON files, located in the **service-definitions** directory, into your project.

    * `autoscaling-2011-01-01.json`
    * `cib-2014-06-30.json`
    * `css-2014-06-30.json`
    * `dynamodb-2012-08-10.json`
    * `ec2-2014-06-15.json`
    * `elasticloadbalancing-2012-06-01.json`
    * `email-2010-12-01.json`
    * `kinesis-2013-12-02.json`
    * `mobileanalytics-2014-06-30.json`
    * `monitoring-2010-08-01.json`
    * `s3-2006-03-01.json`
    * `sdb-2009-04-15.json`
    * `sns-2010-03-31.json`
    * `sqs-2012-11-05.json`
    * `sts-2011-06-15.json`

1. Open a target for your project, select **Build Phases**, expand **Link Binary With Libraries**, click the **+** button, and add `libsqlite3.dylib` and `libz.dylib`.

##Update the SDK to a Newer Version

When we release a new version of the SDK, you can pick up the changes as described below.

###CocoaPods

1. Run the following command in your project directory. CocoaPods automatically picks up the new changes.

        $ pod update

    **Note**: If your pod is having an issue, you can delete `Podfile.lock` and `Pods/` then run `pod install` to cleanly install the SDK.
    
    ![image](readme-images/cocoapods-setup-03.png?raw=true)

###Frameworks

1. In Xcode select the following frameworks and hit **delete** on your keyboard. Then select **Move to Trash**:

    * `AWSiOSSDKv2.framework`
    * `AWSCognitoSync.framework`
    * `Bolts.framework`
    * `GZIP.framework`
    * `Mantle.framework`
    * `Reachability.framework`
    * `TMCache.framework`
    * `UICKeyChainStore.framework`
    * `XMLDictionary.framework`

1. Also, delete the JSON files:

    * `autoscaling-2011-01-01.json`
    * `cib-2014-06-30.json`
    * `css-2014-06-30.json`
    * `dynamodb-2012-08-10.json`
    * `ec2-2014-06-15.json`
    * `elasticloadbalancing-2012-06-01.json`
    * `email-2010-12-01.json`
    * `kinesis-2013-12-02.json`
    * `mobileanalytics-2014-06-30.json`
    * `monitoring-2010-08-01.json`
    * `s3-2006-03-01.json`
    * `sdb-2009-04-15.json`
    * `sns-2010-03-31.json`
    * `sqs-2012-11-05.json`
    * `sts-2011-06-15.json`

1. Follow the installation process above to include the new version of the SDK.

##Getting Started with Swift

1. Create an Objective-C bridging header file using Xcode.

1. In the bridging header, import the appropriate headers for the services you are using. The header file import convention for CocoaPods is `#import "SERVICENAME.h"`, and for frameworks it is `#import <FRAMEWORKNAME/SERVICENAME.h>`, as in the following examples:

    **CocoaPods**
    
        #import "AWSCore.h"
        #import "S3.h"
        #import "DynamoDB.h"
        #import "SQS.h"
        #import "SNS.h"

    **Frameworks**
    
        #import <AWSiOSSDKv2/AWSCore.h>
        #import <AWSiOSSDKv2/S3.h>
        #import <AWSiOSSDKv2/DynamoDB.h>
        #import <AWSiOSSDKv2/SQS.h>
        #import <AWSiOSSDKv2/SNS.h>

    ![image](readme-images/objc-bridging-header-01.png?raw=true)

1. From **Your Target** > **Build Settings** > **Objective-C Bridging Header**, point **Objective-C Bridging Header** to the bridging header you just created.

    ![image](readme-images/objc-bridging-header-02.png?raw=true)


1. Import the AWSCore header in the application delegate.

    **CocoaPods**
    
        #import "AWSCore.h"

    **Frameworks**
    
        #import <AWSiOSSDKv2/AWSCore.h>

1. Create a default service configuration by adding the following code snippet in the `@optional func application(_ application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool` application delegate method.

        let credentialsProvider = AWSCognitoCredentialsProvider.credentialsWithRegionType(
            AWSRegionType.USEast1,
            accountId: cognitoAccountId,
            identityPoolId: cognitoIdentityPoolId,
            unauthRoleArn: cognitoUnauthRoleArn,
            authRoleArn: cognitoAuthRoleArn)
        let defaultServiceConfiguration = AWSServiceConfiguration(
            region: AWSRegionType.USEast1,
            credentialsProvider: credentialsProvider)
        AWSServiceManager.defaultServiceManager().setDefaultServiceConfiguration(defaultServiceConfiguration)

1. Make a call to the AWS services.

        let dynamoDB = AWSDynamoDB.defaultDynamoDB()
        let listTableInput = AWSDynamoDBListTablesInput()
        dynamoDB.listTables(listTableInput).continueWithBlock{ (task: BFTask!) -> AnyObject! in
            let listTablesOutput = task.result as AWSDynamoDBListTablesOutput

            for tableName : AnyObject in listTablesOutput.tableNames {
                println("\(tableName)")
            }

            return nil
        }
        
    **Note**: Most of the service client classes have a singleton method to get a default client. The naming convention is `+ defaultSERVICENAME` (e.g. `+ defaultDynamoDB` in the above code snippet). This singleton method creates a service client with `defaultServiceConfiguration`, which you set up in step 5, and maintains a strong reference to the client.

##Getting Started with Objective-C

1. Import the AWSCore header in the application delegate.

    **CocoaPods**
    
        #import "AWSCore.h"

    **Frameworks**
    
        #import <AWSiOSSDKv2/AWSCore.h>

1. Create a default service configuration by adding the following code snippet in the `- application:didFinishLaunchingWithOptions:` application delegate method.

        AWSCognitoCredentialsProvider *credentialsProvider = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                                            accountId:AWSAccountID
                                                                                                       identityPoolId:CognitoPoolID
                                                                                                        unauthRoleArn:CognitoRoleUnauth
                                                                                                          authRoleArn:nil];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSEast1
                                                                              credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

1. Import service headers where you want to use the services. The header file import convention for CocoaPods is `#import "SERVICENAME.h"`, and for frameworks it is `#import <FRAMEWORKNAME/SERVICENAME.h>`, as in the following examples:

    **CocoaPods**
    
        #import "S3.h"
        #import "DynamoDB.h"
        #import "SQS.h"
        #import "SNS.h"

    **Frameworks**
    
        #import <AWSiOSSDKv2/S3.h>
        #import <AWSiOSSDKv2/DynamoDB.h>
        #import <AWSiOSSDKv2/SQS.h>
        #import <AWSiOSSDKv2/SNS.h>

1. Make a call to the AWS services.

		AWSS3Transfermanager *transferManager = [AWSS3Transfermanager defaultS3TransferManager];
		AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
	    uploadRequest.bucket = yourBucket;
	    uploadRequest.key = yourKey;
	    uploadRequest.body = yourDataURL;
	    uploadRequest.contentLength = [NSNumber numberWithUnsignedLongLong:fileSize];
	
	    [[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
	    	// Do something with the response
	        return nil;
	    }];

    **Note**: Most of the service client classes have a singleton method to get a default client. The naming convention is `+ defaultSERVICENAME` (e.g. `+ defaultS3TransferManager` in the above code snippet). This singleton method creates a service client with `defaultServiceConfiguration`, which you set up in step 5, and maintains a strong reference to the client.

##BFTask

With native BFTask support in the SDK for iOS, you can chain async requests instead of nesting them. It makes the logic cleaner, while keeping the code more readable. Read this [blog post](http://mobile.awsblog.com/post/Tx2B17V9NSVLP3I/The-AWS-Mobile-SDK-for-iOS-How-to-use-BFTask) to learn how to use BFTask.

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

**AWS Services Demonstrated**:

* [Amazon Cognito Sync](http://aws.amazon.com/cognito/)
* [Amazon Cognito Identity](http://aws.amazon.com/cognito/)

###DynamoDB Object Mapper Sample ([Objective-C](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/DynamoDBObjectMapper-Sample/Objective-C/))

This sample demonstrates how to insert / update / delete / query items using DynamoDB Object Mapper.

**AWS Services Demonstrated**:

* [Amazon DynamoDB](http://aws.amazon.com/dynamodb/)
* [Amazon Cognito Identity](http://aws.amazon.com/cognito/)

###S3 Transfer Manager Sample ([Objective-C](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/S3TransferManager-Sample/Objective-C/))

This sample demonstrates how to upload / download multiple files simultaneously using S3 Transfer Manager. It also shows how to pause, resume, and cancel file upload / download.

**AWS Services Demonstrated**:

* [Amazon S3](http://aws.amazon.com/s3/)
* [Amazon Cognito Identity](http://aws.amazon.com/cognito/)

###SNS Mobile Push and Mobile Analytics Sample ([Swift](https://github.com/awslabs/aws-sdk-ios-samples/tree/master/SNS-MobileAnalytics-Sample/Swift/))

This sample demonstrates how to set up Amazon SNS Mobile Push and record events using Amazon Mobile Analytics.

**AWS Services Demonstrated**:

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
