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
#import "AWSopsworks-cmModel.h"
#import "AWSopsworks-cmResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSopsworks-cm
FOUNDATION_EXPORT NSString *const AWSopsworks-cmSDKVersion;

/**
 <fullname>AWS OpsWorks CM</fullname><p>AWS OpsWorks for configuration management (CM) is a service that runs and manages configuration management servers. You can use AWS OpsWorks CM to create and manage AWS OpsWorks for Chef Automate and AWS OpsWorks for Puppet Enterprise servers, and add or remove nodes for the servers to manage.</p><p><b>Glossary of terms</b></p><ul><li><p><b>Server</b>: A configuration management server that can be highly-available. The configuration management server runs on an Amazon Elastic Compute Cloud (EC2) instance, and may use various other AWS services, such as Amazon Relational Database Service (RDS) and Elastic Load Balancing. A server is a generic abstraction over the configuration manager that you want to use, much like Amazon RDS. In AWS OpsWorks CM, you do not start or stop servers. After you create servers, they continue to run until they are deleted.</p></li><li><p><b>Engine</b>: The engine is the specific configuration manager that you want to use. Valid values in this release include <code>ChefAutomate</code> and <code>Puppet</code>.</p></li><li><p><b>Backup</b>: This is an application-level backup of the data that the configuration manager stores. AWS OpsWorks CM creates an S3 bucket for backups when you launch the first server. A backup maintains a snapshot of a server's configuration-related attributes at the time the backup starts.</p></li><li><p><b>Events</b>: Events are always related to a server. Events are written during server creation, when health checks run, when backups are created, when system maintenance is performed, etc. When you delete a server, the server's events are also deleted.</p></li><li><p><b>Account attributes</b>: Every account has attributes that are assigned in the AWS OpsWorks CM database. These attributes store information about configuration limits (servers, backups, etc.) and your customer account. </p></li></ul><p><b>Endpoints</b></p><p>AWS OpsWorks CM supports the following endpoints, all HTTPS. You must connect to one of the following endpoints. Your servers can only be accessed or managed within the endpoint in which they are created.</p><ul><li><p>opsworks-cm.us-east-1.amazonaws.com</p></li><li><p>opsworks-cm.us-east-2.amazonaws.com</p></li><li><p>opsworks-cm.us-west-1.amazonaws.com</p></li><li><p>opsworks-cm.us-west-2.amazonaws.com</p></li><li><p>opsworks-cm.ap-northeast-1.amazonaws.com</p></li><li><p>opsworks-cm.ap-southeast-1.amazonaws.com</p></li><li><p>opsworks-cm.ap-southeast-2.amazonaws.com</p></li><li><p>opsworks-cm.eu-central-1.amazonaws.com</p></li><li><p>opsworks-cm.eu-west-1.amazonaws.com</p></li></ul><p><b>Throttling limits</b></p><p>All API operations allow for five requests per second with a burst of 10 requests per second.</p>
 */
@interface AWSopsworks-cm : AWSService

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

     let opsworks-cm = AWSopsworks-cm.default()

 *Objective-C*

     AWSopsworks-cm *opsworks-cm = [AWSopsworks-cm defaultopsworks-cm];

 @return The default service client.
 */
