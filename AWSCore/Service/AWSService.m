/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AWSService.h"

#import "AWSSynchronizedMutableDictionary.h"
#import "AWSURLResponseSerialization.h"

#pragma mark - AWSService

@implementation AWSService

@end

#pragma mark - AWSServiceManager

@interface AWSServiceManager()

@property (nonatomic, strong) AWSServiceConfiguration *defaultServiceConfiguration;
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

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSServiceConfiguration

- (instancetype)init {
    if(self = [super init]) {
        _regionType = AWSRegionUnknown;
        _maxRetryCount = 3;
    }

    return self;
}

- (instancetype)initWithRegion:(AWSRegionType)regionType credentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider {
    if (self = [super init]) {
        _regionType = regionType;
        _credentialsProvider = credentialsProvider;
        _maxRetryCount = 3;
    }

    return self;
}

+ (instancetype)configurationWithRegion:(AWSRegionType)regionType credentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider {
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:regionType
                                                                         credentialsProvider:credentialsProvider];
    return configuration;
}

- (id)copyWithZone:(NSZone *)zone {
    AWSServiceConfiguration *configuration = [[[self class] allocWithZone:zone] initWithRegion:self.regionType
                                                                           credentialsProvider:self.credentialsProvider];
    configuration.maxRetryCount = self.maxRetryCount;
    return configuration;
}

@end

#pragma mark - AWSRegion

@interface AWSRegion()

@property (nonatomic, assign) AWSRegionType regionType;
@property (nonatomic, strong) NSSet *availableServices;

@end

@implementation AWSRegion

- (instancetype)init {
    if(self = [super init]) {
        _regionType = AWSRegionUnknown;
    }

    return self;
}

- (instancetype)initWithType:(AWSRegionType)regionType {
    if(self = [super init]) {
        _regionType = regionType;

        switch (_regionType) {
            case AWSRegionUSEast1:
                _availableServices = [NSSet setWithObjects:@(AWSServiceDynamoDB), nil];
                break;

            default:
                break;
        }
    }

    return self;
}

+ (instancetype)regionWithType:(AWSRegionType)regionType {
    AWSRegion *region = [[AWSRegion alloc] initWithType:regionType];
    return region;
}

- (BOOL)isServiceAvailable:(AWSServiceType)serviceType {
    __block BOOL isServiceAvailable = NO;

    [self.availableServices enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        if([@(serviceType) isEqualToNumber:obj]) {
            isServiceAvailable = YES;
            *stop = YES;
        }
    }];

    return isServiceAvailable;
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

NSString *const AWSServiceNameAppStream = @"appstream";
NSString *const AWSServiceNameAutoScaling = @"autoscaling";
NSString *const AWSServiceNameCloudWatch = @"monitoring";
NSString *const AWSServiceNameCognitoIdentityBroker = @"cognito-identity";
NSString *const AWSServiceNameCognitoService = @"cognito-sync";
NSString *const AWSServiceNameDynamoDB = @"dynamodb";
NSString *const AWSServiceNameEC2 = @"ec2";
NSString *const AWSServiceNameElasticLoadBalancing = @"elasticloadbalancing";
NSString *const AWSServiceNameKinesis = @"kinesis";
NSString *const AWSServiceNameS3 = @"s3";
NSString *const AWSServiceNameSES = @"email";
NSString *const AWSServiceNameSimpleDB = @"sdb";
NSString *const AWSServiceNameSNS = @"sns";
NSString *const AWSServiceNameSQS = @"sqs";
NSString *const AWSServiceNameSTS = @"sts";

NSString *const AWSServiceNameMobileAnalytics = @"mobileanalytics";

@interface AWSEndpoint()

@property (nonatomic, assign) AWSRegionType regionType;
@property (nonatomic, strong) NSString *regionName;
@property (nonatomic, assign) AWSServiceType serviceType;
@property (nonatomic, strong) NSString *serviceName;
@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, strong) NSString *hostName;
@property (nonatomic, assign) BOOL useUnsafeURL;

@end

@implementation AWSEndpoint

- (instancetype)init {
    if (self = [super init]) {
        _regionType = AWSRegionUnknown;
        _serviceType = AWSServiceUnknown;
    }

    return self;
}

