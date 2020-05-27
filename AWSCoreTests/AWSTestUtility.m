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

#import "AWSTestUtility.h"
#import <AWSCore/AWSCore.h>
#import <AWSTestResources/AWSTestResources.h>
#import <objc/runtime.h>

NSString *const AWSTestUtilitySTSKey = @"test-sts";
NSString *const AWSTestUtilityCognitoIdentityServiceKey = @"test-cib";

@interface AWSTestCredentialsProvider : NSObject <AWSCredentialsProvider>

@property (nonatomic, strong) AWSCredentials *internalCredentials;

@end

@implementation AWSTestCredentialsProvider

- (AWSTask<AWSCredentials *> *)credentials {
    return [AWSTask taskWithResult:self.internalCredentials];
}

- (void)invalidateCachedTemporaryCredentials {
    // No-op
}

@end

@interface AWSDDLogCustomFormatter : NSObject<AWSDDLogFormatter>

@end

@implementation AWSDDLogCustomFormatter

- (NSString *)formatLogMessage:(AWSDDLogMessage *)logMessage {
    NSString *logLevel;
    switch (logMessage->_flag) {
        case AWSDDLogFlagError    : logLevel = @"E"; break;
        case AWSDDLogFlagWarning  : logLevel = @"W"; break;
        case AWSDDLogFlagInfo     : logLevel = @"I"; break;
        case AWSDDLogFlagDebug    : logLevel = @"D"; break;
        default                   : logLevel = @"V"; break;
    }
    
    return [NSString stringWithFormat:@"%@ | %@", logLevel, logMessage->_message];
}

@end

@implementation AWSTestUtility

+ (NSDictionary *) getTestConfigurationJSON {
    return [AWSTestConfiguration getTestConfiguration];
}

+ (NSDictionary<NSString *, NSString *> *) getCredentialsFromTestConfiguration {
    return (NSDictionary<NSString *, NSString *> *)[self getTestConfigurationJSON][@"credentials"];
}

+ (NSDictionary <NSString *, id> *) getIntegrationTestConfigurationForPackageId:(NSString *)packageId {
    NSDictionary *testConfigurationJson = [self getTestConfigurationJSON];
    return testConfigurationJson[@"packages"][packageId];
}

+ (NSString *) getIntegrationTestConfigurationValueForPackageId:(NSString *)packageId configKey:(NSString *)configKey {
    NSDictionary *packageConfig = [AWSTestUtility getIntegrationTestConfigurationForPackageId:packageId];
    NSString *value = packageConfig[configKey];
    return value;
}

+ (AWSRegionType) getRegionFromTestConfiguration {
    return [[self getIntegrationTestConfigurationForPackageId:@"common"][@"region"] aws_regionTypeValue];
}

+ (NSString *) getAccountIdFromTestConfiguration {
    NSDictionary *credentialsFromTestConfigurationJson = [self getCredentialsFromTestConfiguration];
    return credentialsFromTestConfigurationJson[@"identityId"];
}

+ (void) setupSessionCredentialsProvider {
    AWSServiceConfiguration *configuration = [AWSTestUtility getDefaultServiceConfiguration];
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
}

+ (void)setupCognitoIdentityService {
    if (![AWSCognitoIdentity CognitoIdentityForKey:AWSTestUtilityCognitoIdentityServiceKey]) {
        AWSServiceConfiguration *configuration = [AWSTestUtility getDefaultServiceConfiguration];
        [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration
                                                              forKey:AWSTestUtilityCognitoIdentityServiceKey];
    }
}

+ (AWSServiceConfiguration *) getDefaultServiceConfiguration {
    AWSBasicSessionCredentialsProvider *credentialsProvider = [AWSTestUtility getDefaultCredentialsProvider];
    AWSRegionType region = [self getRegionFromTestConfiguration];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:region
                                                                         credentialsProvider:credentialsProvider];
    return configuration;
}

