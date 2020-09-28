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
#import "AWSServiceEnum.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSInfoDefault;

@class AWSServiceInfo;
@class AWSCognitoCredentialsProvider;
@class AWSServiceConfiguration;
/**
 * The AWSInfo holds the configuration values for the various supported services.
 */
@interface AWSInfo : NSObject

@property (nonatomic, readonly) NSDictionary <NSString *, id> *rootInfoDictionary;

/**
 * The reference to the single `AWSInfo` object. This method loads the configuration from the
 * `awsconfiguration.json` by default. For custom configuration object, see `[AWSInfo configureDefaultAWSInfo]`.
 */
+ (instancetype)defaultAWSInfo;

/**
 * This method allows the configuration as a `NSDictionary` as an alternative to the `awsconfiguration.json` file.
 *
 * **Notes:** This method must be called before `defaultAWSInfo` otherwise the configuration will be loaded from the
 * JSON file. Once the configuration is set, it cannot be overridden and/or reloaded.
 *
 * @param config The dictionary containing the configuration
 */
+ (void)configureDefaultAWSInfo:(NSDictionary<NSString *, id> *)config;

/**
 * Service configuration to be used while creating the identity pool service.
 *
 * - Warning: This method is intended for internal use only.
 */
+ (void)configureIdentityPoolService:(nullable AWSServiceConfiguration *)config;

- (nullable AWSServiceInfo *)serviceInfo:(NSString *)serviceName
                                  forKey:(NSString *)key;

- (nullable AWSServiceInfo *)defaultServiceInfo:(NSString *)serviceName;

@end

@interface AWSServiceInfo : NSObject

@property (nonatomic, readonly) AWSCognitoCredentialsProvider *cognitoCredentialsProvider;

@property (nonatomic, readonly) AWSRegionType region;

@property (nonatomic, readonly) NSDictionary <NSString *, id> *infoDictionary;

@end

NS_ASSUME_NONNULL_END
