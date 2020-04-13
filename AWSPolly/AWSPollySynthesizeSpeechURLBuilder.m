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

#import "AWSPollySynthesizeSpeechURLBuilder.h"

static NSString *const AWSInfoPollySynthesizeSpeechURLBuilder = @"PollySynthesizeSpeechUrlBuilder";
static NSString *const AWSPollySDKVersion = @"2.13.2";

NSString *const AWSPollySynthesizeSpeechURLBuilderErrorDomain = @"com.amazonaws.AWSPollySynthesizeSpeechURLBuilderErrorDomain";
NSString *const AWSPollyPresignedUrlPath = @"v1/speech";

@interface AWSPollySynthesizeSpeechURLBuilder()

@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSPollyStartSpeechSynthesisTaskInput()

+ (NSValueTransformer *)engineJSONTransformer;
+ (NSValueTransformer *)languageCodeJSONTransformer;
+ (NSValueTransformer *)outputFormatJSONTransformer;
+ (NSValueTransformer *)textTypeJSONTransformer;
+ (NSValueTransformer *)voiceIdJSONTransformer;

@end

@implementation AWSPollySynthesizeSpeechURLBuilderRequest

- (void)setLexiconNames:(NSArray<NSString *> *)lexiconNames {
    _lexiconNames = lexiconNames;
}

- (void)setSpeechMarkTypes:(NSArray<NSString *> *)speechMarkTypes {
    _speechMarkTypes = speechMarkTypes;
}

@end

