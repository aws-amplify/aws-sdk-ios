**This is a developer preview of the AWS SDK for iOS v2. The repository name may change when the SDK goes out of the preview.**

# Version 2 of the AWS SDK for iOS Developer Preview

[![Version](http://cocoapod-badges.herokuapp.com/v/AWSiOSSDKv2/badge.png)](http://cocoadocs.org/docsets/AWSiOSSDKv2)
[![Platform](http://cocoapod-badges.herokuapp.com/p/AWSiOSSDKv2/badge.png)](http://cocoadocs.org/docsets/AWSiOSSDKv2)

We are happy to announce that based on your feedback, we have made significant improvements to our AWS SDK for iOS. We rebuilt the AWS SDK for iOS from the ground up to conform to Objective-C conventions and take advantage of new features in the Cocoa framework. The new SDK will also improve interoperability with a number of other frameworks and projects in the iOS developer ecosystem.

We have significantly reduced the footprint by reducing the number of files and number of classes. The SDK supports all of the existing functionality, and it also includes several new features.

## Highlights

1. **Amazon DynamoDB Object Mapper** - We have made it easier to use DynamoDB from the AWS SDK for iOS by providing the DynamoDB Object Mapper for iOS. The DynamoDB Object Mapper makes it easy to set up connections to a DynamoDB database and supports high-level operations like creating, getting, querying, updating, and deleting records.

1. **S3TransferManager** - We have rebuilt the S3TransferManager to utilize BFTask. It has a clean interface, and all of the operations are now asynchronous.

1. **ARC support** - The SDK is now ARC enabled from the ground up to improve overall memory management.

1. **BFTask support** - Async methods with complex logic often cause deeply nested blocks in Objective-C. With native BFTask support, you can chain async requests instead of nesting them. This makes the logic cleaner while keeping the code more readable.

1. **Conforming Objective-C recommendations** - We are better at conforming to Objective-C best practices. The SDK returns `NSError`s instead of throwing exceptions. iOS developers will now feel at home when using the AWS Mobile SDK.

1. **Official Cocoapods support** - Including the AWS SDK for iOS in your project is now easier than ever. You just need to add `pod "AWSiOSSDKv2"` to your **Podfile**.

## Requirements

* Xcode 5 and later
* iOS 7 and later

## Installation

AWSiOSSDKv2 is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your **Podfile**:

    pod "AWSiOSSDKv2"

## Getting Started is Easy Using Swift

It is easy to use the AWS SDK for iOS with Swift. Please see five simple steps below to get started with Swift.

1. Create an Objective-C bridging header file.
1. Import the service headers in the bridging header.

		#import "DynamoDB.h"

1. Point **SWIFT_OBJC_BRIDGING_HEDER** to the bridging header by going to **Your Target** => **Build Settings** => **SWIFT_OBJC_BRIDGING_HEADER**.

1. Create a default service configuration by adding the following code snippet in the `@optional func application(_ application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool` application delegate method.

        let credentialsProvider = AWSStaticCredentialsProvider.credentialsWithAccessKey(yourAccessKey, secretKey: yourSecretKey)
        let defaultServiceConfiguration = AWSServiceConfiguration(region: AWSRegionType.USEast1, credentialsProvider: credentialsProvider)
        AWSServiceManager.defaultServiceManager().setDefaultServiceConfiguration(defaultServiceConfiguration)

1. Make a call to the AWS services.

		let dynamoDB = AWSDynamoDB.defaultDynamoDB()
        let listTableInput = AWSDynamoDBListTablesInput()
        dynamoDB.listTables(listTableInput).continueWithBlock{
            (task: BFTask!) -> AnyObject! in
            let listTablesOutput = task.result() as AWSDynamoDBListTablesOutput

            for tableName : AnyObject in listTablesOutput.tableNames {
                println("\(tableName)")
            }

            return nil
            }


## Using Objective-C

1. Import AWSCore header in the application delegate.

		#import <AWSiOSSDK/AWSCore.h>

1. Create a default service configuration by adding the following code snippet in the `application:didFinishLaunchingWithOptions:` application delegate method.

	    AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithAccessKey:@"YourAccessKey" secretKey:@"YourSecretKey"];
	    AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
	    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

1. Import service headers where you want to use the services.

		#import "S3.h"

1. Make a call to the AWS services.

		AWSS3TransferManagerUploadRequest *uploadRequest = [AWSS3TransferManagerUploadRequest new];
	    uploadRequest.bucket = yourBucket;
	    uploadRequest.key = yourKey;
	    uploadRequest.body = yourDataURL;
	    uploadRequest.contentLength = [NSNumber numberWithUnsignedLongLong:fileSize];
	
	    [[transferManager upload:uploadRequest] continueWithBlock:^id(BFTask *task) {
	    	// Do something with the response
	        return nil;
	    }];

## Talk to UsThis is a Developer Preview, and we will make changes based on your feedback. Visit the [Issues]() to leave feedback and to connect with other users of the SDK.

## Author

Amazon Web Services

## License

AWSiOSSDKv2 is available under the Apache License. See the **LICENSE** file for more info.