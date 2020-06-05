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
#import "AWSCloudfrontModel.h"
#import "AWSCloudfrontResources.h"

NS_ASSUME_NONNULL_BEGIN

//! SDK version for AWSCloudfront
FOUNDATION_EXPORT NSString *const AWSCloudfrontSDKVersion;

/**
 <fullname>Amazon CloudFront</fullname><p>This is the <i>Amazon CloudFront API Reference</i>. This guide is for developers who need detailed information about CloudFront API actions, data types, and errors. For detailed information about CloudFront features, see the <i>Amazon CloudFront Developer Guide</i>.</p>
 */
@interface AWSCloudfront : AWSService

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

     let Cloudfront = AWSCloudfront.default()

 *Objective-C*

     AWSCloudfront *Cloudfront = [AWSCloudfront defaultCloudfront];

 @return The default service client.
 */
+ (instancetype)defaultCloudfront;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCloudfront.register(with: configuration!, forKey: "USWest2Cloudfront")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:@"USWest2Cloudfront"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Cloudfront = AWSCloudfront(forKey: "USWest2Cloudfront")

 *Objective-C*

     AWSCloudfront *Cloudfront = [AWSCloudfront CloudfrontForKey:@"USWest2Cloudfront"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCloudfrontWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCloudfrontWithConfiguration:forKey:` before invoking this method.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSCloudfront.register(with: configuration!, forKey: "USWest2Cloudfront")
 
        return true
    }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCloudfront registerCloudfrontWithConfiguration:configuration forKey:@"USWest2Cloudfront"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let Cloudfront = AWSCloudfront(forKey: "USWest2Cloudfront")

 *Objective-C*

     AWSCloudfront *Cloudfront = [AWSCloudfront CloudfrontForKey:@"USWest2Cloudfront"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CloudfrontForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCloudfrontForKey:(NSString *)key;

/**
 <p>Creates a new origin access identity. If you're using Amazon S3 for your origin, you can use an origin access identity to require users to access your content using a CloudFront URL instead of the Amazon S3 URL. For more information about how to use origin access identities, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCloudFrontOriginAccessIdentity2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorCloudFrontOriginAccessIdentityAlreadyExists`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorTooManyCloudFrontOriginAccessIdentities`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInconsistentQuantities`.
 
 @see AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest
 @see AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult
 */
- (AWSTask<AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult *> *)createCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest *)request;

/**
 <p>Creates a new origin access identity. If you're using Amazon S3 for your origin, you can use an origin access identity to require users to access your content using a CloudFront URL instead of the Amazon S3 URL. For more information about how to use origin access identities, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the CreateCloudFrontOriginAccessIdentity2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorCloudFrontOriginAccessIdentityAlreadyExists`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorTooManyCloudFrontOriginAccessIdentities`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInconsistentQuantities`.
 
 @see AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest
 @see AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult
 */
- (void)createCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new web distribution. You create a CloudFront distribution to tell CloudFront where you want content to be delivered from, and the details about how to track and manage content delivery. Send a <code>POST</code> request to the <code>/<i>CloudFront API version</i>/distribution</code>/<code>distribution ID</code> resource.</p><important><p>When you update a distribution, there are more required fields than when you create a distribution. When you update your distribution by using <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>, follow the steps included in the documentation to get the current configuration and then make your updates. This helps to make sure that you include all of the required fields. To view a summary, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html">Required Fields for Create Distribution and Update Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateDistribution2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontCreateDistributionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorDistributionAlreadyExists`, `AWSCloudfrontErrorInvalidOrigin`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorInvalidViewerCertificate`, `AWSCloudfrontErrorInvalidMinimumProtocolVersion`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorTooManyDistributionCNAMEs`, `AWSCloudfrontErrorTooManyDistributions`, `AWSCloudfrontErrorInvalidDefaultRootObject`, `AWSCloudfrontErrorInvalidRelativePath`, `AWSCloudfrontErrorInvalidErrorCode`, `AWSCloudfrontErrorInvalidResponseCode`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidRequiredProtocol`, `AWSCloudfrontErrorNoSuchOrigin`, `AWSCloudfrontErrorTooManyOrigins`, `AWSCloudfrontErrorTooManyOriginGroupsPerDistribution`, `AWSCloudfrontErrorTooManyCacheBehaviors`, `AWSCloudfrontErrorTooManyCookieNamesInWhiteList`, `AWSCloudfrontErrorInvalidForwardCookies`, `AWSCloudfrontErrorTooManyHeadersInForwardedValues`, `AWSCloudfrontErrorInvalidHeadersForS3Origin`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorTooManyCertificates`, `AWSCloudfrontErrorInvalidLocationCode`, `AWSCloudfrontErrorInvalidGeoRestrictionParameter`, `AWSCloudfrontErrorInvalidProtocolSettings`, `AWSCloudfrontErrorInvalidTTLOrder`, `AWSCloudfrontErrorInvalidWebACLId`, `AWSCloudfrontErrorTooManyOriginCustomHeaders`, `AWSCloudfrontErrorTooManyQueryStringParameters`, `AWSCloudfrontErrorInvalidQueryStringParameters`, `AWSCloudfrontErrorTooManyDistributionsWithLambdaAssociations`, `AWSCloudfrontErrorTooManyLambdaFunctionAssociations`, `AWSCloudfrontErrorInvalidLambdaFunctionAssociation`, `AWSCloudfrontErrorInvalidOriginReadTimeout`, `AWSCloudfrontErrorInvalidOriginKeepaliveTimeout`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`, `AWSCloudfrontErrorIllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior`, `AWSCloudfrontErrorTooManyDistributionsAssociatedToFieldLevelEncryptionConfig`.
 
 @see AWSCloudfrontCreateDistributionRequest
 @see AWSCloudfrontCreateDistributionResult
 */
- (AWSTask<AWSCloudfrontCreateDistributionResult *> *)createDistribution2019_03_26:(AWSCloudfrontCreateDistributionRequest *)request;

/**
 <p>Creates a new web distribution. You create a CloudFront distribution to tell CloudFront where you want content to be delivered from, and the details about how to track and manage content delivery. Send a <code>POST</code> request to the <code>/<i>CloudFront API version</i>/distribution</code>/<code>distribution ID</code> resource.</p><important><p>When you update a distribution, there are more required fields than when you create a distribution. When you update your distribution by using <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>, follow the steps included in the documentation to get the current configuration and then make your updates. This helps to make sure that you include all of the required fields. To view a summary, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html">Required Fields for Create Distribution and Update Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateDistribution2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorDistributionAlreadyExists`, `AWSCloudfrontErrorInvalidOrigin`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorInvalidViewerCertificate`, `AWSCloudfrontErrorInvalidMinimumProtocolVersion`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorTooManyDistributionCNAMEs`, `AWSCloudfrontErrorTooManyDistributions`, `AWSCloudfrontErrorInvalidDefaultRootObject`, `AWSCloudfrontErrorInvalidRelativePath`, `AWSCloudfrontErrorInvalidErrorCode`, `AWSCloudfrontErrorInvalidResponseCode`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidRequiredProtocol`, `AWSCloudfrontErrorNoSuchOrigin`, `AWSCloudfrontErrorTooManyOrigins`, `AWSCloudfrontErrorTooManyOriginGroupsPerDistribution`, `AWSCloudfrontErrorTooManyCacheBehaviors`, `AWSCloudfrontErrorTooManyCookieNamesInWhiteList`, `AWSCloudfrontErrorInvalidForwardCookies`, `AWSCloudfrontErrorTooManyHeadersInForwardedValues`, `AWSCloudfrontErrorInvalidHeadersForS3Origin`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorTooManyCertificates`, `AWSCloudfrontErrorInvalidLocationCode`, `AWSCloudfrontErrorInvalidGeoRestrictionParameter`, `AWSCloudfrontErrorInvalidProtocolSettings`, `AWSCloudfrontErrorInvalidTTLOrder`, `AWSCloudfrontErrorInvalidWebACLId`, `AWSCloudfrontErrorTooManyOriginCustomHeaders`, `AWSCloudfrontErrorTooManyQueryStringParameters`, `AWSCloudfrontErrorInvalidQueryStringParameters`, `AWSCloudfrontErrorTooManyDistributionsWithLambdaAssociations`, `AWSCloudfrontErrorTooManyLambdaFunctionAssociations`, `AWSCloudfrontErrorInvalidLambdaFunctionAssociation`, `AWSCloudfrontErrorInvalidOriginReadTimeout`, `AWSCloudfrontErrorInvalidOriginKeepaliveTimeout`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`, `AWSCloudfrontErrorIllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior`, `AWSCloudfrontErrorTooManyDistributionsAssociatedToFieldLevelEncryptionConfig`.
 
 @see AWSCloudfrontCreateDistributionRequest
 @see AWSCloudfrontCreateDistributionResult
 */
