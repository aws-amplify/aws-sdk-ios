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

#import "AWSCognitoIdentity+Fabric.h"

@implementation AWSCognitoIdentity (Fabric)

#pragma mark - Fabric

+ (NSString *)bundleIdentifier {
    return @"com.amazonaws.sdk.ios.AWSCognitoIdentity";
}

+ (NSString *)kitDisplayVersion {
    return AWSiOSSDKVersion;
}

+ (void)internalInitializeIfNeeded {
    // Retrieves the configuration from info.plist.
    Class fabricClass = NSClassFromString(@"Fabric");
    if (fabricClass
        && [fabricClass respondsToSelector:@selector(configurationDictionaryForKitClass:)]) {
        NSDictionary *configurationDictionary = [fabricClass configurationDictionaryForKitClass:[AWSCognitoIdentity class]];
        NSString *defaultRegionTypeString = configurationDictionary[@"AWSDefaultRegionType"];
        AWSRegionType defaultRegionType = [defaultRegionTypeString aws_regionTypeValue];
        NSString *cognitoIdentityRegionTypeString = configurationDictionary[@"AWSCognitoIdentityRegionType"];
        AWSRegionType cognitoIdentityRegionType = [cognitoIdentityRegionTypeString aws_regionTypeValue];
        NSString *cognitoIdentityPoolId = configurationDictionary[@"AWSCognitoIdentityPoolId"];
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            // Performs some basic configuration check.
            if (cognitoIdentityPoolId
                && defaultRegionType != AWSRegionUnknown
                && cognitoIdentityRegionType != AWSRegionUnknown) {
                // Sets up the AWS Mobile SDK.
                AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:cognitoIdentityRegionType
                                                                                                                identityPoolId:cognitoIdentityPoolId];
                AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:defaultRegionType
                                                                                     credentialsProvider:credentialsProvider];
                [configuration addUserAgentProductToken:@"fabric"];
                AWSServiceManager.defaultServiceManager.defaultServiceConfiguration = configuration;
                AWSLogInfo(@"The default Cognito credentials provider and service configuration were successfully initialized.");
            } else {
                // The configuration values from info.plist seem invalid.
                AWSLogWarn(@"Could not find valid 'AWSDefaultRegionType', 'AWSCognitoRegionType', and 'AWSCognitoIdentityPoolId' values in info.plist. Unable to set the default Cognito credentials provider and service configuration. Please follow the instructions on this website and manually set up the AWS Mobile SDK for iOS. http://docs.aws.amazon.com/mobile/sdkforios/developerguide/setup.html");
            }
        });
    } else {
        AWSLogError(@"Fabric is not available.");
    }
}

@end