@implementation AWSPollySynthesizeSpeechURLBuilder

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSPollySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSPolly versions need to match. Check your SDK installation. AWSCore: %@ AWSPolly: %@", AWSiOSSDKVersion, AWSPollySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultPollySynthesizeSpeechURLBuilder {
    static AWSPollySynthesizeSpeechURLBuilder *_defaultPolly = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoPollySynthesizeSpeechURLBuilder];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultPolly = [[AWSPollySynthesizeSpeechURLBuilder alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultPolly;
}


+ (void)registerPollySynthesizeSpeechURLBuilder:(AWSServiceConfiguration *)configuration forKey:(NSString *)key{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSPollySynthesizeSpeechURLBuilder alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)PollySynthesizeSpeechURLBuilderForKey:(NSString *)key {
    @synchronized(self) {
        AWSPollySynthesizeSpeechURLBuilder *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoPollySynthesizeSpeechURLBuilder
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSPollySynthesizeSpeechURLBuilder registerPollySynthesizeSpeechURLBuilder:serviceConfiguration
                                                                                 forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removePollySynthesizeSpeechURLBuilderForKey:(NSString *)key{
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultPolly` or `+ PollyForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicePolly
                                                         useUnsafeURL:NO];
    }

    return self;
}

- (AWSTask<NSURL *> *)getPreSignedURL:(AWSPollySynthesizeSpeechURLBuilderRequest *)preSignedURLRequest{
    return [[AWSTask taskWithResult:nil] continueWithSuccessBlock:^id _Nullable(AWSTask *task) {
        id<AWSCredentialsProvider> credentialProvider = self.configuration.credentialsProvider;
        AWSEndpoint *endpoint = self.configuration.endpoint;

        //validate expires Date
        if (!preSignedURLRequest.expires) {
            //set default expiry to 15 mins from now.
            [preSignedURLRequest setExpires:[NSDate dateWithTimeIntervalSinceNow:15*60]];
        }

        if ([preSignedURLRequest.expires timeIntervalSinceNow] < 0.0) {
            return [AWSTask taskWithError:[NSError errorWithDomain:AWSPollySynthesizeSpeechURLBuilderErrorDomain
                                                              code:AWSPollySynthesizeSpeechURLBuilderInvalidExpiresDate
                                                          userInfo:@{NSLocalizedDescriptionKey: @"expires can not be in past"}]
                    ];
        }

        int32_t expireDuration = [preSignedURLRequest.expires timeIntervalSinceNow];

        NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
        [parameters setObject:[self stringFromOutputFormat:preSignedURLRequest.outputFormat] forKey:@"OutputFormat"];

        if (preSignedURLRequest.sampleRate) {
            [parameters setObject:preSignedURLRequest.sampleRate forKey:@"SampleRate"];
        }

        [parameters setObject:preSignedURLRequest.text forKey:@"Text"];

        if (preSignedURLRequest.textType) {
            [parameters setObject:[self stringFromTextType:preSignedURLRequest.textType] forKey:@"TextType"];
        }

        [parameters setObject:[self stringFromVoiceId:preSignedURLRequest.voiceId] forKey:@"VoiceId"];

        if (preSignedURLRequest.lexiconNames && [preSignedURLRequest.lexiconNames count] >= 1) {
            [parameters setObject:preSignedURLRequest.lexiconNames forKey:@"LexiconNames"];
        }

        if (preSignedURLRequest.speechMarkTypes && [preSignedURLRequest.speechMarkTypes count] >= 1) {
            [parameters setObject:preSignedURLRequest.speechMarkTypes forKey:@"SpeechMarkTypes"];
        }

        if (preSignedURLRequest.languageCode) {
            [parameters setObject:[self stringFromLanguageCode:preSignedURLRequest.languageCode] forKey:@"LanguageCode"];
        }

        if (preSignedURLRequest.engine) {
            [parameters setObject:[self stringFromEngine:preSignedURLRequest.engine] forKey:@"Engine"];
        }

        NSMutableDictionary *headers = [NSMutableDictionary new];
        [headers setObject:endpoint.hostName forKey:@"host"];

        return [AWSSignatureV4Signer generateQueryStringForSignatureV4WithCredentialProvider:credentialProvider
                                                                                  httpMethod:AWSHTTPMethodGET
                                                                              expireDuration:expireDuration
                                                                                    endpoint:endpoint
                                                                                     keyPath:AWSPollyPresignedUrlPath
                                                                              requestHeaders:headers
                                                                           requestParameters:parameters
                                                                                    signBody:YES];
    }];
}

- (NSString *)stringFromOutputFormat:(AWSPollyOutputFormat)format {
    NSValueTransformer *transformer = [AWSPollyStartSpeechSynthesisTaskInput outputFormatJSONTransformer];
    NSString *transformedValue = (NSString *)[transformer reverseTransformedValue:(id)@(format)];
    return transformedValue;
}

- (NSString *)stringFromTextType:(AWSPollyTextType)textType {
    NSValueTransformer *transformer = [AWSPollyStartSpeechSynthesisTaskInput textTypeJSONTransformer];
    NSString *transformedValue = (NSString *)[transformer reverseTransformedValue:(id)@(textType)];
    return transformedValue;
}

- (NSString *)stringFromLanguageCode:(AWSPollyLanguageCode)languageCode {
    NSValueTransformer *transformer = [AWSPollyStartSpeechSynthesisTaskInput languageCodeJSONTransformer];
    NSString *transformedValue = (NSString *)[transformer reverseTransformedValue:(id)@(languageCode)];
    return transformedValue;
}

- (NSString *)stringFromVoiceId:(AWSPollyVoiceId)voiceId {
    NSValueTransformer *transformer = [AWSPollyStartSpeechSynthesisTaskInput voiceIdJSONTransformer];
    NSString *transformedValue = (NSString *)[transformer reverseTransformedValue:(id)@(voiceId)];
    return transformedValue;
}

- (NSString *)stringFromEngine:(AWSPollyEngine)engine {
    NSValueTransformer *transformer = [AWSPollyStartSpeechSynthesisTaskInput engineJSONTransformer];
    NSString *transformedValue = (NSString *)[transformer reverseTransformedValue:(id)@(engine)];
    return transformedValue;
}

@end
