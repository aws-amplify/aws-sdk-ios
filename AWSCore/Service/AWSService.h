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
#import "AWSNetworking.h"
#import "AWSCredentialsProvider.h"
#import "AWSServiceEnum.h"

FOUNDATION_EXPORT NSString *const AWSiOSSDKVersion;

FOUNDATION_EXPORT NSString *const AWSServiceErrorDomain;

typedef NS_ENUM(NSInteger, AWSServiceErrorType) {
    AWSServiceErrorUnknown,
    AWSServiceErrorRequestTimeTooSkewed,
    AWSServiceErrorInvalidSignatureException,
    AWSServiceErrorSignatureDoesNotMatch,
    AWSServiceErrorRequestExpired,
    AWSServiceErrorAuthFailure,
    AWSServiceErrorAccessDeniedException,
    AWSServiceErrorUnrecognizedClientException,
    AWSServiceErrorIncompleteSignature,
    AWSServiceErrorInvalidClientTokenId,
    AWSServiceErrorMissingAuthenticationToken,
    AWSServiceErrorAccessDenied,
    AWSServiceErrorExpiredToken,
    AWSServiceErrorInvalidAccessKeyId,
    AWSServiceErrorInvalidToken,
    AWSServiceErrorTokenRefreshRequired,
    AWSServiceErrorAccessFailure,
    AWSServiceErrorAuthMissingFailure,
    AWSServiceErrorThrottling,
    AWSServiceErrorThrottlingException,
};

@class AWSEndpoint;

#pragma mark - AWSService

/**
 An abstract representation of AWS services.
 */
@interface AWSService : NSObject

+ (NSDictionary<NSString *, NSNumber *> *)errorCodeDictionary;

@end

#pragma mark - AWSServiceManager

@class AWSServiceConfiguration;

/**
 The service manager class that manages the default service configuration.
 */
@interface AWSServiceManager : NSObject

/**
 The default service configuration object. This property can be set only once, and any subsequent setters are ignored.
 */
@property (nonatomic, copy) AWSServiceConfiguration *defaultServiceConfiguration;

/**
 Returns a default singleton object. You should use this singleton method instead of creating an instance of the service manager.

 @return The default service manager. This is a singleton object.
 */
+ (instancetype)defaultServiceManager;

@end

#pragma mark - AWSServiceConfiguration

/**
 A service configuration object.
 */
@interface AWSServiceConfiguration : AWSNetworkingConfiguration

@property (nonatomic, assign, readonly) AWSRegionType regionType;
@property (nonatomic, strong, readonly) id<AWSCredentialsProvider> credentialsProvider;
@property (nonatomic, strong, readonly) AWSEndpoint *endpoint;
@property (nonatomic, readonly) NSString *userAgent;

+ (NSString *)baseUserAgent;

+ (void)addGlobalUserAgentProductToken:(NSString *)productToken;

- (instancetype)initWithRegion:(AWSRegionType)regionType
           credentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider;

- (instancetype)initWithRegion:(AWSRegionType)regionType
                      endpoint:(AWSEndpoint *)endpoint
           credentialsProvider:(id<AWSCredentialsProvider>)credentialsProvider;

- (void)addUserAgentProductToken:(NSString *)productToken;

@end

#pragma mark - AWSEndpoint

@interface AWSEndpoint : NSObject

@property (nonatomic, readonly) AWSRegionType regionType;
@property (nonatomic, readonly) NSString *regionName;
@property (nonatomic, readonly) AWSServiceType serviceType;
@property (nonatomic, readonly) NSString *serviceName;
@property (nonatomic, readonly) NSURL *URL;
@property (nonatomic, readonly) NSString *hostName;
@property (nonatomic, readonly) BOOL useUnsafeURL;

- (instancetype)initWithRegion:(AWSRegionType)regionType
                       service:(AWSServiceType)serviceType
                  useUnsafeURL:(BOOL)useUnsafeURL;

- (instancetype)initWithRegion:(AWSRegionType)regionType
                       service:(AWSServiceType)serviceType
                           URL:(NSURL *)URL;

- (instancetype)initWithRegion:(AWSRegionType)regionType
                   serviceName:(NSString *)serviceName
                           URL:(NSURL *)URL;

- (instancetype)initWithURL:(NSURL *)URL;

- (instancetype)initWithURLString:(NSString *)URLString;

@end
