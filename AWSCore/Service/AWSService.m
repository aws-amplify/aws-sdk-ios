//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSService.h"

#import <UIKit/UIKit.h>
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSURLResponseSerialization.h"
#import "AWSLogging.h"
#import "AWSCategory.h"

NSString *const AWSiOSSDKVersion = @"2.4.7";
NSString *const AWSServiceErrorDomain = @"com.amazonaws.AWSServiceErrorDomain";

static NSString *const AWSServiceConfigurationUnknown = @"Unknown";

#pragma mark - AWSService

@implementation AWSService

+ (NSDictionary<NSString *, NSNumber *> *)errorCodeDictionary {
    static NSDictionary *_errorCodeDictionary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _errorCodeDictionary = @{
                                @"RequestTimeTooSkewed" : @(AWSServiceErrorRequestTimeTooSkewed),
                                @"InvalidSignatureException" : @(AWSServiceErrorInvalidSignatureException),
                                @"RequestExpired" : @(AWSServiceErrorRequestExpired),
                                @"SignatureDoesNotMatch" : @(AWSServiceErrorSignatureDoesNotMatch),
                                @"AuthFailure" : @(AWSServiceErrorAuthFailure),
                                @"AccessDeniedException" : @(AWSServiceErrorAccessDeniedException),
                                @"UnrecognizedClientException" : @(AWSServiceErrorUnrecognizedClientException),
                                @"IncompleteSignature" : @(AWSServiceErrorIncompleteSignature),
                                @"InvalidClientTokenId" : @(AWSServiceErrorInvalidClientTokenId),
                                @"MissingAuthenticationToken" : @(AWSServiceErrorMissingAuthenticationToken),
                                @"AccessDenied" : @(AWSServiceErrorAccessDenied),
                                @"ExpiredToken" : @(AWSServiceErrorExpiredToken),
                                @"InvalidAccessKeyId" : @(AWSServiceErrorInvalidAccessKeyId),
                                @"InvalidToken" : @(AWSServiceErrorInvalidToken),
                                @"TokenRefreshRequired" : @(AWSServiceErrorTokenRefreshRequired),
                                @"AccessFailure" : @(AWSServiceErrorAccessFailure),
                                @"AuthMissingFailure" : @(AWSServiceErrorAuthMissingFailure),
                                @"Throttling" : @(AWSServiceErrorThrottling),
                                @"ThrottlingException" : @(AWSServiceErrorThrottlingException),
                                };
    });

    return _errorCodeDictionary;
}

@end

#pragma mark - AWSServiceManager

@interface AWSServiceManager()

@property (nonatomic, strong) AWSSynchronizedMutableDictionary *dictionary;

@end

@implementation AWSServiceManager

+ (instancetype)defaultServiceManager {
    static AWSServiceManager *_defaultServiceManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultServiceManager = [AWSServiceManager new];
    });

    return _defaultServiceManager;
}

- (instancetype)init {
    if ( self = [super init]) {
        _dictionary = [AWSSynchronizedMutableDictionary new];
    }
    return self;
}

- (void)setDefaultServiceConfiguration:(AWSServiceConfiguration *)defaultServiceConfiguration {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultServiceConfiguration = [defaultServiceConfiguration copy];
    });
}

@end

#pragma mark - AWSServiceConfiguration

@interface AWSServiceConfiguration()

@property (nonatomic, assign) AWSRegionType regionType;
@property (nonatomic, strong) id<AWSCredentialsProvider> credentialsProvider;
@property (nonatomic, strong) AWSEndpoint *endpoint;
@property (nonatomic, strong) NSArray *userAgentProductTokens;

@end

