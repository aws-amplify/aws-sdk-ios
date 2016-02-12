# AWS Mobile SDK for iOS CHANGELOG

## 2.3.5

### New Features
* **AWS Lambda**
    * Updated `AWSLambda` to add support for VPC.

### Resolved Issues
* **Amazon Cognito Sync**
    * Fixed a bug that `- registerDeviceInternal:` may not return a valid data type object.
* **SDK Core**
    * Updated podspecs to avoid conflicts with other projects that embed Mantle, libextobjc, and Fabric.

## 2.3.4

### New Features
* **AWS IoT**
    * Added support for MQTT over WebSocket connections to AWS IoT. WebSocket connections allow applications to connect, publish, and subscribe to topics on AWS IoT using the standard secure web port 443 without requiring a client certificate and private key.
* **SDK Core**
    * Added generics annotations to all low-level clients and `AWSS3TransferUtility`, `AWSS3PreSignedURLBuilder`, and `AWSLambdaInvoker`.
    * Added service call APIs with completion handlers to all low-level clients.

### Resolved Issues
* **Amazon Cognito Sync**
    * Fixed bug in `AWSCognito` `- subscribeAll` and `- unsubscribeAll` that caused `NSInvalidArgumentException` exception.
* **Amazon Mobile Analytics**
    * Addressed an issue that may cause an app to crash under certain situations.
* **SDK Core**
    * Fixed the build settings to fully enable bitcode support.

## 2.3.3

### New Features
* **Amazon Kinesis Firehose**
    * Added Amazon Kinesis Firehose support.
* **Asia Pacific (Seoul) Region**
    * Added Asia Pacific (Seoul) Region support. See `AWSServiceEnum.h` for more details.
* **Amazon S3**
    * Updated the Amazon S3 client model to the latest version.

## 2.3.2

### New Features
* **AWS IoT**
    * Added AWS IoT platform APIs.
    * Supports publishing and subscribing to MQTT topics with certificate-based authentication.
    * Supports device shadows via AWS IoT REST API.

### Resolved Issues
* **SDK Core**
    * Fixed the STS endpoint for the GovCloud region.
    * Fixed an issue where module map does not contain appropriate headers.
    * Suppressed the erroneous nullability warning.
* **Amazon API Gateway**
    * Resolved an issue where the SDK sometimes does not generate the URL path correctly.
* **Amazon Kinesis Recorder**
    * Resolved an issue where the SQLite vacuum may fail when there are many concurrent requests.
    * Improved the handling of concurrent `DELETE` requests to the SQLite database.

## 2.3.1

### New Features
* **Low-level Clients**
    * Added nullability annotations for the low-level service clients.
* **Frameworks**
    * The framework now includes the module map.
* **Twitter Fabric**
    * Added Twitter Fabric support for Amazon Cognito.

### Resolved Issues
* **SDK Core**
    * Updated the SDK so that the compiler no longer emits the deprecation warnings when the Base SDK is set to iOS 9.
    * Updated the following embedded third-party libraries: `Bolts`, `FMDB`, `TMCache`, and `UIKeyChainStore`.

## 2.3.0

### New Features
* **SDK Core**
    * The frameworks now include `bitcode` so that you can use them with Xcode 7 without modifying the project configuration. Please note the AWS Mobile SDK for iOS 2.3.0 supports Xcode 7 and above.
    * Added extra validation to ensure HTTP body is `nil` when HTTP method is either `GET` or `DELETE`.

## 2.2.7

### New Features
* **AWS Lambda**
    * Added support for AWS Lambda function versioning.

## 2.2.6

### New Features
* **Amazon DynamoDB**
 	* Added support for Expressions syntax in DynamoDB Object Mapper.
* **Amazon S3**
 	* Added support for Key Management Service (kms) in S3.

### Resolved Issues
* **Amazon S3**
    * [S3] Fixed an issue that failed large file uploads while using customer-provided encryption keys.


## 2.2.5

### Resolved Issues
* **Amazon S3 PresignedURL**
* 	*  Fixed an issue in which `getPreSignedURL` may incorrectly returns credentials error under certain circumstance.
* 	**Amazon S3 Transfer Utility**
* 	* Fixed an issue in which `AWSS3TransferUtility` does not execute a completion handler when an expression is not provided.

## 2.2.4

### New Features
* **Amazon S3 Transfer Utility**
    * Added support for Amazon S3 Transfer Utility to simplify the data transfer between your iOS app and Amazon S3 in the background.
* **Amazon DynamoDB Object Mapper**
    * Added support for `ignoreAttributes` of the `AWSDynamoDBModeling` protocol. 

### Resolved Issues
* **Amazon API Gateway**
    * Resolved a bug where an error object may not be serialized correctly.
* **Amazon Mobile Analytics**
    * Fixed an issue where the Amazon Mobile Analytics client overwrites the default configuration object and prevents other service clients from functioning properly.