- (instancetype)initWithRegion:(AWSRegionType)regionType
                       service:(AWSServiceType)serviceType
                  useUnsafeURL:(BOOL)useUnsafeURL {
    if (self = [super init]) {
        _regionType = regionType;
        _serviceType = serviceType;
        _useUnsafeURL = useUnsafeURL;

        switch (_regionType) {
            case AWSRegionUSEast1:
                _regionName = AWSRegionNameUSEast1;
                break;
            case AWSRegionUSWest2:
                _regionName = AWSRegionNameUSWest2;
                break;
            case AWSRegionUSWest1:
                _regionName = AWSRegionNameUSWest1;
                break;
            case AWSRegionEUWest1:
                _regionName = AWSRegionNameEUWest1;
                break;
            case AWSRegionEUCentral1:
                _regionName = AWSRegionNameEUCentral1;
                break;
            case AWSRegionAPSoutheast1:
                _regionName = AWSRegionNameAPSoutheast1;
                break;
            case AWSRegionAPSoutheast2:
                _regionName = AWSRegionNameAPSoutheast2;
                break;
            case AWSRegionAPNortheast1:
                _regionName = AWSRegionNameAPNortheast1;
                break;
            case AWSRegionSAEast1:
                _regionName = AWSRegionNameSAEast1;
                break;
            case AWSRegionCNNorth1:
                _regionName = AWSRegionNameCNNorth1;
            default:
                break;
        }

        switch (_serviceType) {
            case AWSServiceAppStream:
                _serviceName = AWSServiceNameAppStream;
                break;
            case AWSServiceAutoScaling:
                _serviceName = AWSServiceNameAutoScaling;
                break;
            case AWSServiceCloudWatch:
                _serviceName = AWSServiceNameCloudWatch;
                break;
            case AWSServiceCognitoIdentityBroker:
                _serviceName = AWSServiceNameCognitoIdentityBroker;
                break;
            case AWSServiceCognitoService:
                _serviceName = AWSServiceNameCognitoService;
                break;
            case AWSServiceDynamoDB:
                _serviceName = AWSServiceNameDynamoDB;
                break;
            case AWSServiceEC2:
                _serviceName = AWSServiceNameEC2;
                break;
            case AWSServiceElasticLoadBalancing:
                _serviceName = AWSServiceNameElasticLoadBalancing;
                break;
            case AWSServiceKinesis:
                _serviceName = AWSServiceNameKinesis;
                break;
            case AWSServiceS3:
                _serviceName = AWSServiceNameS3;
                break;
            case AWSServiceSES:
                _serviceName = AWSServiceNameSES;
                break;
            case AWSServiceSimpleDB:
                _serviceName = AWSServiceNameSimpleDB;
                break;
            case AWSServiceSNS:
                _serviceName = AWSServiceNameSNS;
                break;
            case AWSServiceSQS:
                _serviceName = AWSServiceNameSQS;
                break;
            case AWSServiceSTS:
                _serviceName = AWSServiceNameSTS;
                break;
            case AWSServiceMobileAnalytics:
                _serviceName = AWSServiceNameMobileAnalytics;
            default:
                break;
        }

        NSString *separator = @".";
        if (_serviceType == AWSServiceS3
            && (_regionType == AWSRegionUSEast1
                || _regionType == AWSRegionUSWest1
                || _regionType == AWSRegionUSWest2
                || _regionType == AWSRegionEUWest1
                || _regionType == AWSRegionAPSoutheast1
                || _regionType == AWSRegionAPNortheast1
                || _regionType == AWSRegionAPSoutheast2
                || _regionType == AWSRegionSAEast1)) {
                separator = @"-";
            }

        NSString *HTTP_Type = @"https";
        if (_useUnsafeURL) {
            HTTP_Type = @"http";
        }

        if (_serviceType == AWSServiceS3 && _regionType == AWSRegionUSEast1) {
            _URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://s3.amazonaws.com", HTTP_Type]];
        } else if (_serviceType == AWSServiceSTS) {
            if (_regionType == AWSRegionCNNorth1) {
                _URL = [NSURL URLWithString:@"https://sts.cn-north-1.amazonaws.com"];
            } else {
                _URL = [NSURL URLWithString:@"https://sts.amazonaws.com"];
            }

        } else if (_serviceType == AWSServiceSimpleDB && _regionType == AWSRegionUSEast1) {
            _URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://sdb.amazonaws.com", HTTP_Type]];
        } else {
            _URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@%@%@.amazonaws.com", HTTP_Type, _serviceName, separator, _regionName]];
        }

        //need to add ".cn" at end of URL if it is in China Region
        if ([_regionName hasPrefix:@"cn"]) {
            NSString *urlString = [_URL absoluteString];
            _URL = [NSURL URLWithString:[urlString stringByAppendingString:@".cn"]];
        }
        _hostName = [_URL host];
    }

    return self;
}

+ (instancetype)endpointWithRegion:(AWSRegionType)regionType
                           service:(AWSServiceType)serviceType {
    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initWithRegion:regionType service:serviceType useUnsafeURL:NO];
    return endpoint;
}

+ (instancetype)endpointWithRegion:(AWSRegionType)regionType
                           service:(AWSServiceType)serviceType
                      useUnsafeURL:(BOOL)useUnsafeURL {
    AWSEndpoint *endpoint = [[AWSEndpoint alloc] initWithRegion:regionType service:serviceType useUnsafeURL:useUnsafeURL];
    return endpoint;
}

+ (instancetype)endpointWithURL:(NSURL *)url {
    AWSEndpoint *endpoint = [AWSEndpoint new];
    endpoint.URL = url;
    endpoint.hostName = [endpoint.URL host];
    
    return endpoint;
}

@end
