//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@interface AWSTestConfiguration : NSObject

/**
 Returns the testconfiguration.json file dynamically created during the pre-integrationtest steps of the CI/CD system,
 or by copying into the build path using the Amplify CI/CD support tools.
 
 If the testconfiguration.json file is not found, or is invalid, returns a dictionary with stub credential and region
 data.
 */
+ (NSDictionary *) getTestConfiguration;

/**
 This will crash if `pacakgeId` is not present in the configuration returned by `getTestConfiguration`
 */
+ (NSDictionary <NSString *, id> *) getIntegrationTestConfigurationForPackageId:(NSString *)packageId;

/**
This will crash if `configKey` is not present in the package configuration returned by
`getIntegrationTestConfigurationForPackageId`
*/
+ (NSString *) getIntegrationTestConfigurationValueForPackageId:(NSString *)packageId configKey:(NSString *)configKey;

@end

NS_ASSUME_NONNULL_END