## 2.2.3

### New Features
* **SDK Core**
    * Added AWS GovCloud (US) Region support.
* **Amazon S3**
    * Updated `AWSS3PreSignedURLBuilder` to use AWS Signature Version 4 for generating the pre-signed URLs.
    * Updated `AWSS3PreSignedURLBuilder` to accept additional request parameters to be included in pre-signed URLs.
* **Amazon DynamoDB Object Mapper**
	* Added support for Secondary Index Scan.
	
### Resolved Issues
* **Amazon S3**
    * Fixed an issue where an empty directory cannot be created.

## 2.2.2

### New Features
* **Amazon Mobile Analytics**
	*  Updated the Amazon Mobile Analytics client APIs so that the developer needs to write fewer lines of code to initialize it.
	*  Defaulted the SDK to send events over WAN.

### Resolved Issues
* **Amazon S3**
    * Fixed the issue in `S3TransferManager` that local downloaded files may be accidentally removed when the server returns 304 response.
    * Fixed the issue where the Amazon S3 client does not retry for the `SignatureDoesNotMatch` error.
    * Fixed the issue where `putBucketVersioning` does not return any response under certain situations.

## 2.2.1

### New Features
* **Amazon API Gateway** - Added a runtime library for the generated SDK of Amazon API Gateway. Amazon API Gateway makes it easy for AWS customers to publish, maintain, monitor, and secure application programming interfaces (APIs) at any scale.

### Resolved Issues
* **SDK Core** - Updated the CocoaPods podspec. Now the SDK is compatible with the `use_frameworks!` option.


## 2.2.0

### New Features
* **Service model updates** - The service models are updated for Amazon Cognito Identity, Amazon Cognito Sync, Amazon DynamoDB, Amazon EC2, and AWS Lambda.

### Resolved Issues
* **AWS Lambda** - Fixed an issue where the SDK does not properly serialize the response object when it contains `message` as a key.

### Misc Changes
* **SDK Core**
    * All third-party libraries are prefixed with `AWS` to avoid any conflicts with different versions of the third-party libraries. Please update all use of `BFTask` to `AWSTask`.
    * Removed the AWS service JSON files and imported them as source files to simplify the initial SDK installation.
* **Amazon Mobile Analytics** - Amazon Mobile Analytics is now provided as an independent service, and not a part of the AWS Core anymore. To use Amazon Mobile Analytics, please import `AWSMobileAnalytics.framework` or add `pod 'AWSMobileAnalytics'` to your `Podfile`. You need to update `#import <AWSCore/AWSCore.h>` to `#import <AWSMobileAnalytics/AWSMobileAnalytics.h>`.

## 2.1.2

### Resolved Issues
* **SDK Core** - Fixed an issue where the SDK does not return any response under certain situations.
* **Amazon Mobile Analytics** - Resolved an issue where `client_id` may be inadvertently changed.
* **Amazon S3**
    * Resolved an issue where the SDK cannot remove multiple objects.
    * Addressed an issue where concurrently downloading the same object to the same `filePath` may corrupt the data.

## 2.1.1

### New Features
* **AWS Lambda** - Added support for AWS Lambda.
* **Amazon Machine Learning** - Added support for Amazon Machine Learning.

### Resolved Issues
* **Amazon S3** - Fixed two memory issues:
    * When the request object is retained, `request.internalRequest` is not properly released after the operation completes.
    * The memory is not property released until all tasks finish when an app continuously downloads many files.

## 2.1.0

### Misc Changes
* **SDK Core**
    * Added `- initWithRegionType:identityPoolId:` to `AWSCognitoCredentialsProvider`. See `AWSCredentialsProvider.h` for further details.
    * Deprecated all `+ credentialsWith*` factory methods in `AWSCognitoCredentialsProvider`.
    * Added `+ registerSERVICEWithConfiguration:forKey:`, `+ SERVICEForKey:`, and `+ removeSERVICEForKey:` to each service client. See the service client headers for further details.
    * Deprecated `- initWithConfiguration:` in all service clients.
    * Deprecated `- serviceForKey:`, `- setService:forKey:`, and `- removeServiceForKey:` in `AWSServiceManager`.
    * Split the framework into per service frameworks.
    * Updated the SDK structure to support CocoaPods 0.36.0 with the `use_framework!` option.

### Resolved Issues
* **Amazon S3 Transfer Manager** - Fixed a bug where resume does not work as intended if the app restarts. 

## 2.0.17

### Resolved Issues
* **Amazon DynamoDB Object Mapper** - Fixed a number format issue relating to the device locale setting.
* **Amazon Mobile Analytics** - Fixed an issue in `AWSMobileAnalyticsBufferedReader` that generated application errors if the underlying inputStream contained multi-byte characters.

## 2.0.16

