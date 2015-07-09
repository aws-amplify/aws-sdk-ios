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

#import "AWSService.h"

#import "AWSSynchronizedMutableDictionary.h"
#import "AWSURLResponseSerialization.h"
#import "AWSLogging.h"

#pragma mark - AWSService

@implementation AWSService

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
        _defaultServiceConfiguration = defaultServiceConfiguration;
    });
}

- (id)serviceForKey:(id)key {
    return [self.dictionary objectForKey:key];
}

- (void)setService:(id)service forKey:(id)key {
    [self.dictionary setObject:service forKey:key];
}

- (void)removeServiceForKey:(id)key {
    [self.dictionary removeObjectForKey:key];
}

@end

#pragma mark - AWSServiceConfiguration

@interface AWSServiceConfiguration()

@property (nonatomic, assign) AWSRegionType regionType;
@property (nonatomic, strong) id<AWSCredentialsProvider> credentialsProvider;
@property (nonatomic, strong) AWSEndpoint *endpoint;

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

+ (instancetype)configurationWithRegion:(AWSRegionType)regionType
                    credentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider {
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:regionType
                                                                         credentialsProvider:credentialsProvider];
    return configuration;
}

- (id)copyWithZone:(NSZone *)zone {
    AWSServiceConfiguration *configuration = [super copyWithZone:zone];
    configuration.regionType = self.regionType;
    configuration.credentialsProvider = self.credentialsProvider;
    configuration.maxRetryCount = self.maxRetryCount;
    configuration.timeoutIntervalForRequest = self.timeoutIntervalForRequest;
    configuration.timeoutIntervalForResource = self.timeoutIntervalForResource;

    return configuration;
}

@end

#pragma mark - AWSEndpoint

NSString *const AWSRegionNameUSEast1 = @"us-east-1";
NSString *const AWSRegionNameUSWest2 = @"us-west-2";
NSString *const AWSRegionNameUSWest1 = @"us-west-1";
NSString *const AWSRegionNameEUWest1 = @"eu-west-1";
NSString *const AWSRegionNameEUCentral1 = @"eu-central-1";
NSString *const AWSRegionNameAPSoutheast1 = @"ap-southeast-1";
NSString *const AWSRegionNameAPNortheast1 = @"ap-northeast-1";
NSString *const AWSRegionNameAPSoutheast2 = @"ap-southeast-2";
NSString *const AWSRegionNameSAEast1 = @"sa-east-1";
NSString *const AWSRegionNameCNNorth1 = @"cn-north-1";

NSString *const AWSServiceNameAPIGateway = @"execute-api";
NSString *const AWSServiceNameAutoScaling = @"autoscaling";
NSString *const AWSServiceNameCloudWatch = @"monitoring";
NSString *const AWSServiceNameCognitoIdentityBroker = @"cognito-identity";
NSString *const AWSServiceNameCognitoService = @"cognito-sync";
NSString *const AWSServiceNameDynamoDB = @"dynamodb";
NSString *const AWSServiceNameEC2 = @"ec2";
NSString *const AWSServiceNameElasticLoadBalancing = @"elasticloadbalancing";
NSString *const AWSServiceNameKinesis = @"kinesis";
NSString *const AWSServiceNameLambda = @"lambda";
NSString *const AWSServiceNameMachineLearning = @"machinelearning";
NSString *const AWSServiceNameMobileAnalytics = @"mobileanalytics";
NSString *const AWSServiceNameS3 = @"s3";
NSString *const AWSServiceNameSES = @"email";
NSString *const AWSServiceNameSimpleDB = @"sdb";
NSString *const AWSServiceNameSNS = @"sns";
NSString *const AWSServiceNameSQS = @"sqs";
NSString *const AWSServiceNameSTS = @"sts";

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
            AWSLogError(@"Invalid region type.");
        }
        _serviceName = [self serviceNameFromType:serviceType];
        if (!_serviceName) {
            AWSLogError(@"Invalid service type.");
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
        case AWSRegionSAEast1:
            return AWSRegionNameSAEast1;
        case AWSRegionCNNorth1:
            return AWSRegionNameCNNorth1;
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
        case AWSServiceCognitoIdentityBroker:
            return AWSServiceNameCognitoIdentityBroker;
        case AWSServiceCognitoService:
            return AWSServiceNameCognitoService;
        case AWSServiceDynamoDB:
            return AWSServiceNameDynamoDB;
        case AWSServiceEC2:
            return AWSServiceNameEC2;
        case AWSServiceElasticLoadBalancing:
            return AWSServiceNameElasticLoadBalancing;
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
            || regionType == AWSRegionAPSoutheast2
            || regionType == AWSRegionSAEast1)) {
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
        } else {
            URL = [NSURL URLWithString:@"https://sts.amazonaws.com"];
        }
    } else if (serviceType == AWSServiceSimpleDB && regionType == AWSRegionUSEast1) {
        URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://sdb.amazonaws.com", HTTPType]];
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
