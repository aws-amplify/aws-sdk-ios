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
#import "AWSstoragegatewayModel.h"
#import "AWSstoragegatewayResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSstoragegateway
FOUNDATION_EXPORT NSString *const AWSstoragegatewaySDKVersion;

/**
 <fullname>AWS Storage Gateway Service</fullname><p>AWS Storage Gateway is the service that connects an on-premises software appliance with cloud-based storage to provide seamless and secure integration between an organization's on-premises IT environment and the AWS storage infrastructure. The service enables you to securely upload data to the AWS Cloud for cost effective backup and rapid disaster recovery.</p><p>Use the following links to get started using the <i>AWS Storage Gateway Service API Reference</i>:</p><ul><li><p><a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#AWSStorageGatewayHTTPRequestsHeaders">AWS Storage Gateway Required Request Headers</a>: Describes the required headers that you must send with every POST request to AWS Storage Gateway.</p></li><li><p><a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#AWSStorageGatewaySigningRequests">Signing Requests</a>: AWS Storage Gateway requires that you authenticate every request you send; this topic describes how sign such a request.</p></li><li><p><a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/AWSStorageGatewayAPI.html#APIErrorResponses">Error Responses</a>: Provides reference information about AWS Storage Gateway errors.</p></li><li><p><a href="https://docs.aws.amazon.com/storagegateway/latest/APIReference/API_Operations.html">Operations in AWS Storage Gateway</a>: Contains detailed descriptions of all AWS Storage Gateway operations, their request parameters, response elements, possible errors, and examples of requests and responses.</p></li><li><p><a href="http://docs.aws.amazon.com/general/latest/gr/rande.html#sg_region">AWS Storage Gateway Regions and Endpoints:</a> Provides a list of each AWS Region and the endpoints available for use with AWS Storage Gateway. </p></li></ul><note><p>AWS Storage Gateway resource IDs are in uppercase. When you use these resource IDs with the Amazon EC2 API, EC2 expects resource IDs in lowercase. You must change your resource ID to lowercase to use it with the EC2 API. For example, in Storage Gateway the ID for a volume might be <code>vol-AA22BB012345DAF670</code>. When you use this ID with the EC2 API, you must change it to <code>vol-aa22bb012345daf670</code>. Otherwise, the EC2 API might not behave as expected.</p></note><important><p>IDs for Storage Gateway volumes and Amazon EBS snapshots created from gateway volumes are changing to a longer format. Starting in December 2016, all new volumes and snapshots will be created with a 17-character string. Starting in April 2016, you will be able to use these longer IDs so you can test your systems with the new format. For more information, see <a href="https://aws.amazon.com/ec2/faqs/#longer-ids">Longer EC2 and EBS Resource IDs</a>. </p><p> For example, a volume Amazon Resource Name (ARN) with the longer volume ID format looks like the following:</p><p><code>arn:aws:storagegateway:us-west-2:111122223333:gateway/sgw-12A3456B/volume/vol-1122AABBCCDDEEFFG</code>.</p><p>A snapshot ID with the longer ID format looks like the following: <code>snap-78e226633445566ee</code>.</p><p>For more information, see <a href="https://forums.aws.amazon.com/ann.jspa?annID=3557">Announcement: Heads-up – Longer AWS Storage Gateway volume and snapshot IDs coming in 2016</a>.</p></important>
 */
@interface AWSstoragegateway : AWSService

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

     let storagegateway = AWSstoragegateway.default()

 *Objective-C*

     AWSstoragegateway *storagegateway = [AWSstoragegateway defaultstoragegateway];

 @return The default service client.
 */
