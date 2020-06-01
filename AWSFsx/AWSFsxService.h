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
#import "AWSFsxModel.h"
#import "AWSFsxResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSFsx
FOUNDATION_EXPORT NSString *const AWSFsxSDKVersion;

/**
 <p>Amazon FSx is a fully managed service that makes it easy for storage and application administrators to launch and use shared file storage.</p>
 */
@interface AWSFsx : AWSService

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

     let Fsx = AWSFsx.default()

 *Objective-C*

     AWSFsx *Fsx = [AWSFsx defaultFsx];

 @return The default service client.
 */
+ (instancetype)defaultFsx;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSFsx.register(with: configuration!, forKey: "USWest2Fsx")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSFsx registerFsxWithConfiguration:configuration forKey:@"USWest2Fsx"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Fsx = AWSFsx(forKey: "USWest2Fsx")

 *Objective-C*

     AWSFsx *Fsx = [AWSFsx FsxForKey:@"USWest2Fsx"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerFsxWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerFsxWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSFsx.register(with: configuration!, forKey: "USWest2Fsx")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSFsx registerFsxWithConfiguration:configuration forKey:@"USWest2Fsx"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Fsx = AWSFsx(forKey: "USWest2Fsx")

 *Objective-C*

     AWSFsx *Fsx = [AWSFsx FsxForKey:@"USWest2Fsx"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)FsxForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeFsxForKey:(NSString *)key;

/**
 <p>Cancels an existing Amazon FSx for Lustre data repository task if that task is in either the <code>PENDING</code> or <code>EXECUTING</code> state. When you cancel a task, Amazon FSx does the following.</p><ul><li><p>Any files that FSx has already exported are not reverted.</p></li><li><p>FSx continues to export any files that are "in-flight" when the cancel operation is received.</p></li><li><p>FSx does not export any files that have not yet been exported.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CancelDataRepositoryTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxCancelDataRepositoryTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorUnsupportedOperation`, `AWSFsxErrorDataRepositoryTaskNotFound`, `AWSFsxErrorDataRepositoryTaskEnded`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxCancelDataRepositoryTaskRequest
 @see AWSFsxCancelDataRepositoryTaskResponse
 */
- (AWSTask<AWSFsxCancelDataRepositoryTaskResponse *> *)cancelDataRepositoryTask:(AWSFsxCancelDataRepositoryTaskRequest *)request;

/**
 <p>Cancels an existing Amazon FSx for Lustre data repository task if that task is in either the <code>PENDING</code> or <code>EXECUTING</code> state. When you cancel a task, Amazon FSx does the following.</p><ul><li><p>Any files that FSx has already exported are not reverted.</p></li><li><p>FSx continues to export any files that are "in-flight" when the cancel operation is received.</p></li><li><p>FSx does not export any files that have not yet been exported.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the CancelDataRepositoryTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorUnsupportedOperation`, `AWSFsxErrorDataRepositoryTaskNotFound`, `AWSFsxErrorDataRepositoryTaskEnded`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxCancelDataRepositoryTaskRequest
 @see AWSFsxCancelDataRepositoryTaskResponse
 */
- (void)cancelDataRepositoryTask:(AWSFsxCancelDataRepositoryTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxCancelDataRepositoryTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a backup of an existing Amazon FSx for Windows File Server file system. Creating regular backups for your file system is a best practice that complements the replication that Amazon FSx for Windows File Server performs for your file system. It also enables you to restore from user modification of data.</p><p>If a backup with the specified client request token exists, and the parameters match, this operation returns the description of the existing backup. If a backup specified client request token exists, and the parameters don't match, this operation returns <code>IncompatibleParameterError</code>. If a backup with the specified client request token doesn't exist, <code>CreateBackup</code> does the following: </p><ul><li><p>Creates a new Amazon FSx backup with an assigned ID, and an initial lifecycle state of <code>CREATING</code>.</p></li><li><p>Returns the description of the backup.</p></li></ul><p>By using the idempotent operation, you can retry a <code>CreateBackup</code> operation without the risk of creating an extra backup. This approach can be useful when an initial call fails in a way that makes it unclear whether a backup was created. If you use the same client request token and the initial call created a backup, the operation returns a successful result because all the parameters are the same.</p><p>The <code>CreateFileSystem</code> operation returns while the backup's lifecycle state is still <code>CREATING</code>. You can check the file system creation status by calling the <a>DescribeBackups</a> operation, which returns the backup state along with other information.</p><note><p/></note>
 
 @param request A container for the necessary parameters to execute the CreateBackup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxCreateBackupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorUnsupportedOperation`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorBackupInProgress`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorServiceLimitExceeded`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxCreateBackupRequest
 @see AWSFsxCreateBackupResponse
 */
- (AWSTask<AWSFsxCreateBackupResponse *> *)createBackup:(AWSFsxCreateBackupRequest *)request;

/**
 <p>Creates a backup of an existing Amazon FSx for Windows File Server file system. Creating regular backups for your file system is a best practice that complements the replication that Amazon FSx for Windows File Server performs for your file system. It also enables you to restore from user modification of data.</p><p>If a backup with the specified client request token exists, and the parameters match, this operation returns the description of the existing backup. If a backup specified client request token exists, and the parameters don't match, this operation returns <code>IncompatibleParameterError</code>. If a backup with the specified client request token doesn't exist, <code>CreateBackup</code> does the following: </p><ul><li><p>Creates a new Amazon FSx backup with an assigned ID, and an initial lifecycle state of <code>CREATING</code>.</p></li><li><p>Returns the description of the backup.</p></li></ul><p>By using the idempotent operation, you can retry a <code>CreateBackup</code> operation without the risk of creating an extra backup. This approach can be useful when an initial call fails in a way that makes it unclear whether a backup was created. If you use the same client request token and the initial call created a backup, the operation returns a successful result because all the parameters are the same.</p><p>The <code>CreateFileSystem</code> operation returns while the backup's lifecycle state is still <code>CREATING</code>. You can check the file system creation status by calling the <a>DescribeBackups</a> operation, which returns the backup state along with other information.</p><note><p/></note>
 
 @param request A container for the necessary parameters to execute the CreateBackup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorUnsupportedOperation`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorBackupInProgress`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorServiceLimitExceeded`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxCreateBackupRequest
 @see AWSFsxCreateBackupResponse
 */
- (void)createBackup:(AWSFsxCreateBackupRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxCreateBackupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an Amazon FSx for Lustre data repository task. You use data repository tasks to perform bulk operations between your Amazon FSx file system and its linked data repository. An example of a data repository task is exporting any data and metadata changes, including POSIX metadata, to files, directories, and symbolic links (symlinks) from your FSx file system to its linked data repository. A <code>CreateDataRepositoryTask</code> operation will fail if a data repository is not linked to the FSx file system. To learn more about data repository tasks, see <a href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-repository-tasks.html">Using Data Repository Tasks</a>. To learn more about linking a data repository to your file system, see <a href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/export-data-repository.html#export-prefix">Setting the Export Prefix</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataRepositoryTask service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxCreateDataRepositoryTaskResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorUnsupportedOperation`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorServiceLimitExceeded`, `AWSFsxErrorInternalServer`, `AWSFsxErrorDataRepositoryTaskExecuting`.
 
 @see AWSFsxCreateDataRepositoryTaskRequest
 @see AWSFsxCreateDataRepositoryTaskResponse
 */
- (AWSTask<AWSFsxCreateDataRepositoryTaskResponse *> *)createDataRepositoryTask:(AWSFsxCreateDataRepositoryTaskRequest *)request;

/**
 <p>Creates an Amazon FSx for Lustre data repository task. You use data repository tasks to perform bulk operations between your Amazon FSx file system and its linked data repository. An example of a data repository task is exporting any data and metadata changes, including POSIX metadata, to files, directories, and symbolic links (symlinks) from your FSx file system to its linked data repository. A <code>CreateDataRepositoryTask</code> operation will fail if a data repository is not linked to the FSx file system. To learn more about data repository tasks, see <a href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-repository-tasks.html">Using Data Repository Tasks</a>. To learn more about linking a data repository to your file system, see <a href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/export-data-repository.html#export-prefix">Setting the Export Prefix</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateDataRepositoryTask service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorUnsupportedOperation`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorServiceLimitExceeded`, `AWSFsxErrorInternalServer`, `AWSFsxErrorDataRepositoryTaskExecuting`.
 
 @see AWSFsxCreateDataRepositoryTaskRequest
 @see AWSFsxCreateDataRepositoryTaskResponse
 */
- (void)createDataRepositoryTask:(AWSFsxCreateDataRepositoryTaskRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxCreateDataRepositoryTaskResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new, empty Amazon FSx file system.</p><p>If a file system with the specified client request token exists and the parameters match, <code>CreateFileSystem</code> returns the description of the existing file system. If a file system specified client request token exists and the parameters don't match, this call returns <code>IncompatibleParameterError</code>. If a file system with the specified client request token doesn't exist, <code>CreateFileSystem</code> does the following: </p><ul><li><p>Creates a new, empty Amazon FSx file system with an assigned ID, and an initial lifecycle state of <code>CREATING</code>.</p></li><li><p>Returns the description of the file system.</p></li></ul><p>This operation requires a client request token in the request that Amazon FSx uses to ensure idempotent creation. This means that calling the operation multiple times with the same client request token has no effect. By using the idempotent operation, you can retry a <code>CreateFileSystem</code> operation without the risk of creating an extra file system. This approach can be useful when an initial call fails in a way that makes it unclear whether a file system was created. Examples are if a transport level timeout occurred, or your connection was reset. If you use the same client request token and the initial call created a file system, the client receives success as long as the parameters are the same.</p><note><p>The <code>CreateFileSystem</code> call returns while the file system's lifecycle state is still <code>CREATING</code>. You can check the file-system creation status by calling the <a>DescribeFileSystems</a> operation, which returns the file system state along with other information.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateFileSystem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxCreateFileSystemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorActiveDirectory`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorInvalidImportPath`, `AWSFsxErrorInvalidExportPath`, `AWSFsxErrorInvalidNetworkSettings`, `AWSFsxErrorInvalidPerUnitStorageThroughput`, `AWSFsxErrorServiceLimitExceeded`, `AWSFsxErrorInternalServer`, `AWSFsxErrorMissingFileSystemConfiguration`.
 
 @see AWSFsxCreateFileSystemRequest
 @see AWSFsxCreateFileSystemResponse
 */
- (AWSTask<AWSFsxCreateFileSystemResponse *> *)createFileSystem:(AWSFsxCreateFileSystemRequest *)request;

/**
 <p>Creates a new, empty Amazon FSx file system.</p><p>If a file system with the specified client request token exists and the parameters match, <code>CreateFileSystem</code> returns the description of the existing file system. If a file system specified client request token exists and the parameters don't match, this call returns <code>IncompatibleParameterError</code>. If a file system with the specified client request token doesn't exist, <code>CreateFileSystem</code> does the following: </p><ul><li><p>Creates a new, empty Amazon FSx file system with an assigned ID, and an initial lifecycle state of <code>CREATING</code>.</p></li><li><p>Returns the description of the file system.</p></li></ul><p>This operation requires a client request token in the request that Amazon FSx uses to ensure idempotent creation. This means that calling the operation multiple times with the same client request token has no effect. By using the idempotent operation, you can retry a <code>CreateFileSystem</code> operation without the risk of creating an extra file system. This approach can be useful when an initial call fails in a way that makes it unclear whether a file system was created. Examples are if a transport level timeout occurred, or your connection was reset. If you use the same client request token and the initial call created a file system, the client receives success as long as the parameters are the same.</p><note><p>The <code>CreateFileSystem</code> call returns while the file system's lifecycle state is still <code>CREATING</code>. You can check the file-system creation status by calling the <a>DescribeFileSystems</a> operation, which returns the file system state along with other information.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateFileSystem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorActiveDirectory`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorInvalidImportPath`, `AWSFsxErrorInvalidExportPath`, `AWSFsxErrorInvalidNetworkSettings`, `AWSFsxErrorInvalidPerUnitStorageThroughput`, `AWSFsxErrorServiceLimitExceeded`, `AWSFsxErrorInternalServer`, `AWSFsxErrorMissingFileSystemConfiguration`.
 
 @see AWSFsxCreateFileSystemRequest
 @see AWSFsxCreateFileSystemResponse
 */
- (void)createFileSystem:(AWSFsxCreateFileSystemRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxCreateFileSystemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new Amazon FSx file system from an existing Amazon FSx for Windows File Server backup.</p><p>If a file system with the specified client request token exists and the parameters match, this operation returns the description of the file system. If a client request token specified by the file system exists and the parameters don't match, this call returns <code>IncompatibleParameterError</code>. If a file system with the specified client request token doesn't exist, this operation does the following:</p><ul><li><p>Creates a new Amazon FSx file system from backup with an assigned ID, and an initial lifecycle state of <code>CREATING</code>.</p></li><li><p>Returns the description of the file system.</p></li></ul><p>Parameters like Active Directory, default share name, automatic backup, and backup settings default to the parameters of the file system that was backed up, unless overridden. You can explicitly supply other settings.</p><p>By using the idempotent operation, you can retry a <code>CreateFileSystemFromBackup</code> call without the risk of creating an extra file system. This approach can be useful when an initial call fails in a way that makes it unclear whether a file system was created. Examples are if a transport level timeout occurred, or your connection was reset. If you use the same client request token and the initial call created a file system, the client receives success as long as the parameters are the same.</p><note><p>The <code>CreateFileSystemFromBackup</code> call returns while the file system's lifecycle state is still <code>CREATING</code>. You can check the file-system creation status by calling the <a>DescribeFileSystems</a> operation, which returns the file system state along with other information.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateFileSystemFromBackup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxCreateFileSystemFromBackupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorActiveDirectory`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorInvalidNetworkSettings`, `AWSFsxErrorServiceLimitExceeded`, `AWSFsxErrorBackupNotFound`, `AWSFsxErrorInternalServer`, `AWSFsxErrorMissingFileSystemConfiguration`.
 
 @see AWSFsxCreateFileSystemFromBackupRequest
 @see AWSFsxCreateFileSystemFromBackupResponse
 */
- (AWSTask<AWSFsxCreateFileSystemFromBackupResponse *> *)createFileSystemFromBackup:(AWSFsxCreateFileSystemFromBackupRequest *)request;

/**
 <p>Creates a new Amazon FSx file system from an existing Amazon FSx for Windows File Server backup.</p><p>If a file system with the specified client request token exists and the parameters match, this operation returns the description of the file system. If a client request token specified by the file system exists and the parameters don't match, this call returns <code>IncompatibleParameterError</code>. If a file system with the specified client request token doesn't exist, this operation does the following:</p><ul><li><p>Creates a new Amazon FSx file system from backup with an assigned ID, and an initial lifecycle state of <code>CREATING</code>.</p></li><li><p>Returns the description of the file system.</p></li></ul><p>Parameters like Active Directory, default share name, automatic backup, and backup settings default to the parameters of the file system that was backed up, unless overridden. You can explicitly supply other settings.</p><p>By using the idempotent operation, you can retry a <code>CreateFileSystemFromBackup</code> call without the risk of creating an extra file system. This approach can be useful when an initial call fails in a way that makes it unclear whether a file system was created. Examples are if a transport level timeout occurred, or your connection was reset. If you use the same client request token and the initial call created a file system, the client receives success as long as the parameters are the same.</p><note><p>The <code>CreateFileSystemFromBackup</code> call returns while the file system's lifecycle state is still <code>CREATING</code>. You can check the file-system creation status by calling the <a>DescribeFileSystems</a> operation, which returns the file system state along with other information.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateFileSystemFromBackup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorActiveDirectory`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorInvalidNetworkSettings`, `AWSFsxErrorServiceLimitExceeded`, `AWSFsxErrorBackupNotFound`, `AWSFsxErrorInternalServer`, `AWSFsxErrorMissingFileSystemConfiguration`.
 
 @see AWSFsxCreateFileSystemFromBackupRequest
 @see AWSFsxCreateFileSystemFromBackupResponse
 */
- (void)createFileSystemFromBackup:(AWSFsxCreateFileSystemFromBackupRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxCreateFileSystemFromBackupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes an Amazon FSx for Windows File Server backup, deleting its contents. After deletion, the backup no longer exists, and its data is gone.</p><p>The <code>DeleteBackup</code> call returns instantly. The backup will not show up in later <code>DescribeBackups</code> calls.</p><important><p>The data in a deleted backup is also deleted and can't be recovered by any means.</p></important>
 
 @param request A container for the necessary parameters to execute the DeleteBackup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxDeleteBackupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorBackupInProgress`, `AWSFsxErrorBackupNotFound`, `AWSFsxErrorBackupRestoring`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxDeleteBackupRequest
 @see AWSFsxDeleteBackupResponse
 */
- (AWSTask<AWSFsxDeleteBackupResponse *> *)deleteBackup:(AWSFsxDeleteBackupRequest *)request;

/**
 <p>Deletes an Amazon FSx for Windows File Server backup, deleting its contents. After deletion, the backup no longer exists, and its data is gone.</p><p>The <code>DeleteBackup</code> call returns instantly. The backup will not show up in later <code>DescribeBackups</code> calls.</p><important><p>The data in a deleted backup is also deleted and can't be recovered by any means.</p></important>
 
 @param request A container for the necessary parameters to execute the DeleteBackup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorBackupInProgress`, `AWSFsxErrorBackupNotFound`, `AWSFsxErrorBackupRestoring`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxDeleteBackupRequest
 @see AWSFsxDeleteBackupResponse
 */
- (void)deleteBackup:(AWSFsxDeleteBackupRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxDeleteBackupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Deletes a file system, deleting its contents. After deletion, the file system no longer exists, and its data is gone. Any existing automatic backups will also be deleted.</p><p>By default, when you delete an Amazon FSx for Windows File Server file system, a final backup is created upon deletion. This final backup is not subject to the file system's retention policy, and must be manually deleted.</p><p>The <code>DeleteFileSystem</code> action returns while the file system has the <code>DELETING</code> status. You can check the file system deletion status by calling the <a>DescribeFileSystems</a> action, which returns a list of file systems in your account. If you pass the file system ID for a deleted file system, the <a>DescribeFileSystems</a> returns a <code>FileSystemNotFound</code> error.</p><note><p>Deleting an Amazon FSx for Lustre file system will fail with a 400 BadRequest if a data repository task is in a <code>PENDING</code> or <code>EXECUTING</code> state.</p></note><important><p>The data in a deleted file system is also deleted and can't be recovered by any means.</p></important>
 
 @param request A container for the necessary parameters to execute the DeleteFileSystem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxDeleteFileSystemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorServiceLimitExceeded`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxDeleteFileSystemRequest
 @see AWSFsxDeleteFileSystemResponse
 */
- (AWSTask<AWSFsxDeleteFileSystemResponse *> *)deleteFileSystem:(AWSFsxDeleteFileSystemRequest *)request;

/**
 <p>Deletes a file system, deleting its contents. After deletion, the file system no longer exists, and its data is gone. Any existing automatic backups will also be deleted.</p><p>By default, when you delete an Amazon FSx for Windows File Server file system, a final backup is created upon deletion. This final backup is not subject to the file system's retention policy, and must be manually deleted.</p><p>The <code>DeleteFileSystem</code> action returns while the file system has the <code>DELETING</code> status. You can check the file system deletion status by calling the <a>DescribeFileSystems</a> action, which returns a list of file systems in your account. If you pass the file system ID for a deleted file system, the <a>DescribeFileSystems</a> returns a <code>FileSystemNotFound</code> error.</p><note><p>Deleting an Amazon FSx for Lustre file system will fail with a 400 BadRequest if a data repository task is in a <code>PENDING</code> or <code>EXECUTING</code> state.</p></note><important><p>The data in a deleted file system is also deleted and can't be recovered by any means.</p></important>
 
 @param request A container for the necessary parameters to execute the DeleteFileSystem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorServiceLimitExceeded`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxDeleteFileSystemRequest
 @see AWSFsxDeleteFileSystemResponse
 */
- (void)deleteFileSystem:(AWSFsxDeleteFileSystemRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxDeleteFileSystemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of specific Amazon FSx for Windows File Server backups, if a <code>BackupIds</code> value is provided for that backup. Otherwise, it returns all backups owned by your AWS account in the AWS Region of the endpoint that you're calling.</p><p>When retrieving all backups, you can optionally specify the <code>MaxResults</code> parameter to limit the number of backups in a response. If more backups remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p><p>This action is used in an iterative process to retrieve a list of your backups. <code>DescribeBackups</code> is called first without a <code>NextToken</code>value. Then the action continues to be called with the <code>NextToken</code> parameter set to the value of the last <code>NextToken</code> value until a response has no <code>NextToken</code>.</p><p>When using this action, keep the following in mind:</p><ul><li><p>The implementation might return fewer than <code>MaxResults</code> file system descriptions while still including a <code>NextToken</code> value.</p></li><li><p>The order of backups returned in the response of one <code>DescribeBackups</code> call and the order of backups returned across the responses of a multi-call iteration is unspecified.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeBackups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxDescribeBackupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorBackupNotFound`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxDescribeBackupsRequest
 @see AWSFsxDescribeBackupsResponse
 */
- (AWSTask<AWSFsxDescribeBackupsResponse *> *)describeBackups:(AWSFsxDescribeBackupsRequest *)request;

/**
 <p>Returns the description of specific Amazon FSx for Windows File Server backups, if a <code>BackupIds</code> value is provided for that backup. Otherwise, it returns all backups owned by your AWS account in the AWS Region of the endpoint that you're calling.</p><p>When retrieving all backups, you can optionally specify the <code>MaxResults</code> parameter to limit the number of backups in a response. If more backups remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p><p>This action is used in an iterative process to retrieve a list of your backups. <code>DescribeBackups</code> is called first without a <code>NextToken</code>value. Then the action continues to be called with the <code>NextToken</code> parameter set to the value of the last <code>NextToken</code> value until a response has no <code>NextToken</code>.</p><p>When using this action, keep the following in mind:</p><ul><li><p>The implementation might return fewer than <code>MaxResults</code> file system descriptions while still including a <code>NextToken</code> value.</p></li><li><p>The order of backups returned in the response of one <code>DescribeBackups</code> call and the order of backups returned across the responses of a multi-call iteration is unspecified.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeBackups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorBackupNotFound`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxDescribeBackupsRequest
 @see AWSFsxDescribeBackupsResponse
 */
- (void)describeBackups:(AWSFsxDescribeBackupsRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxDescribeBackupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of specific Amazon FSx for Lustre data repository tasks, if one or more <code>TaskIds</code> values are provided in the request, or if filters are used in the request. You can use filters to narrow the response to include just tasks for specific file systems, or tasks in a specific lifecycle state. Otherwise, it returns all data repository tasks owned by your AWS account in the AWS Region of the endpoint that you're calling.</p><p>When retrieving all tasks, you can paginate the response by using the optional <code>MaxResults</code> parameter to limit the number of tasks returned in a response. If more tasks remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataRepositoryTasks service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxDescribeDataRepositoryTasksResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorDataRepositoryTaskNotFound`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxDescribeDataRepositoryTasksRequest
 @see AWSFsxDescribeDataRepositoryTasksResponse
 */
- (AWSTask<AWSFsxDescribeDataRepositoryTasksResponse *> *)describeDataRepositoryTasks:(AWSFsxDescribeDataRepositoryTasksRequest *)request;

/**
 <p>Returns the description of specific Amazon FSx for Lustre data repository tasks, if one or more <code>TaskIds</code> values are provided in the request, or if filters are used in the request. You can use filters to narrow the response to include just tasks for specific file systems, or tasks in a specific lifecycle state. Otherwise, it returns all data repository tasks owned by your AWS account in the AWS Region of the endpoint that you're calling.</p><p>When retrieving all tasks, you can paginate the response by using the optional <code>MaxResults</code> parameter to limit the number of tasks returned in a response. If more tasks remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataRepositoryTasks service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorDataRepositoryTaskNotFound`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxDescribeDataRepositoryTasksRequest
 @see AWSFsxDescribeDataRepositoryTasksResponse
 */
- (void)describeDataRepositoryTasks:(AWSFsxDescribeDataRepositoryTasksRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxDescribeDataRepositoryTasksResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns the description of specific Amazon FSx file systems, if a <code>FileSystemIds</code> value is provided for that file system. Otherwise, it returns descriptions of all file systems owned by your AWS account in the AWS Region of the endpoint that you're calling.</p><p>When retrieving all file system descriptions, you can optionally specify the <code>MaxResults</code> parameter to limit the number of descriptions in a response. If more file system descriptions remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p><p>This action is used in an iterative process to retrieve a list of your file system descriptions. <code>DescribeFileSystems</code> is called first without a <code>NextToken</code>value. Then the action continues to be called with the <code>NextToken</code> parameter set to the value of the last <code>NextToken</code> value until a response has no <code>NextToken</code>.</p><p>When using this action, keep the following in mind:</p><ul><li><p>The implementation might return fewer than <code>MaxResults</code> file system descriptions while still including a <code>NextToken</code> value.</p></li><li><p>The order of file systems returned in the response of one <code>DescribeFileSystems</code> call and the order of file systems returned across the responses of a multicall iteration is unspecified.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeFileSystems service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxDescribeFileSystemsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxDescribeFileSystemsRequest
 @see AWSFsxDescribeFileSystemsResponse
 */
- (AWSTask<AWSFsxDescribeFileSystemsResponse *> *)describeFileSystems:(AWSFsxDescribeFileSystemsRequest *)request;

/**
 <p>Returns the description of specific Amazon FSx file systems, if a <code>FileSystemIds</code> value is provided for that file system. Otherwise, it returns descriptions of all file systems owned by your AWS account in the AWS Region of the endpoint that you're calling.</p><p>When retrieving all file system descriptions, you can optionally specify the <code>MaxResults</code> parameter to limit the number of descriptions in a response. If more file system descriptions remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p><p>This action is used in an iterative process to retrieve a list of your file system descriptions. <code>DescribeFileSystems</code> is called first without a <code>NextToken</code>value. Then the action continues to be called with the <code>NextToken</code> parameter set to the value of the last <code>NextToken</code> value until a response has no <code>NextToken</code>.</p><p>When using this action, keep the following in mind:</p><ul><li><p>The implementation might return fewer than <code>MaxResults</code> file system descriptions while still including a <code>NextToken</code> value.</p></li><li><p>The order of file systems returned in the response of one <code>DescribeFileSystems</code> call and the order of file systems returned across the responses of a multicall iteration is unspecified.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the DescribeFileSystems service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorInternalServer`.
 
 @see AWSFsxDescribeFileSystemsRequest
 @see AWSFsxDescribeFileSystemsResponse
 */
- (void)describeFileSystems:(AWSFsxDescribeFileSystemsRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxDescribeFileSystemsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists tags for an Amazon FSx file systems and backups in the case of Amazon FSx for Windows File Server.</p><p>When retrieving all tags, you can optionally specify the <code>MaxResults</code> parameter to limit the number of tags in a response. If more tags remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p><p>This action is used in an iterative process to retrieve a list of your tags. <code>ListTagsForResource</code> is called first without a <code>NextToken</code>value. Then the action continues to be called with the <code>NextToken</code> parameter set to the value of the last <code>NextToken</code> value until a response has no <code>NextToken</code>.</p><p>When using this action, keep the following in mind:</p><ul><li><p>The implementation might return fewer than <code>MaxResults</code> file system descriptions while still including a <code>NextToken</code> value.</p></li><li><p>The order of tags returned in the response of one <code>ListTagsForResource</code> call and the order of tags returned across the responses of a multi-call iteration is unspecified.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorInternalServer`, `AWSFsxErrorResourceNotFound`, `AWSFsxErrorNotServiceResource`, `AWSFsxErrorResourceDoesNotSupportTagging`.
 
 @see AWSFsxListTagsForResourceRequest
 @see AWSFsxListTagsForResourceResponse
 */
- (AWSTask<AWSFsxListTagsForResourceResponse *> *)listTagsForResource:(AWSFsxListTagsForResourceRequest *)request;

/**
 <p>Lists tags for an Amazon FSx file systems and backups in the case of Amazon FSx for Windows File Server.</p><p>When retrieving all tags, you can optionally specify the <code>MaxResults</code> parameter to limit the number of tags in a response. If more tags remain, Amazon FSx returns a <code>NextToken</code> value in the response. In this case, send a later request with the <code>NextToken</code> request parameter set to the value of <code>NextToken</code> from the last response.</p><p>This action is used in an iterative process to retrieve a list of your tags. <code>ListTagsForResource</code> is called first without a <code>NextToken</code>value. Then the action continues to be called with the <code>NextToken</code> parameter set to the value of the last <code>NextToken</code> value until a response has no <code>NextToken</code>.</p><p>When using this action, keep the following in mind:</p><ul><li><p>The implementation might return fewer than <code>MaxResults</code> file system descriptions while still including a <code>NextToken</code> value.</p></li><li><p>The order of tags returned in the response of one <code>ListTagsForResource</code> call and the order of tags returned across the responses of a multi-call iteration is unspecified.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorInternalServer`, `AWSFsxErrorResourceNotFound`, `AWSFsxErrorNotServiceResource`, `AWSFsxErrorResourceDoesNotSupportTagging`.
 
 @see AWSFsxListTagsForResourceRequest
 @see AWSFsxListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSFsxListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Tags an Amazon FSx resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorInternalServer`, `AWSFsxErrorResourceNotFound`, `AWSFsxErrorNotServiceResource`, `AWSFsxErrorResourceDoesNotSupportTagging`.
 
 @see AWSFsxTagResourceRequest
 @see AWSFsxTagResourceResponse
 */
- (AWSTask<AWSFsxTagResourceResponse *> *)tagResource:(AWSFsxTagResourceRequest *)request;

/**
 <p>Tags an Amazon FSx resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorInternalServer`, `AWSFsxErrorResourceNotFound`, `AWSFsxErrorNotServiceResource`, `AWSFsxErrorResourceDoesNotSupportTagging`.
 
 @see AWSFsxTagResourceRequest
 @see AWSFsxTagResourceResponse
 */
- (void)tagResource:(AWSFsxTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>This action removes a tag from an Amazon FSx resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorInternalServer`, `AWSFsxErrorResourceNotFound`, `AWSFsxErrorNotServiceResource`, `AWSFsxErrorResourceDoesNotSupportTagging`.
 
 @see AWSFsxUntagResourceRequest
 @see AWSFsxUntagResourceResponse
 */
- (AWSTask<AWSFsxUntagResourceResponse *> *)untagResource:(AWSFsxUntagResourceRequest *)request;

/**
 <p>This action removes a tag from an Amazon FSx resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorInternalServer`, `AWSFsxErrorResourceNotFound`, `AWSFsxErrorNotServiceResource`, `AWSFsxErrorResourceDoesNotSupportTagging`.
 
 @see AWSFsxUntagResourceRequest
 @see AWSFsxUntagResourceResponse
 */
- (void)untagResource:(AWSFsxUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Use this operation to update the configuration of an existing Amazon FSx file system. For an Amazon FSx for Lustre file system, you can update only the WeeklyMaintenanceStartTime. For an Amazon for Windows File Server file system, you can update the following properties:</p><ul><li><p>AutomaticBackupRetentionDays</p></li><li><p>DailyAutomaticBackupStartTime</p></li><li><p>SelfManagedActiveDirectoryConfiguration</p></li><li><p>StorageCapacity</p></li><li><p>ThroughputCapacity</p></li><li><p>WeeklyMaintenanceStartTime</p></li></ul><p>You can update multiple properties in a single request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFileSystem service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSFsxUpdateFileSystemResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorUnsupportedOperation`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorInternalServer`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorMissingFileSystemConfiguration`, `AWSFsxErrorServiceLimitExceeded`.
 
 @see AWSFsxUpdateFileSystemRequest
 @see AWSFsxUpdateFileSystemResponse
 */
- (AWSTask<AWSFsxUpdateFileSystemResponse *> *)updateFileSystem:(AWSFsxUpdateFileSystemRequest *)request;

/**
 <p>Use this operation to update the configuration of an existing Amazon FSx file system. For an Amazon FSx for Lustre file system, you can update only the WeeklyMaintenanceStartTime. For an Amazon for Windows File Server file system, you can update the following properties:</p><ul><li><p>AutomaticBackupRetentionDays</p></li><li><p>DailyAutomaticBackupStartTime</p></li><li><p>SelfManagedActiveDirectoryConfiguration</p></li><li><p>StorageCapacity</p></li><li><p>ThroughputCapacity</p></li><li><p>WeeklyMaintenanceStartTime</p></li></ul><p>You can update multiple properties in a single request.</p>
 
 @param request A container for the necessary parameters to execute the UpdateFileSystem service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSFsxErrorDomain` domain and the following error code: `AWSFsxErrorBadRequest`, `AWSFsxErrorUnsupportedOperation`, `AWSFsxErrorIncompatibleParameter`, `AWSFsxErrorInternalServer`, `AWSFsxErrorFileSystemNotFound`, `AWSFsxErrorMissingFileSystemConfiguration`, `AWSFsxErrorServiceLimitExceeded`.
 
 @see AWSFsxUpdateFileSystemRequest
 @see AWSFsxUpdateFileSystemResponse
 */
- (void)updateFileSystem:(AWSFsxUpdateFileSystemRequest *)request completionHandler:(void (^ _Nullable)(AWSFsxUpdateFileSystemResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
