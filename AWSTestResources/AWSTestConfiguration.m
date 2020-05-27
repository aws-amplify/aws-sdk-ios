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

#import "AWSTestConfiguration.h"

@implementation AWSTestConfiguration

+ (NSDictionary *) getTestConfiguration {
    NSDictionary *emptyDictionary = @{
        @"credentials": @{
                @"accessKey": @"EMPTY",
                @"secretKey": @"EMPTY",
                @"sessionToken": @"EMPTY",
        },
        @"packages": @{
                @"common": @{
                        @"region": @"us-east-1"
                }
        }
    };
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filePath = [bundle pathForResource:@"testconfiguration" ofType:@"json"];
    if (!filePath) {
        return emptyDictionary;
    }
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    if (!data) {
        return emptyDictionary;
    }
    
    NSDictionary *testConfigurationJson = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:NSJSONReadingMutableContainers
                                                                            error:nil];
    if (!testConfigurationJson) {
        return emptyDictionary;
    }
    
    return testConfigurationJson;
}

+ (NSDictionary <NSString *, id> *) getIntegrationTestConfigurationForPackageId:(NSString *)packageId {
    NSDictionary *config = [self getTestConfiguration];
    return config[@"packages"][packageId];
}

+ (NSString *) getIntegrationTestConfigurationValueForPackageId:(NSString *)packageId configKey:(NSString *)configKey {
    NSDictionary *config = [AWSTestConfiguration getIntegrationTestConfigurationForPackageId:packageId];
    NSString *value = config[configKey];
    return value;
}

@end
