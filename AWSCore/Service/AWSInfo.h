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

@interface AWSInfo : NSObject

@property (nonatomic, readonly) NSDictionary <NSString *, id> *rootInfoDictionary;

+ (instancetype)defaultAWSInfo;

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
