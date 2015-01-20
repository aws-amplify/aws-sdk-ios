# AWSiOSSDKv2 CHANGELOG

## 2.0.14

### New features
* **Enhanced AWSCognitoCredentialsProvider** - Updated `AWSCognitoCredentialsProvider` to support new enhanced authentication flow. Reduced parameters necessary to initialize the provider.
* **Amazon DynamoDB Object Mapper** - Added three new save behaviors: `AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes`, `AWSDynamoDBObjectMapperSaveBehaviorAppendSet`, and `AWSDynamoDBObjectMapperSaveBehaviorClobber`.
* **Service definitions** - Updated the service model classes for Amazon Auto Scaling, Amazon Cognito Identity, Amazon DynamoDB, Amazon EC2, Amazon Kinesis, and Amazon S3.

### Resolved Issues
* **SDK Core**
    * Add reset logic to `AWSCognitoCredentialsProvider` when identity id has become invalid.
    * Renamed reserved keywords in Swift, Objective-C, and C++ to non-reserved words.
    * Updated `podspec` to make it less restrictive with Mantle, UICKeyChainStore, and Reachability libraries.
    * Fixed the exponential back off logic.
    * Set the maximum `maxRetryCount` to 10.
    * Updated the copyright year from 2014 to 2015.
* **Amazon S3**
	* Fixed the Amazon S3 date format issue.
	* Fixed a bug involving the potential for an invalid file URL to result in a crash.
	* Fixed the operation name mismatch issue.
* **Amazon DynamoDB Object Mapper**
    * Fixed the `- save:` method (Update behavior) where the method failed to remove `nil` value attribute(s) from a table.
    * Fixed the silent failure issue with the `- save:` method.
* **Amazon EC2** - Fixed the issue in which a value of `AWSEC2PlatformValues` was not parsed correctly in the response.

## 2.0.13

### New features
* **Amazon Kinesis Recorder** - Amazon Kinesis PutRecords Rest API puts multiple records into an Amazon Kinesis stream in a single call. Amazon Kinesis Recorder now uses the PutRecords API to automatically batch requests, leading to higher throughput and optimized battery life. No developer change is required to benefit.

## 2.0.12

### New features
* **Amazon Cognito Sync** - Amazon Cognito helps you save user data in the cloud and synchronize across all of an end user's devices. You can now choose to use push synchronization to synchronize data as soon as it is changed in the cloud.

### Resolved Issues
* **Amazon Cognito Identity** - An identity provider bug when using BYOI.

## 2.0.11

### Resolved Issues
* **Amazon Mobile Analytics** - Under certain circumstances, incorrect timestamps were submitted for custom events aggregation in the Amazon Mobile Service.

## 2.0.10

### Resolved Issues
* **Amazon Cognito Identity**
    * The AWS Mobile SDK for iOS 2.0.9 does not recognize identity IDs stored by the previous versions of the SDK.
    * `AWSCognitoCredentialsProvider` may return nil identity IDs when the Keychains service is not available.

## 2.0.9

### New features
* **EU (Frankfurt) Region support** - The AWS Mobile SDK for iOS now supports EU (Frankfurt) Region.

### Resolved Issues
* **SDK Core**
    * The Objective-C ++ compatibility issue has been resolved.
    * The serializer bugs that may cause a crash and excessive access to Amazon Cognito Identity and Amazon STS have been fixed.
    * Xcode 5 Compatibility - The Xcode 5 backward compatibility issue has been resolved.
* **Amazon S3 PreSigned URL Builder** - `AWSS3PreSignedURLBuilder` now supports subdirectories. Also, the `AWSS3PreSignedURLBuilder` compatibility bug when used with `AWSCognitoCredentialsProvider` has been resolved.
* **Amazon Mobile Analytics** - The SDK now gracefully handles corrupted event data.

## 2.0.8

### New features
* **Amazon Cognito Developer Authenticated Identities** - We are pleased to announce that we are adding support for your own identification management system in addition to existing support for a number of public login providers (Amazon, Facebook, and Google) and unauthenticated guests.
* **Amazon Mobile Analytics** - Amazon Mobile Analytics now has AWS Console generated application id's, which enables developers to set what an 'app' means to them. For instance this allows developers to have multiple flavors of an app all report into a single console report.

### Resolved Issues
* Amazon S3 - The Amazon S3 client now properly populates custom metadata headers.
* Amazon Mobile Analytics - The Amazon Mobile Analytics client handles non-ASCII app names correctly. The constant value changes resolve the duplicate symbols error when used with the Amazon A/B Testing SDK.
* Amazon DynamoDB Object Mapper - The Amazon DynamoDB Object Mapper client now supports schemas without a range key.

## 2.0.7

