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

#import "AWSCognitoIdentityProviderASF.h"
#import "AWSCognitoIdentityASF.h"

@implementation AWSCognitoIdentityProviderASF

+ (NSString *)userContextData: (NSString*) userPoolId username: (NSString * _Nullable) username deviceId: ( NSString * _Nullable ) deviceId userPoolClientId: (NSString *) userPoolClientId {
    NSString * build = @"release";
#ifdef DEBUG
    build = @"debug";
#endif
    
    return [AWSCognitoIdentityASF userContextData:  __IPHONE_OS_VERSION_MIN_REQUIRED
                                            build:build userPoolId: userPoolId username:username deviceId:deviceId userPoolClientId:userPoolClientId];
}

@end
