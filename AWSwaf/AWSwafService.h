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
#import "AWSwafModel.h"
#import "AWSwafResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSwaf
FOUNDATION_EXPORT NSString *const AWSwafSDKVersion;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>This is the <i>AWS WAF Classic API Reference</i> for using AWS WAF Classic with Amazon CloudFront. The AWS WAF Classic actions and data types listed in the reference are available for protecting Amazon CloudFront distributions. You can use these actions and data types via the endpoint <i>waf.amazonaws.com</i>. This guide is for developers who need detailed information about the AWS WAF Classic API actions, data types, and errors. For detailed information about AWS WAF Classic features and an overview of how to use the AWS WAF Classic API, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p>
 */
@interface AWSwaf : AWSService

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

     let waf = AWSwaf.default()

 *Objective-C*

     AWSwaf *waf = [AWSwaf defaultwaf];

 @return The default service client.
 */
+ (instancetype)defaultwaf;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSwaf.register(with: configuration!, forKey: "USWest2waf")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSwaf registerwafWithConfiguration:configuration forKey:@"USWest2waf"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let waf = AWSwaf(forKey: "USWest2waf")

 *Objective-C*

     AWSwaf *waf = [AWSwaf wafForKey:@"USWest2waf"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerwafWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerwafWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSwaf.register(with: configuration!, forKey: "USWest2waf")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSwaf registerwafWithConfiguration:configuration forKey:@"USWest2waf"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let waf = AWSwaf(forKey: "USWest2waf")

 *Objective-C*

     AWSwaf *waf = [AWSwaf wafForKey:@"USWest2waf"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)wafForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removewafForKey:(NSString *)key;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>ByteMatchSet</code>. You then use <a>UpdateByteMatchSet</a> to identify the part of a web request that you want AWS WAF to inspect, such as the values of the <code>User-Agent</code> header or the query string. For example, you can create a <code>ByteMatchSet</code> that matches any requests with <code>User-Agent</code> headers that contain the string <code>BadBot</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateByteMatchSet</code> request.</p></li><li><p>Submit a <code>CreateByteMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateByteMatchSet</code> request.</p></li><li><p>Submit an <a>UpdateByteMatchSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateByteMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateByteMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateByteMatchSetRequest
 @see AWSwafCreateByteMatchSetResponse
 */
- (AWSTask<AWSwafCreateByteMatchSetResponse *> *)createByteMatchSet:(AWSwafCreateByteMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>ByteMatchSet</code>. You then use <a>UpdateByteMatchSet</a> to identify the part of a web request that you want AWS WAF to inspect, such as the values of the <code>User-Agent</code> header or the query string. For example, you can create a <code>ByteMatchSet</code> that matches any requests with <code>User-Agent</code> headers that contain the string <code>BadBot</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateByteMatchSet</code> request.</p></li><li><p>Submit a <code>CreateByteMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateByteMatchSet</code> request.</p></li><li><p>Submit an <a>UpdateByteMatchSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateByteMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateByteMatchSetRequest
 @see AWSwafCreateByteMatchSetResponse
 */
- (void)createByteMatchSet:(AWSwafCreateByteMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateByteMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>GeoMatchSet</a>, which you use to specify which web requests you want to allow or block based on the country that the requests originate from. For example, if you're receiving a lot of requests from one or more countries and you want to block the requests, you can create an <code>GeoMatchSet</code> that contains those countries and then configure AWS WAF to block the requests. </p><p>To create and configure a <code>GeoMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateGeoMatchSet</code> request.</p></li><li><p>Submit a <code>CreateGeoMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateGeoMatchSet</a> request.</p></li><li><p>Submit an <code>UpdateGeoMatchSetSet</code> request to specify the countries that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateGeoMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateGeoMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateGeoMatchSetRequest
 @see AWSwafCreateGeoMatchSetResponse
 */
- (AWSTask<AWSwafCreateGeoMatchSetResponse *> *)createGeoMatchSet:(AWSwafCreateGeoMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>GeoMatchSet</a>, which you use to specify which web requests you want to allow or block based on the country that the requests originate from. For example, if you're receiving a lot of requests from one or more countries and you want to block the requests, you can create an <code>GeoMatchSet</code> that contains those countries and then configure AWS WAF to block the requests. </p><p>To create and configure a <code>GeoMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateGeoMatchSet</code> request.</p></li><li><p>Submit a <code>CreateGeoMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateGeoMatchSet</a> request.</p></li><li><p>Submit an <code>UpdateGeoMatchSetSet</code> request to specify the countries that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateGeoMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateGeoMatchSetRequest
 @see AWSwafCreateGeoMatchSetResponse
 */
- (void)createGeoMatchSet:(AWSwafCreateGeoMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateGeoMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>IPSet</a>, which you use to specify which web requests that you want to allow or block based on the IP addresses that the requests originate from. For example, if you're receiving a lot of requests from one or more individual IP addresses or one or more ranges of IP addresses and you want to block the requests, you can create an <code>IPSet</code> that contains those IP addresses and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>IPSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateIPSet</code> request.</p></li><li><p>Submit a <code>CreateIPSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateIPSet</code> request to specify the IP addresses that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateIPSetRequest
 @see AWSwafCreateIPSetResponse
 */
- (AWSTask<AWSwafCreateIPSetResponse *> *)createIPSet:(AWSwafCreateIPSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>IPSet</a>, which you use to specify which web requests that you want to allow or block based on the IP addresses that the requests originate from. For example, if you're receiving a lot of requests from one or more individual IP addresses or one or more ranges of IP addresses and you want to block the requests, you can create an <code>IPSet</code> that contains those IP addresses and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>IPSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateIPSet</code> request.</p></li><li><p>Submit a <code>CreateIPSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateIPSet</code> request to specify the IP addresses that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateIPSetRequest
 @see AWSwafCreateIPSetResponse
 */
- (void)createIPSet:(AWSwafCreateIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>RateBasedRule</a>. The <code>RateBasedRule</code> contains a <code>RateLimit</code>, which specifies the maximum number of requests that AWS WAF allows from a specified IP address in a five-minute period. The <code>RateBasedRule</code> also contains the <code>IPSet</code> objects, <code>ByteMatchSet</code> objects, and other predicates that identify the requests that you want to count or block if these requests exceed the <code>RateLimit</code>.</p><p>If you add more than one predicate to a <code>RateBasedRule</code>, a request not only must exceed the <code>RateLimit</code>, but it also must match all the conditions to be counted or blocked. For example, suppose you add the following to a <code>RateBasedRule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>You then add the <code>RateBasedRule</code> to a <code>WebACL</code> and specify that you want to block requests that meet the conditions in the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>. Further, requests that match these two conditions must be received at a rate of more than 1,000 requests every five minutes. If both conditions are met and the rate is exceeded, AWS WAF blocks the requests. If the rate drops below 1,000 for a five-minute period, AWS WAF no longer blocks the requests.</p><p>As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a <code>RateBasedRule</code>:</p><ul><li><p>A <code>ByteMatchSet</code> with <code>FieldToMatch</code> of <code>URI</code></p></li><li><p>A <code>PositionalConstraint</code> of <code>STARTS_WITH</code></p></li><li><p>A <code>TargetString</code> of <code>login</code></p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>By adding this <code>RateBasedRule</code> to a <code>WebACL</code>, you could limit requests to your login page without affecting the rest of your site.</p><p>To create and configure a <code>RateBasedRule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the rule. For more information, see <a>CreateByteMatchSet</a>, <a>CreateIPSet</a>, and <a>CreateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRule</code> request.</p></li><li><p>Submit a <code>CreateRateBasedRule</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRateBasedRule</code> request to specify the predicates that you want to include in the rule.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>RateBasedRule</code>. For more information, see <a>CreateWebACL</a>.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRateBasedRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateRateBasedRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`, `AWSwafErrorWAFBadRequest`.
 
 @see AWSwafCreateRateBasedRuleRequest
 @see AWSwafCreateRateBasedRuleResponse
 */
- (AWSTask<AWSwafCreateRateBasedRuleResponse *> *)createRateBasedRule:(AWSwafCreateRateBasedRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>RateBasedRule</a>. The <code>RateBasedRule</code> contains a <code>RateLimit</code>, which specifies the maximum number of requests that AWS WAF allows from a specified IP address in a five-minute period. The <code>RateBasedRule</code> also contains the <code>IPSet</code> objects, <code>ByteMatchSet</code> objects, and other predicates that identify the requests that you want to count or block if these requests exceed the <code>RateLimit</code>.</p><p>If you add more than one predicate to a <code>RateBasedRule</code>, a request not only must exceed the <code>RateLimit</code>, but it also must match all the conditions to be counted or blocked. For example, suppose you add the following to a <code>RateBasedRule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>You then add the <code>RateBasedRule</code> to a <code>WebACL</code> and specify that you want to block requests that meet the conditions in the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>. Further, requests that match these two conditions must be received at a rate of more than 1,000 requests every five minutes. If both conditions are met and the rate is exceeded, AWS WAF blocks the requests. If the rate drops below 1,000 for a five-minute period, AWS WAF no longer blocks the requests.</p><p>As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a <code>RateBasedRule</code>:</p><ul><li><p>A <code>ByteMatchSet</code> with <code>FieldToMatch</code> of <code>URI</code></p></li><li><p>A <code>PositionalConstraint</code> of <code>STARTS_WITH</code></p></li><li><p>A <code>TargetString</code> of <code>login</code></p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>By adding this <code>RateBasedRule</code> to a <code>WebACL</code>, you could limit requests to your login page without affecting the rest of your site.</p><p>To create and configure a <code>RateBasedRule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the rule. For more information, see <a>CreateByteMatchSet</a>, <a>CreateIPSet</a>, and <a>CreateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRule</code> request.</p></li><li><p>Submit a <code>CreateRateBasedRule</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRateBasedRule</code> request to specify the predicates that you want to include in the rule.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>RateBasedRule</code>. For more information, see <a>CreateWebACL</a>.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRateBasedRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`, `AWSwafErrorWAFBadRequest`.
 
 @see AWSwafCreateRateBasedRuleRequest
 @see AWSwafCreateRateBasedRuleResponse
 */
- (void)createRateBasedRule:(AWSwafCreateRateBasedRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateRateBasedRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>RegexMatchSet</a>. You then use <a>UpdateRegexMatchSet</a> to identify the part of a web request that you want AWS WAF to inspect, such as the values of the <code>User-Agent</code> header or the query string. For example, you can create a <code>RegexMatchSet</code> that contains a <code>RegexMatchTuple</code> that looks for any requests with <code>User-Agent</code> headers that match a <code>RegexPatternSet</code> with pattern <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRegexMatchSet</code> request.</p></li><li><p>Submit a <code>CreateRegexMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexMatchSet</code> request.</p></li><li><p>Submit an <a>UpdateRegexMatchSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value, using a <code>RegexPatternSet</code>, that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRegexMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateRegexMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateRegexMatchSetRequest
 @see AWSwafCreateRegexMatchSetResponse
 */
- (AWSTask<AWSwafCreateRegexMatchSetResponse *> *)createRegexMatchSet:(AWSwafCreateRegexMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>RegexMatchSet</a>. You then use <a>UpdateRegexMatchSet</a> to identify the part of a web request that you want AWS WAF to inspect, such as the values of the <code>User-Agent</code> header or the query string. For example, you can create a <code>RegexMatchSet</code> that contains a <code>RegexMatchTuple</code> that looks for any requests with <code>User-Agent</code> headers that match a <code>RegexPatternSet</code> with pattern <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRegexMatchSet</code> request.</p></li><li><p>Submit a <code>CreateRegexMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexMatchSet</code> request.</p></li><li><p>Submit an <a>UpdateRegexMatchSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value, using a <code>RegexPatternSet</code>, that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRegexMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateRegexMatchSetRequest
 @see AWSwafCreateRegexMatchSetResponse
 */
- (void)createRegexMatchSet:(AWSwafCreateRegexMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateRegexMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>RegexPatternSet</code>. You then use <a>UpdateRegexPatternSet</a> to specify the regular expression (regex) pattern that you want AWS WAF to search for, such as <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexPatternSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRegexPatternSet</code> request.</p></li><li><p>Submit a <code>CreateRegexPatternSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexPatternSet</code> request.</p></li><li><p>Submit an <a>UpdateRegexPatternSet</a> request to specify the string that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRegexPatternSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateRegexPatternSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateRegexPatternSetRequest
 @see AWSwafCreateRegexPatternSetResponse
 */
- (AWSTask<AWSwafCreateRegexPatternSetResponse *> *)createRegexPatternSet:(AWSwafCreateRegexPatternSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>RegexPatternSet</code>. You then use <a>UpdateRegexPatternSet</a> to specify the regular expression (regex) pattern that you want AWS WAF to search for, such as <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexPatternSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRegexPatternSet</code> request.</p></li><li><p>Submit a <code>CreateRegexPatternSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexPatternSet</code> request.</p></li><li><p>Submit an <a>UpdateRegexPatternSet</a> request to specify the string that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRegexPatternSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateRegexPatternSetRequest
 @see AWSwafCreateRegexPatternSetResponse
 */
- (void)createRegexPatternSet:(AWSwafCreateRegexPatternSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateRegexPatternSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>Rule</code>, which contains the <code>IPSet</code> objects, <code>ByteMatchSet</code> objects, and other predicates that identify the requests that you want to block. If you add more than one predicate to a <code>Rule</code>, a request must match all of the specifications to be allowed or blocked. For example, suppose that you add the following to a <code>Rule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>You then add the <code>Rule</code> to a <code>WebACL</code> and specify that you want to blocks requests that satisfy the <code>Rule</code>. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>.</p><p>To create and configure a <code>Rule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the <code>Rule</code>. For more information, see <a>CreateByteMatchSet</a>, <a>CreateIPSet</a>, and <a>CreateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRule</code> request.</p></li><li><p>Submit a <code>CreateRule</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRule</code> request to specify the predicates that you want to include in the <code>Rule</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>Rule</code>. For more information, see <a>CreateWebACL</a>.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`, `AWSwafErrorWAFBadRequest`.
 
 @see AWSwafCreateRuleRequest
 @see AWSwafCreateRuleResponse
 */
- (AWSTask<AWSwafCreateRuleResponse *> *)createRule:(AWSwafCreateRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>Rule</code>, which contains the <code>IPSet</code> objects, <code>ByteMatchSet</code> objects, and other predicates that identify the requests that you want to block. If you add more than one predicate to a <code>Rule</code>, a request must match all of the specifications to be allowed or blocked. For example, suppose that you add the following to a <code>Rule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>You then add the <code>Rule</code> to a <code>WebACL</code> and specify that you want to blocks requests that satisfy the <code>Rule</code>. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>.</p><p>To create and configure a <code>Rule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the <code>Rule</code>. For more information, see <a>CreateByteMatchSet</a>, <a>CreateIPSet</a>, and <a>CreateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateRule</code> request.</p></li><li><p>Submit a <code>CreateRule</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRule</code> request to specify the predicates that you want to include in the <code>Rule</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>Rule</code>. For more information, see <a>CreateWebACL</a>.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`, `AWSwafErrorWAFBadRequest`.
 
 @see AWSwafCreateRuleRequest
 @see AWSwafCreateRuleResponse
 */
- (void)createRule:(AWSwafCreateRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>RuleGroup</code>. A rule group is a collection of predefined rules that you add to a web ACL. You use <a>UpdateRuleGroup</a> to add rules to the rule group.</p><p>Rule groups are subject to the following limits:</p><ul><li><p>Three rule groups per account. You can request an increase to this limit by contacting customer support.</p></li><li><p>One rule group per web ACL.</p></li><li><p>Ten rules per rule group.</p></li></ul><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRuleGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateRuleGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`, `AWSwafErrorWAFBadRequest`.
 
 @see AWSwafCreateRuleGroupRequest
 @see AWSwafCreateRuleGroupResponse
 */
- (AWSTask<AWSwafCreateRuleGroupResponse *> *)createRuleGroup:(AWSwafCreateRuleGroupRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>RuleGroup</code>. A rule group is a collection of predefined rules that you add to a web ACL. You use <a>UpdateRuleGroup</a> to add rules to the rule group.</p><p>Rule groups are subject to the following limits:</p><ul><li><p>Three rule groups per account. You can request an increase to this limit by contacting customer support.</p></li><li><p>One rule group per web ACL.</p></li><li><p>Ten rules per rule group.</p></li></ul><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateRuleGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`, `AWSwafErrorWAFBadRequest`.
 
 @see AWSwafCreateRuleGroupRequest
 @see AWSwafCreateRuleGroupResponse
 */
- (void)createRuleGroup:(AWSwafCreateRuleGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateRuleGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>SizeConstraintSet</code>. You then use <a>UpdateSizeConstraintSet</a> to identify the part of a web request that you want AWS WAF to check for length, such as the length of the <code>User-Agent</code> header or the length of the query string. For example, you can create a <code>SizeConstraintSet</code> that matches any requests that have a query string that is longer than 100 bytes. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateSizeConstraintSet</code> request.</p></li><li><p>Submit a <code>CreateSizeConstraintSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateSizeConstraintSet</code> request.</p></li><li><p>Submit an <a>UpdateSizeConstraintSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSizeConstraintSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateSizeConstraintSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateSizeConstraintSetRequest
 @see AWSwafCreateSizeConstraintSetResponse
 */
- (AWSTask<AWSwafCreateSizeConstraintSetResponse *> *)createSizeConstraintSet:(AWSwafCreateSizeConstraintSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>SizeConstraintSet</code>. You then use <a>UpdateSizeConstraintSet</a> to identify the part of a web request that you want AWS WAF to check for length, such as the length of the <code>User-Agent</code> header or the length of the query string. For example, you can create a <code>SizeConstraintSet</code> that matches any requests that have a query string that is longer than 100 bytes. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateSizeConstraintSet</code> request.</p></li><li><p>Submit a <code>CreateSizeConstraintSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateSizeConstraintSet</code> request.</p></li><li><p>Submit an <a>UpdateSizeConstraintSet</a> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSizeConstraintSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateSizeConstraintSetRequest
 @see AWSwafCreateSizeConstraintSetResponse
 */
- (void)createSizeConstraintSet:(AWSwafCreateSizeConstraintSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateSizeConstraintSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>SqlInjectionMatchSet</a>, which you use to allow, block, or count requests that contain snippets of SQL code in a specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.</p><p>To create and configure a <code>SqlInjectionMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateSqlInjectionMatchSet</code> request.</p></li><li><p>Submit a <code>CreateSqlInjectionMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateSqlInjectionMatchSet</a> request.</p></li><li><p>Submit an <a>UpdateSqlInjectionMatchSet</a> request to specify the parts of web requests in which you want to allow, block, or count malicious SQL code.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSqlInjectionMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateSqlInjectionMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateSqlInjectionMatchSetRequest
 @see AWSwafCreateSqlInjectionMatchSetResponse
 */
- (AWSTask<AWSwafCreateSqlInjectionMatchSetResponse *> *)createSqlInjectionMatchSet:(AWSwafCreateSqlInjectionMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <a>SqlInjectionMatchSet</a>, which you use to allow, block, or count requests that contain snippets of SQL code in a specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.</p><p>To create and configure a <code>SqlInjectionMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateSqlInjectionMatchSet</code> request.</p></li><li><p>Submit a <code>CreateSqlInjectionMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateSqlInjectionMatchSet</a> request.</p></li><li><p>Submit an <a>UpdateSqlInjectionMatchSet</a> request to specify the parts of web requests in which you want to allow, block, or count malicious SQL code.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateSqlInjectionMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateSqlInjectionMatchSetRequest
 @see AWSwafCreateSqlInjectionMatchSetResponse
 */
- (void)createSqlInjectionMatchSet:(AWSwafCreateSqlInjectionMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateSqlInjectionMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>WebACL</code>, which contains the <code>Rules</code> that identify the CloudFront web requests that you want to allow, block, or count. AWS WAF evaluates <code>Rules</code> in order based on the value of <code>Priority</code> for each <code>Rule</code>.</p><p>You also specify a default action, either <code>ALLOW</code> or <code>BLOCK</code>. If a web request doesn't match any of the <code>Rules</code> in a <code>WebACL</code>, AWS WAF responds to the request with the default action. </p><p>To create and configure a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Create and update the <code>ByteMatchSet</code> objects and other predicates that you want to include in <code>Rules</code>. For more information, see <a>CreateByteMatchSet</a>, <a>UpdateByteMatchSet</a>, <a>CreateIPSet</a>, <a>UpdateIPSet</a>, <a>CreateSqlInjectionMatchSet</a>, and <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Create and update the <code>Rules</code> that you want to include in the <code>WebACL</code>. For more information, see <a>CreateRule</a> and <a>UpdateRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateWebACL</code> request.</p></li><li><p>Submit a <code>CreateWebACL</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateWebACL</a> request.</p></li><li><p>Submit an <a>UpdateWebACL</a> request to specify the <code>Rules</code> that you want to include in the <code>WebACL</code>, to specify the default action, and to associate the <code>WebACL</code> with a CloudFront distribution.</p></li></ol><p>For more information about how to use the AWS WAF API, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`, `AWSwafErrorWAFBadRequest`.
 
 @see AWSwafCreateWebACLRequest
 @see AWSwafCreateWebACLResponse
 */
- (AWSTask<AWSwafCreateWebACLResponse *> *)createWebACL:(AWSwafCreateWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates a <code>WebACL</code>, which contains the <code>Rules</code> that identify the CloudFront web requests that you want to allow, block, or count. AWS WAF evaluates <code>Rules</code> in order based on the value of <code>Priority</code> for each <code>Rule</code>.</p><p>You also specify a default action, either <code>ALLOW</code> or <code>BLOCK</code>. If a web request doesn't match any of the <code>Rules</code> in a <code>WebACL</code>, AWS WAF responds to the request with the default action. </p><p>To create and configure a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Create and update the <code>ByteMatchSet</code> objects and other predicates that you want to include in <code>Rules</code>. For more information, see <a>CreateByteMatchSet</a>, <a>UpdateByteMatchSet</a>, <a>CreateIPSet</a>, <a>UpdateIPSet</a>, <a>CreateSqlInjectionMatchSet</a>, and <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Create and update the <code>Rules</code> that you want to include in the <code>WebACL</code>. For more information, see <a>CreateRule</a> and <a>UpdateRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateWebACL</code> request.</p></li><li><p>Submit a <code>CreateWebACL</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateWebACL</a> request.</p></li><li><p>Submit an <a>UpdateWebACL</a> request to specify the <code>Rules</code> that you want to include in the <code>WebACL</code>, to specify the default action, and to associate the <code>WebACL</code> with a CloudFront distribution.</p></li></ol><p>For more information about how to use the AWS WAF API, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`, `AWSwafErrorWAFBadRequest`.
 
 @see AWSwafCreateWebACLRequest
 @see AWSwafCreateWebACLResponse
 */
- (void)createWebACL:(AWSwafCreateWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates an AWS CloudFormation WAFV2 template for the specified web ACL in the specified Amazon S3 bucket. Then, in CloudFormation, you create a stack from the template, to create the web ACL and its resources in AWS WAFV2. Use this to migrate your AWS WAF Classic web ACL to the latest version of AWS WAF.</p><p>This is part of a larger migration procedure for web ACLs from AWS WAF Classic to the latest version of AWS WAF. For the full procedure, including caveats and manual steps to complete the migration and switch over to the new web ACL, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-migrating-from-classic.html">Migrating your AWS WAF Classic resources to AWS WAF</a> in the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateWebACLMigrationStack service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateWebACLMigrationStackResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFEntityMigration`.
 
 @see AWSwafCreateWebACLMigrationStackRequest
 @see AWSwafCreateWebACLMigrationStackResponse
 */
- (AWSTask<AWSwafCreateWebACLMigrationStackResponse *> *)createWebACLMigrationStack:(AWSwafCreateWebACLMigrationStackRequest *)request;

/**
 <p>Creates an AWS CloudFormation WAFV2 template for the specified web ACL in the specified Amazon S3 bucket. Then, in CloudFormation, you create a stack from the template, to create the web ACL and its resources in AWS WAFV2. Use this to migrate your AWS WAF Classic web ACL to the latest version of AWS WAF.</p><p>This is part of a larger migration procedure for web ACLs from AWS WAF Classic to the latest version of AWS WAF. For the full procedure, including caveats and manual steps to complete the migration and switch over to the new web ACL, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-migrating-from-classic.html">Migrating your AWS WAF Classic resources to AWS WAF</a> in the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. </p>
 
 @param request A container for the necessary parameters to execute the CreateWebACLMigrationStack service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFEntityMigration`.
 
 @see AWSwafCreateWebACLMigrationStackRequest
 @see AWSwafCreateWebACLMigrationStackResponse
 */
- (void)createWebACLMigrationStack:(AWSwafCreateWebACLMigrationStackRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateWebACLMigrationStackResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>XssMatchSet</a>, which you use to allow, block, or count requests that contain cross-site scripting attacks in the specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.</p><p>To create and configure an <code>XssMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateXssMatchSet</code> request.</p></li><li><p>Submit a <code>CreateXssMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateXssMatchSet</a> request.</p></li><li><p>Submit an <a>UpdateXssMatchSet</a> request to specify the parts of web requests in which you want to allow, block, or count cross-site scripting attacks.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateXssMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafCreateXssMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateXssMatchSetRequest
 @see AWSwafCreateXssMatchSetResponse
 */
- (AWSTask<AWSwafCreateXssMatchSetResponse *> *)createXssMatchSet:(AWSwafCreateXssMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Creates an <a>XssMatchSet</a>, which you use to allow, block, or count requests that contain cross-site scripting attacks in the specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings.</p><p>To create and configure an <code>XssMatchSet</code>, perform the following steps:</p><ol><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>CreateXssMatchSet</code> request.</p></li><li><p>Submit a <code>CreateXssMatchSet</code> request.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateXssMatchSet</a> request.</p></li><li><p>Submit an <a>UpdateXssMatchSet</a> request to specify the parts of web requests in which you want to allow, block, or count cross-site scripting attacks.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the CreateXssMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafCreateXssMatchSetRequest
 @see AWSwafCreateXssMatchSetResponse
 */
- (void)createXssMatchSet:(AWSwafCreateXssMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafCreateXssMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>ByteMatchSet</a>. You can't delete a <code>ByteMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any <a>ByteMatchTuple</a> objects (any filters).</p><p>If you just want to remove a <code>ByteMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Update the <code>ByteMatchSet</code> to remove filters, if any. For more information, see <a>UpdateByteMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteByteMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteByteMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteByteMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteByteMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteByteMatchSetRequest
 @see AWSwafDeleteByteMatchSetResponse
 */
- (AWSTask<AWSwafDeleteByteMatchSetResponse *> *)deleteByteMatchSet:(AWSwafDeleteByteMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>ByteMatchSet</a>. You can't delete a <code>ByteMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any <a>ByteMatchTuple</a> objects (any filters).</p><p>If you just want to remove a <code>ByteMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Update the <code>ByteMatchSet</code> to remove filters, if any. For more information, see <a>UpdateByteMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteByteMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteByteMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteByteMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteByteMatchSetRequest
 @see AWSwafDeleteByteMatchSetResponse
 */
- (void)deleteByteMatchSet:(AWSwafDeleteByteMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteByteMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>GeoMatchSet</a>. You can't delete a <code>GeoMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any countries.</p><p>If you just want to remove a <code>GeoMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>GeoMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>GeoMatchSet</code> to remove any countries. For more information, see <a>UpdateGeoMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteGeoMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteGeoMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteGeoMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteGeoMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteGeoMatchSetRequest
 @see AWSwafDeleteGeoMatchSetResponse
 */
- (AWSTask<AWSwafDeleteGeoMatchSetResponse *> *)deleteGeoMatchSet:(AWSwafDeleteGeoMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>GeoMatchSet</a>. You can't delete a <code>GeoMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any countries.</p><p>If you just want to remove a <code>GeoMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>GeoMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>GeoMatchSet</code> to remove any countries. For more information, see <a>UpdateGeoMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteGeoMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteGeoMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteGeoMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteGeoMatchSetRequest
 @see AWSwafDeleteGeoMatchSetResponse
 */
- (void)deleteGeoMatchSet:(AWSwafDeleteGeoMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteGeoMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an <a>IPSet</a>. You can't delete an <code>IPSet</code> if it's still used in any <code>Rules</code> or if it still includes any IP addresses.</p><p>If you just want to remove an <code>IPSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete an <code>IPSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>IPSet</code> to remove IP address ranges, if any. For more information, see <a>UpdateIPSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteIPSet</code> request.</p></li><li><p>Submit a <code>DeleteIPSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteIPSetRequest
 @see AWSwafDeleteIPSetResponse
 */
- (AWSTask<AWSwafDeleteIPSetResponse *> *)deleteIPSet:(AWSwafDeleteIPSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an <a>IPSet</a>. You can't delete an <code>IPSet</code> if it's still used in any <code>Rules</code> or if it still includes any IP addresses.</p><p>If you just want to remove an <code>IPSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete an <code>IPSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>IPSet</code> to remove IP address ranges, if any. For more information, see <a>UpdateIPSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteIPSet</code> request.</p></li><li><p>Submit a <code>DeleteIPSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteIPSetRequest
 @see AWSwafDeleteIPSetResponse
 */
- (void)deleteIPSet:(AWSwafDeleteIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes the <a>LoggingConfiguration</a> from the specified web ACL.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoggingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteLoggingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFStaleData`.
 
 @see AWSwafDeleteLoggingConfigurationRequest
 @see AWSwafDeleteLoggingConfigurationResponse
 */
- (AWSTask<AWSwafDeleteLoggingConfigurationResponse *> *)deleteLoggingConfiguration:(AWSwafDeleteLoggingConfigurationRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes the <a>LoggingConfiguration</a> from the specified web ACL.</p>
 
 @param request A container for the necessary parameters to execute the DeleteLoggingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFStaleData`.
 
 @see AWSwafDeleteLoggingConfigurationRequest
 @see AWSwafDeleteLoggingConfigurationResponse
 */
- (void)deleteLoggingConfiguration:(AWSwafDeleteLoggingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteLoggingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an IAM policy from the specified RuleGroup.</p><p>The user making the request must be the owner of the RuleGroup.</p>
 
 @param request A container for the necessary parameters to execute the DeletePermissionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeletePermissionPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafDeletePermissionPolicyRequest
 @see AWSwafDeletePermissionPolicyResponse
 */
- (AWSTask<AWSwafDeletePermissionPolicyResponse *> *)deletePermissionPolicy:(AWSwafDeletePermissionPolicyRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an IAM policy from the specified RuleGroup.</p><p>The user making the request must be the owner of the RuleGroup.</p>
 
 @param request A container for the necessary parameters to execute the DeletePermissionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafDeletePermissionPolicyRequest
 @see AWSwafDeletePermissionPolicyResponse
 */
- (void)deletePermissionPolicy:(AWSwafDeletePermissionPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeletePermissionPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RateBasedRule</a>. You can't delete a rule if it's still used in any <code>WebACL</code> objects or if it still includes any predicates, such as <code>ByteMatchSet</code> objects.</p><p>If you just want to remove a rule from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>RateBasedRule</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>RateBasedRule</code> to remove predicates, if any. For more information, see <a>UpdateRateBasedRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRateBasedRule</code> request.</p></li><li><p>Submit a <code>DeleteRateBasedRule</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRateBasedRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteRateBasedRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafDeleteRateBasedRuleRequest
 @see AWSwafDeleteRateBasedRuleResponse
 */
- (AWSTask<AWSwafDeleteRateBasedRuleResponse *> *)deleteRateBasedRule:(AWSwafDeleteRateBasedRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RateBasedRule</a>. You can't delete a rule if it's still used in any <code>WebACL</code> objects or if it still includes any predicates, such as <code>ByteMatchSet</code> objects.</p><p>If you just want to remove a rule from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>RateBasedRule</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>RateBasedRule</code> to remove predicates, if any. For more information, see <a>UpdateRateBasedRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRateBasedRule</code> request.</p></li><li><p>Submit a <code>DeleteRateBasedRule</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRateBasedRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafDeleteRateBasedRuleRequest
 @see AWSwafDeleteRateBasedRuleResponse
 */
- (void)deleteRateBasedRule:(AWSwafDeleteRateBasedRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteRateBasedRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RegexMatchSet</a>. You can't delete a <code>RegexMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any <code>RegexMatchTuples</code> objects (any filters).</p><p>If you just want to remove a <code>RegexMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Update the <code>RegexMatchSet</code> to remove filters, if any. For more information, see <a>UpdateRegexMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRegexMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteRegexMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRegexMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteRegexMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteRegexMatchSetRequest
 @see AWSwafDeleteRegexMatchSetResponse
 */
- (AWSTask<AWSwafDeleteRegexMatchSetResponse *> *)deleteRegexMatchSet:(AWSwafDeleteRegexMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RegexMatchSet</a>. You can't delete a <code>RegexMatchSet</code> if it's still used in any <code>Rules</code> or if it still includes any <code>RegexMatchTuples</code> objects (any filters).</p><p>If you just want to remove a <code>RegexMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Update the <code>RegexMatchSet</code> to remove filters, if any. For more information, see <a>UpdateRegexMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRegexMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteRegexMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRegexMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteRegexMatchSetRequest
 @see AWSwafDeleteRegexMatchSetResponse
 */
- (void)deleteRegexMatchSet:(AWSwafDeleteRegexMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteRegexMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RegexPatternSet</a>. You can't delete a <code>RegexPatternSet</code> if it's still used in any <code>RegexMatchSet</code> or if the <code>RegexPatternSet</code> is not empty. </p>
 
 @param request A container for the necessary parameters to execute the DeleteRegexPatternSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteRegexPatternSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteRegexPatternSetRequest
 @see AWSwafDeleteRegexPatternSetResponse
 */
- (AWSTask<AWSwafDeleteRegexPatternSetResponse *> *)deleteRegexPatternSet:(AWSwafDeleteRegexPatternSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RegexPatternSet</a>. You can't delete a <code>RegexPatternSet</code> if it's still used in any <code>RegexMatchSet</code> or if the <code>RegexPatternSet</code> is not empty. </p>
 
 @param request A container for the necessary parameters to execute the DeleteRegexPatternSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteRegexPatternSetRequest
 @see AWSwafDeleteRegexPatternSetResponse
 */
- (void)deleteRegexPatternSet:(AWSwafDeleteRegexPatternSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteRegexPatternSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>Rule</a>. You can't delete a <code>Rule</code> if it's still used in any <code>WebACL</code> objects or if it still includes any predicates, such as <code>ByteMatchSet</code> objects.</p><p>If you just want to remove a <code>Rule</code> from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>Rule</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>Rule</code> to remove predicates, if any. For more information, see <a>UpdateRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRule</code> request.</p></li><li><p>Submit a <code>DeleteRule</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafDeleteRuleRequest
 @see AWSwafDeleteRuleResponse
 */
- (AWSTask<AWSwafDeleteRuleResponse *> *)deleteRule:(AWSwafDeleteRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>Rule</a>. You can't delete a <code>Rule</code> if it's still used in any <code>WebACL</code> objects or if it still includes any predicates, such as <code>ByteMatchSet</code> objects.</p><p>If you just want to remove a <code>Rule</code> from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>Rule</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>Rule</code> to remove predicates, if any. For more information, see <a>UpdateRule</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRule</code> request.</p></li><li><p>Submit a <code>DeleteRule</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafDeleteRuleRequest
 @see AWSwafDeleteRuleResponse
 */
- (void)deleteRule:(AWSwafDeleteRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RuleGroup</a>. You can't delete a <code>RuleGroup</code> if it's still used in any <code>WebACL</code> objects or if it still includes any rules.</p><p>If you just want to remove a <code>RuleGroup</code> from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>RuleGroup</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>RuleGroup</code> to remove rules, if any. For more information, see <a>UpdateRuleGroup</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRuleGroup</code> request.</p></li><li><p>Submit a <code>DeleteRuleGroup</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRuleGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteRuleGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafDeleteRuleGroupRequest
 @see AWSwafDeleteRuleGroupResponse
 */
- (AWSTask<AWSwafDeleteRuleGroupResponse *> *)deleteRuleGroup:(AWSwafDeleteRuleGroupRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>RuleGroup</a>. You can't delete a <code>RuleGroup</code> if it's still used in any <code>WebACL</code> objects or if it still includes any rules.</p><p>If you just want to remove a <code>RuleGroup</code> from a <code>WebACL</code>, use <a>UpdateWebACL</a>.</p><p>To permanently delete a <code>RuleGroup</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>RuleGroup</code> to remove rules, if any. For more information, see <a>UpdateRuleGroup</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteRuleGroup</code> request.</p></li><li><p>Submit a <code>DeleteRuleGroup</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteRuleGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafDeleteRuleGroupRequest
 @see AWSwafDeleteRuleGroupResponse
 */
- (void)deleteRuleGroup:(AWSwafDeleteRuleGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteRuleGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>SizeConstraintSet</a>. You can't delete a <code>SizeConstraintSet</code> if it's still used in any <code>Rules</code> or if it still includes any <a>SizeConstraint</a> objects (any filters).</p><p>If you just want to remove a <code>SizeConstraintSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Update the <code>SizeConstraintSet</code> to remove filters, if any. For more information, see <a>UpdateSizeConstraintSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteSizeConstraintSet</code> request.</p></li><li><p>Submit a <code>DeleteSizeConstraintSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteSizeConstraintSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteSizeConstraintSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteSizeConstraintSetRequest
 @see AWSwafDeleteSizeConstraintSetResponse
 */
- (AWSTask<AWSwafDeleteSizeConstraintSetResponse *> *)deleteSizeConstraintSet:(AWSwafDeleteSizeConstraintSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>SizeConstraintSet</a>. You can't delete a <code>SizeConstraintSet</code> if it's still used in any <code>Rules</code> or if it still includes any <a>SizeConstraint</a> objects (any filters).</p><p>If you just want to remove a <code>SizeConstraintSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Update the <code>SizeConstraintSet</code> to remove filters, if any. For more information, see <a>UpdateSizeConstraintSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteSizeConstraintSet</code> request.</p></li><li><p>Submit a <code>DeleteSizeConstraintSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteSizeConstraintSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteSizeConstraintSetRequest
 @see AWSwafDeleteSizeConstraintSetResponse
 */
- (void)deleteSizeConstraintSet:(AWSwafDeleteSizeConstraintSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteSizeConstraintSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>SqlInjectionMatchSet</a>. You can't delete a <code>SqlInjectionMatchSet</code> if it's still used in any <code>Rules</code> or if it still contains any <a>SqlInjectionMatchTuple</a> objects.</p><p>If you just want to remove a <code>SqlInjectionMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>SqlInjectionMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>SqlInjectionMatchSet</code> to remove filters, if any. For more information, see <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteSqlInjectionMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteSqlInjectionMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteSqlInjectionMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteSqlInjectionMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteSqlInjectionMatchSetRequest
 @see AWSwafDeleteSqlInjectionMatchSetResponse
 */
- (AWSTask<AWSwafDeleteSqlInjectionMatchSetResponse *> *)deleteSqlInjectionMatchSet:(AWSwafDeleteSqlInjectionMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>SqlInjectionMatchSet</a>. You can't delete a <code>SqlInjectionMatchSet</code> if it's still used in any <code>Rules</code> or if it still contains any <a>SqlInjectionMatchTuple</a> objects.</p><p>If you just want to remove a <code>SqlInjectionMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete a <code>SqlInjectionMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>SqlInjectionMatchSet</code> to remove filters, if any. For more information, see <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteSqlInjectionMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteSqlInjectionMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteSqlInjectionMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteSqlInjectionMatchSetRequest
 @see AWSwafDeleteSqlInjectionMatchSetResponse
 */
- (void)deleteSqlInjectionMatchSet:(AWSwafDeleteSqlInjectionMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteSqlInjectionMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>WebACL</a>. You can't delete a <code>WebACL</code> if it still contains any <code>Rules</code>.</p><p>To delete a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Update the <code>WebACL</code> to remove <code>Rules</code>, if any. For more information, see <a>UpdateWebACL</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteWebACL</code> request.</p></li><li><p>Submit a <code>DeleteWebACL</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafDeleteWebACLRequest
 @see AWSwafDeleteWebACLResponse
 */
- (AWSTask<AWSwafDeleteWebACLResponse *> *)deleteWebACL:(AWSwafDeleteWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes a <a>WebACL</a>. You can't delete a <code>WebACL</code> if it still contains any <code>Rules</code>.</p><p>To delete a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Update the <code>WebACL</code> to remove <code>Rules</code>, if any. For more information, see <a>UpdateWebACL</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteWebACL</code> request.</p></li><li><p>Submit a <code>DeleteWebACL</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFNonEmptyEntity`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafDeleteWebACLRequest
 @see AWSwafDeleteWebACLResponse
 */
- (void)deleteWebACL:(AWSwafDeleteWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an <a>XssMatchSet</a>. You can't delete an <code>XssMatchSet</code> if it's still used in any <code>Rules</code> or if it still contains any <a>XssMatchTuple</a> objects.</p><p>If you just want to remove an <code>XssMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete an <code>XssMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>XssMatchSet</code> to remove filters, if any. For more information, see <a>UpdateXssMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteXssMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteXssMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteXssMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafDeleteXssMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteXssMatchSetRequest
 @see AWSwafDeleteXssMatchSetResponse
 */
- (AWSTask<AWSwafDeleteXssMatchSetResponse *> *)deleteXssMatchSet:(AWSwafDeleteXssMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Permanently deletes an <a>XssMatchSet</a>. You can't delete an <code>XssMatchSet</code> if it's still used in any <code>Rules</code> or if it still contains any <a>XssMatchTuple</a> objects.</p><p>If you just want to remove an <code>XssMatchSet</code> from a <code>Rule</code>, use <a>UpdateRule</a>.</p><p>To permanently delete an <code>XssMatchSet</code> from AWS WAF, perform the following steps:</p><ol><li><p>Update the <code>XssMatchSet</code> to remove filters, if any. For more information, see <a>UpdateXssMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of a <code>DeleteXssMatchSet</code> request.</p></li><li><p>Submit a <code>DeleteXssMatchSet</code> request.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the DeleteXssMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonEmptyEntity`.
 
 @see AWSwafDeleteXssMatchSetRequest
 @see AWSwafDeleteXssMatchSetResponse
 */
- (void)deleteXssMatchSet:(AWSwafDeleteXssMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafDeleteXssMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>ByteMatchSet</a> specified by <code>ByteMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetByteMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetByteMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetByteMatchSetRequest
 @see AWSwafGetByteMatchSetResponse
 */
- (AWSTask<AWSwafGetByteMatchSetResponse *> *)getByteMatchSet:(AWSwafGetByteMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>ByteMatchSet</a> specified by <code>ByteMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetByteMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetByteMatchSetRequest
 @see AWSwafGetByteMatchSetResponse
 */
- (void)getByteMatchSet:(AWSwafGetByteMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetByteMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>When you want to create, update, or delete AWS WAF objects, get a change token and include the change token in the create, update, or delete request. Change tokens ensure that your application doesn't submit conflicting requests to AWS WAF.</p><p>Each create, update, or delete request must use a unique change token. If your application submits a <code>GetChangeToken</code> request and then submits a second <code>GetChangeToken</code> request before submitting a create, update, or delete request, the second <code>GetChangeToken</code> request returns the same value as the first <code>GetChangeToken</code> request.</p><p>When you use a change token in a create, update, or delete request, the status of the change token changes to <code>PENDING</code>, which indicates that AWS WAF is propagating the change to all AWS WAF servers. Use <code>GetChangeTokenStatus</code> to determine the status of your change token.</p>
 
 @param request A container for the necessary parameters to execute the GetChangeToken service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetChangeTokenResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`.
 
 @see AWSwafGetChangeTokenRequest
 @see AWSwafGetChangeTokenResponse
 */
- (AWSTask<AWSwafGetChangeTokenResponse *> *)getChangeToken:(AWSwafGetChangeTokenRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>When you want to create, update, or delete AWS WAF objects, get a change token and include the change token in the create, update, or delete request. Change tokens ensure that your application doesn't submit conflicting requests to AWS WAF.</p><p>Each create, update, or delete request must use a unique change token. If your application submits a <code>GetChangeToken</code> request and then submits a second <code>GetChangeToken</code> request before submitting a create, update, or delete request, the second <code>GetChangeToken</code> request returns the same value as the first <code>GetChangeToken</code> request.</p><p>When you use a change token in a create, update, or delete request, the status of the change token changes to <code>PENDING</code>, which indicates that AWS WAF is propagating the change to all AWS WAF servers. Use <code>GetChangeTokenStatus</code> to determine the status of your change token.</p>
 
 @param request A container for the necessary parameters to execute the GetChangeToken service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`.
 
 @see AWSwafGetChangeTokenRequest
 @see AWSwafGetChangeTokenResponse
 */
- (void)getChangeToken:(AWSwafGetChangeTokenRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetChangeTokenResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the status of a <code>ChangeToken</code> that you got by calling <a>GetChangeToken</a>. <code>ChangeTokenStatus</code> is one of the following values:</p><ul><li><p><code>PROVISIONED</code>: You requested the change token by calling <code>GetChangeToken</code>, but you haven't used it yet in a call to create, update, or delete an AWS WAF object.</p></li><li><p><code>PENDING</code>: AWS WAF is propagating the create, update, or delete request to all AWS WAF servers.</p></li><li><p><code>INSYNC</code>: Propagation is complete.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetChangeTokenStatus service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetChangeTokenStatusResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInternalError`.
 
 @see AWSwafGetChangeTokenStatusRequest
 @see AWSwafGetChangeTokenStatusResponse
 */
- (AWSTask<AWSwafGetChangeTokenStatusResponse *> *)getChangeTokenStatus:(AWSwafGetChangeTokenStatusRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the status of a <code>ChangeToken</code> that you got by calling <a>GetChangeToken</a>. <code>ChangeTokenStatus</code> is one of the following values:</p><ul><li><p><code>PROVISIONED</code>: You requested the change token by calling <code>GetChangeToken</code>, but you haven't used it yet in a call to create, update, or delete an AWS WAF object.</p></li><li><p><code>PENDING</code>: AWS WAF is propagating the create, update, or delete request to all AWS WAF servers.</p></li><li><p><code>INSYNC</code>: Propagation is complete.</p></li></ul>
 
 @param request A container for the necessary parameters to execute the GetChangeTokenStatus service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInternalError`.
 
 @see AWSwafGetChangeTokenStatusRequest
 @see AWSwafGetChangeTokenStatusResponse
 */
- (void)getChangeTokenStatus:(AWSwafGetChangeTokenStatusRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetChangeTokenStatusResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>GeoMatchSet</a> that is specified by <code>GeoMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetGeoMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetGeoMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetGeoMatchSetRequest
 @see AWSwafGetGeoMatchSetResponse
 */
- (AWSTask<AWSwafGetGeoMatchSetResponse *> *)getGeoMatchSet:(AWSwafGetGeoMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>GeoMatchSet</a> that is specified by <code>GeoMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetGeoMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetGeoMatchSetRequest
 @see AWSwafGetGeoMatchSetResponse
 */
- (void)getGeoMatchSet:(AWSwafGetGeoMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetGeoMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>IPSet</a> that is specified by <code>IPSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetIPSetRequest
 @see AWSwafGetIPSetResponse
 */
- (AWSTask<AWSwafGetIPSetResponse *> *)getIPSet:(AWSwafGetIPSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>IPSet</a> that is specified by <code>IPSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetIPSetRequest
 @see AWSwafGetIPSetResponse
 */
- (void)getIPSet:(AWSwafGetIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>LoggingConfiguration</a> for the specified web ACL.</p>
 
 @param request A container for the necessary parameters to execute the GetLoggingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetLoggingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetLoggingConfigurationRequest
 @see AWSwafGetLoggingConfigurationResponse
 */
- (AWSTask<AWSwafGetLoggingConfigurationResponse *> *)getLoggingConfiguration:(AWSwafGetLoggingConfigurationRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>LoggingConfiguration</a> for the specified web ACL.</p>
 
 @param request A container for the necessary parameters to execute the GetLoggingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetLoggingConfigurationRequest
 @see AWSwafGetLoggingConfigurationResponse
 */
- (void)getLoggingConfiguration:(AWSwafGetLoggingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetLoggingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the IAM policy attached to the RuleGroup.</p>
 
 @param request A container for the necessary parameters to execute the GetPermissionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetPermissionPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetPermissionPolicyRequest
 @see AWSwafGetPermissionPolicyResponse
 */
- (AWSTask<AWSwafGetPermissionPolicyResponse *> *)getPermissionPolicy:(AWSwafGetPermissionPolicyRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the IAM policy attached to the RuleGroup.</p>
 
 @param request A container for the necessary parameters to execute the GetPermissionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetPermissionPolicyRequest
 @see AWSwafGetPermissionPolicyResponse
 */
- (void)getPermissionPolicy:(AWSwafGetPermissionPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetPermissionPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RateBasedRule</a> that is specified by the <code>RuleId</code> that you included in the <code>GetRateBasedRule</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetRateBasedRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetRateBasedRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetRateBasedRuleRequest
 @see AWSwafGetRateBasedRuleResponse
 */
- (AWSTask<AWSwafGetRateBasedRuleResponse *> *)getRateBasedRule:(AWSwafGetRateBasedRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RateBasedRule</a> that is specified by the <code>RuleId</code> that you included in the <code>GetRateBasedRule</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetRateBasedRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetRateBasedRuleRequest
 @see AWSwafGetRateBasedRuleResponse
 */
- (void)getRateBasedRule:(AWSwafGetRateBasedRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetRateBasedRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of IP addresses currently being blocked by the <a>RateBasedRule</a> that is specified by the <code>RuleId</code>. The maximum number of managed keys that will be blocked is 10,000. If more than 10,000 addresses exceed the rate limit, the 10,000 addresses with the highest rates will be blocked.</p>
 
 @param request A container for the necessary parameters to execute the GetRateBasedRuleManagedKeys service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetRateBasedRuleManagedKeysResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInvalidParameter`.
 
 @see AWSwafGetRateBasedRuleManagedKeysRequest
 @see AWSwafGetRateBasedRuleManagedKeysResponse
 */
- (AWSTask<AWSwafGetRateBasedRuleManagedKeysResponse *> *)getRateBasedRuleManagedKeys:(AWSwafGetRateBasedRuleManagedKeysRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of IP addresses currently being blocked by the <a>RateBasedRule</a> that is specified by the <code>RuleId</code>. The maximum number of managed keys that will be blocked is 10,000. If more than 10,000 addresses exceed the rate limit, the 10,000 addresses with the highest rates will be blocked.</p>
 
 @param request A container for the necessary parameters to execute the GetRateBasedRuleManagedKeys service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInvalidParameter`.
 
 @see AWSwafGetRateBasedRuleManagedKeysRequest
 @see AWSwafGetRateBasedRuleManagedKeysResponse
 */
- (void)getRateBasedRuleManagedKeys:(AWSwafGetRateBasedRuleManagedKeysRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetRateBasedRuleManagedKeysResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RegexMatchSet</a> specified by <code>RegexMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetRegexMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetRegexMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetRegexMatchSetRequest
 @see AWSwafGetRegexMatchSetResponse
 */
- (AWSTask<AWSwafGetRegexMatchSetResponse *> *)getRegexMatchSet:(AWSwafGetRegexMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RegexMatchSet</a> specified by <code>RegexMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetRegexMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetRegexMatchSetRequest
 @see AWSwafGetRegexMatchSetResponse
 */
- (void)getRegexMatchSet:(AWSwafGetRegexMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetRegexMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RegexPatternSet</a> specified by <code>RegexPatternSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetRegexPatternSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetRegexPatternSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetRegexPatternSetRequest
 @see AWSwafGetRegexPatternSetResponse
 */
- (AWSTask<AWSwafGetRegexPatternSetResponse *> *)getRegexPatternSet:(AWSwafGetRegexPatternSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RegexPatternSet</a> specified by <code>RegexPatternSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetRegexPatternSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetRegexPatternSetRequest
 @see AWSwafGetRegexPatternSetResponse
 */
- (void)getRegexPatternSet:(AWSwafGetRegexPatternSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetRegexPatternSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>Rule</a> that is specified by the <code>RuleId</code> that you included in the <code>GetRule</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetRuleRequest
 @see AWSwafGetRuleResponse
 */
- (AWSTask<AWSwafGetRuleResponse *> *)getRule:(AWSwafGetRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>Rule</a> that is specified by the <code>RuleId</code> that you included in the <code>GetRule</code> request.</p>
 
 @param request A container for the necessary parameters to execute the GetRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetRuleRequest
 @see AWSwafGetRuleResponse
 */
- (void)getRule:(AWSwafGetRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RuleGroup</a> that is specified by the <code>RuleGroupId</code> that you included in the <code>GetRuleGroup</code> request.</p><p>To view the rules in a rule group, use <a>ListActivatedRulesInRuleGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetRuleGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetRuleGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetRuleGroupRequest
 @see AWSwafGetRuleGroupResponse
 */
- (AWSTask<AWSwafGetRuleGroupResponse *> *)getRuleGroup:(AWSwafGetRuleGroupRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>RuleGroup</a> that is specified by the <code>RuleGroupId</code> that you included in the <code>GetRuleGroup</code> request.</p><p>To view the rules in a rule group, use <a>ListActivatedRulesInRuleGroup</a>.</p>
 
 @param request A container for the necessary parameters to execute the GetRuleGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetRuleGroupRequest
 @see AWSwafGetRuleGroupResponse
 */
- (void)getRuleGroup:(AWSwafGetRuleGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetRuleGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Gets detailed information about a specified number of requests--a sample--that AWS WAF randomly selects from among the first 5,000 requests that your AWS resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours.</p><p><code>GetSampledRequests</code> returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, <code>GetSampledRequests</code> returns an updated time range. This new time range indicates the actual period during which AWS WAF selected the requests in the sample.</p>
 
 @param request A container for the necessary parameters to execute the GetSampledRequests service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetSampledRequestsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInternalError`.
 
 @see AWSwafGetSampledRequestsRequest
 @see AWSwafGetSampledRequestsResponse
 */
- (AWSTask<AWSwafGetSampledRequestsResponse *> *)getSampledRequests:(AWSwafGetSampledRequestsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Gets detailed information about a specified number of requests--a sample--that AWS WAF randomly selects from among the first 5,000 requests that your AWS resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours.</p><p><code>GetSampledRequests</code> returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, <code>GetSampledRequests</code> returns an updated time range. This new time range indicates the actual period during which AWS WAF selected the requests in the sample.</p>
 
 @param request A container for the necessary parameters to execute the GetSampledRequests service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInternalError`.
 
 @see AWSwafGetSampledRequestsRequest
 @see AWSwafGetSampledRequestsResponse
 */
- (void)getSampledRequests:(AWSwafGetSampledRequestsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetSampledRequestsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>SizeConstraintSet</a> specified by <code>SizeConstraintSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSizeConstraintSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetSizeConstraintSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetSizeConstraintSetRequest
 @see AWSwafGetSizeConstraintSetResponse
 */
- (AWSTask<AWSwafGetSizeConstraintSetResponse *> *)getSizeConstraintSet:(AWSwafGetSizeConstraintSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>SizeConstraintSet</a> specified by <code>SizeConstraintSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSizeConstraintSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetSizeConstraintSetRequest
 @see AWSwafGetSizeConstraintSetResponse
 */
- (void)getSizeConstraintSet:(AWSwafGetSizeConstraintSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetSizeConstraintSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>SqlInjectionMatchSet</a> that is specified by <code>SqlInjectionMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSqlInjectionMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetSqlInjectionMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetSqlInjectionMatchSetRequest
 @see AWSwafGetSqlInjectionMatchSetResponse
 */
- (AWSTask<AWSwafGetSqlInjectionMatchSetResponse *> *)getSqlInjectionMatchSet:(AWSwafGetSqlInjectionMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>SqlInjectionMatchSet</a> that is specified by <code>SqlInjectionMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetSqlInjectionMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetSqlInjectionMatchSetRequest
 @see AWSwafGetSqlInjectionMatchSetResponse
 */
- (void)getSqlInjectionMatchSet:(AWSwafGetSqlInjectionMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetSqlInjectionMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>WebACL</a> that is specified by <code>WebACLId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetWebACLRequest
 @see AWSwafGetWebACLResponse
 */
- (AWSTask<AWSwafGetWebACLResponse *> *)getWebACL:(AWSwafGetWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>WebACL</a> that is specified by <code>WebACLId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetWebACLRequest
 @see AWSwafGetWebACLResponse
 */
- (void)getWebACL:(AWSwafGetWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>XssMatchSet</a> that is specified by <code>XssMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetXssMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafGetXssMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetXssMatchSetRequest
 @see AWSwafGetXssMatchSetResponse
 */
- (AWSTask<AWSwafGetXssMatchSetResponse *> *)getXssMatchSet:(AWSwafGetXssMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns the <a>XssMatchSet</a> that is specified by <code>XssMatchSetId</code>.</p>
 
 @param request A container for the necessary parameters to execute the GetXssMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFNonexistentItem`.
 
 @see AWSwafGetXssMatchSetRequest
 @see AWSwafGetXssMatchSetResponse
 */
- (void)getXssMatchSet:(AWSwafGetXssMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafGetXssMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>ActivatedRule</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListActivatedRulesInRuleGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListActivatedRulesInRuleGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInvalidParameter`.
 
 @see AWSwafListActivatedRulesInRuleGroupRequest
 @see AWSwafListActivatedRulesInRuleGroupResponse
 */
- (AWSTask<AWSwafListActivatedRulesInRuleGroupResponse *> *)listActivatedRulesInRuleGroup:(AWSwafListActivatedRulesInRuleGroupRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>ActivatedRule</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListActivatedRulesInRuleGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInvalidParameter`.
 
 @see AWSwafListActivatedRulesInRuleGroupRequest
 @see AWSwafListActivatedRulesInRuleGroupResponse
 */
- (void)listActivatedRulesInRuleGroup:(AWSwafListActivatedRulesInRuleGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListActivatedRulesInRuleGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>ByteMatchSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListByteMatchSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListByteMatchSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListByteMatchSetsRequest
 @see AWSwafListByteMatchSetsResponse
 */
- (AWSTask<AWSwafListByteMatchSetsResponse *> *)listByteMatchSets:(AWSwafListByteMatchSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>ByteMatchSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListByteMatchSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListByteMatchSetsRequest
 @see AWSwafListByteMatchSetsResponse
 */
- (void)listByteMatchSets:(AWSwafListByteMatchSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListByteMatchSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>GeoMatchSetSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListGeoMatchSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListGeoMatchSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListGeoMatchSetsRequest
 @see AWSwafListGeoMatchSetsResponse
 */
- (AWSTask<AWSwafListGeoMatchSetsResponse *> *)listGeoMatchSets:(AWSwafListGeoMatchSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>GeoMatchSetSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListGeoMatchSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListGeoMatchSetsRequest
 @see AWSwafListGeoMatchSetsResponse
 */
- (void)listGeoMatchSets:(AWSwafListGeoMatchSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListGeoMatchSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>IPSetSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListIPSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListIPSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListIPSetsRequest
 @see AWSwafListIPSetsResponse
 */
- (AWSTask<AWSwafListIPSetsResponse *> *)listIPSets:(AWSwafListIPSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>IPSetSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListIPSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListIPSetsRequest
 @see AWSwafListIPSetsResponse
 */
- (void)listIPSets:(AWSwafListIPSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListIPSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>LoggingConfiguration</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListLoggingConfigurations service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListLoggingConfigurationsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInvalidParameter`.
 
 @see AWSwafListLoggingConfigurationsRequest
 @see AWSwafListLoggingConfigurationsResponse
 */
- (AWSTask<AWSwafListLoggingConfigurationsResponse *> *)listLoggingConfigurations:(AWSwafListLoggingConfigurationsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>LoggingConfiguration</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListLoggingConfigurations service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInvalidParameter`.
 
 @see AWSwafListLoggingConfigurationsRequest
 @see AWSwafListLoggingConfigurationsResponse
 */
- (void)listLoggingConfigurations:(AWSwafListLoggingConfigurationsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListLoggingConfigurationsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRateBasedRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListRateBasedRulesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListRateBasedRulesRequest
 @see AWSwafListRateBasedRulesResponse
 */
- (AWSTask<AWSwafListRateBasedRulesResponse *> *)listRateBasedRules:(AWSwafListRateBasedRulesRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRateBasedRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListRateBasedRulesRequest
 @see AWSwafListRateBasedRulesResponse
 */
- (void)listRateBasedRules:(AWSwafListRateBasedRulesRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListRateBasedRulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RegexMatchSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRegexMatchSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListRegexMatchSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListRegexMatchSetsRequest
 @see AWSwafListRegexMatchSetsResponse
 */
- (AWSTask<AWSwafListRegexMatchSetsResponse *> *)listRegexMatchSets:(AWSwafListRegexMatchSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RegexMatchSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRegexMatchSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListRegexMatchSetsRequest
 @see AWSwafListRegexMatchSetsResponse
 */
- (void)listRegexMatchSets:(AWSwafListRegexMatchSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListRegexMatchSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RegexPatternSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRegexPatternSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListRegexPatternSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListRegexPatternSetsRequest
 @see AWSwafListRegexPatternSetsResponse
 */
- (AWSTask<AWSwafListRegexPatternSetsResponse *> *)listRegexPatternSets:(AWSwafListRegexPatternSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RegexPatternSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRegexPatternSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListRegexPatternSetsRequest
 @see AWSwafListRegexPatternSetsResponse
 */
- (void)listRegexPatternSets:(AWSwafListRegexPatternSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListRegexPatternSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleGroup</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRuleGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListRuleGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`.
 
 @see AWSwafListRuleGroupsRequest
 @see AWSwafListRuleGroupsResponse
 */
- (AWSTask<AWSwafListRuleGroupsResponse *> *)listRuleGroups:(AWSwafListRuleGroupsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleGroup</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRuleGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`.
 
 @see AWSwafListRuleGroupsRequest
 @see AWSwafListRuleGroupsResponse
 */
- (void)listRuleGroups:(AWSwafListRuleGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListRuleGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRules service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListRulesResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListRulesRequest
 @see AWSwafListRulesResponse
 */
- (AWSTask<AWSwafListRulesResponse *> *)listRules:(AWSwafListRulesRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListRules service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListRulesRequest
 @see AWSwafListRulesResponse
 */
- (void)listRules:(AWSwafListRulesRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListRulesResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>SizeConstraintSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListSizeConstraintSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListSizeConstraintSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListSizeConstraintSetsRequest
 @see AWSwafListSizeConstraintSetsResponse
 */
- (AWSTask<AWSwafListSizeConstraintSetsResponse *> *)listSizeConstraintSets:(AWSwafListSizeConstraintSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>SizeConstraintSetSummary</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListSizeConstraintSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListSizeConstraintSetsRequest
 @see AWSwafListSizeConstraintSetsResponse
 */
- (void)listSizeConstraintSets:(AWSwafListSizeConstraintSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListSizeConstraintSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>SqlInjectionMatchSet</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListSqlInjectionMatchSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListSqlInjectionMatchSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListSqlInjectionMatchSetsRequest
 @see AWSwafListSqlInjectionMatchSetsResponse
 */
- (AWSTask<AWSwafListSqlInjectionMatchSetsResponse *> *)listSqlInjectionMatchSets:(AWSwafListSqlInjectionMatchSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>SqlInjectionMatchSet</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListSqlInjectionMatchSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListSqlInjectionMatchSetsRequest
 @see AWSwafListSqlInjectionMatchSetsResponse
 */
- (void)listSqlInjectionMatchSets:(AWSwafListSqlInjectionMatchSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListSqlInjectionMatchSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleGroup</a> objects that you are subscribed to.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscribedRuleGroups service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListSubscribedRuleGroupsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInternalError`.
 
 @see AWSwafListSubscribedRuleGroupsRequest
 @see AWSwafListSubscribedRuleGroupsResponse
 */
- (AWSTask<AWSwafListSubscribedRuleGroupsResponse *> *)listSubscribedRuleGroups:(AWSwafListSubscribedRuleGroupsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>RuleGroup</a> objects that you are subscribed to.</p>
 
 @param request A container for the necessary parameters to execute the ListSubscribedRuleGroups service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInternalError`.
 
 @see AWSwafListSubscribedRuleGroupsRequest
 @see AWSwafListSubscribedRuleGroupsResponse
 */
- (void)listSubscribedRuleGroups:(AWSwafListSubscribedRuleGroupsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListSubscribedRuleGroupsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Retrieves the tags associated with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.</p><p>Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListTagsForResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFBadRequest`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafListTagsForResourceRequest
 @see AWSwafListTagsForResourceResponse
 */
- (AWSTask<AWSwafListTagsForResourceResponse *> *)listTagsForResource:(AWSwafListTagsForResourceRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Retrieves the tags associated with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.</p><p>Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. </p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFBadRequest`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafListTagsForResourceRequest
 @see AWSwafListTagsForResourceResponse
 */
- (void)listTagsForResource:(AWSwafListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListTagsForResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>WebACLSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListWebACLs service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListWebACLsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListWebACLsRequest
 @see AWSwafListWebACLsResponse
 */
- (AWSTask<AWSwafListWebACLsResponse *> *)listWebACLs:(AWSwafListWebACLsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>WebACLSummary</a> objects in the response.</p>
 
 @param request A container for the necessary parameters to execute the ListWebACLs service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListWebACLsRequest
 @see AWSwafListWebACLsResponse
 */
- (void)listWebACLs:(AWSwafListWebACLsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListWebACLsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>XssMatchSet</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListXssMatchSets service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafListXssMatchSetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListXssMatchSetsRequest
 @see AWSwafListXssMatchSetsResponse
 */
- (AWSTask<AWSwafListXssMatchSetsResponse *> *)listXssMatchSets:(AWSwafListXssMatchSetsRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returns an array of <a>XssMatchSet</a> objects.</p>
 
 @param request A container for the necessary parameters to execute the ListXssMatchSets service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafListXssMatchSetsRequest
 @see AWSwafListXssMatchSetsResponse
 */
- (void)listXssMatchSets:(AWSwafListXssMatchSetsRequest *)request completionHandler:(void (^ _Nullable)(AWSwafListXssMatchSetsResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Associates a <a>LoggingConfiguration</a> with a specified web ACL.</p><p>You can access information about all traffic that AWS WAF inspects using the following steps:</p><ol><li><p>Create an Amazon Kinesis Data Firehose. </p><p>Create the data firehose with a PUT source and in the region that you are operating. However, if you are capturing logs for Amazon CloudFront, always create the firehose in US East (N. Virginia). </p><note><p>Do not create the data firehose using a <code>Kinesis stream</code> as your source.</p></note></li><li><p>Associate that firehose to your web ACL using a <code>PutLoggingConfiguration</code> request.</p></li></ol><p>When you successfully enable logging using a <code>PutLoggingConfiguration</code> request, AWS WAF will create a service linked role with the necessary permissions to write logs to the Amazon Kinesis Data Firehose. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging Web ACL Traffic Information</a> in the <i>AWS WAF Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutLoggingConfiguration service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafPutLoggingConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFServiceLinkedRoleError`.
 
 @see AWSwafPutLoggingConfigurationRequest
 @see AWSwafPutLoggingConfigurationResponse
 */
- (AWSTask<AWSwafPutLoggingConfigurationResponse *> *)putLoggingConfiguration:(AWSwafPutLoggingConfigurationRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Associates a <a>LoggingConfiguration</a> with a specified web ACL.</p><p>You can access information about all traffic that AWS WAF inspects using the following steps:</p><ol><li><p>Create an Amazon Kinesis Data Firehose. </p><p>Create the data firehose with a PUT source and in the region that you are operating. However, if you are capturing logs for Amazon CloudFront, always create the firehose in US East (N. Virginia). </p><note><p>Do not create the data firehose using a <code>Kinesis stream</code> as your source.</p></note></li><li><p>Associate that firehose to your web ACL using a <code>PutLoggingConfiguration</code> request.</p></li></ol><p>When you successfully enable logging using a <code>PutLoggingConfiguration</code> request, AWS WAF will create a service linked role with the necessary permissions to write logs to the Amazon Kinesis Data Firehose. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging Web ACL Traffic Information</a> in the <i>AWS WAF Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the PutLoggingConfiguration service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFServiceLinkedRoleError`.
 
 @see AWSwafPutLoggingConfigurationRequest
 @see AWSwafPutLoggingConfigurationResponse
 */
- (void)putLoggingConfiguration:(AWSwafPutLoggingConfigurationRequest *)request completionHandler:(void (^ _Nullable)(AWSwafPutLoggingConfigurationResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Attaches an IAM policy to the specified resource. The only supported use for this action is to share a RuleGroup across accounts.</p><p>The <code>PutPermissionPolicy</code> is subject to the following restrictions:</p><ul><li><p>You can attach only one policy with each <code>PutPermissionPolicy</code> request.</p></li><li><p>The policy must include an <code>Effect</code>, <code>Action</code> and <code>Principal</code>. </p></li><li><p><code>Effect</code> must specify <code>Allow</code>.</p></li><li><p>The <code>Action</code> in the policy must be <code>waf:UpdateWebACL</code>, <code>waf-regional:UpdateWebACL</code>, <code>waf:GetRuleGroup</code> and <code>waf-regional:GetRuleGroup</code> . Any extra or wildcard actions in the policy will be rejected.</p></li><li><p>The policy cannot include a <code>Resource</code> parameter.</p></li><li><p>The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in the same region.</p></li><li><p>The user making the request must be the owner of the RuleGroup.</p></li><li><p>Your policy must be composed using IAM Policy version 2012-10-17.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html">IAM Policies</a>. </p><p>An example of a valid policy parameter is shown in the Examples section below.</p>
 
 @param request A container for the necessary parameters to execute the PutPermissionPolicy service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafPutPermissionPolicyResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInvalidPermissionPolicy`.
 
 @see AWSwafPutPermissionPolicyRequest
 @see AWSwafPutPermissionPolicyResponse
 */
- (AWSTask<AWSwafPutPermissionPolicyResponse *> *)putPermissionPolicy:(AWSwafPutPermissionPolicyRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Attaches an IAM policy to the specified resource. The only supported use for this action is to share a RuleGroup across accounts.</p><p>The <code>PutPermissionPolicy</code> is subject to the following restrictions:</p><ul><li><p>You can attach only one policy with each <code>PutPermissionPolicy</code> request.</p></li><li><p>The policy must include an <code>Effect</code>, <code>Action</code> and <code>Principal</code>. </p></li><li><p><code>Effect</code> must specify <code>Allow</code>.</p></li><li><p>The <code>Action</code> in the policy must be <code>waf:UpdateWebACL</code>, <code>waf-regional:UpdateWebACL</code>, <code>waf:GetRuleGroup</code> and <code>waf-regional:GetRuleGroup</code> . Any extra or wildcard actions in the policy will be rejected.</p></li><li><p>The policy cannot include a <code>Resource</code> parameter.</p></li><li><p>The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in the same region.</p></li><li><p>The user making the request must be the owner of the RuleGroup.</p></li><li><p>Your policy must be composed using IAM Policy version 2012-10-17.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html">IAM Policies</a>. </p><p>An example of a valid policy parameter is shown in the Examples section below.</p>
 
 @param request A container for the necessary parameters to execute the PutPermissionPolicy service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInvalidPermissionPolicy`.
 
 @see AWSwafPutPermissionPolicyRequest
 @see AWSwafPutPermissionPolicyResponse
 */
- (void)putPermissionPolicy:(AWSwafPutPermissionPolicyRequest *)request completionHandler:(void (^ _Nullable)(AWSwafPutPermissionPolicyResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Associates tags with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.</p><p>Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can use this action to tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafTagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFBadRequest`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafTagResourceRequest
 @see AWSwafTagResourceResponse
 */
- (AWSTask<AWSwafTagResourceResponse *> *)tagResource:(AWSwafTagResourceRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Associates tags with the specified AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.</p><p>Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can use this action to tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. </p>
 
 @param request A container for the necessary parameters to execute the TagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFBadRequest`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafTagResourceRequest
 @see AWSwafTagResourceResponse
 */
- (void)tagResource:(AWSwafTagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSwafTagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p/>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUntagResourceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFBadRequest`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafUntagResourceRequest
 @see AWSwafUntagResourceResponse
 */
- (AWSTask<AWSwafUntagResourceResponse *> *)untagResource:(AWSwafUntagResourceRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p/>
 
 @param request A container for the necessary parameters to execute the UntagResource service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFBadRequest`, `AWSwafErrorWAFTagOperation`, `AWSwafErrorWAFTagOperationInternalError`.
 
 @see AWSwafUntagResourceRequest
 @see AWSwafUntagResourceResponse
 */
- (void)untagResource:(AWSwafUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUntagResourceResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ByteMatchTuple</a> objects (filters) in a <a>ByteMatchSet</a>. For each <code>ByteMatchTuple</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>ByteMatchSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the <code>User-Agent</code> header. </p></li><li><p>The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to look for. For more information, including how you specify the values for the AWS WAF API and the AWS CLI or SDKs, see <code>TargetString</code> in the <a>ByteMatchTuple</a> data type. </p></li><li><p>Where to look, such as at the beginning or the end of a query string.</p></li><li><p>Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.</p></li></ul><p>For example, you can add a <code>ByteMatchSetUpdate</code> object that matches web requests in which <code>User-Agent</code> headers contain the string <code>BadBot</code>. You can then configure AWS WAF to block those requests.</p><p>To create and configure a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Create a <code>ByteMatchSet.</code> For more information, see <a>CreateByteMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateByteMatchSet</code> request.</p></li><li><p>Submit an <code>UpdateByteMatchSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateByteMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateByteMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateByteMatchSetRequest
 @see AWSwafUpdateByteMatchSetResponse
 */
- (AWSTask<AWSwafUpdateByteMatchSetResponse *> *)updateByteMatchSet:(AWSwafUpdateByteMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ByteMatchTuple</a> objects (filters) in a <a>ByteMatchSet</a>. For each <code>ByteMatchTuple</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>ByteMatchSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the <code>User-Agent</code> header. </p></li><li><p>The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to look for. For more information, including how you specify the values for the AWS WAF API and the AWS CLI or SDKs, see <code>TargetString</code> in the <a>ByteMatchTuple</a> data type. </p></li><li><p>Where to look, such as at the beginning or the end of a query string.</p></li><li><p>Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.</p></li></ul><p>For example, you can add a <code>ByteMatchSetUpdate</code> object that matches web requests in which <code>User-Agent</code> headers contain the string <code>BadBot</code>. You can then configure AWS WAF to block those requests.</p><p>To create and configure a <code>ByteMatchSet</code>, perform the following steps:</p><ol><li><p>Create a <code>ByteMatchSet.</code> For more information, see <a>CreateByteMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateByteMatchSet</code> request.</p></li><li><p>Submit an <code>UpdateByteMatchSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateByteMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateByteMatchSetRequest
 @see AWSwafUpdateByteMatchSetResponse
 */
- (void)updateByteMatchSet:(AWSwafUpdateByteMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateByteMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>GeoMatchConstraint</a> objects in an <code>GeoMatchSet</code>. For each <code>GeoMatchConstraint</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change an <code>GeoMatchConstraint</code> object, you delete the existing object and add a new one.</p></li><li><p>The <code>Type</code>. The only valid value for <code>Type</code> is <code>Country</code>.</p></li><li><p>The <code>Value</code>, which is a two character code for the country to add to the <code>GeoMatchConstraint</code> object. Valid codes are listed in <a>GeoMatchConstraint$Value</a>.</p></li></ul><p>To create and configure an <code>GeoMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateGeoMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateGeoMatchSet</a> request.</p></li><li><p>Submit an <code>UpdateGeoMatchSet</code> request to specify the country that you want AWS WAF to watch for.</p></li></ol><p>When you update an <code>GeoMatchSet</code>, you specify the country that you want to add and/or the country that you want to delete. If you want to change a country, you delete the existing country and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGeoMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateGeoMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateGeoMatchSetRequest
 @see AWSwafUpdateGeoMatchSetResponse
 */
- (AWSTask<AWSwafUpdateGeoMatchSetResponse *> *)updateGeoMatchSet:(AWSwafUpdateGeoMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>GeoMatchConstraint</a> objects in an <code>GeoMatchSet</code>. For each <code>GeoMatchConstraint</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change an <code>GeoMatchConstraint</code> object, you delete the existing object and add a new one.</p></li><li><p>The <code>Type</code>. The only valid value for <code>Type</code> is <code>Country</code>.</p></li><li><p>The <code>Value</code>, which is a two character code for the country to add to the <code>GeoMatchConstraint</code> object. Valid codes are listed in <a>GeoMatchConstraint$Value</a>.</p></li></ul><p>To create and configure an <code>GeoMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateGeoMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateGeoMatchSet</a> request.</p></li><li><p>Submit an <code>UpdateGeoMatchSet</code> request to specify the country that you want AWS WAF to watch for.</p></li></ol><p>When you update an <code>GeoMatchSet</code>, you specify the country that you want to add and/or the country that you want to delete. If you want to change a country, you delete the existing country and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateGeoMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateGeoMatchSetRequest
 @see AWSwafUpdateGeoMatchSetResponse
 */
- (void)updateGeoMatchSet:(AWSwafUpdateGeoMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateGeoMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>IPSetDescriptor</a> objects in an <code>IPSet</code>. For each <code>IPSetDescriptor</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change an <code>IPSetDescriptor</code> object, you delete the existing object and add a new one.</p></li><li><p>The IP address version, <code>IPv4</code> or <code>IPv6</code>. </p></li><li><p>The IP address in CIDR notation, for example, <code>192.0.2.0/24</code> (for the range of IP addresses from <code>192.0.2.0</code> to <code>192.0.2.255</code>) or <code>192.0.2.44/32</code> (for the individual IP address <code>192.0.2.44</code>). </p></li></ul><p>AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128. For more information about CIDR notation, see the Wikipedia entry <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless Inter-Domain Routing</a>.</p><p>IPv6 addresses can be represented using any of the following formats:</p><ul><li><p>1111:0000:0000:0000:0000:0000:0000:0111/128</p></li><li><p>1111:0:0:0:0:0:0:0111/128</p></li><li><p>1111::0111/128</p></li><li><p>1111::111/128</p></li></ul><p>You use an <code>IPSet</code> to specify which web requests you want to allow or block based on the IP addresses that the requests originated from. For example, if you're receiving a lot of requests from one or a small number of IP addresses and you want to block the requests, you can create an <code>IPSet</code> that specifies those IP addresses, and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>IPSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateIPSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateIPSet</code> request to specify the IP addresses that you want AWS WAF to watch for.</p></li></ol><p>When you update an <code>IPSet</code>, you specify the IP addresses that you want to add and/or the IP addresses that you want to delete. If you want to change an IP address, you delete the existing IP address and add the new one.</p><p>You can insert a maximum of 1000 addresses in a single request.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIPSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateIPSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateIPSetRequest
 @see AWSwafUpdateIPSetResponse
 */
- (AWSTask<AWSwafUpdateIPSetResponse *> *)updateIPSet:(AWSwafUpdateIPSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>IPSetDescriptor</a> objects in an <code>IPSet</code>. For each <code>IPSetDescriptor</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change an <code>IPSetDescriptor</code> object, you delete the existing object and add a new one.</p></li><li><p>The IP address version, <code>IPv4</code> or <code>IPv6</code>. </p></li><li><p>The IP address in CIDR notation, for example, <code>192.0.2.0/24</code> (for the range of IP addresses from <code>192.0.2.0</code> to <code>192.0.2.255</code>) or <code>192.0.2.44/32</code> (for the individual IP address <code>192.0.2.44</code>). </p></li></ul><p>AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128. For more information about CIDR notation, see the Wikipedia entry <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless Inter-Domain Routing</a>.</p><p>IPv6 addresses can be represented using any of the following formats:</p><ul><li><p>1111:0000:0000:0000:0000:0000:0000:0111/128</p></li><li><p>1111:0:0:0:0:0:0:0111/128</p></li><li><p>1111::0111/128</p></li><li><p>1111::111/128</p></li></ul><p>You use an <code>IPSet</code> to specify which web requests you want to allow or block based on the IP addresses that the requests originated from. For example, if you're receiving a lot of requests from one or a small number of IP addresses and you want to block the requests, you can create an <code>IPSet</code> that specifies those IP addresses, and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>IPSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateIPSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateIPSet</code> request to specify the IP addresses that you want AWS WAF to watch for.</p></li></ol><p>When you update an <code>IPSet</code>, you specify the IP addresses that you want to add and/or the IP addresses that you want to delete. If you want to change an IP address, you delete the existing IP address and add the new one.</p><p>You can insert a maximum of 1000 addresses in a single request.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateIPSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateIPSetRequest
 @see AWSwafUpdateIPSetResponse
 */
- (void)updateIPSet:(AWSwafUpdateIPSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateIPSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>Predicate</a> objects in a rule and updates the <code>RateLimit</code> in the rule. </p><p>Each <code>Predicate</code> object identifies a predicate, such as a <a>ByteMatchSet</a> or an <a>IPSet</a>, that specifies the web requests that you want to block or count. The <code>RateLimit</code> specifies the number of requests every five minutes that triggers the rule.</p><p>If you add more than one predicate to a <code>RateBasedRule</code>, a request must match all the predicates and exceed the <code>RateLimit</code> to be counted or blocked. For example, suppose you add the following to a <code>RateBasedRule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>You then add the <code>RateBasedRule</code> to a <code>WebACL</code> and specify that you want to block requests that satisfy the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>. Further, requests that match these two conditions much be received at a rate of more than 1,000 every five minutes. If the rate drops below this limit, AWS WAF no longer blocks the requests.</p><p>As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a <code>RateBasedRule</code>:</p><ul><li><p>A <code>ByteMatchSet</code> with <code>FieldToMatch</code> of <code>URI</code></p></li><li><p>A <code>PositionalConstraint</code> of <code>STARTS_WITH</code></p></li><li><p>A <code>TargetString</code> of <code>login</code></p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>By adding this <code>RateBasedRule</code> to a <code>WebACL</code>, you could limit requests to your login page without affecting the rest of your site.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRateBasedRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateRateBasedRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateRateBasedRuleRequest
 @see AWSwafUpdateRateBasedRuleResponse
 */
- (AWSTask<AWSwafUpdateRateBasedRuleResponse *> *)updateRateBasedRule:(AWSwafUpdateRateBasedRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>Predicate</a> objects in a rule and updates the <code>RateLimit</code> in the rule. </p><p>Each <code>Predicate</code> object identifies a predicate, such as a <a>ByteMatchSet</a> or an <a>IPSet</a>, that specifies the web requests that you want to block or count. The <code>RateLimit</code> specifies the number of requests every five minutes that triggers the rule.</p><p>If you add more than one predicate to a <code>RateBasedRule</code>, a request must match all the predicates and exceed the <code>RateLimit</code> to be counted or blocked. For example, suppose you add the following to a <code>RateBasedRule</code>:</p><ul><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44/32</code></p></li><li><p>A <code>ByteMatchSet</code> that matches <code>BadBot</code> in the <code>User-Agent</code> header</p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>You then add the <code>RateBasedRule</code> to a <code>WebACL</code> and specify that you want to block requests that satisfy the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 <i>and</i> the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code>. Further, requests that match these two conditions much be received at a rate of more than 1,000 every five minutes. If the rate drops below this limit, AWS WAF no longer blocks the requests.</p><p>As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a <code>RateBasedRule</code>:</p><ul><li><p>A <code>ByteMatchSet</code> with <code>FieldToMatch</code> of <code>URI</code></p></li><li><p>A <code>PositionalConstraint</code> of <code>STARTS_WITH</code></p></li><li><p>A <code>TargetString</code> of <code>login</code></p></li></ul><p>Further, you specify a <code>RateLimit</code> of 1,000.</p><p>By adding this <code>RateBasedRule</code> to a <code>WebACL</code>, you could limit requests to your login page without affecting the rest of your site.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRateBasedRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateRateBasedRuleRequest
 @see AWSwafUpdateRateBasedRuleResponse
 */
- (void)updateRateBasedRule:(AWSwafUpdateRateBasedRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateRateBasedRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>RegexMatchTuple</a> objects (filters) in a <a>RegexMatchSet</a>. For each <code>RegexMatchSetUpdate</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>RegexMatchSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to inspectupdate, such as a query string or the value of the <code>User-Agent</code> header. </p></li><li><p>The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see <a>RegexPatternSet</a>. </p></li><li><p>Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.</p></li></ul><p> For example, you can create a <code>RegexPatternSet</code> that matches any requests with <code>User-Agent</code> headers that contain the string <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Create a <code>RegexMatchSet.</code> For more information, see <a>CreateRegexMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexMatchSet</code> request.</p></li><li><p>Submit an <code>UpdateRegexMatchSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the identifier of the <code>RegexPatternSet</code> that contain the regular expression patters you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegexMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateRegexMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafUpdateRegexMatchSetRequest
 @see AWSwafUpdateRegexMatchSetResponse
 */
- (AWSTask<AWSwafUpdateRegexMatchSetResponse *> *)updateRegexMatchSet:(AWSwafUpdateRegexMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>RegexMatchTuple</a> objects (filters) in a <a>RegexMatchSet</a>. For each <code>RegexMatchSetUpdate</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>RegexMatchSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to inspectupdate, such as a query string or the value of the <code>User-Agent</code> header. </p></li><li><p>The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see <a>RegexPatternSet</a>. </p></li><li><p>Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.</p></li></ul><p> For example, you can create a <code>RegexPatternSet</code> that matches any requests with <code>User-Agent</code> headers that contain the string <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p><p>To create and configure a <code>RegexMatchSet</code>, perform the following steps:</p><ol><li><p>Create a <code>RegexMatchSet.</code> For more information, see <a>CreateRegexMatchSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexMatchSet</code> request.</p></li><li><p>Submit an <code>UpdateRegexMatchSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the identifier of the <code>RegexPatternSet</code> that contain the regular expression patters you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegexMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFDisallowedName`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidAccount`.
 
 @see AWSwafUpdateRegexMatchSetRequest
 @see AWSwafUpdateRegexMatchSetResponse
 */
- (void)updateRegexMatchSet:(AWSwafUpdateRegexMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateRegexMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <code>RegexPatternString</code> objects in a <a>RegexPatternSet</a>. For each <code>RegexPatternString</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the <code>RegexPatternString</code>.</p></li><li><p>The regular expression pattern that you want to insert or delete. For more information, see <a>RegexPatternSet</a>. </p></li></ul><p> For example, you can create a <code>RegexPatternString</code> such as <code>B[a@]dB[o0]t</code>. AWS WAF will match this <code>RegexPatternString</code> to:</p><ul><li><p>BadBot</p></li><li><p>BadB0t</p></li><li><p>B@dBot</p></li><li><p>B@dB0t</p></li></ul><p>To create and configure a <code>RegexPatternSet</code>, perform the following steps:</p><ol><li><p>Create a <code>RegexPatternSet.</code> For more information, see <a>CreateRegexPatternSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexPatternSet</code> request.</p></li><li><p>Submit an <code>UpdateRegexPatternSet</code> request to specify the regular expression pattern that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegexPatternSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateRegexPatternSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidRegexPattern`.
 
 @see AWSwafUpdateRegexPatternSetRequest
 @see AWSwafUpdateRegexPatternSetResponse
 */
- (AWSTask<AWSwafUpdateRegexPatternSetResponse *> *)updateRegexPatternSet:(AWSwafUpdateRegexPatternSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <code>RegexPatternString</code> objects in a <a>RegexPatternSet</a>. For each <code>RegexPatternString</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the <code>RegexPatternString</code>.</p></li><li><p>The regular expression pattern that you want to insert or delete. For more information, see <a>RegexPatternSet</a>. </p></li></ul><p> For example, you can create a <code>RegexPatternString</code> such as <code>B[a@]dB[o0]t</code>. AWS WAF will match this <code>RegexPatternString</code> to:</p><ul><li><p>BadBot</p></li><li><p>BadB0t</p></li><li><p>B@dBot</p></li><li><p>B@dB0t</p></li></ul><p>To create and configure a <code>RegexPatternSet</code>, perform the following steps:</p><ol><li><p>Create a <code>RegexPatternSet.</code> For more information, see <a>CreateRegexPatternSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateRegexPatternSet</code> request.</p></li><li><p>Submit an <code>UpdateRegexPatternSet</code> request to specify the regular expression pattern that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRegexPatternSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidRegexPattern`.
 
 @see AWSwafUpdateRegexPatternSetRequest
 @see AWSwafUpdateRegexPatternSetResponse
 */
- (void)updateRegexPatternSet:(AWSwafUpdateRegexPatternSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateRegexPatternSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>Predicate</a> objects in a <code>Rule</code>. Each <code>Predicate</code> object identifies a predicate, such as a <a>ByteMatchSet</a> or an <a>IPSet</a>, that specifies the web requests that you want to allow, block, or count. If you add more than one predicate to a <code>Rule</code>, a request must match all of the specifications to be allowed, blocked, or counted. For example, suppose that you add the following to a <code>Rule</code>: </p><ul><li><p>A <code>ByteMatchSet</code> that matches the value <code>BadBot</code> in the <code>User-Agent</code> header</p></li><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44</code></p></li></ul><p>You then add the <code>Rule</code> to a <code>WebACL</code> and specify that you want to block requests that satisfy the <code>Rule</code>. For a request to be blocked, the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code><i>and</i> the request must originate from the IP address 192.0.2.44.</p><p>To create and configure a <code>Rule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the <code>Rule</code>.</p></li><li><p>Create the <code>Rule</code>. See <a>CreateRule</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRule</code> request to add predicates to the <code>Rule</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>Rule</code>. See <a>CreateWebACL</a>.</p></li></ol><p>If you want to replace one <code>ByteMatchSet</code> or <code>IPSet</code> with another, you delete the existing one and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRule service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateRuleResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateRuleRequest
 @see AWSwafUpdateRuleResponse
 */
- (AWSTask<AWSwafUpdateRuleResponse *> *)updateRule:(AWSwafUpdateRuleRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>Predicate</a> objects in a <code>Rule</code>. Each <code>Predicate</code> object identifies a predicate, such as a <a>ByteMatchSet</a> or an <a>IPSet</a>, that specifies the web requests that you want to allow, block, or count. If you add more than one predicate to a <code>Rule</code>, a request must match all of the specifications to be allowed, blocked, or counted. For example, suppose that you add the following to a <code>Rule</code>: </p><ul><li><p>A <code>ByteMatchSet</code> that matches the value <code>BadBot</code> in the <code>User-Agent</code> header</p></li><li><p>An <code>IPSet</code> that matches the IP address <code>192.0.2.44</code></p></li></ul><p>You then add the <code>Rule</code> to a <code>WebACL</code> and specify that you want to block requests that satisfy the <code>Rule</code>. For a request to be blocked, the <code>User-Agent</code> header in the request must contain the value <code>BadBot</code><i>and</i> the request must originate from the IP address 192.0.2.44.</p><p>To create and configure a <code>Rule</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in the <code>Rule</code>.</p></li><li><p>Create the <code>Rule</code>. See <a>CreateRule</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRule</a> request.</p></li><li><p>Submit an <code>UpdateRule</code> request to add predicates to the <code>Rule</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>Rule</code>. See <a>CreateWebACL</a>.</p></li></ol><p>If you want to replace one <code>ByteMatchSet</code> or <code>IPSet</code> with another, you delete the existing one and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRule service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateRuleRequest
 @see AWSwafUpdateRuleResponse
 */
- (void)updateRule:(AWSwafUpdateRuleRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateRuleResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ActivatedRule</a> objects in a <code>RuleGroup</code>.</p><p>You can only insert <code>REGULAR</code> rules into a rule group.</p><p>You can have a maximum of ten rules per rule group.</p><p>To create and configure a <code>RuleGroup</code>, perform the following steps:</p><ol><li><p>Create and update the <code>Rules</code> that you want to include in the <code>RuleGroup</code>. See <a>CreateRule</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRuleGroup</a> request.</p></li><li><p>Submit an <code>UpdateRuleGroup</code> request to add <code>Rules</code> to the <code>RuleGroup</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>RuleGroup</code>. See <a>CreateWebACL</a>.</p></li></ol><p>If you want to replace one <code>Rule</code> with another, you delete the existing one and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRuleGroup service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateRuleGroupResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFInvalidParameter`.
 
 @see AWSwafUpdateRuleGroupRequest
 @see AWSwafUpdateRuleGroupResponse
 */
- (AWSTask<AWSwafUpdateRuleGroupResponse *> *)updateRuleGroup:(AWSwafUpdateRuleGroupRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ActivatedRule</a> objects in a <code>RuleGroup</code>.</p><p>You can only insert <code>REGULAR</code> rules into a rule group.</p><p>You can have a maximum of ten rules per rule group.</p><p>To create and configure a <code>RuleGroup</code>, perform the following steps:</p><ol><li><p>Create and update the <code>Rules</code> that you want to include in the <code>RuleGroup</code>. See <a>CreateRule</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateRuleGroup</a> request.</p></li><li><p>Submit an <code>UpdateRuleGroup</code> request to add <code>Rules</code> to the <code>RuleGroup</code>.</p></li><li><p>Create and update a <code>WebACL</code> that contains the <code>RuleGroup</code>. See <a>CreateWebACL</a>.</p></li></ol><p>If you want to replace one <code>Rule</code> with another, you delete the existing one and add the new one.</p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRuleGroup service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFInvalidParameter`.
 
 @see AWSwafUpdateRuleGroupRequest
 @see AWSwafUpdateRuleGroupResponse
 */
- (void)updateRuleGroup:(AWSwafUpdateRuleGroupRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateRuleGroupResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>SizeConstraint</a> objects (filters) in a <a>SizeConstraintSet</a>. For each <code>SizeConstraint</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>SizeConstraintSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to evaluate, such as the length of a query string or the length of the <code>User-Agent</code> header.</p></li><li><p>Whether to perform any transformations on the request, such as converting it to lowercase, before checking its length. Note that transformations of the request body are not supported because the AWS resource forwards only the first <code>8192</code> bytes of your request to AWS WAF.</p><p>You can only specify a single type of TextTransformation.</p></li><li><p>A <code>ComparisonOperator</code> used for evaluating the selected part of the request against the specified <code>Size</code>, such as equals, greater than, less than, and so on.</p></li><li><p>The length, in bytes, that you want AWS WAF to watch for in selected part of the request. The length is computed after applying the transformation.</p></li></ul><p>For example, you can add a <code>SizeConstraintSetUpdate</code> object that matches web requests in which the length of the <code>User-Agent</code> header is greater than 100 bytes. You can then configure AWS WAF to block those requests.</p><p>To create and configure a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Create a <code>SizeConstraintSet.</code> For more information, see <a>CreateSizeConstraintSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateSizeConstraintSet</code> request.</p></li><li><p>Submit an <code>UpdateSizeConstraintSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSizeConstraintSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateSizeConstraintSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateSizeConstraintSetRequest
 @see AWSwafUpdateSizeConstraintSetResponse
 */
- (AWSTask<AWSwafUpdateSizeConstraintSetResponse *> *)updateSizeConstraintSet:(AWSwafUpdateSizeConstraintSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>SizeConstraint</a> objects (filters) in a <a>SizeConstraintSet</a>. For each <code>SizeConstraint</code> object, you specify the following values: </p><ul><li><p>Whether to insert or delete the object from the array. If you want to change a <code>SizeConstraintSetUpdate</code> object, you delete the existing object and add a new one.</p></li><li><p>The part of a web request that you want AWS WAF to evaluate, such as the length of a query string or the length of the <code>User-Agent</code> header.</p></li><li><p>Whether to perform any transformations on the request, such as converting it to lowercase, before checking its length. Note that transformations of the request body are not supported because the AWS resource forwards only the first <code>8192</code> bytes of your request to AWS WAF.</p><p>You can only specify a single type of TextTransformation.</p></li><li><p>A <code>ComparisonOperator</code> used for evaluating the selected part of the request against the specified <code>Size</code>, such as equals, greater than, less than, and so on.</p></li><li><p>The length, in bytes, that you want AWS WAF to watch for in selected part of the request. The length is computed after applying the transformation.</p></li></ul><p>For example, you can add a <code>SizeConstraintSetUpdate</code> object that matches web requests in which the length of the <code>User-Agent</code> header is greater than 100 bytes. You can then configure AWS WAF to block those requests.</p><p>To create and configure a <code>SizeConstraintSet</code>, perform the following steps:</p><ol><li><p>Create a <code>SizeConstraintSet.</code> For more information, see <a>CreateSizeConstraintSet</a>.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <code>UpdateSizeConstraintSet</code> request.</p></li><li><p>Submit an <code>UpdateSizeConstraintSet</code> request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSizeConstraintSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateSizeConstraintSetRequest
 @see AWSwafUpdateSizeConstraintSetResponse
 */
- (void)updateSizeConstraintSet:(AWSwafUpdateSizeConstraintSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateSizeConstraintSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>SqlInjectionMatchTuple</a> objects (filters) in a <a>SqlInjectionMatchSet</a>. For each <code>SqlInjectionMatchTuple</code> object, you specify the following values:</p><ul><li><p><code>Action</code>: Whether to insert the object into or delete the object from the array. To change a <code>SqlInjectionMatchTuple</code>, you delete the existing object and add a new one.</p></li><li><p><code>FieldToMatch</code>: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.</p></li><li><p><code>TextTransformation</code>: Which text transformation, if any, to perform on the web request before inspecting the request for snippets of malicious SQL code.</p><p>You can only specify a single type of TextTransformation.</p></li></ul><p>You use <code>SqlInjectionMatchSet</code> objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain snippets of SQL code in the query string and you want to block the requests, you can create a <code>SqlInjectionMatchSet</code> with the applicable settings, and then configure AWS WAF to block the requests. </p><p>To create and configure a <code>SqlInjectionMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateSqlInjectionMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateSqlInjectionMatchSet</code> request to specify the parts of web requests that you want AWS WAF to inspect for snippets of SQL code.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSqlInjectionMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateSqlInjectionMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateSqlInjectionMatchSetRequest
 @see AWSwafUpdateSqlInjectionMatchSetResponse
 */
- (AWSTask<AWSwafUpdateSqlInjectionMatchSetResponse *> *)updateSqlInjectionMatchSet:(AWSwafUpdateSqlInjectionMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>SqlInjectionMatchTuple</a> objects (filters) in a <a>SqlInjectionMatchSet</a>. For each <code>SqlInjectionMatchTuple</code> object, you specify the following values:</p><ul><li><p><code>Action</code>: Whether to insert the object into or delete the object from the array. To change a <code>SqlInjectionMatchTuple</code>, you delete the existing object and add a new one.</p></li><li><p><code>FieldToMatch</code>: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.</p></li><li><p><code>TextTransformation</code>: Which text transformation, if any, to perform on the web request before inspecting the request for snippets of malicious SQL code.</p><p>You can only specify a single type of TextTransformation.</p></li></ul><p>You use <code>SqlInjectionMatchSet</code> objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain snippets of SQL code in the query string and you want to block the requests, you can create a <code>SqlInjectionMatchSet</code> with the applicable settings, and then configure AWS WAF to block the requests. </p><p>To create and configure a <code>SqlInjectionMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateSqlInjectionMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateSqlInjectionMatchSet</code> request to specify the parts of web requests that you want AWS WAF to inspect for snippets of SQL code.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateSqlInjectionMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateSqlInjectionMatchSetRequest
 @see AWSwafUpdateSqlInjectionMatchSetResponse
 */
- (void)updateSqlInjectionMatchSet:(AWSwafUpdateSqlInjectionMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateSqlInjectionMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ActivatedRule</a> objects in a <code>WebACL</code>. Each <code>Rule</code> identifies web requests that you want to allow, block, or count. When you update a <code>WebACL</code>, you specify the following values:</p><ul><li><p>A default action for the <code>WebACL</code>, either <code>ALLOW</code> or <code>BLOCK</code>. AWS WAF performs the default action if a request doesn't match the criteria in any of the <code>Rules</code> in a <code>WebACL</code>.</p></li><li><p>The <code>Rules</code> that you want to add or delete. If you want to replace one <code>Rule</code> with another, you delete the existing <code>Rule</code> and add the new one.</p></li><li><p>For each <code>Rule</code>, whether you want AWS WAF to allow requests, block requests, or count requests that match the conditions in the <code>Rule</code>.</p></li><li><p>The order in which you want AWS WAF to evaluate the <code>Rules</code> in a <code>WebACL</code>. If you add more than one <code>Rule</code> to a <code>WebACL</code>, AWS WAF evaluates each request against the <code>Rules</code> in order based on the value of <code>Priority</code>. (The <code>Rule</code> that has the lowest value for <code>Priority</code> is evaluated first.) When a web request matches all the predicates (such as <code>ByteMatchSets</code> and <code>IPSets</code>) in a <code>Rule</code>, AWS WAF immediately takes the corresponding action, allow or block, and doesn't evaluate the request against the remaining <code>Rules</code> in the <code>WebACL</code>, if any. </p></li></ul><p>To create and configure a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in <code>Rules</code>. For more information, see <a>CreateByteMatchSet</a>, <a>UpdateByteMatchSet</a>, <a>CreateIPSet</a>, <a>UpdateIPSet</a>, <a>CreateSqlInjectionMatchSet</a>, and <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Create and update the <code>Rules</code> that you want to include in the <code>WebACL</code>. For more information, see <a>CreateRule</a> and <a>UpdateRule</a>.</p></li><li><p>Create a <code>WebACL</code>. See <a>CreateWebACL</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateWebACL</a> request.</p></li><li><p>Submit an <code>UpdateWebACL</code> request to specify the <code>Rules</code> that you want to include in the <code>WebACL</code>, to specify the default action, and to associate the <code>WebACL</code> with a CloudFront distribution. </p><p>The <code>ActivatedRule</code> can be a rule group. If you specify a rule group as your <code>ActivatedRule</code> , you can exclude specific rules from that rule group.</p><p>If you already have a rule group associated with a web ACL and want to submit an <code>UpdateWebACL</code> request to exclude certain rules from that rule group, you must first remove the rule group from the web ACL, the re-insert it again, specifying the excluded rules. For details, see <a>ActivatedRule$ExcludedRules</a> . </p></li></ol><p>Be aware that if you try to add a RATE_BASED rule to a web ACL without setting the rule type when first creating the rule, the <a>UpdateWebACL</a> request will fail because the request tries to add a REGULAR rule (the default rule type) with the specified ID, which does not exist. </p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWebACL service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateWebACLResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFSubscriptionNotFound`.
 
 @see AWSwafUpdateWebACLRequest
 @see AWSwafUpdateWebACLResponse
 */
- (AWSTask<AWSwafUpdateWebACLResponse *> *)updateWebACL:(AWSwafUpdateWebACLRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>ActivatedRule</a> objects in a <code>WebACL</code>. Each <code>Rule</code> identifies web requests that you want to allow, block, or count. When you update a <code>WebACL</code>, you specify the following values:</p><ul><li><p>A default action for the <code>WebACL</code>, either <code>ALLOW</code> or <code>BLOCK</code>. AWS WAF performs the default action if a request doesn't match the criteria in any of the <code>Rules</code> in a <code>WebACL</code>.</p></li><li><p>The <code>Rules</code> that you want to add or delete. If you want to replace one <code>Rule</code> with another, you delete the existing <code>Rule</code> and add the new one.</p></li><li><p>For each <code>Rule</code>, whether you want AWS WAF to allow requests, block requests, or count requests that match the conditions in the <code>Rule</code>.</p></li><li><p>The order in which you want AWS WAF to evaluate the <code>Rules</code> in a <code>WebACL</code>. If you add more than one <code>Rule</code> to a <code>WebACL</code>, AWS WAF evaluates each request against the <code>Rules</code> in order based on the value of <code>Priority</code>. (The <code>Rule</code> that has the lowest value for <code>Priority</code> is evaluated first.) When a web request matches all the predicates (such as <code>ByteMatchSets</code> and <code>IPSets</code>) in a <code>Rule</code>, AWS WAF immediately takes the corresponding action, allow or block, and doesn't evaluate the request against the remaining <code>Rules</code> in the <code>WebACL</code>, if any. </p></li></ul><p>To create and configure a <code>WebACL</code>, perform the following steps:</p><ol><li><p>Create and update the predicates that you want to include in <code>Rules</code>. For more information, see <a>CreateByteMatchSet</a>, <a>UpdateByteMatchSet</a>, <a>CreateIPSet</a>, <a>UpdateIPSet</a>, <a>CreateSqlInjectionMatchSet</a>, and <a>UpdateSqlInjectionMatchSet</a>.</p></li><li><p>Create and update the <code>Rules</code> that you want to include in the <code>WebACL</code>. For more information, see <a>CreateRule</a> and <a>UpdateRule</a>.</p></li><li><p>Create a <code>WebACL</code>. See <a>CreateWebACL</a>.</p></li><li><p>Use <code>GetChangeToken</code> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateWebACL</a> request.</p></li><li><p>Submit an <code>UpdateWebACL</code> request to specify the <code>Rules</code> that you want to include in the <code>WebACL</code>, to specify the default action, and to associate the <code>WebACL</code> with a CloudFront distribution. </p><p>The <code>ActivatedRule</code> can be a rule group. If you specify a rule group as your <code>ActivatedRule</code> , you can exclude specific rules from that rule group.</p><p>If you already have a rule group associated with a web ACL and want to submit an <code>UpdateWebACL</code> request to exclude certain rules from that rule group, you must first remove the rule group from the web ACL, the re-insert it again, specifying the excluded rules. For details, see <a>ActivatedRule$ExcludedRules</a> . </p></li></ol><p>Be aware that if you try to add a RATE_BASED rule to a web ACL without setting the rule type when first creating the rule, the <a>UpdateWebACL</a> request will fail because the request tries to add a REGULAR rule (the default rule type) with the specified ID, which does not exist. </p><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateWebACL service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFReferencedItem`, `AWSwafErrorWAFLimitsExceeded`, `AWSwafErrorWAFSubscriptionNotFound`.
 
 @see AWSwafUpdateWebACLRequest
 @see AWSwafUpdateWebACLResponse
 */
- (void)updateWebACL:(AWSwafUpdateWebACLRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateWebACLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>XssMatchTuple</a> objects (filters) in an <a>XssMatchSet</a>. For each <code>XssMatchTuple</code> object, you specify the following values:</p><ul><li><p><code>Action</code>: Whether to insert the object into or delete the object from the array. To change an <code>XssMatchTuple</code>, you delete the existing object and add a new one.</p></li><li><p><code>FieldToMatch</code>: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.</p></li><li><p><code>TextTransformation</code>: Which text transformation, if any, to perform on the web request before inspecting the request for cross-site scripting attacks.</p><p>You can only specify a single type of TextTransformation.</p></li></ul><p>You use <code>XssMatchSet</code> objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain cross-site scripting attacks in the request body and you want to block the requests, you can create an <code>XssMatchSet</code> with the applicable settings, and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>XssMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateXssMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateXssMatchSet</code> request to specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateXssMatchSet service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSwafUpdateXssMatchSetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateXssMatchSetRequest
 @see AWSwafUpdateXssMatchSetResponse
 */
- (AWSTask<AWSwafUpdateXssMatchSetResponse *> *)updateXssMatchSet:(AWSwafUpdateXssMatchSetRequest *)request;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Inserts or deletes <a>XssMatchTuple</a> objects (filters) in an <a>XssMatchSet</a>. For each <code>XssMatchTuple</code> object, you specify the following values:</p><ul><li><p><code>Action</code>: Whether to insert the object into or delete the object from the array. To change an <code>XssMatchTuple</code>, you delete the existing object and add a new one.</p></li><li><p><code>FieldToMatch</code>: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.</p></li><li><p><code>TextTransformation</code>: Which text transformation, if any, to perform on the web request before inspecting the request for cross-site scripting attacks.</p><p>You can only specify a single type of TextTransformation.</p></li></ul><p>You use <code>XssMatchSet</code> objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain cross-site scripting attacks in the request body and you want to block the requests, you can create an <code>XssMatchSet</code> with the applicable settings, and then configure AWS WAF to block the requests. </p><p>To create and configure an <code>XssMatchSet</code>, perform the following steps:</p><ol><li><p>Submit a <a>CreateXssMatchSet</a> request.</p></li><li><p>Use <a>GetChangeToken</a> to get the change token that you provide in the <code>ChangeToken</code> parameter of an <a>UpdateIPSet</a> request.</p></li><li><p>Submit an <code>UpdateXssMatchSet</code> request to specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks.</p></li></ol><p>For more information about how to use the AWS WAF API to allow or block HTTP requests, see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/">AWS WAF Developer Guide</a>.</p>
 
 @param request A container for the necessary parameters to execute the UpdateXssMatchSet service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSwafErrorDomain` domain and the following error code: `AWSwafErrorWAFInternalError`, `AWSwafErrorWAFInvalidAccount`, `AWSwafErrorWAFInvalidOperation`, `AWSwafErrorWAFInvalidParameter`, `AWSwafErrorWAFNonexistentContainer`, `AWSwafErrorWAFNonexistentItem`, `AWSwafErrorWAFStaleData`, `AWSwafErrorWAFLimitsExceeded`.
 
 @see AWSwafUpdateXssMatchSetRequest
 @see AWSwafUpdateXssMatchSetResponse
 */
- (void)updateXssMatchSet:(AWSwafUpdateXssMatchSetRequest *)request completionHandler:(void (^ _Nullable)(AWSwafUpdateXssMatchSetResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
