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

NS_ASSUME_NONNULL_BEGIN

@interface AWSCognitoIdentityASF : NSObject
/*!
 @warning This function is deprecated and will be removed in an upcoming minor
 version of the SDK. You should use userContextString instead.
 @deprecated Use userContextString instead.
 */
+ (NSString *)userContextData:(int) minTarget
                        build:(NSString *) build
                   userPoolId:(NSString *) userPoolId
                     username:(NSString *) username
                     deviceId:( NSString * _Nullable) deviceId
             userPoolClientId: (NSString *) userPoolClientId DEPRECATED_MSG_ATTRIBUTE("Use userContextString instead.");

+ (nullable NSString *) userContextString:(int) minTarget
                           build:(NSString *) build
                      userPoolId:(NSString *) userPoolId
                        username:(NSString *) username
                        deviceId:(NSString * _Nullable) deviceId
                         userPoolClientId: (NSString *) userPoolClientId;
@end
NS_ASSUME_NONNULL_END
