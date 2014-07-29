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

#import "AWSTestUtility.h"
#import "AWSCore.h"

NSString *const AWSTestUtilitySTSKey = @"test-sts";
NSString *const AWSTestUtilityCognitoIdentityServiceKey = @"test-cib";

@implementation AWSTestUtility

+(void)setupCrdentialsViaFile {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
}
+ (void)setupCognitoCredentialsProvider {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                              ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        AWSCognitoCredentialsProvider *credentialsProvider = [AWSCognitoCredentialsProvider credentialsWithRegionType:AWSRegionUSEast1
                                                                                                           identityId:nil
                                                                                                            accountId:credentialsJson[@"accountId"]
                                                                                                       identityPoolId:credentialsJson[@"identityPoolId"]
                                                                                                        unauthRoleArn:credentialsJson[@"unauthRoleArn"]
                                                                                                          authRoleArn:credentialsJson[@"authRoleArn"]
                                                                                                               logins:nil];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
}

+ (void)setupSTS {
    if (![[AWSServiceManager defaultServiceManager] serviceForKey:AWSTestUtilitySTSKey]) {
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        AWSSTS *sts = [[AWSSTS alloc] initWithConfiguration:configuration];
        [[AWSServiceManager defaultServiceManager] setService:sts forKey:AWSTestUtilitySTSKey];
    }
}

+ (void)setupCognitoIdentityService {
    if (![[AWSServiceManager defaultServiceManager] serviceForKey:AWSTestUtilityCognitoIdentityServiceKey]) {
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        AWSCognitoIdentityService *cis = [[AWSCognitoIdentityService alloc] initWithConfiguration:configuration];
        [[AWSServiceManager defaultServiceManager] setService:cis forKey:AWSTestUtilityCognitoIdentityServiceKey];
    }
}

@end