@implementation AWSServiceConfiguration

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ configurationWithRegion:credentialsProvider:` instead."
                                 userInfo:nil];
}

- (instancetype)initWithRegion:(AWSRegionType)regionType
           credentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider {
    if (self = [super init]) {
        _regionType = regionType;
        _credentialsProvider = credentialsProvider;
    }

    return self;
}

+ (NSString *)baseUserAgent {
    static NSString *_userAgent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *systemName = [[[UIDevice currentDevice] systemName] stringByReplacingOccurrencesOfString:@" " withString:@"-"];
        if (!systemName) {
            systemName = AWSServiceConfigurationUnknown;
        }
        NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
        if (!systemVersion) {
            systemVersion = AWSServiceConfigurationUnknown;
        }
        NSString *localeIdentifier = [[NSLocale currentLocale] localeIdentifier];
        if (!localeIdentifier) {
            localeIdentifier = AWSServiceConfigurationUnknown;
        }
        _userAgent = [NSString stringWithFormat:@"aws-sdk-iOS/%@ %@/%@ %@", AWSiOSSDKVersion, systemName, systemVersion, localeIdentifier];
    });

    NSMutableString *userAgent = [NSMutableString stringWithString:_userAgent];
    for (NSString *prefix in _globalUserAgentPrefixes) {
        [userAgent appendFormat:@" %@", prefix];
    }

    return [NSString stringWithString:userAgent];
}

static NSMutableArray *_globalUserAgentPrefixes = nil;

+ (void)addGlobalUserAgentProductToken:(NSString *)productToken {
    if (productToken) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _globalUserAgentPrefixes = [NSMutableArray new];
        });

        if (![_globalUserAgentPrefixes containsObject:productToken]) {
            [_globalUserAgentPrefixes addObject:productToken];
        }
    }
}

- (NSString *)userAgent {
    NSMutableString *userAgent = [NSMutableString stringWithString:[AWSServiceConfiguration baseUserAgent]];
    for (NSString *prefix in self.userAgentProductTokens) {
        [userAgent appendFormat:@" %@", prefix];
    }

    return [NSString stringWithString:userAgent];
}

- (void)addUserAgentProductToken:(NSString *)productToken {
    if (productToken) {
        if (self.userAgentProductTokens) {
            if (![self.userAgentProductTokens containsObject:productToken]) {
                NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self.userAgentProductTokens];
                [mutableArray addObject:productToken];
                self.userAgentProductTokens = [NSArray arrayWithArray:mutableArray];
            }
        } else {
            self.userAgentProductTokens = @[productToken];
        }
    }
}

- (id)copyWithZone:(NSZone *)zone {
    AWSServiceConfiguration *configuration = [super copyWithZone:zone];
    configuration.regionType = self.regionType;
    configuration.credentialsProvider = self.credentialsProvider;
    configuration.userAgentProductTokens = self.userAgentProductTokens;
    
    return configuration;
}

@end

#pragma mark - AWSEndpoint

static NSString *const AWSRegionNameUSEast1 = @"us-east-1";
static NSString *const AWSRegionNameUSWest2 = @"us-west-2";
static NSString *const AWSRegionNameUSWest1 = @"us-west-1";
static NSString *const AWSRegionNameEUWest1 = @"eu-west-1";
static NSString *const AWSRegionNameEUCentral1 = @"eu-central-1";
static NSString *const AWSRegionNameAPSoutheast1 = @"ap-southeast-1";
static NSString *const AWSRegionNameAPNortheast1 = @"ap-northeast-1";
static NSString *const AWSRegionNameAPNortheast2 = @"ap-northeast-2";
static NSString *const AWSRegionNameAPSoutheast2 = @"ap-southeast-2";
static NSString *const AWSRegionNameAPSouth1 = @"ap-south-1";
static NSString *const AWSRegionNameSAEast1 = @"sa-east-1";
static NSString *const AWSRegionNameCNNorth1 = @"cn-north-1";
static NSString *const AWSRegionNameUSGovWest1 = @"us-gov-west-1";

static NSString *const AWSServiceNameAPIGateway = @"execute-api";
static NSString *const AWSServiceNameAutoScaling = @"autoscaling";
static NSString *const AWSServiceNameCloudWatch = @"monitoring";
static NSString *const AWSServiceNameCognitoIdentity = @"cognito-identity";
static NSString *const AWSServiceNameCognitoIdentityProvider = @"cognito-idp";
static NSString *const AWSServiceNameCognitoSync = @"cognito-sync";
static NSString *const AWSServiceNameDynamoDB = @"dynamodb";
static NSString *const AWSServiceNameEC2 = @"ec2";
static NSString *const AWSServiceNameElasticLoadBalancing = @"elasticloadbalancing";
static NSString *const AWSServiceNameIoT = @"execute-api";
static NSString *const AWSServiceNameIoTData = @"iotdata";
static NSString *const AWSServiceNameFirehose = @"firehose";
static NSString *const AWSServiceNameKinesis = @"kinesis";
static NSString *const AWSServiceNameLambda = @"lambda";
static NSString *const AWSServiceNameMachineLearning = @"machinelearning";
static NSString *const AWSServiceNameMobileAnalytics = @"mobileanalytics";
static NSString *const AWSServiceNameS3 = @"s3";
static NSString *const AWSServiceNameSES = @"email";
static NSString *const AWSServiceNameSimpleDB = @"sdb";
static NSString *const AWSServiceNameSNS = @"sns";
static NSString *const AWSServiceNameSQS = @"sqs";
static NSString *const AWSServiceNameSTS = @"sts";

@implementation AWSEndpoint

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `- initWithRegion:service:useUnsafeURL:` instead."
                                 userInfo:nil];
}

- (instancetype)initWithRegion:(AWSRegionType)regionType
                       service:(AWSServiceType)serviceType
                  useUnsafeURL:(BOOL)useUnsafeURL {
    if (self = [super init]) {
        _regionType = regionType;
        _serviceType = serviceType;
        _useUnsafeURL = useUnsafeURL;
        _regionName = [self regionNameFromType:regionType];
        if (!_regionName) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"Invalid region type."
                                         userInfo:nil];
        }
        _serviceName = [self serviceNameFromType:serviceType];
        if (!_serviceName) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"Invalid service type."
                                         userInfo:nil];
        }
        _URL = [self URLWithRegion:_regionType
                        regionName:_regionName
                           service:_serviceType
                       serviceName:_serviceName
                      useUnsafeURL:useUnsafeURL];
        _hostName = [_URL host];
    }

    return self;
}

- (instancetype)initWithRegion:(AWSRegionType)regionType
                       service:(AWSServiceType)serviceType
                           URL:(NSURL *)URL {
    if (self = [super init]) {
        _regionType = regionType;
        _serviceType = serviceType;
        _useUnsafeURL = NO;
        _regionName = [self regionNameFromType:regionType];
        _serviceName = [self serviceNameFromType:serviceType];
        _URL = URL;
        _hostName = [_URL host];
    }

    return self;
}

- (NSString *)regionNameFromType:(AWSRegionType)regionType {
    switch (regionType) {
        case AWSRegionUSEast1:
            return AWSRegionNameUSEast1;
        case AWSRegionUSWest2:
            return AWSRegionNameUSWest2;
        case AWSRegionUSWest1:
            return AWSRegionNameUSWest1;
        case AWSRegionEUWest1:
            return AWSRegionNameEUWest1;
        case AWSRegionEUCentral1:
            return AWSRegionNameEUCentral1;
        case AWSRegionAPSoutheast1:
            return AWSRegionNameAPSoutheast1;
        case AWSRegionAPSoutheast2:
            return AWSRegionNameAPSoutheast2;
        case AWSRegionAPNortheast1:
            return AWSRegionNameAPNortheast1;
        case AWSRegionAPNortheast2:
            return AWSRegionNameAPNortheast2;
        case AWSRegionAPSouth1:
            return AWSRegionNameAPSouth1;
        case AWSRegionSAEast1:
            return AWSRegionNameSAEast1;
        case AWSRegionCNNorth1:
            return AWSRegionNameCNNorth1;
        case AWSRegionUSGovWest1:
            return AWSRegionNameUSGovWest1;
        default:
            return nil;
    }
}

- (NSString *)serviceNameFromType:(AWSServiceType)serviceType {
    switch (serviceType) {
        case AWSServiceAPIGateway:
            return AWSServiceNameAPIGateway;
        case AWSServiceAutoScaling:
            return AWSServiceNameAutoScaling;
        case AWSServiceCloudWatch:
            return AWSServiceNameCloudWatch;
        case AWSServiceCognitoIdentity:
            return AWSServiceNameCognitoIdentity;
        case AWSServiceCognitoIdentityProvider:
            return AWSServiceNameCognitoIdentityProvider;
        case AWSServiceCognitoSync:
            return AWSServiceNameCognitoSync;
        case AWSServiceDynamoDB:
            return AWSServiceNameDynamoDB;
        case AWSServiceEC2:
            return AWSServiceNameEC2;
        case AWSServiceElasticLoadBalancing:
            return AWSServiceNameElasticLoadBalancing;
        case AWSServiceIoT:
            return AWSServiceNameIoT;
        case AWSServiceIoTData:
            return AWSServiceNameIoTData;
        case AWSServiceFirehose:
            return AWSServiceNameFirehose;
        case AWSServiceKinesis:
            return AWSServiceNameKinesis;
        case AWSServiceLambda:
            return AWSServiceNameLambda;
        case AWSServiceMachineLearning:
            return AWSServiceNameMachineLearning;
        case AWSServiceMobileAnalytics:
            return AWSServiceNameMobileAnalytics;
        case AWSServiceS3:
            return AWSServiceNameS3;
        case AWSServiceSES:
            return AWSServiceNameSES;
        case AWSServiceSimpleDB:
            return AWSServiceNameSimpleDB;
        case AWSServiceSNS:
            return AWSServiceNameSNS;
        case AWSServiceSQS:
            return AWSServiceNameSQS;
        case AWSServiceSTS:
            return AWSServiceNameSTS;
        default:
            return nil;
    }
}

- (NSURL *)URLWithRegion:(AWSRegionType)regionType
              regionName:(NSString *)regionName
                 service:(AWSServiceType)serviceType
             serviceName:(NSString *)serviceName
            useUnsafeURL:(BOOL)useUnsafeURL {
    NSURL *URL = nil;

    NSString *separator = @".";
    if (serviceType == AWSServiceS3
        && (regionType == AWSRegionUSEast1
            || regionType == AWSRegionUSWest1
            || regionType == AWSRegionUSWest2
            || regionType == AWSRegionEUWest1
            || regionType == AWSRegionAPSoutheast1
            || regionType == AWSRegionAPNortheast1
            || regionType == AWSRegionAPNortheast2
            || regionType == AWSRegionAPSoutheast2
            || regionType == AWSRegionAPSouth1
            || regionType == AWSRegionSAEast1
            || regionType == AWSRegionUSGovWest1)) {
            separator = @"-";
        }

    NSString *HTTPType = @"https";
    if (useUnsafeURL) {
        HTTPType = @"http";
    }

    if (serviceType == AWSServiceS3 && regionType == AWSRegionUSEast1) {
        URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://s3.amazonaws.com", HTTPType]];
    } else if (serviceType == AWSServiceSTS) {
        if (regionType == AWSRegionCNNorth1) {
            URL = [NSURL URLWithString:@"https://sts.cn-north-1.amazonaws.com"];
        } else if (regionType == AWSRegionUSGovWest1) {
            URL = [NSURL URLWithString:@"https://sts.us-gov-west-1.amazonaws.com"];
        } else {
            URL = [NSURL URLWithString:@"https://sts.amazonaws.com"];
        }
    } else if (serviceType == AWSServiceSimpleDB && regionType == AWSRegionUSEast1) {
        URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://sdb.amazonaws.com", HTTPType]];
    } else if (serviceType == AWSServiceIoT) {
        URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://iot%@%@.amazonaws.com", HTTPType, separator, regionName]];
    } else if (serviceType == AWSServiceIoTData) {
        URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://data%@iot%@%@.amazonaws.com", HTTPType, separator, separator, regionName]];
    } else {
        URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@%@%@.amazonaws.com", HTTPType, serviceName, separator, regionName]];
    }

    //need to add ".cn" at end of URL if it is in China Region
    if ([regionName hasPrefix:@"cn"]) {
        NSString *urlString = [URL absoluteString];
        URL = [NSURL URLWithString:[urlString stringByAppendingString:@".cn"]];
    }
    
    return URL;
}

@end