- (void)createDistribution2019_03_26:(AWSCloudfrontCreateDistributionRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontCreateDistributionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a new distribution with tags.</p>
 
 @param request A container for the necessary parameters to execute the CreateDistributionWithTags2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontCreateDistributionWithTagsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorDistributionAlreadyExists`, `AWSCloudfrontErrorInvalidOrigin`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorInvalidViewerCertificate`, `AWSCloudfrontErrorInvalidMinimumProtocolVersion`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorTooManyDistributionCNAMEs`, `AWSCloudfrontErrorTooManyDistributions`, `AWSCloudfrontErrorInvalidDefaultRootObject`, `AWSCloudfrontErrorInvalidRelativePath`, `AWSCloudfrontErrorInvalidErrorCode`, `AWSCloudfrontErrorInvalidResponseCode`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidRequiredProtocol`, `AWSCloudfrontErrorNoSuchOrigin`, `AWSCloudfrontErrorTooManyOrigins`, `AWSCloudfrontErrorTooManyOriginGroupsPerDistribution`, `AWSCloudfrontErrorTooManyCacheBehaviors`, `AWSCloudfrontErrorTooManyCookieNamesInWhiteList`, `AWSCloudfrontErrorInvalidForwardCookies`, `AWSCloudfrontErrorTooManyHeadersInForwardedValues`, `AWSCloudfrontErrorInvalidHeadersForS3Origin`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorTooManyCertificates`, `AWSCloudfrontErrorInvalidLocationCode`, `AWSCloudfrontErrorInvalidGeoRestrictionParameter`, `AWSCloudfrontErrorInvalidProtocolSettings`, `AWSCloudfrontErrorInvalidTTLOrder`, `AWSCloudfrontErrorInvalidWebACLId`, `AWSCloudfrontErrorTooManyOriginCustomHeaders`, `AWSCloudfrontErrorInvalidTagging`, `AWSCloudfrontErrorTooManyQueryStringParameters`, `AWSCloudfrontErrorInvalidQueryStringParameters`, `AWSCloudfrontErrorTooManyDistributionsWithLambdaAssociations`, `AWSCloudfrontErrorTooManyLambdaFunctionAssociations`, `AWSCloudfrontErrorInvalidLambdaFunctionAssociation`, `AWSCloudfrontErrorInvalidOriginReadTimeout`, `AWSCloudfrontErrorInvalidOriginKeepaliveTimeout`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`, `AWSCloudfrontErrorIllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior`, `AWSCloudfrontErrorTooManyDistributionsAssociatedToFieldLevelEncryptionConfig`.
 
 @see AWSCloudfrontCreateDistributionWithTagsRequest
 @see AWSCloudfrontCreateDistributionWithTagsResult
 */
- (AWSTask<AWSCloudfrontCreateDistributionWithTagsResult *> *)createDistributionWithTags2019_03_26:(AWSCloudfrontCreateDistributionWithTagsRequest *)request;

/**
 <p>Create a new distribution with tags.</p>
 
 @param request A container for the necessary parameters to execute the CreateDistributionWithTags2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorDistributionAlreadyExists`, `AWSCloudfrontErrorInvalidOrigin`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorInvalidViewerCertificate`, `AWSCloudfrontErrorInvalidMinimumProtocolVersion`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorTooManyDistributionCNAMEs`, `AWSCloudfrontErrorTooManyDistributions`, `AWSCloudfrontErrorInvalidDefaultRootObject`, `AWSCloudfrontErrorInvalidRelativePath`, `AWSCloudfrontErrorInvalidErrorCode`, `AWSCloudfrontErrorInvalidResponseCode`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidRequiredProtocol`, `AWSCloudfrontErrorNoSuchOrigin`, `AWSCloudfrontErrorTooManyOrigins`, `AWSCloudfrontErrorTooManyOriginGroupsPerDistribution`, `AWSCloudfrontErrorTooManyCacheBehaviors`, `AWSCloudfrontErrorTooManyCookieNamesInWhiteList`, `AWSCloudfrontErrorInvalidForwardCookies`, `AWSCloudfrontErrorTooManyHeadersInForwardedValues`, `AWSCloudfrontErrorInvalidHeadersForS3Origin`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorTooManyCertificates`, `AWSCloudfrontErrorInvalidLocationCode`, `AWSCloudfrontErrorInvalidGeoRestrictionParameter`, `AWSCloudfrontErrorInvalidProtocolSettings`, `AWSCloudfrontErrorInvalidTTLOrder`, `AWSCloudfrontErrorInvalidWebACLId`, `AWSCloudfrontErrorTooManyOriginCustomHeaders`, `AWSCloudfrontErrorInvalidTagging`, `AWSCloudfrontErrorTooManyQueryStringParameters`, `AWSCloudfrontErrorInvalidQueryStringParameters`, `AWSCloudfrontErrorTooManyDistributionsWithLambdaAssociations`, `AWSCloudfrontErrorTooManyLambdaFunctionAssociations`, `AWSCloudfrontErrorInvalidLambdaFunctionAssociation`, `AWSCloudfrontErrorInvalidOriginReadTimeout`, `AWSCloudfrontErrorInvalidOriginKeepaliveTimeout`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`, `AWSCloudfrontErrorIllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior`, `AWSCloudfrontErrorTooManyDistributionsAssociatedToFieldLevelEncryptionConfig`.
 
 @see AWSCloudfrontCreateDistributionWithTagsRequest
 @see AWSCloudfrontCreateDistributionWithTagsResult
 */
- (void)createDistributionWithTags2019_03_26:(AWSCloudfrontCreateDistributionWithTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontCreateDistributionWithTagsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a new field-level encryption configuration.</p>
 
 @param request A container for the necessary parameters to execute the CreateFieldLevelEncryptionConfig2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontCreateFieldLevelEncryptionConfigResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`, `AWSCloudfrontErrorFieldLevelEncryptionConfigAlreadyExists`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionConfigs`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionQueryArgProfiles`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionContentTypeProfiles`, `AWSCloudfrontErrorQueryArgProfileEmpty`.
 
 @see AWSCloudfrontCreateFieldLevelEncryptionConfigRequest
 @see AWSCloudfrontCreateFieldLevelEncryptionConfigResult
 */
- (AWSTask<AWSCloudfrontCreateFieldLevelEncryptionConfigResult *> *)createFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontCreateFieldLevelEncryptionConfigRequest *)request;

/**
 <p>Create a new field-level encryption configuration.</p>
 
 @param request A container for the necessary parameters to execute the CreateFieldLevelEncryptionConfig2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`, `AWSCloudfrontErrorFieldLevelEncryptionConfigAlreadyExists`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionConfigs`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionQueryArgProfiles`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionContentTypeProfiles`, `AWSCloudfrontErrorQueryArgProfileEmpty`.
 
 @see AWSCloudfrontCreateFieldLevelEncryptionConfigRequest
 @see AWSCloudfrontCreateFieldLevelEncryptionConfigResult
 */
- (void)createFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontCreateFieldLevelEncryptionConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontCreateFieldLevelEncryptionConfigResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a field-level encryption profile.</p>
 
 @param request A container for the necessary parameters to execute the CreateFieldLevelEncryptionProfile2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontCreateFieldLevelEncryptionProfileResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorNoSuchPublicKey`, `AWSCloudfrontErrorFieldLevelEncryptionProfileAlreadyExists`, `AWSCloudfrontErrorFieldLevelEncryptionProfileSizeExceeded`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionProfiles`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionEncryptionEntities`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionFieldPatterns`.
 
 @see AWSCloudfrontCreateFieldLevelEncryptionProfileRequest
 @see AWSCloudfrontCreateFieldLevelEncryptionProfileResult
 */
- (AWSTask<AWSCloudfrontCreateFieldLevelEncryptionProfileResult *> *)createFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontCreateFieldLevelEncryptionProfileRequest *)request;

/**
 <p>Create a field-level encryption profile.</p>
 
 @param request A container for the necessary parameters to execute the CreateFieldLevelEncryptionProfile2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorNoSuchPublicKey`, `AWSCloudfrontErrorFieldLevelEncryptionProfileAlreadyExists`, `AWSCloudfrontErrorFieldLevelEncryptionProfileSizeExceeded`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionProfiles`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionEncryptionEntities`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionFieldPatterns`.
 
 @see AWSCloudfrontCreateFieldLevelEncryptionProfileRequest
 @see AWSCloudfrontCreateFieldLevelEncryptionProfileResult
 */
