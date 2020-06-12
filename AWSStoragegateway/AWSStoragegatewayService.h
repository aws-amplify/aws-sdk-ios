//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSStoragegatewayModel.h"
#import "AWSStoragegatewayResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSStoragegateway
FOUNDATION_EXPORT NSString *const AWSStoragegatewaySDKVersion;

/**
 <fullname>AWS Storage Gateway Service</fullname><p>AWS Storage Gateway is the service that connects an on-premises software appliance with cloud-based storage to provide seamless and secure integration between an organization's on-premises IT environment and the AWS storage infrastructure. The service enables you to securely upload data to the AWS Cloud for cost effective backup and rapid disaster recovery.</p><p>Use the following links to get started using the <i>AWS Storage Gateway Service API Reference</i>:</p><ul><li><p><a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#AWSStorageGatewayHTTPRequestsHeaders">AWS Storage Gateway required request headers</a>: Describes the required headers that you must send with every POST request to AWS Storage Gateway.</p></li><li><p><a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#AWSStorageGatewaySigningRequests">Signing requests</a>: AWS Storage Gateway requires that you authenticate every request you send; this topic describes how sign such a request.</p></li><li><p><a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#APIErrorResponses">Error responses</a>: Provides reference information about AWS Storage Gateway errors.</p></li><li><p><a href="https://docs.aws.amazon.com/storagegateway/latest/APIReference/API_Operations.html">Operations in AWS Storage Gateway</a>: Contains detailed descriptions of all AWS Storage Gateway operations, their request parameters, response elements, possible errors, and examples of requests and responses.</p></li><li><p><a href="https://docs.aws.amazon.com/general/latest/gr/sg.html">AWS Storage Gateway endpoints and quotas:</a> Provides a list of each AWS Region and the endpoints available for use with AWS Storage Gateway.</p></li></ul><note><p>AWS Storage Gateway resource IDs are in uppercase. When you use these resource IDs with the Amazon EC2 API, EC2 expects resource IDs in lowercase. You must change your resource ID to lowercase to use it with the EC2 API. For example, in Storage Gateway the ID for a volume might be <code>vol-AA22BB012345DAF670</code>. When you use this ID with the EC2 API, you must change it to <code>vol-aa22bb012345daf670</code>. Otherwise, the EC2 API might not behave as expected.</p></note><important><p>IDs for Storage Gateway volumes and Amazon EBS snapshots created from gateway volumes are changing to a longer format. Starting in December 2016, all new volumes and snapshots will be created with a 17-character string. Starting in April 2016, you will be able to use these longer IDs so you can test your systems with the new format. For more information, see <a href="http://aws.amazon.com/ec2/faqs/#longer-ids">Longer EC2 and EBS resource IDs</a>.</p><p>For example, a volume Amazon Resource Name (ARN) with the longer volume ID format looks like the following:</p><p><code>arn:aws:storagegateway:us-west-2:111122223333:gateway/sgw-12A3456B/volume/vol-1122AABBCCDDEEFFG</code>.</p><p>A snapshot ID with the longer ID format looks like the following: <code>snap-78e226633445566ee</code>.</p><p>For more information, see <a href="http://forums.aws.amazon.com/ann.jspa?annID=3557">Announcement: Heads-up – Longer AWS Storage Gateway volume and snapshot IDs coming in 2016</a>.</p></important>
 */
@interface AWSStoragegateway : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let Storagegateway = AWSStoragegateway.default()

 *Objective-C*

     AWSStoragegateway *Storagegateway = [AWSStoragegateway defaultStoragegateway];

 @return The default service client.
 */