+ (AWSBasicSessionCredentialsProvider *) getDefaultCredentialsProvider {
    NSDictionary *credentialsFromTestConfigurationJson = [self getCredentialsFromTestConfiguration];
    AWSBasicSessionCredentialsProvider *credentialsProvider = [[AWSBasicSessionCredentialsProvider alloc]
                                                               initWithAccessKey:credentialsFromTestConfigurationJson[@"accessKey"]
                                                                       secretKey:credentialsFromTestConfigurationJson[@"secretKey"]
                                                                    sessionToken:credentialsFromTestConfigurationJson[@"sessionToken"]];
    return credentialsProvider;
}

Method _originalDateMethod;
Method _mockDateMethod;
static char mockDateKey;

// Mock Method, replaces [NSDate date]
- (NSDate *)mockDateSwizzle {
    return objc_getAssociatedObject([NSDate class], &mockDateKey);
}

// Convenience method so tests can set what they want [NSDate date] to return
+ (void)setMockDate:(NSDate *)aMockDate {
    objc_setAssociatedObject([NSDate class], &mockDateKey, aMockDate, OBJC_ASSOCIATION_RETAIN);
}

+ (void)setupSwizzling {
    // Start by having the mock return the test startup date
    [self setMockDate:[NSDate date]];

    // Save these as instance variables so test teardown can swap the implementation back
    _originalDateMethod = class_getClassMethod([NSDate class], @selector(date));
    _mockDateMethod = class_getInstanceMethod([self class], @selector(mockDateSwizzle));
    method_exchangeImplementations(_originalDateMethod, _mockDateMethod);

    //make sure current runTimeClockSkew is 0
    [NSDate aws_setRuntimeClockSkew:0];
}

+ (void)revertSwizzling {
    // Revert the swizzle
    method_exchangeImplementations(_mockDateMethod, _originalDateMethod);
    //reset RunTimeClockSkew
    [NSDate aws_setRuntimeClockSkew:0];
}

+ (void)setupFakeCognitoCredentialsProvider {
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                    identityPoolId:@"fakeIdentityPoolId"];

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
}

+ (void)setupCognitoCredentialsProviderForDefaultRegion {
    [AWSTestUtility setupCognitoCredentialsProviderForRegion:[AWSTestUtility getRegionFromTestConfiguration]];
}

+ (void)setupCognitoCredentialsProviderForRegion:(AWSRegionType)region {
#if AWS_TEST_BJS_INSTEAD
    //since BJS doesn't support Cognito, we are using STS instead
    [self setupSTS];
    [self runServiceWithStsCredential];
#else
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        AWSCognitoCredentialsProvider *credentialsProvider = [AWSTestUtility getCognitoCredentialsProviderFromFileForRegion:region];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:region
                                                                             credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
#endif
}

+ (AWSCognitoCredentialsProvider *)getCognitoCredentialsProviderFromFileForRegion:(AWSRegionType)region {
    NSDictionary<NSString *, NSString*> *packageConfig = [AWSTestUtility getIntegrationTestConfigurationForPackageId:@"common"];
    NSString *identityPoolId = packageConfig[@"identityPoolId"];
    NSString *authRoleArn = packageConfig[@"authRoleArn"];
    NSString *unauthRoleArn = packageConfig[@"unauthRoleArn"];
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:region
                                                                                                    identityPoolId:identityPoolId
                                                                                                     unauthRoleArn:unauthRoleArn
                                                                                                       authRoleArn:authRoleArn
                                                                                           identityProviderManager:nil];
    return credentialsProvider;
}

+ (NSString *) getIoTEndPoint:(NSString *) endpointName {
    NSDictionary<NSString *, NSString*> *packageConfig = [AWSTestUtility
                                                            getIntegrationTestConfigurationForPackageId:@"iot"];
    if ([packageConfig objectForKey:endpointName]) {
        NSString *host = [packageConfig valueForKey:endpointName];
        NSString *endpointWithScheme = [NSString stringWithFormat:@"https://%@", host];
        return endpointWithScheme;
    } else {
        return nil;
    }
}
    
+ (BOOL)isCognitoSupportedInDefaultRegion {
    NSDictionary *packageConfig = [AWSTestUtility getIntegrationTestConfigurationForPackageId:@"common"];
    NSString *isCognitoSupportedStr = packageConfig[@"cognito_support_in_region"];
    return [isCognitoSupportedStr isEqualToString:@"True"];
}

@end
