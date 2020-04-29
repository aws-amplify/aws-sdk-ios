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
#import "AWSwaf-regionalModel.h"
#import "AWSwaf-regionalResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSwaf-regional
FOUNDATION_EXPORT NSString *const AWSwaf-regionalSDKVersion;

/**
 <note><p>This is <b>AWS WAF Classic Regional</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>This is the <i>AWS WAF Regional Classic API Reference</i> for using AWS WAF Classic with the AWS resources, Elastic Load Balancing (ELB) Application Load Balancers and API Gateway APIs. The AWS WAF Classic actions and data types listed in the reference are available for protecting Elastic Load Balancing (ELB) Application Load Balancers and API Gateway APIs. You can use these actions and data types by means of the endpoints listed in <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html#waf_region">AWS Regions and Endpoints</a>. This guide is for developers who need detailed information about the AWS WAF Classic API actions, data types, and errors. For detailed information about AWS WAF Classic features and an overview of how to use the AWS WAF Classic API, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p>
 */
@interface AWSwaf-regional : AWSService

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

     let waf-regional = AWSwaf-regional.default()

 *Objective-C*

     AWSwaf-regional *waf-regional = [AWSwaf-regional defaultwaf-regional];

 @return The default service client.
 */
+ (instancetype)defaultwaf-regional;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSwaf-regional.register(with: configuration!, forKey: "USWest2waf-regional")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:@"USWest2waf-regional"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let waf-regional = AWSwaf-regional(forKey: "USWest2waf-regional")

 *Objective-C*

     AWSwaf-regional *waf-regional = [AWSwaf-regional waf-regionalForKey:@"USWest2waf-regional"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerwaf-regionalWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerwaf-regionalWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSwaf-regional.register(with: configuration!, forKey: "USWest2waf-regional")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSwaf-regional registerwaf-regionalWithConfiguration:configuration forKey:@"USWest2waf-regional"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let waf-regional = AWSwaf-regional(forKey: "USWest2waf-regional")

 *Objective-C*

     AWSwaf-regional *waf-regional = [AWSwaf-regional waf-regionalForKey:@"USWest2waf-regional"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)waf-regionalForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removewaf-regionalForKey:(NSString *)key;

/**
 <note><p>This is <b>AWS WAF Classic Regional</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Associates a web ACL with a resource, either an application load balancer or Amazon API Gateway stage.</p>
 
 @param request A container for the necessary parameters to execute the AssociateWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalAssociateWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFUnavailableEntity`.
 
 @see AWSwaf-regionalAssociateWebACLRequest
 @see AWSwaf-regionalAssociateWebACLResponse
 */
- (AWSTask<AWSwaf-regionalAssociateWebACLResponse *> *)associateWebACL:(AWSwaf-regionalAssociateWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic Regional</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Associates a web ACL with a resource, either an application load balancer or Amazon API Gateway stage.</p>
 
 @param request A container for the necessary parameters to execute the AssociateWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFUnavailableEntity`.
 
 @see AWSwaf-regionalAssociateWebACLRequest
 @see AWSwaf-regionalAssociateWebACLResponse
 */
- (void)associateWebACL:(AWSwaf-regionalAssociateWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalAssociateWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>ByteMatchSet</code>. You then use <a>UpdateByteMatchSet</a> to identify the part of a web request that you want AWS WAF to inspect, such as the values of the <code>User-Agent</code> header or the query string. For example, you can create a <code>ByteMatchSet</code> that matches any requests with <code>User-Agent</code> headers that contain the string <code>BadBot</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateByteMatchSet</code> request.</p></li><li><p>Submit a <code>CreateByteMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateByteMatchSet</code> request.</p></li><li><p>Submit an <a>UpdateByteMatchSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateByteMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateByteMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateByteMatchSetRequest
 @see AWSwaf-regionalCreateByteMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalCreateByteMatchSetResponse *> *)createByteMatchSet:(AWSwaf-regionalCreateByteMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>ByteMatchSet</code>. You then use <a>UpdateByteMatchSet</a> to identify the part of a web request that you want AWS WAF to inspect, such as the values of the <code>User-Agent</code> header or the query string. For example, you can create a <code>ByteMatchSet</code> that matches any requests with <code>User-Agent</code> headers that contain the string <code>BadBot</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateByteMatchSet</code> request.</p></li><li><p>Submit a <code>CreateByteMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateByteMatchSet</code> request.</p></li><li><p>Submit an <a>UpdateByteMatchSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateByteMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateByteMatchSetRequest
 @see AWSwaf-regionalCreateByteMatchSetResponse
 */
- (void)createByteMatchSet:(AWSwaf-regionalCreateByteMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateByteMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>GeoMatchSet</a>, which you use to specify which web requests you want to allow or block based on the country that the requests originate from. For example, if you're receiving a lot of requests from one or more countries and you want to block the requests, you can create an <code>GeoMatchSet</code> that contains those countries and then configure AWS WAF to block the requests. </p><p>To create and configure a <code>GeoMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateGeoMatchSet</code> request.</p></li><li><p>Submit a <code>CreateGeoMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateGeoMatchSet</a> request.</p></li><li><p>Submit an <code>UpdateGeoMatchSetSet</code> request to specify the countries that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateGeoMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateGeoMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateGeoMatchSetRequest
 @see AWSwaf-regionalCreateGeoMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalCreateGeoMatchSetResponse *> *)createGeoMatchSet:(AWSwaf-regionalCreateGeoMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>GeoMatchSet</a>, which you use to specify which web requests you want to allow or block based on the country that the requests originate from. For example, if you're receiving a lot of requests from one or more countries and you want to block the requests, you can create an <code>GeoMatchSet</code> that contains those countries and then configure AWS WAF to block the requests. </p><p>To create and configure a <code>GeoMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateGeoMatchSet</code> request.</p></li><li><p>Submit a <code>CreateGeoMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateGeoMatchSet</a> request.</p></li><li><p>Submit an <code>UpdateGeoMatchSetSet</code> request to specify the countries that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateGeoMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateGeoMatchSetRequest
 @see AWSwaf-regionalCreateGeoMatchSetResponse
 */
- (void)createGeoMatchSet:(AWSwaf-regionalCreateGeoMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateGeoMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>IPSet</a>, which you use to specify which web requests that you want to allow or block based on the IP addresses that the requests originate from. For example, if you're receiving a lot of requests from one or more individual IP addresses or one or more ranges of IP addresses and you want to block the requests, you can create an <code>IPSet</code> that contains those IP addresses and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>IPSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateIPSet</code> request.</p></li><li><p>Submit a <code>CreateIPSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateIPSet</code> request to specify the IP addresses that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateIPSetRequest
 @see AWSwaf-regionalCreateIPSetResponse
 */
- (AWSTask<AWSwaf-regionalCreateIPSetResponse *> *)createIPSet:(AWSwaf-regionalCreateIPSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>IPSet</a>, which you use to specify which web requests that you want to allow or block based on the IP addresses that the requests originate from. For example, if you're receiving a lot of requests from one or more individual IP addresses or one or more ranges of IP addresses and you want to block the requests, you can create an <code>IPSet</code> that contains those IP addresses and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>IPSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateIPSet</code> request.</p></li><li><p>Submit a <code>CreateIPSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateIPSet</code> request to specify the IP addresses that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateIPSetRequest
 @see AWSwaf-regionalCreateIPSetResponse
 */
- (void)createIPSet:(AWSwaf-regionalCreateIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>RateBasedRule</a>. The <code>RateBasedRule</code> contains a <code>RateLimit</code>, which specifies the maximum number of requests that AWS WAF allows from a specified IP address in a five-minute period. The <code>RateBasedRule</code> also contains the <code>IPSet</code> objects, <code>ByteMatchSet</code> objects, and other predicates that identify the requests that you want to count or block if these requests exceed the <code>RateLimit</code>.</p><p>If you add more than one predicate to a <code>RateBasedRule</code>, a request not only must exceed the <code>RateLimit</code>, but it also must match all the conditions to be counted or blocked. For example, suppose you add the following to a <code>RateBasedRule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>You then add the <code>RateBasedRule</code> to a <code>WebACL</code> and specify that you want to block requests that meet the conditions in the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>. Further, requests that match these two conditions must be received at a rate of more than 1,000 requests every five minutes. If both conditions are met and the rate is exceeded, AWS WAF blocks the requests. If the rate drops below 1,000 for a five-minute period, AWS WAF no longer blocks the requests.</p><p>As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a <code>RateBasedRule</code>:</p><ul><li><p>A <code>ByteMatchSet</code> with <code>FieldToMatch</code> of <code>URI</code></p></li><li><p>A <code>PositionalConstraint</code> of <code>STARTS_WITH</code></p></li><li><p>A <code>TargetString</code> of <code>login</code></p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>By adding this <code>RateBasedRule</code> to a <code>WebACL</code>, you could limit requests to your login page without affecting the rest of your site.</p><p>To create and configure a <code>RateBasedRule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the rule. For more information, see <a>CreateByteMatchSet</a>, <a>CreateIPSet</a>, and <a>CreateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRule</code> request.</p></li><li><p>Submit a <code>CreateRateBasedRule</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRateBasedRule</code> request to specify the predicates that you want to include in the rule.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>RateBasedRule</code>. For more information, see <a>CreateWebACL</a>.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRateBasedRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateRateBasedRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`, `AWSwaf-regionalErrorWAFBadRequest`.
 
 @see AWSwaf-regionalCreateRateBasedRuleRequest
 @see AWSwaf-regionalCreateRateBasedRuleResponse
 */
- (AWSTask<AWSwaf-regionalCreateRateBasedRuleResponse *> *)createRateBasedRule:(AWSwaf-regionalCreateRateBasedRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>RateBasedRule</a>. The <code>RateBasedRule</code> contains a <code>RateLimit</code>, which specifies the maximum number of requests that AWS WAF allows from a specified IP address in a five-minute period. The <code>RateBasedRule</code> also contains the <code>IPSet</code> objects, <code>ByteMatchSet</code> objects, and other predicates that identify the requests that you want to count or block if these requests exceed the <code>RateLimit</code>.</p><p>If you add more than one predicate to a <code>RateBasedRule</code>, a request not only must exceed the <code>RateLimit</code>, but it also must match all the conditions to be counted or blocked. For example, suppose you add the following to a <code>RateBasedRule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>You then add the <code>RateBasedRule</code> to a <code>WebACL</code> and specify that you want to block requests that meet the conditions in the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>. Further, requests that match these two conditions must be received at a rate of more than 1,000 requests every five minutes. If both conditions are met and the rate is exceeded, AWS WAF blocks the requests. If the rate drops below 1,000 for a five-minute period, AWS WAF no longer blocks the requests.</p><p>As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a <code>RateBasedRule</code>:</p><ul><li><p>A <code>ByteMatchSet</code> with <code>FieldToMatch</code> of <code>URI</code></p></li><li><p>A <code>PositionalConstraint</code> of <code>STARTS_WITH</code></p></li><li><p>A <code>TargetString</code> of <code>login</code></p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>By adding this <code>RateBasedRule</code> to a <code>WebACL</code>, you could limit requests to your login page without affecting the rest of your site.</p><p>To create and configure a <code>RateBasedRule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the rule. For more information, see <a>CreateByteMatchSet</a>, <a>CreateIPSet</a>, and <a>CreateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRule</code> request.</p></li><li><p>Submit a <code>CreateRateBasedRule</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRateBasedRule</code> request to specify the predicates that you want to include in the rule.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>RateBasedRule</code>. For more information, see <a>CreateWebACL</a>.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRateBasedRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`, `AWSwaf-regionalErrorWAFBadRequest`.
 
 @see AWSwaf-regionalCreateRateBasedRuleRequest
 @see AWSwaf-regionalCreateRateBasedRuleResponse
 */
- (void)createRateBasedRule:(AWSwaf-regionalCreateRateBasedRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateRateBasedRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>RegexMatchSet</a>. You then use <a>UpdateRegexMatchSet</a> to identify the part of a web request that you want AWS WAF to inspect, such as the values of the <code>User-Agent</code> header or the query string. For example, you can create a <code>RegexMatchSet</code> that contains a <code>RegexMatchTuple</code> that looks for any requests with <code>User-Agent</code> headers that match a <code>RegexPatternSet</code> with pattern <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRegexMatchSet</code> request.</p></li><li><p>Submit a <code>CreateRegexMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexMatchSet</code> request.</p></li><li><p>Submit an <a>UpdateRegexMatchSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value, using a <code>RegexPatternSet</code>, that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRegexMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateRegexMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateRegexMatchSetRequest
 @see AWSwaf-regionalCreateRegexMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalCreateRegexMatchSetResponse *> *)createRegexMatchSet:(AWSwaf-regionalCreateRegexMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>RegexMatchSet</a>. You then use <a>UpdateRegexMatchSet</a> to identify the part of a web request that you want AWS WAF to inspect, such as the values of the <code>User-Agent</code> header or the query string. For example, you can create a <code>RegexMatchSet</code> that contains a <code>RegexMatchTuple</code> that looks for any requests with <code>User-Agent</code> headers that match a <code>RegexPatternSet</code> with pattern <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRegexMatchSet</code> request.</p></li><li><p>Submit a <code>CreateRegexMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexMatchSet</code> request.</p></li><li><p>Submit an <a>UpdateRegexMatchSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value, using a <code>RegexPatternSet</code>, that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRegexMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateRegexMatchSetRequest
 @see AWSwaf-regionalCreateRegexMatchSetResponse
 */
- (void)createRegexMatchSet:(AWSwaf-regionalCreateRegexMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateRegexMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>RegexPatternSet</code>. You then use <a>UpdateRegexPatternSet</a> to specify the regular expression (regex) pattern that you want AWS WAF to search for, such as <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexPatternSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRegexPatternSet</code> request.</p></li><li><p>Submit a <code>CreateRegexPatternSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexPatternSet</code> request.</p></li><li><p>Submit an <a>UpdateRegexPatternSet</a> request to specify the string that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRegexPatternSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateRegexPatternSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateRegexPatternSetRequest
 @see AWSwaf-regionalCreateRegexPatternSetResponse
 */
- (AWSTask<AWSwaf-regionalCreateRegexPatternSetResponse *> *)createRegexPatternSet:(AWSwaf-regionalCreateRegexPatternSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>RegexPatternSet</code>. You then use <a>UpdateRegexPatternSet</a> to specify the regular expression (regex) pattern that you want AWS WAF to search for, such as <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexPatternSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRegexPatternSet</code> request.</p></li><li><p>Submit a <code>CreateRegexPatternSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexPatternSet</code> request.</p></li><li><p>Submit an <a>UpdateRegexPatternSet</a> request to specify the string that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRegexPatternSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateRegexPatternSetRequest
 @see AWSwaf-regionalCreateRegexPatternSetResponse
 */
- (void)createRegexPatternSet:(AWSwaf-regionalCreateRegexPatternSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateRegexPatternSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>Rule</code>, which contains the <code>IPSet</code> objects, <code>ByteMatchSet</code> objects, and other predicates that identify the requests that you want to block. If you add more than one predicate to a <code>Rule</code>, a request must match all of the specifications to be allowed or blocked. For example, suppose that you add the following to a <code>Rule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>You then add the <code>Rule</code> to a <code>WebACL</code> and specify that you want to blocks requests that satisfy the <code>Rule</code>. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>.</p><p>To create and configure a <code>Rule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the <code>Rule</code>. For more information, see <a>CreateByteMatchSet</a>, <a>CreateIPSet</a>, and <a>CreateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRule</code> request.</p></li><li><p>Submit a <code>CreateRule</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRule</code> request to specify the predicates that you want to include in the <code>Rule</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>Rule</code>. For more information, see <a>CreateWebACL</a>.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`, `AWSwaf-regionalErrorWAFBadRequest`.
 
 @see AWSwaf-regionalCreateRuleRequest
 @see AWSwaf-regionalCreateRuleResponse
 */
- (AWSTask<AWSwaf-regionalCreateRuleResponse *> *)createRule:(AWSwaf-regionalCreateRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>Rule</code>, which contains the <code>IPSet</code> objects, <code>ByteMatchSet</code> objects, and other predicates that identify the requests that you want to block. If you add more than one predicate to a <code>Rule</code>, a request must match all of the specifications to be allowed or blocked. For example, suppose that you add the following to a <code>Rule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>You then add the <code>Rule</code> to a <code>WebACL</code> and specify that you want to blocks requests that satisfy the <code>Rule</code>. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>.</p><p>To create and configure a <code>Rule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the <code>Rule</code>. For more information, see <a>CreateByteMatchSet</a>, <a>CreateIPSet</a>, and <a>CreateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRule</code> request.</p></li><li><p>Submit a <code>CreateRule</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRule</code> request to specify the predicates that you want to include in the <code>Rule</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>Rule</code>. For more information, see <a>CreateWebACL</a>.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`, `AWSwaf-regionalErrorWAFBadRequest`.
 
 @see AWSwaf-regionalCreateRuleRequest
 @see AWSwaf-regionalCreateRuleResponse
 */
- (void)createRule:(AWSwaf-regionalCreateRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>RuleGroup</code>. A rule group is a collection of predefined rules that you add to a web ACL. You use <a>UpdateRuleGroup</a> to add rules to the rule group.</p><p>Rule groups are subject to the following limits:</p><ul><li><p>Three rule groups per account. You can request an increase to this limit by contacting customer support.</p></li><li><p>One rule group per web ACL.</p></li><li><p>Ten rules per rule group.</p></li></ul><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRuleGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateRuleGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`, `AWSwaf-regionalErrorWAFBadRequest`.
 
 @see AWSwaf-regionalCreateRuleGroupRequest
 @see AWSwaf-regionalCreateRuleGroupResponse
 */
- (AWSTask<AWSwaf-regionalCreateRuleGroupResponse *> *)createRuleGroup:(AWSwaf-regionalCreateRuleGroupRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>RuleGroup</code>. A rule group is a collection of predefined rules that you add to a web ACL. You use <a>UpdateRuleGroup</a> to add rules to the rule group.</p><p>Rule groups are subject to the following limits:</p><ul><li><p>Three rule groups per account. You can request an increase to this limit by contacting customer support.</p></li><li><p>One rule group per web ACL.</p></li><li><p>Ten rules per rule group.</p></li></ul><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRuleGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`, `AWSwaf-regionalErrorWAFBadRequest`.
 
 @see AWSwaf-regionalCreateRuleGroupRequest
 @see AWSwaf-regionalCreateRuleGroupResponse
 */
- (void)createRuleGroup:(AWSwaf-regionalCreateRuleGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateRuleGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>SizeConstraintSet</code>. You then use <a>UpdateSizeConstraintSet</a> to identify the part of a web request that you want AWS WAF to check for length, such as the length of the <code>User-Agent</code> header or the length of the query string. For example, you can create a <code>SizeConstraintSet</code> that matches any requests that have a query string that is longer than 100 bytes. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateSizeConstraintSet</code> request.</p></li><li><p>Submit a <code>CreateSizeConstraintSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateSizeConstraintSet</code> request.</p></li><li><p>Submit an <a>UpdateSizeConstraintSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSizeConstraintSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateSizeConstraintSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateSizeConstraintSetRequest
 @see AWSwaf-regionalCreateSizeConstraintSetResponse
 */
- (AWSTask<AWSwaf-regionalCreateSizeConstraintSetResponse *> *)createSizeConstraintSet:(AWSwaf-regionalCreateSizeConstraintSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>SizeConstraintSet</code>. You then use <a>UpdateSizeConstraintSet</a> to identify the part of a web request that you want AWS WAF to check for length, such as the length of the <code>User-Agent</code> header or the length of the query string. For example, you can create a <code>SizeConstraintSet</code> that matches any requests that have a query string that is longer than 100 bytes. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateSizeConstraintSet</code> request.</p></li><li><p>Submit a <code>CreateSizeConstraintSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateSizeConstraintSet</code> request.</p></li><li><p>Submit an <a>UpdateSizeConstraintSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSizeConstraintSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateSizeConstraintSetRequest
 @see AWSwaf-regionalCreateSizeConstraintSetResponse
 */
- (void)createSizeConstraintSet:(AWSwaf-regionalCreateSizeConstraintSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateSizeConstraintSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>SqlInjectionMatchSet</a>, which you use to allow, block, or count requests that contain snippets of SQL code in a specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.</p><p>To create and configure a <code>SqlInjectionMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateSqlInjectionMatchSet</code> request.</p></li><li><p>Submit a <code>CreateSqlInjectionMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateSqlInjectionMatchSet</a> request.</p></li><li><p>Submit an <a>UpdateSqlInjectionMatchSet</a> request to specify the parts of web requests in which you want to allow, block, or count malicious SQL code.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSqlInjectionMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateSqlInjectionMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateSqlInjectionMatchSetRequest
 @see AWSwaf-regionalCreateSqlInjectionMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalCreateSqlInjectionMatchSetResponse *> *)createSqlInjectionMatchSet:(AWSwaf-regionalCreateSqlInjectionMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>SqlInjectionMatchSet</a>, which you use to allow, block, or count requests that contain snippets of SQL code in a specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.</p><p>To create and configure a <code>SqlInjectionMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateSqlInjectionMatchSet</code> request.</p></li><li><p>Submit a <code>CreateSqlInjectionMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateSqlInjectionMatchSet</a> request.</p></li><li><p>Submit an <a>UpdateSqlInjectionMatchSet</a> request to specify the parts of web requests in which you want to allow, block, or count malicious SQL code.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSqlInjectionMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateSqlInjectionMatchSetRequest
 @see AWSwaf-regionalCreateSqlInjectionMatchSetResponse
 */
- (void)createSqlInjectionMatchSet:(AWSwaf-regionalCreateSqlInjectionMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateSqlInjectionMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>WebACL</code>, which contains the <code>Rules</code> that identify the CloudFront web requests that you want to allow, block, or count. AWS WAF evaluates <code>Rules</code> in order based on the value of <code>Priority</code> for each <code>Rule</code>.</p><p>You also specify a default action, either <code>ALLOW</code> or <code>BLOCK</code>. If a web request doesn't match any of the <code>Rules</code> in a <code>WebACL</code>, AWS WAF responds to the request with the default action. </p><p>To create and configure a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Create and update the <code>ByteMatchSet</code> objects and other predicates that you want to include in <code>Rules</code>. For more information, see <a>CreateByteMatchSet</a>, <a>UpdateByteMatchSet</a>, <a>CreateIPSet</a>, <a>UpdateIPSet</a>, <a>CreateSqlInjectionMatchSet</a>, and <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Create and update the <code>Rules</code> that you want to include in the <code>WebACL</code>. For more information, see <a>CreateRule</a> and <a>UpdateRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateWebACL</code> request.</p></li><li><p>Submit a <code>CreateWebACL</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateWebACL</a> request.</p></li><li><p>Submit an <a>UpdateWebACL</a> request to specify the <code>Rules</code> that you want to include in the <code>WebACL</code>, to specify the default action, and to associate the <code>WebACL</code> with a CloudFront distribution.</p></li></ol><p>For more information about how to use the AWS WAF API, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`, `AWSwaf-regionalErrorWAFBadRequest`.
 
 @see AWSwaf-regionalCreateWebACLRequest
 @see AWSwaf-regionalCreateWebACLResponse
 */
- (AWSTask<AWSwaf-regionalCreateWebACLResponse *> *)createWebACL:(AWSwaf-regionalCreateWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>WebACL</code>, which contains the <code>Rules</code> that identify the CloudFront web requests that you want to allow, block, or count. AWS WAF evaluates <code>Rules</code> in order based on the value of <code>Priority</code> for each <code>Rule</code>.</p><p>You also specify a default action, either <code>ALLOW</code> or <code>BLOCK</code>. If a web request doesn't match any of the <code>Rules</code> in a <code>WebACL</code>, AWS WAF responds to the request with the default action. </p><p>To create and configure a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Create and update the <code>ByteMatchSet</code> objects and other predicates that you want to include in <code>Rules</code>. For more information, see <a>CreateByteMatchSet</a>, <a>UpdateByteMatchSet</a>, <a>CreateIPSet</a>, <a>UpdateIPSet</a>, <a>CreateSqlInjectionMatchSet</a>, and <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Create and update the <code>Rules</code> that you want to include in the <code>WebACL</code>. For more information, see <a>CreateRule</a> and <a>UpdateRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateWebACL</code> request.</p></li><li><p>Submit a <code>CreateWebACL</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateWebACL</a> request.</p></li><li><p>Submit an <a>UpdateWebACL</a> request to specify the <code>Rules</code> that you want to include in the <code>WebACL</code>, to specify the default action, and to associate the <code>WebACL</code> with a CloudFront distribution.</p></li></ol><p>For more information about how to use the AWS WAF API, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`, `AWSwaf-regionalErrorWAFBadRequest`.
 
 @see AWSwaf-regionalCreateWebACLRequest
 @see AWSwaf-regionalCreateWebACLResponse
 */
- (void)createWebACL:(AWSwaf-regionalCreateWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AWS CloudFormation WAFV2 template for the specified web ACL in the specified Amazon S3 bucket. Then, in CloudFormation, you create a stack from the template, to create the web ACL and its resources in AWS WAFV2. Use this to migrate your AWS WAF Classic web ACL to the latest version of AWS WAF.</p><p>This is part of a larger migration procedure for web ACLs from AWS WAF Classic to the latest version of AWS WAF. For the full procedure, including caveats and manual steps to complete the migration and switch over to the new web ACL, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-migrating-from-classic.html">Migrating your AWS WAF Classic resources to AWS WAF</a> in the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateWebACLMigrationStack service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateWebACLMigrationStackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFEntityMigration`.
 
 @see AWSwaf-regionalCreateWebACLMigrationStackRequest
 @see AWSwaf-regionalCreateWebACLMigrationStackResponse
 */
- (AWSTask<AWSwaf-regionalCreateWebACLMigrationStackResponse *> *)createWebACLMigrationStack:(AWSwaf-regionalCreateWebACLMigrationStackRequest *)request;

/**
 <p>Creates an AWS CloudFormation WAFV2 template for the specified web ACL in the specified Amazon S3 bucket. Then, in CloudFormation, you create a stack from the template, to create the web ACL and its resources in AWS WAFV2. Use this to migrate your AWS WAF Classic web ACL to the latest version of AWS WAF.</p><p>This is part of a larger migration procedure for web ACLs from AWS WAF Classic to the latest version of AWS WAF. For the full procedure, including caveats and manual steps to complete the migration and switch over to the new web ACL, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-migrating-from-classic.html">Migrating your AWS WAF Classic resources to AWS WAF</a> in the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateWebACLMigrationStack service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFEntityMigration`.
 
 @see AWSwaf-regionalCreateWebACLMigrationStackRequest
 @see AWSwaf-regionalCreateWebACLMigrationStackResponse
 */
- (void)createWebACLMigrationStack:(AWSwaf-regionalCreateWebACLMigrationStackRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateWebACLMigrationStackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>XssMatchSet</a>, which you use to allow, block, or count requests that contain cross-site scripting attacks in the specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.</p><p>To create and configure an <code>XssMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateXssMatchSet</code> request.</p></li><li><p>Submit a <code>CreateXssMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateXssMatchSet</a> request.</p></li><li><p>Submit an <a>UpdateXssMatchSet</a> request to specify the parts of web requests in which you want to allow, block, or count cross-site scripting attacks.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateXssMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalCreateXssMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateXssMatchSetRequest
 @see AWSwaf-regionalCreateXssMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalCreateXssMatchSetResponse *> *)createXssMatchSet:(AWSwaf-regionalCreateXssMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>XssMatchSet</a>, which you use to allow, block, or count requests that contain cross-site scripting attacks in the specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.</p><p>To create and configure an <code>XssMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateXssMatchSet</code> request.</p></li><li><p>Submit a <code>CreateXssMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateXssMatchSet</a> request.</p></li><li><p>Submit an <a>UpdateXssMatchSet</a> request to specify the parts of web requests in which you want to allow, block, or count cross-site scripting attacks.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateXssMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalCreateXssMatchSetRequest
 @see AWSwaf-regionalCreateXssMatchSetResponse
 */
- (void)createXssMatchSet:(AWSwaf-regionalCreateXssMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalCreateXssMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>ByteMatchSet</a>. You can't delete a <code>ByteMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any <a>ByteMatchTuple</a> objects (any filters).</p><p>If you just want to remove a <code>ByteMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Update the <code>ByteMatchSet</code> to remove filters, if any. For more information, see <a>UpdateByteMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteByteMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteByteMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteByteMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteByteMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteByteMatchSetRequest
 @see AWSwaf-regionalDeleteByteMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalDeleteByteMatchSetResponse *> *)deleteByteMatchSet:(AWSwaf-regionalDeleteByteMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>ByteMatchSet</a>. You can't delete a <code>ByteMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any <a>ByteMatchTuple</a> objects (any filters).</p><p>If you just want to remove a <code>ByteMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Update the <code>ByteMatchSet</code> to remove filters, if any. For more information, see <a>UpdateByteMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteByteMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteByteMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteByteMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteByteMatchSetRequest
 @see AWSwaf-regionalDeleteByteMatchSetResponse
 */
- (void)deleteByteMatchSet:(AWSwaf-regionalDeleteByteMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteByteMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>GeoMatchSet</a>. You can't delete a <code>GeoMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any countries.</p><p>If you just want to remove a <code>GeoMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>GeoMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>GeoMatchSet</code> to remove any countries. For more information, see <a>UpdateGeoMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteGeoMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteGeoMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteGeoMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteGeoMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteGeoMatchSetRequest
 @see AWSwaf-regionalDeleteGeoMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalDeleteGeoMatchSetResponse *> *)deleteGeoMatchSet:(AWSwaf-regionalDeleteGeoMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>GeoMatchSet</a>. You can't delete a <code>GeoMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any countries.</p><p>If you just want to remove a <code>GeoMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>GeoMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>GeoMatchSet</code> to remove any countries. For more information, see <a>UpdateGeoMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteGeoMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteGeoMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteGeoMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteGeoMatchSetRequest
 @see AWSwaf-regionalDeleteGeoMatchSetResponse
 */
- (void)deleteGeoMatchSet:(AWSwaf-regionalDeleteGeoMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteGeoMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an <a>IPSet</a>. You can't delete an <code>IPSet</code> if it's still used in any <code>Rules</code> or if it still includes any IP addresses.</p><p>If you just want to remove an <code>IPSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete an <code>IPSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>IPSet</code> to remove IP address ranges, if any. For more information, see <a>UpdateIPSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteIPSet</code> request.</p></li><li><p>Submit a <code>DeleteIPSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteIPSetRequest
 @see AWSwaf-regionalDeleteIPSetResponse
 */
- (AWSTask<AWSwaf-regionalDeleteIPSetResponse *> *)deleteIPSet:(AWSwaf-regionalDeleteIPSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an <a>IPSet</a>. You can't delete an <code>IPSet</code> if it's still used in any <code>Rules</code> or if it still includes any IP addresses.</p><p>If you just want to remove an <code>IPSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete an <code>IPSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>IPSet</code> to remove IP address ranges, if any. For more information, see <a>UpdateIPSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteIPSet</code> request.</p></li><li><p>Submit a <code>DeleteIPSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteIPSetRequest
 @see AWSwaf-regionalDeleteIPSetResponse
 */
- (void)deleteIPSet:(AWSwaf-regionalDeleteIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes the <a>LoggingConfiguration</a> from the specified web ACL.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoggingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteLoggingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFStaleData`.
 
 @see AWSwaf-regionalDeleteLoggingConfigurationRequest
 @see AWSwaf-regionalDeleteLoggingConfigurationResponse
 */
- (AWSTask<AWSwaf-regionalDeleteLoggingConfigurationResponse *> *)deleteLoggingConfiguration:(AWSwaf-regionalDeleteLoggingConfigurationRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes the <a>LoggingConfiguration</a> from the specified web ACL.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoggingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFStaleData`.
 
 @see AWSwaf-regionalDeleteLoggingConfigurationRequest
 @see AWSwaf-regionalDeleteLoggingConfigurationResponse
 */
- (void)deleteLoggingConfiguration:(AWSwaf-regionalDeleteLoggingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteLoggingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an IAM policy from the specified RuleGroup.</p><p>The user making the request must be the owner of the RuleGroup.</p>
 
 @param request A container for the necessary parameters to execute the DeletePermissionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeletePermissionPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalDeletePermissionPolicyRequest
 @see AWSwaf-regionalDeletePermissionPolicyResponse
 */
- (AWSTask<AWSwaf-regionalDeletePermissionPolicyResponse *> *)deletePermissionPolicy:(AWSwaf-regionalDeletePermissionPolicyRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an IAM policy from the specified RuleGroup.</p><p>The user making the request must be the owner of the RuleGroup.</p>
 
 @param request A container for the necessary parameters to execute the DeletePermissionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalDeletePermissionPolicyRequest
 @see AWSwaf-regionalDeletePermissionPolicyResponse
 */
- (void)deletePermissionPolicy:(AWSwaf-regionalDeletePermissionPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeletePermissionPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RateBasedRule</a>. You can't delete a rule if it's still used in any <code>WebACL</code> objects or if it still includes any predicates, such as <code>ByteMatchSet</code> objects.</p><p>If you just want to remove a rule from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>RateBasedRule</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>RateBasedRule</code> to remove predicates, if any. For more information, see <a>UpdateRateBasedRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRateBasedRule</code> request.</p></li><li><p>Submit a <code>DeleteRateBasedRule</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRateBasedRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteRateBasedRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalDeleteRateBasedRuleRequest
 @see AWSwaf-regionalDeleteRateBasedRuleResponse
 */
- (AWSTask<AWSwaf-regionalDeleteRateBasedRuleResponse *> *)deleteRateBasedRule:(AWSwaf-regionalDeleteRateBasedRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RateBasedRule</a>. You can't delete a rule if it's still used in any <code>WebACL</code> objects or if it still includes any predicates, such as <code>ByteMatchSet</code> objects.</p><p>If you just want to remove a rule from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>RateBasedRule</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>RateBasedRule</code> to remove predicates, if any. For more information, see <a>UpdateRateBasedRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRateBasedRule</code> request.</p></li><li><p>Submit a <code>DeleteRateBasedRule</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRateBasedRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalDeleteRateBasedRuleRequest
 @see AWSwaf-regionalDeleteRateBasedRuleResponse
 */
- (void)deleteRateBasedRule:(AWSwaf-regionalDeleteRateBasedRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteRateBasedRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RegexMatchSet</a>. You can't delete a <code>RegexMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any <code>RegexMatchTuples</code> objects (any filters).</p><p>If you just want to remove a <code>RegexMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Update the <code>RegexMatchSet</code> to remove filters, if any. For more information, see <a>UpdateRegexMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRegexMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteRegexMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRegexMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteRegexMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteRegexMatchSetRequest
 @see AWSwaf-regionalDeleteRegexMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalDeleteRegexMatchSetResponse *> *)deleteRegexMatchSet:(AWSwaf-regionalDeleteRegexMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RegexMatchSet</a>. You can't delete a <code>RegexMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any <code>RegexMatchTuples</code> objects (any filters).</p><p>If you just want to remove a <code>RegexMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Update the <code>RegexMatchSet</code> to remove filters, if any. For more information, see <a>UpdateRegexMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRegexMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteRegexMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRegexMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteRegexMatchSetRequest
 @see AWSwaf-regionalDeleteRegexMatchSetResponse
 */
- (void)deleteRegexMatchSet:(AWSwaf-regionalDeleteRegexMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteRegexMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RegexPatternSet</a>. You can't delete a <code>RegexPatternSet</code> if it's still used in any <code>RegexMatchSet</code> or if the <code>RegexPatternSet</code> is not empty. </p>
 
 @param request A container for the necessary parameters to execute the DeleteRegexPatternSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteRegexPatternSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteRegexPatternSetRequest
 @see AWSwaf-regionalDeleteRegexPatternSetResponse
 */
- (AWSTask<AWSwaf-regionalDeleteRegexPatternSetResponse *> *)deleteRegexPatternSet:(AWSwaf-regionalDeleteRegexPatternSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RegexPatternSet</a>. You can't delete a <code>RegexPatternSet</code> if it's still used in any <code>RegexMatchSet</code> or if the <code>RegexPatternSet</code> is not empty. </p>
 
 @param request A container for the necessary parameters to execute the DeleteRegexPatternSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteRegexPatternSetRequest
 @see AWSwaf-regionalDeleteRegexPatternSetResponse
 */
- (void)deleteRegexPatternSet:(AWSwaf-regionalDeleteRegexPatternSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteRegexPatternSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>Rule</a>. You can't delete a <code>Rule</code> if it's still used in any <code>WebACL</code> objects or if it still includes any predicates, such as <code>ByteMatchSet</code> objects.</p><p>If you just want to remove a <code>Rule</code> from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>Rule</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>Rule</code> to remove predicates, if any. For more information, see <a>UpdateRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRule</code> request.</p></li><li><p>Submit a <code>DeleteRule</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalDeleteRuleRequest
 @see AWSwaf-regionalDeleteRuleResponse
 */
- (AWSTask<AWSwaf-regionalDeleteRuleResponse *> *)deleteRule:(AWSwaf-regionalDeleteRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>Rule</a>. You can't delete a <code>Rule</code> if it's still used in any <code>WebACL</code> objects or if it still includes any predicates, such as <code>ByteMatchSet</code> objects.</p><p>If you just want to remove a <code>Rule</code> from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>Rule</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>Rule</code> to remove predicates, if any. For more information, see <a>UpdateRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRule</code> request.</p></li><li><p>Submit a <code>DeleteRule</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalDeleteRuleRequest
 @see AWSwaf-regionalDeleteRuleResponse
 */
- (void)deleteRule:(AWSwaf-regionalDeleteRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RuleGroup</a>. You can't delete a <code>RuleGroup</code> if it's still used in any <code>WebACL</code> objects or if it still includes any rules.</p><p>If you just want to remove a <code>RuleGroup</code> from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>RuleGroup</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>RuleGroup</code> to remove rules, if any. For more information, see <a>UpdateRuleGroup</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRuleGroup</code> request.</p></li><li><p>Submit a <code>DeleteRuleGroup</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRuleGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteRuleGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalDeleteRuleGroupRequest
 @see AWSwaf-regionalDeleteRuleGroupResponse
 */
- (AWSTask<AWSwaf-regionalDeleteRuleGroupResponse *> *)deleteRuleGroup:(AWSwaf-regionalDeleteRuleGroupRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RuleGroup</a>. You can't delete a <code>RuleGroup</code> if it's still used in any <code>WebACL</code> objects or if it still includes any rules.</p><p>If you just want to remove a <code>RuleGroup</code> from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>RuleGroup</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>RuleGroup</code> to remove rules, if any. For more information, see <a>UpdateRuleGroup</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRuleGroup</code> request.</p></li><li><p>Submit a <code>DeleteRuleGroup</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRuleGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalDeleteRuleGroupRequest
 @see AWSwaf-regionalDeleteRuleGroupResponse
 */
- (void)deleteRuleGroup:(AWSwaf-regionalDeleteRuleGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteRuleGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>SizeConstraintSet</a>. You can't delete a <code>SizeConstraintSet</code> if it's still used in any <code>Rules</code> or if it still includes any <a>SizeConstraint</a> objects (any filters).</p><p>If you just want to remove a <code>SizeConstraintSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Update the <code>SizeConstraintSet</code> to remove filters, if any. For more information, see <a>UpdateSizeConstraintSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteSizeConstraintSet</code> request.</p></li><li><p>Submit a <code>DeleteSizeConstraintSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteSizeConstraintSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteSizeConstraintSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteSizeConstraintSetRequest
 @see AWSwaf-regionalDeleteSizeConstraintSetResponse
 */
- (AWSTask<AWSwaf-regionalDeleteSizeConstraintSetResponse *> *)deleteSizeConstraintSet:(AWSwaf-regionalDeleteSizeConstraintSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>SizeConstraintSet</a>. You can't delete a <code>SizeConstraintSet</code> if it's still used in any <code>Rules</code> or if it still includes any <a>SizeConstraint</a> objects (any filters).</p><p>If you just want to remove a <code>SizeConstraintSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Update the <code>SizeConstraintSet</code> to remove filters, if any. For more information, see <a>UpdateSizeConstraintSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteSizeConstraintSet</code> request.</p></li><li><p>Submit a <code>DeleteSizeConstraintSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteSizeConstraintSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteSizeConstraintSetRequest
 @see AWSwaf-regionalDeleteSizeConstraintSetResponse
 */
- (void)deleteSizeConstraintSet:(AWSwaf-regionalDeleteSizeConstraintSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteSizeConstraintSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>SqlInjectionMatchSet</a>. You can't delete a <code>SqlInjectionMatchSet</code> if it's still used in any <code>Rules</code> or if it still contains any <a>SqlInjectionMatchTuple</a> objects.</p><p>If you just want to remove a <code>SqlInjectionMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>SqlInjectionMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>SqlInjectionMatchSet</code> to remove filters, if any. For more information, see <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteSqlInjectionMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteSqlInjectionMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteSqlInjectionMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteSqlInjectionMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteSqlInjectionMatchSetRequest
 @see AWSwaf-regionalDeleteSqlInjectionMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalDeleteSqlInjectionMatchSetResponse *> *)deleteSqlInjectionMatchSet:(AWSwaf-regionalDeleteSqlInjectionMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>SqlInjectionMatchSet</a>. You can't delete a <code>SqlInjectionMatchSet</code> if it's still used in any <code>Rules</code> or if it still contains any <a>SqlInjectionMatchTuple</a> objects.</p><p>If you just want to remove a <code>SqlInjectionMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>SqlInjectionMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>SqlInjectionMatchSet</code> to remove filters, if any. For more information, see <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteSqlInjectionMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteSqlInjectionMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteSqlInjectionMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteSqlInjectionMatchSetRequest
 @see AWSwaf-regionalDeleteSqlInjectionMatchSetResponse
 */
- (void)deleteSqlInjectionMatchSet:(AWSwaf-regionalDeleteSqlInjectionMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteSqlInjectionMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>WebACL</a>. You can't delete a <code>WebACL</code> if it still contains any <code>Rules</code>.</p><p>To delete a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Update the <code>WebACL</code> to remove <code>Rules</code>, if any. For more information, see <a>UpdateWebACL</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteWebACL</code> request.</p></li><li><p>Submit a <code>DeleteWebACL</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalDeleteWebACLRequest
 @see AWSwaf-regionalDeleteWebACLResponse
 */
- (AWSTask<AWSwaf-regionalDeleteWebACLResponse *> *)deleteWebACL:(AWSwaf-regionalDeleteWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>WebACL</a>. You can't delete a <code>WebACL</code> if it still contains any <code>Rules</code>.</p><p>To delete a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Update the <code>WebACL</code> to remove <code>Rules</code>, if any. For more information, see <a>UpdateWebACL</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteWebACL</code> request.</p></li><li><p>Submit a <code>DeleteWebACL</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFNonEmptyEntity`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalDeleteWebACLRequest
 @see AWSwaf-regionalDeleteWebACLResponse
 */
- (void)deleteWebACL:(AWSwaf-regionalDeleteWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an <a>XssMatchSet</a>. You can't delete an <code>XssMatchSet</code> if it's still used in any <code>Rules</code> or if it still contains any <a>XssMatchTuple</a> objects.</p><p>If you just want to remove an <code>XssMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete an <code>XssMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>XssMatchSet</code> to remove filters, if any. For more information, see <a>UpdateXssMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteXssMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteXssMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteXssMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDeleteXssMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteXssMatchSetRequest
 @see AWSwaf-regionalDeleteXssMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalDeleteXssMatchSetResponse *> *)deleteXssMatchSet:(AWSwaf-regionalDeleteXssMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an <a>XssMatchSet</a>. You can't delete an <code>XssMatchSet</code> if it's still used in any <code>Rules</code> or if it still contains any <a>XssMatchTuple</a> objects.</p><p>If you just want to remove an <code>XssMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete an <code>XssMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>XssMatchSet</code> to remove filters, if any. For more information, see <a>UpdateXssMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteXssMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteXssMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteXssMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonEmptyEntity`.
 
 @see AWSwaf-regionalDeleteXssMatchSetRequest
 @see AWSwaf-regionalDeleteXssMatchSetResponse
 */
- (void)deleteXssMatchSet:(AWSwaf-regionalDeleteXssMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDeleteXssMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic Regional</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Removes a web ACL from the specified resource, either an application load balancer or Amazon API Gateway stage.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalDisassociateWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalDisassociateWebACLRequest
 @see AWSwaf-regionalDisassociateWebACLResponse
 */
- (AWSTask<AWSwaf-regionalDisassociateWebACLResponse *> *)disassociateWebACL:(AWSwaf-regionalDisassociateWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic Regional</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Removes a web ACL from the specified resource, either an application load balancer or Amazon API Gateway stage.</p>
 
 @param request A container for the necessary parameters to execute the DisassociateWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalDisassociateWebACLRequest
 @see AWSwaf-regionalDisassociateWebACLResponse
 */
- (void)disassociateWebACL:(AWSwaf-regionalDisassociateWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalDisassociateWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>ByteMatchSet</a> specified by <code>ByteMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetByteMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetByteMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetByteMatchSetRequest
 @see AWSwaf-regionalGetByteMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalGetByteMatchSetResponse *> *)getByteMatchSet:(AWSwaf-regionalGetByteMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>ByteMatchSet</a> specified by <code>ByteMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetByteMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetByteMatchSetRequest
 @see AWSwaf-regionalGetByteMatchSetResponse
 */
- (void)getByteMatchSet:(AWSwaf-regionalGetByteMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetByteMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>When you want to create, update, or delete AWS WAF objects, get a change token and include the change token in the create, update, or delete request. Change tokens ensure that your application doesn't submit conflicting requests to AWS WAF.</p><p>Each create, update, or delete request must use a unique change token. If your application submits a <code>GetChangeToken</code> request and then submits a second <code>GetChangeToken</code> request before submitting a create, update, or delete request, the second <code>GetChangeToken</code> request returns the same value as the first <code>GetChangeToken</code> request.</p><p>When you use a change token in a create, update, or delete request, the status of the change token changes to <code>PENDING</code>, which indicates that AWS WAF is propagating the change to all AWS WAF servers. Use <code>GetChangeTokenStatus</code> to determine the status of your change token.</p>
 
 @param request A container for the necessary parameters to execute the GetChangeToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetChangeTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`.
 
 @see AWSwaf-regionalGetChangeTokenRequest
 @see AWSwaf-regionalGetChangeTokenResponse
 */
- (AWSTask<AWSwaf-regionalGetChangeTokenResponse *> *)getChangeToken:(AWSwaf-regionalGetChangeTokenRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>When you want to create, update, or delete AWS WAF objects, get a change token and include the change token in the create, update, or delete request. Change tokens ensure that your application doesn't submit conflicting requests to AWS WAF.</p><p>Each create, update, or delete request must use a unique change token. If your application submits a <code>GetChangeToken</code> request and then submits a second <code>GetChangeToken</code> request before submitting a create, update, or delete request, the second <code>GetChangeToken</code> request returns the same value as the first <code>GetChangeToken</code> request.</p><p>When you use a change token in a create, update, or delete request, the status of the change token changes to <code>PENDING</code>, which indicates that AWS WAF is propagating the change to all AWS WAF servers. Use <code>GetChangeTokenStatus</code> to determine the status of your change token.</p>
 
 @param request A container for the necessary parameters to execute the GetChangeToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`.
 
 @see AWSwaf-regionalGetChangeTokenRequest
 @see AWSwaf-regionalGetChangeTokenResponse
 */
- (void)getChangeToken:(AWSwaf-regionalGetChangeTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetChangeTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the status of a <code>ChangeToken</code> that you got by calling <a>GetChangeToken</a>. <code>ChangeTokenStatus</code> is one of the following values:</p><ul><li><p><code>PROVISIONED</code>: You requested the change token by calling <code>GetChangeToken</code>, but you haven't used it yet in a call to create, update, or delete an AWS WAF object.</p></li><li><p><code>PENDING</code>: AWS WAF is propagating the create, update, or delete request to all AWS WAF servers.</p></li><li><p><code>INSYNC</code>: Propagation is complete.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetChangeTokenStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetChangeTokenStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInternalError`.
 
 @see AWSwaf-regionalGetChangeTokenStatusRequest
 @see AWSwaf-regionalGetChangeTokenStatusResponse
 */
- (AWSTask<AWSwaf-regionalGetChangeTokenStatusResponse *> *)getChangeTokenStatus:(AWSwaf-regionalGetChangeTokenStatusRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the status of a <code>ChangeToken</code> that you got by calling <a>GetChangeToken</a>. <code>ChangeTokenStatus</code> is one of the following values:</p><ul><li><p><code>PROVISIONED</code>: You requested the change token by calling <code>GetChangeToken</code>, but you haven't used it yet in a call to create, update, or delete an AWS WAF object.</p></li><li><p><code>PENDING</code>: AWS WAF is propagating the create, update, or delete request to all AWS WAF servers.</p></li><li><p><code>INSYNC</code>: Propagation is complete.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetChangeTokenStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInternalError`.
 
 @see AWSwaf-regionalGetChangeTokenStatusRequest
 @see AWSwaf-regionalGetChangeTokenStatusResponse
 */
- (void)getChangeTokenStatus:(AWSwaf-regionalGetChangeTokenStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetChangeTokenStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>GeoMatchSet</a> that is specified by <code>GeoMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetGeoMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetGeoMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetGeoMatchSetRequest
 @see AWSwaf-regionalGetGeoMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalGetGeoMatchSetResponse *> *)getGeoMatchSet:(AWSwaf-regionalGetGeoMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>GeoMatchSet</a> that is specified by <code>GeoMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetGeoMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetGeoMatchSetRequest
 @see AWSwaf-regionalGetGeoMatchSetResponse
 */
- (void)getGeoMatchSet:(AWSwaf-regionalGetGeoMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetGeoMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>IPSet</a> that is specified by <code>IPSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetIPSetRequest
 @see AWSwaf-regionalGetIPSetResponse
 */
- (AWSTask<AWSwaf-regionalGetIPSetResponse *> *)getIPSet:(AWSwaf-regionalGetIPSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>IPSet</a> that is specified by <code>IPSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetIPSetRequest
 @see AWSwaf-regionalGetIPSetResponse
 */
- (void)getIPSet:(AWSwaf-regionalGetIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>LoggingConfiguration</a> for the specified web ACL.</p>
 
 @param request A container for the necessary parameters to execute the GetLoggingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetLoggingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetLoggingConfigurationRequest
 @see AWSwaf-regionalGetLoggingConfigurationResponse
 */
- (AWSTask<AWSwaf-regionalGetLoggingConfigurationResponse *> *)getLoggingConfiguration:(AWSwaf-regionalGetLoggingConfigurationRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>LoggingConfiguration</a> for the specified web ACL.</p>
 
 @param request A container for the necessary parameters to execute the GetLoggingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetLoggingConfigurationRequest
 @see AWSwaf-regionalGetLoggingConfigurationResponse
 */
- (void)getLoggingConfiguration:(AWSwaf-regionalGetLoggingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetLoggingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the IAM policy attached to the RuleGroup.</p>
 
 @param request A container for the necessary parameters to execute the GetPermissionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetPermissionPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetPermissionPolicyRequest
 @see AWSwaf-regionalGetPermissionPolicyResponse
 */
- (AWSTask<AWSwaf-regionalGetPermissionPolicyResponse *> *)getPermissionPolicy:(AWSwaf-regionalGetPermissionPolicyRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the IAM policy attached to the RuleGroup.</p>
 
 @param request A container for the necessary parameters to execute the GetPermissionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetPermissionPolicyRequest
 @see AWSwaf-regionalGetPermissionPolicyResponse
 */
- (void)getPermissionPolicy:(AWSwaf-regionalGetPermissionPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetPermissionPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RateBasedRule</a> that is specified by the <code>RuleId</code> that you included in the <code>GetRateBasedRule</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetRateBasedRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetRateBasedRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetRateBasedRuleRequest
 @see AWSwaf-regionalGetRateBasedRuleResponse
 */
- (AWSTask<AWSwaf-regionalGetRateBasedRuleResponse *> *)getRateBasedRule:(AWSwaf-regionalGetRateBasedRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RateBasedRule</a> that is specified by the <code>RuleId</code> that you included in the <code>GetRateBasedRule</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetRateBasedRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetRateBasedRuleRequest
 @see AWSwaf-regionalGetRateBasedRuleResponse
 */
- (void)getRateBasedRule:(AWSwaf-regionalGetRateBasedRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetRateBasedRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of IP addresses currently being blocked by the <a>RateBasedRule</a> that is specified by the <code>RuleId</code>. The maximum number of managed keys that will be blocked is 10,000. If more than 10,000 addresses exceed the rate limit, the 10,000 addresses with the highest rates will be blocked.</p>
 
 @param request A container for the necessary parameters to execute the GetRateBasedRuleManagedKeys service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetRateBasedRuleManagedKeysResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidParameter`.
 
 @see AWSwaf-regionalGetRateBasedRuleManagedKeysRequest
 @see AWSwaf-regionalGetRateBasedRuleManagedKeysResponse
 */
- (AWSTask<AWSwaf-regionalGetRateBasedRuleManagedKeysResponse *> *)getRateBasedRuleManagedKeys:(AWSwaf-regionalGetRateBasedRuleManagedKeysRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of IP addresses currently being blocked by the <a>RateBasedRule</a> that is specified by the <code>RuleId</code>. The maximum number of managed keys that will be blocked is 10,000. If more than 10,000 addresses exceed the rate limit, the 10,000 addresses with the highest rates will be blocked.</p>
 
 @param request A container for the necessary parameters to execute the GetRateBasedRuleManagedKeys service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidParameter`.
 
 @see AWSwaf-regionalGetRateBasedRuleManagedKeysRequest
 @see AWSwaf-regionalGetRateBasedRuleManagedKeysResponse
 */
- (void)getRateBasedRuleManagedKeys:(AWSwaf-regionalGetRateBasedRuleManagedKeysRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetRateBasedRuleManagedKeysResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RegexMatchSet</a> specified by <code>RegexMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetRegexMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetRegexMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetRegexMatchSetRequest
 @see AWSwaf-regionalGetRegexMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalGetRegexMatchSetResponse *> *)getRegexMatchSet:(AWSwaf-regionalGetRegexMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RegexMatchSet</a> specified by <code>RegexMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetRegexMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetRegexMatchSetRequest
 @see AWSwaf-regionalGetRegexMatchSetResponse
 */
- (void)getRegexMatchSet:(AWSwaf-regionalGetRegexMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetRegexMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RegexPatternSet</a> specified by <code>RegexPatternSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetRegexPatternSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetRegexPatternSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetRegexPatternSetRequest
 @see AWSwaf-regionalGetRegexPatternSetResponse
 */
- (AWSTask<AWSwaf-regionalGetRegexPatternSetResponse *> *)getRegexPatternSet:(AWSwaf-regionalGetRegexPatternSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RegexPatternSet</a> specified by <code>RegexPatternSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetRegexPatternSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetRegexPatternSetRequest
 @see AWSwaf-regionalGetRegexPatternSetResponse
 */
- (void)getRegexPatternSet:(AWSwaf-regionalGetRegexPatternSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetRegexPatternSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>Rule</a> that is specified by the <code>RuleId</code> that you included in the <code>GetRule</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetRuleRequest
 @see AWSwaf-regionalGetRuleResponse
 */
- (AWSTask<AWSwaf-regionalGetRuleResponse *> *)getRule:(AWSwaf-regionalGetRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>Rule</a> that is specified by the <code>RuleId</code> that you included in the <code>GetRule</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetRuleRequest
 @see AWSwaf-regionalGetRuleResponse
 */
- (void)getRule:(AWSwaf-regionalGetRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RuleGroup</a> that is specified by the <code>RuleGroupId</code> that you included in the <code>GetRuleGroup</code> request.</p><p>To view the rules in a rule group, use <a>ListActivatedRulesInRuleGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetRuleGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetRuleGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetRuleGroupRequest
 @see AWSwaf-regionalGetRuleGroupResponse
 */
- (AWSTask<AWSwaf-regionalGetRuleGroupResponse *> *)getRuleGroup:(AWSwaf-regionalGetRuleGroupRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RuleGroup</a> that is specified by the <code>RuleGroupId</code> that you included in the <code>GetRuleGroup</code> request.</p><p>To view the rules in a rule group, use <a>ListActivatedRulesInRuleGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetRuleGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetRuleGroupRequest
 @see AWSwaf-regionalGetRuleGroupResponse
 */
- (void)getRuleGroup:(AWSwaf-regionalGetRuleGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetRuleGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Gets detailed information about a specified number of requests--a sample--that AWS WAF randomly selects from among the first 5,000 requests that your AWS resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours.</p><p><code>GetSampledRequests</code> returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, <code>GetSampledRequests</code> returns an updated time range. This new time range indicates the actual period during which AWS WAF selected the requests in the sample.</p>
 
 @param request A container for the necessary parameters to execute the GetSampledRequests service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetSampledRequestsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInternalError`.
 
 @see AWSwaf-regionalGetSampledRequestsRequest
 @see AWSwaf-regionalGetSampledRequestsResponse
 */
- (AWSTask<AWSwaf-regionalGetSampledRequestsResponse *> *)getSampledRequests:(AWSwaf-regionalGetSampledRequestsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Gets detailed information about a specified number of requests--a sample--that AWS WAF randomly selects from among the first 5,000 requests that your AWS resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours.</p><p><code>GetSampledRequests</code> returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, <code>GetSampledRequests</code> returns an updated time range. This new time range indicates the actual period during which AWS WAF selected the requests in the sample.</p>
 
 @param request A container for the necessary parameters to execute the GetSampledRequests service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInternalError`.
 
 @see AWSwaf-regionalGetSampledRequestsRequest
 @see AWSwaf-regionalGetSampledRequestsResponse
 */
- (void)getSampledRequests:(AWSwaf-regionalGetSampledRequestsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetSampledRequestsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>SizeConstraintSet</a> specified by <code>SizeConstraintSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSizeConstraintSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetSizeConstraintSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetSizeConstraintSetRequest
 @see AWSwaf-regionalGetSizeConstraintSetResponse
 */
- (AWSTask<AWSwaf-regionalGetSizeConstraintSetResponse *> *)getSizeConstraintSet:(AWSwaf-regionalGetSizeConstraintSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>SizeConstraintSet</a> specified by <code>SizeConstraintSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSizeConstraintSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetSizeConstraintSetRequest
 @see AWSwaf-regionalGetSizeConstraintSetResponse
 */
- (void)getSizeConstraintSet:(AWSwaf-regionalGetSizeConstraintSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetSizeConstraintSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>SqlInjectionMatchSet</a> that is specified by <code>SqlInjectionMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSqlInjectionMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetSqlInjectionMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetSqlInjectionMatchSetRequest
 @see AWSwaf-regionalGetSqlInjectionMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalGetSqlInjectionMatchSetResponse *> *)getSqlInjectionMatchSet:(AWSwaf-regionalGetSqlInjectionMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>SqlInjectionMatchSet</a> that is specified by <code>SqlInjectionMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSqlInjectionMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetSqlInjectionMatchSetRequest
 @see AWSwaf-regionalGetSqlInjectionMatchSetResponse
 */
- (void)getSqlInjectionMatchSet:(AWSwaf-regionalGetSqlInjectionMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetSqlInjectionMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>WebACL</a> that is specified by <code>WebACLId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetWebACLRequest
 @see AWSwaf-regionalGetWebACLResponse
 */
- (AWSTask<AWSwaf-regionalGetWebACLResponse *> *)getWebACL:(AWSwaf-regionalGetWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>WebACL</a> that is specified by <code>WebACLId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetWebACLRequest
 @see AWSwaf-regionalGetWebACLResponse
 */
- (void)getWebACL:(AWSwaf-regionalGetWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic Regional</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the web ACL for the specified resource, either an application load balancer or Amazon API Gateway stage.</p>
 
 @param request A container for the necessary parameters to execute the GetWebACLForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetWebACLForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFUnavailableEntity`.
 
 @see AWSwaf-regionalGetWebACLForResourceRequest
 @see AWSwaf-regionalGetWebACLForResourceResponse
 */
- (AWSTask<AWSwaf-regionalGetWebACLForResourceResponse *> *)getWebACLForResource:(AWSwaf-regionalGetWebACLForResourceRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic Regional</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the web ACL for the specified resource, either an application load balancer or Amazon API Gateway stage.</p>
 
 @param request A container for the necessary parameters to execute the GetWebACLForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFUnavailableEntity`.
 
 @see AWSwaf-regionalGetWebACLForResourceRequest
 @see AWSwaf-regionalGetWebACLForResourceResponse
 */
- (void)getWebACLForResource:(AWSwaf-regionalGetWebACLForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetWebACLForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>XssMatchSet</a> that is specified by <code>XssMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetXssMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalGetXssMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetXssMatchSetRequest
 @see AWSwaf-regionalGetXssMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalGetXssMatchSetResponse *> *)getXssMatchSet:(AWSwaf-regionalGetXssMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>XssMatchSet</a> that is specified by <code>XssMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetXssMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`.
 
 @see AWSwaf-regionalGetXssMatchSetRequest
 @see AWSwaf-regionalGetXssMatchSetResponse
 */
- (void)getXssMatchSet:(AWSwaf-regionalGetXssMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalGetXssMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>ActivatedRule</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListActivatedRulesInRuleGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListActivatedRulesInRuleGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidParameter`.
 
 @see AWSwaf-regionalListActivatedRulesInRuleGroupRequest
 @see AWSwaf-regionalListActivatedRulesInRuleGroupResponse
 */
- (AWSTask<AWSwaf-regionalListActivatedRulesInRuleGroupResponse *> *)listActivatedRulesInRuleGroup:(AWSwaf-regionalListActivatedRulesInRuleGroupRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>ActivatedRule</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListActivatedRulesInRuleGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidParameter`.
 
 @see AWSwaf-regionalListActivatedRulesInRuleGroupRequest
 @see AWSwaf-regionalListActivatedRulesInRuleGroupResponse
 */
- (void)listActivatedRulesInRuleGroup:(AWSwaf-regionalListActivatedRulesInRuleGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListActivatedRulesInRuleGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>ByteMatchSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListByteMatchSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListByteMatchSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListByteMatchSetsRequest
 @see AWSwaf-regionalListByteMatchSetsResponse
 */
- (AWSTask<AWSwaf-regionalListByteMatchSetsResponse *> *)listByteMatchSets:(AWSwaf-regionalListByteMatchSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>ByteMatchSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListByteMatchSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListByteMatchSetsRequest
 @see AWSwaf-regionalListByteMatchSetsResponse
 */
- (void)listByteMatchSets:(AWSwaf-regionalListByteMatchSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListByteMatchSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>GeoMatchSetSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListGeoMatchSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListGeoMatchSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListGeoMatchSetsRequest
 @see AWSwaf-regionalListGeoMatchSetsResponse
 */
- (AWSTask<AWSwaf-regionalListGeoMatchSetsResponse *> *)listGeoMatchSets:(AWSwaf-regionalListGeoMatchSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>GeoMatchSetSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListGeoMatchSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListGeoMatchSetsRequest
 @see AWSwaf-regionalListGeoMatchSetsResponse
 */
- (void)listGeoMatchSets:(AWSwaf-regionalListGeoMatchSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListGeoMatchSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>IPSetSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListIPSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListIPSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListIPSetsRequest
 @see AWSwaf-regionalListIPSetsResponse
 */
- (AWSTask<AWSwaf-regionalListIPSetsResponse *> *)listIPSets:(AWSwaf-regionalListIPSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>IPSetSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListIPSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListIPSetsRequest
 @see AWSwaf-regionalListIPSetsResponse
 */
- (void)listIPSets:(AWSwaf-regionalListIPSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListIPSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>LoggingConfiguration</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListLoggingConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListLoggingConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidParameter`.
 
 @see AWSwaf-regionalListLoggingConfigurationsRequest
 @see AWSwaf-regionalListLoggingConfigurationsResponse
 */
- (AWSTask<AWSwaf-regionalListLoggingConfigurationsResponse *> *)listLoggingConfigurations:(AWSwaf-regionalListLoggingConfigurationsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>LoggingConfiguration</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListLoggingConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidParameter`.
 
 @see AWSwaf-regionalListLoggingConfigurationsRequest
 @see AWSwaf-regionalListLoggingConfigurationsResponse
 */
- (void)listLoggingConfigurations:(AWSwaf-regionalListLoggingConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListLoggingConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRateBasedRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListRateBasedRulesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListRateBasedRulesRequest
 @see AWSwaf-regionalListRateBasedRulesResponse
 */
- (AWSTask<AWSwaf-regionalListRateBasedRulesResponse *> *)listRateBasedRules:(AWSwaf-regionalListRateBasedRulesRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRateBasedRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListRateBasedRulesRequest
 @see AWSwaf-regionalListRateBasedRulesResponse
 */
- (void)listRateBasedRules:(AWSwaf-regionalListRateBasedRulesRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListRateBasedRulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RegexMatchSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRegexMatchSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListRegexMatchSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListRegexMatchSetsRequest
 @see AWSwaf-regionalListRegexMatchSetsResponse
 */
- (AWSTask<AWSwaf-regionalListRegexMatchSetsResponse *> *)listRegexMatchSets:(AWSwaf-regionalListRegexMatchSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RegexMatchSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRegexMatchSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListRegexMatchSetsRequest
 @see AWSwaf-regionalListRegexMatchSetsResponse
 */
- (void)listRegexMatchSets:(AWSwaf-regionalListRegexMatchSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListRegexMatchSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RegexPatternSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRegexPatternSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListRegexPatternSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListRegexPatternSetsRequest
 @see AWSwaf-regionalListRegexPatternSetsResponse
 */
- (AWSTask<AWSwaf-regionalListRegexPatternSetsResponse *> *)listRegexPatternSets:(AWSwaf-regionalListRegexPatternSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RegexPatternSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRegexPatternSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListRegexPatternSetsRequest
 @see AWSwaf-regionalListRegexPatternSetsResponse
 */
- (void)listRegexPatternSets:(AWSwaf-regionalListRegexPatternSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListRegexPatternSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic Regional</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of resources associated with the specified web ACL.</p>
 
 @param request A container for the necessary parameters to execute the ListResourcesForWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListResourcesForWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidParameter`.
 
 @see AWSwaf-regionalListResourcesForWebACLRequest
 @see AWSwaf-regionalListResourcesForWebACLResponse
 */
- (AWSTask<AWSwaf-regionalListResourcesForWebACLResponse *> *)listResourcesForWebACL:(AWSwaf-regionalListResourcesForWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic Regional</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of resources associated with the specified web ACL.</p>
 
 @param request A container for the necessary parameters to execute the ListResourcesForWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidParameter`.
 
 @see AWSwaf-regionalListResourcesForWebACLRequest
 @see AWSwaf-regionalListResourcesForWebACLResponse
 */
- (void)listResourcesForWebACL:(AWSwaf-regionalListResourcesForWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListResourcesForWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleGroup</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRuleGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListRuleGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`.
 
 @see AWSwaf-regionalListRuleGroupsRequest
 @see AWSwaf-regionalListRuleGroupsResponse
 */
- (AWSTask<AWSwaf-regionalListRuleGroupsResponse *> *)listRuleGroups:(AWSwaf-regionalListRuleGroupsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleGroup</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRuleGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`.
 
 @see AWSwaf-regionalListRuleGroupsRequest
 @see AWSwaf-regionalListRuleGroupsResponse
 */
- (void)listRuleGroups:(AWSwaf-regionalListRuleGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListRuleGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListRulesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListRulesRequest
 @see AWSwaf-regionalListRulesResponse
 */
- (AWSTask<AWSwaf-regionalListRulesResponse *> *)listRules:(AWSwaf-regionalListRulesRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListRulesRequest
 @see AWSwaf-regionalListRulesResponse
 */
- (void)listRules:(AWSwaf-regionalListRulesRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListRulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>SizeConstraintSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListSizeConstraintSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListSizeConstraintSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListSizeConstraintSetsRequest
 @see AWSwaf-regionalListSizeConstraintSetsResponse
 */
- (AWSTask<AWSwaf-regionalListSizeConstraintSetsResponse *> *)listSizeConstraintSets:(AWSwaf-regionalListSizeConstraintSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>SizeConstraintSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListSizeConstraintSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListSizeConstraintSetsRequest
 @see AWSwaf-regionalListSizeConstraintSetsResponse
 */
- (void)listSizeConstraintSets:(AWSwaf-regionalListSizeConstraintSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListSizeConstraintSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>SqlInjectionMatchSet</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListSqlInjectionMatchSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListSqlInjectionMatchSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListSqlInjectionMatchSetsRequest
 @see AWSwaf-regionalListSqlInjectionMatchSetsResponse
 */
- (AWSTask<AWSwaf-regionalListSqlInjectionMatchSetsResponse *> *)listSqlInjectionMatchSets:(AWSwaf-regionalListSqlInjectionMatchSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>SqlInjectionMatchSet</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListSqlInjectionMatchSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListSqlInjectionMatchSetsRequest
 @see AWSwaf-regionalListSqlInjectionMatchSetsResponse
 */
- (void)listSqlInjectionMatchSets:(AWSwaf-regionalListSqlInjectionMatchSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListSqlInjectionMatchSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleGroup</a> objects that you are subscribed to.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscribedRuleGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListSubscribedRuleGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInternalError`.
 
 @see AWSwaf-regionalListSubscribedRuleGroupsRequest
 @see AWSwaf-regionalListSubscribedRuleGroupsResponse
 */
- (AWSTask<AWSwaf-regionalListSubscribedRuleGroupsResponse *> *)listSubscribedRuleGroups:(AWSwaf-regionalListSubscribedRuleGroupsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleGroup</a> objects that you are subscribed to.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscribedRuleGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInternalError`.
 
 @see AWSwaf-regionalListSubscribedRuleGroupsRequest
 @see AWSwaf-regionalListSubscribedRuleGroupsResponse
 */
- (void)listSubscribedRuleGroups:(AWSwaf-regionalListSubscribedRuleGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListSubscribedRuleGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Retrieves the tags associated with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.</p><p>Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFBadRequest`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalListTagsForResourceRequest
 @see AWSwaf-regionalListTagsForResourceResponse
 */
- (AWSTask<AWSwaf-regionalListTagsForResourceResponse *> *)listTagsForResource:(AWSwaf-regionalListTagsForResourceRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Retrieves the tags associated with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.</p><p>Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFBadRequest`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalListTagsForResourceRequest
 @see AWSwaf-regionalListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSwaf-regionalListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>WebACLSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListWebACLs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListWebACLsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListWebACLsRequest
 @see AWSwaf-regionalListWebACLsResponse
 */
- (AWSTask<AWSwaf-regionalListWebACLsResponse *> *)listWebACLs:(AWSwaf-regionalListWebACLsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>WebACLSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListWebACLs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListWebACLsRequest
 @see AWSwaf-regionalListWebACLsResponse
 */
- (void)listWebACLs:(AWSwaf-regionalListWebACLsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListWebACLsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>XssMatchSet</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListXssMatchSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalListXssMatchSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListXssMatchSetsRequest
 @see AWSwaf-regionalListXssMatchSetsResponse
 */
- (AWSTask<AWSwaf-regionalListXssMatchSetsResponse *> *)listXssMatchSets:(AWSwaf-regionalListXssMatchSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>XssMatchSet</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListXssMatchSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalListXssMatchSetsRequest
 @see AWSwaf-regionalListXssMatchSetsResponse
 */
- (void)listXssMatchSets:(AWSwaf-regionalListXssMatchSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalListXssMatchSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Associates a <a>LoggingConfiguration</a> with a specified web ACL.</p><p>You can access information about all traffic that AWS WAF inspects using the following steps:</p><ol><li><p>Create an Amazon Kinesis Data Firehose. </p><p>Create the data firehose with a PUT source and in the region that you are operating. However, if you are capturing logs for Amazon CloudFront, always create the firehose in US East (N. Virginia). </p><note><p>Do not create the data firehose using a <code>Kinesis stream</code> as your source.</p></note></li><li><p>Associate that firehose to your web ACL using a <code>PutLoggingConfiguration</code> request.</p></li></ol><p>When you successfully enable logging using a <code>PutLoggingConfiguration</code> request, AWS WAF will create a service linked role with the necessary permissions to write logs to the Amazon Kinesis Data Firehose. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging Web ACL Traffic Information</a> in the <i>AWS WAF Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutLoggingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalPutLoggingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFServiceLinkedRoleError`.
 
 @see AWSwaf-regionalPutLoggingConfigurationRequest
 @see AWSwaf-regionalPutLoggingConfigurationResponse
 */
- (AWSTask<AWSwaf-regionalPutLoggingConfigurationResponse *> *)putLoggingConfiguration:(AWSwaf-regionalPutLoggingConfigurationRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Associates a <a>LoggingConfiguration</a> with a specified web ACL.</p><p>You can access information about all traffic that AWS WAF inspects using the following steps:</p><ol><li><p>Create an Amazon Kinesis Data Firehose. </p><p>Create the data firehose with a PUT source and in the region that you are operating. However, if you are capturing logs for Amazon CloudFront, always create the firehose in US East (N. Virginia). </p><note><p>Do not create the data firehose using a <code>Kinesis stream</code> as your source.</p></note></li><li><p>Associate that firehose to your web ACL using a <code>PutLoggingConfiguration</code> request.</p></li></ol><p>When you successfully enable logging using a <code>PutLoggingConfiguration</code> request, AWS WAF will create a service linked role with the necessary permissions to write logs to the Amazon Kinesis Data Firehose. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging Web ACL Traffic Information</a> in the <i>AWS WAF Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutLoggingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFServiceLinkedRoleError`.
 
 @see AWSwaf-regionalPutLoggingConfigurationRequest
 @see AWSwaf-regionalPutLoggingConfigurationResponse
 */
- (void)putLoggingConfiguration:(AWSwaf-regionalPutLoggingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalPutLoggingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Attaches an IAM policy to the specified resource. The only supported use for this action is to share a RuleGroup across accounts.</p><p>The <code>PutPermissionPolicy</code> is subject to the following restrictions:</p><ul><li><p>You can attach only one policy with each <code>PutPermissionPolicy</code> request.</p></li><li><p>The policy must include an <code>Effect</code>, <code>Action</code> and <code>Principal</code>. </p></li><li><p><code>Effect</code> must specify <code>Allow</code>.</p></li><li><p>The <code>Action</code> in the policy must be <code>waf:UpdateWebACL</code>, <code>waf-regional:UpdateWebACL</code>, <code>waf:GetRuleGroup</code> and <code>waf-regional:GetRuleGroup</code> . Any extra or wildcard actions in the policy will be rejected.</p></li><li><p>The policy cannot include a <code>Resource</code> parameter.</p></li><li><p>The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in the same region.</p></li><li><p>The user making the request must be the owner of the RuleGroup.</p></li><li><p>Your policy must be composed using IAM Policy version 2012-10-17.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html">IAM Policies</a>. </p><p>An example of a valid policy parameter is shown in the Examples section below.</p>
 
 @param request A container for the necessary parameters to execute the PutPermissionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalPutPermissionPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidPermissionPolicy`.
 
 @see AWSwaf-regionalPutPermissionPolicyRequest
 @see AWSwaf-regionalPutPermissionPolicyResponse
 */
- (AWSTask<AWSwaf-regionalPutPermissionPolicyResponse *> *)putPermissionPolicy:(AWSwaf-regionalPutPermissionPolicyRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Attaches an IAM policy to the specified resource. The only supported use for this action is to share a RuleGroup across accounts.</p><p>The <code>PutPermissionPolicy</code> is subject to the following restrictions:</p><ul><li><p>You can attach only one policy with each <code>PutPermissionPolicy</code> request.</p></li><li><p>The policy must include an <code>Effect</code>, <code>Action</code> and <code>Principal</code>. </p></li><li><p><code>Effect</code> must specify <code>Allow</code>.</p></li><li><p>The <code>Action</code> in the policy must be <code>waf:UpdateWebACL</code>, <code>waf-regional:UpdateWebACL</code>, <code>waf:GetRuleGroup</code> and <code>waf-regional:GetRuleGroup</code> . Any extra or wildcard actions in the policy will be rejected.</p></li><li><p>The policy cannot include a <code>Resource</code> parameter.</p></li><li><p>The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in the same region.</p></li><li><p>The user making the request must be the owner of the RuleGroup.</p></li><li><p>Your policy must be composed using IAM Policy version 2012-10-17.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html">IAM Policies</a>. </p><p>An example of a valid policy parameter is shown in the Examples section below.</p>
 
 @param request A container for the necessary parameters to execute the PutPermissionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidPermissionPolicy`.
 
 @see AWSwaf-regionalPutPermissionPolicyRequest
 @see AWSwaf-regionalPutPermissionPolicyResponse
 */
- (void)putPermissionPolicy:(AWSwaf-regionalPutPermissionPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalPutPermissionPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Associates tags with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.</p><p>Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can use this action to tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFBadRequest`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalTagResourceRequest
 @see AWSwaf-regionalTagResourceResponse
 */
- (AWSTask<AWSwaf-regionalTagResourceResponse *> *)tagResource:(AWSwaf-regionalTagResourceRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Associates tags with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.</p><p>Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can use this action to tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFBadRequest`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalTagResourceRequest
 @see AWSwaf-regionalTagResourceResponse
 */
- (void)tagResource:(AWSwaf-regionalTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p/>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFBadRequest`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalUntagResourceRequest
 @see AWSwaf-regionalUntagResourceResponse
 */
- (AWSTask<AWSwaf-regionalUntagResourceResponse *> *)untagResource:(AWSwaf-regionalUntagResourceRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p/>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFBadRequest`, `AWSwaf-regionalErrorWAFTagOperation`, `AWSwaf-regionalErrorWAFTagOperationInternalError`.
 
 @see AWSwaf-regionalUntagResourceRequest
 @see AWSwaf-regionalUntagResourceResponse
 */
- (void)untagResource:(AWSwaf-regionalUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ByteMatchTuple</a> objects (filters) in a <a>ByteMatchSet</a>. For each <code>ByteMatchTuple</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>ByteMatchSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the <code>User-Agent</code> header. </p></li><li><p>The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to look for. For more information, including how you specify the values for the AWS WAF API and the AWS CLI or SDKs, see <code>TargetString</code> in the <a>ByteMatchTuple</a> data type. </p></li><li><p>Where to look, such as at the beginning or the end of a query string.</p></li><li><p>Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.</p></li></ul><p>For example, you can add a <code>ByteMatchSetUpdate</code> object that matches web requests in which <code>User-Agent</code> headers contain the string <code>BadBot</code>. You can then configure AWS WAF to block those requests.</p><p>To create and configure a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Create a <code>ByteMatchSet.</code> For more information, see <a>CreateByteMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateByteMatchSet</code> request.</p></li><li><p>Submit an <code>UpdateByteMatchSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateByteMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateByteMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateByteMatchSetRequest
 @see AWSwaf-regionalUpdateByteMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalUpdateByteMatchSetResponse *> *)updateByteMatchSet:(AWSwaf-regionalUpdateByteMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ByteMatchTuple</a> objects (filters) in a <a>ByteMatchSet</a>. For each <code>ByteMatchTuple</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>ByteMatchSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the <code>User-Agent</code> header. </p></li><li><p>The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to look for. For more information, including how you specify the values for the AWS WAF API and the AWS CLI or SDKs, see <code>TargetString</code> in the <a>ByteMatchTuple</a> data type. </p></li><li><p>Where to look, such as at the beginning or the end of a query string.</p></li><li><p>Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.</p></li></ul><p>For example, you can add a <code>ByteMatchSetUpdate</code> object that matches web requests in which <code>User-Agent</code> headers contain the string <code>BadBot</code>. You can then configure AWS WAF to block those requests.</p><p>To create and configure a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Create a <code>ByteMatchSet.</code> For more information, see <a>CreateByteMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateByteMatchSet</code> request.</p></li><li><p>Submit an <code>UpdateByteMatchSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateByteMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateByteMatchSetRequest
 @see AWSwaf-regionalUpdateByteMatchSetResponse
 */
- (void)updateByteMatchSet:(AWSwaf-regionalUpdateByteMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateByteMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>GeoMatchConstraint</a> objects in an <code>GeoMatchSet</code>. For each <code>GeoMatchConstraint</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change an <code>GeoMatchConstraint</code> object, you delete the existing object and add a new one.</p></li><li><p>The <code>Type</code>. The only valid value for <code>Type</code> is <code>Country</code>.</p></li><li><p>The <code>Value</code>, which is a two character code for the country to add to the <code>GeoMatchConstraint</code> object. Valid codes are listed in <a>GeoMatchConstraint$Value</a>.</p></li></ul><p>To create and configure an <code>GeoMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateGeoMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateGeoMatchSet</a> request.</p></li><li><p>Submit an <code>UpdateGeoMatchSet</code> request to specify the country that you want AWS WAF to watch for.</p></li></ol><p>When you update an <code>GeoMatchSet</code>, you specify the country that you want to add and/or the country that you want to delete. If you want to change a country, you delete the existing country and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGeoMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateGeoMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateGeoMatchSetRequest
 @see AWSwaf-regionalUpdateGeoMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalUpdateGeoMatchSetResponse *> *)updateGeoMatchSet:(AWSwaf-regionalUpdateGeoMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>GeoMatchConstraint</a> objects in an <code>GeoMatchSet</code>. For each <code>GeoMatchConstraint</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change an <code>GeoMatchConstraint</code> object, you delete the existing object and add a new one.</p></li><li><p>The <code>Type</code>. The only valid value for <code>Type</code> is <code>Country</code>.</p></li><li><p>The <code>Value</code>, which is a two character code for the country to add to the <code>GeoMatchConstraint</code> object. Valid codes are listed in <a>GeoMatchConstraint$Value</a>.</p></li></ul><p>To create and configure an <code>GeoMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateGeoMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateGeoMatchSet</a> request.</p></li><li><p>Submit an <code>UpdateGeoMatchSet</code> request to specify the country that you want AWS WAF to watch for.</p></li></ol><p>When you update an <code>GeoMatchSet</code>, you specify the country that you want to add and/or the country that you want to delete. If you want to change a country, you delete the existing country and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGeoMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateGeoMatchSetRequest
 @see AWSwaf-regionalUpdateGeoMatchSetResponse
 */
- (void)updateGeoMatchSet:(AWSwaf-regionalUpdateGeoMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateGeoMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>IPSetDescriptor</a> objects in an <code>IPSet</code>. For each <code>IPSetDescriptor</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change an <code>IPSetDescriptor</code> object, you delete the existing object and add a new one.</p></li><li><p>The IP address version, <code>IPv4</code> or <code>IPv6</code>. </p></li><li><p>The IP address in CIDR notation, for example, <code>192.0.2.0/24</code> (for the range of IP addresses from <code>192.0.2.0</code> to <code>192.0.2.255</code>) or <code>192.0.2.44/32</code> (for the individual IP address <code>192.0.2.44</code>). </p></li></ul><p>AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128. For more information about CIDR notation, see the Wikipedia entry <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless Inter-Domain Routing</a>.</p><p>IPv6 addresses can be represented using any of the following formats:</p><ul><li><p>1111:0000:0000:0000:0000:0000:0000:0111/128</p></li><li><p>1111:0:0:0:0:0:0:0111/128</p></li><li><p>1111::0111/128</p></li><li><p>1111::111/128</p></li></ul><p>You use an <code>IPSet</code> to specify which web requests you want to allow or block based on the IP addresses that the requests originated from. For example, if you're receiving a lot of requests from one or a small number of IP addresses and you want to block the requests, you can create an <code>IPSet</code> that specifies those IP addresses, and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>IPSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateIPSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateIPSet</code> request to specify the IP addresses that you want AWS WAF to watch for.</p></li></ol><p>When you update an <code>IPSet</code>, you specify the IP addresses that you want to add and/or the IP addresses that you want to delete. If you want to change an IP address, you delete the existing IP address and add the new one.</p><p>You can insert a maximum of 1000 addresses in a single request.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateIPSetRequest
 @see AWSwaf-regionalUpdateIPSetResponse
 */
- (AWSTask<AWSwaf-regionalUpdateIPSetResponse *> *)updateIPSet:(AWSwaf-regionalUpdateIPSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>IPSetDescriptor</a> objects in an <code>IPSet</code>. For each <code>IPSetDescriptor</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change an <code>IPSetDescriptor</code> object, you delete the existing object and add a new one.</p></li><li><p>The IP address version, <code>IPv4</code> or <code>IPv6</code>. </p></li><li><p>The IP address in CIDR notation, for example, <code>192.0.2.0/24</code> (for the range of IP addresses from <code>192.0.2.0</code> to <code>192.0.2.255</code>) or <code>192.0.2.44/32</code> (for the individual IP address <code>192.0.2.44</code>). </p></li></ul><p>AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128. For more information about CIDR notation, see the Wikipedia entry <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless Inter-Domain Routing</a>.</p><p>IPv6 addresses can be represented using any of the following formats:</p><ul><li><p>1111:0000:0000:0000:0000:0000:0000:0111/128</p></li><li><p>1111:0:0:0:0:0:0:0111/128</p></li><li><p>1111::0111/128</p></li><li><p>1111::111/128</p></li></ul><p>You use an <code>IPSet</code> to specify which web requests you want to allow or block based on the IP addresses that the requests originated from. For example, if you're receiving a lot of requests from one or a small number of IP addresses and you want to block the requests, you can create an <code>IPSet</code> that specifies those IP addresses, and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>IPSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateIPSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateIPSet</code> request to specify the IP addresses that you want AWS WAF to watch for.</p></li></ol><p>When you update an <code>IPSet</code>, you specify the IP addresses that you want to add and/or the IP addresses that you want to delete. If you want to change an IP address, you delete the existing IP address and add the new one.</p><p>You can insert a maximum of 1000 addresses in a single request.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateIPSetRequest
 @see AWSwaf-regionalUpdateIPSetResponse
 */
- (void)updateIPSet:(AWSwaf-regionalUpdateIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>Predicate</a> objects in a rule and updates the <code>RateLimit</code> in the rule. </p><p>Each <code>Predicate</code> object identifies a predicate, such as a <a>ByteMatchSet</a> or an <a>IPSet</a>, that specifies the web requests that you want to block or count. The <code>RateLimit</code> specifies the number of requests every five minutes that triggers the rule.</p><p>If you add more than one predicate to a <code>RateBasedRule</code>, a request must match all the predicates and exceed the <code>RateLimit</code> to be counted or blocked. For example, suppose you add the following to a <code>RateBasedRule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>You then add the <code>RateBasedRule</code> to a <code>WebACL</code> and specify that you want to block requests that satisfy the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>. Further, requests that match these two conditions much be received at a rate of more than 1,000 every five minutes. If the rate drops below this limit, AWS WAF no longer blocks the requests.</p><p>As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a <code>RateBasedRule</code>:</p><ul><li><p>A <code>ByteMatchSet</code> with <code>FieldToMatch</code> of <code>URI</code></p></li><li><p>A <code>PositionalConstraint</code> of <code>STARTS_WITH</code></p></li><li><p>A <code>TargetString</code> of <code>login</code></p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>By adding this <code>RateBasedRule</code> to a <code>WebACL</code>, you could limit requests to your login page without affecting the rest of your site.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRateBasedRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateRateBasedRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateRateBasedRuleRequest
 @see AWSwaf-regionalUpdateRateBasedRuleResponse
 */
- (AWSTask<AWSwaf-regionalUpdateRateBasedRuleResponse *> *)updateRateBasedRule:(AWSwaf-regionalUpdateRateBasedRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>Predicate</a> objects in a rule and updates the <code>RateLimit</code> in the rule. </p><p>Each <code>Predicate</code> object identifies a predicate, such as a <a>ByteMatchSet</a> or an <a>IPSet</a>, that specifies the web requests that you want to block or count. The <code>RateLimit</code> specifies the number of requests every five minutes that triggers the rule.</p><p>If you add more than one predicate to a <code>RateBasedRule</code>, a request must match all the predicates and exceed the <code>RateLimit</code> to be counted or blocked. For example, suppose you add the following to a <code>RateBasedRule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>You then add the <code>RateBasedRule</code> to a <code>WebACL</code> and specify that you want to block requests that satisfy the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>. Further, requests that match these two conditions much be received at a rate of more than 1,000 every five minutes. If the rate drops below this limit, AWS WAF no longer blocks the requests.</p><p>As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a <code>RateBasedRule</code>:</p><ul><li><p>A <code>ByteMatchSet</code> with <code>FieldToMatch</code> of <code>URI</code></p></li><li><p>A <code>PositionalConstraint</code> of <code>STARTS_WITH</code></p></li><li><p>A <code>TargetString</code> of <code>login</code></p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>By adding this <code>RateBasedRule</code> to a <code>WebACL</code>, you could limit requests to your login page without affecting the rest of your site.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRateBasedRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateRateBasedRuleRequest
 @see AWSwaf-regionalUpdateRateBasedRuleResponse
 */
- (void)updateRateBasedRule:(AWSwaf-regionalUpdateRateBasedRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateRateBasedRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>RegexMatchTuple</a> objects (filters) in a <a>RegexMatchSet</a>. For each <code>RegexMatchSetUpdate</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>RegexMatchSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to inspectupdate, such as a query string or the value of the <code>User-Agent</code> header. </p></li><li><p>The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see <a>RegexPatternSet</a>. </p></li><li><p>Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.</p></li></ul><p> For example, you can create a <code>RegexPatternSet</code> that matches any requests with <code>User-Agent</code> headers that contain the string <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Create a <code>RegexMatchSet.</code> For more information, see <a>CreateRegexMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexMatchSet</code> request.</p></li><li><p>Submit an <code>UpdateRegexMatchSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the identifier of the <code>RegexPatternSet</code> that contain the regular expression patters you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegexMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateRegexMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalUpdateRegexMatchSetRequest
 @see AWSwaf-regionalUpdateRegexMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalUpdateRegexMatchSetResponse *> *)updateRegexMatchSet:(AWSwaf-regionalUpdateRegexMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>RegexMatchTuple</a> objects (filters) in a <a>RegexMatchSet</a>. For each <code>RegexMatchSetUpdate</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>RegexMatchSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to inspectupdate, such as a query string or the value of the <code>User-Agent</code> header. </p></li><li><p>The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see <a>RegexPatternSet</a>. </p></li><li><p>Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.</p></li></ul><p> For example, you can create a <code>RegexPatternSet</code> that matches any requests with <code>User-Agent</code> headers that contain the string <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Create a <code>RegexMatchSet.</code> For more information, see <a>CreateRegexMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexMatchSet</code> request.</p></li><li><p>Submit an <code>UpdateRegexMatchSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the identifier of the <code>RegexPatternSet</code> that contain the regular expression patters you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegexMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFDisallowedName`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidAccount`.
 
 @see AWSwaf-regionalUpdateRegexMatchSetRequest
 @see AWSwaf-regionalUpdateRegexMatchSetResponse
 */
- (void)updateRegexMatchSet:(AWSwaf-regionalUpdateRegexMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateRegexMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <code>RegexPatternString</code> objects in a <a>RegexPatternSet</a>. For each <code>RegexPatternString</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the <code>RegexPatternString</code>.</p></li><li><p>The regular expression pattern that you want to insert or delete. For more information, see <a>RegexPatternSet</a>. </p></li></ul><p> For example, you can create a <code>RegexPatternString</code> such as <code>B[a@]dB[o0]t</code>. AWS WAF will match this <code>RegexPatternString</code> to:</p><ul><li><p>BadBot</p></li><li><p>BadB0t</p></li><li><p>B@dBot</p></li><li><p>B@dB0t</p></li></ul><p>To create and configure a <code>RegexPatternSet</code>, perform the following steps:</p><ol><li><p>Create a <code>RegexPatternSet.</code> For more information, see <a>CreateRegexPatternSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexPatternSet</code> request.</p></li><li><p>Submit an <code>UpdateRegexPatternSet</code> request to specify the regular expression pattern that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegexPatternSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateRegexPatternSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidRegexPattern`.
 
 @see AWSwaf-regionalUpdateRegexPatternSetRequest
 @see AWSwaf-regionalUpdateRegexPatternSetResponse
 */
- (AWSTask<AWSwaf-regionalUpdateRegexPatternSetResponse *> *)updateRegexPatternSet:(AWSwaf-regionalUpdateRegexPatternSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <code>RegexPatternString</code> objects in a <a>RegexPatternSet</a>. For each <code>RegexPatternString</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the <code>RegexPatternString</code>.</p></li><li><p>The regular expression pattern that you want to insert or delete. For more information, see <a>RegexPatternSet</a>. </p></li></ul><p> For example, you can create a <code>RegexPatternString</code> such as <code>B[a@]dB[o0]t</code>. AWS WAF will match this <code>RegexPatternString</code> to:</p><ul><li><p>BadBot</p></li><li><p>BadB0t</p></li><li><p>B@dBot</p></li><li><p>B@dB0t</p></li></ul><p>To create and configure a <code>RegexPatternSet</code>, perform the following steps:</p><ol><li><p>Create a <code>RegexPatternSet.</code> For more information, see <a>CreateRegexPatternSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexPatternSet</code> request.</p></li><li><p>Submit an <code>UpdateRegexPatternSet</code> request to specify the regular expression pattern that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegexPatternSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidRegexPattern`.
 
 @see AWSwaf-regionalUpdateRegexPatternSetRequest
 @see AWSwaf-regionalUpdateRegexPatternSetResponse
 */
- (void)updateRegexPatternSet:(AWSwaf-regionalUpdateRegexPatternSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateRegexPatternSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>Predicate</a> objects in a <code>Rule</code>. Each <code>Predicate</code> object identifies a predicate, such as a <a>ByteMatchSet</a> or an <a>IPSet</a>, that specifies the web requests that you want to allow, block, or count. If you add more than one predicate to a <code>Rule</code>, a request must match all of the specifications to be allowed, blocked, or counted. For example, suppose that you add the following to a <code>Rule</code>: </p><ul><li><p>A <code>ByteMatchSet</code> that matches the value <code>BadBot</code> in the <code>User-Agent</code> header</p></li><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44</code></p></li></ul><p>You then add the <code>Rule</code> to a <code>WebACL</code> and specify that you want to block requests that satisfy the <code>Rule</code>. For a request to be blocked, the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code><i>and</i> the request must originate from the IP address 192.0.2.44.</p><p>To create and configure a <code>Rule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the <code>Rule</code>.</p></li><li><p>Create the <code>Rule</code>. See <a>CreateRule</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRule</code> request to add predicates to the <code>Rule</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>Rule</code>. See <a>CreateWebACL</a>.</p></li></ol><p>If you want to replace one <code>ByteMatchSet</code> or <code>IPSet</code> with another, you delete the existing one and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateRuleRequest
 @see AWSwaf-regionalUpdateRuleResponse
 */
- (AWSTask<AWSwaf-regionalUpdateRuleResponse *> *)updateRule:(AWSwaf-regionalUpdateRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>Predicate</a> objects in a <code>Rule</code>. Each <code>Predicate</code> object identifies a predicate, such as a <a>ByteMatchSet</a> or an <a>IPSet</a>, that specifies the web requests that you want to allow, block, or count. If you add more than one predicate to a <code>Rule</code>, a request must match all of the specifications to be allowed, blocked, or counted. For example, suppose that you add the following to a <code>Rule</code>: </p><ul><li><p>A <code>ByteMatchSet</code> that matches the value <code>BadBot</code> in the <code>User-Agent</code> header</p></li><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44</code></p></li></ul><p>You then add the <code>Rule</code> to a <code>WebACL</code> and specify that you want to block requests that satisfy the <code>Rule</code>. For a request to be blocked, the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code><i>and</i> the request must originate from the IP address 192.0.2.44.</p><p>To create and configure a <code>Rule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the <code>Rule</code>.</p></li><li><p>Create the <code>Rule</code>. See <a>CreateRule</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRule</code> request to add predicates to the <code>Rule</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>Rule</code>. See <a>CreateWebACL</a>.</p></li></ol><p>If you want to replace one <code>ByteMatchSet</code> or <code>IPSet</code> with another, you delete the existing one and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateRuleRequest
 @see AWSwaf-regionalUpdateRuleResponse
 */
- (void)updateRule:(AWSwaf-regionalUpdateRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ActivatedRule</a> objects in a <code>RuleGroup</code>.</p><p>You can only insert <code>REGULAR</code> rules into a rule group.</p><p>You can have a maximum of ten rules per rule group.</p><p>To create and configure a <code>RuleGroup</code>, perform the following steps:</p><ol><li><p>Create and update the <code>Rules</code> that you want to include in the <code>RuleGroup</code>. See <a>CreateRule</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRuleGroup</a> request.</p></li><li><p>Submit an <code>UpdateRuleGroup</code> request to add <code>Rules</code> to the <code>RuleGroup</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>RuleGroup</code>. See <a>CreateWebACL</a>.</p></li></ol><p>If you want to replace one <code>Rule</code> with another, you delete the existing one and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRuleGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateRuleGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFInvalidParameter`.
 
 @see AWSwaf-regionalUpdateRuleGroupRequest
 @see AWSwaf-regionalUpdateRuleGroupResponse
 */
- (AWSTask<AWSwaf-regionalUpdateRuleGroupResponse *> *)updateRuleGroup:(AWSwaf-regionalUpdateRuleGroupRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ActivatedRule</a> objects in a <code>RuleGroup</code>.</p><p>You can only insert <code>REGULAR</code> rules into a rule group.</p><p>You can have a maximum of ten rules per rule group.</p><p>To create and configure a <code>RuleGroup</code>, perform the following steps:</p><ol><li><p>Create and update the <code>Rules</code> that you want to include in the <code>RuleGroup</code>. See <a>CreateRule</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRuleGroup</a> request.</p></li><li><p>Submit an <code>UpdateRuleGroup</code> request to add <code>Rules</code> to the <code>RuleGroup</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>RuleGroup</code>. See <a>CreateWebACL</a>.</p></li></ol><p>If you want to replace one <code>Rule</code> with another, you delete the existing one and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRuleGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFInvalidParameter`.
 
 @see AWSwaf-regionalUpdateRuleGroupRequest
 @see AWSwaf-regionalUpdateRuleGroupResponse
 */
- (void)updateRuleGroup:(AWSwaf-regionalUpdateRuleGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateRuleGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>SizeConstraint</a> objects (filters) in a <a>SizeConstraintSet</a>. For each <code>SizeConstraint</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>SizeConstraintSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to evaluate, such as the length of a query string or the length of the <code>User-Agent</code> header.</p></li><li><p>Whether to perform any transformations on the request, such as converting it to lowercase, before checking its length. Note that transformations of the request body are not supported because the AWS resource forwards only the first <code>8192</code> bytes of your request to AWS WAF.</p><p>You can only specify a single type of TextTransformation.</p></li><li><p>A <code>ComparisonOperator</code> used for evaluating the selected part of the request against the specified <code>Size</code>, such as equals, greater than, less than, and so on.</p></li><li><p>The length, in bytes, that you want AWS WAF to watch for in selected part of the request. The length is computed after applying the transformation.</p></li></ul><p>For example, you can add a <code>SizeConstraintSetUpdate</code> object that matches web requests in which the length of the <code>User-Agent</code> header is greater than 100 bytes. You can then configure AWS WAF to block those requests.</p><p>To create and configure a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Create a <code>SizeConstraintSet.</code> For more information, see <a>CreateSizeConstraintSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateSizeConstraintSet</code> request.</p></li><li><p>Submit an <code>UpdateSizeConstraintSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSizeConstraintSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateSizeConstraintSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateSizeConstraintSetRequest
 @see AWSwaf-regionalUpdateSizeConstraintSetResponse
 */
- (AWSTask<AWSwaf-regionalUpdateSizeConstraintSetResponse *> *)updateSizeConstraintSet:(AWSwaf-regionalUpdateSizeConstraintSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>SizeConstraint</a> objects (filters) in a <a>SizeConstraintSet</a>. For each <code>SizeConstraint</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>SizeConstraintSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to evaluate, such as the length of a query string or the length of the <code>User-Agent</code> header.</p></li><li><p>Whether to perform any transformations on the request, such as converting it to lowercase, before checking its length. Note that transformations of the request body are not supported because the AWS resource forwards only the first <code>8192</code> bytes of your request to AWS WAF.</p><p>You can only specify a single type of TextTransformation.</p></li><li><p>A <code>ComparisonOperator</code> used for evaluating the selected part of the request against the specified <code>Size</code>, such as equals, greater than, less than, and so on.</p></li><li><p>The length, in bytes, that you want AWS WAF to watch for in selected part of the request. The length is computed after applying the transformation.</p></li></ul><p>For example, you can add a <code>SizeConstraintSetUpdate</code> object that matches web requests in which the length of the <code>User-Agent</code> header is greater than 100 bytes. You can then configure AWS WAF to block those requests.</p><p>To create and configure a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Create a <code>SizeConstraintSet.</code> For more information, see <a>CreateSizeConstraintSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateSizeConstraintSet</code> request.</p></li><li><p>Submit an <code>UpdateSizeConstraintSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSizeConstraintSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateSizeConstraintSetRequest
 @see AWSwaf-regionalUpdateSizeConstraintSetResponse
 */
- (void)updateSizeConstraintSet:(AWSwaf-regionalUpdateSizeConstraintSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateSizeConstraintSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>SqlInjectionMatchTuple</a> objects (filters) in a <a>SqlInjectionMatchSet</a>. For each <code>SqlInjectionMatchTuple</code> object, you specify the following values:</p><ul><li><p><code>Action</code>: Whether to insert the object into or delete the object from the array. To change a <code>SqlInjectionMatchTuple</code>, you delete the existing object and add a new one.</p></li><li><p><code>FieldToMatch</code>: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.</p></li><li><p><code>TextTransformation</code>: Which text transformation, if any, to perform on the web request before inspecting the request for snippets of malicious SQL code.</p><p>You can only specify a single type of TextTransformation.</p></li></ul><p>You use <code>SqlInjectionMatchSet</code> objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain snippets of SQL code in the query string and you want to block the requests, you can create a <code>SqlInjectionMatchSet</code> with the applicable settings, and then configure AWS WAF to block the requests. </p><p>To create and configure a <code>SqlInjectionMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateSqlInjectionMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateSqlInjectionMatchSet</code> request to specify the parts of web requests that you want AWS WAF to inspect for snippets of SQL code.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSqlInjectionMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateSqlInjectionMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateSqlInjectionMatchSetRequest
 @see AWSwaf-regionalUpdateSqlInjectionMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalUpdateSqlInjectionMatchSetResponse *> *)updateSqlInjectionMatchSet:(AWSwaf-regionalUpdateSqlInjectionMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>SqlInjectionMatchTuple</a> objects (filters) in a <a>SqlInjectionMatchSet</a>. For each <code>SqlInjectionMatchTuple</code> object, you specify the following values:</p><ul><li><p><code>Action</code>: Whether to insert the object into or delete the object from the array. To change a <code>SqlInjectionMatchTuple</code>, you delete the existing object and add a new one.</p></li><li><p><code>FieldToMatch</code>: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.</p></li><li><p><code>TextTransformation</code>: Which text transformation, if any, to perform on the web request before inspecting the request for snippets of malicious SQL code.</p><p>You can only specify a single type of TextTransformation.</p></li></ul><p>You use <code>SqlInjectionMatchSet</code> objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain snippets of SQL code in the query string and you want to block the requests, you can create a <code>SqlInjectionMatchSet</code> with the applicable settings, and then configure AWS WAF to block the requests. </p><p>To create and configure a <code>SqlInjectionMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateSqlInjectionMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateSqlInjectionMatchSet</code> request to specify the parts of web requests that you want AWS WAF to inspect for snippets of SQL code.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSqlInjectionMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateSqlInjectionMatchSetRequest
 @see AWSwaf-regionalUpdateSqlInjectionMatchSetResponse
 */
- (void)updateSqlInjectionMatchSet:(AWSwaf-regionalUpdateSqlInjectionMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateSqlInjectionMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ActivatedRule</a> objects in a <code>WebACL</code>. Each <code>Rule</code> identifies web requests that you want to allow, block, or count. When you update a <code>WebACL</code>, you specify the following values:</p><ul><li><p>A default action for the <code>WebACL</code>, either <code>ALLOW</code> or <code>BLOCK</code>. AWS WAF performs the default action if a request doesn't match the criteria in any of the <code>Rules</code> in a <code>WebACL</code>.</p></li><li><p>The <code>Rules</code> that you want to add or delete. If you want to replace one <code>Rule</code> with another, you delete the existing <code>Rule</code> and add the new one.</p></li><li><p>For each <code>Rule</code>, whether you want AWS WAF to allow requests, block requests, or count requests that match the conditions in the <code>Rule</code>.</p></li><li><p>The order in which you want AWS WAF to evaluate the <code>Rules</code> in a <code>WebACL</code>. If you add more than one <code>Rule</code> to a <code>WebACL</code>, AWS WAF evaluates each request against the <code>Rules</code> in order based on the value of <code>Priority</code>. (The <code>Rule</code> that has the lowest value for <code>Priority</code> is evaluated first.) When a web request matches all the predicates (such as <code>ByteMatchSets</code> and <code>IPSets</code>) in a <code>Rule</code>, AWS WAF immediately takes the corresponding action, allow or block, and doesn't evaluate the request against the remaining <code>Rules</code> in the <code>WebACL</code>, if any. </p></li></ul><p>To create and configure a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in <code>Rules</code>. For more information, see <a>CreateByteMatchSet</a>, <a>UpdateByteMatchSet</a>, <a>CreateIPSet</a>, <a>UpdateIPSet</a>, <a>CreateSqlInjectionMatchSet</a>, and <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Create and update the <code>Rules</code> that you want to include in the <code>WebACL</code>. For more information, see <a>CreateRule</a> and <a>UpdateRule</a>.</p></li><li><p>Create a <code>WebACL</code>. See <a>CreateWebACL</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateWebACL</a> request.</p></li><li><p>Submit an <code>UpdateWebACL</code> request to specify the <code>Rules</code> that you want to include in the <code>WebACL</code>, to specify the default action, and to associate the <code>WebACL</code> with a CloudFront distribution. </p><p>The <code>ActivatedRule</code> can be a rule group. If you specify a rule group as your <code>ActivatedRule</code> , you can exclude specific rules from that rule group.</p><p>If you already have a rule group associated with a web ACL and want to submit an <code>UpdateWebACL</code> request to exclude certain rules from that rule group, you must first remove the rule group from the web ACL, the re-insert it again, specifying the excluded rules. For details, see <a>ActivatedRule$ExcludedRules</a> . </p></li></ol><p>Be aware that if you try to add a RATE_BASED rule to a web ACL without setting the rule type when first creating the rule, the <a>UpdateWebACL</a> request will fail because the request tries to add a REGULAR rule (the default rule type) with the specified ID, which does not exist. </p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFSubscriptionNotFound`.
 
 @see AWSwaf-regionalUpdateWebACLRequest
 @see AWSwaf-regionalUpdateWebACLResponse
 */
- (AWSTask<AWSwaf-regionalUpdateWebACLResponse *> *)updateWebACL:(AWSwaf-regionalUpdateWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ActivatedRule</a> objects in a <code>WebACL</code>. Each <code>Rule</code> identifies web requests that you want to allow, block, or count. When you update a <code>WebACL</code>, you specify the following values:</p><ul><li><p>A default action for the <code>WebACL</code>, either <code>ALLOW</code> or <code>BLOCK</code>. AWS WAF performs the default action if a request doesn't match the criteria in any of the <code>Rules</code> in a <code>WebACL</code>.</p></li><li><p>The <code>Rules</code> that you want to add or delete. If you want to replace one <code>Rule</code> with another, you delete the existing <code>Rule</code> and add the new one.</p></li><li><p>For each <code>Rule</code>, whether you want AWS WAF to allow requests, block requests, or count requests that match the conditions in the <code>Rule</code>.</p></li><li><p>The order in which you want AWS WAF to evaluate the <code>Rules</code> in a <code>WebACL</code>. If you add more than one <code>Rule</code> to a <code>WebACL</code>, AWS WAF evaluates each request against the <code>Rules</code> in order based on the value of <code>Priority</code>. (The <code>Rule</code> that has the lowest value for <code>Priority</code> is evaluated first.) When a web request matches all the predicates (such as <code>ByteMatchSets</code> and <code>IPSets</code>) in a <code>Rule</code>, AWS WAF immediately takes the corresponding action, allow or block, and doesn't evaluate the request against the remaining <code>Rules</code> in the <code>WebACL</code>, if any. </p></li></ul><p>To create and configure a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in <code>Rules</code>. For more information, see <a>CreateByteMatchSet</a>, <a>UpdateByteMatchSet</a>, <a>CreateIPSet</a>, <a>UpdateIPSet</a>, <a>CreateSqlInjectionMatchSet</a>, and <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Create and update the <code>Rules</code> that you want to include in the <code>WebACL</code>. For more information, see <a>CreateRule</a> and <a>UpdateRule</a>.</p></li><li><p>Create a <code>WebACL</code>. See <a>CreateWebACL</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateWebACL</a> request.</p></li><li><p>Submit an <code>UpdateWebACL</code> request to specify the <code>Rules</code> that you want to include in the <code>WebACL</code>, to specify the default action, and to associate the <code>WebACL</code> with a CloudFront distribution. </p><p>The <code>ActivatedRule</code> can be a rule group. If you specify a rule group as your <code>ActivatedRule</code> , you can exclude specific rules from that rule group.</p><p>If you already have a rule group associated with a web ACL and want to submit an <code>UpdateWebACL</code> request to exclude certain rules from that rule group, you must first remove the rule group from the web ACL, the re-insert it again, specifying the excluded rules. For details, see <a>ActivatedRule$ExcludedRules</a> . </p></li></ol><p>Be aware that if you try to add a RATE_BASED rule to a web ACL without setting the rule type when first creating the rule, the <a>UpdateWebACL</a> request will fail because the request tries to add a REGULAR rule (the default rule type) with the specified ID, which does not exist. </p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFReferencedItem`, `AWSwaf-regionalErrorWAFLimitsExceeded`, `AWSwaf-regionalErrorWAFSubscriptionNotFound`.
 
 @see AWSwaf-regionalUpdateWebACLRequest
 @see AWSwaf-regionalUpdateWebACLResponse
 */
- (void)updateWebACL:(AWSwaf-regionalUpdateWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>XssMatchTuple</a> objects (filters) in an <a>XssMatchSet</a>. For each <code>XssMatchTuple</code> object, you specify the following values:</p><ul><li><p><code>Action</code>: Whether to insert the object into or delete the object from the array. To change an <code>XssMatchTuple</code>, you delete the existing object and add a new one.</p></li><li><p><code>FieldToMatch</code>: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.</p></li><li><p><code>TextTransformation</code>: Which text transformation, if any, to perform on the web request before inspecting the request for cross-site scripting attacks.</p><p>You can only specify a single type of TextTransformation.</p></li></ul><p>You use <code>XssMatchSet</code> objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain cross-site scripting attacks in the request body and you want to block the requests, you can create an <code>XssMatchSet</code> with the applicable settings, and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>XssMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateXssMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateXssMatchSet</code> request to specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateXssMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwaf-regionalUpdateXssMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateXssMatchSetRequest
 @see AWSwaf-regionalUpdateXssMatchSetResponse
 */
- (AWSTask<AWSwaf-regionalUpdateXssMatchSetResponse *> *)updateXssMatchSet:(AWSwaf-regionalUpdateXssMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>XssMatchTuple</a> objects (filters) in an <a>XssMatchSet</a>. For each <code>XssMatchTuple</code> object, you specify the following values:</p><ul><li><p><code>Action</code>: Whether to insert the object into or delete the object from the array. To change an <code>XssMatchTuple</code>, you delete the existing object and add a new one.</p></li><li><p><code>FieldToMatch</code>: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.</p></li><li><p><code>TextTransformation</code>: Which text transformation, if any, to perform on the web request before inspecting the request for cross-site scripting attacks.</p><p>You can only specify a single type of TextTransformation.</p></li></ul><p>You use <code>XssMatchSet</code> objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain cross-site scripting attacks in the request body and you want to block the requests, you can create an <code>XssMatchSet</code> with the applicable settings, and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>XssMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateXssMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateXssMatchSet</code> request to specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateXssMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwaf-regionalErrorDomain` domain and the following error code: `AWSwaf-regionalErrorWAFInternalError`, `AWSwaf-regionalErrorWAFInvalidAccount`, `AWSwaf-regionalErrorWAFInvalidOperation`, `AWSwaf-regionalErrorWAFInvalidParameter`, `AWSwaf-regionalErrorWAFNonexistentContainer`, `AWSwaf-regionalErrorWAFNonexistentItem`, `AWSwaf-regionalErrorWAFStaleData`, `AWSwaf-regionalErrorWAFLimitsExceeded`.
 
 @see AWSwaf-regionalUpdateXssMatchSetRequest
 @see AWSwaf-regionalUpdateXssMatchSetResponse
 */
- (void)updateXssMatchSet:(AWSwaf-regionalUpdateXssMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwaf-regionalUpdateXssMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
