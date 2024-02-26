//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSConnectParticipantModel.h"
#import "AWSConnectParticipantResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSConnectParticipant
FOUNDATION_EXPORT NSString *const AWSConnectParticipantSDKVersion;

/**
 <p>Amazon Connect is an easy-to-use omnichannel cloud contact center service that enables companies of any size to deliver superior customer service at a lower cost. Amazon Connect communications capabilities make it easy for companies to deliver personalized interactions across communication channels, including chat. </p><p>Use the Amazon Connect Participant Service to manage participants (for example, agents, customers, and managers listening in), and to send messages and events within a chat contact. The APIs in the service enable the following: sending chat messages, attachment sharing, managing a participant's connection state and message events, and retrieving chat transcripts.</p>
 */
@interface AWSConnectParticipant : AWSService

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

     let ConnectParticipant = AWSConnectParticipant.default()

 *Objective-C*

     AWSConnectParticipant *ConnectParticipant = [AWSConnectParticipant defaultConnectParticipant];

 @return The default service client.
 */
+ (instancetype)defaultConnectParticipant;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSConnectParticipant.register(with: configuration!, forKey: "USWest2ConnectParticipant")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:@"USWest2ConnectParticipant"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ConnectParticipant = AWSConnectParticipant(forKey: "USWest2ConnectParticipant")

 *Objective-C*

     AWSConnectParticipant *ConnectParticipant = [AWSConnectParticipant ConnectParticipantForKey:@"USWest2ConnectParticipant"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerConnectParticipantWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerConnectParticipantWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSConnectParticipant.register(with: configuration!, forKey: "USWest2ConnectParticipant")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSConnectParticipant registerConnectParticipantWithConfiguration:configuration forKey:@"USWest2ConnectParticipant"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let ConnectParticipant = AWSConnectParticipant(forKey: "USWest2ConnectParticipant")

 *Objective-C*

     AWSConnectParticipant *ConnectParticipant = [AWSConnectParticipant ConnectParticipantForKey:@"USWest2ConnectParticipant"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)ConnectParticipantForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeConnectParticipantForKey:(NSString *)key;

/**
 <p>Allows you to confirm that the attachment has been uploaded using the pre-signed URL provided in StartAttachmentUpload API. A conflict exception is thrown when an attachment with that identifier is already being uploaded.</p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the CompleteAttachmentUpload service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantCompleteAttachmentUploadResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`, `AWSConnectParticipantErrorServiceQuotaExceeded`, `AWSConnectParticipantErrorConflict`.
 
 @see AWSConnectParticipantCompleteAttachmentUploadRequest
 @see AWSConnectParticipantCompleteAttachmentUploadResponse
 */
- (AWSTask<AWSConnectParticipantCompleteAttachmentUploadResponse *> *)completeAttachmentUpload:(AWSConnectParticipantCompleteAttachmentUploadRequest *)request;

/**
 <p>Allows you to confirm that the attachment has been uploaded using the pre-signed URL provided in StartAttachmentUpload API. A conflict exception is thrown when an attachment with that identifier is already being uploaded.</p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the CompleteAttachmentUpload service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`, `AWSConnectParticipantErrorServiceQuotaExceeded`, `AWSConnectParticipantErrorConflict`.
 
 @see AWSConnectParticipantCompleteAttachmentUploadRequest
 @see AWSConnectParticipantCompleteAttachmentUploadResponse
 */
- (void)completeAttachmentUpload:(AWSConnectParticipantCompleteAttachmentUploadRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantCompleteAttachmentUploadResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates the participant's connection. </p><note><p><code>ParticipantToken</code> is used for invoking this API instead of <code>ConnectionToken</code>.</p></note><p>The participant token is valid for the lifetime of the participant – until they are part of a contact.</p><p>The response URL for <code>WEBSOCKET</code> Type has a connect expiry timeout of 100s. Clients must manually connect to the returned websocket URL and subscribe to the desired topic. </p><p>For chat, you need to publish the following on the established websocket connection:</p><p><code>{"topic":"aws/subscribe","content":{"topics":["aws/chat"]}}</code></p><p>Upon websocket URL expiry, as specified in the response ConnectionExpiry parameter, clients need to call this API again to obtain a new websocket URL and perform the same steps as before.</p><p><b>Message streaming support</b>: This API can also be used together with the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartContactStreaming.html">StartContactStreaming</a> API to create a participant connection for chat contacts that are not using a websocket. For more information about message streaming, <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-message-streaming.html">Enable real-time chat message streaming</a> in the <i>Amazon Connect Administrator Guide</i>.</p><p><b>Feature specifications</b>: For information about feature specifications, such as the allowed number of open websocket connections per participant, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>. </p><note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateParticipantConnection service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantCreateParticipantConnectionResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantCreateParticipantConnectionRequest
 @see AWSConnectParticipantCreateParticipantConnectionResponse
 */
- (AWSTask<AWSConnectParticipantCreateParticipantConnectionResponse *> *)createParticipantConnection:(AWSConnectParticipantCreateParticipantConnectionRequest *)request;

/**
 <p>Creates the participant's connection. </p><note><p><code>ParticipantToken</code> is used for invoking this API instead of <code>ConnectionToken</code>.</p></note><p>The participant token is valid for the lifetime of the participant – until they are part of a contact.</p><p>The response URL for <code>WEBSOCKET</code> Type has a connect expiry timeout of 100s. Clients must manually connect to the returned websocket URL and subscribe to the desired topic. </p><p>For chat, you need to publish the following on the established websocket connection:</p><p><code>{"topic":"aws/subscribe","content":{"topics":["aws/chat"]}}</code></p><p>Upon websocket URL expiry, as specified in the response ConnectionExpiry parameter, clients need to call this API again to obtain a new websocket URL and perform the same steps as before.</p><p><b>Message streaming support</b>: This API can also be used together with the <a href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartContactStreaming.html">StartContactStreaming</a> API to create a participant connection for chat contacts that are not using a websocket. For more information about message streaming, <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-message-streaming.html">Enable real-time chat message streaming</a> in the <i>Amazon Connect Administrator Guide</i>.</p><p><b>Feature specifications</b>: For information about feature specifications, such as the allowed number of open websocket connections per participant, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>. </p><note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p></note>
 
 @param request A container for the necessary parameters to execute the CreateParticipantConnection service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantCreateParticipantConnectionRequest
 @see AWSConnectParticipantCreateParticipantConnectionResponse
 */
- (void)createParticipantConnection:(AWSConnectParticipantCreateParticipantConnectionRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantCreateParticipantConnectionResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves the view for the specified view token.</p>
 
 @param request A container for the necessary parameters to execute the DescribeView service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantDescribeViewResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorResourceNotFound`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantDescribeViewRequest
 @see AWSConnectParticipantDescribeViewResponse
 */
- (AWSTask<AWSConnectParticipantDescribeViewResponse *> *)describeView:(AWSConnectParticipantDescribeViewRequest *)request;

/**
 <p>Retrieves the view for the specified view token.</p>
 
 @param request A container for the necessary parameters to execute the DescribeView service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorResourceNotFound`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantDescribeViewRequest
 @see AWSConnectParticipantDescribeViewResponse
 */
- (void)describeView:(AWSConnectParticipantDescribeViewRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantDescribeViewResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Disconnects a participant. </p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the DisconnectParticipant service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantDisconnectParticipantResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantDisconnectParticipantRequest
 @see AWSConnectParticipantDisconnectParticipantResponse
 */
- (AWSTask<AWSConnectParticipantDisconnectParticipantResponse *> *)disconnectParticipant:(AWSConnectParticipantDisconnectParticipantRequest *)request;

/**
 <p>Disconnects a participant. </p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the DisconnectParticipant service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantDisconnectParticipantRequest
 @see AWSConnectParticipantDisconnectParticipantResponse
 */
- (void)disconnectParticipant:(AWSConnectParticipantDisconnectParticipantRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantDisconnectParticipantResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a pre-signed URL for download of a completed attachment. This is an asynchronous API for use with active contacts.</p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetAttachment service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantGetAttachmentResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantGetAttachmentRequest
 @see AWSConnectParticipantGetAttachmentResponse
 */
- (AWSTask<AWSConnectParticipantGetAttachmentResponse *> *)getAttachment:(AWSConnectParticipantGetAttachmentRequest *)request;

/**
 <p>Provides a pre-signed URL for download of a completed attachment. This is an asynchronous API for use with active contacts.</p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetAttachment service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantGetAttachmentRequest
 @see AWSConnectParticipantGetAttachmentResponse
 */
- (void)getAttachment:(AWSConnectParticipantGetAttachmentRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantGetAttachmentResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Retrieves a transcript of the session, including details about any attachments. For information about accessing past chat contact transcripts for a persistent chat, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html">Enable persistent chat</a>. </p><p>If you have a process that consumes events in the transcript of an chat that has ended, note that chat transcripts contain the following event content types if the event has occurred during the chat session:</p><ul><li><p><code>application/vnd.amazonaws.connect.event.participant.left</code></p></li><li><p><code>application/vnd.amazonaws.connect.event.participant.joined</code></p></li><li><p><code>application/vnd.amazonaws.connect.event.chat.ended</code></p></li><li><p><code>application/vnd.amazonaws.connect.event.transfer.succeeded</code></p></li><li><p><code>application/vnd.amazonaws.connect.event.transfer.failed</code></p></li></ul><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetTranscript service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantGetTranscriptResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantGetTranscriptRequest
 @see AWSConnectParticipantGetTranscriptResponse
 */
- (AWSTask<AWSConnectParticipantGetTranscriptResponse *> *)getTranscript:(AWSConnectParticipantGetTranscriptRequest *)request;

/**
 <p>Retrieves a transcript of the session, including details about any attachments. For information about accessing past chat contact transcripts for a persistent chat, see <a href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-persistence.html">Enable persistent chat</a>. </p><p>If you have a process that consumes events in the transcript of an chat that has ended, note that chat transcripts contain the following event content types if the event has occurred during the chat session:</p><ul><li><p><code>application/vnd.amazonaws.connect.event.participant.left</code></p></li><li><p><code>application/vnd.amazonaws.connect.event.participant.joined</code></p></li><li><p><code>application/vnd.amazonaws.connect.event.chat.ended</code></p></li><li><p><code>application/vnd.amazonaws.connect.event.transfer.succeeded</code></p></li><li><p><code>application/vnd.amazonaws.connect.event.transfer.failed</code></p></li></ul><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetTranscript service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantGetTranscriptRequest
 @see AWSConnectParticipantGetTranscriptResponse
 */
- (void)getTranscript:(AWSConnectParticipantGetTranscriptRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantGetTranscriptResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>The <code>application/vnd.amazonaws.connect.event.connection.acknowledged</code> ContentType will no longer be supported starting December 31, 2024. This event has been migrated to the <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> API using the <code>ConnectParticipant</code> field.</p></note><p>Sends an event. Message receipts are not supported when there are more than two active participants in the chat. Using the SendEvent API for message receipts when a supervisor is barged-in will result in a conflict exception.</p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the SendEvent service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantSendEventResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`, `AWSConnectParticipantErrorConflict`.
 
 @see AWSConnectParticipantSendEventRequest
 @see AWSConnectParticipantSendEventResponse
 */
- (AWSTask<AWSConnectParticipantSendEventResponse *> *)sendEvent:(AWSConnectParticipantSendEventRequest *)request;

/**
 <note><p>The <code>application/vnd.amazonaws.connect.event.connection.acknowledged</code> ContentType will no longer be supported starting December 31, 2024. This event has been migrated to the <a href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a> API using the <code>ConnectParticipant</code> field.</p></note><p>Sends an event. Message receipts are not supported when there are more than two active participants in the chat. Using the SendEvent API for message receipts when a supervisor is barged-in will result in a conflict exception.</p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the SendEvent service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`, `AWSConnectParticipantErrorConflict`.
 
 @see AWSConnectParticipantSendEventRequest
 @see AWSConnectParticipantSendEventResponse
 */
- (void)sendEvent:(AWSConnectParticipantSendEventRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantSendEventResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Sends a message.</p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the SendMessage service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantSendMessageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantSendMessageRequest
 @see AWSConnectParticipantSendMessageResponse
 */
- (AWSTask<AWSConnectParticipantSendMessageResponse *> *)sendMessage:(AWSConnectParticipantSendMessageRequest *)request;

/**
 <p>Sends a message.</p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the SendMessage service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`.
 
 @see AWSConnectParticipantSendMessageRequest
 @see AWSConnectParticipantSendMessageResponse
 */
- (void)sendMessage:(AWSConnectParticipantSendMessageRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantSendMessageResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Provides a pre-signed Amazon S3 URL in response for uploading the file directly to S3.</p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartAttachmentUpload service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSConnectParticipantStartAttachmentUploadResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`, `AWSConnectParticipantErrorServiceQuotaExceeded`.
 
 @see AWSConnectParticipantStartAttachmentUploadRequest
 @see AWSConnectParticipantStartAttachmentUploadResponse
 */
- (AWSTask<AWSConnectParticipantStartAttachmentUploadResponse *> *)startAttachmentUpload:(AWSConnectParticipantStartAttachmentUploadRequest *)request;

/**
 <p>Provides a pre-signed Amazon S3 URL in response for uploading the file directly to S3.</p><note><p><code>ConnectionToken</code> is used for invoking this API instead of <code>ParticipantToken</code>.</p></note><p>The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4 authentication</a>.</p>
 
 @param request A container for the necessary parameters to execute the StartAttachmentUpload service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSConnectParticipantErrorDomain` domain and the following error code: `AWSConnectParticipantErrorAccessDenied`, `AWSConnectParticipantErrorInternalServer`, `AWSConnectParticipantErrorThrottling`, `AWSConnectParticipantErrorValidation`, `AWSConnectParticipantErrorServiceQuotaExceeded`.
 
 @see AWSConnectParticipantStartAttachmentUploadRequest
 @see AWSConnectParticipantStartAttachmentUploadResponse
 */
- (void)startAttachmentUpload:(AWSConnectParticipantStartAttachmentUploadRequest *)request completionHandler:(void (^ _Nullable)(AWSConnectParticipantStartAttachmentUploadResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
