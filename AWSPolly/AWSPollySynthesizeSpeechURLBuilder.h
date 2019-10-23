//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSPollyModel.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSPollySynthesizeSpeechURLBuilderErrorDomain;

typedef NS_ENUM(NSInteger, AWSPollySynthesizeSpeechURLBuilderErrorType) {
    AWSPollySynthesizeSpeechURLBuilderErrorUnknown,
    AWSPollySynthesizeSpeechURLBuilderAccessKeyIsNil,
    AWSPollySynthesizeSpeechURLBuilderSecretKeyIsNil,
    AWSPollySynthesizeSpeechURLBuilderEndpointIsNil,
    AWSPollySynthesizeSpeechURLBuilderInvalidExpiresDate,
    AWSPollySynthesizeSpeechURLBuilderErrorInvalidServiceType,
    AWSPollySynthesizeSpeechURLBuilderCredentialProviderIsNil,
    AWSPollySynthesizeSpeechURLBuilderInternalError,
};

@interface AWSPollySynthesizeSpeechURLBuilderRequest :NSObject

/**
 <p>List of one or more lexicon names you want the service to apply during synthesis. For information about storing lexicons, see .</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable lexiconNames;

/**
 <p>Optional language code for the Synthesize Speech request. This is only necessary if using a bilingual voice, such as Aditi, which can be used for either Indian English (en-IN) or Hindi (hi-IN). </p><p>If a bilingual voice is used and no language code is specified, Amazon Polly will use the default language of the bilingual voice. The default language for any voice is the one returned by the <a href="https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a> operation for the <code>LanguageCode</code> parameter. For example, if no language code is specified, Aditi will use Indian English rather than Hindi.</p>
 */
@property (nonatomic, assign) AWSPollyLanguageCode languageCode;

/**
<p> Input text to synthesize. If you specify <code>ssml</code> as the <code>TextType</code>, follow the SSML format for the input text. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable speechMarkTypes;

/**
 <p>Format to use for the resulting audio stream.</p>
 */
@property (nonatomic, assign) AWSPollyOutputFormat outputFormat;

/**
 <p>The audio frequency specified in Hz. </p><p> The valid values for <code>mp3</code> and <code>ogg_vorbis</code> are "8000", "16000", and "22050". The default value is 22050.</p><p>Valid values for <code>pcm</code> are "8000" and "16000". The default value is ???.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sampleRate;

/**
 <p>Input text to synthesize. If you specify <code>ssml</code> as the <code>TextType</code>, follow the SSML format for the input text.</p>
 */
@property (nonatomic, strong) NSString * text;

/**
 <p>Specifies whether the input text is plain text or SSML. The default value is text. For more information about SSML, see <a>examples-ssml-input</a>.</p>
 */
@property (nonatomic, assign) AWSPollyTextType textType;

/**
 <p>Voice ID to use for the synthesis. You can get a list of available voice IDs by calling the operation.</p>
 */
@property (nonatomic, assign) AWSPollyVoiceId voiceId;

/**
 The time when the signature expires, specified as an NSDate object.
 */
@property (nonatomic, strong) NSDate *expires;

/**
 Specifies the engine (standard or neural) for Amazon Polly to use when processing input text for speech synthesis.
 Using a voice that is not supported for the engine selected will result in an error.
 */
@property (nonatomic, assign) AWSPollyEngine engine;

@end


@interface AWSPollySynthesizeSpeechURLBuilder : NSObject

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
        AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1 identityPoolId:@"YourIdentityPoolId"];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
 
        return YES;
    }
 
 Then call the following to get the default service client:
 
 *Swift*
 
    let PollyURLBuilder = AWSPollySynthesizeSpeechURLBuilder.default()
 
 *Objective-C*
 
    AWSPollySynthesizeSpeechURLBuilder *PollyURLBuilder = [AWSPollySynthesizeSpeechURLBuilder defaultPollySynthesizeSpeechURLBuilder];
 
 @return The default service client.
 */
+ (instancetype)defaultPollySynthesizeSpeechURLBuilder;

/**
 Creates a service client with the given service configuration and registers it for the key.
 
 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPollySynthesizeSpeechURLBuilder.register(configuration, forKey: "USWest2Polly")
 
        return true
    }
 
 *Objective-C*
 
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1 identityPoolId:@"YourIdentityPoolId"];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2 credentialsProvider:credentialsProvider];
        [AWSPollySynthesizeSpeechURLBuilder registerPollySynthesizeSpeechURLBuilder:configuration forKey:@"USWest2Polly"];
 
        return YES;
    }
 
 Then call the following to get the service client:
 
 *Swift*
 
    let PollyURLBuilder = AWSPollySynthesizeSpeechURLBuilder(forKey: "USWest2Polly")
 
 *Objective-C*
 
    AWSPollySynthesizeSpeechURLBuilder *PollyURLBuilder = [AWSPollySynthesizeSpeechURLBuilder PollySynthesizeSpeechURLBuilderForKey:@"USWest2Polly"];
 
 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.
 
 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerPollySynthesizeSpeechURLBuilder:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Creates a service client with the given service configuration and registers it for the key.
 
 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
        let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
        AWSPollySynthesizeSpeechURLBuilder.register(configuration, forKey: "USWest2Polly")
 
        return true
    }
 
 *Objective-C*
 
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1 identityPoolId:@"YourIdentityPoolId"];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2 credentialsProvider:credentialsProvider];
        [AWSPollySynthesizeSpeechURLBuilder registerPollySynthesizeSpeechURLBuilder:configuration forKey:@"USWest2Polly"];
 
        return YES;
    }
 
 Then call the following to get the service client:
 
 *Swift*
 
    let Polly = AWSPollySynthesizeSpeechURLBuilder(forKey: "USWest2Polly")
 
 *Objective-C*
 
    AWSPollySynthesizeSpeechURLBuilder *Polly = [AWSPollySynthesizeSpeechURLBuilder PollySynthesizeSpeechURLBuilderForKey:@"USWest2Polly"];
 
 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.
 
 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (instancetype)PollySynthesizeSpeechURLBuilderForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removePollySynthesizeSpeechURLBuilderForKey:(NSString *)key;

/**
 Build a time-limited pre-signed URL to synthesize speech from Amazon Polly, return nil if build process failed.
 
 @param preSignedURLRequest The AWSPollySynthesizeSpeechURLBuilderRequest that defines the parameters of the operation.
 @return A pre-signed NSURL for the resource. return nil if any errors occured.
 @see AWSPollySynthesizeSpeechURLBuilderRequest
 */
- (AWSTask<NSURL *> *)getPreSignedURL:(AWSPollySynthesizeSpeechURLBuilderRequest *)getPreSignedURLRequest;

@end

NS_ASSUME_NONNULL_END