- (void)createFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontCreateFieldLevelEncryptionProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontCreateFieldLevelEncryptionProfileResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a new invalidation. </p>
 
 @param request A container for the necessary parameters to execute the CreateInvalidation2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontCreateInvalidationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorBatchTooLarge`, `AWSCloudfrontErrorTooManyInvalidationsInProgress`, `AWSCloudfrontErrorInconsistentQuantities`.
 
 @see AWSCloudfrontCreateInvalidationRequest
 @see AWSCloudfrontCreateInvalidationResult
 */
- (AWSTask<AWSCloudfrontCreateInvalidationResult *> *)createInvalidation2019_03_26:(AWSCloudfrontCreateInvalidationRequest *)request;

/**
 <p>Create a new invalidation. </p>
 
 @param request A container for the necessary parameters to execute the CreateInvalidation2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorBatchTooLarge`, `AWSCloudfrontErrorTooManyInvalidationsInProgress`, `AWSCloudfrontErrorInconsistentQuantities`.
 
 @see AWSCloudfrontCreateInvalidationRequest
 @see AWSCloudfrontCreateInvalidationResult
 */
- (void)createInvalidation2019_03_26:(AWSCloudfrontCreateInvalidationRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontCreateInvalidationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Add a new public key to CloudFront to use, for example, for field-level encryption. You can add a maximum of 10 public keys with one AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublicKey2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontCreatePublicKeyResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorPublicKeyAlreadyExists`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorTooManyPublicKeys`.
 
 @see AWSCloudfrontCreatePublicKeyRequest
 @see AWSCloudfrontCreatePublicKeyResult
 */
- (AWSTask<AWSCloudfrontCreatePublicKeyResult *> *)createPublicKey2019_03_26:(AWSCloudfrontCreatePublicKeyRequest *)request;

/**
 <p>Add a new public key to CloudFront to use, for example, for field-level encryption. You can add a maximum of 10 public keys with one AWS account.</p>
 
 @param request A container for the necessary parameters to execute the CreatePublicKey2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorPublicKeyAlreadyExists`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorTooManyPublicKeys`.
 
 @see AWSCloudfrontCreatePublicKeyRequest
 @see AWSCloudfrontCreatePublicKeyResult
 */
- (void)createPublicKey2019_03_26:(AWSCloudfrontCreatePublicKeyRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontCreatePublicKeyResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Creates a new RTMP distribution. An RTMP distribution is similar to a web distribution, but an RTMP distribution streams media files using the Adobe Real-Time Messaging Protocol (RTMP) instead of serving files using HTTP. </p><p>To create a new distribution, submit a <code>POST</code> request to the <i>CloudFront API version</i>/distribution resource. The request body must include a document with a <i>StreamingDistributionConfig</i> element. The response echoes the <code>StreamingDistributionConfig</code> element and returns other information about the RTMP distribution.</p><p>To get the status of your request, use the <i>GET StreamingDistribution</i> API action. When the value of <code>Enabled</code> is <code>true</code> and the value of <code>Status</code> is <code>Deployed</code>, your distribution is ready. A distribution usually deploys in less than 15 minutes.</p><p>For more information about web distributions, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-rtmp.html">Working with RTMP Distributions</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><important><p>Beginning with the 2012-05-05 version of the CloudFront API, we made substantial changes to the format of the XML document that you include in the request body when you create or update a web distribution or an RTMP distribution, and when you invalidate objects. With previous versions of the API, we discovered that it was too easy to accidentally delete one or more values for an element that accepts multiple values, for example, CNAMEs and trusted signers. Our changes for the 2012-05-05 release are intended to prevent these accidental deletions and to notify you when there's a mismatch between the number of values you say you're specifying in the <code>Quantity</code> element and the number of values specified.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateStreamingDistribution2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontCreateStreamingDistributionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorStreamingDistributionAlreadyExists`, `AWSCloudfrontErrorInvalidOrigin`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorTooManyStreamingDistributionCNAMEs`, `AWSCloudfrontErrorTooManyStreamingDistributions`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInconsistentQuantities`.
 
 @see AWSCloudfrontCreateStreamingDistributionRequest
 @see AWSCloudfrontCreateStreamingDistributionResult
 */
- (AWSTask<AWSCloudfrontCreateStreamingDistributionResult *> *)createStreamingDistribution2019_03_26:(AWSCloudfrontCreateStreamingDistributionRequest *)request;

/**
 <p>Creates a new RTMP distribution. An RTMP distribution is similar to a web distribution, but an RTMP distribution streams media files using the Adobe Real-Time Messaging Protocol (RTMP) instead of serving files using HTTP. </p><p>To create a new distribution, submit a <code>POST</code> request to the <i>CloudFront API version</i>/distribution resource. The request body must include a document with a <i>StreamingDistributionConfig</i> element. The response echoes the <code>StreamingDistributionConfig</code> element and returns other information about the RTMP distribution.</p><p>To get the status of your request, use the <i>GET StreamingDistribution</i> API action. When the value of <code>Enabled</code> is <code>true</code> and the value of <code>Status</code> is <code>Deployed</code>, your distribution is ready. A distribution usually deploys in less than 15 minutes.</p><p>For more information about web distributions, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-rtmp.html">Working with RTMP Distributions</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><important><p>Beginning with the 2012-05-05 version of the CloudFront API, we made substantial changes to the format of the XML document that you include in the request body when you create or update a web distribution or an RTMP distribution, and when you invalidate objects. With previous versions of the API, we discovered that it was too easy to accidentally delete one or more values for an element that accepts multiple values, for example, CNAMEs and trusted signers. Our changes for the 2012-05-05 release are intended to prevent these accidental deletions and to notify you when there's a mismatch between the number of values you say you're specifying in the <code>Quantity</code> element and the number of values specified.</p></important>
 
 @param request A container for the necessary parameters to execute the CreateStreamingDistribution2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorStreamingDistributionAlreadyExists`, `AWSCloudfrontErrorInvalidOrigin`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorTooManyStreamingDistributionCNAMEs`, `AWSCloudfrontErrorTooManyStreamingDistributions`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInconsistentQuantities`.
 
 @see AWSCloudfrontCreateStreamingDistributionRequest
 @see AWSCloudfrontCreateStreamingDistributionResult
 */
- (void)createStreamingDistribution2019_03_26:(AWSCloudfrontCreateStreamingDistributionRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontCreateStreamingDistributionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Create a new streaming distribution with tags.</p>
 
 @param request A container for the necessary parameters to execute the CreateStreamingDistributionWithTags2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontCreateStreamingDistributionWithTagsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorStreamingDistributionAlreadyExists`, `AWSCloudfrontErrorInvalidOrigin`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorTooManyStreamingDistributionCNAMEs`, `AWSCloudfrontErrorTooManyStreamingDistributions`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorInvalidTagging`.
 
 @see AWSCloudfrontCreateStreamingDistributionWithTagsRequest
 @see AWSCloudfrontCreateStreamingDistributionWithTagsResult
 */
- (AWSTask<AWSCloudfrontCreateStreamingDistributionWithTagsResult *> *)createStreamingDistributionWithTags2019_03_26:(AWSCloudfrontCreateStreamingDistributionWithTagsRequest *)request;

/**
 <p>Create a new streaming distribution with tags.</p>
 
 @param request A container for the necessary parameters to execute the CreateStreamingDistributionWithTags2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorStreamingDistributionAlreadyExists`, `AWSCloudfrontErrorInvalidOrigin`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorTooManyStreamingDistributionCNAMEs`, `AWSCloudfrontErrorTooManyStreamingDistributions`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorInvalidTagging`.
 
 @see AWSCloudfrontCreateStreamingDistributionWithTagsRequest
 @see AWSCloudfrontCreateStreamingDistributionWithTagsResult
 */
- (void)createStreamingDistributionWithTags2019_03_26:(AWSCloudfrontCreateStreamingDistributionWithTagsRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontCreateStreamingDistributionWithTagsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Delete an origin access identity. </p>
 
 @param request A container for the necessary parameters to execute the DeleteCloudFrontOriginAccessIdentity2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchCloudFrontOriginAccessIdentity`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorCloudFrontOriginAccessIdentityInUse`.
 
 @see AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest
 */
- (AWSTask *)deleteCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest *)request;

/**
 <p>Delete an origin access identity. </p>
 
 @param request A container for the necessary parameters to execute the DeleteCloudFrontOriginAccessIdentity2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchCloudFrontOriginAccessIdentity`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorCloudFrontOriginAccessIdentityInUse`.
 
 @see AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest
 */
- (void)deleteCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete a distribution. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDistribution2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorDistributionNotDisabled`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorPreconditionFailed`.
 
 @see AWSCloudfrontDeleteDistributionRequest
 */
- (AWSTask *)deleteDistribution2019_03_26:(AWSCloudfrontDeleteDistributionRequest *)request;

/**
 <p>Delete a distribution. </p>
 
 @param request A container for the necessary parameters to execute the DeleteDistribution2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorDistributionNotDisabled`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorPreconditionFailed`.
 
 @see AWSCloudfrontDeleteDistributionRequest
 */
- (void)deleteDistribution2019_03_26:(AWSCloudfrontDeleteDistributionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Remove a field-level encryption configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFieldLevelEncryptionConfig2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorFieldLevelEncryptionConfigInUse`.
 
 @see AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest
 */
- (AWSTask *)deleteFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest *)request;

/**
 <p>Remove a field-level encryption configuration.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFieldLevelEncryptionConfig2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorFieldLevelEncryptionConfigInUse`.
 
 @see AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest
 */
- (void)deleteFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Remove a field-level encryption profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFieldLevelEncryptionProfile2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorFieldLevelEncryptionProfileInUse`.
 
 @see AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest
 */
- (AWSTask *)deleteFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest *)request;

/**
 <p>Remove a field-level encryption profile.</p>
 
 @param request A container for the necessary parameters to execute the DeleteFieldLevelEncryptionProfile2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorFieldLevelEncryptionProfileInUse`.
 
 @see AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest
 */
- (void)deleteFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Remove a public key you previously added to CloudFront.</p>
 
 @param request A container for the necessary parameters to execute the DeletePublicKey2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorPublicKeyInUse`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchPublicKey`, `AWSCloudfrontErrorPreconditionFailed`.
 
 @see AWSCloudfrontDeletePublicKeyRequest
 */
- (AWSTask *)deletePublicKey2019_03_26:(AWSCloudfrontDeletePublicKeyRequest *)request;

/**
 <p>Remove a public key you previously added to CloudFront.</p>
 
 @param request A container for the necessary parameters to execute the DeletePublicKey2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorPublicKeyInUse`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchPublicKey`, `AWSCloudfrontErrorPreconditionFailed`.
 
 @see AWSCloudfrontDeletePublicKeyRequest
 */
- (void)deletePublicKey2019_03_26:(AWSCloudfrontDeletePublicKeyRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Delete a streaming distribution. To delete an RTMP distribution using the CloudFront API, perform the following steps.</p><p><b>To delete an RTMP distribution using the CloudFront API</b>:</p><ol><li><p>Disable the RTMP distribution.</p></li><li><p>Submit a <code>GET Streaming Distribution Config</code> request to get the current configuration and the <code>Etag</code> header for the distribution. </p></li><li><p>Update the XML document that was returned in the response to your <code>GET Streaming Distribution Config</code> request to change the value of <code>Enabled</code> to <code>false</code>.</p></li><li><p>Submit a <code>PUT Streaming Distribution Config</code> request to update the configuration for your distribution. In the request body, include the XML document that you updated in Step 3. Then set the value of the HTTP <code>If-Match</code> header to the value of the <code>ETag</code> header that CloudFront returned when you submitted the <code>GET Streaming Distribution Config</code> request in Step 2.</p></li><li><p>Review the response to the <code>PUT Streaming Distribution Config</code> request to confirm that the distribution was successfully disabled.</p></li><li><p>Submit a <code>GET Streaming Distribution Config</code> request to confirm that your changes have propagated. When propagation is complete, the value of <code>Status</code> is <code>Deployed</code>.</p></li><li><p>Submit a <code>DELETE Streaming Distribution</code> request. Set the value of the HTTP <code>If-Match</code> header to the value of the <code>ETag</code> header that CloudFront returned when you submitted the <code>GET Streaming Distribution Config</code> request in Step 2.</p></li><li><p>Review the response to your <code>DELETE Streaming Distribution</code> request to confirm that the distribution was successfully deleted.</p></li></ol><p>For information about deleting a distribution using the CloudFront console, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html">Deleting a Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStreamingDistribution2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorStreamingDistributionNotDisabled`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchStreamingDistribution`, `AWSCloudfrontErrorPreconditionFailed`.
 
 @see AWSCloudfrontDeleteStreamingDistributionRequest
 */
- (AWSTask *)deleteStreamingDistribution2019_03_26:(AWSCloudfrontDeleteStreamingDistributionRequest *)request;

/**
 <p>Delete a streaming distribution. To delete an RTMP distribution using the CloudFront API, perform the following steps.</p><p><b>To delete an RTMP distribution using the CloudFront API</b>:</p><ol><li><p>Disable the RTMP distribution.</p></li><li><p>Submit a <code>GET Streaming Distribution Config</code> request to get the current configuration and the <code>Etag</code> header for the distribution. </p></li><li><p>Update the XML document that was returned in the response to your <code>GET Streaming Distribution Config</code> request to change the value of <code>Enabled</code> to <code>false</code>.</p></li><li><p>Submit a <code>PUT Streaming Distribution Config</code> request to update the configuration for your distribution. In the request body, include the XML document that you updated in Step 3. Then set the value of the HTTP <code>If-Match</code> header to the value of the <code>ETag</code> header that CloudFront returned when you submitted the <code>GET Streaming Distribution Config</code> request in Step 2.</p></li><li><p>Review the response to the <code>PUT Streaming Distribution Config</code> request to confirm that the distribution was successfully disabled.</p></li><li><p>Submit a <code>GET Streaming Distribution Config</code> request to confirm that your changes have propagated. When propagation is complete, the value of <code>Status</code> is <code>Deployed</code>.</p></li><li><p>Submit a <code>DELETE Streaming Distribution</code> request. Set the value of the HTTP <code>If-Match</code> header to the value of the <code>ETag</code> header that CloudFront returned when you submitted the <code>GET Streaming Distribution Config</code> request in Step 2.</p></li><li><p>Review the response to your <code>DELETE Streaming Distribution</code> request to confirm that the distribution was successfully deleted.</p></li></ol><p>For information about deleting a distribution using the CloudFront console, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html">Deleting a Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.</p>
 
 @param request A container for the necessary parameters to execute the DeleteStreamingDistribution2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorStreamingDistributionNotDisabled`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchStreamingDistribution`, `AWSCloudfrontErrorPreconditionFailed`.
 
 @see AWSCloudfrontDeleteStreamingDistributionRequest
 */
- (void)deleteStreamingDistribution2019_03_26:(AWSCloudfrontDeleteStreamingDistributionRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Get the information about an origin access identity. </p>
 
 @param request A container for the necessary parameters to execute the GetCloudFrontOriginAccessIdentity2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetCloudFrontOriginAccessIdentityResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchCloudFrontOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest
 @see AWSCloudfrontGetCloudFrontOriginAccessIdentityResult
 */
- (AWSTask<AWSCloudfrontGetCloudFrontOriginAccessIdentityResult *> *)getCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest *)request;

/**
 <p>Get the information about an origin access identity. </p>
 
 @param request A container for the necessary parameters to execute the GetCloudFrontOriginAccessIdentity2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchCloudFrontOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest
 @see AWSCloudfrontGetCloudFrontOriginAccessIdentityResult
 */
- (void)getCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetCloudFrontOriginAccessIdentityResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the configuration information about an origin access identity. </p>
 
 @param request A container for the necessary parameters to execute the GetCloudFrontOriginAccessIdentityConfig2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchCloudFrontOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest
 @see AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult
 */
- (AWSTask<AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult *> *)getCloudFrontOriginAccessIdentityConfig2019_03_26:(AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest *)request;

/**
 <p>Get the configuration information about an origin access identity. </p>
 
 @param request A container for the necessary parameters to execute the GetCloudFrontOriginAccessIdentityConfig2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchCloudFrontOriginAccessIdentity`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest
 @see AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult
 */
- (void)getCloudFrontOriginAccessIdentityConfig2019_03_26:(AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the information about a distribution.</p>
 
 @param request A container for the necessary parameters to execute the GetDistribution2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetDistributionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetDistributionRequest
 @see AWSCloudfrontGetDistributionResult
 */
- (AWSTask<AWSCloudfrontGetDistributionResult *> *)getDistribution2019_03_26:(AWSCloudfrontGetDistributionRequest *)request;

/**
 <p>Get the information about a distribution.</p>
 
 @param request A container for the necessary parameters to execute the GetDistribution2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetDistributionRequest
 @see AWSCloudfrontGetDistributionResult
 */
- (void)getDistribution2019_03_26:(AWSCloudfrontGetDistributionRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetDistributionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the configuration information about a distribution. </p>
 
 @param request A container for the necessary parameters to execute the GetDistributionConfig2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetDistributionConfigResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetDistributionConfigRequest
 @see AWSCloudfrontGetDistributionConfigResult
 */
- (AWSTask<AWSCloudfrontGetDistributionConfigResult *> *)getDistributionConfig2019_03_26:(AWSCloudfrontGetDistributionConfigRequest *)request;

/**
 <p>Get the configuration information about a distribution. </p>
 
 @param request A container for the necessary parameters to execute the GetDistributionConfig2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetDistributionConfigRequest
 @see AWSCloudfrontGetDistributionConfigResult
 */
- (void)getDistributionConfig2019_03_26:(AWSCloudfrontGetDistributionConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetDistributionConfigResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the field-level encryption configuration information.</p>
 
 @param request A container for the necessary parameters to execute the GetFieldLevelEncryption2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetFieldLevelEncryptionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`.
 
 @see AWSCloudfrontGetFieldLevelEncryptionRequest
 @see AWSCloudfrontGetFieldLevelEncryptionResult
 */
- (AWSTask<AWSCloudfrontGetFieldLevelEncryptionResult *> *)getFieldLevelEncryption2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionRequest *)request;

/**
 <p>Get the field-level encryption configuration information.</p>
 
 @param request A container for the necessary parameters to execute the GetFieldLevelEncryption2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`.
 
 @see AWSCloudfrontGetFieldLevelEncryptionRequest
 @see AWSCloudfrontGetFieldLevelEncryptionResult
 */
- (void)getFieldLevelEncryption2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetFieldLevelEncryptionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the field-level encryption configuration information.</p>
 
 @param request A container for the necessary parameters to execute the GetFieldLevelEncryptionConfig2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetFieldLevelEncryptionConfigResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`.
 
 @see AWSCloudfrontGetFieldLevelEncryptionConfigRequest
 @see AWSCloudfrontGetFieldLevelEncryptionConfigResult
 */
- (AWSTask<AWSCloudfrontGetFieldLevelEncryptionConfigResult *> *)getFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionConfigRequest *)request;

/**
 <p>Get the field-level encryption configuration information.</p>
 
 @param request A container for the necessary parameters to execute the GetFieldLevelEncryptionConfig2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`.
 
 @see AWSCloudfrontGetFieldLevelEncryptionConfigRequest
 @see AWSCloudfrontGetFieldLevelEncryptionConfigResult
 */
- (void)getFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetFieldLevelEncryptionConfigResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the field-level encryption profile information.</p>
 
 @param request A container for the necessary parameters to execute the GetFieldLevelEncryptionProfile2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetFieldLevelEncryptionProfileResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`.
 
 @see AWSCloudfrontGetFieldLevelEncryptionProfileRequest
 @see AWSCloudfrontGetFieldLevelEncryptionProfileResult
 */
- (AWSTask<AWSCloudfrontGetFieldLevelEncryptionProfileResult *> *)getFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionProfileRequest *)request;

/**
 <p>Get the field-level encryption profile information.</p>
 
 @param request A container for the necessary parameters to execute the GetFieldLevelEncryptionProfile2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`.
 
 @see AWSCloudfrontGetFieldLevelEncryptionProfileRequest
 @see AWSCloudfrontGetFieldLevelEncryptionProfileResult
 */
- (void)getFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetFieldLevelEncryptionProfileResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the field-level encryption profile configuration information.</p>
 
 @param request A container for the necessary parameters to execute the GetFieldLevelEncryptionProfileConfig2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`.
 
 @see AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest
 @see AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult
 */
- (AWSTask<AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult *> *)getFieldLevelEncryptionProfileConfig2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest *)request;

/**
 <p>Get the field-level encryption profile configuration information.</p>
 
 @param request A container for the necessary parameters to execute the GetFieldLevelEncryptionProfileConfig2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`.
 
 @see AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest
 @see AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult
 */
- (void)getFieldLevelEncryptionProfileConfig2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the information about an invalidation. </p>
 
 @param request A container for the necessary parameters to execute the GetInvalidation2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetInvalidationResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchInvalidation`, `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetInvalidationRequest
 @see AWSCloudfrontGetInvalidationResult
 */
- (AWSTask<AWSCloudfrontGetInvalidationResult *> *)getInvalidation2019_03_26:(AWSCloudfrontGetInvalidationRequest *)request;

/**
 <p>Get the information about an invalidation. </p>
 
 @param request A container for the necessary parameters to execute the GetInvalidation2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchInvalidation`, `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetInvalidationRequest
 @see AWSCloudfrontGetInvalidationResult
 */
- (void)getInvalidation2019_03_26:(AWSCloudfrontGetInvalidationRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetInvalidationResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the public key information.</p>
 
 @param request A container for the necessary parameters to execute the GetPublicKey2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetPublicKeyResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchPublicKey`.
 
 @see AWSCloudfrontGetPublicKeyRequest
 @see AWSCloudfrontGetPublicKeyResult
 */
- (AWSTask<AWSCloudfrontGetPublicKeyResult *> *)getPublicKey2019_03_26:(AWSCloudfrontGetPublicKeyRequest *)request;

/**
 <p>Get the public key information.</p>
 
 @param request A container for the necessary parameters to execute the GetPublicKey2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchPublicKey`.
 
 @see AWSCloudfrontGetPublicKeyRequest
 @see AWSCloudfrontGetPublicKeyResult
 */
- (void)getPublicKey2019_03_26:(AWSCloudfrontGetPublicKeyRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetPublicKeyResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Return public key configuration informaation</p>
 
 @param request A container for the necessary parameters to execute the GetPublicKeyConfig2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetPublicKeyConfigResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchPublicKey`.
 
 @see AWSCloudfrontGetPublicKeyConfigRequest
 @see AWSCloudfrontGetPublicKeyConfigResult
 */
- (AWSTask<AWSCloudfrontGetPublicKeyConfigResult *> *)getPublicKeyConfig2019_03_26:(AWSCloudfrontGetPublicKeyConfigRequest *)request;

/**
 <p>Return public key configuration informaation</p>
 
 @param request A container for the necessary parameters to execute the GetPublicKeyConfig2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorNoSuchPublicKey`.
 
 @see AWSCloudfrontGetPublicKeyConfigRequest
 @see AWSCloudfrontGetPublicKeyConfigResult
 */
- (void)getPublicKeyConfig2019_03_26:(AWSCloudfrontGetPublicKeyConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetPublicKeyConfigResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Gets information about a specified RTMP distribution, including the distribution configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetStreamingDistribution2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetStreamingDistributionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchStreamingDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetStreamingDistributionRequest
 @see AWSCloudfrontGetStreamingDistributionResult
 */
- (AWSTask<AWSCloudfrontGetStreamingDistributionResult *> *)getStreamingDistribution2019_03_26:(AWSCloudfrontGetStreamingDistributionRequest *)request;

/**
 <p>Gets information about a specified RTMP distribution, including the distribution configuration.</p>
 
 @param request A container for the necessary parameters to execute the GetStreamingDistribution2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchStreamingDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetStreamingDistributionRequest
 @see AWSCloudfrontGetStreamingDistributionResult
 */
- (void)getStreamingDistribution2019_03_26:(AWSCloudfrontGetStreamingDistributionRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetStreamingDistributionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Get the configuration information about a streaming distribution. </p>
 
 @param request A container for the necessary parameters to execute the GetStreamingDistributionConfig2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontGetStreamingDistributionConfigResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchStreamingDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetStreamingDistributionConfigRequest
 @see AWSCloudfrontGetStreamingDistributionConfigResult
 */
- (AWSTask<AWSCloudfrontGetStreamingDistributionConfigResult *> *)getStreamingDistributionConfig2019_03_26:(AWSCloudfrontGetStreamingDistributionConfigRequest *)request;

/**
 <p>Get the configuration information about a streaming distribution. </p>
 
 @param request A container for the necessary parameters to execute the GetStreamingDistributionConfig2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorNoSuchStreamingDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontGetStreamingDistributionConfigRequest
 @see AWSCloudfrontGetStreamingDistributionConfigResult
 */
- (void)getStreamingDistributionConfig2019_03_26:(AWSCloudfrontGetStreamingDistributionConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontGetStreamingDistributionConfigResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists origin access identities.</p>
 
 @param request A container for the necessary parameters to execute the ListCloudFrontOriginAccessIdentities2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest
 @see AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult
 */
- (AWSTask<AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult *> *)listCloudFrontOriginAccessIdentities2019_03_26:(AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest *)request;

/**
 <p>Lists origin access identities.</p>
 
 @param request A container for the necessary parameters to execute the ListCloudFrontOriginAccessIdentities2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest
 @see AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult
 */
- (void)listCloudFrontOriginAccessIdentities2019_03_26:(AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List CloudFront distributions.</p>
 
 @param request A container for the necessary parameters to execute the ListDistributions2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontListDistributionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListDistributionsRequest
 @see AWSCloudfrontListDistributionsResult
 */
- (AWSTask<AWSCloudfrontListDistributionsResult *> *)listDistributions2019_03_26:(AWSCloudfrontListDistributionsRequest *)request;

/**
 <p>List CloudFront distributions.</p>
 
 @param request A container for the necessary parameters to execute the ListDistributions2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListDistributionsRequest
 @see AWSCloudfrontListDistributionsResult
 */
- (void)listDistributions2019_03_26:(AWSCloudfrontListDistributionsRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontListDistributionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List the distributions that are associated with a specified AWS WAF web ACL. </p>
 
 @param request A container for the necessary parameters to execute the ListDistributionsByWebACLId2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontListDistributionsByWebACLIdResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidWebACLId`.
 
 @see AWSCloudfrontListDistributionsByWebACLIdRequest
 @see AWSCloudfrontListDistributionsByWebACLIdResult
 */
- (AWSTask<AWSCloudfrontListDistributionsByWebACLIdResult *> *)listDistributionsByWebACLId2019_03_26:(AWSCloudfrontListDistributionsByWebACLIdRequest *)request;

/**
 <p>List the distributions that are associated with a specified AWS WAF web ACL. </p>
 
 @param request A container for the necessary parameters to execute the ListDistributionsByWebACLId2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidWebACLId`.
 
 @see AWSCloudfrontListDistributionsByWebACLIdRequest
 @see AWSCloudfrontListDistributionsByWebACLIdResult
 */
- (void)listDistributionsByWebACLId2019_03_26:(AWSCloudfrontListDistributionsByWebACLIdRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontListDistributionsByWebACLIdResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all field-level encryption configurations that have been created in CloudFront for this account.</p>
 
 @param request A container for the necessary parameters to execute the ListFieldLevelEncryptionConfigs2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontListFieldLevelEncryptionConfigsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListFieldLevelEncryptionConfigsRequest
 @see AWSCloudfrontListFieldLevelEncryptionConfigsResult
 */
- (AWSTask<AWSCloudfrontListFieldLevelEncryptionConfigsResult *> *)listFieldLevelEncryptionConfigs2019_03_26:(AWSCloudfrontListFieldLevelEncryptionConfigsRequest *)request;

/**
 <p>List all field-level encryption configurations that have been created in CloudFront for this account.</p>
 
 @param request A container for the necessary parameters to execute the ListFieldLevelEncryptionConfigs2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListFieldLevelEncryptionConfigsRequest
 @see AWSCloudfrontListFieldLevelEncryptionConfigsResult
 */
- (void)listFieldLevelEncryptionConfigs2019_03_26:(AWSCloudfrontListFieldLevelEncryptionConfigsRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontListFieldLevelEncryptionConfigsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Request a list of field-level encryption profiles that have been created in CloudFront for this account.</p>
 
 @param request A container for the necessary parameters to execute the ListFieldLevelEncryptionProfiles2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontListFieldLevelEncryptionProfilesResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListFieldLevelEncryptionProfilesRequest
 @see AWSCloudfrontListFieldLevelEncryptionProfilesResult
 */
- (AWSTask<AWSCloudfrontListFieldLevelEncryptionProfilesResult *> *)listFieldLevelEncryptionProfiles2019_03_26:(AWSCloudfrontListFieldLevelEncryptionProfilesRequest *)request;

/**
 <p>Request a list of field-level encryption profiles that have been created in CloudFront for this account.</p>
 
 @param request A container for the necessary parameters to execute the ListFieldLevelEncryptionProfiles2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListFieldLevelEncryptionProfilesRequest
 @see AWSCloudfrontListFieldLevelEncryptionProfilesResult
 */
- (void)listFieldLevelEncryptionProfiles2019_03_26:(AWSCloudfrontListFieldLevelEncryptionProfilesRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontListFieldLevelEncryptionProfilesResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Lists invalidation batches. </p>
 
 @param request A container for the necessary parameters to execute the ListInvalidations2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontListInvalidationsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontListInvalidationsRequest
 @see AWSCloudfrontListInvalidationsResult
 */
- (AWSTask<AWSCloudfrontListInvalidationsResult *> *)listInvalidations2019_03_26:(AWSCloudfrontListInvalidationsRequest *)request;

/**
 <p>Lists invalidation batches. </p>
 
 @param request A container for the necessary parameters to execute the ListInvalidations2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorAccessDenied`.
 
 @see AWSCloudfrontListInvalidationsRequest
 @see AWSCloudfrontListInvalidationsResult
 */
- (void)listInvalidations2019_03_26:(AWSCloudfrontListInvalidationsRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontListInvalidationsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List all public keys that have been added to CloudFront for this account.</p>
 
 @param request A container for the necessary parameters to execute the ListPublicKeys2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontListPublicKeysResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListPublicKeysRequest
 @see AWSCloudfrontListPublicKeysResult
 */
- (AWSTask<AWSCloudfrontListPublicKeysResult *> *)listPublicKeys2019_03_26:(AWSCloudfrontListPublicKeysRequest *)request;

/**
 <p>List all public keys that have been added to CloudFront for this account.</p>
 
 @param request A container for the necessary parameters to execute the ListPublicKeys2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListPublicKeysRequest
 @see AWSCloudfrontListPublicKeysResult
 */
- (void)listPublicKeys2019_03_26:(AWSCloudfrontListPublicKeysRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontListPublicKeysResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List streaming distributions. </p>
 
 @param request A container for the necessary parameters to execute the ListStreamingDistributions2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontListStreamingDistributionsResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListStreamingDistributionsRequest
 @see AWSCloudfrontListStreamingDistributionsResult
 */
- (AWSTask<AWSCloudfrontListStreamingDistributionsResult *> *)listStreamingDistributions2019_03_26:(AWSCloudfrontListStreamingDistributionsRequest *)request;

/**
 <p>List streaming distributions. </p>
 
 @param request A container for the necessary parameters to execute the ListStreamingDistributions2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorInvalidArgument`.
 
 @see AWSCloudfrontListStreamingDistributionsRequest
 @see AWSCloudfrontListStreamingDistributionsResult
 */
- (void)listStreamingDistributions2019_03_26:(AWSCloudfrontListStreamingDistributionsRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontListStreamingDistributionsResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>List tags for a CloudFront resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontListTagsForResourceResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidTagging`, `AWSCloudfrontErrorNoSuchResource`.
 
 @see AWSCloudfrontListTagsForResourceRequest
 @see AWSCloudfrontListTagsForResourceResult
 */
- (AWSTask<AWSCloudfrontListTagsForResourceResult *> *)listTagsForResource2019_03_26:(AWSCloudfrontListTagsForResourceRequest *)request;

/**
 <p>List tags for a CloudFront resource.</p>
 
 @param request A container for the necessary parameters to execute the ListTagsForResource2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidTagging`, `AWSCloudfrontErrorNoSuchResource`.
 
 @see AWSCloudfrontListTagsForResourceRequest
 @see AWSCloudfrontListTagsForResourceResult
 */
- (void)listTagsForResource2019_03_26:(AWSCloudfrontListTagsForResourceRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontListTagsForResourceResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Add tags to a CloudFront resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidTagging`, `AWSCloudfrontErrorNoSuchResource`.
 
 @see AWSCloudfrontTagResourceRequest
 */
- (AWSTask *)tagResource2019_03_26:(AWSCloudfrontTagResourceRequest *)request;

/**
 <p>Add tags to a CloudFront resource.</p>
 
 @param request A container for the necessary parameters to execute the TagResource2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidTagging`, `AWSCloudfrontErrorNoSuchResource`.
 
 @see AWSCloudfrontTagResourceRequest
 */
- (void)tagResource2019_03_26:(AWSCloudfrontTagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Remove tags from a CloudFront resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidTagging`, `AWSCloudfrontErrorNoSuchResource`.
 
 @see AWSCloudfrontUntagResourceRequest
 */
- (AWSTask *)untagResource2019_03_26:(AWSCloudfrontUntagResourceRequest *)request;

/**
 <p>Remove tags from a CloudFront resource.</p>
 
 @param request A container for the necessary parameters to execute the UntagResource2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidTagging`, `AWSCloudfrontErrorNoSuchResource`.
 
 @see AWSCloudfrontUntagResourceRequest
 */
- (void)untagResource2019_03_26:(AWSCloudfrontUntagResourceRequest *)request completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler;

/**
 <p>Update an origin access identity. </p>
 
 @param request A container for the necessary parameters to execute the UpdateCloudFrontOriginAccessIdentity2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorNoSuchCloudFrontOriginAccessIdentity`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInconsistentQuantities`.
 
 @see AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest
 @see AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult
 */
- (AWSTask<AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult *> *)updateCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest *)request;

/**
 <p>Update an origin access identity. </p>
 
 @param request A container for the necessary parameters to execute the UpdateCloudFrontOriginAccessIdentity2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorNoSuchCloudFrontOriginAccessIdentity`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInconsistentQuantities`.
 
 @see AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest
 @see AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult
 */
- (void)updateCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Updates the configuration for a web distribution. </p><important><p>When you update a distribution, there are more required fields than when you create a distribution. When you update your distribution by using this API action, follow the steps here to get the current configuration and then make your updates, to make sure that you include all of the required fields. To view a summary, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html">Required Fields for Create Distribution and Update Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.</p></important><p>The update process includes getting the current distribution configuration, updating the XML document that is returned to make your changes, and then submitting an <code>UpdateDistribution</code> request to make the updates.</p><p>For information about updating a distribution using the CloudFront console instead, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-creating-console.html">Creating a Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><p><b>To update a web distribution using the CloudFront API</b></p><ol><li><p>Submit a <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistributionConfig.html">GetDistributionConfig</a> request to get the current configuration and an <code>Etag</code> header for the distribution.</p><note><p>If you update the distribution again, you must get a new <code>Etag</code> header.</p></note></li><li><p>Update the XML document that was returned in the response to your <code>GetDistributionConfig</code> request to include your changes. </p><important><p>When you edit the XML file, be aware of the following:</p><ul><li><p>You must strip out the ETag parameter that is returned.</p></li><li><p>Additional fields are required when you update a distribution. There may be fields included in the XML file for features that you haven't configured for your distribution. This is expected and required to successfully update the distribution.</p></li><li><p>You can't change the value of <code>CallerReference</code>. If you try to change this value, CloudFront returns an <code>IllegalUpdate</code> error. </p></li><li><p>The new configuration replaces the existing configuration; the values that you specify in an <code>UpdateDistribution</code> request are not merged into your existing configuration. When you add, delete, or replace values in an element that allows multiple values (for example, <code>CNAME</code>), you must specify all of the values that you want to appear in the updated distribution. In addition, you must update the corresponding <code>Quantity</code> element.</p></li></ul></important></li><li><p>Submit an <code>UpdateDistribution</code> request to update the configuration for your distribution:</p><ul><li><p>In the request body, include the XML document that you updated in Step 2. The request body must include an XML document with a <code>DistributionConfig</code> element.</p></li><li><p>Set the value of the HTTP <code>If-Match</code> header to the value of the <code>ETag</code> header that CloudFront returned when you submitted the <code>GetDistributionConfig</code> request in Step 1.</p></li></ul></li><li><p>Review the response to the <code>UpdateDistribution</code> request to confirm that the configuration was successfully updated.</p></li><li><p>Optional: Submit a <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistribution.html">GetDistribution</a> request to confirm that your changes have propagated. When propagation is complete, the value of <code>Status</code> is <code>Deployed</code>.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the UpdateDistribution2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontUpdateDistributionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorTooManyDistributionCNAMEs`, `AWSCloudfrontErrorInvalidDefaultRootObject`, `AWSCloudfrontErrorInvalidRelativePath`, `AWSCloudfrontErrorInvalidErrorCode`, `AWSCloudfrontErrorInvalidResponseCode`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorInvalidViewerCertificate`, `AWSCloudfrontErrorInvalidMinimumProtocolVersion`, `AWSCloudfrontErrorInvalidRequiredProtocol`, `AWSCloudfrontErrorNoSuchOrigin`, `AWSCloudfrontErrorTooManyOrigins`, `AWSCloudfrontErrorTooManyOriginGroupsPerDistribution`, `AWSCloudfrontErrorTooManyCacheBehaviors`, `AWSCloudfrontErrorTooManyCookieNamesInWhiteList`, `AWSCloudfrontErrorInvalidForwardCookies`, `AWSCloudfrontErrorTooManyHeadersInForwardedValues`, `AWSCloudfrontErrorInvalidHeadersForS3Origin`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorTooManyCertificates`, `AWSCloudfrontErrorInvalidLocationCode`, `AWSCloudfrontErrorInvalidGeoRestrictionParameter`, `AWSCloudfrontErrorInvalidTTLOrder`, `AWSCloudfrontErrorInvalidWebACLId`, `AWSCloudfrontErrorTooManyOriginCustomHeaders`, `AWSCloudfrontErrorTooManyQueryStringParameters`, `AWSCloudfrontErrorInvalidQueryStringParameters`, `AWSCloudfrontErrorTooManyDistributionsWithLambdaAssociations`, `AWSCloudfrontErrorTooManyLambdaFunctionAssociations`, `AWSCloudfrontErrorInvalidLambdaFunctionAssociation`, `AWSCloudfrontErrorInvalidOriginReadTimeout`, `AWSCloudfrontErrorInvalidOriginKeepaliveTimeout`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`, `AWSCloudfrontErrorIllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior`, `AWSCloudfrontErrorTooManyDistributionsAssociatedToFieldLevelEncryptionConfig`.
 
 @see AWSCloudfrontUpdateDistributionRequest
 @see AWSCloudfrontUpdateDistributionResult
 */
- (AWSTask<AWSCloudfrontUpdateDistributionResult *> *)updateDistribution2019_03_26:(AWSCloudfrontUpdateDistributionRequest *)request;

/**
 <p>Updates the configuration for a web distribution. </p><important><p>When you update a distribution, there are more required fields than when you create a distribution. When you update your distribution by using this API action, follow the steps here to get the current configuration and then make your updates, to make sure that you include all of the required fields. To view a summary, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html">Required Fields for Create Distribution and Update Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.</p></important><p>The update process includes getting the current distribution configuration, updating the XML document that is returned to make your changes, and then submitting an <code>UpdateDistribution</code> request to make the updates.</p><p>For information about updating a distribution using the CloudFront console instead, see <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-creating-console.html">Creating a Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.</p><p><b>To update a web distribution using the CloudFront API</b></p><ol><li><p>Submit a <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistributionConfig.html">GetDistributionConfig</a> request to get the current configuration and an <code>Etag</code> header for the distribution.</p><note><p>If you update the distribution again, you must get a new <code>Etag</code> header.</p></note></li><li><p>Update the XML document that was returned in the response to your <code>GetDistributionConfig</code> request to include your changes. </p><important><p>When you edit the XML file, be aware of the following:</p><ul><li><p>You must strip out the ETag parameter that is returned.</p></li><li><p>Additional fields are required when you update a distribution. There may be fields included in the XML file for features that you haven't configured for your distribution. This is expected and required to successfully update the distribution.</p></li><li><p>You can't change the value of <code>CallerReference</code>. If you try to change this value, CloudFront returns an <code>IllegalUpdate</code> error. </p></li><li><p>The new configuration replaces the existing configuration; the values that you specify in an <code>UpdateDistribution</code> request are not merged into your existing configuration. When you add, delete, or replace values in an element that allows multiple values (for example, <code>CNAME</code>), you must specify all of the values that you want to appear in the updated distribution. In addition, you must update the corresponding <code>Quantity</code> element.</p></li></ul></important></li><li><p>Submit an <code>UpdateDistribution</code> request to update the configuration for your distribution:</p><ul><li><p>In the request body, include the XML document that you updated in Step 2. The request body must include an XML document with a <code>DistributionConfig</code> element.</p></li><li><p>Set the value of the HTTP <code>If-Match</code> header to the value of the <code>ETag</code> header that CloudFront returned when you submitted the <code>GetDistributionConfig</code> request in Step 1.</p></li></ul></li><li><p>Review the response to the <code>UpdateDistribution</code> request to confirm that the configuration was successfully updated.</p></li><li><p>Optional: Submit a <a href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistribution.html">GetDistribution</a> request to confirm that your changes have propagated. When propagation is complete, the value of <code>Status</code> is <code>Deployed</code>.</p></li></ol>
 
 @param request A container for the necessary parameters to execute the UpdateDistribution2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorNoSuchDistribution`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorTooManyDistributionCNAMEs`, `AWSCloudfrontErrorInvalidDefaultRootObject`, `AWSCloudfrontErrorInvalidRelativePath`, `AWSCloudfrontErrorInvalidErrorCode`, `AWSCloudfrontErrorInvalidResponseCode`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorInvalidViewerCertificate`, `AWSCloudfrontErrorInvalidMinimumProtocolVersion`, `AWSCloudfrontErrorInvalidRequiredProtocol`, `AWSCloudfrontErrorNoSuchOrigin`, `AWSCloudfrontErrorTooManyOrigins`, `AWSCloudfrontErrorTooManyOriginGroupsPerDistribution`, `AWSCloudfrontErrorTooManyCacheBehaviors`, `AWSCloudfrontErrorTooManyCookieNamesInWhiteList`, `AWSCloudfrontErrorInvalidForwardCookies`, `AWSCloudfrontErrorTooManyHeadersInForwardedValues`, `AWSCloudfrontErrorInvalidHeadersForS3Origin`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorTooManyCertificates`, `AWSCloudfrontErrorInvalidLocationCode`, `AWSCloudfrontErrorInvalidGeoRestrictionParameter`, `AWSCloudfrontErrorInvalidTTLOrder`, `AWSCloudfrontErrorInvalidWebACLId`, `AWSCloudfrontErrorTooManyOriginCustomHeaders`, `AWSCloudfrontErrorTooManyQueryStringParameters`, `AWSCloudfrontErrorInvalidQueryStringParameters`, `AWSCloudfrontErrorTooManyDistributionsWithLambdaAssociations`, `AWSCloudfrontErrorTooManyLambdaFunctionAssociations`, `AWSCloudfrontErrorInvalidLambdaFunctionAssociation`, `AWSCloudfrontErrorInvalidOriginReadTimeout`, `AWSCloudfrontErrorInvalidOriginKeepaliveTimeout`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`, `AWSCloudfrontErrorIllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior`, `AWSCloudfrontErrorTooManyDistributionsAssociatedToFieldLevelEncryptionConfig`.
 
 @see AWSCloudfrontUpdateDistributionRequest
 @see AWSCloudfrontUpdateDistributionResult
 */
- (void)updateDistribution2019_03_26:(AWSCloudfrontUpdateDistributionRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontUpdateDistributionResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update a field-level encryption configuration. </p>
 
 @param request A container for the necessary parameters to execute the UpdateFieldLevelEncryptionConfig2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontUpdateFieldLevelEncryptionConfigResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionQueryArgProfiles`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionContentTypeProfiles`, `AWSCloudfrontErrorQueryArgProfileEmpty`.
 
 @see AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest
 @see AWSCloudfrontUpdateFieldLevelEncryptionConfigResult
 */
- (AWSTask<AWSCloudfrontUpdateFieldLevelEncryptionConfigResult *> *)updateFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest *)request;

/**
 <p>Update a field-level encryption configuration. </p>
 
 @param request A container for the necessary parameters to execute the UpdateFieldLevelEncryptionConfig2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionQueryArgProfiles`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionContentTypeProfiles`, `AWSCloudfrontErrorQueryArgProfileEmpty`.
 
 @see AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest
 @see AWSCloudfrontUpdateFieldLevelEncryptionConfigResult
 */
- (void)updateFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontUpdateFieldLevelEncryptionConfigResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update a field-level encryption profile. </p>
 
 @param request A container for the necessary parameters to execute the UpdateFieldLevelEncryptionProfile2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontUpdateFieldLevelEncryptionProfileResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorFieldLevelEncryptionProfileAlreadyExists`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchPublicKey`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorFieldLevelEncryptionProfileSizeExceeded`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionEncryptionEntities`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionFieldPatterns`.
 
 @see AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest
 @see AWSCloudfrontUpdateFieldLevelEncryptionProfileResult
 */
- (AWSTask<AWSCloudfrontUpdateFieldLevelEncryptionProfileResult *> *)updateFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest *)request;

/**
 <p>Update a field-level encryption profile. </p>
 
 @param request A container for the necessary parameters to execute the UpdateFieldLevelEncryptionProfile2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorFieldLevelEncryptionProfileAlreadyExists`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorInconsistentQuantities`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorNoSuchPublicKey`, `AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorFieldLevelEncryptionProfileSizeExceeded`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionEncryptionEntities`, `AWSCloudfrontErrorTooManyFieldLevelEncryptionFieldPatterns`.
 
 @see AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest
 @see AWSCloudfrontUpdateFieldLevelEncryptionProfileResult
 */
- (void)updateFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontUpdateFieldLevelEncryptionProfileResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update public key information. Note that the only value you can change is the comment.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePublicKey2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontUpdatePublicKeyResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorCannotChangeImmutablePublicKeyFields`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorNoSuchPublicKey`, `AWSCloudfrontErrorPreconditionFailed`.
 
 @see AWSCloudfrontUpdatePublicKeyRequest
 @see AWSCloudfrontUpdatePublicKeyResult
 */
- (AWSTask<AWSCloudfrontUpdatePublicKeyResult *> *)updatePublicKey2019_03_26:(AWSCloudfrontUpdatePublicKeyRequest *)request;

/**
 <p>Update public key information. Note that the only value you can change is the comment.</p>
 
 @param request A container for the necessary parameters to execute the UpdatePublicKey2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorCannotChangeImmutablePublicKeyFields`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorNoSuchPublicKey`, `AWSCloudfrontErrorPreconditionFailed`.
 
 @see AWSCloudfrontUpdatePublicKeyRequest
 @see AWSCloudfrontUpdatePublicKeyResult
 */
- (void)updatePublicKey2019_03_26:(AWSCloudfrontUpdatePublicKeyRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontUpdatePublicKeyResult * _Nullable response, NSError * _Nullable error))completionHandler;

/**
 <p>Update a streaming distribution. </p>
 
 @param request A container for the necessary parameters to execute the UpdateStreamingDistribution2019_03_26 service method.

 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCloudfrontUpdateStreamingDistributionResult`. On failed execution, `task.error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorNoSuchStreamingDistribution`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorTooManyStreamingDistributionCNAMEs`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorInconsistentQuantities`.
 
 @see AWSCloudfrontUpdateStreamingDistributionRequest
 @see AWSCloudfrontUpdateStreamingDistributionResult
 */
- (AWSTask<AWSCloudfrontUpdateStreamingDistributionResult *> *)updateStreamingDistribution2019_03_26:(AWSCloudfrontUpdateStreamingDistributionRequest *)request;

/**
 <p>Update a streaming distribution. </p>
 
 @param request A container for the necessary parameters to execute the UpdateStreamingDistribution2019_03_26 service method.
 @param completionHandler The completion handler to call when the load request is complete.
                          `response` - A response object, or `nil` if the request failed.
                          `error` - An error object that indicates why the request failed, or `nil` if the request was successful. On failed execution, `error` may contain an `NSError` with `AWSCloudfrontErrorDomain` domain and the following error code: `AWSCloudfrontErrorAccessDenied`, `AWSCloudfrontErrorCNAMEAlreadyExists`, `AWSCloudfrontErrorIllegalUpdate`, `AWSCloudfrontErrorInvalidIfMatchVersion`, `AWSCloudfrontErrorMissingBody`, `AWSCloudfrontErrorNoSuchStreamingDistribution`, `AWSCloudfrontErrorPreconditionFailed`, `AWSCloudfrontErrorTooManyStreamingDistributionCNAMEs`, `AWSCloudfrontErrorInvalidArgument`, `AWSCloudfrontErrorInvalidOriginAccessIdentity`, `AWSCloudfrontErrorTooManyTrustedSigners`, `AWSCloudfrontErrorTrustedSignerDoesNotExist`, `AWSCloudfrontErrorInconsistentQuantities`.
 
 @see AWSCloudfrontUpdateStreamingDistributionRequest
 @see AWSCloudfrontUpdateStreamingDistributionResult
 */
- (void)updateStreamingDistribution2019_03_26:(AWSCloudfrontUpdateStreamingDistributionRequest *)request completionHandler:(void (^ _Nullable)(AWSCloudfrontUpdateStreamingDistributionResult * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
