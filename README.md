# Version 2 of the AWS SDK for iOS

[![Version](http://cocoapod-badges.herokuapp.com/v/AWSiOSSDKv2/badge.png)](http://cocoadocs.org/docsets/AWSiOSSDKv2)
[![Platform](http://cocoapod-badges.herokuapp.com/p/AWSiOSSDKv2/badge.png)](http://cocoadocs.org/docsets/AWSiOSSDKv2)

**Version 2 of the AWS Mobile SDK for iOS has reached General Availability (GA) and is no longer in Developer Preview.  Version 1 is deprecated as of September 29, 2014 and will continue to be available until December 31, 2014 in our [aws-sdk-ios-v1](https://github.com/aws/aws-sdk-ios-v1) repository. If you are building new apps, we recommend you use Version 2.**

## Highlights

* **Amazon Cognito** – is a simple user identity and synchronization service that helps you securely manage and synchronize app data for your users across their mobile devices. With Amazon Cognito, you can save any kind of data, such as app preferences or game state, in the AWS Cloud without writing any backend code or managing any infrastructure.
* **Amazon Mobile Analytics** – is a service for collecting, visualizing and understanding app usage data at scale. Amazon Mobile Analytics reports are typically updated within 60 minutes from when data are received. Amazon Mobile Analytics is built to scale with the business and can collect and process billions of events from millions of endpoints.
* **Amazon Kinesis Recorder** – enables you to reliably record data to an Amazon Kinesis data stream from your mobile app. Kinesis Recorder batches requests to handle intermittent network connection and enable you to record events even when the device is offline.
* **Amazon DynamoDB Object Mapper** - We have made it easier to use DynamoDB from the AWS SDK for iOS by providing the DynamoDB Object Mapper for iOS. The DynamoDB Object Mapper makes it easy to set up connections to a DynamoDB database and supports high-level operations like creating, getting, querying, updating, and deleting records.
* **Amazon S3 Transfer Manager** - We have rebuilt the S3TransferManager to utilize BFTask in AWS SDK for iOS. It has a clean interface, and all of the operations are now asynchronous.
* **ARC support** - The AWS SDK for iOS is now ARC enabled from the ground up to improve overall memory management.
* **BFTask support** - With native BFTask support in the AWS SDK for iOS, you can chain async requests instead of nesting them. This makes the logic cleaner while keeping the code more readable.
* **Conforming Objective-C recommendations** - The AWS SDK for iOS conforms to Objective-C best practices. The SDK returns NSErrors instead of throwing exceptions. iOS developers will now feel at home when using the AWS Mobile SDK.
* **Official CocoaPods support** - Including the AWS SDK for iOS in your project is now easier than ever. You just need to add `pod "AWSiOSSDKv2"` and `pod "AWSCognitoSync"` to your Podfile.

## Requirements

* Xcode 5 and later
* iOS 7 and later

## Installation

AWSiOSSDKv2 is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your **Podfile**:

    pod "AWSiOSSDKv2"
    pod "AWSCognitoSync"

The detailed instructions are available at [Setup the SDK for iOS](http://docs.aws.amazon.com/mobile/sdkforios/developerguide/setup.html).

## Getting Started is Easy Using Swift

It is easy to use the AWS SDK for iOS with Swift. Please see five simple steps below to get started with Swift.

1. Create an Objective-C bridging header file.
1. Import the service headers in the bridging header.

		#import "DynamoDB.h"

1. Point **SWIFT_OBJC_BRIDGING_HEADER** to the bridging header by going to **Your Target** => **Build Settings** => **SWIFT_OBJC_BRIDGING_HEADER**.

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

## Using Objective-C

1. Import AWSCore header in the application delegate.

		#import "AWSCore.h"

1. Create a default service configuration by adding the following code snippet in the `application:didFinishLaunchingWithOptions:` application delegate method.

	    AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithAccessKey:@"YourAccessKey" secretKey:@"YourSecretKey"];
	    AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
	    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

1. Import service headers where you want to use the services.

		#import "S3.h"

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

## Talk to UsVisit the [Issues](/aws/aws-ask-ios-v2/issues) to leave feedback and to connect with other users of the SDK.

## Author

Amazon Web Services

## License

AWSiOSSDKv2 is available under the Apache License. See the **LICENSE** file for more info.