+ (instancetype)defaultopsworks-cm;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSopsworks-cm.register(with: configuration!, forKey: "USWest2opsworks-cm")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:@"USWest2opsworks-cm"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let opsworks-cm = AWSopsworks-cm(forKey: "USWest2opsworks-cm")

 *Objective-C*

     AWSopsworks-cm *opsworks-cm = [AWSopsworks-cm opsworks-cmForKey:@"USWest2opsworks-cm"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registeropsworks-cmWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registeropsworks-cmWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSopsworks-cm.register(with: configuration!, forKey: "USWest2opsworks-cm")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:@"USWest2opsworks-cm"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let opsworks-cm = AWSopsworks-cm(forKey: "USWest2opsworks-cm")

 *Objective-C*

     AWSopsworks-cm *opsworks-cm = [AWSopsworks-cm opsworks-cmForKey:@"USWest2opsworks-cm"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)opsworks-cmForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeopsworks-cmForKey:(NSString *)key;

/**
 <p> Associates a new node with the server. For more information about how to disassociate a node, see <a>DisassociateNode</a>.</p><p> On a Chef server: This command is an alternative to <code>knife bootstrap</code>.</p><p> Example (Chef): <code>aws opsworks-cm associate-node --server-name <i>MyServer</i> --node-name <i>MyManagedNode</i> --engine-attributes "Name=<i>CHEF_ORGANIZATION</i>,Value=default" "Name=<i>CHEF_NODE_PUBLIC_KEY</i>,Value=<i>public-key-pem</i>"</code></p><p> On a Puppet server, this command is an alternative to the <code>puppet cert sign</code> command that signs a Puppet node CSR. </p><p> Example (Chef): <code>aws opsworks-cm associate-node --server-name <i>MyServer</i> --node-name <i>MyManagedNode</i> --engine-attributes "Name=<i>PUPPET_NODE_CSR</i>,Value=<i>csr-pem</i>"</code></p><p> A node can can only be associated with servers that are in a <code>HEALTHY</code> state. Otherwise, an <code>InvalidStateException</code> is thrown. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. The AssociateNode API call can be integrated into Auto Scaling configurations, AWS Cloudformation templates, or the user data of a server's instance. </p>
 
 @param request A container for the necessary parameters to execute the AssociateNode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmAssociateNodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmAssociateNodeRequest
 @see AWSopsworks-cmAssociateNodeResponse
 */
- (AWSTask<AWSopsworks-cmAssociateNodeResponse *> *)associateNode:(AWSopsworks-cmAssociateNodeRequest *)request;

/**
 <p> Associates a new node with the server. For more information about how to disassociate a node, see <a>DisassociateNode</a>.</p><p> On a Chef server: This command is an alternative to <code>knife bootstrap</code>.</p><p> Example (Chef): <code>aws opsworks-cm associate-node --server-name <i>MyServer</i> --node-name <i>MyManagedNode</i> --engine-attributes "Name=<i>CHEF_ORGANIZATION</i>,Value=default" "Name=<i>CHEF_NODE_PUBLIC_KEY</i>,Value=<i>public-key-pem</i>"</code></p><p> On a Puppet server, this command is an alternative to the <code>puppet cert sign</code> command that signs a Puppet node CSR. </p><p> Example (Chef): <code>aws opsworks-cm associate-node --server-name <i>MyServer</i> --node-name <i>MyManagedNode</i> --engine-attributes "Name=<i>PUPPET_NODE_CSR</i>,Value=<i>csr-pem</i>"</code></p><p> A node can can only be associated with servers that are in a <code>HEALTHY</code> state. Otherwise, an <code>InvalidStateException</code> is thrown. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. The AssociateNode API call can be integrated into Auto Scaling configurations, AWS Cloudformation templates, or the user data of a server's instance. </p>
 
 @param request A container for the necessary parameters to execute the AssociateNode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmAssociateNodeRequest
 @see AWSopsworks-cmAssociateNodeResponse
 */
- (void)associateNode:(AWSopsworks-cmAssociateNodeRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmAssociateNodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates an application-level backup of a server. While the server is in the <code>BACKING_UP</code> state, the server cannot be changed, and no additional backup can be created. </p><p> Backups can be created for servers in <code>RUNNING</code>, <code>HEALTHY</code>, and <code>UNHEALTHY</code> states. By default, you can create a maximum of 50 manual backups. </p><p> This operation is asynchronous. </p><p> A <code>LimitExceededException</code> is thrown when the maximum number of manual backups is reached. An <code>InvalidStateException</code> is thrown when the server is not in any of the following states: RUNNING, HEALTHY, or UNHEALTHY. A <code>ResourceNotFoundException</code> is thrown when the server is not found. A <code>ValidationException</code> is thrown when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the CreateBackup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmCreateBackupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorLimitExceeded`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmCreateBackupRequest
 @see AWSopsworks-cmCreateBackupResponse
 */
- (AWSTask<AWSopsworks-cmCreateBackupResponse *> *)createBackup:(AWSopsworks-cmCreateBackupRequest *)request;

/**
 <p> Creates an application-level backup of a server. While the server is in the <code>BACKING_UP</code> state, the server cannot be changed, and no additional backup can be created. </p><p> Backups can be created for servers in <code>RUNNING</code>, <code>HEALTHY</code>, and <code>UNHEALTHY</code> states. By default, you can create a maximum of 50 manual backups. </p><p> This operation is asynchronous. </p><p> A <code>LimitExceededException</code> is thrown when the maximum number of manual backups is reached. An <code>InvalidStateException</code> is thrown when the server is not in any of the following states: RUNNING, HEALTHY, or UNHEALTHY. A <code>ResourceNotFoundException</code> is thrown when the server is not found. A <code>ValidationException</code> is thrown when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the CreateBackup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorLimitExceeded`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmCreateBackupRequest
 @see AWSopsworks-cmCreateBackupResponse
 */
- (void)createBackup:(AWSopsworks-cmCreateBackupRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmCreateBackupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Creates and immedately starts a new server. The server is ready to use when it is in the <code>HEALTHY</code> state. By default, you can create a maximum of 10 servers. </p><p> This operation is asynchronous. </p><p> A <code>LimitExceededException</code> is thrown when you have created the maximum number of servers (10). A <code>ResourceAlreadyExistsException</code> is thrown when a server with the same name already exists in the account. A <code>ResourceNotFoundException</code> is thrown when you specify a backup ID that is not valid or is for a backup that does not exist. A <code>ValidationException</code> is thrown when parameters of the request are not valid. </p><p> If you do not specify a security group by adding the <code>SecurityGroupIds</code> parameter, AWS OpsWorks creates a new security group. </p><p><i>Chef Automate:</i> The default security group opens the Chef server to the world on TCP port 443. If a KeyName is present, AWS OpsWorks enables SSH access. SSH is also open to the world on TCP port 22. </p><p><i>Puppet Enterprise:</i> The default security group opens TCP ports 22, 443, 4433, 8140, 8142, 8143, and 8170. If a KeyName is present, AWS OpsWorks enables SSH access. SSH is also open to the world on TCP port 22. </p><p>By default, your server is accessible from any IP address. We recommend that you update your security group rules to allow access from known IP addresses and address ranges only. To edit security group rules, open Security Groups in the navigation pane of the EC2 management console. </p><p>To specify your own domain for a server, and provide your own self-signed or CA-signed certificate and private key, specify values for <code>CustomDomain</code>, <code>CustomCertificate</code>, and <code>CustomPrivateKey</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmCreateServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorLimitExceeded`, `AWSopsworks-cmErrorResourceAlreadyExists`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmCreateServerRequest
 @see AWSopsworks-cmCreateServerResponse
 */
- (AWSTask<AWSopsworks-cmCreateServerResponse *> *)createServer:(AWSopsworks-cmCreateServerRequest *)request;

/**
 <p> Creates and immedately starts a new server. The server is ready to use when it is in the <code>HEALTHY</code> state. By default, you can create a maximum of 10 servers. </p><p> This operation is asynchronous. </p><p> A <code>LimitExceededException</code> is thrown when you have created the maximum number of servers (10). A <code>ResourceAlreadyExistsException</code> is thrown when a server with the same name already exists in the account. A <code>ResourceNotFoundException</code> is thrown when you specify a backup ID that is not valid or is for a backup that does not exist. A <code>ValidationException</code> is thrown when parameters of the request are not valid. </p><p> If you do not specify a security group by adding the <code>SecurityGroupIds</code> parameter, AWS OpsWorks creates a new security group. </p><p><i>Chef Automate:</i> The default security group opens the Chef server to the world on TCP port 443. If a KeyName is present, AWS OpsWorks enables SSH access. SSH is also open to the world on TCP port 22. </p><p><i>Puppet Enterprise:</i> The default security group opens TCP ports 22, 443, 4433, 8140, 8142, 8143, and 8170. If a KeyName is present, AWS OpsWorks enables SSH access. SSH is also open to the world on TCP port 22. </p><p>By default, your server is accessible from any IP address. We recommend that you update your security group rules to allow access from known IP addresses and address ranges only. To edit security group rules, open Security Groups in the navigation pane of the EC2 management console. </p><p>To specify your own domain for a server, and provide your own self-signed or CA-signed certificate and private key, specify values for <code>CustomDomain</code>, <code>CustomCertificate</code>, and <code>CustomPrivateKey</code>.</p>
 
 @param request A container for the necessary parameters to execute the CreateServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorLimitExceeded`, `AWSopsworks-cmErrorResourceAlreadyExists`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmCreateServerRequest
 @see AWSopsworks-cmCreateServerResponse
 */
- (void)createServer:(AWSopsworks-cmCreateServerRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmCreateServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes a backup. You can delete both manual and automated backups. This operation is asynchronous. </p><p> An <code>InvalidStateException</code> is thrown when a backup deletion is already in progress. A <code>ResourceNotFoundException</code> is thrown when the backup does not exist. A <code>ValidationException</code> is thrown when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DeleteBackup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmDeleteBackupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmDeleteBackupRequest
 @see AWSopsworks-cmDeleteBackupResponse
 */
- (AWSTask<AWSopsworks-cmDeleteBackupResponse *> *)deleteBackup:(AWSopsworks-cmDeleteBackupRequest *)request;

/**
 <p> Deletes a backup. You can delete both manual and automated backups. This operation is asynchronous. </p><p> An <code>InvalidStateException</code> is thrown when a backup deletion is already in progress. A <code>ResourceNotFoundException</code> is thrown when the backup does not exist. A <code>ValidationException</code> is thrown when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DeleteBackup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmDeleteBackupRequest
 @see AWSopsworks-cmDeleteBackupResponse
 */
- (void)deleteBackup:(AWSopsworks-cmDeleteBackupRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmDeleteBackupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Deletes the server and the underlying AWS CloudFormation stacks (including the server's EC2 instance). When you run this command, the server state is updated to <code>DELETING</code>. After the server is deleted, it is no longer returned by <code>DescribeServer</code> requests. If the AWS CloudFormation stack cannot be deleted, the server cannot be deleted. </p><p> This operation is asynchronous. </p><p> An <code>InvalidStateException</code> is thrown when a server deletion is already in progress. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p><p></p>
 
 @param request A container for the necessary parameters to execute the DeleteServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmDeleteServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmDeleteServerRequest
 @see AWSopsworks-cmDeleteServerResponse
 */
- (AWSTask<AWSopsworks-cmDeleteServerResponse *> *)deleteServer:(AWSopsworks-cmDeleteServerRequest *)request;

/**
 <p> Deletes the server and the underlying AWS CloudFormation stacks (including the server's EC2 instance). When you run this command, the server state is updated to <code>DELETING</code>. After the server is deleted, it is no longer returned by <code>DescribeServer</code> requests. If the AWS CloudFormation stack cannot be deleted, the server cannot be deleted. </p><p> This operation is asynchronous. </p><p> An <code>InvalidStateException</code> is thrown when a server deletion is already in progress. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p><p></p>
 
 @param request A container for the necessary parameters to execute the DeleteServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmDeleteServerRequest
 @see AWSopsworks-cmDeleteServerResponse
 */
- (void)deleteServer:(AWSopsworks-cmDeleteServerRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmDeleteServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Describes your OpsWorks-CM account attributes. </p><p> This operation is synchronous. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmDescribeAccountAttributesResponse`.
 
 @see AWSopsworks-cmDescribeAccountAttributesRequest
 @see AWSopsworks-cmDescribeAccountAttributesResponse
 */
- (AWSTask<AWSopsworks-cmDescribeAccountAttributesResponse *> *)describeAccountAttributes:(AWSopsworks-cmDescribeAccountAttributesRequest *)request;

/**
 <p> Describes your OpsWorks-CM account attributes. </p><p> This operation is synchronous. </p>
 
 @param request A container for the necessary parameters to execute the DescribeAccountAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful.
 
 @see AWSopsworks-cmDescribeAccountAttributesRequest
 @see AWSopsworks-cmDescribeAccountAttributesResponse
 */
- (void)describeAccountAttributes:(AWSopsworks-cmDescribeAccountAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmDescribeAccountAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Describes backups. The results are ordered by time, with newest backups first. If you do not specify a BackupId or ServerName, the command returns all backups. </p><p> This operation is synchronous. </p><p> A <code>ResourceNotFoundException</code> is thrown when the backup does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DescribeBackups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmDescribeBackupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorInvalidNextToken`.
 
 @see AWSopsworks-cmDescribeBackupsRequest
 @see AWSopsworks-cmDescribeBackupsResponse
 */
- (AWSTask<AWSopsworks-cmDescribeBackupsResponse *> *)describeBackups:(AWSopsworks-cmDescribeBackupsRequest *)request;

/**
 <p> Describes backups. The results are ordered by time, with newest backups first. If you do not specify a BackupId or ServerName, the command returns all backups. </p><p> This operation is synchronous. </p><p> A <code>ResourceNotFoundException</code> is thrown when the backup does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DescribeBackups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorInvalidNextToken`.
 
 @see AWSopsworks-cmDescribeBackupsRequest
 @see AWSopsworks-cmDescribeBackupsResponse
 */
- (void)describeBackups:(AWSopsworks-cmDescribeBackupsRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmDescribeBackupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Describes events for a specified server. Results are ordered by time, with newest events first. </p><p> This operation is synchronous. </p><p> A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmDescribeEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorInvalidNextToken`, `AWSopsworks-cmErrorResourceNotFound`.
 
 @see AWSopsworks-cmDescribeEventsRequest
 @see AWSopsworks-cmDescribeEventsResponse
 */
- (AWSTask<AWSopsworks-cmDescribeEventsResponse *> *)describeEvents:(AWSopsworks-cmDescribeEventsRequest *)request;

/**
 <p> Describes events for a specified server. Results are ordered by time, with newest events first. </p><p> This operation is synchronous. </p><p> A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DescribeEvents service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorInvalidNextToken`, `AWSopsworks-cmErrorResourceNotFound`.
 
 @see AWSopsworks-cmDescribeEventsRequest
 @see AWSopsworks-cmDescribeEventsResponse
 */
- (void)describeEvents:(AWSopsworks-cmDescribeEventsRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmDescribeEventsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Returns the current status of an existing association or disassociation request. </p><p> A <code>ResourceNotFoundException</code> is thrown when no recent association or disassociation request with the specified token is found, or when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DescribeNodeAssociationStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmDescribeNodeAssociationStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmDescribeNodeAssociationStatusRequest
 @see AWSopsworks-cmDescribeNodeAssociationStatusResponse
 */
- (AWSTask<AWSopsworks-cmDescribeNodeAssociationStatusResponse *> *)describeNodeAssociationStatus:(AWSopsworks-cmDescribeNodeAssociationStatusRequest *)request;

/**
 <p> Returns the current status of an existing association or disassociation request. </p><p> A <code>ResourceNotFoundException</code> is thrown when no recent association or disassociation request with the specified token is found, or when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DescribeNodeAssociationStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmDescribeNodeAssociationStatusRequest
 @see AWSopsworks-cmDescribeNodeAssociationStatusResponse
 */
- (void)describeNodeAssociationStatus:(AWSopsworks-cmDescribeNodeAssociationStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmDescribeNodeAssociationStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Lists all configuration management servers that are identified with your account. Only the stored results from Amazon DynamoDB are returned. AWS OpsWorks CM does not query other services. </p><p> This operation is synchronous. </p><p> A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DescribeServers service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmDescribeServersResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorInvalidNextToken`.
 
 @see AWSopsworks-cmDescribeServersRequest
 @see AWSopsworks-cmDescribeServersResponse
 */
- (AWSTask<AWSopsworks-cmDescribeServersResponse *> *)describeServers:(AWSopsworks-cmDescribeServersRequest *)request;

/**
 <p> Lists all configuration management servers that are identified with your account. Only the stored results from Amazon DynamoDB are returned. AWS OpsWorks CM does not query other services. </p><p> This operation is synchronous. </p><p> A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DescribeServers service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorInvalidNextToken`.
 
 @see AWSopsworks-cmDescribeServersRequest
 @see AWSopsworks-cmDescribeServersResponse
 */
- (void)describeServers:(AWSopsworks-cmDescribeServersRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmDescribeServersResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Disassociates a node from an AWS OpsWorks CM server, and removes the node from the server's managed nodes. After a node is disassociated, the node key pair is no longer valid for accessing the configuration manager's API. For more information about how to associate a node, see <a>AssociateNode</a>. </p><p>A node can can only be disassociated from a server that is in a <code>HEALTHY</code> state. Otherwise, an <code>InvalidStateException</code> is thrown. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateNode service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmDisassociateNodeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmDisassociateNodeRequest
 @see AWSopsworks-cmDisassociateNodeResponse
 */
- (AWSTask<AWSopsworks-cmDisassociateNodeResponse *> *)disassociateNode:(AWSopsworks-cmDisassociateNodeRequest *)request;

/**
 <p> Disassociates a node from an AWS OpsWorks CM server, and removes the node from the server's managed nodes. After a node is disassociated, the node key pair is no longer valid for accessing the configuration manager's API. For more information about how to associate a node, see <a>AssociateNode</a>. </p><p>A node can can only be disassociated from a server that is in a <code>HEALTHY</code> state. Otherwise, an <code>InvalidStateException</code> is thrown. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the DisassociateNode service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmDisassociateNodeRequest
 @see AWSopsworks-cmDisassociateNodeResponse
 */
- (void)disassociateNode:(AWSopsworks-cmDisassociateNodeRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmDisassociateNodeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Exports a specified server engine attribute as a base64-encoded string. For example, you can export user data that you can use in EC2 to associate nodes with a server. </p><p> This operation is synchronous. </p><p> A <code>ValidationException</code> is raised when parameters of the request are not valid. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. An <code>InvalidStateException</code> is thrown when the server is in any of the following states: CREATING, TERMINATED, FAILED or DELETING. </p>
 
 @param request A container for the necessary parameters to execute the ExportServerEngineAttribute service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmExportServerEngineAttributeResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorInvalidState`.
 
 @see AWSopsworks-cmExportServerEngineAttributeRequest
 @see AWSopsworks-cmExportServerEngineAttributeResponse
 */
- (AWSTask<AWSopsworks-cmExportServerEngineAttributeResponse *> *)exportServerEngineAttribute:(AWSopsworks-cmExportServerEngineAttributeRequest *)request;

/**
 <p> Exports a specified server engine attribute as a base64-encoded string. For example, you can export user data that you can use in EC2 to associate nodes with a server. </p><p> This operation is synchronous. </p><p> A <code>ValidationException</code> is raised when parameters of the request are not valid. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. An <code>InvalidStateException</code> is thrown when the server is in any of the following states: CREATING, TERMINATED, FAILED or DELETING. </p>
 
 @param request A container for the necessary parameters to execute the ExportServerEngineAttribute service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorInvalidState`.
 
 @see AWSopsworks-cmExportServerEngineAttributeRequest
 @see AWSopsworks-cmExportServerEngineAttributeResponse
 */
- (void)exportServerEngineAttribute:(AWSopsworks-cmExportServerEngineAttributeRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmExportServerEngineAttributeResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Returns a list of tags that are applied to the specified AWS OpsWorks for Chef Automate or AWS OpsWorks for Puppet Enterprise servers or backups.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmListTagsForResourceRequest
 @see AWSopsworks-cmListTagsForResourceResponse
 */
- (AWSTask<AWSopsworks-cmListTagsForResourceResponse *> *)listTagsForResource:(AWSopsworks-cmListTagsForResourceRequest *)request;

/**
 <p>Returns a list of tags that are applied to the specified AWS OpsWorks for Chef Automate or AWS OpsWorks for Puppet Enterprise servers or backups.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmListTagsForResourceRequest
 @see AWSopsworks-cmListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSopsworks-cmListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Restores a backup to a server that is in a <code>CONNECTION_LOST</code>, <code>HEALTHY</code>, <code>RUNNING</code>, <code>UNHEALTHY</code>, or <code>TERMINATED</code> state. When you run RestoreServer, the server's EC2 instance is deleted, and a new EC2 instance is configured. RestoreServer maintains the existing server endpoint, so configuration management of the server's client devices (nodes) should continue to work. </p><p>Restoring from a backup is performed by creating a new EC2 instance. If restoration is successful, and the server is in a <code>HEALTHY</code> state, AWS OpsWorks CM switches traffic over to the new instance. After restoration is finished, the old EC2 instance is maintained in a <code>Running</code> or <code>Stopped</code> state, but is eventually terminated.</p><p> This operation is asynchronous. </p><p> An <code>InvalidStateException</code> is thrown when the server is not in a valid state. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the RestoreServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmRestoreServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmRestoreServerRequest
 @see AWSopsworks-cmRestoreServerResponse
 */
- (AWSTask<AWSopsworks-cmRestoreServerResponse *> *)restoreServer:(AWSopsworks-cmRestoreServerRequest *)request;

/**
 <p> Restores a backup to a server that is in a <code>CONNECTION_LOST</code>, <code>HEALTHY</code>, <code>RUNNING</code>, <code>UNHEALTHY</code>, or <code>TERMINATED</code> state. When you run RestoreServer, the server's EC2 instance is deleted, and a new EC2 instance is configured. RestoreServer maintains the existing server endpoint, so configuration management of the server's client devices (nodes) should continue to work. </p><p>Restoring from a backup is performed by creating a new EC2 instance. If restoration is successful, and the server is in a <code>HEALTHY</code> state, AWS OpsWorks CM switches traffic over to the new instance. After restoration is finished, the old EC2 instance is maintained in a <code>Running</code> or <code>Stopped</code> state, but is eventually terminated.</p><p> This operation is asynchronous. </p><p> An <code>InvalidStateException</code> is thrown when the server is not in a valid state. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the RestoreServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmRestoreServerRequest
 @see AWSopsworks-cmRestoreServerResponse
 */
- (void)restoreServer:(AWSopsworks-cmRestoreServerRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmRestoreServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Manually starts server maintenance. This command can be useful if an earlier maintenance attempt failed, and the underlying cause of maintenance failure has been resolved. The server is in an <code>UNDER_MAINTENANCE</code> state while maintenance is in progress. </p><p> Maintenance can only be started on servers in <code>HEALTHY</code> and <code>UNHEALTHY</code> states. Otherwise, an <code>InvalidStateException</code> is thrown. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the StartMaintenance service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmStartMaintenanceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmStartMaintenanceRequest
 @see AWSopsworks-cmStartMaintenanceResponse
 */
- (AWSTask<AWSopsworks-cmStartMaintenanceResponse *> *)startMaintenance:(AWSopsworks-cmStartMaintenanceRequest *)request;

/**
 <p> Manually starts server maintenance. This command can be useful if an earlier maintenance attempt failed, and the underlying cause of maintenance failure has been resolved. The server is in an <code>UNDER_MAINTENANCE</code> state while maintenance is in progress. </p><p> Maintenance can only be started on servers in <code>HEALTHY</code> and <code>UNHEALTHY</code> states. Otherwise, an <code>InvalidStateException</code> is thrown. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the StartMaintenance service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmStartMaintenanceRequest
 @see AWSopsworks-cmStartMaintenanceResponse
 */
- (void)startMaintenance:(AWSopsworks-cmStartMaintenanceRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmStartMaintenanceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Applies tags to an AWS OpsWorks for Chef Automate or AWS OpsWorks for Puppet Enterprise server, or to server backups.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorInvalidState`.
 
 @see AWSopsworks-cmTagResourceRequest
 @see AWSopsworks-cmTagResourceResponse
 */
- (AWSTask<AWSopsworks-cmTagResourceResponse *> *)tagResource:(AWSopsworks-cmTagResourceRequest *)request;

/**
 <p>Applies tags to an AWS OpsWorks for Chef Automate or AWS OpsWorks for Puppet Enterprise server, or to server backups.</p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorInvalidState`.
 
 @see AWSopsworks-cmTagResourceRequest
 @see AWSopsworks-cmTagResourceResponse
 */
- (void)tagResource:(AWSopsworks-cmTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Removes specified tags from an AWS OpsWorks-CM server or backup.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorInvalidState`.
 
 @see AWSopsworks-cmUntagResourceRequest
 @see AWSopsworks-cmUntagResourceResponse
 */
- (AWSTask<AWSopsworks-cmUntagResourceResponse *> *)untagResource:(AWSopsworks-cmUntagResourceRequest *)request;

/**
 <p>Removes specified tags from an AWS OpsWorks-CM server or backup.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`, `AWSopsworks-cmErrorInvalidState`.
 
 @see AWSopsworks-cmUntagResourceRequest
 @see AWSopsworks-cmUntagResourceResponse
 */
- (void)untagResource:(AWSopsworks-cmUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates settings for a server. </p><p> This operation is synchronous. </p>
 
 @param request A container for the necessary parameters to execute the UpdateServer service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmUpdateServerResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmUpdateServerRequest
 @see AWSopsworks-cmUpdateServerResponse
 */
- (AWSTask<AWSopsworks-cmUpdateServerResponse *> *)updateServer:(AWSopsworks-cmUpdateServerRequest *)request;

/**
 <p> Updates settings for a server. </p><p> This operation is synchronous. </p>
 
 @param request A container for the necessary parameters to execute the UpdateServer service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmUpdateServerRequest
 @see AWSopsworks-cmUpdateServerResponse
 */
- (void)updateServer:(AWSopsworks-cmUpdateServerRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmUpdateServerResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p> Updates engine-specific attributes on a specified server. The server enters the <code>MODIFYING</code> state when this operation is in progress. Only one update can occur at a time. You can use this command to reset a Chef server's public key (<code>CHEF_PIVOTAL_KEY</code>) or a Puppet server's admin password (<code>PUPPET_ADMIN_PASSWORD</code>). </p><p> This operation is asynchronous. </p><p> This operation can only be called for servers in <code>HEALTHY</code> or <code>UNHEALTHY</code> states. Otherwise, an <code>InvalidStateException</code> is raised. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the UpdateServerEngineAttributes service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSopsworks-cmUpdateServerEngineAttributesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmUpdateServerEngineAttributesRequest
 @see AWSopsworks-cmUpdateServerEngineAttributesResponse
 */
- (AWSTask<AWSopsworks-cmUpdateServerEngineAttributesResponse *> *)updateServerEngineAttributes:(AWSopsworks-cmUpdateServerEngineAttributesRequest *)request;

/**
 <p> Updates engine-specific attributes on a specified server. The server enters the <code>MODIFYING</code> state when this operation is in progress. Only one update can occur at a time. You can use this command to reset a Chef server's public key (<code>CHEF_PIVOTAL_KEY</code>) or a Puppet server's admin password (<code>PUPPET_ADMIN_PASSWORD</code>). </p><p> This operation is asynchronous. </p><p> This operation can only be called for servers in <code>HEALTHY</code> or <code>UNHEALTHY</code> states. Otherwise, an <code>InvalidStateException</code> is raised. A <code>ResourceNotFoundException</code> is thrown when the server does not exist. A <code>ValidationException</code> is raised when parameters of the request are not valid. </p>
 
 @param request A container for the necessary parameters to execute the UpdateServerEngineAttributes service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSopsworks-cmErrorDomain` domain and the following error code: `AWSopsworks-cmErrorInvalidState`, `AWSopsworks-cmErrorResourceNotFound`, `AWSopsworks-cmErrorValidation`.
 
 @see AWSopsworks-cmUpdateServerEngineAttributesRequest
 @see AWSopsworks-cmUpdateServerEngineAttributesResponse
 */
- (void)updateServerEngineAttributes:(AWSopsworks-cmUpdateServerEngineAttributesRequest *)request completionHandler:(void (^ _Nullable)(AWSopsworks-cmUpdateServerEngineAttributesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