### New features
* **SDK Core**
    * iOS 8 Support - The AWS Mobile SDK for iOS officially supports iOS 8.
    * Removed the dependency on `-ObjC` linker flag. - When importing frameworks, you no longer need to add -ObjC linker flag.
* **Amazon S3 PreSigned URL Builder** - The SDK now includes support for pre-signed Amazon Simple Storage Service (S3) URLs. You can use these URLS to perform background transfers using the NSURLSession class.
* **Amazon Cognito and Amazon Mobile Analytics** - The low level client names for Amazon Cognito and Mobile Analytics have been updated. e.g. `AWSCognitoIdentityService` becomes `AWSCognitoIdentity`.

### Resolved Issues
* **Amazon S3 Transfer Manager** - The SDK now immediately pauses/cancels multipart uploads without waiting for the current part to finish uploading.

## 2.0.6

### Resolved Issues

* **SDK Core**
 	* A number of issues in the serializer are fixed.
 	* AmazonCore is merged into AWSCore.
 	* AWSEndpoint is moved to AWSServiceConfiguration.
	* AWSCognitoCredentialsProvider invalidates credentials when logins map is updated.
	* AWSWebIdentityCredentialsProvider takes into account the providerId.
* **Amazon Mobile Analytics** - The Mobile Analytics constructor is updated so that the developers do not have to manage instances of Mobile Analytics clients on their own.
* **Amazon DynamoDB Object Mapper and Amazon S3 Transfer Manager** - The low-level clients are hidden from S3TransferManager and DynamoDBObjectMapper in order to simplify the high-level clients.

## 2.0.5

### Resolved Issues
* **Query String Serializer** - Now the SDK correctly constructs the query string requests from a JSON model.
* **S3 Serializer** - The S3 serializer URL encoding issue has been resolved.

## 2.0.4

### Resolved Issues
* **Amazon Cognito Offline Sync** - The SDK queues sync requests made when device is offline. The sync operation is automatically executed when internet connectivity is recovered in the same app session. It also enables the ability to synchronize over WiFi only.
* **Amazon Cognito Sync** - The update fixes the following Amazon Cognito client issues:
	* An issue where deleted records may show up in the list of records.
	* An issue where data synchronized from service would have the incorrect sync count locally.
* **Amazon Cognito Identity** - The update fixes an issue with AWSCognitoCredentialsProvider where it does not refresh the credentials properly under certain situations.
* **Amazon S3** - The update fixes an issue with the serializer where it does not serialize the response under certain situations.
* **Amazon SNS** - The update properly serializes the attributes property for AWSSNSCreatePlatformEndpointInput and AWSSNSCreatePlatformApplicationInput.
* **Amazon SimpleDB** - The update correctly encodes the SimpleDB query string.

## 2.0.3 - Initial Release

### New features
* **Amazon Cognito** - is a simple user identity and synchronization service that helps you securely manage and synchronize app data for your users across their mobile devices. With Amazon Cognito, you can save any kind of data, such as app preferences or game state, in the AWS Cloud without writing any backend code or managing any infrastructure.
* **Amazon Mobile Analytics** - is a service for collecting, visualizing and understanding app usage data at scale. Amazon Mobile Analytics reports are typically updated within 60 minutes from when data are received. Amazon Mobile Analytics is built to scale with the business and can collect and process billions of events from millions of endpoints.
* **Amazon Kinesis Recorder** - enables you to reliably record data to an Amazon Kinesis data stream from your mobile app. Kinesis Recorder batches requests to handle intermittent network connection and enable you to record events even when the device is offline.
* **Amazon DynamoDB Object Mapper** - We have made it easier to use DynamoDB from the AWS SDK for iOS by providing the DynamoDB Object Mapper for iOS. The DynamoDB Object Mapper makes it easy to set up connections to a DynamoDB database and supports high-level operations like creating, getting, querying, updating, and deleting records.
* **Amazon S3 Transfer Manager** - We have rebuilt the S3TransferManager to utilize BFTask in AWS SDK for iOS. It has a clean interface, and all of the operations are now asynchronous.
* **ARC support** - The AWS SDK for iOS is now ARC enabled from the ground up to improve overall memory management.
* **BFTask support** - With native BFTask support in the AWS SDK for iOS, you can chain async requests instead of nesting them. This makes the logic cleaner while keeping the code more readable.
* **Conforming Objective-C recommendations** - The AWS SDK for iOS conforms to Objective-C best practices. The SDK returns NSErrors instead of throwing exceptions. iOS developers will now feel at home when using the AWS Mobile SDK.
* **Official CocoaPods support** - Including the AWS SDK for iOS in your project is now easier than ever. You just need to add pod "AWSiOSSDKv2" and pod "AWSCognitoSync" to your Podfile.