### New Features
* **Amazon DynamoDB Object Mapper** - Added support for new data types: `BOOL`, `List`, and `Map`. `AWSDynamoDBModel` has been deprecated. Use `AWSDynamoDBObjectModel` instead.

### Resolved Issues
* **SDK Core** - Fixed a bug in the query string serializer that may cause `BatchPutAttributes` request failure in Amazon SimpleDB.

## 2.0.15

### Resolved Issues
* **SDK Core**
   * Fixed a bug in `AWSCognitoCredentialsProvider` where `identityId` was set to pool id when using simplified constructors.
   * Fixed a bug in `AWSCognitoCredentialsProvider` where credentials were not saved in the keychain when using simplified constructors.
   * Removed the third party libraries from `AWSiOSSDKv2.framework`.

* **Amazon S3** - Fixed an issue where the SDK does not automatically retry for the `SignatureDoesNotMatch` exception.

## 2.0.14

### New Features
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

### New Features
* **Amazon Kinesis Recorder** - Amazon Kinesis PutRecords Rest API puts multiple records into an Amazon Kinesis stream in a single call. Amazon Kinesis Recorder now uses the PutRecords API to automatically batch requests, leading to higher throughput and optimized battery life. No developer change is required to benefit.

## 2.0.12

### New Features
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

### New Features
* **EU (Frankfurt) Region support** - The AWS Mobile SDK for iOS now supports EU (Frankfurt) Region.

### Resolved Issues
* **SDK Core**
    * The Objective-C ++ compatibility issue has been resolved.
    * The serializer bugs that may cause a crash and excessive access to Amazon Cognito Identity and Amazon STS have been fixed.
    * Xcode 5 Compatibility - The Xcode 5 backward compatibility issue has been resolved.
* **Amazon S3 PreSigned URL Builder** - `AWSS3PreSignedURLBuilder` now supports subdirectories. Also, the `AWSS3PreSignedURLBuilder` compatibility bug when used with `AWSCognitoCredentialsProvider` has been resolved.
* **Amazon Mobile Analytics** - The SDK now gracefully handles corrupted event data.

## 2.0.8

### New Features
* **Amazon Cognito Developer Authenticated Identities** - We are pleased to announce that we are adding support for your own identification management system in addition to existing support for a number of public login providers (Amazon, Facebook, and Google) and unauthenticated guests.
* **Amazon Mobile Analytics** - Amazon Mobile Analytics now has AWS Console generated application id's, which enables developers to set what an 'app' means to them. For instance this allows developers to have multiple flavors of an app all report into a single console report.

### Resolved Issues
* Amazon S3 - The Amazon S3 client now properly populates custom metadata headers.
* Amazon Mobile Analytics - The Amazon Mobile Analytics client handles non-ASCII app names correctly. The constant value changes resolve the duplicate symbols error when used with the Amazon A/B Testing SDK.
* Amazon DynamoDB Object Mapper - The Amazon DynamoDB Object Mapper client now supports schemas without a range key.

## 2.0.7

### New Features
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

### New Features
* **Amazon Cognito** - is a simple user identity and synchronization service that helps you securely manage and synchronize app data for your users across their mobile devices. With Amazon Cognito, you can save any kind of data, such as app preferences or game state, in the AWS Cloud without writing any backend code or managing any infrastructure.
* **Amazon Mobile Analytics** - is a service for collecting, visualizing and understanding app usage data at scale. Amazon Mobile Analytics reports are typically updated within 60 minutes from when data are received. Amazon Mobile Analytics is built to scale with the business and can collect and process billions of events from millions of endpoints.
* **Amazon Kinesis Recorder** - enables you to reliably record data to an Amazon Kinesis data stream from your mobile app. Kinesis Recorder batches requests to handle intermittent network connection and enable you to record events even when the device is offline.
* **Amazon DynamoDB Object Mapper** - We have made it easier to use DynamoDB from the AWS SDK for iOS by providing the DynamoDB Object Mapper for iOS. The DynamoDB Object Mapper makes it easy to set up connections to a DynamoDB database and supports high-level operations like creating, getting, querying, updating, and deleting records.
* **Amazon S3 Transfer Manager** - We have rebuilt the S3TransferManager to utilize BFTask in AWS SDK for iOS. It has a clean interface, and all of the operations are now asynchronous.
* **ARC support** - The AWS SDK for iOS is now ARC enabled from the ground up to improve overall memory management.
* **BFTask support** - With native BFTask support in the AWS SDK for iOS, you can chain async requests instead of nesting them. This makes the logic cleaner while keeping the code more readable.
* **Conforming Objective-C recommendations** - The AWS SDK for iOS conforms to Objective-C best practices. The SDK returns NSErrors instead of throwing exceptions. iOS developers will now feel at home when using the AWS Mobile SDK.
* **Official CocoaPods support** - Including the AWS SDK for iOS in your project is now easier than ever. You just need to add pod "AWSiOSSDKv2" and pod "AWSCognitoSync" to your Podfile.