+ (instancetype)defaultstoragegateway;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSstoragegateway.register(with: configuration!, forKey: "USWest2storagegateway")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:@"USWest2storagegateway"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let storagegateway = AWSstoragegateway(forKey: "USWest2storagegateway")

 *Objective-C*

     AWSstoragegateway *storagegateway = [AWSstoragegateway storagegatewayForKey:@"USWest2storagegateway"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerstoragegatewayWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerstoragegatewayWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSstoragegateway.register(with: configuration!, forKey: "USWest2storagegateway")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:@"USWest2storagegateway"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let storagegateway = AWSstoragegateway(forKey: "USWest2storagegateway")

 *Objective-C*

     AWSstoragegateway *storagegateway = [AWSstoragegateway storagegatewayForKey:@"USWest2storagegateway"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)storagegatewayForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removestoragegatewayForKey:(NSString *)key;

/**
 <p>Activates the gateway you previously deployed on your host. In the activation process, you specify information such as the AWS Region that you want to use for storing snapshots or tapes, the time zone for scheduled snapshots the gateway snapshot schedule window, an activation key, and a name for your gateway. The activation process also associates your gateway with your account; for more information, see <a>UpdateGatewayInformation</a>.</p><note><p>You must turn on the gateway VM before you can activate your gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the ActivateGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayActivateGatewayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayActivateGatewayInput
 @see AWSstoragegatewayActivateGatewayOutput
 */
- (AWSTask<AWSstoragegatewayActivateGatewayOutput *> *)activateGateway:(AWSstoragegatewayActivateGatewayInput *)request;

/**
 <p>Activates the gateway you previously deployed on your host. In the activation process, you specify information such as the AWS Region that you want to use for storing snapshots or tapes, the time zone for scheduled snapshots the gateway snapshot schedule window, an activation key, and a name for your gateway. The activation process also associates your gateway with your account; for more information, see <a>UpdateGatewayInformation</a>.</p><note><p>You must turn on the gateway VM before you can activate your gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the ActivateGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayActivateGatewayInput
 @see AWSstoragegatewayActivateGatewayOutput
 */
- (void)activateGateway:(AWSstoragegatewayActivateGatewayInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayActivateGatewayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures one or more gateway local disks as cache for a gateway. This operation is only supported in the cached volume, tape and file gateway type (see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html">Storage Gateway Concepts</a>).</p><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add cache, and one or more disk IDs that you want to configure as cache.</p>
 
 @param request A container for the necessary parameters to execute the AddCache service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayAddCacheOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAddCacheInput
 @see AWSstoragegatewayAddCacheOutput
 */
- (AWSTask<AWSstoragegatewayAddCacheOutput *> *)addCache:(AWSstoragegatewayAddCacheInput *)request;

/**
 <p>Configures one or more gateway local disks as cache for a gateway. This operation is only supported in the cached volume, tape and file gateway type (see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html">Storage Gateway Concepts</a>).</p><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add cache, and one or more disk IDs that you want to configure as cache.</p>
 
 @param request A container for the necessary parameters to execute the AddCache service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAddCacheInput
 @see AWSstoragegatewayAddCacheOutput
 */
- (void)addCache:(AWSstoragegatewayAddCacheInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayAddCacheOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds one or more tags to the specified resource. You use tags to add metadata to resources, which you can use to categorize these resources. For example, you can categorize resources by purpose, owner, environment, or team. Each tag consists of a key and a value, which you define. You can add tags to the following AWS Storage Gateway resources:</p><ul><li><p>Storage gateways of all types</p></li><li><p>Storage volumes</p></li><li><p>Virtual tapes</p></li><li><p>NFS and SMB file shares</p></li></ul><p>You can create a maximum of 50 tags for each resource. Virtual tapes and storage volumes that are recovered to a new gateway maintain their tags.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayAddTagsToResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAddTagsToResourceInput
 @see AWSstoragegatewayAddTagsToResourceOutput
 */
- (AWSTask<AWSstoragegatewayAddTagsToResourceOutput *> *)addTagsToResource:(AWSstoragegatewayAddTagsToResourceInput *)request;

/**
 <p>Adds one or more tags to the specified resource. You use tags to add metadata to resources, which you can use to categorize these resources. For example, you can categorize resources by purpose, owner, environment, or team. Each tag consists of a key and a value, which you define. You can add tags to the following AWS Storage Gateway resources:</p><ul><li><p>Storage gateways of all types</p></li><li><p>Storage volumes</p></li><li><p>Virtual tapes</p></li><li><p>NFS and SMB file shares</p></li></ul><p>You can create a maximum of 50 tags for each resource. Virtual tapes and storage volumes that are recovered to a new gateway maintain their tags.</p>
 
 @param request A container for the necessary parameters to execute the AddTagsToResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAddTagsToResourceInput
 @see AWSstoragegatewayAddTagsToResourceOutput
 */
- (void)addTagsToResource:(AWSstoragegatewayAddTagsToResourceInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayAddTagsToResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures one or more gateway local disks as upload buffer for a specified gateway. This operation is supported for the stored volume, cached volume and tape gateway types.</p><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add upload buffer, and one or more disk IDs that you want to configure as upload buffer.</p>
 
 @param request A container for the necessary parameters to execute the AddUploadBuffer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayAddUploadBufferOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAddUploadBufferInput
 @see AWSstoragegatewayAddUploadBufferOutput
 */
- (AWSTask<AWSstoragegatewayAddUploadBufferOutput *> *)addUploadBuffer:(AWSstoragegatewayAddUploadBufferInput *)request;

/**
 <p>Configures one or more gateway local disks as upload buffer for a specified gateway. This operation is supported for the stored volume, cached volume and tape gateway types.</p><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add upload buffer, and one or more disk IDs that you want to configure as upload buffer.</p>
 
 @param request A container for the necessary parameters to execute the AddUploadBuffer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAddUploadBufferInput
 @see AWSstoragegatewayAddUploadBufferOutput
 */
- (void)addUploadBuffer:(AWSstoragegatewayAddUploadBufferInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayAddUploadBufferOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Configures one or more gateway local disks as working storage for a gateway. This operation is only supported in the stored volume gateway type. This operation is deprecated in cached volume API version 20120630. Use <a>AddUploadBuffer</a> instead.</p><note><p>Working storage is also referred to as upload buffer. You can also use the <a>AddUploadBuffer</a> operation to add upload buffer to a stored volume gateway.</p></note><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add working storage, and one or more disk IDs that you want to configure as working storage.</p>
 
 @param request A container for the necessary parameters to execute the AddWorkingStorage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayAddWorkingStorageOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAddWorkingStorageInput
 @see AWSstoragegatewayAddWorkingStorageOutput
 */
- (AWSTask<AWSstoragegatewayAddWorkingStorageOutput *> *)addWorkingStorage:(AWSstoragegatewayAddWorkingStorageInput *)request;

/**
 <p>Configures one or more gateway local disks as working storage for a gateway. This operation is only supported in the stored volume gateway type. This operation is deprecated in cached volume API version 20120630. Use <a>AddUploadBuffer</a> instead.</p><note><p>Working storage is also referred to as upload buffer. You can also use the <a>AddUploadBuffer</a> operation to add upload buffer to a stored volume gateway.</p></note><p>In the request, you specify the gateway Amazon Resource Name (ARN) to which you want to add working storage, and one or more disk IDs that you want to configure as working storage.</p>
 
 @param request A container for the necessary parameters to execute the AddWorkingStorage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAddWorkingStorageInput
 @see AWSstoragegatewayAddWorkingStorageOutput
 */
- (void)addWorkingStorage:(AWSstoragegatewayAddWorkingStorageInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayAddWorkingStorageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Assigns a tape to a tape pool for archiving. The tape assigned to a pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the S3 storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.</p><p>Valid values: "GLACIER", "DEEP_ARCHIVE"</p>
 
 @param request A container for the necessary parameters to execute the AssignTapePool service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayAssignTapePoolOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAssignTapePoolInput
 @see AWSstoragegatewayAssignTapePoolOutput
 */
- (AWSTask<AWSstoragegatewayAssignTapePoolOutput *> *)assignTapePool:(AWSstoragegatewayAssignTapePoolInput *)request;

/**
 <p>Assigns a tape to a tape pool for archiving. The tape assigned to a pool is archived in the S3 storage class that is associated with the pool. When you use your backup application to eject the tape, the tape is archived directly into the S3 storage class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.</p><p>Valid values: "GLACIER", "DEEP_ARCHIVE"</p>
 
 @param request A container for the necessary parameters to execute the AssignTapePool service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAssignTapePoolInput
 @see AWSstoragegatewayAssignTapePoolOutput
 */
- (void)assignTapePool:(AWSstoragegatewayAssignTapePoolInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayAssignTapePoolOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Connects a volume to an iSCSI connection and then attaches the volume to the specified gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a different gateway without creating a snapshot. It also makes it easier to move your volumes from an on-premises gateway to a gateway hosted on an Amazon EC2 instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayAttachVolumeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAttachVolumeInput
 @see AWSstoragegatewayAttachVolumeOutput
 */
- (AWSTask<AWSstoragegatewayAttachVolumeOutput *> *)attachVolume:(AWSstoragegatewayAttachVolumeInput *)request;

/**
 <p>Connects a volume to an iSCSI connection and then attaches the volume to the specified gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a different gateway without creating a snapshot. It also makes it easier to move your volumes from an on-premises gateway to a gateway hosted on an Amazon EC2 instance.</p>
 
 @param request A container for the necessary parameters to execute the AttachVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayAttachVolumeInput
 @see AWSstoragegatewayAttachVolumeOutput
 */
- (void)attachVolume:(AWSstoragegatewayAttachVolumeInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayAttachVolumeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after the archiving process is initiated. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the CancelArchival service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayCancelArchivalOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCancelArchivalInput
 @see AWSstoragegatewayCancelArchivalOutput
 */
- (AWSTask<AWSstoragegatewayCancelArchivalOutput *> *)cancelArchival:(AWSstoragegatewayCancelArchivalInput *)request;

/**
 <p>Cancels archiving of a virtual tape to the virtual tape shelf (VTS) after the archiving process is initiated. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the CancelArchival service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCancelArchivalInput
 @see AWSstoragegatewayCancelArchivalOutput
 */
- (void)cancelArchival:(AWSstoragegatewayCancelArchivalInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayCancelArchivalOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a gateway after the retrieval process is initiated. The virtual tape is returned to the VTS. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the CancelRetrieval service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayCancelRetrievalOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCancelRetrievalInput
 @see AWSstoragegatewayCancelRetrievalOutput
 */
- (AWSTask<AWSstoragegatewayCancelRetrievalOutput *> *)cancelRetrieval:(AWSstoragegatewayCancelRetrievalInput *)request;

/**
 <p>Cancels retrieval of a virtual tape from the virtual tape shelf (VTS) to a gateway after the retrieval process is initiated. The virtual tape is returned to the VTS. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the CancelRetrieval service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCancelRetrievalInput
 @see AWSstoragegatewayCancelRetrievalOutput
 */
- (void)cancelRetrieval:(AWSstoragegatewayCancelRetrievalInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayCancelRetrievalOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a cached volume on a specified cached volume gateway. This operation is only supported in the cached volume gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create a cached volume. Use the <a>AddCache</a> operation to add cache storage to a gateway. </p></note><p>In the request, you must specify the gateway, size of the volume in bytes, the iSCSI target name, an IP address on which to expose the target, and a unique client token. In response, the gateway creates the volume and returns information about it. This information includes the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use to connect to the volume target.</p><p>Optionally, you can provide the ARN for an existing volume as the <code>SourceVolumeARN</code> for this cached volume, which creates an exact copy of the existing volume’s latest recovery point. The <code>VolumeSizeInBytes</code> value must be equal to or larger than the size of the copied volume, in bytes.</p>
 
 @param request A container for the necessary parameters to execute the CreateCachediSCSIVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayCreateCachediSCSIVolumeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateCachediSCSIVolumeInput
 @see AWSstoragegatewayCreateCachediSCSIVolumeOutput
 */
- (AWSTask<AWSstoragegatewayCreateCachediSCSIVolumeOutput *> *)createCachediSCSIVolume:(AWSstoragegatewayCreateCachediSCSIVolumeInput *)request;

/**
 <p>Creates a cached volume on a specified cached volume gateway. This operation is only supported in the cached volume gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create a cached volume. Use the <a>AddCache</a> operation to add cache storage to a gateway. </p></note><p>In the request, you must specify the gateway, size of the volume in bytes, the iSCSI target name, an IP address on which to expose the target, and a unique client token. In response, the gateway creates the volume and returns information about it. This information includes the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use to connect to the volume target.</p><p>Optionally, you can provide the ARN for an existing volume as the <code>SourceVolumeARN</code> for this cached volume, which creates an exact copy of the existing volume’s latest recovery point. The <code>VolumeSizeInBytes</code> value must be equal to or larger than the size of the copied volume, in bytes.</p>
 
 @param request A container for the necessary parameters to execute the CreateCachediSCSIVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateCachediSCSIVolumeInput
 @see AWSstoragegatewayCreateCachediSCSIVolumeOutput
 */
- (void)createCachediSCSIVolume:(AWSstoragegatewayCreateCachediSCSIVolumeInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayCreateCachediSCSIVolumeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Network File System (NFS) file share on an existing file gateway. In Storage Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway exposes file shares using an NFS interface. This operation is only supported for file gateways.</p><important><p>File gateway requires AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in the AWS Region, activate it. For information about how to activate AWS STS, see Activating and Deactivating AWS STS in an AWS Region in the AWS Identity and Access Management User Guide. </p><p>File gateway does not support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateNFSFileShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayCreateNFSFileShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateNFSFileShareInput
 @see AWSstoragegatewayCreateNFSFileShareOutput
 */
- (AWSTask<AWSstoragegatewayCreateNFSFileShareOutput *> *)createNFSFileShare:(AWSstoragegatewayCreateNFSFileShareInput *)request;

/**
 <p>Creates a Network File System (NFS) file share on an existing file gateway. In Storage Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway exposes file shares using an NFS interface. This operation is only supported for file gateways.</p><important><p>File gateway requires AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in the AWS Region, activate it. For information about how to activate AWS STS, see Activating and Deactivating AWS STS in an AWS Region in the AWS Identity and Access Management User Guide. </p><p>File gateway does not support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateNFSFileShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateNFSFileShareInput
 @see AWSstoragegatewayCreateNFSFileShareOutput
 */
- (void)createNFSFileShare:(AWSstoragegatewayCreateNFSFileShareInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayCreateNFSFileShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a Server Message Block (SMB) file share on an existing file gateway. In Storage Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway expose file shares using an SMB interface. This operation is only supported for file gateways.</p><important><p>File gateways require AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure that AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in this AWS Region, activate it. For information about how to activate AWS STS, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide.</i></p><p>File gateways don't support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateSMBFileShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayCreateSMBFileShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateSMBFileShareInput
 @see AWSstoragegatewayCreateSMBFileShareOutput
 */
- (AWSTask<AWSstoragegatewayCreateSMBFileShareOutput *> *)createSMBFileShare:(AWSstoragegatewayCreateSMBFileShareInput *)request;

/**
 <p>Creates a Server Message Block (SMB) file share on an existing file gateway. In Storage Gateway, a file share is a file system mount point backed by Amazon S3 cloud storage. Storage Gateway expose file shares using an SMB interface. This operation is only supported for file gateways.</p><important><p>File gateways require AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure that AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in this AWS Region, activate it. For information about how to activate AWS STS, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide.</i></p><p>File gateways don't support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateSMBFileShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateSMBFileShareInput
 @see AWSstoragegatewayCreateSMBFileShareOutput
 */
- (void)createSMBFileShare:(AWSstoragegatewayCreateSMBFileShareInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayCreateSMBFileShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a snapshot of a volume.</p><p>AWS Storage Gateway provides the ability to back up point-in-time snapshots of your data to Amazon Simple Storage Service (Amazon S3) for durable off-site recovery, as well as import the data to an Amazon Elastic Block Store (EBS) volume in Amazon Elastic Compute Cloud (EC2). You can take snapshots of your gateway volume on a scheduled or ad hoc basis. This API enables you to take an ad hoc snapshot. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#SchedulingSnapshot">Editing a Snapshot Schedule</a>.</p><p>In the CreateSnapshot request you identify the volume by providing its Amazon Resource Name (ARN). You must also provide description for the snapshot. When AWS Storage Gateway takes the snapshot of specified volume, the snapshot and description appears in the AWS Storage Gateway Console. In response, AWS Storage Gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or later use it when you want to create a volume from a snapshot. This operation is only supported in stored and cached volume gateway type.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, see DescribeSnapshots or DeleteSnapshot in the <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Operations.html">EC2 API reference</a>.</p></note><important><p>Volume and snapshot IDs are changing to a longer length ID format. For more information, see the important note on the <a href="https://docs.aws.amazon.com/storagegateway/latest/APIReference/Welcome.html">Welcome</a> page.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayCreateSnapshotOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`, `AWSstoragegatewayErrorServiceUnavailable`.
 
 @see AWSstoragegatewayCreateSnapshotInput
 @see AWSstoragegatewayCreateSnapshotOutput
 */
- (AWSTask<AWSstoragegatewayCreateSnapshotOutput *> *)createSnapshot:(AWSstoragegatewayCreateSnapshotInput *)request;

/**
 <p>Initiates a snapshot of a volume.</p><p>AWS Storage Gateway provides the ability to back up point-in-time snapshots of your data to Amazon Simple Storage Service (Amazon S3) for durable off-site recovery, as well as import the data to an Amazon Elastic Block Store (EBS) volume in Amazon Elastic Compute Cloud (EC2). You can take snapshots of your gateway volume on a scheduled or ad hoc basis. This API enables you to take an ad hoc snapshot. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#SchedulingSnapshot">Editing a Snapshot Schedule</a>.</p><p>In the CreateSnapshot request you identify the volume by providing its Amazon Resource Name (ARN). You must also provide description for the snapshot. When AWS Storage Gateway takes the snapshot of specified volume, the snapshot and description appears in the AWS Storage Gateway Console. In response, AWS Storage Gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or later use it when you want to create a volume from a snapshot. This operation is only supported in stored and cached volume gateway type.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, see DescribeSnapshots or DeleteSnapshot in the <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Operations.html">EC2 API reference</a>.</p></note><important><p>Volume and snapshot IDs are changing to a longer length ID format. For more information, see the important note on the <a href="https://docs.aws.amazon.com/storagegateway/latest/APIReference/Welcome.html">Welcome</a> page.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateSnapshot service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`, `AWSstoragegatewayErrorServiceUnavailable`.
 
 @see AWSstoragegatewayCreateSnapshotInput
 @see AWSstoragegatewayCreateSnapshotOutput
 */
- (void)createSnapshot:(AWSstoragegatewayCreateSnapshotInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayCreateSnapshotOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Initiates a snapshot of a gateway from a volume recovery point. This operation is only supported in the cached volume gateway type.</p><p>A volume recovery point is a point in time at which all data of the volume is consistent and from which you can create a snapshot. To get a list of volume recovery point for cached volume gateway, use <a>ListVolumeRecoveryPoints</a>.</p><p>In the <code>CreateSnapshotFromVolumeRecoveryPoint</code> request, you identify the volume by providing its Amazon Resource Name (ARN). You must also provide a description for the snapshot. When the gateway takes a snapshot of the specified volume, the snapshot and its description appear in the AWS Storage Gateway console. In response, the gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or later use it when you want to create a volume from a snapshot.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, in <i>Amazon Elastic Compute Cloud API Reference</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateSnapshotFromVolumeRecoveryPoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`, `AWSstoragegatewayErrorServiceUnavailable`.
 
 @see AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointInput
 @see AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput
 */
- (AWSTask<AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput *> *)createSnapshotFromVolumeRecoveryPoint:(AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointInput *)request;

/**
 <p>Initiates a snapshot of a gateway from a volume recovery point. This operation is only supported in the cached volume gateway type.</p><p>A volume recovery point is a point in time at which all data of the volume is consistent and from which you can create a snapshot. To get a list of volume recovery point for cached volume gateway, use <a>ListVolumeRecoveryPoints</a>.</p><p>In the <code>CreateSnapshotFromVolumeRecoveryPoint</code> request, you identify the volume by providing its Amazon Resource Name (ARN). You must also provide a description for the snapshot. When the gateway takes a snapshot of the specified volume, the snapshot and its description appear in the AWS Storage Gateway console. In response, the gateway returns you a snapshot ID. You can use this snapshot ID to check the snapshot progress or later use it when you want to create a volume from a snapshot.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, in <i>Amazon Elastic Compute Cloud API Reference</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateSnapshotFromVolumeRecoveryPoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`, `AWSstoragegatewayErrorServiceUnavailable`.
 
 @see AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointInput
 @see AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput
 */
- (void)createSnapshotFromVolumeRecoveryPoint:(AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a volume on a specified gateway. This operation is only supported in the stored volume gateway type.</p><p>The size of the volume to create is inferred from the disk size. You can choose to preserve existing data on the disk, create volume from an existing snapshot, or create an empty volume. If you choose to create an empty gateway volume, then any existing data on the disk is erased.</p><p>In the request you must specify the gateway and the disk information on which you are creating the volume. In response, the gateway creates the volume and returns volume information such as the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use to connect to the volume target.</p>
 
 @param request A container for the necessary parameters to execute the CreateStorediSCSIVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayCreateStorediSCSIVolumeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateStorediSCSIVolumeInput
 @see AWSstoragegatewayCreateStorediSCSIVolumeOutput
 */
- (AWSTask<AWSstoragegatewayCreateStorediSCSIVolumeOutput *> *)createStorediSCSIVolume:(AWSstoragegatewayCreateStorediSCSIVolumeInput *)request;

/**
 <p>Creates a volume on a specified gateway. This operation is only supported in the stored volume gateway type.</p><p>The size of the volume to create is inferred from the disk size. You can choose to preserve existing data on the disk, create volume from an existing snapshot, or create an empty volume. If you choose to create an empty gateway volume, then any existing data on the disk is erased.</p><p>In the request you must specify the gateway and the disk information on which you are creating the volume. In response, the gateway creates the volume and returns volume information such as the volume Amazon Resource Name (ARN), its size, and the iSCSI target ARN that initiators can use to connect to the volume target.</p>
 
 @param request A container for the necessary parameters to execute the CreateStorediSCSIVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateStorediSCSIVolumeInput
 @see AWSstoragegatewayCreateStorediSCSIVolumeOutput
 */
- (void)createStorediSCSIVolume:(AWSstoragegatewayCreateStorediSCSIVolumeInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayCreateStorediSCSIVolumeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a virtual tape by using your own barcode. You write data to the virtual tape and then archive the tape. A barcode is unique and cannot be reused if it has already been used on a tape. This applies to barcodes used on deleted tapes. This operation is only supported in the tape gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create a virtual tape. Use the <a>AddCache</a> operation to add cache storage to a gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTapeWithBarcode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayCreateTapeWithBarcodeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateTapeWithBarcodeInput
 @see AWSstoragegatewayCreateTapeWithBarcodeOutput
 */
- (AWSTask<AWSstoragegatewayCreateTapeWithBarcodeOutput *> *)createTapeWithBarcode:(AWSstoragegatewayCreateTapeWithBarcodeInput *)request;

/**
 <p>Creates a virtual tape by using your own barcode. You write data to the virtual tape and then archive the tape. A barcode is unique and cannot be reused if it has already been used on a tape. This applies to barcodes used on deleted tapes. This operation is only supported in the tape gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create a virtual tape. Use the <a>AddCache</a> operation to add cache storage to a gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateTapeWithBarcode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateTapeWithBarcodeInput
 @see AWSstoragegatewayCreateTapeWithBarcodeOutput
 */
- (void)createTapeWithBarcode:(AWSstoragegatewayCreateTapeWithBarcodeInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayCreateTapeWithBarcodeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates one or more virtual tapes. You write data to the virtual tapes and then archive the tapes. This operation is only supported in the tape gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create virtual tapes. Use the <a>AddCache</a> operation to add cache storage to a gateway. </p></note>
 
 @param request A container for the necessary parameters to execute the CreateTapes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayCreateTapesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateTapesInput
 @see AWSstoragegatewayCreateTapesOutput
 */
- (AWSTask<AWSstoragegatewayCreateTapesOutput *> *)createTapes:(AWSstoragegatewayCreateTapesInput *)request;

/**
 <p>Creates one or more virtual tapes. You write data to the virtual tapes and then archive the tapes. This operation is only supported in the tape gateway type.</p><note><p>Cache storage must be allocated to the gateway before you can create virtual tapes. Use the <a>AddCache</a> operation to add cache storage to a gateway. </p></note>
 
 @param request A container for the necessary parameters to execute the CreateTapes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayCreateTapesInput
 @see AWSstoragegatewayCreateTapesOutput
 */
- (void)createTapes:(AWSstoragegatewayCreateTapesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayCreateTapesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the automatic tape creation policy of a gateway. If you delete this policy, new virtual tapes must be created manually. Use the Amazon Resource Name (ARN) of the gateway in your request to remove the policy. </p>
 
 @param request A container for the necessary parameters to execute the DeleteAutomaticTapeCreationPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteAutomaticTapeCreationPolicyInput
 @see AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput
 */
- (AWSTask<AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput *> *)deleteAutomaticTapeCreationPolicy:(AWSstoragegatewayDeleteAutomaticTapeCreationPolicyInput *)request;

/**
 <p>Deletes the automatic tape creation policy of a gateway. If you delete this policy, new virtual tapes must be created manually. Use the Amazon Resource Name (ARN) of the gateway in your request to remove the policy. </p>
 
 @param request A container for the necessary parameters to execute the DeleteAutomaticTapeCreationPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteAutomaticTapeCreationPolicyInput
 @see AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput
 */
- (void)deleteAutomaticTapeCreationPolicy:(AWSstoragegatewayDeleteAutomaticTapeCreationPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the bandwidth rate limits of a gateway. You can delete either the upload and download bandwidth rate limit, or you can delete both. If you delete only one of the limits, the other limit remains unchanged. To specify which gateway to work with, use the Amazon Resource Name (ARN) of the gateway in your request. This operation is supported for the stored volume, cached volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBandwidthRateLimit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDeleteBandwidthRateLimitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteBandwidthRateLimitInput
 @see AWSstoragegatewayDeleteBandwidthRateLimitOutput
 */
- (AWSTask<AWSstoragegatewayDeleteBandwidthRateLimitOutput *> *)deleteBandwidthRateLimit:(AWSstoragegatewayDeleteBandwidthRateLimitInput *)request;

/**
 <p>Deletes the bandwidth rate limits of a gateway. You can delete either the upload and download bandwidth rate limit, or you can delete both. If you delete only one of the limits, the other limit remains unchanged. To specify which gateway to work with, use the Amazon Resource Name (ARN) of the gateway in your request. This operation is supported for the stored volume, cached volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DeleteBandwidthRateLimit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteBandwidthRateLimitInput
 @see AWSstoragegatewayDeleteBandwidthRateLimitOutput
 */
- (void)deleteBandwidthRateLimit:(AWSstoragegatewayDeleteBandwidthRateLimitInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDeleteBandwidthRateLimitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target and initiator pair. This operation is supported in volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DeleteChapCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDeleteChapCredentialsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteChapCredentialsInput
 @see AWSstoragegatewayDeleteChapCredentialsOutput
 */
- (AWSTask<AWSstoragegatewayDeleteChapCredentialsOutput *> *)deleteChapCredentials:(AWSstoragegatewayDeleteChapCredentialsInput *)request;

/**
 <p>Deletes Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target and initiator pair. This operation is supported in volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DeleteChapCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteChapCredentialsInput
 @see AWSstoragegatewayDeleteChapCredentialsOutput
 */
- (void)deleteChapCredentials:(AWSstoragegatewayDeleteChapCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDeleteChapCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a file share from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFileShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDeleteFileShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteFileShareInput
 @see AWSstoragegatewayDeleteFileShareOutput
 */
- (AWSTask<AWSstoragegatewayDeleteFileShareOutput *> *)deleteFileShare:(AWSstoragegatewayDeleteFileShareInput *)request;

/**
 <p>Deletes a file share from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFileShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteFileShareInput
 @see AWSstoragegatewayDeleteFileShareOutput
 */
- (void)deleteFileShare:(AWSstoragegatewayDeleteFileShareInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDeleteFileShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a gateway. To specify which gateway to delete, use the Amazon Resource Name (ARN) of the gateway in your request. The operation deletes the gateway; however, it does not delete the gateway virtual machine (VM) from your host computer.</p><p>After you delete a gateway, you cannot reactivate it. Completed snapshots of the gateway volumes are not deleted upon deleting the gateway, however, pending snapshots will not complete. After you delete a gateway, your next step is to remove it from your environment.</p><important><p>You no longer pay software charges after the gateway is deleted; however, your existing Amazon EBS snapshots persist and you will continue to be billed for these snapshots. You can choose to remove all remaining Amazon EBS snapshots by canceling your Amazon EC2 subscription.  If you prefer not to cancel your Amazon EC2 subscription, you can delete your snapshots using the Amazon EC2 console. For more information, see the <a href="http://aws.amazon.com/storagegateway"> AWS Storage Gateway Detail Page</a>. </p></important>
 
 @param request A container for the necessary parameters to execute the DeleteGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDeleteGatewayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteGatewayInput
 @see AWSstoragegatewayDeleteGatewayOutput
 */
- (AWSTask<AWSstoragegatewayDeleteGatewayOutput *> *)deleteGateway:(AWSstoragegatewayDeleteGatewayInput *)request;

/**
 <p>Deletes a gateway. To specify which gateway to delete, use the Amazon Resource Name (ARN) of the gateway in your request. The operation deletes the gateway; however, it does not delete the gateway virtual machine (VM) from your host computer.</p><p>After you delete a gateway, you cannot reactivate it. Completed snapshots of the gateway volumes are not deleted upon deleting the gateway, however, pending snapshots will not complete. After you delete a gateway, your next step is to remove it from your environment.</p><important><p>You no longer pay software charges after the gateway is deleted; however, your existing Amazon EBS snapshots persist and you will continue to be billed for these snapshots. You can choose to remove all remaining Amazon EBS snapshots by canceling your Amazon EC2 subscription.  If you prefer not to cancel your Amazon EC2 subscription, you can delete your snapshots using the Amazon EC2 console. For more information, see the <a href="http://aws.amazon.com/storagegateway"> AWS Storage Gateway Detail Page</a>. </p></important>
 
 @param request A container for the necessary parameters to execute the DeleteGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteGatewayInput
 @see AWSstoragegatewayDeleteGatewayOutput
 */
- (void)deleteGateway:(AWSstoragegatewayDeleteGatewayInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDeleteGatewayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a snapshot of a volume.</p><p>You can take snapshots of your gateway volumes on a scheduled or ad hoc basis. This API action enables you to delete a snapshot schedule for a volume. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/WorkingWithSnapshots.html">Working with Snapshots</a>. In the <code>DeleteSnapshotSchedule</code> request, you identify the volume by providing its Amazon Resource Name (ARN). This operation is only supported in stored and cached volume gateway types.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, go to <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshotSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDeleteSnapshotScheduleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteSnapshotScheduleInput
 @see AWSstoragegatewayDeleteSnapshotScheduleOutput
 */
- (AWSTask<AWSstoragegatewayDeleteSnapshotScheduleOutput *> *)deleteSnapshotSchedule:(AWSstoragegatewayDeleteSnapshotScheduleInput *)request;

/**
 <p>Deletes a snapshot of a volume.</p><p>You can take snapshots of your gateway volumes on a scheduled or ad hoc basis. This API action enables you to delete a snapshot schedule for a volume. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/WorkingWithSnapshots.html">Working with Snapshots</a>. In the <code>DeleteSnapshotSchedule</code> request, you identify the volume by providing its Amazon Resource Name (ARN). This operation is only supported in stored and cached volume gateway types.</p><note><p>To list or delete a snapshot, you must use the Amazon EC2 API. For more information, go to <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p></note>
 
 @param request A container for the necessary parameters to execute the DeleteSnapshotSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteSnapshotScheduleInput
 @see AWSstoragegatewayDeleteSnapshotScheduleOutput
 */
- (void)deleteSnapshotSchedule:(AWSstoragegatewayDeleteSnapshotScheduleInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDeleteSnapshotScheduleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified virtual tape. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTape service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDeleteTapeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteTapeInput
 @see AWSstoragegatewayDeleteTapeOutput
 */
- (AWSTask<AWSstoragegatewayDeleteTapeOutput *> *)deleteTape:(AWSstoragegatewayDeleteTapeInput *)request;

/**
 <p>Deletes the specified virtual tape. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTape service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteTapeInput
 @see AWSstoragegatewayDeleteTapeOutput
 */
- (void)deleteTape:(AWSstoragegatewayDeleteTapeInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDeleteTapeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified virtual tape from the virtual tape shelf (VTS). This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTapeArchive service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDeleteTapeArchiveOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteTapeArchiveInput
 @see AWSstoragegatewayDeleteTapeArchiveOutput
 */
- (AWSTask<AWSstoragegatewayDeleteTapeArchiveOutput *> *)deleteTapeArchive:(AWSstoragegatewayDeleteTapeArchiveInput *)request;

/**
 <p>Deletes the specified virtual tape from the virtual tape shelf (VTS). This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DeleteTapeArchive service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteTapeArchiveInput
 @see AWSstoragegatewayDeleteTapeArchiveOutput
 */
- (void)deleteTapeArchive:(AWSstoragegatewayDeleteTapeArchiveInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDeleteTapeArchiveOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes the specified storage volume that you previously created using the <a>CreateCachediSCSIVolume</a> or <a>CreateStorediSCSIVolume</a> API. This operation is only supported in the cached volume and stored volume types. For stored volume gateways, the local disk that was configured as the storage volume is not deleted. You can reuse the local disk to create another storage volume. </p><p>Before you delete a volume, make sure there are no iSCSI connections to the volume you are deleting. You should also make sure there is no snapshot in progress. You can use the Amazon Elastic Compute Cloud (Amazon EC2) API to query snapshots on the volume you are deleting and check the snapshot status. For more information, go to <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html">DescribeSnapshots</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p><p>In the request, you must provide the Amazon Resource Name (ARN) of the storage volume you want to delete.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDeleteVolumeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteVolumeInput
 @see AWSstoragegatewayDeleteVolumeOutput
 */
- (AWSTask<AWSstoragegatewayDeleteVolumeOutput *> *)deleteVolume:(AWSstoragegatewayDeleteVolumeInput *)request;

/**
 <p>Deletes the specified storage volume that you previously created using the <a>CreateCachediSCSIVolume</a> or <a>CreateStorediSCSIVolume</a> API. This operation is only supported in the cached volume and stored volume types. For stored volume gateways, the local disk that was configured as the storage volume is not deleted. You can reuse the local disk to create another storage volume. </p><p>Before you delete a volume, make sure there are no iSCSI connections to the volume you are deleting. You should also make sure there is no snapshot in progress. You can use the Amazon Elastic Compute Cloud (Amazon EC2) API to query snapshots on the volume you are deleting and check the snapshot status. For more information, go to <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html">DescribeSnapshots</a> in the <i>Amazon Elastic Compute Cloud API Reference</i>.</p><p>In the request, you must provide the Amazon Resource Name (ARN) of the storage volume you want to delete.</p>
 
 @param request A container for the necessary parameters to execute the DeleteVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDeleteVolumeInput
 @see AWSstoragegatewayDeleteVolumeOutput
 */
- (void)deleteVolume:(AWSstoragegatewayDeleteVolumeInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDeleteVolumeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the most recent High Availability monitoring test that was performed on the host in a cluster. If a test isn't performed, the status and start time in the response would be null.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailabilityMonitorTest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeAvailabilityMonitorTestOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeAvailabilityMonitorTestInput
 @see AWSstoragegatewayDescribeAvailabilityMonitorTestOutput
 */
- (AWSTask<AWSstoragegatewayDescribeAvailabilityMonitorTestOutput *> *)describeAvailabilityMonitorTest:(AWSstoragegatewayDescribeAvailabilityMonitorTestInput *)request;

/**
 <p>Returns information about the most recent High Availability monitoring test that was performed on the host in a cluster. If a test isn't performed, the status and start time in the response would be null.</p>
 
 @param request A container for the necessary parameters to execute the DescribeAvailabilityMonitorTest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeAvailabilityMonitorTestInput
 @see AWSstoragegatewayDescribeAvailabilityMonitorTestOutput
 */
- (void)describeAvailabilityMonitorTest:(AWSstoragegatewayDescribeAvailabilityMonitorTestInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeAvailabilityMonitorTestOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the bandwidth rate limits of a gateway. By default, these limits are not set, which means no bandwidth rate limiting is in effect. This operation is supported for the stored volume, cached volume and tape gateway types.'</p><p>This operation only returns a value for a bandwidth rate limit only if the limit is set. If no limits are set for the gateway, then this operation returns only the gateway ARN in the response body. To specify which gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBandwidthRateLimit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeBandwidthRateLimitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeBandwidthRateLimitInput
 @see AWSstoragegatewayDescribeBandwidthRateLimitOutput
 */
- (AWSTask<AWSstoragegatewayDescribeBandwidthRateLimitOutput *> *)describeBandwidthRateLimit:(AWSstoragegatewayDescribeBandwidthRateLimitInput *)request;

/**
 <p>Returns the bandwidth rate limits of a gateway. By default, these limits are not set, which means no bandwidth rate limiting is in effect. This operation is supported for the stored volume, cached volume and tape gateway types.'</p><p>This operation only returns a value for a bandwidth rate limit only if the limit is set. If no limits are set for the gateway, then this operation returns only the gateway ARN in the response body. To specify which gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeBandwidthRateLimit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeBandwidthRateLimitInput
 @see AWSstoragegatewayDescribeBandwidthRateLimitOutput
 */
- (void)describeBandwidthRateLimit:(AWSstoragegatewayDescribeBandwidthRateLimitInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeBandwidthRateLimitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the cache of a gateway. This operation is only supported in the cached volume, tape, and file gateway types.</p><p>The response includes disk IDs that are configured as cache, and it includes the amount of cache allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCache service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeCacheOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeCacheInput
 @see AWSstoragegatewayDescribeCacheOutput
 */
- (AWSTask<AWSstoragegatewayDescribeCacheOutput *> *)describeCache:(AWSstoragegatewayDescribeCacheInput *)request;

/**
 <p>Returns information about the cache of a gateway. This operation is only supported in the cached volume, tape, and file gateway types.</p><p>The response includes disk IDs that are configured as cache, and it includes the amount of cache allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeCache service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeCacheInput
 @see AWSstoragegatewayDescribeCacheOutput
 */
- (void)describeCache:(AWSstoragegatewayDescribeCacheInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeCacheOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the gateway volumes specified in the request. This operation is only supported in the cached volume gateway types.</p><p>The list of gateway volumes in the request must be from one gateway. In the response, AWS Storage Gateway returns volume information sorted by volume Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the DescribeCachediSCSIVolumes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeCachediSCSIVolumesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeCachediSCSIVolumesInput
 @see AWSstoragegatewayDescribeCachediSCSIVolumesOutput
 */
- (AWSTask<AWSstoragegatewayDescribeCachediSCSIVolumesOutput *> *)describeCachediSCSIVolumes:(AWSstoragegatewayDescribeCachediSCSIVolumesInput *)request;

/**
 <p>Returns a description of the gateway volumes specified in the request. This operation is only supported in the cached volume gateway types.</p><p>The list of gateway volumes in the request must be from one gateway. In the response, AWS Storage Gateway returns volume information sorted by volume Amazon Resource Name (ARN).</p>
 
 @param request A container for the necessary parameters to execute the DescribeCachediSCSIVolumes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeCachediSCSIVolumesInput
 @see AWSstoragegatewayDescribeCachediSCSIVolumesOutput
 */
- (void)describeCachediSCSIVolumes:(AWSstoragegatewayDescribeCachediSCSIVolumesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeCachediSCSIVolumesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns an array of Challenge-Handshake Authentication Protocol (CHAP) credentials information for a specified iSCSI target, one for each target-initiator pair. This operation is supported in the volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DescribeChapCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeChapCredentialsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeChapCredentialsInput
 @see AWSstoragegatewayDescribeChapCredentialsOutput
 */
- (AWSTask<AWSstoragegatewayDescribeChapCredentialsOutput *> *)describeChapCredentials:(AWSstoragegatewayDescribeChapCredentialsInput *)request;

/**
 <p>Returns an array of Challenge-Handshake Authentication Protocol (CHAP) credentials information for a specified iSCSI target, one for each target-initiator pair. This operation is supported in the volume and tape gateway types.</p>
 
 @param request A container for the necessary parameters to execute the DescribeChapCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeChapCredentialsInput
 @see AWSstoragegatewayDescribeChapCredentialsOutput
 */
- (void)describeChapCredentials:(AWSstoragegatewayDescribeChapCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeChapCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns metadata about a gateway such as its name, network interfaces, configured time zone, and the state (whether the gateway is running or not). To specify which gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGatewayInformation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeGatewayInformationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeGatewayInformationInput
 @see AWSstoragegatewayDescribeGatewayInformationOutput
 */
- (AWSTask<AWSstoragegatewayDescribeGatewayInformationOutput *> *)describeGatewayInformation:(AWSstoragegatewayDescribeGatewayInformationInput *)request;

/**
 <p>Returns metadata about a gateway such as its name, network interfaces, configured time zone, and the state (whether the gateway is running or not). To specify which gateway to describe, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the DescribeGatewayInformation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeGatewayInformationInput
 @see AWSstoragegatewayDescribeGatewayInformationOutput
 */
- (void)describeGatewayInformation:(AWSstoragegatewayDescribeGatewayInformationInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeGatewayInformationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns your gateway's weekly maintenance start time including the day and time of the week. Note that values are in terms of the gateway's time zone.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceStartTime service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeMaintenanceStartTimeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeMaintenanceStartTimeInput
 @see AWSstoragegatewayDescribeMaintenanceStartTimeOutput
 */
- (AWSTask<AWSstoragegatewayDescribeMaintenanceStartTimeOutput *> *)describeMaintenanceStartTime:(AWSstoragegatewayDescribeMaintenanceStartTimeInput *)request;

/**
 <p>Returns your gateway's weekly maintenance start time including the day and time of the week. Note that values are in terms of the gateway's time zone.</p>
 
 @param request A container for the necessary parameters to execute the DescribeMaintenanceStartTime service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeMaintenanceStartTimeInput
 @see AWSstoragegatewayDescribeMaintenanceStartTimeOutput
 */
- (void)describeMaintenanceStartTime:(AWSstoragegatewayDescribeMaintenanceStartTimeInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeMaintenanceStartTimeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a description for one or more Network File System (NFS) file shares from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNFSFileShares service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeNFSFileSharesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeNFSFileSharesInput
 @see AWSstoragegatewayDescribeNFSFileSharesOutput
 */
- (AWSTask<AWSstoragegatewayDescribeNFSFileSharesOutput *> *)describeNFSFileShares:(AWSstoragegatewayDescribeNFSFileSharesInput *)request;

/**
 <p>Gets a description for one or more Network File System (NFS) file shares from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeNFSFileShares service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeNFSFileSharesInput
 @see AWSstoragegatewayDescribeNFSFileSharesOutput
 */
- (void)describeNFSFileShares:(AWSstoragegatewayDescribeNFSFileSharesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeNFSFileSharesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a description for one or more Server Message Block (SMB) file shares from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSMBFileShares service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeSMBFileSharesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeSMBFileSharesInput
 @see AWSstoragegatewayDescribeSMBFileSharesOutput
 */
- (AWSTask<AWSstoragegatewayDescribeSMBFileSharesOutput *> *)describeSMBFileShares:(AWSstoragegatewayDescribeSMBFileSharesInput *)request;

/**
 <p>Gets a description for one or more Server Message Block (SMB) file shares from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSMBFileShares service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeSMBFileSharesInput
 @see AWSstoragegatewayDescribeSMBFileSharesOutput
 */
- (void)describeSMBFileShares:(AWSstoragegatewayDescribeSMBFileSharesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeSMBFileSharesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a description of a Server Message Block (SMB) file share settings from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSMBSettings service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeSMBSettingsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeSMBSettingsInput
 @see AWSstoragegatewayDescribeSMBSettingsOutput
 */
- (AWSTask<AWSstoragegatewayDescribeSMBSettingsOutput *> *)describeSMBSettings:(AWSstoragegatewayDescribeSMBSettingsInput *)request;

/**
 <p>Gets a description of a Server Message Block (SMB) file share settings from a file gateway. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSMBSettings service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeSMBSettingsInput
 @see AWSstoragegatewayDescribeSMBSettingsOutput
 */
- (void)describeSMBSettings:(AWSstoragegatewayDescribeSMBSettingsInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeSMBSettingsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Describes the snapshot schedule for the specified gateway volume. The snapshot schedule information includes intervals at which snapshots are automatically initiated on the volume. This operation is only supported in the cached volume and stored volume types.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeSnapshotScheduleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeSnapshotScheduleInput
 @see AWSstoragegatewayDescribeSnapshotScheduleOutput
 */
- (AWSTask<AWSstoragegatewayDescribeSnapshotScheduleOutput *> *)describeSnapshotSchedule:(AWSstoragegatewayDescribeSnapshotScheduleInput *)request;

/**
 <p>Describes the snapshot schedule for the specified gateway volume. The snapshot schedule information includes intervals at which snapshots are automatically initiated on the volume. This operation is only supported in the cached volume and stored volume types.</p>
 
 @param request A container for the necessary parameters to execute the DescribeSnapshotSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeSnapshotScheduleInput
 @see AWSstoragegatewayDescribeSnapshotScheduleOutput
 */
- (void)describeSnapshotSchedule:(AWSstoragegatewayDescribeSnapshotScheduleInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeSnapshotScheduleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of the gateway volumes specified in the request. The list of gateway volumes in the request must be from one gateway. In the response AWS Storage Gateway returns volume information sorted by volume ARNs. This operation is only supported in stored volume gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStorediSCSIVolumes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeStorediSCSIVolumesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeStorediSCSIVolumesInput
 @see AWSstoragegatewayDescribeStorediSCSIVolumesOutput
 */
- (AWSTask<AWSstoragegatewayDescribeStorediSCSIVolumesOutput *> *)describeStorediSCSIVolumes:(AWSstoragegatewayDescribeStorediSCSIVolumesInput *)request;

/**
 <p>Returns the description of the gateway volumes specified in the request. The list of gateway volumes in the request must be from one gateway. In the response AWS Storage Gateway returns volume information sorted by volume ARNs. This operation is only supported in stored volume gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeStorediSCSIVolumes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeStorediSCSIVolumesInput
 @see AWSstoragegatewayDescribeStorediSCSIVolumesOutput
 */
- (void)describeStorediSCSIVolumes:(AWSstoragegatewayDescribeStorediSCSIVolumesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeStorediSCSIVolumesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of specified virtual tapes in the virtual tape shelf (VTS). This operation is only supported in the tape gateway type.</p><p>If a specific <code>TapeARN</code> is not specified, AWS Storage Gateway returns a description of all virtual tapes found in the VTS associated with your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapeArchives service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeTapeArchivesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeTapeArchivesInput
 @see AWSstoragegatewayDescribeTapeArchivesOutput
 */
- (AWSTask<AWSstoragegatewayDescribeTapeArchivesOutput *> *)describeTapeArchives:(AWSstoragegatewayDescribeTapeArchivesInput *)request;

/**
 <p>Returns a description of specified virtual tapes in the virtual tape shelf (VTS). This operation is only supported in the tape gateway type.</p><p>If a specific <code>TapeARN</code> is not specified, AWS Storage Gateway returns a description of all virtual tapes found in the VTS associated with your account.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapeArchives service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeTapeArchivesInput
 @see AWSstoragegatewayDescribeTapeArchivesOutput
 */
- (void)describeTapeArchives:(AWSstoragegatewayDescribeTapeArchivesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeTapeArchivesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of virtual tape recovery points that are available for the specified tape gateway.</p><p>A recovery point is a point-in-time view of a virtual tape at which all the data on the virtual tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to a new gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapeRecoveryPoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeTapeRecoveryPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeTapeRecoveryPointsInput
 @see AWSstoragegatewayDescribeTapeRecoveryPointsOutput
 */
- (AWSTask<AWSstoragegatewayDescribeTapeRecoveryPointsOutput *> *)describeTapeRecoveryPoints:(AWSstoragegatewayDescribeTapeRecoveryPointsInput *)request;

/**
 <p>Returns a list of virtual tape recovery points that are available for the specified tape gateway.</p><p>A recovery point is a point-in-time view of a virtual tape at which all the data on the virtual tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to a new gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapeRecoveryPoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeTapeRecoveryPointsInput
 @see AWSstoragegatewayDescribeTapeRecoveryPointsOutput
 */
- (void)describeTapeRecoveryPoints:(AWSstoragegatewayDescribeTapeRecoveryPointsInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeTapeRecoveryPointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of the specified Amazon Resource Name (ARN) of virtual tapes. If a <code>TapeARN</code> is not specified, returns a description of all virtual tapes associated with the specified gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeTapesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeTapesInput
 @see AWSstoragegatewayDescribeTapesOutput
 */
- (AWSTask<AWSstoragegatewayDescribeTapesOutput *> *)describeTapes:(AWSstoragegatewayDescribeTapesInput *)request;

/**
 <p>Returns a description of the specified Amazon Resource Name (ARN) of virtual tapes. If a <code>TapeARN</code> is not specified, returns a description of all virtual tapes associated with the specified gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeTapes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeTapesInput
 @see AWSstoragegatewayDescribeTapesOutput
 */
- (void)describeTapes:(AWSstoragegatewayDescribeTapesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeTapesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the upload buffer of a gateway. This operation is supported for the stored volume, cached volume and tape gateway types.</p><p>The response includes disk IDs that are configured as upload buffer space, and it includes the amount of upload buffer space allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUploadBuffer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeUploadBufferOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeUploadBufferInput
 @see AWSstoragegatewayDescribeUploadBufferOutput
 */
- (AWSTask<AWSstoragegatewayDescribeUploadBufferOutput *> *)describeUploadBuffer:(AWSstoragegatewayDescribeUploadBufferInput *)request;

/**
 <p>Returns information about the upload buffer of a gateway. This operation is supported for the stored volume, cached volume and tape gateway types.</p><p>The response includes disk IDs that are configured as upload buffer space, and it includes the amount of upload buffer space allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeUploadBuffer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeUploadBufferInput
 @see AWSstoragegatewayDescribeUploadBufferOutput
 */
- (void)describeUploadBuffer:(AWSstoragegatewayDescribeUploadBufferInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeUploadBufferOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a description of virtual tape library (VTL) devices for the specified tape gateway. In the response, AWS Storage Gateway returns VTL device information.</p><p>This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVTLDevices service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeVTLDevicesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeVTLDevicesInput
 @see AWSstoragegatewayDescribeVTLDevicesOutput
 */
- (AWSTask<AWSstoragegatewayDescribeVTLDevicesOutput *> *)describeVTLDevices:(AWSstoragegatewayDescribeVTLDevicesInput *)request;

/**
 <p>Returns a description of virtual tape library (VTL) devices for the specified tape gateway. In the response, AWS Storage Gateway returns VTL device information.</p><p>This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DescribeVTLDevices service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeVTLDevicesInput
 @see AWSstoragegatewayDescribeVTLDevicesOutput
 */
- (void)describeVTLDevices:(AWSstoragegatewayDescribeVTLDevicesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeVTLDevicesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns information about the working storage of a gateway. This operation is only supported in the stored volumes gateway type. This operation is deprecated in cached volumes API version (20120630). Use DescribeUploadBuffer instead.</p><note><p>Working storage is also referred to as upload buffer. You can also use the DescribeUploadBuffer operation to add upload buffer to a stored volume gateway.</p></note><p>The response includes disk IDs that are configured as working storage, and it includes the amount of working storage allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeWorkingStorage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDescribeWorkingStorageOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeWorkingStorageInput
 @see AWSstoragegatewayDescribeWorkingStorageOutput
 */
- (AWSTask<AWSstoragegatewayDescribeWorkingStorageOutput *> *)describeWorkingStorage:(AWSstoragegatewayDescribeWorkingStorageInput *)request;

/**
 <p>Returns information about the working storage of a gateway. This operation is only supported in the stored volumes gateway type. This operation is deprecated in cached volumes API version (20120630). Use DescribeUploadBuffer instead.</p><note><p>Working storage is also referred to as upload buffer. You can also use the DescribeUploadBuffer operation to add upload buffer to a stored volume gateway.</p></note><p>The response includes disk IDs that are configured as working storage, and it includes the amount of working storage allocated and used.</p>
 
 @param request A container for the necessary parameters to execute the DescribeWorkingStorage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDescribeWorkingStorageInput
 @see AWSstoragegatewayDescribeWorkingStorageOutput
 */
- (void)describeWorkingStorage:(AWSstoragegatewayDescribeWorkingStorageInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDescribeWorkingStorageOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disconnects a volume from an iSCSI connection and then detaches the volume from the specified gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a different gateway without creating a snapshot. It also makes it easier to move your volumes from an on-premises gateway to a gateway hosted on an Amazon EC2 instance. This operation is only supported in the volume gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DetachVolume service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDetachVolumeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDetachVolumeInput
 @see AWSstoragegatewayDetachVolumeOutput
 */
- (AWSTask<AWSstoragegatewayDetachVolumeOutput *> *)detachVolume:(AWSstoragegatewayDetachVolumeInput *)request;

/**
 <p>Disconnects a volume from an iSCSI connection and then detaches the volume from the specified gateway. Detaching and attaching a volume enables you to recover your data from one gateway to a different gateway without creating a snapshot. It also makes it easier to move your volumes from an on-premises gateway to a gateway hosted on an Amazon EC2 instance. This operation is only supported in the volume gateway type.</p>
 
 @param request A container for the necessary parameters to execute the DetachVolume service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDetachVolumeInput
 @see AWSstoragegatewayDetachVolumeOutput
 */
- (void)detachVolume:(AWSstoragegatewayDetachVolumeInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDetachVolumeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disables a tape gateway when the gateway is no longer functioning. For example, if your gateway VM is damaged, you can disable the gateway so you can recover virtual tapes.</p><p>Use this operation for a tape gateway that is not reachable or not functioning. This operation is only supported in the tape gateway type.</p><important><p>After a gateway is disabled, it cannot be enabled.</p></important>
 
 @param request A container for the necessary parameters to execute the DisableGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayDisableGatewayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDisableGatewayInput
 @see AWSstoragegatewayDisableGatewayOutput
 */
- (AWSTask<AWSstoragegatewayDisableGatewayOutput *> *)disableGateway:(AWSstoragegatewayDisableGatewayInput *)request;

/**
 <p>Disables a tape gateway when the gateway is no longer functioning. For example, if your gateway VM is damaged, you can disable the gateway so you can recover virtual tapes.</p><p>Use this operation for a tape gateway that is not reachable or not functioning. This operation is only supported in the tape gateway type.</p><important><p>After a gateway is disabled, it cannot be enabled.</p></important>
 
 @param request A container for the necessary parameters to execute the DisableGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayDisableGatewayInput
 @see AWSstoragegatewayDisableGatewayOutput
 */
- (void)disableGateway:(AWSstoragegatewayDisableGatewayInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayDisableGatewayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Adds a file gateway to an Active Directory domain. This operation is only supported for file gateways that support the SMB file protocol.</p>
 
 @param request A container for the necessary parameters to execute the JoinDomain service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayJoinDomainOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayJoinDomainInput
 @see AWSstoragegatewayJoinDomainOutput
 */
- (AWSTask<AWSstoragegatewayJoinDomainOutput *> *)joinDomain:(AWSstoragegatewayJoinDomainInput *)request;

/**
 <p>Adds a file gateway to an Active Directory domain. This operation is only supported for file gateways that support the SMB file protocol.</p>
 
 @param request A container for the necessary parameters to execute the JoinDomain service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayJoinDomainInput
 @see AWSstoragegatewayJoinDomainOutput
 */
- (void)joinDomain:(AWSstoragegatewayJoinDomainInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayJoinDomainOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the automatic tape creation policies for a gateway. If there are no automatic tape creation policies for the gateway, it returns an empty list. </p><p>This operation is only supported for tape gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListAutomaticTapeCreationPolicies service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListAutomaticTapeCreationPoliciesInput
 @see AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput
 */
- (AWSTask<AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput *> *)listAutomaticTapeCreationPolicies:(AWSstoragegatewayListAutomaticTapeCreationPoliciesInput *)request;

/**
 <p>Lists the automatic tape creation policies for a gateway. If there are no automatic tape creation policies for the gateway, it returns an empty list. </p><p>This operation is only supported for tape gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListAutomaticTapeCreationPolicies service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListAutomaticTapeCreationPoliciesInput
 @see AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput
 */
- (void)listAutomaticTapeCreationPolicies:(AWSstoragegatewayListAutomaticTapeCreationPoliciesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets a list of the file shares for a specific file gateway, or the list of file shares that belong to the calling user account. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListFileShares service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayListFileSharesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListFileSharesInput
 @see AWSstoragegatewayListFileSharesOutput
 */
- (AWSTask<AWSstoragegatewayListFileSharesOutput *> *)listFileShares:(AWSstoragegatewayListFileSharesInput *)request;

/**
 <p>Gets a list of the file shares for a specific file gateway, or the list of file shares that belong to the calling user account. This operation is only supported for file gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListFileShares service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListFileSharesInput
 @see AWSstoragegatewayListFileSharesOutput
 */
- (void)listFileShares:(AWSstoragegatewayListFileSharesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayListFileSharesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists gateways owned by an AWS account in an AWS Region specified in the request. The returned list is ordered by gateway Amazon Resource Name (ARN).</p><p>By default, the operation returns a maximum of 100 gateways. This operation supports pagination that allows you to optionally reduce the number of gateways returned in a response.</p><p>If you have more gateways than are returned in a response (that is, the response returns only a truncated list of your gateways), the response contains a marker that you can specify in your next request to fetch the next page of gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListGateways service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayListGatewaysOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListGatewaysInput
 @see AWSstoragegatewayListGatewaysOutput
 */
- (AWSTask<AWSstoragegatewayListGatewaysOutput *> *)listGateways:(AWSstoragegatewayListGatewaysInput *)request;

/**
 <p>Lists gateways owned by an AWS account in an AWS Region specified in the request. The returned list is ordered by gateway Amazon Resource Name (ARN).</p><p>By default, the operation returns a maximum of 100 gateways. This operation supports pagination that allows you to optionally reduce the number of gateways returned in a response.</p><p>If you have more gateways than are returned in a response (that is, the response returns only a truncated list of your gateways), the response contains a marker that you can specify in your next request to fetch the next page of gateways.</p>
 
 @param request A container for the necessary parameters to execute the ListGateways service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListGatewaysInput
 @see AWSstoragegatewayListGatewaysOutput
 */
- (void)listGateways:(AWSstoragegatewayListGatewaysInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayListGatewaysOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of the gateway's local disks. To specify which gateway to describe, you use the Amazon Resource Name (ARN) of the gateway in the body of the request.</p><p>The request returns a list of all disks, specifying which are configured as working storage, cache storage, or stored volume or not configured at all. The response includes a <code>DiskStatus</code> field. This field can have a value of present (the disk is available to use), missing (the disk is no longer connected to the gateway), or mismatch (the disk node is occupied by a disk that has incorrect metadata or the disk content is corrupted).</p>
 
 @param request A container for the necessary parameters to execute the ListLocalDisks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayListLocalDisksOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListLocalDisksInput
 @see AWSstoragegatewayListLocalDisksOutput
 */
- (AWSTask<AWSstoragegatewayListLocalDisksOutput *> *)listLocalDisks:(AWSstoragegatewayListLocalDisksInput *)request;

/**
 <p>Returns a list of the gateway's local disks. To specify which gateway to describe, you use the Amazon Resource Name (ARN) of the gateway in the body of the request.</p><p>The request returns a list of all disks, specifying which are configured as working storage, cache storage, or stored volume or not configured at all. The response includes a <code>DiskStatus</code> field. This field can have a value of present (the disk is available to use), missing (the disk is no longer connected to the gateway), or mismatch (the disk node is occupied by a disk that has incorrect metadata or the disk content is corrupted).</p>
 
 @param request A container for the necessary parameters to execute the ListLocalDisks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListLocalDisksInput
 @see AWSstoragegatewayListLocalDisksOutput
 */
- (void)listLocalDisks:(AWSstoragegatewayListLocalDisksInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayListLocalDisksOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the tags that have been added to the specified resource. This operation is supported in storage gateways of all types.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayListTagsForResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListTagsForResourceInput
 @see AWSstoragegatewayListTagsForResourceOutput
 */
- (AWSTask<AWSstoragegatewayListTagsForResourceOutput *> *)listTagsForResource:(AWSstoragegatewayListTagsForResourceInput *)request;

/**
 <p>Lists the tags that have been added to the specified resource. This operation is supported in storage gateways of all types.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListTagsForResourceInput
 @see AWSstoragegatewayListTagsForResourceOutput
 */
- (void)listTagsForResource:(AWSstoragegatewayListTagsForResourceInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayListTagsForResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists virtual tapes in your virtual tape library (VTL) and your virtual tape shelf (VTS). You specify the tapes to list by specifying one or more tape Amazon Resource Names (ARNs). If you don't specify a tape ARN, the operation lists all virtual tapes in both your VTL and VTS.</p><p>This operation supports pagination. By default, the operation returns a maximum of up to 100 tapes. You can optionally specify the <code>Limit</code> parameter in the body to limit the number of tapes in the response. If the number of tapes returned in the response is truncated, the response includes a <code>Marker</code> element that you can use in your subsequent request to retrieve the next set of tapes. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the ListTapes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayListTapesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListTapesInput
 @see AWSstoragegatewayListTapesOutput
 */
- (AWSTask<AWSstoragegatewayListTapesOutput *> *)listTapes:(AWSstoragegatewayListTapesInput *)request;

/**
 <p>Lists virtual tapes in your virtual tape library (VTL) and your virtual tape shelf (VTS). You specify the tapes to list by specifying one or more tape Amazon Resource Names (ARNs). If you don't specify a tape ARN, the operation lists all virtual tapes in both your VTL and VTS.</p><p>This operation supports pagination. By default, the operation returns a maximum of up to 100 tapes. You can optionally specify the <code>Limit</code> parameter in the body to limit the number of tapes in the response. If the number of tapes returned in the response is truncated, the response includes a <code>Marker</code> element that you can use in your subsequent request to retrieve the next set of tapes. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the ListTapes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListTapesInput
 @see AWSstoragegatewayListTapesOutput
 */
- (void)listTapes:(AWSstoragegatewayListTapesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayListTapesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists iSCSI initiators that are connected to a volume. You can use this operation to determine whether a volume is being used or not. This operation is only supported in the cached volume and stored volume gateway types.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumeInitiators service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayListVolumeInitiatorsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListVolumeInitiatorsInput
 @see AWSstoragegatewayListVolumeInitiatorsOutput
 */
- (AWSTask<AWSstoragegatewayListVolumeInitiatorsOutput *> *)listVolumeInitiators:(AWSstoragegatewayListVolumeInitiatorsInput *)request;

/**
 <p>Lists iSCSI initiators that are connected to a volume. You can use this operation to determine whether a volume is being used or not. This operation is only supported in the cached volume and stored volume gateway types.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumeInitiators service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListVolumeInitiatorsInput
 @see AWSstoragegatewayListVolumeInitiatorsOutput
 */
- (void)listVolumeInitiators:(AWSstoragegatewayListVolumeInitiatorsInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayListVolumeInitiatorsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the recovery points for a specified gateway. This operation is only supported in the cached volume gateway type.</p><p>Each cache volume has one recovery point. A volume recovery point is a point in time at which all data of the volume is consistent and from which you can create a snapshot or clone a new cached volume from a source volume. To create a snapshot from a volume recovery point use the <a>CreateSnapshotFromVolumeRecoveryPoint</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumeRecoveryPoints service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayListVolumeRecoveryPointsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListVolumeRecoveryPointsInput
 @see AWSstoragegatewayListVolumeRecoveryPointsOutput
 */
- (AWSTask<AWSstoragegatewayListVolumeRecoveryPointsOutput *> *)listVolumeRecoveryPoints:(AWSstoragegatewayListVolumeRecoveryPointsInput *)request;

/**
 <p>Lists the recovery points for a specified gateway. This operation is only supported in the cached volume gateway type.</p><p>Each cache volume has one recovery point. A volume recovery point is a point in time at which all data of the volume is consistent and from which you can create a snapshot or clone a new cached volume from a source volume. To create a snapshot from a volume recovery point use the <a>CreateSnapshotFromVolumeRecoveryPoint</a> operation.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumeRecoveryPoints service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListVolumeRecoveryPointsInput
 @see AWSstoragegatewayListVolumeRecoveryPointsOutput
 */
- (void)listVolumeRecoveryPoints:(AWSstoragegatewayListVolumeRecoveryPointsInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayListVolumeRecoveryPointsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists the iSCSI stored volumes of a gateway. Results are sorted by volume ARN. The response includes only the volume ARNs. If you want additional volume information, use the <a>DescribeStorediSCSIVolumes</a> or the <a>DescribeCachediSCSIVolumes</a> API.</p><p>The operation supports pagination. By default, the operation returns a maximum of up to 100 volumes. You can optionally specify the <code>Limit</code> field in the body to limit the number of volumes in the response. If the number of volumes returned in the response is truncated, the response includes a Marker field. You can use this Marker value in your subsequent request to retrieve the next set of volumes. This operation is only supported in the cached volume and stored volume gateway types.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayListVolumesOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListVolumesInput
 @see AWSstoragegatewayListVolumesOutput
 */
- (AWSTask<AWSstoragegatewayListVolumesOutput *> *)listVolumes:(AWSstoragegatewayListVolumesInput *)request;

/**
 <p>Lists the iSCSI stored volumes of a gateway. Results are sorted by volume ARN. The response includes only the volume ARNs. If you want additional volume information, use the <a>DescribeStorediSCSIVolumes</a> or the <a>DescribeCachediSCSIVolumes</a> API.</p><p>The operation supports pagination. By default, the operation returns a maximum of up to 100 volumes. You can optionally specify the <code>Limit</code> field in the body to limit the number of volumes in the response. If the number of volumes returned in the response is truncated, the response includes a Marker field. You can use this Marker value in your subsequent request to retrieve the next set of volumes. This operation is only supported in the cached volume and stored volume gateway types.</p>
 
 @param request A container for the necessary parameters to execute the ListVolumes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayListVolumesInput
 @see AWSstoragegatewayListVolumesOutput
 */
- (void)listVolumes:(AWSstoragegatewayListVolumesInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayListVolumesOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends you notification through CloudWatch Events when all files written to your file share have been uploaded to Amazon S3.</p><p>AWS Storage Gateway can send a notification through Amazon CloudWatch Events when all files written to your file share up to that point in time have been uploaded to Amazon S3. These files include files written to the file share up to the time that you make a request for notification. When the upload is done, Storage Gateway sends you notification through an Amazon CloudWatch Event. You can configure CloudWatch Events to send the notification through event targets such as Amazon SNS or AWS Lambda function. This operation is only supported for file gateways.</p><p>For more information, see Getting File Upload Notification in the Storage Gateway User Guide (https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-upload-notification). </p>
 
 @param request A container for the necessary parameters to execute the NotifyWhenUploaded service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayNotifyWhenUploadedOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayNotifyWhenUploadedInput
 @see AWSstoragegatewayNotifyWhenUploadedOutput
 */
- (AWSTask<AWSstoragegatewayNotifyWhenUploadedOutput *> *)notifyWhenUploaded:(AWSstoragegatewayNotifyWhenUploadedInput *)request;

/**
 <p>Sends you notification through CloudWatch Events when all files written to your file share have been uploaded to Amazon S3.</p><p>AWS Storage Gateway can send a notification through Amazon CloudWatch Events when all files written to your file share up to that point in time have been uploaded to Amazon S3. These files include files written to the file share up to the time that you make a request for notification. When the upload is done, Storage Gateway sends you notification through an Amazon CloudWatch Event. You can configure CloudWatch Events to send the notification through event targets such as Amazon SNS or AWS Lambda function. This operation is only supported for file gateways.</p><p>For more information, see Getting File Upload Notification in the Storage Gateway User Guide (https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-upload-notification). </p>
 
 @param request A container for the necessary parameters to execute the NotifyWhenUploaded service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayNotifyWhenUploadedInput
 @see AWSstoragegatewayNotifyWhenUploadedOutput
 */
- (void)notifyWhenUploaded:(AWSstoragegatewayNotifyWhenUploadedInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayNotifyWhenUploadedOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Refreshes the cache for the specified file share. This operation finds objects in the Amazon S3 bucket that were added, removed or replaced since the gateway last listed the bucket's contents and cached the results. This operation is only supported in the file gateway type. You can subscribe to be notified through an Amazon CloudWatch event when your RefreshCache operation completes. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting Notified About File Operations</a>.</p><p>When this API is called, it only initiates the refresh operation. When the API call completes and returns a success code, it doesn't necessarily mean that the file refresh has completed. You should use the refresh-complete notification to determine that the operation has completed before you check for new files on the gateway file share. You can subscribe to be notified through an CloudWatch event when your <code>RefreshCache</code> operation completes. </p><p>Throttle limit: This API is asynchronous so the gateway will accept no more than two refreshes at any time. We recommend using the refresh-complete CloudWatch event notification before issuing additional requests. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting Notified About File Operations</a>.</p><p>If you invoke the RefreshCache API when two requests are already being processed, any new request will cause an <code>InvalidGatewayRequestException</code> error because too many requests were sent to the server.</p><p>For more information, see "https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification".</p>
 
 @param request A container for the necessary parameters to execute the RefreshCache service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayRefreshCacheOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayRefreshCacheInput
 @see AWSstoragegatewayRefreshCacheOutput
 */
- (AWSTask<AWSstoragegatewayRefreshCacheOutput *> *)refreshCache:(AWSstoragegatewayRefreshCacheInput *)request;

/**
 <p>Refreshes the cache for the specified file share. This operation finds objects in the Amazon S3 bucket that were added, removed or replaced since the gateway last listed the bucket's contents and cached the results. This operation is only supported in the file gateway type. You can subscribe to be notified through an Amazon CloudWatch event when your RefreshCache operation completes. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting Notified About File Operations</a>.</p><p>When this API is called, it only initiates the refresh operation. When the API call completes and returns a success code, it doesn't necessarily mean that the file refresh has completed. You should use the refresh-complete notification to determine that the operation has completed before you check for new files on the gateway file share. You can subscribe to be notified through an CloudWatch event when your <code>RefreshCache</code> operation completes. </p><p>Throttle limit: This API is asynchronous so the gateway will accept no more than two refreshes at any time. We recommend using the refresh-complete CloudWatch event notification before issuing additional requests. For more information, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification">Getting Notified About File Operations</a>.</p><p>If you invoke the RefreshCache API when two requests are already being processed, any new request will cause an <code>InvalidGatewayRequestException</code> error because too many requests were sent to the server.</p><p>For more information, see "https://docs.aws.amazon.com/storagegateway/latest/userguide/monitoring-file-gateway.html#get-notification".</p>
 
 @param request A container for the necessary parameters to execute the RefreshCache service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayRefreshCacheInput
 @see AWSstoragegatewayRefreshCacheOutput
 */
- (void)refreshCache:(AWSstoragegatewayRefreshCacheInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayRefreshCacheOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes one or more tags from the specified resource. This operation is supported in storage gateways of all types.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayRemoveTagsFromResourceOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayRemoveTagsFromResourceInput
 @see AWSstoragegatewayRemoveTagsFromResourceOutput
 */
- (AWSTask<AWSstoragegatewayRemoveTagsFromResourceOutput *> *)removeTagsFromResource:(AWSstoragegatewayRemoveTagsFromResourceInput *)request;

/**
 <p>Removes one or more tags from the specified resource. This operation is supported in storage gateways of all types.</p>
 
 @param request A container for the necessary parameters to execute the RemoveTagsFromResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayRemoveTagsFromResourceInput
 @see AWSstoragegatewayRemoveTagsFromResourceOutput
 */
- (void)removeTagsFromResource:(AWSstoragegatewayRemoveTagsFromResourceInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayRemoveTagsFromResourceOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Resets all cache disks that have encountered an error and makes the disks available for reconfiguration as cache storage. If your cache disk encounters an error, the gateway prevents read and write operations on virtual tapes in the gateway. For example, an error can occur when a disk is corrupted or removed from the gateway. When a cache is reset, the gateway loses its cache storage. At this point, you can reconfigure the disks as cache disks. This operation is only supported in the cached volume and tape types.</p><important><p>If the cache disk you are resetting contains data that has not been uploaded to Amazon S3 yet, that data can be lost. After you reset cache disks, there will be no configured cache disks left in the gateway, so you must configure at least one new cache disk for your gateway to function properly.</p></important>
 
 @param request A container for the necessary parameters to execute the ResetCache service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayResetCacheOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayResetCacheInput
 @see AWSstoragegatewayResetCacheOutput
 */
- (AWSTask<AWSstoragegatewayResetCacheOutput *> *)resetCache:(AWSstoragegatewayResetCacheInput *)request;

/**
 <p>Resets all cache disks that have encountered an error and makes the disks available for reconfiguration as cache storage. If your cache disk encounters an error, the gateway prevents read and write operations on virtual tapes in the gateway. For example, an error can occur when a disk is corrupted or removed from the gateway. When a cache is reset, the gateway loses its cache storage. At this point, you can reconfigure the disks as cache disks. This operation is only supported in the cached volume and tape types.</p><important><p>If the cache disk you are resetting contains data that has not been uploaded to Amazon S3 yet, that data can be lost. After you reset cache disks, there will be no configured cache disks left in the gateway, so you must configure at least one new cache disk for your gateway to function properly.</p></important>
 
 @param request A container for the necessary parameters to execute the ResetCache service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayResetCacheInput
 @see AWSstoragegatewayResetCacheOutput
 */
- (void)resetCache:(AWSstoragegatewayResetCacheInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayResetCacheOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a tape gateway. Virtual tapes archived in the VTS are not associated with any gateway. However after a tape is retrieved, it is associated with a gateway, even though it is also listed in the VTS, that is, archive. This operation is only supported in the tape gateway type.</p><p>Once a tape is successfully retrieved to a gateway, it cannot be retrieved again to another gateway. You must archive the tape again before you can retrieve it to another gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the RetrieveTapeArchive service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayRetrieveTapeArchiveOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayRetrieveTapeArchiveInput
 @see AWSstoragegatewayRetrieveTapeArchiveOutput
 */
- (AWSTask<AWSstoragegatewayRetrieveTapeArchiveOutput *> *)retrieveTapeArchive:(AWSstoragegatewayRetrieveTapeArchiveInput *)request;

/**
 <p>Retrieves an archived virtual tape from the virtual tape shelf (VTS) to a tape gateway. Virtual tapes archived in the VTS are not associated with any gateway. However after a tape is retrieved, it is associated with a gateway, even though it is also listed in the VTS, that is, archive. This operation is only supported in the tape gateway type.</p><p>Once a tape is successfully retrieved to a gateway, it cannot be retrieved again to another gateway. You must archive the tape again before you can retrieve it to another gateway. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the RetrieveTapeArchive service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayRetrieveTapeArchiveInput
 @see AWSstoragegatewayRetrieveTapeArchiveOutput
 */
- (void)retrieveTapeArchive:(AWSstoragegatewayRetrieveTapeArchiveInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayRetrieveTapeArchiveOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the recovery point for the specified virtual tape. This operation is only supported in the tape gateway type.</p><p>A recovery point is a point in time view of a virtual tape at which all the data on the tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to a new gateway.</p><note><p>The virtual tape can be retrieved to only one gateway. The retrieved tape is read-only. The virtual tape can be retrieved to only a tape gateway. There is no charge for retrieving recovery points.</p></note>
 
 @param request A container for the necessary parameters to execute the RetrieveTapeRecoveryPoint service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayRetrieveTapeRecoveryPointOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayRetrieveTapeRecoveryPointInput
 @see AWSstoragegatewayRetrieveTapeRecoveryPointOutput
 */
- (AWSTask<AWSstoragegatewayRetrieveTapeRecoveryPointOutput *> *)retrieveTapeRecoveryPoint:(AWSstoragegatewayRetrieveTapeRecoveryPointInput *)request;

/**
 <p>Retrieves the recovery point for the specified virtual tape. This operation is only supported in the tape gateway type.</p><p>A recovery point is a point in time view of a virtual tape at which all the data on the tape is consistent. If your gateway crashes, virtual tapes that have recovery points can be recovered to a new gateway.</p><note><p>The virtual tape can be retrieved to only one gateway. The retrieved tape is read-only. The virtual tape can be retrieved to only a tape gateway. There is no charge for retrieving recovery points.</p></note>
 
 @param request A container for the necessary parameters to execute the RetrieveTapeRecoveryPoint service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayRetrieveTapeRecoveryPointInput
 @see AWSstoragegatewayRetrieveTapeRecoveryPointOutput
 */
- (void)retrieveTapeRecoveryPoint:(AWSstoragegatewayRetrieveTapeRecoveryPointInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayRetrieveTapeRecoveryPointOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the password for your VM local console. When you log in to the local console for the first time, you log in to the VM with the default credentials. We recommend that you set a new password. You don't need to know the default password to set a new password.</p>
 
 @param request A container for the necessary parameters to execute the SetLocalConsolePassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewaySetLocalConsolePasswordOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewaySetLocalConsolePasswordInput
 @see AWSstoragegatewaySetLocalConsolePasswordOutput
 */
- (AWSTask<AWSstoragegatewaySetLocalConsolePasswordOutput *> *)setLocalConsolePassword:(AWSstoragegatewaySetLocalConsolePasswordInput *)request;

/**
 <p>Sets the password for your VM local console. When you log in to the local console for the first time, you log in to the VM with the default credentials. We recommend that you set a new password. You don't need to know the default password to set a new password.</p>
 
 @param request A container for the necessary parameters to execute the SetLocalConsolePassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewaySetLocalConsolePasswordInput
 @see AWSstoragegatewaySetLocalConsolePasswordOutput
 */
- (void)setLocalConsolePassword:(AWSstoragegatewaySetLocalConsolePasswordInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewaySetLocalConsolePasswordOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sets the password for the guest user <code>smbguest</code>. The <code>smbguest</code> user is the user when the authentication method for the file share is set to <code>GuestAccess</code>.</p>
 
 @param request A container for the necessary parameters to execute the SetSMBGuestPassword service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewaySetSMBGuestPasswordOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewaySetSMBGuestPasswordInput
 @see AWSstoragegatewaySetSMBGuestPasswordOutput
 */
- (AWSTask<AWSstoragegatewaySetSMBGuestPasswordOutput *> *)setSMBGuestPassword:(AWSstoragegatewaySetSMBGuestPasswordInput *)request;

/**
 <p>Sets the password for the guest user <code>smbguest</code>. The <code>smbguest</code> user is the user when the authentication method for the file share is set to <code>GuestAccess</code>.</p>
 
 @param request A container for the necessary parameters to execute the SetSMBGuestPassword service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewaySetSMBGuestPasswordInput
 @see AWSstoragegatewaySetSMBGuestPasswordOutput
 */
- (void)setSMBGuestPassword:(AWSstoragegatewaySetSMBGuestPasswordInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewaySetSMBGuestPasswordOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Shuts down a gateway. To specify which gateway to shut down, use the Amazon Resource Name (ARN) of the gateway in the body of your request.</p><p>The operation shuts down the gateway service component running in the gateway's virtual machine (VM) and not the host VM.</p><note><p>If you want to shut down the VM, it is recommended that you first shut down the gateway component in the VM to avoid unpredictable conditions.</p></note><p>After the gateway is shutdown, you cannot call any other API except <a>StartGateway</a>, <a>DescribeGatewayInformation</a> and <a>ListGateways</a>. For more information, see <a>ActivateGateway</a>. Your applications cannot read from or write to the gateway's storage volumes, and there are no snapshots taken.</p><note><p>When you make a shutdown request, you will get a <code>200 OK</code> success response immediately. However, it might take some time for the gateway to shut down. You can call the <a>DescribeGatewayInformation</a> API to check the status. For more information, see <a>ActivateGateway</a>.</p></note><p>If do not intend to use the gateway again, you must delete the gateway (using <a>DeleteGateway</a>) to no longer pay software charges associated with the gateway.</p>
 
 @param request A container for the necessary parameters to execute the ShutdownGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayShutdownGatewayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayShutdownGatewayInput
 @see AWSstoragegatewayShutdownGatewayOutput
 */
- (AWSTask<AWSstoragegatewayShutdownGatewayOutput *> *)shutdownGateway:(AWSstoragegatewayShutdownGatewayInput *)request;

/**
 <p>Shuts down a gateway. To specify which gateway to shut down, use the Amazon Resource Name (ARN) of the gateway in the body of your request.</p><p>The operation shuts down the gateway service component running in the gateway's virtual machine (VM) and not the host VM.</p><note><p>If you want to shut down the VM, it is recommended that you first shut down the gateway component in the VM to avoid unpredictable conditions.</p></note><p>After the gateway is shutdown, you cannot call any other API except <a>StartGateway</a>, <a>DescribeGatewayInformation</a> and <a>ListGateways</a>. For more information, see <a>ActivateGateway</a>. Your applications cannot read from or write to the gateway's storage volumes, and there are no snapshots taken.</p><note><p>When you make a shutdown request, you will get a <code>200 OK</code> success response immediately. However, it might take some time for the gateway to shut down. You can call the <a>DescribeGatewayInformation</a> API to check the status. For more information, see <a>ActivateGateway</a>.</p></note><p>If do not intend to use the gateway again, you must delete the gateway (using <a>DeleteGateway</a>) to no longer pay software charges associated with the gateway.</p>
 
 @param request A container for the necessary parameters to execute the ShutdownGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayShutdownGatewayInput
 @see AWSstoragegatewayShutdownGatewayOutput
 */
- (void)shutdownGateway:(AWSstoragegatewayShutdownGatewayInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayShutdownGatewayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Start a test that verifies that the specified gateway is configured for High Availability monitoring in your host environment. This request only initiates the test and that a successful response only indicates that the test was started. It doesn't indicate that the test passed. For the status of the test, invoke the <code>DescribeAvailabilityMonitorTest</code> API. </p><note><p>Starting this test will cause your gateway to go offline for a brief period.</p></note>
 
 @param request A container for the necessary parameters to execute the StartAvailabilityMonitorTest service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayStartAvailabilityMonitorTestOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayStartAvailabilityMonitorTestInput
 @see AWSstoragegatewayStartAvailabilityMonitorTestOutput
 */
- (AWSTask<AWSstoragegatewayStartAvailabilityMonitorTestOutput *> *)startAvailabilityMonitorTest:(AWSstoragegatewayStartAvailabilityMonitorTestInput *)request;

/**
 <p>Start a test that verifies that the specified gateway is configured for High Availability monitoring in your host environment. This request only initiates the test and that a successful response only indicates that the test was started. It doesn't indicate that the test passed. For the status of the test, invoke the <code>DescribeAvailabilityMonitorTest</code> API. </p><note><p>Starting this test will cause your gateway to go offline for a brief period.</p></note>
 
 @param request A container for the necessary parameters to execute the StartAvailabilityMonitorTest service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayStartAvailabilityMonitorTestInput
 @see AWSstoragegatewayStartAvailabilityMonitorTestOutput
 */
- (void)startAvailabilityMonitorTest:(AWSstoragegatewayStartAvailabilityMonitorTestInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayStartAvailabilityMonitorTestOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Starts a gateway that you previously shut down (see <a>ShutdownGateway</a>). After the gateway starts, you can then make other API calls, your applications can read from or write to the gateway's storage volumes and you will be able to take snapshot backups.</p><note><p>When you make a request, you will get a 200 OK success response immediately. However, it might take some time for the gateway to be ready. You should call <a>DescribeGatewayInformation</a> and check the status before making any additional API calls. For more information, see <a>ActivateGateway</a>.</p></note><p>To specify which gateway to start, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the StartGateway service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayStartGatewayOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayStartGatewayInput
 @see AWSstoragegatewayStartGatewayOutput
 */
- (AWSTask<AWSstoragegatewayStartGatewayOutput *> *)startGateway:(AWSstoragegatewayStartGatewayInput *)request;

/**
 <p>Starts a gateway that you previously shut down (see <a>ShutdownGateway</a>). After the gateway starts, you can then make other API calls, your applications can read from or write to the gateway's storage volumes and you will be able to take snapshot backups.</p><note><p>When you make a request, you will get a 200 OK success response immediately. However, it might take some time for the gateway to be ready. You should call <a>DescribeGatewayInformation</a> and check the status before making any additional API calls. For more information, see <a>ActivateGateway</a>.</p></note><p>To specify which gateway to start, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the StartGateway service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayStartGatewayInput
 @see AWSstoragegatewayStartGatewayOutput
 */
- (void)startGateway:(AWSstoragegatewayStartGatewayInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayStartGatewayOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the automatic tape creation policy of a gateway. Use this to update the policy with a new set of automatic tape creation rules. This is only supported for tape gateways.</p><p>By default, there is no automatic tape creation policy.</p><note><p>A gateway can have only one automatic tape creation policy.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateAutomaticTapeCreationPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateAutomaticTapeCreationPolicyInput
 @see AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput
 */
- (AWSTask<AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput *> *)updateAutomaticTapeCreationPolicy:(AWSstoragegatewayUpdateAutomaticTapeCreationPolicyInput *)request;

/**
 <p>Updates the automatic tape creation policy of a gateway. Use this to update the policy with a new set of automatic tape creation rules. This is only supported for tape gateways.</p><p>By default, there is no automatic tape creation policy.</p><note><p>A gateway can have only one automatic tape creation policy.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateAutomaticTapeCreationPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateAutomaticTapeCreationPolicyInput
 @see AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput
 */
- (void)updateAutomaticTapeCreationPolicy:(AWSstoragegatewayUpdateAutomaticTapeCreationPolicyInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the bandwidth rate limits of a gateway. You can update both the upload and download bandwidth rate limit or specify only one of the two. If you don't set a bandwidth rate limit, the existing rate limit remains. This operation is supported for the stored volume, cached volume and tape gateway types.'</p><p>By default, a gateway's bandwidth rate limits are not set. If you don't set any limit, the gateway does not have any limitations on its bandwidth usage and could potentially use the maximum available bandwidth.</p><p>To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBandwidthRateLimit service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateBandwidthRateLimitOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateBandwidthRateLimitInput
 @see AWSstoragegatewayUpdateBandwidthRateLimitOutput
 */
- (AWSTask<AWSstoragegatewayUpdateBandwidthRateLimitOutput *> *)updateBandwidthRateLimit:(AWSstoragegatewayUpdateBandwidthRateLimitInput *)request;

/**
 <p>Updates the bandwidth rate limits of a gateway. You can update both the upload and download bandwidth rate limit or specify only one of the two. If you don't set a bandwidth rate limit, the existing rate limit remains. This operation is supported for the stored volume, cached volume and tape gateway types.'</p><p>By default, a gateway's bandwidth rate limits are not set. If you don't set any limit, the gateway does not have any limitations on its bandwidth usage and could potentially use the maximum available bandwidth.</p><p>To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateBandwidthRateLimit service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateBandwidthRateLimitInput
 @see AWSstoragegatewayUpdateBandwidthRateLimitOutput
 */
- (void)updateBandwidthRateLimit:(AWSstoragegatewayUpdateBandwidthRateLimitInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateBandwidthRateLimitOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target. By default, a gateway does not have CHAP enabled; however, for added security, you might use it. This operation is supported in the volume and tape gateway types.</p><important><p>When you update CHAP credentials, all existing connections on the target are closed and initiators must reconnect with the new credentials.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateChapCredentials service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateChapCredentialsOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateChapCredentialsInput
 @see AWSstoragegatewayUpdateChapCredentialsOutput
 */
- (AWSTask<AWSstoragegatewayUpdateChapCredentialsOutput *> *)updateChapCredentials:(AWSstoragegatewayUpdateChapCredentialsInput *)request;

/**
 <p>Updates the Challenge-Handshake Authentication Protocol (CHAP) credentials for a specified iSCSI target. By default, a gateway does not have CHAP enabled; however, for added security, you might use it. This operation is supported in the volume and tape gateway types.</p><important><p>When you update CHAP credentials, all existing connections on the target are closed and initiators must reconnect with the new credentials.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateChapCredentials service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateChapCredentialsInput
 @see AWSstoragegatewayUpdateChapCredentialsOutput
 */
- (void)updateChapCredentials:(AWSstoragegatewayUpdateChapCredentialsInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateChapCredentialsOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a gateway's metadata, which includes the gateway's name and time zone. To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your request.</p><note><p>For Gateways activated after September 2, 2015, the gateway's ARN contains the gateway ID rather than the gateway name. However, changing the name of the gateway has no effect on the gateway's ARN.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateGatewayInformation service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateGatewayInformationOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateGatewayInformationInput
 @see AWSstoragegatewayUpdateGatewayInformationOutput
 */
- (AWSTask<AWSstoragegatewayUpdateGatewayInformationOutput *> *)updateGatewayInformation:(AWSstoragegatewayUpdateGatewayInformationInput *)request;

/**
 <p>Updates a gateway's metadata, which includes the gateway's name and time zone. To specify which gateway to update, use the Amazon Resource Name (ARN) of the gateway in your request.</p><note><p>For Gateways activated after September 2, 2015, the gateway's ARN contains the gateway ID rather than the gateway name. However, changing the name of the gateway has no effect on the gateway's ARN.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateGatewayInformation service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateGatewayInformationInput
 @see AWSstoragegatewayUpdateGatewayInformationOutput
 */
- (void)updateGatewayInformation:(AWSstoragegatewayUpdateGatewayInformationInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateGatewayInformationOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the gateway virtual machine (VM) software. The request immediately triggers the software update.</p><note><p>When you make this request, you get a <code>200 OK</code> success response immediately. However, it might take some time for the update to complete. You can call <a>DescribeGatewayInformation</a> to verify the gateway is in the <code>STATE_RUNNING</code> state.</p></note><important><p>A software update forces a system restart of your gateway. You can minimize the chance of any disruption to your applications by increasing your iSCSI Initiators' timeouts. For more information about increasing iSCSI Initiator timeouts for Windows and Linux, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorWindowsClient.html#CustomizeWindowsiSCSISettings">Customizing Your Windows iSCSI Settings</a> and <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorRedHatClient.html#CustomizeLinuxiSCSISettings">Customizing Your Linux iSCSI Settings</a>, respectively.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateGatewaySoftwareNow service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateGatewaySoftwareNowOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateGatewaySoftwareNowInput
 @see AWSstoragegatewayUpdateGatewaySoftwareNowOutput
 */
- (AWSTask<AWSstoragegatewayUpdateGatewaySoftwareNowOutput *> *)updateGatewaySoftwareNow:(AWSstoragegatewayUpdateGatewaySoftwareNowInput *)request;

/**
 <p>Updates the gateway virtual machine (VM) software. The request immediately triggers the software update.</p><note><p>When you make this request, you get a <code>200 OK</code> success response immediately. However, it might take some time for the update to complete. You can call <a>DescribeGatewayInformation</a> to verify the gateway is in the <code>STATE_RUNNING</code> state.</p></note><important><p>A software update forces a system restart of your gateway. You can minimize the chance of any disruption to your applications by increasing your iSCSI Initiators' timeouts. For more information about increasing iSCSI Initiator timeouts for Windows and Linux, see <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorWindowsClient.html#CustomizeWindowsiSCSISettings">Customizing Your Windows iSCSI Settings</a> and <a href="https://docs.aws.amazon.com/storagegateway/latest/userguide/ConfiguringiSCSIClientInitiatorRedHatClient.html#CustomizeLinuxiSCSISettings">Customizing Your Linux iSCSI Settings</a>, respectively.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateGatewaySoftwareNow service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateGatewaySoftwareNowInput
 @see AWSstoragegatewayUpdateGatewaySoftwareNowOutput
 */
- (void)updateGatewaySoftwareNow:(AWSstoragegatewayUpdateGatewaySoftwareNowInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateGatewaySoftwareNowOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a gateway's weekly maintenance start time information, including day and time of the week. The maintenance time is the time in your gateway's time zone.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceStartTime service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateMaintenanceStartTimeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateMaintenanceStartTimeInput
 @see AWSstoragegatewayUpdateMaintenanceStartTimeOutput
 */
- (AWSTask<AWSstoragegatewayUpdateMaintenanceStartTimeOutput *> *)updateMaintenanceStartTime:(AWSstoragegatewayUpdateMaintenanceStartTimeInput *)request;

/**
 <p>Updates a gateway's weekly maintenance start time information, including day and time of the week. The maintenance time is the time in your gateway's time zone.</p>
 
 @param request A container for the necessary parameters to execute the UpdateMaintenanceStartTime service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateMaintenanceStartTimeInput
 @see AWSstoragegatewayUpdateMaintenanceStartTimeOutput
 */
- (void)updateMaintenanceStartTime:(AWSstoragegatewayUpdateMaintenanceStartTimeInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateMaintenanceStartTimeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a Network File System (NFS) file share. This operation is only supported in the file gateway type.</p><note><p>To leave a file share field unchanged, set the corresponding input field to null.</p></note><p>Updates the following file share setting:</p><ul><li><p>Default storage class for your S3 bucket</p></li><li><p>Metadata defaults for your S3 bucket</p></li><li><p>Allowed NFS clients for your file share</p></li><li><p>Squash settings</p></li><li><p>Write status of your file share</p></li></ul><note><p>To leave a file share field unchanged, set the corresponding input field to null. This operation is only supported in file gateways.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateNFSFileShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateNFSFileShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateNFSFileShareInput
 @see AWSstoragegatewayUpdateNFSFileShareOutput
 */
- (AWSTask<AWSstoragegatewayUpdateNFSFileShareOutput *> *)updateNFSFileShare:(AWSstoragegatewayUpdateNFSFileShareInput *)request;

/**
 <p>Updates a Network File System (NFS) file share. This operation is only supported in the file gateway type.</p><note><p>To leave a file share field unchanged, set the corresponding input field to null.</p></note><p>Updates the following file share setting:</p><ul><li><p>Default storage class for your S3 bucket</p></li><li><p>Metadata defaults for your S3 bucket</p></li><li><p>Allowed NFS clients for your file share</p></li><li><p>Squash settings</p></li><li><p>Write status of your file share</p></li></ul><note><p>To leave a file share field unchanged, set the corresponding input field to null. This operation is only supported in file gateways.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateNFSFileShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateNFSFileShareInput
 @see AWSstoragegatewayUpdateNFSFileShareOutput
 */
- (void)updateNFSFileShare:(AWSstoragegatewayUpdateNFSFileShareInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateNFSFileShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a Server Message Block (SMB) file share.</p><note><p>To leave a file share field unchanged, set the corresponding input field to null. This operation is only supported for file gateways.</p></note><important><p>File gateways require AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure that AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in this AWS Region, activate it. For information about how to activate AWS STS, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide.</i></p><p>File gateways don't support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateSMBFileShare service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateSMBFileShareOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateSMBFileShareInput
 @see AWSstoragegatewayUpdateSMBFileShareOutput
 */
- (AWSTask<AWSstoragegatewayUpdateSMBFileShareOutput *> *)updateSMBFileShare:(AWSstoragegatewayUpdateSMBFileShareInput *)request;

/**
 <p>Updates a Server Message Block (SMB) file share.</p><note><p>To leave a file share field unchanged, set the corresponding input field to null. This operation is only supported for file gateways.</p></note><important><p>File gateways require AWS Security Token Service (AWS STS) to be activated to enable you to create a file share. Make sure that AWS STS is activated in the AWS Region you are creating your file gateway in. If AWS STS is not activated in this AWS Region, activate it. For information about how to activate AWS STS, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and Access Management User Guide.</i></p><p>File gateways don't support creating hard or symbolic links on a file share.</p></important>
 
 @param request A container for the necessary parameters to execute the UpdateSMBFileShare service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateSMBFileShareInput
 @see AWSstoragegatewayUpdateSMBFileShareOutput
 */
- (void)updateSMBFileShare:(AWSstoragegatewayUpdateSMBFileShareInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateSMBFileShareOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the SMB security strategy on a file gateway. This action is only supported in file gateways.</p><note><p>This API is called Security level in the User Guide.</p><p>A higher security level can affect performance of the gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateSMBSecurityStrategy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateSMBSecurityStrategyOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateSMBSecurityStrategyInput
 @see AWSstoragegatewayUpdateSMBSecurityStrategyOutput
 */
- (AWSTask<AWSstoragegatewayUpdateSMBSecurityStrategyOutput *> *)updateSMBSecurityStrategy:(AWSstoragegatewayUpdateSMBSecurityStrategyInput *)request;

/**
 <p>Updates the SMB security strategy on a file gateway. This action is only supported in file gateways.</p><note><p>This API is called Security level in the User Guide.</p><p>A higher security level can affect performance of the gateway.</p></note>
 
 @param request A container for the necessary parameters to execute the UpdateSMBSecurityStrategy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateSMBSecurityStrategyInput
 @see AWSstoragegatewayUpdateSMBSecurityStrategyOutput
 */
- (void)updateSMBSecurityStrategy:(AWSstoragegatewayUpdateSMBSecurityStrategyInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateSMBSecurityStrategyOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates a snapshot schedule configured for a gateway volume. This operation is only supported in the cached volume and stored volume gateway types.</p><p>The default snapshot schedule for volume is once every 24 hours, starting at the creation time of the volume. You can use this API to change the snapshot schedule configured for the volume.</p><p>In the request you must identify the gateway volume whose snapshot schedule you want to update, and the schedule information, including when you want the snapshot to begin on a day and the frequency (in hours) of snapshots.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSnapshotSchedule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateSnapshotScheduleOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateSnapshotScheduleInput
 @see AWSstoragegatewayUpdateSnapshotScheduleOutput
 */
- (AWSTask<AWSstoragegatewayUpdateSnapshotScheduleOutput *> *)updateSnapshotSchedule:(AWSstoragegatewayUpdateSnapshotScheduleInput *)request;

/**
 <p>Updates a snapshot schedule configured for a gateway volume. This operation is only supported in the cached volume and stored volume gateway types.</p><p>The default snapshot schedule for volume is once every 24 hours, starting at the creation time of the volume. You can use this API to change the snapshot schedule configured for the volume.</p><p>In the request you must identify the gateway volume whose snapshot schedule you want to update, and the schedule information, including when you want the snapshot to begin on a day and the frequency (in hours) of snapshots.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSnapshotSchedule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateSnapshotScheduleInput
 @see AWSstoragegatewayUpdateSnapshotScheduleOutput
 */
- (void)updateSnapshotSchedule:(AWSstoragegatewayUpdateSnapshotScheduleInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateSnapshotScheduleOutput * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the type of medium changer in a tape gateway. When you activate a tape gateway, you select a medium changer type for the tape gateway. This operation enables you to select a different type of medium changer after a tape gateway is activated. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVTLDeviceType service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSstoragegatewayUpdateVTLDeviceTypeOutput`. On failed execution, `task.error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateVTLDeviceTypeInput
 @see AWSstoragegatewayUpdateVTLDeviceTypeOutput
 */
- (AWSTask<AWSstoragegatewayUpdateVTLDeviceTypeOutput *> *)updateVTLDeviceType:(AWSstoragegatewayUpdateVTLDeviceTypeInput *)request;

/**
 <p>Updates the type of medium changer in a tape gateway. When you activate a tape gateway, you select a medium changer type for the tape gateway. This operation enables you to select a different type of medium changer after a tape gateway is activated. This operation is only supported in the tape gateway type.</p>
 
 @param request A container for the necessary parameters to execute the UpdateVTLDeviceType service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSstoragegatewayErrorDomain` domain and the following error code: `AWSstoragegatewayErrorInvalidGatewayRequest`, `AWSstoragegatewayErrorInternalServer`.
 
 @see AWSstoragegatewayUpdateVTLDeviceTypeInput
 @see AWSstoragegatewayUpdateVTLDeviceTypeOutput
 */
- (void)updateVTLDeviceType:(AWSstoragegatewayUpdateVTLDeviceTypeInput *)request completionHandler:(void (^ _Nullable)(AWSstoragegatewayUpdateVTLDeviceTypeOutput * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
