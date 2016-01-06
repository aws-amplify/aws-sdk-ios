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

#import "AWSIoTService.h"

//CreateCertificateWithResponse
@interface AWSIoTCreateCertificateResponse : AWSModel

@property (nonatomic, strong) NSString *certificateArn;
@property (nonatomic, strong) NSString *certificateId;
@property (nonatomic, strong) NSString *certificatePem;

@end

@interface AWSIoTManager : AWSService

/**
 The service configuration used to instantiate this service client.

 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

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

     let IoTManager = AWSIoTManager.defaultIoTManager()

 *Objective-C*

     AWSIoTManager *IoTManager = [AWSIoTManager defaultIoTManager];

 @return The default service client.
 */
+ (instancetype)defaultIoTManager;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSIoTManager.registerIoTManagerWithConfiguration(configuration, forKey: "USWest2IoTManager")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSIoTManager registerIoTManagerWithConfiguration:configuration forKey:@"USWest2IoTManager"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let IoTManager = AWSIoTManager(forKey: "USWest2IoTManager")

 *Objective-C*

     AWSIoTManager *IoTManager = [AWSIoTManager IoTManagerForKey:@"USWest2IoTManager"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 
 @return The service client configured as requested

 */
+ (void)registerIoTManagerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerIoTManagerWithConfiguration:forKey:` before invoking this method. If `+ registerIoTManagerWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSIoTManager.registerIoTManagerWithConfiguration(configuration, forKey: "USWest2IoTManager")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSIoTManager registerIoTManagerWithConfiguration:configuration forKey:@"USWest2IoTManager"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let IoTManager = AWSIoTManager(forKey: "USWest2IoTManager")

 *Objective-C*

     AWSIoTManager *IoTManager = [AWSIoTManager IoTManagerForKey:@"USWest2IoTManager"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)IoTManagerForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.

 @warning Before calling this method, make sure no method is running on this client.

 @param key A string to identify the service client.
 */
+ (void)removeIoTManagerForKey:(NSString *)key;

/**
 *  Creates keys and certificate from a CSR created using the specified dictionary
 *
 *  @param csrDictionary contains values used to generate the CSR.  Requires values for
 *    keys: commonName, countryName, organizationName, organizationalUnitName
 *
 *  @param callback When new certificate is created the function of block will be called with an instance of `AWSIOTDescribeCertificateResponse`
 */
- (void)createKeysAndCertificateFromCsr:(NSDictionary *)csrDictionary callback:(void (^)(AWSIoTCreateCertificateResponse *mainResponse))callback;


// openssl pkcs12 -export -in cert.pem -inkey key.pem -CAFile root-ca.crt -out cloud-key.p12
/**
 * Import PKCS12 into keychain.
 *
 * @param pk12Data pk12 raw data. Will only import the first item.
 *
 * @param passPhrase Pass pharse used to decrypt the pk12 data.
 *
 * @param certificateId Unique identifier used to find the key/certificate for use.
 *
 */
+ (bool)importPKCS12:(NSData *)pk12Data withPassPharse:(NSString *)passPhrase forCertificateId:(NSString *)certificateId;

/**
 *  Validates the certificate with the given identifier of certificate.
 *
 *  @param certificateId The certificate identifier
 *
 *  @return TRUE if certificate is valid, else FALSE
 */
+ (BOOL)isValidCertificate:(NSString *)certificateId;

/**
 *  Deletes keys and certificate
 *
*  @return TRUE if certificate is deleted, else FALSE
 */
+ (BOOL)deleteCertificate;

@end
