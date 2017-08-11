# AWS Mobile SDK for iOS CHANGELOG

## 2.5.10

### Enhancements

* **Amazon Pinpoint**
 * Introduce 'didReceiveRemoteNotification:fetchCompletionHandler:shouldHandleNotificationDeepLink:' to 'AWSPinpointNotificationManager'. Introduces new parameter 'handleDeepLink', to optionally specify whether or not notification manager should attempt to open the remote notification deeplink, if present.

* **Amazon Cognito Auth**
 * Amazon Cognito Auth is now Generally Available.
 
### Bug fixes

* **Amazon Cognito Auth**
 * Fix bug causing error messages not to be surfaced
 * Fix bug causing refresh tokens not to work in all scenarios

* **AWS IoT**
 * Fixed bug to improve stability of encoding and decoding MQTT packet thread.
 * Add mutex to synchronize the buffer used for encoding messages.
 
## 2.5.9

### Bug fixes

* **Amazon Lex**
  * Fixed bug where an application consuming `Lex` cannot be signed and distributed [Github Issue #704](https://github.com/aws/aws-sdk-ios/issues/704)

* **Amazon Pinpoint**
  * Fixed bug where saving a session cause a crash. [Github Issue #580] (https://github.com/aws/aws-sdk-ios/issues/580)
  * Removed all calls that blocked the main thread [Github Issue #614] (https://github.com/aws/aws-sdk-ios/issues/614)

* **AWS IoT**
  * Moved encoding and decoding MQTT packet into background thread
  * Moved websocket delegate methods (webSocketDidOpen:, webSocket:didFailWithError:, webSocket:didReceiveMessage:, webSocket:didCloseWithCode: ) into background thread
  * Fixed bug where app receives duplicate "Disconnected" callback when previously connected to AWS IoT via websocket
  * Fixed bug where reconnect timer incorrectly triggered after user disconnects

## 2.5.8

### New Features
* **Amazon Cognito Auth (Beta)**
	* A new SDK that enables sign-up and sign-in for Amazon Cognito Your User Pools via a lightweight hosted ui.

### Enhancements

* **Amazon Pinpoint**
	* Introduce `isApplicationLevelOptOut` block to `AWSPinpointConfiguration`. Use this to configure whether or not client should receive push notifications, at an application level.
	
### Bug fixes

* **Amazon SNS**
    * Fixed error parsing for service responses. **Note:** This change also fixes error response parsing for `AutoScaling`, `CloudWatch`, `ELB`, `SES`, `SimpleDB`, `SQS` and `STS`. [Github Issue #676](https://github.com/aws/aws-sdk-ios/issues/676) and [Github Issue #671](https://github.com/aws/aws-sdk-ios/issues/671)

* **Amazon Cognito Identity Provider**
	* Fixed crash with AWSCognitoIdentityUserPool.calculateSecretHash when username contained non ASCII characters. [Github Issue #679](https://github.com/aws/aws-sdk-ios/issues/679)

### Misc changes

* **AWS IoT**
	* Deprecating default endpoint for AWSIoTDataService. Client should use custom endpoint when initializing AWSServiceConfiguration to be used for AWSIoTDataManager.

## 2.5.7

### Enhancements

* **Amazon Polly**
	* Added support for new voice id - `Vicki`.
	
### Bug fixes

* **SDK Core**
    * Fixed `LOG Macros` error. [Github Issue #664](https://github.com/aws/aws-sdk-ios/issues/664)
    * Allow for future expired/unauthed token calls to properly refresh the aws token. [Github Issue #563](https://github.com/aws/aws-sdk-ios/pull/563/)
* **AWS Lambda**
    * Fixed clock skew retry handling bug. [Github Issue #673](https://github.com/aws/aws-sdk-ios/issues/673)
    

## 2.5.6

### Enhancements

* **AWS IoT**
	* Updated AWS IoT to the latest API specifications.

### Bug fixes
* **Amazon S3**
	* Fixed bug where file paths with spaces were not correctly handled and caused upload failures. [Github Issue #634](https://github.com/aws/aws-sdk-ios/issues/634)
* **AWS IoT**
    * Fixed bug where timer was not started on currentRunLoop.
* **SDK Core**
    * Remove definition of `LOG_LEVEL_DEF` for compatibility. [Github Issue #655](https://github.com/aws/aws-sdk-ios/issues/655)

## 2.5.5

### Bug fixes
* **SDK Core**
	* **Breaking API change** `doesAppRunInBackground` method is renamed to `awsDoesAppRunInBackground`. [GitHub Issue #643](https://github.com/aws/aws-sdk-ios/issues/643)

* **AWS IoT**
	* Fixed bug which caused crash when shadow timer timeout is called after shadow is unregistered. [Github Issue #640](https://github.com/aws/aws-sdk-ios/issues/640)

## 2.5.4

### New Features
* **SDK Core**
	* `AWSLogger` is now deprecated. Suggested to use `AWSDDLog` for logging; SDK now uses `CocoaLumberjack` for logging.

### Enhancements
* **Amazon Lex**
	* Amazon Lex is now Generally Available.
	* Added support for input transcripts.
	
* **Amazon Polly**
	* Added support for requesting use of multiple Lexicons through `AWSPollySynthesizeSpeechURLBuilder`.
	* Added support for speech marks.
	
* **Amazon Rekognition**
	* Added support for moderation labels and age range estimation.

## 2.5.3
### New Features
* **Amazon Cloud Watch Logs**
	* Amazon CloudWatch is a monitoring service for AWS cloud resources and the applications you run on AWS. You can use Amazon CloudWatch to collect and track metrics, collect and monitor log files, and set alarms.

### Resolved Issues
* **SDK Core**
	* Added support for BasicSessionCredentials Provider [GitHub Issue #561](https://github.com/aws/aws-sdk-ios/issues/561) 
* **Amazon APIGateway**
	* Support for Swift 3 in API Gateway code generation.
	* Fixed Invalid bitcast AWSServiceConfiguration. [GitHub Issue #585](https://github.com/aws/aws-sdk-ios/issues/585)
* **Amazon S3**
	* Fixed issues which might cause compilation erros when using the SDK with C++ runtimes. [GitHub issue #613](https://github.com/aws/aws-sdk-ios/issues/613)
	* Fixed crash when uploading file that does not exist through `AWSTransferUtility `. [GitHub issue #618](https://github.com/aws/aws-sdk-ios/issues/618)
* **Amazon Cognito Identity Provider**
	* Fixed a bug in which the User Confirmation status was not getting set correctly in the sdk.
### Enhancements
* **Amazon Lex - beta**
	* Use different images for `LexVoiceButton` to distinguish between when playing audio response vs when listening to audio.


## 2.5.2
### New Features
* **AWS KMS**
    *  AWS Key Management Service (KMS) is a managed service that makes it easy for you to create and control the encryption keys used to encrypt your data, and uses Hardware Security Modules (HSMs) to protect the security of your keys. AWS Key Management Service is integrated with several other AWS services to help you protect the data you store with these services. AWS Key Management Service is also integrated with AWS CloudTrail to provide you with logs of all key usage to help meet your regulatory and compliance needs.

### Breaking API Changes
* **Amazon Cognito Identity Provider**
	* Changed `AWSCognitoIdentityProviderSchemaAttributeType` property from `mutable` to `varying` for compatibility when used with C++. [Github Issue #597](https://github.com/aws/aws-sdk-ios/issues/597)

### Resolved Issues
* **SDK Core**
	* Fixed invalid chunk data signature. [Github Issue #592](https://github.com/aws/aws-sdk-ios/issues/592)
	* Added us-east-2, eu-west-2, and ca-central-1 regions to `aws_regionTypeValue`.
*  **Amazon Cognito Identity Provider**
	*  Fixed bug which caused `deleteAttributes` to not delete the attributes specified by caller. The method no longer causes user logout.
	*  Improved reliability of `registerDevice:deviceToken` with reduced `NotAuthorizedException` occurances.
*  **Amazon Cognito Sync**
	*  Fixed bug which caused possible deadlock during `synchronize` call.
*  **Amazon Lex - beta**
	*  Added support to switch between audio outputs during conversation.
	*  Removed unnecessary header search path in AWSLex.podspec.
* **AWS IoT**
	* Fixed bug which caused shadow timer to not expire shadow operation. [Github Pull Request #601](https://github.com/aws/aws-sdk-ios/pull/601) [Github Issue #565](https://github.com/aws/aws-sdk-ios/issues/565)

### Enhancements
* **Amazon Cognito Identity Provider**
	* Added more error logging.
* **AWS IoT**
	* Added more error logging and missing `NSURLNetworkServiceTypeCallSignaling` case handling.
* **AWS STS**
	* Updated STS to the latest API specifications.
* **Amazon S3**
	* Updated S3 to the latest API specifications.

## 2.5.1
### Resolved Issues
* **SDK Core**
	* Fix namespace collision with Bolts framework. [Github Issue #572](https://github.com/aws/aws-sdk-ios/issues/572)
	* Fix a bug which caused bad memory access when no data is read from stream [Github Pull Request #582](https://github.com/aws/aws-sdk-ios/pull/582) [Github Issue #586](https://github.com/aws/aws-sdk-ios/issues/586)
* **Amazon Lex - Beta**
	* Fix a bug which cutoff beginning of audio stream.
	* Fix a bug which caused bad memory access during race conditions when in voice mode.

## 2.5.0
### General Updates
* **All Services**
	* Swift 3 documentation and naming definitions added. The naming definitions will affect all Swift users by changing method names. Please refer to the [blog](https://aws.amazon.com/blogs/mobile/aws-mobile-sdk-for-ios-version-2-5-0-improvements-and-changes-to-swift-support/) for more details on changes and how to upgrade from 2.4.X to 2.5.X.
* **SDK Core**
	* For Swift, `AWSRegionType` and `AWSServiceType` enums do not follow the convention that uses lowercase at the beginning. Example: `.USEast1` and `.DynamoDB`
* **Updated AWSTask**
	* AWSTask has been updated to the latest version of the Bolts framework.

### Breaking API Changes
* **SDK Core**
	* **AWSTask** no longer has `exception` property and affiliated methods due to Bolts update. This means that AWSTask will not handle exceptions and they will be thrown.
	* **AWSCredentialsProvider**
		* Removed deprecated property`login`. Please use `AWSIdentityProviderManager` to provide a valid logins dictionary to the credentials provider.
		* Removed deprecated method `initWithRegionType:identityId:identityPoolId:logins:`. Please use `initWithRegionType:identityPoolId:identityProviderManager:`.
		* Removed deprecated method `initWithRegionType:identityId:accountId:identityPoolId:unauthRoleArn:authRoleArn:logins:`. Please use `initWithRegionType:identityPoolId:unauthRoleArn:authRoleArn:identityProviderManager:`.
	* **AWSIdentityProvider**
		* Removed deprecated enum `AWSCognitoLoginProviderKey`.
		* `AWSCognitoCredentialsProviderHelperErrorType` enum entries changed to conform to convention.
			* Please use `AWSCognitoCredentialsProviderHelperErrorTypeIdentityIsNil` instead of `AWSCognitoCredentialsProviderHelperErrorIdentityIsNil`.
			* Please use `AWSCognitoCredentialsProviderHelperErrorTypeTokenRefreshTimeout` instead of `AWSCognitoCredentialsProviderHelperErrorTokenRefreshTimeout`.
* **Amazon S3**
	* **AWSS3TransferUtility** parameter name `completionHander` corrected to `completionHandler`. Afffected methods are `uploadData:bucket:key:contentType:expression:completionHander:`, `uploadFile:bucket:key:contentType:expression:completionHander:`, `downloadDataFromBucket:key:expression:completionHander:`, and `downloadToURL:bucket:key:expression:completionHander:`.
* **Amazon Cognito**
	* **AWSCognitoIdentityUser**
		* Removed deprecated method `getSession:password:validationData:scopes:`. Please use `getSession:password:validationData`.
		* Removed deprecated method `getSession:`. Please use `getSession` (no parameters).
* **AWS IoT**
	* **AWSIoTDataManager**
		* Removed deprecated method `publishString:onTopic:`. Please use `publishString:onTopic:QoS:`.
		* Removed deprecated method `publishString:qos:onTopic:`. Please use `publishString:onTopic:QoS:`.
		* Removed deprecated method `publishData:onTopic`. Please use `publishData:onTopic:QoS:`.
		* Removed deprecated method `publishData:qos:onTopic`. Please use `publishData:onTopic:QoS:`.
		* Removed deprecated method `subscribeToTopic:qos:messageCallback`. Please use `registerWithShadow:eventCallback`.
* **AWS IoT, Amazon DynamoDB, Amazon Cognito**
	* Type parameters specified for generic types where applicable.

### Resolved Issues
* **SDK Core**
	* Fix bug related to URL encoding [Github Issue 442](https://github.com/aws/aws-sdk-ios/issues/442)
* **Amazon Cognito Sync**
	* Fix and repair datasets stuck with "No such SyncCount" errors during synchronize.

## 2.4.16
### New Features
* **SDK Core**
	* Introducing new AWS `EUWest2` - Europe (London) region, endpoint `eu-west-2`. 

* **Amazon Rekognition**
	* Amazon Rekognition is a service that makes it easy to add image analysis to your applications. With Rekognition, you can detect objects, scenes, and faces in images. You can also search and compare faces. Rekognition’s API enables you to quickly add sophisticated deep learning-based visual search and image classification to your applications.
	
### Misc. Updates

* **Amazon SQS**
 	* Update SQS client to latest service model.

## 2.4.15
### New Features
* **SDK Core**
	* Introducing new AWS `CACentral1` - Canada (Central) region, endpoint `ca-central-1`. 
    
### Resolved Issues

* **Amazon Pinpoint**
    *  Fix bugs related to session timeout and campaign opens analytics.

## 2.4.14
### New Features
* **Amazon Pinpoint**
	* Amazon Pinpoint makes it easy to run targeted campaigns to improve user engagement. Pinpoint helps you understand your users behavior, define who to target, what messages to send, when to deliver them, and tracks the results of the campaigns.
	

## 2.4.13
### New Features
* **Amazon Polly**
    *  Amazon Polly is a service that turns text into lifelike speech, making it easy to develop applications that use high-quality speech to increase engagement and accessibility. With Amazon Polly the developers can build speech-enabled apps that work in multiple geographies.
* **Amazon Lex - Beta**
    * Amazon Lex is a service for building conversational interactions into any application using voice and text. With Lex, the same conversational engine that powers Amazon Alexa is now available to any developer, enabling you to build sophisticated, natural language, conversational bots (chatbots) into your new and existing applications. Amazon Lex provides the deep functionality and flexibility of automatic speech recognition (ASR) for converting speech to text and natural language understanding (NLU) to understand the intent of the text. This allows you to build highly engaging user experiences with lifelike, conversational interactions.     
    
### Resolved Issues

* **Amazon Mobile Analytics**
    * Do not allow empty keys for attributes or metrics.


## 2.4.12
### New Features
* **Amazon Mobile Analytics**
	*  Added support for setting custom max keystorage size. [Github Issue 500](https://github.com/aws/aws-sdk-ios/issues/500)
	
### Resolved Issues

* **Amazon API Gateway**
    * Fixed a URL encoding bug. [Github Issue 505](https://github.com/aws/aws-sdk-ios/issues/505)
* **Amazon S3 TransferUtility**
    * Added fix for timeout based on configuration.    
* **Amazon Cognito Identity**
    * Fix issue causing SDK to call getOpenIdToken even with useEnhancedFlow set to YES
    * Fix issue introduced in 2.4.0 causing credentials to be refreshed on every AWS service call even when they were still valid
* **Amazon Cognito Sync**
    * Fix issue causing synchronize() to fail with "Mismatch between session identity id and request identity id" on the first sync with Developer Authenticated Identities and in other scenarios

## 2.4.11
### New Features
* **SDK Core**
	* Introducing new AWS `USEast2` (Ohio) region, endpoint `us-east-2`. 
    
### Resolved Issues

* **Amazon API Gateway**
    * Fixed a URL encoding bug. [Github Issue 491](https://github.com/aws/aws-sdk-ios/issues/491)


## 2.4.10
### New Features
* **Amazon API Gateway**
	* Added support for a custom API invoker method with configurable HTTP parameters.
* **Amazon Cognito Identity Provider**
    * Added support for end user to set password and required attributes during initial authentication if they were created using AdminCreateUser. 
    
### Resolved Issues

* **Amazon Cognito Identity Provider**
    * Fixed a bug causing AWSCognitoIdentityUserPool.clearAll to not clear the keychain. [Github Issue #476](https://github.com/aws/aws-sdk-ios/issues/476)

* **Amazon S3**
    * Fixed a bug which disabled creating an empty folder. [Github Issue #480](https://github.com/aws/aws-sdk-ios/issues/480)
    * Fixed a bug which did not set error object when bucket name is empty in request. [Github Issue #469](https://github.com/aws/aws-sdk-ios/issues/469)

## 2.4.9
### New Features
* **All Services**
    * Added support for Custom Endpoints.

### Resolved Issues
* **Amazon S3**
    * Fixed a bug which caused compilation errors when using SDK version 2.4.8 through CocoaPods.

### Misc. Updates
* **Amazon Mobile Analytics**
    * Deprecated the `mobileAnalyticsForAppId:identityPoolId:` and `mobileAnalyticsForAppId:identityPoolId:completionBlock:` client initializers. 

## 2.4.8
### New Features
* **Amazon Cognito Identity Provider**
    * Added feature for custom authentication handlers.
    * Added support for getDevice, forgetDevice and added convenience methods to perform operations on this device.

### Misc Changes
* **All Services**
    * Updated all of the low-level clients with the latest models.

## 2.4.7
### Resolved Issues
* **Amazon Cognito Identity Provider**
	* Fixed integration between Cognito Identity Provider and Cognito Identity. [#438](https://github.com/aws/aws-sdk-ios/issues/438)

## 2.4.6
### New Features  
* **SDK Core**
    * Added support for shared container identifier for extension support.
* **AWS Cognito Identity Provider**
    * Added support for devices in Cognito User Pools.
    * Added support for global sign out in Cognito User Pools.
    * Updated to support GA Cognito User Pools API's with exception of custom authentication. Custom authentication will be supported in a future release.
* **AWS S3**
    * Added userInfo to error objects in AWSS3TransferUtility.
* **Amazon SNS**
    * General service updates.

### Resolved Issues
* **Amazon Cognito Identity Provider**
    * Made providerId nullable in AWSCredentialProvider.
    * Fixed non-optional error parameter in Cognito User Pools.
    * Fixed issue causing resendConfirmationCode to return a null destination in Cognito User Pools.
* **Amazon S3**
    * Switched behavior from assert to throwing exception in AWSS3TransferUtility when response is not of class NSHTTPURLResponse type to avoid crashes.
* **Amazon Mobile Analytics**
    * Bug fix for [issue](https://github.com/aws/aws-sdk-ios/issues/409). Please refer to [this forum post](https://forums.aws.amazon.com/ann.jspa?annID=3935) for more details .
    
## 2.4.5
### New Features  
* **SDK Core**
	* Introducing new AWS region Asia Pacific (Mumbai) region, endpoint `ap-south-1`.     

### Resolved Issues
* **SDK Core**
    * Fixed a bug with response serialization to sometimes fail.

## 2.4.4
### New Features  
* **SDK Core**
    * Added SAML support for `Amazon Cognito Federated Identities`.     
### Resolved Issues
* **SDK Core**
    * Fixed a bug causing SDK to use legacy flow instead of enhanced flow when `IdentityProviderManager` is set.

## 2.4.3
### New Features  
* **Amazon S3**
    * Added support for Amazon S3 Transfer Acceleration in `AWSS3TransferUtility`.        

### Resolved Issues
* **Amazon S3**
    * Fixed the [issue](https://github.com/aws/aws-sdk-ios/issues/390) related to wrong error handling in AWSS3TransferUtility.

## 2.4.2
### New Features  
* **SDK Core**
    * Added a new init method for the Cognito Identity credentials provider.
    * Added full support for IPv6.
* **Amazon S3**
    * Added `requestHeaders` to `AWSS3PreSignedURLBuilder` and `AWSS3TransferUtility`. Now you can specify the headers to sign for pre-signed URLs.        
* **AWS IoT**
    * Added MQTT device shadow APIs to `AWSIoTDataManager` 
    * Added support in `AWSIoTDataManager` for message callbacks with mqtt client and topic parameters
* **All services**
    * Updated all of the low-level clients with the latest models.

### Resolved Issues
* **SDK Core**
    * Fixed `AWSCore.podspec` for the extobjc conflict.
    * Fixed the enhanced flow switch in the Cognito Identity credentials provider.
* **Amazon Cognito User Pools**
    * Fixed [issue](https://forums.aws.amazon.com/thread.jspa?threadID=230694&tstart=0) with sign-in in locales other than English not working.
    * Fixed [issue](https://github.com/aws/aws-sdk-ios/issues/373) with sign-in using aliases.
    * [Added ability to determine whether a user is signed in and clearing last known user](https://github.com/aws/aws-sdk-ios/issues/370).
    * Fixed [issue](https://github.com/aws/aws-sdk-ios/issues/383) causing user pool delegate to not be released 
* **Amazon Cognito Sync**
    * Serialize calls to synchronize and discard duplicate synchronize requests to prevent ResourceConflicts when syncing from one device.
    * Fixed issue with identity id being preserved when database was cleared.
    * [Correctly set datasets’s lastModified and creationDate](https://github.com/aws/aws-sdk-ios/issues/246).
* **Amazon Kinesis**
    * Fixed the threading issue in the Kinesis Recorder.
* **Amazon S3**
    * Fixed the response serialization issue when the response content type is HTML.
    

## 2.4.1

### New Features
* **Amazon S3**
    * **(Breaking)** `AWSS3TransferUtility` is generally available. Now you have access to the underlying `NSURLSessionTask`, `NSURLRequest` and `NSHTTPURLResponse`. The progress feedback block is updated to use `NSProgress`. Also, the error messages returned by Amazon S3 are correctly propagated as an `NSError`.
* **Amazon Cognito Identity Provider (Beta)**
    * Fixed the issue requiring password reentry with a valid refresh token.
    * The SDK retries for bad auth attempts.
    * **(Breaking)** Switched from blocks to delegates for interactive authentication. Set a class that conforms to the `AWSCognitoIdentityInteractiveAuthenticationDelegate` protocol as the delegate on `AWSCognitoIdentityUserPool`.
    * **(Breaking)** `- signUp:password:userAttributes:validationData:` on `AWSCognitoIdentityUserPool` returns an `AWSCognitoIdentityUserPoolSignUpResponse` containing the `AWSCognitoIdentityUser` instead of directly returning an `AWSCognitoIdentityUser`.

### Misc Changes
* **SDK Core**
    * Now the SDK fails fast to help identify an issue when you mix different versions of the `AWSCore` SDK and service client SDKs. You need to use the same version of the AWS Mobile SDKs within a project.
    * The AWS Signature related logs are moved from the `Debug` to `Verbose` level.

## 2.4.0

### New Features
* **SDK Core**
    * **(Breaking)** Migrated from the static frameworks to the dynamic frameworks. The AWS Mobile SDK for iOS now supports iOS 8 and above due to this change. If you need iOS 7 support, continue using 2.3.x.
    * Added official support for [Carthage](https://github.com/Carthage/Carthage). See `README.md` for more information.
    * Added support for the SDK configurations through `Info.plist`.
    * **(Breaking)** Updated the credentials provider and identity provider protocols to asynchronous interfaces instead of previous synchronous ones. The `logins` dictionary of `AWSCognitoCredentialsProvider` is now deprecated. Use `AWSIdentityProviderManager` to provide login providers' credentials. See `AWSCredentialsProvider.h` and `AWSIdentityProvider.h` for more details.
* **Amazon Cognito Identity Provider (Beta)**
    * You can now use Amazon Cognito to easily add user sign-up and sign-in to your mobile and web apps. Your User Pool in Amazon Cognito is a fully managed user directory that can scale to hundreds of millions of users, so you don't have to worry about building, securing, and scaling a solution to handle user management and authentication. See `AWSCognitoIdentityUserPool.h` for more details.
* **AWS IoT**
    * Added support for Amazon Cognito Identity with WebSocket connections, identity import, custom `Keep-Alive` and Last Will and Testament, and exponential back-off on reconnect.
* **Amazon DynamoDB**
    * Added the attribute name override capability to `AWSDynamoDBObjectMapper` by implementing `+ JSONKeyPathsByPropertyKey` in the model class.

### Resolved Issues
* **SDK Core**
    * Fixed an issue where Cognito Identity Id is not properly cleaned up under certain circumstances.
    * Improved the retry handling for certain throttling exceptions.
    * Fixed an AWS Signature Version 4 issue when there is an extra `/` at the end of the endpoint URL.
    * Fixed the `FMDatabasePoolDelegate` naming collision.
* **Amazon DynamoDB**
    * Fixed `- load:hashKey:rangeKey:` to return `nil` when the row does not exist.
* **Amazon Kinesis**
    * Patched an issue where `AWSKinesisRecorder` and `AWSFirehoseRecorder` may cause an infinite retry loop when the device is offline.
* **Amazon S3**
    * The SDK now invalidates the internal `NSURLSession` when `+ removeS3TransferUtilityForKey:` is called.
    * Fixed a memory issue for downloading a large object as an `NSData`.

### Misc Changes
* **SDK Core**
    * Changed the default logging level from `Error` to `Debug`.
* **Amazon Cognito Sync**
    * The source code for the Amazon Cognito Sync iOS client is now hosted in our [aws-sdk-ios](https://github.com/aws/aws-sdk-ios) repository instead of [amazon-cognito-ios](https://github.com/aws/amazon-cognito-ios). The AWS Mobile SDK for iOS is generally licensed under the Apache 2.0 License, with the Amazon Cognito Sync and Amazon Cognito Identity Provider subcomponents being licensed under the Amazon Software License. See `LICENSE`, `LICENSE.AMAZON`, and `LICENSE.APACHE` for more details.

## 2.3.6

### New Features
* **SDK Core**
    * Allows setting of `allowsCellularAccess` via `AWSNetworkingConfiguration`.
* **AWS Lambda**
    * Added `invoke` methods with completion handlers to `AWSLambdaInvoker`.

### Resolved Issues
* **SDK Core**
    * Fixed an issue that SDK does not return an error object for certain 4xx and 5xx exceptions.
    * Updated the API documentation to reflect the correct nullability annotations for some constructors.
    * Fixed an issue so that Twitter Fabric can properly initialize the AWS Mobile SDK for iOS.

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
