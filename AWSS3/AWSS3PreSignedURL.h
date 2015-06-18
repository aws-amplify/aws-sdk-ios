/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <AWSCore/AWSService.h>

FOUNDATION_EXPORT NSString *const AWSS3PresignedURLErrorDomain;
typedef NS_ENUM(NSInteger, AWSS3PresignedURLErrorType) {
    AWSS3PresignedURLErrorUnknown,
    AWSS3PresignedURLErrorAccessKeyIsNil,
    AWSS3PresignedURLErrorSecretKeyIsNil,
    AWSS3PresignedURLErrorBucketNameIsNil,
    AWSS3PresignedURLErrorKeyNameIsNil,
    AWSS3PresignedURLErrorInvalidExpiresDate,
    AWSS3PresignedURLErrorUnsupportedHTTPVerbs,
    AWSS3PresignedURLErrorEndpointIsNil,
    AWSS3PresignedURLErrorInvalidServiceType,
    AWSS3PreSignedURLErrorCredentialProviderIsNil,
};

@class AWSS3GetPreSignedURLRequest;

@interface AWSS3PreSignedURLBuilder : AWSService

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

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

     let S3PreSignedURLBuilder = AWSS3PreSignedURLBuilder.defaultS3PreSignedURLBuilder()

 *Objective-C*

     AWSS3PreSignedURLBuilder *S3PreSignedURLBuilder = [AWSS3PreSignedURLBuilder defaultS3PreSignedURLBuilder];

 @return The default service client.
 */
+ (instancetype)defaultS3PreSignedURLBuilder;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSS3PreSignedURLBuilder.registerS3PreSignedURLBuilderWithConfiguration(configuration, forKey: "USWest2S3PreSignedURLBuilder")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSS3PreSignedURLBuilder registerS3PreSignedURLBuilderWithConfiguration:configuration forKey:@"USWest2S3PreSignedURLBuilder"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let S3PreSignedURLBuilder = AWSS3PreSignedURLBuilder(forKey: "USWest2S3PreSignedURLBuilder")

 *Objective-C*

     AWSS3PreSignedURLBuilder *S3PreSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:@"USWest2S3PreSignedURLBuilder"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerS3PreSignedURLBuilderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerS3PreSignedURLBuilderWithConfiguration:forKey:` before invoking this method. If `+ registerS3PreSignedURLBuilderWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSS3PreSignedURLBuilder.registerS3PreSignedURLBuilderWithConfiguration(configuration, forKey: "USWest2S3PreSignedURLBuilder")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSS3PreSignedURLBuilder registerS3PreSignedURLBuilderWithConfiguration:configuration forKey:@"USWest2S3PreSignedURLBuilder"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let S3PreSignedURLBuilder = AWSS3PreSignedURLBuilder(forKey: "USWest2S3PreSignedURLBuilder")

 *Objective-C*

     AWSS3PreSignedURLBuilder *S3PreSignedURLBuilder = [AWSS3PreSignedURLBuilder S3PreSignedURLBuilderForKey:@"USWest2S3PreSignedURLBuilder"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)S3PreSignedURLBuilderForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.

 @warning Before calling this method, make sure no method is running on this client.

 @param key A string to identify the service client.
 */
+ (void)removeS3PreSignedURLBuilderForKey:(NSString *)key;

/**
 a AWSServiceConfiguration object contains credentialsProvider and endpoint instance.
 credentialProvider contains accessKey, secretKey, and maybe sessionKey if STS credential is used.
 endpoint contains regionType and serviceType. If endpoint is nil, AWSRegionUSEast1 and AWSServiceS3 will be used as default value.

 @warning This method has been deprecated. Use `+ registerS3PreSignedURLBuilderWithConfiguration:forKey:` and `+ S3PreSignedURLBuilderForKey:` instead.

 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration __attribute__ ((deprecated("Use '+ registerS3PreSignedURLBuilderWithConfiguration:forKey:' and '+ S3PreSignedURLBuilderForKey:' instead.")));

/**
 Build a time-limited pre-signed URL to get object from S3, return nil if build process failed.

 @param preSignedURLRequest The AWSS3PreSignedURLRequest that defines the parameters of the operation.
 @return A pre-signed NSURL for the resource. return nil if any errors occured.
 @see AWSS3GetPreSignedURLRequest
 */
- (AWSTask *)getPreSignedURL:(AWSS3GetPreSignedURLRequest *)getPreSignedURLRequest;

@end

/** The GetPreSignedURLRequest contains the parameters used to create
 a pre signed URL.
 @see AWSS3PreSignedURLBuilder

 */
@interface AWSS3GetPreSignedURLRequest : NSObject

/**
 The name of the bucket
 */
@property (nonatomic, strong) NSString *bucket;

/**
 The name of the S3 object
 */
@property (nonatomic, strong) NSString *key;

/**
 Specifies the verb used in the pre-signed URL. accepted AWSHTTPMethodGET, AWSHTTPMethodPUT, AWSHTTPMethodHEAD.
 */
@property (nonatomic, assign) AWSHTTPMethod HTTPMethod;

/**
 The time when the signature expires, specified as an NSDate object.
 */
@property (nonatomic, strong) NSDate *expires;

/**
 (Optional) AWSS3GetPreSignedURLRequest will automatically refresh temporary credential if expiration duration in less than minimumCredentialsExpirationInterval. Only applied for credential provider using temporary token (e.g. CognitoIdentityProvider). Default value is 3000 seconds.
 */
@property (nonatomic, assign) NSTimeInterval minimumCredentialsExpirationInterval;

/**
 (Optional) VersionId used in the pre signed URL. Default is nil.
 */
@property (nonatomic, strong) NSString *versionId;

/**
 (Optional) A standard MIME type describing the format of the object data. only apply when AWSHTTPMethod property is AWSHTTPMethodPUT.
 */
@property (nonatomic, strong) NSString *contentType;

@end