+ (instancetype)defaultStoragegateway;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSStoragegateway.register(with: configuration!, forKey: "USWest2Storagegateway")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:@"USWest2Storagegateway"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Storagegateway = AWSStoragegateway(forKey: "USWest2Storagegateway")

 *Objective-C*

     AWSStoragegateway *Storagegateway = [AWSStoragegateway StoragegatewayForKey:@"USWest2Storagegateway"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerStoragegatewayWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerStoragegatewayWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSStoragegateway.register(with: configuration!, forKey: "USWest2Storagegateway")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:@"USWest2Storagegateway"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Storagegateway = AWSStoragegateway(forKey: "USWest2Storagegateway")

 *Objective-C*

     AWSStoragegateway *Storagegateway = [AWSStoragegateway StoragegatewayForKey:@"USWest2Storagegateway"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)StoragegatewayForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeStoragegatewayForKey:(NSString *)key;

/**
 <p>Activates the gateway you previously deployed on your host. In the activation process, you specify information such as the AWS Region that you want to use for storing snapshots or tapes, the time zone for scheduled snapshots the gateway snapshot schedule window, an activation key, and a name for your gateway. The activation process also associates your gateway with your account. For more information, see <a>UpdateGatewayInformation</a>.</p><note><p>You must turn on the gateway VM before you can activate your gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the ActivateGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayActivateGatewayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayActivateGatewayInput
 @see AWSStoragegatewayActivateGatewayOutput
 */
- (AWSTask<AWSStoragegatewayActivateGatewayOutput *> *)activateGateway:(AWSStoragegatewayActivateGatewayInput *)request;

/**
 <p>Activates the gateway you previously deployed on your host. In the activation process, you specify information such as the AWS Region that you want to use for storing snapshots or tapes, the time zone for scheduled snapshots the gateway snapshot schedule window, an activation key, and a name for your gateway. The activation process also associates your gateway with your account. For more information, see <a>UpdateGatewayInformation</a>.</p><note><p>You must turn on the gateway VM before you can activate your gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the ActivateGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayActivateGatewayInput
 @see AWSStoragegatewayActivateGatewayOutput
 */
- (void)activateGateway:(AWSStoragegatewayActivateGatewayInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayActivateGatewayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures one or more gateway local disks as cache for a gateway. This operation is only supported in the cached volume, tape, and file gateway type (see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html">How AWS Storage Gateway works (architecture)</a>.</p><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add cache, and one or more disk IDs that you want to configure as cache.</p>
 
 @param request A container for the necessary parameters to execute the AddCache service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayAddCacheOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAddCacheInput
 @see AWSStoragegatewayAddCacheOutput
 */
- (AWSTask<AWSStoragegatewayAddCacheOutput *> *)addCache:(AWSStoragegatewayAddCacheInput *)request;

/**
 <p>Configures one or more gateway local disks as cache for a gateway. This operation is only supported in the cached volume, tape, and file gateway type (see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html">How AWS Storage Gateway works (architecture)</a>.</p><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add cache, and one or more disk IDs that you want to configure as cache.</p>
 
 @param request A container for the necessary parameters to execute the AddCache service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAddCacheInput
 @see AWSStoragegatewayAddCacheOutput
 */
- (void)addCache:(AWSStoragegatewayAddCacheInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayAddCacheOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to the specified resource. You use tags to add metadata to resources, which you can use to categorize these resources. For example, you can categorize resources by purpose, owner, environment, or team. Each tag consists of a key and a value, which you define. You can add tags to the following AWS Storage Gateway resources:</p><ul><li><p>Storage gateways of all types</p></li><li><p>Storage volumes</p></li><li><p>Virtual tapes</p></li><li><p>NFS and SMB file shares</p></li></ul><p>You can create a maximum of 50 tags for each resource. Virtual tapes and storage volumes that are recovered to a new gateway maintain their tags.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayAddTagsToResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAddTagsToResourceInput
 @see AWSStoragegatewayAddTagsToResourceOutput
 */
- (AWSTask<AWSStoragegatewayAddTagsToResourceOutput *> *)addTagsToResource:(AWSStoragegatewayAddTagsToResourceInput *)request;

/**
 <p>Adds one or more tags to the specified resource. You use tags to add metadata to resources, which you can use to categorize these resources. For example, you can categorize resources by purpose, owner, environment, or team. Each tag consists of a key and a value, which you define. You can add tags to the following AWS Storage Gateway resources:</p><ul><li><p>Storage gateways of all types</p></li><li><p>Storage volumes</p></li><li><p>Virtual tapes</p></li><li><p>NFS and SMB file shares</p></li></ul><p>You can create a maximum of 50 tags for each resource. Virtual tapes and storage volumes that are recovered to a new gateway maintain their tags.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAddTagsToResourceInput
 @see AWSStoragegatewayAddTagsToResourceOutput
 */
- (void)addTagsToResource:(AWSStoragegatewayAddTagsToResourceInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayAddTagsToResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures one or more gateway local disks as upload buffer for a specified gateway. This operation is supported for the stored volume, cached volume and tape gateway types.</p><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add upload buffer, and one or more disk IDs that you want to configure as upload buffer.</p>
 
 @param request A container for the necessary parameters to execute the AddUploadBuffer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayAddUploadBufferOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAddUploadBufferInput
 @see AWSStoragegatewayAddUploadBufferOutput
 */
- (AWSTask<AWSStoragegatewayAddUploadBufferOutput *> *)addUploadBuffer:(AWSStoragegatewayAddUploadBufferInput *)request;

/**
 <p>Configures one or more gateway local disks as upload buffer for a specified gateway. This operation is supported for the stored volume, cached volume and tape gateway types.</p><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add upload buffer, and one or more disk IDs that you want to configure as upload buffer.</p>
 
 @param request A container for the necessary parameters to execute the AddUploadBuffer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAddUploadBufferInput
 @see AWSStoragegatewayAddUploadBufferOutput
 */
- (void)addUploadBuffer:(AWSStoragegatewayAddUploadBufferInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayAddUploadBufferOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures one or more gateway local disks as working storage for a gateway. This operation is only supported in the stored volume gateway type. This operation is deprecated in cached volume API version 20120630. Use <a>AddUploadBuffer</a> instead.</p><note><p>Working storage is also referred to as upload buffer. You can also use the <a>AddUploadBuffer</a> operation to add upload buffer to a stored volume gateway.</p></note><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add working storage, and one or more disk IDs that you want to configure as working storage.</p>
 
 @param request A container for the necessary parameters to execute the AddWorkingStorage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayAddWorkingStorageOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAddWorkingStorageInput
 @see AWSStoragegatewayAddWorkingStorageOutput
 */
- (AWSTask<AWSStoragegatewayAddWorkingStorageOutput *> *)addWorkingStorage:(AWSStoragegatewayAddWorkingStorageInput *)request;

/**
 <p>Configures one or more gateway local disks as working storage for a gateway. This operation is only supported in the stored volume gateway type. This operation is deprecated in cached volume API version 20120630. Use <a>AddUploadBuffer</a> instead.</p><note><p>Working storage is also referred to as upload buffer. You can also use the <a>AddUploadBuffer</a> operation to add upload buffer to a stored volume gateway.</p></note><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add working storage, and one or more disk IDs that you want to configure as working storage.</p>
 
 @param request A container for the necessary parameters to execute the AddWorkingStorage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAddWorkingStorageInput
 @see AWSStoragegatewayAddWorkingStorageOutput
 */
- (void)addWorkingStorage:(AWSStoragegatewayAddWorkingStorageInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayAddWorkingStorageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns a tape to a tape pool for archiving. The tape assigned to a pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the S3 storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.</p><p>Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code></p>
 
 @param request A container for the necessary parameters to execute the AssignTapePool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayAssignTapePoolOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAssignTapePoolInput
 @see AWSStoragegatewayAssignTapePoolOutput
 */
- (AWSTask<AWSStoragegatewayAssignTapePoolOutput *> *)assignTapePool:(AWSStoragegatewayAssignTapePoolInput *)request;

/**
 <p>Assigns a tape to a tape pool for archiving. The tape assigned to a pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the S3 storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.</p><p>Valid Values: <code>GLACIER</code> | <code>DEEP_ARCHIVE</code></p>
 
 @param request A container for the necessary parameters to execute the AssignTapePool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAssignTapePoolInput
 @see AWSStoragegatewayAssignTapePoolOutput
 */
- (void)assignTapePool:(AWSStoragegatewayAssignTapePoolInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayAssignTapePoolOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Connects a volume to an iSCSI connection and then attaches the volume to the specified gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a different gateway without creating a snapshot. It also makes it easier to move your volumes from an on-premises gateway to a gateway hosted on an Amazon EC2 instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayAttachVolumeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAttachVolumeInput
 @see AWSStoragegatewayAttachVolumeOutput
 */
- (AWSTask<AWSStoragegatewayAttachVolumeOutput *> *)attachVolume:(AWSStoragegatewayAttachVolumeInput *)request;

/**
 <p>Connects a volume to an iSCSI connection and then attaches the volume to the specified gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a different gateway without creating a snapshot. It also makes it easier to move your volumes from an on-premises gateway to a gateway hosted on an Amazon EC2 instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayAttachVolumeInput
 @see AWSStoragegatewayAttachVolumeOutput
 */
- (void)attachVolume:(AWSStoragegatewayAttachVolumeInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayAttachVolumeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after the archiving process is initiated. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the CancelArchival service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayCancelArchivalOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCancelArchivalInput
 @see AWSStoragegatewayCancelArchivalOutput
 */
- (AWSTask<AWSStoragegatewayCancelArchivalOutput *> *)cancelArchival:(AWSStoragegatewayCancelArchivalInput *)request;

/**
 <p>Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after the archiving process is initiated. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the CancelArchival service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCancelArchivalInput
 @see AWSStoragegatewayCancelArchivalOutput
 */
- (void)cancelArchival:(AWSStoragegatewayCancelArchivalInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayCancelArchivalOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a gateway after the retrieval process is initiated. The virtual tape is returned to the VTS. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the CancelRetrieval service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayCancelRetrievalOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCancelRetrievalInput
 @see AWSStoragegatewayCancelRetrievalOutput
 */
- (AWSTask<AWSStoragegatewayCancelRetrievalOutput *> *)cancelRetrieval:(AWSStoragegatewayCancelRetrievalInput *)request;

/**
 <p>Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a gateway after the retrieval process is initiated. The virtual tape is returned to the VTS. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the CancelRetrieval service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCancelRetrievalInput
 @see AWSStoragegatewayCancelRetrievalOutput
 */
- (void)cancelRetrieval:(AWSStoragegatewayCancelRetrievalInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayCancelRetrievalOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a cached volume on a specified cached volume gateway. This operation is only supported in the cached volume gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create a cached volume. Use the <a>AddCache</a> operation to add cache storage to a gateway.</p></note><p>In the request, you must specify the gateway, size of the volume in bytes, the iSCSI target name, an IP address on which to expose the target, and a unique client token. In response, the gateway creates the volume and returns information about it. This information includes the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use to connect to the volume target.</p><p>Optionally, you can provide the ARN for an existing volume as the <code>SourceVolumeARN</code> for this cached volume, which creates an exact copy of the existing volume’s latest recovery point. The <code>VolumeSizeInBytes</code> value must be equal to or larger than the size of the copied volume, in bytes.</p>
 
 @param request A container for the necessary parameters to execute the CreateCachediSCSIVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayCreateCachediSCSIVolumeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateCachediSCSIVolumeInput
 @see AWSStoragegatewayCreateCachediSCSIVolumeOutput
 */
- (AWSTask<AWSStoragegatewayCreateCachediSCSIVolumeOutput *> *)createCachediSCSIVolume:(AWSStoragegatewayCreateCachediSCSIVolumeInput *)request;

/**
 <p>Creates a cached volume on a specified cached volume gateway. This operation is only supported in the cached volume gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create a cached volume. Use the <a>AddCache</a> operation to add cache storage to a gateway.</p></note><p>In the request, you must specify the gateway, size of the volume in bytes, the iSCSI target name, an IP address on which to expose the target, and a unique client token. In response, the gateway creates the volume and returns information about it. This information includes the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use to connect to the volume target.</p><p>Optionally, you can provide the ARN for an existing volume as the <code>SourceVolumeARN</code> for this cached volume, which creates an exact copy of the existing volume’s latest recovery point. The <code>VolumeSizeInBytes</code> value must be equal to or larger than the size of the copied volume, in bytes.</p>
 
 @param request A container for the necessary parameters to execute the CreateCachediSCSIVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateCachediSCSIVolumeInput
 @see AWSStoragegatewayCreateCachediSCSIVolumeOutput
 */
- (void)createCachediSCSIVolume:(AWSStoragegatewayCreateCachediSCSIVolumeInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayCreateCachediSCSIVolumeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Network File System (NFS) file share on an existing file gateway. In Storage Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway exposes file shares using an NFS interface. This operation is only supported for file gateways.</p><important><p>File gateway requires AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in the AWS Region, activate it. For information about how to activate AWS STS, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p><p>File gateway does not support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateNFSFileShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayCreateNFSFileShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateNFSFileShareInput
 @see AWSStoragegatewayCreateNFSFileShareOutput
 */
- (AWSTask<AWSStoragegatewayCreateNFSFileShareOutput *> *)createNFSFileShare:(AWSStoragegatewayCreateNFSFileShareInput *)request;

/**
 <p>Creates a Network File System (NFS) file share on an existing file gateway. In Storage Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway exposes file shares using an NFS interface. This operation is only supported for file gateways.</p><important><p>File gateway requires AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in the AWS Region, activate it. For information about how to activate AWS STS, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p><p>File gateway does not support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateNFSFileShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateNFSFileShareInput
 @see AWSStoragegatewayCreateNFSFileShareOutput
 */
- (void)createNFSFileShare:(AWSStoragegatewayCreateNFSFileShareInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayCreateNFSFileShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Server Message Block (SMB) file share on an existing file gateway. In Storage Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway expose file shares using an SMB interface. This operation is only supported for file gateways.</p><important><p>File gateways require AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure that AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in this AWS Region, activate it. For information about how to activate AWS STS, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p><p>File gateways don't support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateSMBFileShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayCreateSMBFileShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateSMBFileShareInput
 @see AWSStoragegatewayCreateSMBFileShareOutput
 */
- (AWSTask<AWSStoragegatewayCreateSMBFileShareOutput *> *)createSMBFileShare:(AWSStoragegatewayCreateSMBFileShareInput *)request;

/**
 <p>Creates a Server Message Block (SMB) file share on an existing file gateway. In Storage Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway expose file shares using an SMB interface. This operation is only supported for file gateways.</p><important><p>File gateways require AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure that AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in this AWS Region, activate it. For information about how to activate AWS STS, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p><p>File gateways don't support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateSMBFileShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateSMBFileShareInput
 @see AWSStoragegatewayCreateSMBFileShareOutput
 */
- (void)createSMBFileShare:(AWSStoragegatewayCreateSMBFileShareInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayCreateSMBFileShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a snapshot of a volume.</p><p>AWS Storage Gateway provides the ability to back up point-in-time snapshots of your data to Amazon Simple Storage (Amazon S3) for durable off-site recovery, as well as import the data to an Amazon Elastic Block Store (EBS) volume in Amazon Elastic Compute Cloud (EC2). You can take snapshots of your gateway volume on a scheduled or ad hoc basis. This API enables you to take ad-hoc snapshot. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#SchedulingSnapshot">Editing a snapshot schedule</a>.</p><p>In the CreateSnapshot request you identify the volume by providing its Amazon Resource Name (ARN). You must also provide description for the snapshot. When AWS Storage Gateway takes the snapshot of specified volume, the snapshot and description appears in the AWS Storage Gateway Console. In response, AWS Storage Gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or later use it when you want to create a volume from a snapshot. This operation is only supported in stored and cached volume gateway type.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a> or <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteSnapshot.html">DeleteSnapshot</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p></note><important><p>Volume and snapshot IDs are changing to a longer length ID format. For more information, see the important note on the <a href="https://docs.aws.amazon.com/storagegateway/latest/APIReference/Welcome.html">Welcome</a> page.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayCreateSnapshotOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`, `AWSStoragegatewayErrorServiceUnavailable`.
 
 @see AWSStoragegatewayCreateSnapshotInput
 @see AWSStoragegatewayCreateSnapshotOutput
 */
- (AWSTask<AWSStoragegatewayCreateSnapshotOutput *> *)createSnapshot:(AWSStoragegatewayCreateSnapshotInput *)request;

/**
 <p>Initiates a snapshot of a volume.</p><p>AWS Storage Gateway provides the ability to back up point-in-time snapshots of your data to Amazon Simple Storage (Amazon S3) for durable off-site recovery, as well as import the data to an Amazon Elastic Block Store (EBS) volume in Amazon Elastic Compute Cloud (EC2). You can take snapshots of your gateway volume on a scheduled or ad hoc basis. This API enables you to take ad-hoc snapshot. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#SchedulingSnapshot">Editing a snapshot schedule</a>.</p><p>In the CreateSnapshot request you identify the volume by providing its Amazon Resource Name (ARN). You must also provide description for the snapshot. When AWS Storage Gateway takes the snapshot of specified volume, the snapshot and description appears in the AWS Storage Gateway Console. In response, AWS Storage Gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or later use it when you want to create a volume from a snapshot. This operation is only supported in stored and cached volume gateway type.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a> or <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteSnapshot.html">DeleteSnapshot</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p></note><important><p>Volume and snapshot IDs are changing to a longer length ID format. For more information, see the important note on the <a href="https://docs.aws.amazon.com/storagegateway/latest/APIReference/Welcome.html">Welcome</a> page.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`, `AWSStoragegatewayErrorServiceUnavailable`.
 
 @see AWSStoragegatewayCreateSnapshotInput
 @see AWSStoragegatewayCreateSnapshotOutput
 */
- (void)createSnapshot:(AWSStoragegatewayCreateSnapshotInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayCreateSnapshotOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a snapshot of a gateway from a volume recovery point. This operation is only supported in the cached volume gateway type.</p><p>A volume recovery point is a point in time at which all data of the volume is consistent and from which you can create a snapshot. To get a list of volume recovery point for cached volume gateway, use <a>ListVolumeRecoveryPoints</a>.</p><p>In the <code>CreateSnapshotFromVolumeRecoveryPoint</code> request, you identify the volume by providing its Amazon Resource Name (ARN). You must also provide a description for the snapshot. When the gateway takes a snapshot of the specified volume, the snapshot and its description appear in the AWS Storage Gateway console. In response, the gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or later use it when you want to create a volume from a snapshot.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a> or <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteSnapshot.html">DeleteSnapshot</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateSnapshotFromVolumeRecoveryPoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`, `AWSStoragegatewayErrorServiceUnavailable`.
 
 @see AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput
 @see AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput
 */
- (AWSTask<AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput *> *)createSnapshotFromVolumeRecoveryPoint:(AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput *)request;

/**
 <p>Initiates a snapshot of a gateway from a volume recovery point. This operation is only supported in the cached volume gateway type.</p><p>A volume recovery point is a point in time at which all data of the volume is consistent and from which you can create a snapshot. To get a list of volume recovery point for cached volume gateway, use <a>ListVolumeRecoveryPoints</a>.</p><p>In the <code>CreateSnapshotFromVolumeRecoveryPoint</code> request, you identify the volume by providing its Amazon Resource Name (ARN). You must also provide a description for the snapshot. When the gateway takes a snapshot of the specified volume, the snapshot and its description appear in the AWS Storage Gateway console. In response, the gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or later use it when you want to create a volume from a snapshot.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a> or <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DeleteSnapshot.html">DeleteSnapshot</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateSnapshotFromVolumeRecoveryPoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`, `AWSStoragegatewayErrorServiceUnavailable`.
 
 @see AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput
 @see AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput
 */
- (void)createSnapshotFromVolumeRecoveryPoint:(AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a volume on a specified gateway. This operation is only supported in the stored volume gateway type.</p><p>The size of the volume to create is inferred from the disk size. You can choose to preserve existing data on the disk, create volume from an existing snapshot, or create an empty volume. If you choose to create an empty gateway volume, then any existing data on the disk is erased.</p><p>In the request you must specify the gateway and the disk information on which you are creating the volume. In response, the gateway creates the volume and returns volume information such as the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use to connect to the volume target.</p>
 
 @param request A container for the necessary parameters to execute the CreateStorediSCSIVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayCreateStorediSCSIVolumeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateStorediSCSIVolumeInput
 @see AWSStoragegatewayCreateStorediSCSIVolumeOutput
 */
- (AWSTask<AWSStoragegatewayCreateStorediSCSIVolumeOutput *> *)createStorediSCSIVolume:(AWSStoragegatewayCreateStorediSCSIVolumeInput *)request;

/**
 <p>Creates a volume on a specified gateway. This operation is only supported in the stored volume gateway type.</p><p>The size of the volume to create is inferred from the disk size. You can choose to preserve existing data on the disk, create volume from an existing snapshot, or create an empty volume. If you choose to create an empty gateway volume, then any existing data on the disk is erased.</p><p>In the request you must specify the gateway and the disk information on which you are creating the volume. In response, the gateway creates the volume and returns volume information such as the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use to connect to the volume target.</p>
 
 @param request A container for the necessary parameters to execute the CreateStorediSCSIVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateStorediSCSIVolumeInput
 @see AWSStoragegatewayCreateStorediSCSIVolumeOutput
 */
- (void)createStorediSCSIVolume:(AWSStoragegatewayCreateStorediSCSIVolumeInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayCreateStorediSCSIVolumeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a virtual tape by using your own barcode. You write data to the virtual tape and then archive the tape. A barcode is unique and can not be reused if it has already been used on a tape. This applies to barcodes used on deleted tapes. This operation is only supported in the tape gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create a virtual tape. Use the <a>AddCache</a> operation to add cache storage to a gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTapeWithBarcode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayCreateTapeWithBarcodeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateTapeWithBarcodeInput
 @see AWSStoragegatewayCreateTapeWithBarcodeOutput
 */
- (AWSTask<AWSStoragegatewayCreateTapeWithBarcodeOutput *> *)createTapeWithBarcode:(AWSStoragegatewayCreateTapeWithBarcodeInput *)request;

/**
 <p>Creates a virtual tape by using your own barcode. You write data to the virtual tape and then archive the tape. A barcode is unique and can not be reused if it has already been used on a tape. This applies to barcodes used on deleted tapes. This operation is only supported in the tape gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create a virtual tape. Use the <a>AddCache</a> operation to add cache storage to a gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTapeWithBarcode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateTapeWithBarcodeInput
 @see AWSStoragegatewayCreateTapeWithBarcodeOutput
 */
- (void)createTapeWithBarcode:(AWSStoragegatewayCreateTapeWithBarcodeInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayCreateTapeWithBarcodeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates one or more virtual tapes. You write data to the virtual tapes and then archive the tapes. This operation is only supported in the tape gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create virtual tapes. Use the <a>AddCache</a> operation to add cache storage to a gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTapes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayCreateTapesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateTapesInput
 @see AWSStoragegatewayCreateTapesOutput
 */
- (AWSTask<AWSStoragegatewayCreateTapesOutput *> *)createTapes:(AWSStoragegatewayCreateTapesInput *)request;

/**
 <p>Creates one or more virtual tapes. You write data to the virtual tapes and then archive the tapes. This operation is only supported in the tape gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create virtual tapes. Use the <a>AddCache</a> operation to add cache storage to a gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTapes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayCreateTapesInput
 @see AWSStoragegatewayCreateTapesOutput
 */
- (void)createTapes:(AWSStoragegatewayCreateTapesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayCreateTapesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the automatic tape creation policy of a gateway. If you delete this policy, new virtual tapes must be created manually. Use the Amazon Resource Name (ARN) of the gateway in your request to remove the policy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAutomaticTapeCreationPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput
 @see AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput
 */
- (AWSTask<AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput *> *)deleteAutomaticTapeCreationPolicy:(AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput *)request;

/**
 <p>Deletes the automatic tape creation policy of a gateway. If you delete this policy, new virtual tapes must be created manually. Use the Amazon Resource Name (ARN) of the gateway in your request to remove the policy.</p>
 
 @param request A container for the necessary parameters to execute the DeleteAutomaticTapeCreationPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput
 @see AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput
 */
- (void)deleteAutomaticTapeCreationPolicy:(AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the bandwidth rate limits of a gateway. You can delete either the upload and download bandwidth rate limit, or you can delete both. If you delete only one of the limits, the other limit remains unchanged. To specify which gateway to work with, use the Amazon Resource Name (ARN) of the gateway in your request. This operation is supported for the stored volume, cached volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBandwidthRateLimit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDeleteBandwidthRateLimitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteBandwidthRateLimitInput
 @see AWSStoragegatewayDeleteBandwidthRateLimitOutput
 */
- (AWSTask<AWSStoragegatewayDeleteBandwidthRateLimitOutput *> *)deleteBandwidthRateLimit:(AWSStoragegatewayDeleteBandwidthRateLimitInput *)request;

/**
 <p>Deletes the bandwidth rate limits of a gateway. You can delete either the upload and download bandwidth rate limit, or you can delete both. If you delete only one of the limits, the other limit remains unchanged. To specify which gateway to work with, use the Amazon Resource Name (ARN) of the gateway in your request. This operation is supported for the stored volume, cached volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBandwidthRateLimit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteBandwidthRateLimitInput
 @see AWSStoragegatewayDeleteBandwidthRateLimitOutput
 */
- (void)deleteBandwidthRateLimit:(AWSStoragegatewayDeleteBandwidthRateLimitInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDeleteBandwidthRateLimitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target and initiator pair. This operation is supported in volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DeleteChapCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDeleteChapCredentialsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteChapCredentialsInput
 @see AWSStoragegatewayDeleteChapCredentialsOutput
 */
- (AWSTask<AWSStoragegatewayDeleteChapCredentialsOutput *> *)deleteChapCredentials:(AWSStoragegatewayDeleteChapCredentialsInput *)request;

/**
 <p>Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target and initiator pair. This operation is supported in volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DeleteChapCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteChapCredentialsInput
 @see AWSStoragegatewayDeleteChapCredentialsOutput
 */
- (void)deleteChapCredentials:(AWSStoragegatewayDeleteChapCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDeleteChapCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a file share from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFileShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDeleteFileShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteFileShareInput
 @see AWSStoragegatewayDeleteFileShareOutput
 */
- (AWSTask<AWSStoragegatewayDeleteFileShareOutput *> *)deleteFileShare:(AWSStoragegatewayDeleteFileShareInput *)request;

/**
 <p>Deletes a file share from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFileShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteFileShareInput
 @see AWSStoragegatewayDeleteFileShareOutput
 */
- (void)deleteFileShare:(AWSStoragegatewayDeleteFileShareInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDeleteFileShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a gateway. To specify which gateway to delete, use the Amazon Resource Name (ARN) of the gateway in your request. The operation deletes the gateway; however, it does not delete the gateway virtual machine (VM) from your host computer.</p><p>After you delete a gateway, you cannot reactivate it. Completed snapshots of the gateway volumes are not deleted upon deleting the gateway, however, pending snapshots will not complete. After you delete a gateway, your next step is to remove it from your environment.</p><important><p>You no longer pay software charges after the gateway is deleted; however, your existing Amazon EBS snapshots persist and you will continue to be billed for these snapshots. You can choose to remove all remaining Amazon EBS snapshots by canceling your Amazon EC2 subscription.  If you prefer not to cancel your Amazon EC2 subscription, you can delete your snapshots using the Amazon EC2 console. For more information, see the <a href="http://aws.amazon.com/storagegateway">AWS Storage Gateway detail page</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the DeleteGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDeleteGatewayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteGatewayInput
 @see AWSStoragegatewayDeleteGatewayOutput
 */
- (AWSTask<AWSStoragegatewayDeleteGatewayOutput *> *)deleteGateway:(AWSStoragegatewayDeleteGatewayInput *)request;

/**
 <p>Deletes a gateway. To specify which gateway to delete, use the Amazon Resource Name (ARN) of the gateway in your request. The operation deletes the gateway; however, it does not delete the gateway virtual machine (VM) from your host computer.</p><p>After you delete a gateway, you cannot reactivate it. Completed snapshots of the gateway volumes are not deleted upon deleting the gateway, however, pending snapshots will not complete. After you delete a gateway, your next step is to remove it from your environment.</p><important><p>You no longer pay software charges after the gateway is deleted; however, your existing Amazon EBS snapshots persist and you will continue to be billed for these snapshots. You can choose to remove all remaining Amazon EBS snapshots by canceling your Amazon EC2 subscription.  If you prefer not to cancel your Amazon EC2 subscription, you can delete your snapshots using the Amazon EC2 console. For more information, see the <a href="http://aws.amazon.com/storagegateway">AWS Storage Gateway detail page</a>.</p></important>
 
 @param request A container for the necessary parameters to execute the DeleteGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteGatewayInput
 @see AWSStoragegatewayDeleteGatewayOutput
 */
- (void)deleteGateway:(AWSStoragegatewayDeleteGatewayInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDeleteGatewayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a snapshot of a volume.</p><p>You can take snapshots of your gateway volumes on a scheduled or ad hoc basis. This API action enables you to delete a snapshot schedule for a volume. For more information, see <a href="https://docs.aws.amazon.com/storagegatewaylatest/userguide/backing-up-volumes.html">Backing up your volumes</a>. In the <code>DeleteSnapshotSchedule</code> request, you identify the volume by providing its Amazon Resource Name (ARN). This operation is only supported in stored and cached volume gateway types.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, go to <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshotSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDeleteSnapshotScheduleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteSnapshotScheduleInput
 @see AWSStoragegatewayDeleteSnapshotScheduleOutput
 */
- (AWSTask<AWSStoragegatewayDeleteSnapshotScheduleOutput *> *)deleteSnapshotSchedule:(AWSStoragegatewayDeleteSnapshotScheduleInput *)request;

/**
 <p>Deletes a snapshot of a volume.</p><p>You can take snapshots of your gateway volumes on a scheduled or ad hoc basis. This API action enables you to delete a snapshot schedule for a volume. For more information, see <a href="https://docs.aws.amazon.com/storagegatewaylatest/userguide/backing-up-volumes.html">Backing up your volumes</a>. In the <code>DeleteSnapshotSchedule</code> request, you identify the volume by providing its Amazon Resource Name (ARN). This operation is only supported in stored and cached volume gateway types.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, go to <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshotSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteSnapshotScheduleInput
 @see AWSStoragegatewayDeleteSnapshotScheduleOutput
 */
- (void)deleteSnapshotSchedule:(AWSStoragegatewayDeleteSnapshotScheduleInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDeleteSnapshotScheduleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified virtual tape. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTape service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDeleteTapeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteTapeInput
 @see AWSStoragegatewayDeleteTapeOutput
 */
- (AWSTask<AWSStoragegatewayDeleteTapeOutput *> *)deleteTape:(AWSStoragegatewayDeleteTapeInput *)request;

/**
 <p>Deletes the specified virtual tape. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTape service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteTapeInput
 @see AWSStoragegatewayDeleteTapeOutput
 */
- (void)deleteTape:(AWSStoragegatewayDeleteTapeInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDeleteTapeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified virtual tape from the virtual tape shelf (VTS). This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTapeArchive service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDeleteTapeArchiveOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteTapeArchiveInput
 @see AWSStoragegatewayDeleteTapeArchiveOutput
 */
- (AWSTask<AWSStoragegatewayDeleteTapeArchiveOutput *> *)deleteTapeArchive:(AWSStoragegatewayDeleteTapeArchiveInput *)request;

/**
 <p>Deletes the specified virtual tape from the virtual tape shelf (VTS). This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTapeArchive service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteTapeArchiveInput
 @see AWSStoragegatewayDeleteTapeArchiveOutput
 */
- (void)deleteTapeArchive:(AWSStoragegatewayDeleteTapeArchiveInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDeleteTapeArchiveOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified storage volume that you previously created using the <a>CreateCachediSCSIVolume</a> or <a>CreateStorediSCSIVolume</a> API. This operation is only supported in the cached volume and stored volume types. For stored volume gateways, the local disk that was configured as the storage volume is not deleted. You can reuse the local disk to create another storage volume.</p><p>Before you delete a volume, make sure there are no iSCSI connections to the volume you are deleting. You should also make sure there is no snapshot in progress. You can use the Amazon Elastic Compute Cloud (Amazon EC2) API to query snapshots on the volume you are deleting and check the snapshot status. For more information, go to <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html">DescribeSnapshots</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p><p>In the request, you must provide the Amazon Resource Name (ARN) of the storage volume you want to delete.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDeleteVolumeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteVolumeInput
 @see AWSStoragegatewayDeleteVolumeOutput
 */
- (AWSTask<AWSStoragegatewayDeleteVolumeOutput *> *)deleteVolume:(AWSStoragegatewayDeleteVolumeInput *)request;

/**
 <p>Deletes the specified storage volume that you previously created using the <a>CreateCachediSCSIVolume</a> or <a>CreateStorediSCSIVolume</a> API. This operation is only supported in the cached volume and stored volume types. For stored volume gateways, the local disk that was configured as the storage volume is not deleted. You can reuse the local disk to create another storage volume.</p><p>Before you delete a volume, make sure there are no iSCSI connections to the volume you are deleting. You should also make sure there is no snapshot in progress. You can use the Amazon Elastic Compute Cloud (Amazon EC2) API to query snapshots on the volume you are deleting and check the snapshot status. For more information, go to <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html">DescribeSnapshots</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p><p>In the request, you must provide the Amazon Resource Name (ARN) of the storage volume you want to delete.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDeleteVolumeInput
 @see AWSStoragegatewayDeleteVolumeOutput
 */
- (void)deleteVolume:(AWSStoragegatewayDeleteVolumeInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDeleteVolumeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the most recent High Availability monitoring test that was performed on the host in a cluster. If a test isn't performed, the status and start time in the response would be null.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailabilityMonitorTest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeAvailabilityMonitorTestOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeAvailabilityMonitorTestInput
 @see AWSStoragegatewayDescribeAvailabilityMonitorTestOutput
 */
- (AWSTask<AWSStoragegatewayDescribeAvailabilityMonitorTestOutput *> *)describeAvailabilityMonitorTest:(AWSStoragegatewayDescribeAvailabilityMonitorTestInput *)request;

/**
 <p>Returns information about the most recent High Availability monitoring test that was performed on the host in a cluster. If a test isn't performed, the status and start time in the response would be null.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailabilityMonitorTest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeAvailabilityMonitorTestInput
 @see AWSStoragegatewayDescribeAvailabilityMonitorTestOutput
 */
- (void)describeAvailabilityMonitorTest:(AWSStoragegatewayDescribeAvailabilityMonitorTestInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeAvailabilityMonitorTestOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the bandwidth rate limits of a gateway. By default, these limits are not set, which means no bandwidth rate limiting is in effect. This operation is supported for the stored volume, cached volume and tape gateway types.</p><p>This operation only returns a value for a bandwidth rate limit only if the limit is set. If no limits are set for the gateway, then this operation returns only the gateway ARN in the response body. To specify which gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBandwidthRateLimit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeBandwidthRateLimitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeBandwidthRateLimitInput
 @see AWSStoragegatewayDescribeBandwidthRateLimitOutput
 */
- (AWSTask<AWSStoragegatewayDescribeBandwidthRateLimitOutput *> *)describeBandwidthRateLimit:(AWSStoragegatewayDescribeBandwidthRateLimitInput *)request;

/**
 <p>Returns the bandwidth rate limits of a gateway. By default, these limits are not set, which means no bandwidth rate limiting is in effect. This operation is supported for the stored volume, cached volume and tape gateway types.</p><p>This operation only returns a value for a bandwidth rate limit only if the limit is set. If no limits are set for the gateway, then this operation returns only the gateway ARN in the response body. To specify which gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBandwidthRateLimit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeBandwidthRateLimitInput
 @see AWSStoragegatewayDescribeBandwidthRateLimitOutput
 */
- (void)describeBandwidthRateLimit:(AWSStoragegatewayDescribeBandwidthRateLimitInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeBandwidthRateLimitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the cache of a gateway. This operation is only supported in the cached volume, tape, and file gateway types.</p><p>The response includes disk IDs that are configured as cache, and it includes the amount of cache allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCache service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeCacheOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeCacheInput
 @see AWSStoragegatewayDescribeCacheOutput
 */
- (AWSTask<AWSStoragegatewayDescribeCacheOutput *> *)describeCache:(AWSStoragegatewayDescribeCacheInput *)request;

/**
 <p>Returns information about the cache of a gateway. This operation is only supported in the cached volume, tape, and file gateway types.</p><p>The response includes disk IDs that are configured as cache, and it includes the amount of cache allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCache service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeCacheInput
 @see AWSStoragegatewayDescribeCacheOutput
 */
- (void)describeCache:(AWSStoragegatewayDescribeCacheInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeCacheOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the gateway volumes specified in the request. This operation is only supported in the cached volume gateway types.</p><p>The list of gateway volumes in the request must be from one gateway. In the response, AWS Storage Gateway returns volume information sorted by volume Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the DescribeCachediSCSIVolumes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeCachediSCSIVolumesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeCachediSCSIVolumesInput
 @see AWSStoragegatewayDescribeCachediSCSIVolumesOutput
 */
- (AWSTask<AWSStoragegatewayDescribeCachediSCSIVolumesOutput *> *)describeCachediSCSIVolumes:(AWSStoragegatewayDescribeCachediSCSIVolumesInput *)request;

/**
 <p>Returns a description of the gateway volumes specified in the request. This operation is only supported in the cached volume gateway types.</p><p>The list of gateway volumes in the request must be from one gateway. In the response, AWS Storage Gateway returns volume information sorted by volume Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the DescribeCachediSCSIVolumes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeCachediSCSIVolumesInput
 @see AWSStoragegatewayDescribeCachediSCSIVolumesOutput
 */
- (void)describeCachediSCSIVolumes:(AWSStoragegatewayDescribeCachediSCSIVolumesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeCachediSCSIVolumesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of Challenge-Handshake Authentication Protocol (CHAP) credentials information for a specified iSCSI target, one for each target-initiator pair. This operation is supported in the volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DescribeChapCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeChapCredentialsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeChapCredentialsInput
 @see AWSStoragegatewayDescribeChapCredentialsOutput
 */
- (AWSTask<AWSStoragegatewayDescribeChapCredentialsOutput *> *)describeChapCredentials:(AWSStoragegatewayDescribeChapCredentialsInput *)request;

/**
 <p>Returns an array of Challenge-Handshake Authentication Protocol (CHAP) credentials information for a specified iSCSI target, one for each target-initiator pair. This operation is supported in the volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DescribeChapCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeChapCredentialsInput
 @see AWSStoragegatewayDescribeChapCredentialsOutput
 */
- (void)describeChapCredentials:(AWSStoragegatewayDescribeChapCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeChapCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata about a gateway such as its name, network interfaces, configured time zone, and the state (whether the gateway is running or not). To specify which gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGatewayInformation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeGatewayInformationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeGatewayInformationInput
 @see AWSStoragegatewayDescribeGatewayInformationOutput
 */
- (AWSTask<AWSStoragegatewayDescribeGatewayInformationOutput *> *)describeGatewayInformation:(AWSStoragegatewayDescribeGatewayInformationInput *)request;

/**
 <p>Returns metadata about a gateway such as its name, network interfaces, configured time zone, and the state (whether the gateway is running or not). To specify which gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGatewayInformation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeGatewayInformationInput
 @see AWSStoragegatewayDescribeGatewayInformationOutput
 */
- (void)describeGatewayInformation:(AWSStoragegatewayDescribeGatewayInformationInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeGatewayInformationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns your gateway's weekly maintenance start time including the day and time of the week. Note that values are in terms of the gateway's time zone.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceStartTime service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeMaintenanceStartTimeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeMaintenanceStartTimeInput
 @see AWSStoragegatewayDescribeMaintenanceStartTimeOutput
 */
- (AWSTask<AWSStoragegatewayDescribeMaintenanceStartTimeOutput *> *)describeMaintenanceStartTime:(AWSStoragegatewayDescribeMaintenanceStartTimeInput *)request;

/**
 <p>Returns your gateway's weekly maintenance start time including the day and time of the week. Note that values are in terms of the gateway's time zone.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceStartTime service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeMaintenanceStartTimeInput
 @see AWSStoragegatewayDescribeMaintenanceStartTimeOutput
 */
- (void)describeMaintenanceStartTime:(AWSStoragegatewayDescribeMaintenanceStartTimeInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeMaintenanceStartTimeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a description for one or more Network File System (NFS) file shares from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNFSFileShares service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeNFSFileSharesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeNFSFileSharesInput
 @see AWSStoragegatewayDescribeNFSFileSharesOutput
 */
- (AWSTask<AWSStoragegatewayDescribeNFSFileSharesOutput *> *)describeNFSFileShares:(AWSStoragegatewayDescribeNFSFileSharesInput *)request;

/**
 <p>Gets a description for one or more Network File System (NFS) file shares from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNFSFileShares service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeNFSFileSharesInput
 @see AWSStoragegatewayDescribeNFSFileSharesOutput
 */
- (void)describeNFSFileShares:(AWSStoragegatewayDescribeNFSFileSharesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeNFSFileSharesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a description for one or more Server Message Block (SMB) file shares from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSMBFileShares service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeSMBFileSharesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeSMBFileSharesInput
 @see AWSStoragegatewayDescribeSMBFileSharesOutput
 */
- (AWSTask<AWSStoragegatewayDescribeSMBFileSharesOutput *> *)describeSMBFileShares:(AWSStoragegatewayDescribeSMBFileSharesInput *)request;

/**
 <p>Gets a description for one or more Server Message Block (SMB) file shares from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSMBFileShares service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeSMBFileSharesInput
 @see AWSStoragegatewayDescribeSMBFileSharesOutput
 */
- (void)describeSMBFileShares:(AWSStoragegatewayDescribeSMBFileSharesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeSMBFileSharesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a description of a Server Message Block (SMB) file share settings from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSMBSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeSMBSettingsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeSMBSettingsInput
 @see AWSStoragegatewayDescribeSMBSettingsOutput
 */
- (AWSTask<AWSStoragegatewayDescribeSMBSettingsOutput *> *)describeSMBSettings:(AWSStoragegatewayDescribeSMBSettingsInput *)request;

/**
 <p>Gets a description of a Server Message Block (SMB) file share settings from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSMBSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeSMBSettingsInput
 @see AWSStoragegatewayDescribeSMBSettingsOutput
 */
- (void)describeSMBSettings:(AWSStoragegatewayDescribeSMBSettingsInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeSMBSettingsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the snapshot schedule for the specified gateway volume. The snapshot schedule information includes intervals at which snapshots are automatically initiated on the volume. This operation is only supported in the cached volume and stored volume types.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeSnapshotScheduleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeSnapshotScheduleInput
 @see AWSStoragegatewayDescribeSnapshotScheduleOutput
 */
- (AWSTask<AWSStoragegatewayDescribeSnapshotScheduleOutput *> *)describeSnapshotSchedule:(AWSStoragegatewayDescribeSnapshotScheduleInput *)request;

/**
 <p>Describes the snapshot schedule for the specified gateway volume. The snapshot schedule information includes intervals at which snapshots are automatically initiated on the volume. This operation is only supported in the cached volume and stored volume types.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeSnapshotScheduleInput
 @see AWSStoragegatewayDescribeSnapshotScheduleOutput
 */
- (void)describeSnapshotSchedule:(AWSStoragegatewayDescribeSnapshotScheduleInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeSnapshotScheduleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of the gateway volumes specified in the request. The list of gateway volumes in the request must be from one gateway. In the response, AWS Storage Gateway returns volume information sorted by volume ARNs. This operation is only supported in stored volume gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStorediSCSIVolumes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeStorediSCSIVolumesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeStorediSCSIVolumesInput
 @see AWSStoragegatewayDescribeStorediSCSIVolumesOutput
 */
- (AWSTask<AWSStoragegatewayDescribeStorediSCSIVolumesOutput *> *)describeStorediSCSIVolumes:(AWSStoragegatewayDescribeStorediSCSIVolumesInput *)request;

/**
 <p>Returns the description of the gateway volumes specified in the request. The list of gateway volumes in the request must be from one gateway. In the response, AWS Storage Gateway returns volume information sorted by volume ARNs. This operation is only supported in stored volume gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStorediSCSIVolumes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeStorediSCSIVolumesInput
 @see AWSStoragegatewayDescribeStorediSCSIVolumesOutput
 */
- (void)describeStorediSCSIVolumes:(AWSStoragegatewayDescribeStorediSCSIVolumesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeStorediSCSIVolumesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of specified virtual tapes in the virtual tape shelf (VTS). This operation is only supported in the tape gateway type.</p><p>If a specific <code>TapeARN</code> is not specified, AWS Storage Gateway returns a description of all virtual tapes found in the VTS associated with your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapeArchives service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeTapeArchivesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeTapeArchivesInput
 @see AWSStoragegatewayDescribeTapeArchivesOutput
 */
- (AWSTask<AWSStoragegatewayDescribeTapeArchivesOutput *> *)describeTapeArchives:(AWSStoragegatewayDescribeTapeArchivesInput *)request;

/**
 <p>Returns a description of specified virtual tapes in the virtual tape shelf (VTS). This operation is only supported in the tape gateway type.</p><p>If a specific <code>TapeARN</code> is not specified, AWS Storage Gateway returns a description of all virtual tapes found in the VTS associated with your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapeArchives service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeTapeArchivesInput
 @see AWSStoragegatewayDescribeTapeArchivesOutput
 */
- (void)describeTapeArchives:(AWSStoragegatewayDescribeTapeArchivesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeTapeArchivesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of virtual tape recovery points that are available for the specified tape gateway.</p><p>A recovery point is a point-in-time view of a virtual tape at which all the data on the virtual tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to a new gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapeRecoveryPoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeTapeRecoveryPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeTapeRecoveryPointsInput
 @see AWSStoragegatewayDescribeTapeRecoveryPointsOutput
 */
- (AWSTask<AWSStoragegatewayDescribeTapeRecoveryPointsOutput *> *)describeTapeRecoveryPoints:(AWSStoragegatewayDescribeTapeRecoveryPointsInput *)request;

/**
 <p>Returns a list of virtual tape recovery points that are available for the specified tape gateway.</p><p>A recovery point is a point-in-time view of a virtual tape at which all the data on the virtual tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to a new gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapeRecoveryPoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeTapeRecoveryPointsInput
 @see AWSStoragegatewayDescribeTapeRecoveryPointsOutput
 */
- (void)describeTapeRecoveryPoints:(AWSStoragegatewayDescribeTapeRecoveryPointsInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeTapeRecoveryPointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the specified Amazon Resource Name (ARN) of virtual tapes. If a <code>TapeARN</code> is not specified, returns a description of all virtual tapes associated with the specified gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeTapesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeTapesInput
 @see AWSStoragegatewayDescribeTapesOutput
 */
- (AWSTask<AWSStoragegatewayDescribeTapesOutput *> *)describeTapes:(AWSStoragegatewayDescribeTapesInput *)request;

/**
 <p>Returns a description of the specified Amazon Resource Name (ARN) of virtual tapes. If a <code>TapeARN</code> is not specified, returns a description of all virtual tapes associated with the specified gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeTapesInput
 @see AWSStoragegatewayDescribeTapesOutput
 */
- (void)describeTapes:(AWSStoragegatewayDescribeTapesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeTapesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the upload buffer of a gateway. This operation is supported for the stored volume, cached volume, and tape gateway types.</p><p>The response includes disk IDs that are configured as upload buffer space, and it includes the amount of upload buffer space allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUploadBuffer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeUploadBufferOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeUploadBufferInput
 @see AWSStoragegatewayDescribeUploadBufferOutput
 */
- (AWSTask<AWSStoragegatewayDescribeUploadBufferOutput *> *)describeUploadBuffer:(AWSStoragegatewayDescribeUploadBufferInput *)request;

/**
 <p>Returns information about the upload buffer of a gateway. This operation is supported for the stored volume, cached volume, and tape gateway types.</p><p>The response includes disk IDs that are configured as upload buffer space, and it includes the amount of upload buffer space allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUploadBuffer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeUploadBufferInput
 @see AWSStoragegatewayDescribeUploadBufferOutput
 */
- (void)describeUploadBuffer:(AWSStoragegatewayDescribeUploadBufferInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeUploadBufferOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of virtual tape library (VTL) devices for the specified tape gateway. In the response, AWS Storage Gateway returns VTL device information.</p><p>This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVTLDevices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeVTLDevicesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeVTLDevicesInput
 @see AWSStoragegatewayDescribeVTLDevicesOutput
 */
- (AWSTask<AWSStoragegatewayDescribeVTLDevicesOutput *> *)describeVTLDevices:(AWSStoragegatewayDescribeVTLDevicesInput *)request;

/**
 <p>Returns a description of virtual tape library (VTL) devices for the specified tape gateway. In the response, AWS Storage Gateway returns VTL device information.</p><p>This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVTLDevices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeVTLDevicesInput
 @see AWSStoragegatewayDescribeVTLDevicesOutput
 */
- (void)describeVTLDevices:(AWSStoragegatewayDescribeVTLDevicesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeVTLDevicesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the working storage of a gateway. This operation is only supported in the stored volumes gateway type. This operation is deprecated in cached volumes API version (20120630). Use DescribeUploadBuffer instead.</p><note><p>Working storage is also referred to as upload buffer. You can also use the DescribeUploadBuffer operation to add upload buffer to a stored volume gateway.</p></note><p>The response includes disk IDs that are configured as working storage, and it includes the amount of working storage allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeWorkingStorage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDescribeWorkingStorageOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeWorkingStorageInput
 @see AWSStoragegatewayDescribeWorkingStorageOutput
 */
- (AWSTask<AWSStoragegatewayDescribeWorkingStorageOutput *> *)describeWorkingStorage:(AWSStoragegatewayDescribeWorkingStorageInput *)request;

/**
 <p>Returns information about the working storage of a gateway. This operation is only supported in the stored volumes gateway type. This operation is deprecated in cached volumes API version (20120630). Use DescribeUploadBuffer instead.</p><note><p>Working storage is also referred to as upload buffer. You can also use the DescribeUploadBuffer operation to add upload buffer to a stored volume gateway.</p></note><p>The response includes disk IDs that are configured as working storage, and it includes the amount of working storage allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeWorkingStorage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDescribeWorkingStorageInput
 @see AWSStoragegatewayDescribeWorkingStorageOutput
 */
- (void)describeWorkingStorage:(AWSStoragegatewayDescribeWorkingStorageInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDescribeWorkingStorageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disconnects a volume from an iSCSI connection and then detaches the volume from the specified gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a different gateway without creating a snapshot. It also makes it easier to move your volumes from an on-premises gateway to a gateway hosted on an Amazon EC2 instance. This operation is only supported in the volume gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DetachVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDetachVolumeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDetachVolumeInput
 @see AWSStoragegatewayDetachVolumeOutput
 */
- (AWSTask<AWSStoragegatewayDetachVolumeOutput *> *)detachVolume:(AWSStoragegatewayDetachVolumeInput *)request;

/**
 <p>Disconnects a volume from an iSCSI connection and then detaches the volume from the specified gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a different gateway without creating a snapshot. It also makes it easier to move your volumes from an on-premises gateway to a gateway hosted on an Amazon EC2 instance. This operation is only supported in the volume gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DetachVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDetachVolumeInput
 @see AWSStoragegatewayDetachVolumeOutput
 */
- (void)detachVolume:(AWSStoragegatewayDetachVolumeInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDetachVolumeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables a tape gateway when the gateway is no longer functioning. For example, if your gateway VM is damaged, you can disable the gateway so you can recover virtual tapes.</p><p>Use this operation for a tape gateway that is not reachable or not functioning. This operation is only supported in the tape gateway type.</p><important><p>After a gateway is disabled, it cannot be enabled.</p></important>
 
 @param request A container for the necessary parameters to execute the DisableGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayDisableGatewayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDisableGatewayInput
 @see AWSStoragegatewayDisableGatewayOutput
 */
- (AWSTask<AWSStoragegatewayDisableGatewayOutput *> *)disableGateway:(AWSStoragegatewayDisableGatewayInput *)request;

/**
 <p>Disables a tape gateway when the gateway is no longer functioning. For example, if your gateway VM is damaged, you can disable the gateway so you can recover virtual tapes.</p><p>Use this operation for a tape gateway that is not reachable or not functioning. This operation is only supported in the tape gateway type.</p><important><p>After a gateway is disabled, it cannot be enabled.</p></important>
 
 @param request A container for the necessary parameters to execute the DisableGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayDisableGatewayInput
 @see AWSStoragegatewayDisableGatewayOutput
 */
- (void)disableGateway:(AWSStoragegatewayDisableGatewayInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayDisableGatewayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a file gateway to an Active Directory domain. This operation is only supported for file gateways that support the SMB file protocol.</p>
 
 @param request A container for the necessary parameters to execute the JoinDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayJoinDomainOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayJoinDomainInput
 @see AWSStoragegatewayJoinDomainOutput
 */
- (AWSTask<AWSStoragegatewayJoinDomainOutput *> *)joinDomain:(AWSStoragegatewayJoinDomainInput *)request;

/**
 <p>Adds a file gateway to an Active Directory domain. This operation is only supported for file gateways that support the SMB file protocol.</p>
 
 @param request A container for the necessary parameters to execute the JoinDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayJoinDomainInput
 @see AWSStoragegatewayJoinDomainOutput
 */
- (void)joinDomain:(AWSStoragegatewayJoinDomainInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayJoinDomainOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the automatic tape creation policies for a gateway. If there are no automatic tape creation policies for the gateway, it returns an empty list.</p><p>This operation is only supported for tape gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListAutomaticTapeCreationPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListAutomaticTapeCreationPoliciesInput
 @see AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput
 */
- (AWSTask<AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput *> *)listAutomaticTapeCreationPolicies:(AWSStoragegatewayListAutomaticTapeCreationPoliciesInput *)request;

/**
 <p>Lists the automatic tape creation policies for a gateway. If there are no automatic tape creation policies for the gateway, it returns an empty list.</p><p>This operation is only supported for tape gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListAutomaticTapeCreationPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListAutomaticTapeCreationPoliciesInput
 @see AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput
 */
- (void)listAutomaticTapeCreationPolicies:(AWSStoragegatewayListAutomaticTapeCreationPoliciesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the file shares for a specific file gateway, or the list of file shares that belong to the calling user account. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListFileShares service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayListFileSharesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListFileSharesInput
 @see AWSStoragegatewayListFileSharesOutput
 */
- (AWSTask<AWSStoragegatewayListFileSharesOutput *> *)listFileShares:(AWSStoragegatewayListFileSharesInput *)request;

/**
 <p>Gets a list of the file shares for a specific file gateway, or the list of file shares that belong to the calling user account. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListFileShares service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListFileSharesInput
 @see AWSStoragegatewayListFileSharesOutput
 */
- (void)listFileShares:(AWSStoragegatewayListFileSharesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayListFileSharesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists gateways owned by an AWS account in an AWS Region specified in the request. The returned list is ordered by gateway Amazon Resource Name (ARN).</p><p>By default, the operation returns a maximum of 100 gateways. This operation supports pagination that allows you to optionally reduce the number of gateways returned in a response.</p><p>If you have more gateways than are returned in a response (that is, the response returns only a truncated list of your gateways), the response contains a marker that you can specify in your next request to fetch the next page of gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayListGatewaysOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListGatewaysInput
 @see AWSStoragegatewayListGatewaysOutput
 */
- (AWSTask<AWSStoragegatewayListGatewaysOutput *> *)listGateways:(AWSStoragegatewayListGatewaysInput *)request;

/**
 <p>Lists gateways owned by an AWS account in an AWS Region specified in the request. The returned list is ordered by gateway Amazon Resource Name (ARN).</p><p>By default, the operation returns a maximum of 100 gateways. This operation supports pagination that allows you to optionally reduce the number of gateways returned in a response.</p><p>If you have more gateways than are returned in a response (that is, the response returns only a truncated list of your gateways), the response contains a marker that you can specify in your next request to fetch the next page of gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListGatewaysInput
 @see AWSStoragegatewayListGatewaysOutput
 */
- (void)listGateways:(AWSStoragegatewayListGatewaysInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayListGatewaysOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the gateway's local disks. To specify which gateway to describe, you use the Amazon Resource Name (ARN) of the gateway in the body of the request.</p><p>The request returns a list of all disks, specifying which are configured as working storage, cache storage, or stored volume or not configured at all. The response includes a <code>DiskStatus</code> field. This field can have a value of present (the disk is available to use), missing (the disk is no longer connected to the gateway), or mismatch (the disk node is occupied by a disk that has incorrect metadata or the disk content is corrupted).</p>
 
 @param request A container for the necessary parameters to execute the ListLocalDisks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayListLocalDisksOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListLocalDisksInput
 @see AWSStoragegatewayListLocalDisksOutput
 */
- (AWSTask<AWSStoragegatewayListLocalDisksOutput *> *)listLocalDisks:(AWSStoragegatewayListLocalDisksInput *)request;

/**
 <p>Returns a list of the gateway's local disks. To specify which gateway to describe, you use the Amazon Resource Name (ARN) of the gateway in the body of the request.</p><p>The request returns a list of all disks, specifying which are configured as working storage, cache storage, or stored volume or not configured at all. The response includes a <code>DiskStatus</code> field. This field can have a value of present (the disk is available to use), missing (the disk is no longer connected to the gateway), or mismatch (the disk node is occupied by a disk that has incorrect metadata or the disk content is corrupted).</p>
 
 @param request A container for the necessary parameters to execute the ListLocalDisks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListLocalDisksInput
 @see AWSStoragegatewayListLocalDisksOutput
 */
- (void)listLocalDisks:(AWSStoragegatewayListLocalDisksInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayListLocalDisksOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags that have been added to the specified resource. This operation is supported in storage gateways of all types.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayListTagsForResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListTagsForResourceInput
 @see AWSStoragegatewayListTagsForResourceOutput
 */
- (AWSTask<AWSStoragegatewayListTagsForResourceOutput *> *)listTagsForResource:(AWSStoragegatewayListTagsForResourceInput *)request;

/**
 <p>Lists the tags that have been added to the specified resource. This operation is supported in storage gateways of all types.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListTagsForResourceInput
 @see AWSStoragegatewayListTagsForResourceOutput
 */
- (void)listTagsForResource:(AWSStoragegatewayListTagsForResourceInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayListTagsForResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists virtual tapes in your virtual tape library (VTL) and your virtual tape shelf (VTS). You specify the tapes to list by specifying one or more tape Amazon Resource Names (ARNs). If you don't specify a tape ARN, the operation lists all virtual tapes in both your VTL and VTS.</p><p>This operation supports pagination. By default, the operation returns a maximum of up to 100 tapes. You can optionally specify the <code>Limit</code> parameter in the body to limit the number of tapes in the response. If the number of tapes returned in the response is truncated, the response includes a <code>Marker</code> element that you can use in your subsequent request to retrieve the next set of tapes. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the ListTapes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayListTapesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListTapesInput
 @see AWSStoragegatewayListTapesOutput
 */
- (AWSTask<AWSStoragegatewayListTapesOutput *> *)listTapes:(AWSStoragegatewayListTapesInput *)request;

/**
 <p>Lists virtual tapes in your virtual tape library (VTL) and your virtual tape shelf (VTS). You specify the tapes to list by specifying one or more tape Amazon Resource Names (ARNs). If you don't specify a tape ARN, the operation lists all virtual tapes in both your VTL and VTS.</p><p>This operation supports pagination. By default, the operation returns a maximum of up to 100 tapes. You can optionally specify the <code>Limit</code> parameter in the body to limit the number of tapes in the response. If the number of tapes returned in the response is truncated, the response includes a <code>Marker</code> element that you can use in your subsequent request to retrieve the next set of tapes. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the ListTapes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListTapesInput
 @see AWSStoragegatewayListTapesOutput
 */
- (void)listTapes:(AWSStoragegatewayListTapesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayListTapesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists iSCSI initiators that are connected to a volume. You can use this operation to determine whether a volume is being used or not. This operation is only supported in the cached volume and stored volume gateway types.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumeInitiators service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayListVolumeInitiatorsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListVolumeInitiatorsInput
 @see AWSStoragegatewayListVolumeInitiatorsOutput
 */
- (AWSTask<AWSStoragegatewayListVolumeInitiatorsOutput *> *)listVolumeInitiators:(AWSStoragegatewayListVolumeInitiatorsInput *)request;

/**
 <p>Lists iSCSI initiators that are connected to a volume. You can use this operation to determine whether a volume is being used or not. This operation is only supported in the cached volume and stored volume gateway types.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumeInitiators service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListVolumeInitiatorsInput
 @see AWSStoragegatewayListVolumeInitiatorsOutput
 */
- (void)listVolumeInitiators:(AWSStoragegatewayListVolumeInitiatorsInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayListVolumeInitiatorsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the recovery points for a specified gateway. This operation is only supported in the cached volume gateway type.</p><p>Each cache volume has one recovery point. A volume recovery point is a point in time at which all data of the volume is consistent and from which you can create a snapshot or clone a new cached volume from a source volume. To create a snapshot from a volume recovery point use the <a>CreateSnapshotFromVolumeRecoveryPoint</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumeRecoveryPoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayListVolumeRecoveryPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListVolumeRecoveryPointsInput
 @see AWSStoragegatewayListVolumeRecoveryPointsOutput
 */
- (AWSTask<AWSStoragegatewayListVolumeRecoveryPointsOutput *> *)listVolumeRecoveryPoints:(AWSStoragegatewayListVolumeRecoveryPointsInput *)request;

/**
 <p>Lists the recovery points for a specified gateway. This operation is only supported in the cached volume gateway type.</p><p>Each cache volume has one recovery point. A volume recovery point is a point in time at which all data of the volume is consistent and from which you can create a snapshot or clone a new cached volume from a source volume. To create a snapshot from a volume recovery point use the <a>CreateSnapshotFromVolumeRecoveryPoint</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumeRecoveryPoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListVolumeRecoveryPointsInput
 @see AWSStoragegatewayListVolumeRecoveryPointsOutput
 */
- (void)listVolumeRecoveryPoints:(AWSStoragegatewayListVolumeRecoveryPointsInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayListVolumeRecoveryPointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the iSCSI stored volumes of a gateway. Results are sorted by volume ARN. The response includes only the volume ARNs. If you want additional volume information, use the <a>DescribeStorediSCSIVolumes</a> or the <a>DescribeCachediSCSIVolumes</a> API.</p><p>The operation supports pagination. By default, the operation returns a maximum of up to 100 volumes. You can optionally specify the <code>Limit</code> field in the body to limit the number of volumes in the response. If the number of volumes returned in the response is truncated, the response includes a Marker field. You can use this Marker value in your subsequent request to retrieve the next set of volumes. This operation is only supported in the cached volume and stored volume gateway types.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayListVolumesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListVolumesInput
 @see AWSStoragegatewayListVolumesOutput
 */
- (AWSTask<AWSStoragegatewayListVolumesOutput *> *)listVolumes:(AWSStoragegatewayListVolumesInput *)request;

/**
 <p>Lists the iSCSI stored volumes of a gateway. Results are sorted by volume ARN. The response includes only the volume ARNs. If you want additional volume information, use the <a>DescribeStorediSCSIVolumes</a> or the <a>DescribeCachediSCSIVolumes</a> API.</p><p>The operation supports pagination. By default, the operation returns a maximum of up to 100 volumes. You can optionally specify the <code>Limit</code> field in the body to limit the number of volumes in the response. If the number of volumes returned in the response is truncated, the response includes a Marker field. You can use this Marker value in your subsequent request to retrieve the next set of volumes. This operation is only supported in the cached volume and stored volume gateway types.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayListVolumesInput
 @see AWSStoragegatewayListVolumesOutput
 */
- (void)listVolumes:(AWSStoragegatewayListVolumesInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayListVolumesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends you notification through CloudWatch Events when all files written to your file share have been uploaded to Amazon S3.</p><p>AWS Storage Gateway can send a notification through Amazon CloudWatch Events when all files written to your file share up to that point in time have been uploaded to Amazon S3. These files include files written to the file share up to the time that you make a request for notification. When the upload is done, Storage Gateway sends you notification through an Amazon CloudWatch Event. You can configure CloudWatch Events to send the notification through event targets such as Amazon SNS or AWS Lambda function. This operation is only supported for file gateways.</p><p>For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-upload-notification">Getting file upload notification</a> in the <i>AWS Storage Gateway User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the NotifyWhenUploaded service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayNotifyWhenUploadedOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayNotifyWhenUploadedInput
 @see AWSStoragegatewayNotifyWhenUploadedOutput
 */
- (AWSTask<AWSStoragegatewayNotifyWhenUploadedOutput *> *)notifyWhenUploaded:(AWSStoragegatewayNotifyWhenUploadedInput *)request;

/**
 <p>Sends you notification through CloudWatch Events when all files written to your file share have been uploaded to Amazon S3.</p><p>AWS Storage Gateway can send a notification through Amazon CloudWatch Events when all files written to your file share up to that point in time have been uploaded to Amazon S3. These files include files written to the file share up to the time that you make a request for notification. When the upload is done, Storage Gateway sends you notification through an Amazon CloudWatch Event. You can configure CloudWatch Events to send the notification through event targets such as Amazon SNS or AWS Lambda function. This operation is only supported for file gateways.</p><p>For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-upload-notification">Getting file upload notification</a> in the <i>AWS Storage Gateway User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the NotifyWhenUploaded service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayNotifyWhenUploadedInput
 @see AWSStoragegatewayNotifyWhenUploadedOutput
 */
- (void)notifyWhenUploaded:(AWSStoragegatewayNotifyWhenUploadedInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayNotifyWhenUploadedOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Refreshes the cache for the specified file share. This operation finds objects in the Amazon S3 bucket that were added, removed or replaced since the gateway last listed the bucket's contents and cached the results. This operation is only supported in the file gateway type. You can subscribe to be notified through an Amazon CloudWatch event when your RefreshCache operation completes. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting notified about file operations</a> in the <i>AWS Storage Gateway User Guide</i>.</p><p>When this API is called, it only initiates the refresh operation. When the API call completes and returns a success code, it doesn't necessarily mean that the file refresh has completed. You should use the refresh-complete notification to determine that the operation has completed before you check for new files on the gateway file share. You can subscribe to be notified through an CloudWatch event when your <code>RefreshCache</code> operation completes.</p><p>Throttle limit: This API is asynchronous so the gateway will accept no more than two refreshes at any time. We recommend using the refresh-complete CloudWatch event notification before issuing additional requests. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting notified about file operations</a> in the <i>AWS Storage Gateway User Guide</i>.</p><p>If you invoke the RefreshCache API when two requests are already being processed, any new request will cause an <code>InvalidGatewayRequestException</code> error because too many requests were sent to the server.</p><p>For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting notified about file operations</a> in the <i>AWS Storage Gateway User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RefreshCache service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayRefreshCacheOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayRefreshCacheInput
 @see AWSStoragegatewayRefreshCacheOutput
 */
- (AWSTask<AWSStoragegatewayRefreshCacheOutput *> *)refreshCache:(AWSStoragegatewayRefreshCacheInput *)request;

/**
 <p>Refreshes the cache for the specified file share. This operation finds objects in the Amazon S3 bucket that were added, removed or replaced since the gateway last listed the bucket's contents and cached the results. This operation is only supported in the file gateway type. You can subscribe to be notified through an Amazon CloudWatch event when your RefreshCache operation completes. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting notified about file operations</a> in the <i>AWS Storage Gateway User Guide</i>.</p><p>When this API is called, it only initiates the refresh operation. When the API call completes and returns a success code, it doesn't necessarily mean that the file refresh has completed. You should use the refresh-complete notification to determine that the operation has completed before you check for new files on the gateway file share. You can subscribe to be notified through an CloudWatch event when your <code>RefreshCache</code> operation completes.</p><p>Throttle limit: This API is asynchronous so the gateway will accept no more than two refreshes at any time. We recommend using the refresh-complete CloudWatch event notification before issuing additional requests. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting notified about file operations</a> in the <i>AWS Storage Gateway User Guide</i>.</p><p>If you invoke the RefreshCache API when two requests are already being processed, any new request will cause an <code>InvalidGatewayRequestException</code> error because too many requests were sent to the server.</p><p>For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting notified about file operations</a> in the <i>AWS Storage Gateway User Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the RefreshCache service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayRefreshCacheInput
 @see AWSStoragegatewayRefreshCacheOutput
 */
- (void)refreshCache:(AWSStoragegatewayRefreshCacheInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayRefreshCacheOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from the specified resource. This operation is supported in storage gateways of all types.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayRemoveTagsFromResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayRemoveTagsFromResourceInput
 @see AWSStoragegatewayRemoveTagsFromResourceOutput
 */
- (AWSTask<AWSStoragegatewayRemoveTagsFromResourceOutput *> *)removeTagsFromResource:(AWSStoragegatewayRemoveTagsFromResourceInput *)request;

/**
 <p>Removes one or more tags from the specified resource. This operation is supported in storage gateways of all types.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayRemoveTagsFromResourceInput
 @see AWSStoragegatewayRemoveTagsFromResourceOutput
 */
- (void)removeTagsFromResource:(AWSStoragegatewayRemoveTagsFromResourceInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayRemoveTagsFromResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets all cache disks that have encountered an error and makes the disks available for reconfiguration as cache storage. If your cache disk encounters an error, the gateway prevents read and write operations on virtual tapes in the gateway. For example, an error can occur when a disk is corrupted or removed from the gateway. When a cache is reset, the gateway loses its cache storage. At this point, you can reconfigure the disks as cache disks. This operation is only supported in the cached volume and tape types.</p><important><p>If the cache disk you are resetting contains data that has not been uploaded to Amazon S3 yet, that data can be lost. After you reset cache disks, there will be no configured cache disks left in the gateway, so you must configure at least one new cache disk for your gateway to function properly.</p></important>
 
 @param request A container for the necessary parameters to execute the ResetCache service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayResetCacheOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayResetCacheInput
 @see AWSStoragegatewayResetCacheOutput
 */
- (AWSTask<AWSStoragegatewayResetCacheOutput *> *)resetCache:(AWSStoragegatewayResetCacheInput *)request;

/**
 <p>Resets all cache disks that have encountered an error and makes the disks available for reconfiguration as cache storage. If your cache disk encounters an error, the gateway prevents read and write operations on virtual tapes in the gateway. For example, an error can occur when a disk is corrupted or removed from the gateway. When a cache is reset, the gateway loses its cache storage. At this point, you can reconfigure the disks as cache disks. This operation is only supported in the cached volume and tape types.</p><important><p>If the cache disk you are resetting contains data that has not been uploaded to Amazon S3 yet, that data can be lost. After you reset cache disks, there will be no configured cache disks left in the gateway, so you must configure at least one new cache disk for your gateway to function properly.</p></important>
 
 @param request A container for the necessary parameters to execute the ResetCache service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayResetCacheInput
 @see AWSStoragegatewayResetCacheOutput
 */
- (void)resetCache:(AWSStoragegatewayResetCacheInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayResetCacheOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a tape gateway. Virtual tapes archived in the VTS are not associated with any gateway. However after a tape is retrieved, it is associated with a gateway, even though it is also listed in the VTS, that is, archive. This operation is only supported in the tape gateway type.</p><p>Once a tape is successfully retrieved to a gateway, it cannot be retrieved again to another gateway. You must archive the tape again before you can retrieve it to another gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the RetrieveTapeArchive service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayRetrieveTapeArchiveOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayRetrieveTapeArchiveInput
 @see AWSStoragegatewayRetrieveTapeArchiveOutput
 */
- (AWSTask<AWSStoragegatewayRetrieveTapeArchiveOutput *> *)retrieveTapeArchive:(AWSStoragegatewayRetrieveTapeArchiveInput *)request;

/**
 <p>Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a tape gateway. Virtual tapes archived in the VTS are not associated with any gateway. However after a tape is retrieved, it is associated with a gateway, even though it is also listed in the VTS, that is, archive. This operation is only supported in the tape gateway type.</p><p>Once a tape is successfully retrieved to a gateway, it cannot be retrieved again to another gateway. You must archive the tape again before you can retrieve it to another gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the RetrieveTapeArchive service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayRetrieveTapeArchiveInput
 @see AWSStoragegatewayRetrieveTapeArchiveOutput
 */
- (void)retrieveTapeArchive:(AWSStoragegatewayRetrieveTapeArchiveInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayRetrieveTapeArchiveOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the recovery point for the specified virtual tape. This operation is only supported in the tape gateway type.</p><p>A recovery point is a point in time view of a virtual tape at which all the data on the tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to a new gateway.</p><note><p>The virtual tape can be retrieved to only one gateway. The retrieved tape is read-only. The virtual tape can be retrieved to only a tape gateway. There is no charge for retrieving recovery points.</p></note>
 
 @param request A container for the necessary parameters to execute the RetrieveTapeRecoveryPoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayRetrieveTapeRecoveryPointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayRetrieveTapeRecoveryPointInput
 @see AWSStoragegatewayRetrieveTapeRecoveryPointOutput
 */
- (AWSTask<AWSStoragegatewayRetrieveTapeRecoveryPointOutput *> *)retrieveTapeRecoveryPoint:(AWSStoragegatewayRetrieveTapeRecoveryPointInput *)request;

/**
 <p>Retrieves the recovery point for the specified virtual tape. This operation is only supported in the tape gateway type.</p><p>A recovery point is a point in time view of a virtual tape at which all the data on the tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to a new gateway.</p><note><p>The virtual tape can be retrieved to only one gateway. The retrieved tape is read-only. The virtual tape can be retrieved to only a tape gateway. There is no charge for retrieving recovery points.</p></note>
 
 @param request A container for the necessary parameters to execute the RetrieveTapeRecoveryPoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayRetrieveTapeRecoveryPointInput
 @see AWSStoragegatewayRetrieveTapeRecoveryPointOutput
 */
- (void)retrieveTapeRecoveryPoint:(AWSStoragegatewayRetrieveTapeRecoveryPointInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayRetrieveTapeRecoveryPointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the password for your VM local console. When you log in to the local console for the first time, you log in to the VM with the default credentials. We recommend that you set a new password. You don't need to know the default password to set a new password.</p>
 
 @param request A container for the necessary parameters to execute the SetLocalConsolePassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewaySetLocalConsolePasswordOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewaySetLocalConsolePasswordInput
 @see AWSStoragegatewaySetLocalConsolePasswordOutput
 */
- (AWSTask<AWSStoragegatewaySetLocalConsolePasswordOutput *> *)setLocalConsolePassword:(AWSStoragegatewaySetLocalConsolePasswordInput *)request;

/**
 <p>Sets the password for your VM local console. When you log in to the local console for the first time, you log in to the VM with the default credentials. We recommend that you set a new password. You don't need to know the default password to set a new password.</p>
 
 @param request A container for the necessary parameters to execute the SetLocalConsolePassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewaySetLocalConsolePasswordInput
 @see AWSStoragegatewaySetLocalConsolePasswordOutput
 */
- (void)setLocalConsolePassword:(AWSStoragegatewaySetLocalConsolePasswordInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewaySetLocalConsolePasswordOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the password for the guest user <code>smbguest</code>. The <code>smbguest</code> user is the user when the authentication method for the file share is set to <code>GuestAccess</code>.</p>
 
 @param request A container for the necessary parameters to execute the SetSMBGuestPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewaySetSMBGuestPasswordOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewaySetSMBGuestPasswordInput
 @see AWSStoragegatewaySetSMBGuestPasswordOutput
 */
- (AWSTask<AWSStoragegatewaySetSMBGuestPasswordOutput *> *)setSMBGuestPassword:(AWSStoragegatewaySetSMBGuestPasswordInput *)request;

/**
 <p>Sets the password for the guest user <code>smbguest</code>. The <code>smbguest</code> user is the user when the authentication method for the file share is set to <code>GuestAccess</code>.</p>
 
 @param request A container for the necessary parameters to execute the SetSMBGuestPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewaySetSMBGuestPasswordInput
 @see AWSStoragegatewaySetSMBGuestPasswordOutput
 */
- (void)setSMBGuestPassword:(AWSStoragegatewaySetSMBGuestPasswordInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewaySetSMBGuestPasswordOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Shuts down a gateway. To specify which gateway to shut down, use the Amazon Resource Name (ARN) of the gateway in the body of your request.</p><p>The operation shuts down the gateway service component running in the gateway's virtual machine (VM) and not the host VM.</p><note><p>If you want to shut down the VM, it is recommended that you first shut down the gateway component in the VM to avoid unpredictable conditions.</p></note><p>After the gateway is shutdown, you cannot call any other API except <a>StartGateway</a>, <a>DescribeGatewayInformation</a>, and <a>ListGateways</a>. For more information, see <a>ActivateGateway</a>. Your applications cannot read from or write to the gateway's storage volumes, and there are no snapshots taken.</p><note><p>When you make a shutdown request, you will get a <code>200 OK</code> success response immediately. However, it might take some time for the gateway to shut down. You can call the <a>DescribeGatewayInformation</a> API to check the status. For more information, see <a>ActivateGateway</a>.</p></note><p>If do not intend to use the gateway again, you must delete the gateway (using <a>DeleteGateway</a>) to no longer pay software charges associated with the gateway.</p>
 
 @param request A container for the necessary parameters to execute the ShutdownGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayShutdownGatewayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayShutdownGatewayInput
 @see AWSStoragegatewayShutdownGatewayOutput
 */
- (AWSTask<AWSStoragegatewayShutdownGatewayOutput *> *)shutdownGateway:(AWSStoragegatewayShutdownGatewayInput *)request;

/**
 <p>Shuts down a gateway. To specify which gateway to shut down, use the Amazon Resource Name (ARN) of the gateway in the body of your request.</p><p>The operation shuts down the gateway service component running in the gateway's virtual machine (VM) and not the host VM.</p><note><p>If you want to shut down the VM, it is recommended that you first shut down the gateway component in the VM to avoid unpredictable conditions.</p></note><p>After the gateway is shutdown, you cannot call any other API except <a>StartGateway</a>, <a>DescribeGatewayInformation</a>, and <a>ListGateways</a>. For more information, see <a>ActivateGateway</a>. Your applications cannot read from or write to the gateway's storage volumes, and there are no snapshots taken.</p><note><p>When you make a shutdown request, you will get a <code>200 OK</code> success response immediately. However, it might take some time for the gateway to shut down. You can call the <a>DescribeGatewayInformation</a> API to check the status. For more information, see <a>ActivateGateway</a>.</p></note><p>If do not intend to use the gateway again, you must delete the gateway (using <a>DeleteGateway</a>) to no longer pay software charges associated with the gateway.</p>
 
 @param request A container for the necessary parameters to execute the ShutdownGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayShutdownGatewayInput
 @see AWSStoragegatewayShutdownGatewayOutput
 */
- (void)shutdownGateway:(AWSStoragegatewayShutdownGatewayInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayShutdownGatewayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Start a test that verifies that the specified gateway is configured for High Availability monitoring in your host environment. This request only initiates the test and that a successful response only indicates that the test was started. It doesn't indicate that the test passed. For the status of the test, invoke the <code>DescribeAvailabilityMonitorTest</code> API.</p><note><p>Starting this test will cause your gateway to go offline for a brief period.</p></note>
 
 @param request A container for the necessary parameters to execute the StartAvailabilityMonitorTest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayStartAvailabilityMonitorTestOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayStartAvailabilityMonitorTestInput
 @see AWSStoragegatewayStartAvailabilityMonitorTestOutput
 */
- (AWSTask<AWSStoragegatewayStartAvailabilityMonitorTestOutput *> *)startAvailabilityMonitorTest:(AWSStoragegatewayStartAvailabilityMonitorTestInput *)request;

/**
 <p>Start a test that verifies that the specified gateway is configured for High Availability monitoring in your host environment. This request only initiates the test and that a successful response only indicates that the test was started. It doesn't indicate that the test passed. For the status of the test, invoke the <code>DescribeAvailabilityMonitorTest</code> API.</p><note><p>Starting this test will cause your gateway to go offline for a brief period.</p></note>
 
 @param request A container for the necessary parameters to execute the StartAvailabilityMonitorTest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayStartAvailabilityMonitorTestInput
 @see AWSStoragegatewayStartAvailabilityMonitorTestOutput
 */
- (void)startAvailabilityMonitorTest:(AWSStoragegatewayStartAvailabilityMonitorTestInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayStartAvailabilityMonitorTestOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a gateway that you previously shut down (see <a>ShutdownGateway</a>). After the gateway starts, you can then make other API calls, your applications can read from or write to the gateway's storage volumes and you will be able to take snapshot backups.</p><note><p>When you make a request, you will get a 200 OK success response immediately. However, it might take some time for the gateway to be ready. You should call <a>DescribeGatewayInformation</a> and check the status before making any additional API calls. For more information, see <a>ActivateGateway</a>.</p></note><p>To specify which gateway to start, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the StartGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayStartGatewayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayStartGatewayInput
 @see AWSStoragegatewayStartGatewayOutput
 */
- (AWSTask<AWSStoragegatewayStartGatewayOutput *> *)startGateway:(AWSStoragegatewayStartGatewayInput *)request;

/**
 <p>Starts a gateway that you previously shut down (see <a>ShutdownGateway</a>). After the gateway starts, you can then make other API calls, your applications can read from or write to the gateway's storage volumes and you will be able to take snapshot backups.</p><note><p>When you make a request, you will get a 200 OK success response immediately. However, it might take some time for the gateway to be ready. You should call <a>DescribeGatewayInformation</a> and check the status before making any additional API calls. For more information, see <a>ActivateGateway</a>.</p></note><p>To specify which gateway to start, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the StartGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayStartGatewayInput
 @see AWSStoragegatewayStartGatewayOutput
 */
- (void)startGateway:(AWSStoragegatewayStartGatewayInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayStartGatewayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the automatic tape creation policy of a gateway. Use this to update the policy with a new set of automatic tape creation rules. This is only supported for tape gateways.</p><p>By default, there is no automatic tape creation policy.</p><note><p>A gateway can have only one automatic tape creation policy.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateAutomaticTapeCreationPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput
 @see AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput
 */
- (AWSTask<AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput *> *)updateAutomaticTapeCreationPolicy:(AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput *)request;

/**
 <p>Updates the automatic tape creation policy of a gateway. Use this to update the policy with a new set of automatic tape creation rules. This is only supported for tape gateways.</p><p>By default, there is no automatic tape creation policy.</p><note><p>A gateway can have only one automatic tape creation policy.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateAutomaticTapeCreationPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput
 @see AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput
 */
- (void)updateAutomaticTapeCreationPolicy:(AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the bandwidth rate limits of a gateway. You can update both the upload and download bandwidth rate limit or specify only one of the two. If you don't set a bandwidth rate limit, the existing rate limit remains. This operation is supported for the stored volume, cached volume, and tape gateway types.</p><p>By default, a gateway's bandwidth rate limits are not set. If you don't set any limit, the gateway does not have any limitations on its bandwidth usage and could potentially use the maximum available bandwidth.</p><p>To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBandwidthRateLimit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateBandwidthRateLimitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateBandwidthRateLimitInput
 @see AWSStoragegatewayUpdateBandwidthRateLimitOutput
 */
- (AWSTask<AWSStoragegatewayUpdateBandwidthRateLimitOutput *> *)updateBandwidthRateLimit:(AWSStoragegatewayUpdateBandwidthRateLimitInput *)request;

/**
 <p>Updates the bandwidth rate limits of a gateway. You can update both the upload and download bandwidth rate limit or specify only one of the two. If you don't set a bandwidth rate limit, the existing rate limit remains. This operation is supported for the stored volume, cached volume, and tape gateway types.</p><p>By default, a gateway's bandwidth rate limits are not set. If you don't set any limit, the gateway does not have any limitations on its bandwidth usage and could potentially use the maximum available bandwidth.</p><p>To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBandwidthRateLimit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateBandwidthRateLimitInput
 @see AWSStoragegatewayUpdateBandwidthRateLimitOutput
 */
- (void)updateBandwidthRateLimit:(AWSStoragegatewayUpdateBandwidthRateLimitInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateBandwidthRateLimitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target. By default, a gateway does not have CHAP enabled; however, for added security, you might use it. This operation is supported in the volume and tape gateway types.</p><important><p>When you update CHAP credentials, all existing connections on the target are closed and initiators must reconnect with the new credentials.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateChapCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateChapCredentialsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateChapCredentialsInput
 @see AWSStoragegatewayUpdateChapCredentialsOutput
 */
- (AWSTask<AWSStoragegatewayUpdateChapCredentialsOutput *> *)updateChapCredentials:(AWSStoragegatewayUpdateChapCredentialsInput *)request;

/**
 <p>Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target. By default, a gateway does not have CHAP enabled; however, for added security, you might use it. This operation is supported in the volume and tape gateway types.</p><important><p>When you update CHAP credentials, all existing connections on the target are closed and initiators must reconnect with the new credentials.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateChapCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateChapCredentialsInput
 @see AWSStoragegatewayUpdateChapCredentialsOutput
 */
- (void)updateChapCredentials:(AWSStoragegatewayUpdateChapCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateChapCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a gateway's metadata, which includes the gateway's name and time zone. To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your request.</p><note><p>For Gateways activated after September 2, 2015, the gateway's ARN contains the gateway ID rather than the gateway name. However, changing the name of the gateway has no effect on the gateway's ARN.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateGatewayInformation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateGatewayInformationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateGatewayInformationInput
 @see AWSStoragegatewayUpdateGatewayInformationOutput
 */
- (AWSTask<AWSStoragegatewayUpdateGatewayInformationOutput *> *)updateGatewayInformation:(AWSStoragegatewayUpdateGatewayInformationInput *)request;

/**
 <p>Updates a gateway's metadata, which includes the gateway's name and time zone. To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your request.</p><note><p>For Gateways activated after September 2, 2015, the gateway's ARN contains the gateway ID rather than the gateway name. However, changing the name of the gateway has no effect on the gateway's ARN.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateGatewayInformation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateGatewayInformationInput
 @see AWSStoragegatewayUpdateGatewayInformationOutput
 */
- (void)updateGatewayInformation:(AWSStoragegatewayUpdateGatewayInformationInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateGatewayInformationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the gateway virtual machine (VM) software. The request immediately triggers the software update.</p><note><p>When you make this request, you get a <code>200 OK</code> success response immediately. However, it might take some time for the update to complete. You can call <a>DescribeGatewayInformation</a> to verify the gateway is in the <code>STATE_RUNNING</code> state.</p></note><important><p>A software update forces a system restart of your gateway. You can minimize the chance of any disruption to your applications by increasing your iSCSI Initiators' timeouts. For more information about increasing iSCSI Initiator timeouts for Windows and Linux, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorWindowsClient.html#CustomizeWindowsiSCSISettings">Customizing your Windows iSCSI settings</a> and <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorRedHatClient.html#CustomizeLinuxiSCSISettings">Customizing your Linux iSCSI settings</a>, respectively.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateGatewaySoftwareNow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateGatewaySoftwareNowOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateGatewaySoftwareNowInput
 @see AWSStoragegatewayUpdateGatewaySoftwareNowOutput
 */
- (AWSTask<AWSStoragegatewayUpdateGatewaySoftwareNowOutput *> *)updateGatewaySoftwareNow:(AWSStoragegatewayUpdateGatewaySoftwareNowInput *)request;

/**
 <p>Updates the gateway virtual machine (VM) software. The request immediately triggers the software update.</p><note><p>When you make this request, you get a <code>200 OK</code> success response immediately. However, it might take some time for the update to complete. You can call <a>DescribeGatewayInformation</a> to verify the gateway is in the <code>STATE_RUNNING</code> state.</p></note><important><p>A software update forces a system restart of your gateway. You can minimize the chance of any disruption to your applications by increasing your iSCSI Initiators' timeouts. For more information about increasing iSCSI Initiator timeouts for Windows and Linux, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorWindowsClient.html#CustomizeWindowsiSCSISettings">Customizing your Windows iSCSI settings</a> and <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorRedHatClient.html#CustomizeLinuxiSCSISettings">Customizing your Linux iSCSI settings</a>, respectively.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateGatewaySoftwareNow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateGatewaySoftwareNowInput
 @see AWSStoragegatewayUpdateGatewaySoftwareNowOutput
 */
- (void)updateGatewaySoftwareNow:(AWSStoragegatewayUpdateGatewaySoftwareNowInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateGatewaySoftwareNowOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a gateway's weekly maintenance start time information, including day and time of the week. The maintenance time is the time in your gateway's time zone.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceStartTime service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateMaintenanceStartTimeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateMaintenanceStartTimeInput
 @see AWSStoragegatewayUpdateMaintenanceStartTimeOutput
 */
- (AWSTask<AWSStoragegatewayUpdateMaintenanceStartTimeOutput *> *)updateMaintenanceStartTime:(AWSStoragegatewayUpdateMaintenanceStartTimeInput *)request;

/**
 <p>Updates a gateway's weekly maintenance start time information, including day and time of the week. The maintenance time is the time in your gateway's time zone.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceStartTime service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateMaintenanceStartTimeInput
 @see AWSStoragegatewayUpdateMaintenanceStartTimeOutput
 */
- (void)updateMaintenanceStartTime:(AWSStoragegatewayUpdateMaintenanceStartTimeInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateMaintenanceStartTimeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a Network File System (NFS) file share. This operation is only supported in the file gateway type.</p><note><p>To leave a file share field unchanged, set the corresponding input field to null.</p></note><p>Updates the following file share setting:</p><ul><li><p>Default storage class for your S3 bucket</p></li><li><p>Metadata defaults for your S3 bucket</p></li><li><p>Allowed NFS clients for your file share</p></li><li><p>Squash settings</p></li><li><p>Write status of your file share</p></li></ul><note><p>To leave a file share field unchanged, set the corresponding input field to null. This operation is only supported in file gateways.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateNFSFileShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateNFSFileShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateNFSFileShareInput
 @see AWSStoragegatewayUpdateNFSFileShareOutput
 */
- (AWSTask<AWSStoragegatewayUpdateNFSFileShareOutput *> *)updateNFSFileShare:(AWSStoragegatewayUpdateNFSFileShareInput *)request;

/**
 <p>Updates a Network File System (NFS) file share. This operation is only supported in the file gateway type.</p><note><p>To leave a file share field unchanged, set the corresponding input field to null.</p></note><p>Updates the following file share setting:</p><ul><li><p>Default storage class for your S3 bucket</p></li><li><p>Metadata defaults for your S3 bucket</p></li><li><p>Allowed NFS clients for your file share</p></li><li><p>Squash settings</p></li><li><p>Write status of your file share</p></li></ul><note><p>To leave a file share field unchanged, set the corresponding input field to null. This operation is only supported in file gateways.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateNFSFileShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateNFSFileShareInput
 @see AWSStoragegatewayUpdateNFSFileShareOutput
 */
- (void)updateNFSFileShare:(AWSStoragegatewayUpdateNFSFileShareInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateNFSFileShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a Server Message Block (SMB) file share.</p><note><p>To leave a file share field unchanged, set the corresponding input field to null. This operation is only supported for file gateways.</p></note><important><p>File gateways require AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure that AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in this AWS Region, activate it. For information about how to activate AWS STS, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p><p>File gateways don't support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateSMBFileShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateSMBFileShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateSMBFileShareInput
 @see AWSStoragegatewayUpdateSMBFileShareOutput
 */
- (AWSTask<AWSStoragegatewayUpdateSMBFileShareOutput *> *)updateSMBFileShare:(AWSStoragegatewayUpdateSMBFileShareInput *)request;

/**
 <p>Updates a Server Message Block (SMB) file share.</p><note><p>To leave a file share field unchanged, set the corresponding input field to null. This operation is only supported for file gateways.</p></note><important><p>File gateways require AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure that AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in this AWS Region, activate it. For information about how to activate AWS STS, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide</i>.</p><p>File gateways don't support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateSMBFileShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateSMBFileShareInput
 @see AWSStoragegatewayUpdateSMBFileShareOutput
 */
- (void)updateSMBFileShare:(AWSStoragegatewayUpdateSMBFileShareInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateSMBFileShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the SMB security strategy on a file gateway. This action is only supported in file gateways.</p><note><p>This API is called Security level in the User Guide.</p><p>A higher security level can affect performance of the gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateSMBSecurityStrategy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateSMBSecurityStrategyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateSMBSecurityStrategyInput
 @see AWSStoragegatewayUpdateSMBSecurityStrategyOutput
 */
- (AWSTask<AWSStoragegatewayUpdateSMBSecurityStrategyOutput *> *)updateSMBSecurityStrategy:(AWSStoragegatewayUpdateSMBSecurityStrategyInput *)request;

/**
 <p>Updates the SMB security strategy on a file gateway. This action is only supported in file gateways.</p><note><p>This API is called Security level in the User Guide.</p><p>A higher security level can affect performance of the gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateSMBSecurityStrategy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateSMBSecurityStrategyInput
 @see AWSStoragegatewayUpdateSMBSecurityStrategyOutput
 */
- (void)updateSMBSecurityStrategy:(AWSStoragegatewayUpdateSMBSecurityStrategyInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateSMBSecurityStrategyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a snapshot schedule configured for a gateway volume. This operation is only supported in the cached volume and stored volume gateway types.</p><p>The default snapshot schedule for volume is once every 24 hours, starting at the creation time of the volume. You can use this API to change the snapshot schedule configured for the volume.</p><p>In the request you must identify the gateway volume whose snapshot schedule you want to update, and the schedule information, including when you want the snapshot to begin on a day and the frequency (in hours) of snapshots.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSnapshotSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateSnapshotScheduleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateSnapshotScheduleInput
 @see AWSStoragegatewayUpdateSnapshotScheduleOutput
 */
- (AWSTask<AWSStoragegatewayUpdateSnapshotScheduleOutput *> *)updateSnapshotSchedule:(AWSStoragegatewayUpdateSnapshotScheduleInput *)request;

/**
 <p>Updates a snapshot schedule configured for a gateway volume. This operation is only supported in the cached volume and stored volume gateway types.</p><p>The default snapshot schedule for volume is once every 24 hours, starting at the creation time of the volume. You can use this API to change the snapshot schedule configured for the volume.</p><p>In the request you must identify the gateway volume whose snapshot schedule you want to update, and the schedule information, including when you want the snapshot to begin on a day and the frequency (in hours) of snapshots.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSnapshotSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateSnapshotScheduleInput
 @see AWSStoragegatewayUpdateSnapshotScheduleOutput
 */
- (void)updateSnapshotSchedule:(AWSStoragegatewayUpdateSnapshotScheduleInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateSnapshotScheduleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the type of medium changer in a tape gateway. When you activate a tape gateway, you select a medium changer type for the tape gateway. This operation enables you to select a different type of medium changer after a tape gateway is activated. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVTLDeviceType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSStoragegatewayUpdateVTLDeviceTypeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateVTLDeviceTypeInput
 @see AWSStoragegatewayUpdateVTLDeviceTypeOutput
 */
- (AWSTask<AWSStoragegatewayUpdateVTLDeviceTypeOutput *> *)updateVTLDeviceType:(AWSStoragegatewayUpdateVTLDeviceTypeInput *)request;

/**
 <p>Updates the type of medium changer in a tape gateway. When you activate a tape gateway, you select a medium changer type for the tape gateway. This operation enables you to select a different type of medium changer after a tape gateway is activated. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVTLDeviceType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSStoragegatewayErrorDomain` domain and the following error code: `AWSStoragegatewayErrorInvalidGatewayRequest`, `AWSStoragegatewayErrorInternalServer`.
 
 @see AWSStoragegatewayUpdateVTLDeviceTypeInput
 @see AWSStoragegatewayUpdateVTLDeviceTypeOutput
 */
- (void)updateVTLDeviceType:(AWSStoragegatewayUpdateVTLDeviceTypeInput *)request completionHandler:(void (^ _Nullable)(AWSStoragegatewayUpdateVTLDeviceTypeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
