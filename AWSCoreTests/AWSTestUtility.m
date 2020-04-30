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

+ (void)initialize {
    [super initialize];
}

+ (void) setupSessionCredentialsProvider {
    
    NSDictionary *testConfigurationJson = [self getTestConfigurationJSON];
    AWSBasicSessionCredentialsProvider *credentialsProvider = [[AWSBasicSessionCredentialsProvider alloc]
                                                               initWithAccessKey:testConfigurationJson[@"credentials"][@"accessKey"]
                                                                       secretKey:testConfigurationJson[@"credentials"][@"secretKey"]
                                                                    sessionToken:testConfigurationJson[@"credentials"][@"sessionToken"]];
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion: [testConfigurationJson[@"credentials"][@"region"] aws_regionTypeValue]
                                                                         credentialsProvider:credentialsProvider];
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
}

+ (NSDictionary *) getIntegrationTestConfigurationForPackageId:(NSString *) packageId {
    NSDictionary *testConfigurationJson = [self getTestConfigurationJSON];
    return testConfigurationJson[@"packages"][packageId];
}

+ (AWSRegionType) getRegionFromTestConfiguration {
    NSDictionary *testConfigurationJson = [self getTestConfigurationJSON];
    return [testConfigurationJson[@"credentials"][@"region"] aws_regionTypeValue];
}

+ (NSString *) getAccountIdFromTestConfiguration {
    NSDictionary *testConfigurationJson = [self getTestConfigurationJSON];
    return testConfigurationJson[@"credentials"][@"accountId"];
}

+ (NSDictionary *) getTestConfigurationJSON {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"testconfiguration"
                                                                          ofType:@"json"];
    NSDictionary *testConfigurationJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
    return testConfigurationJson;
}

+ (void)setupCognitoIdentityService {
    if (![AWSCognitoIdentity CognitoIdentityForKey:AWSTestUtilityCognitoIdentityServiceKey]) {
        NSDictionary *testConfigurationJson = [self getTestConfigurationJSON];
        AWSBasicSessionCredentialsProvider *credentialsProvider = [[AWSBasicSessionCredentialsProvider alloc]
                                                                   initWithAccessKey:testConfigurationJson[@"credentials"][@"accessKey"]
                                                                           secretKey:testConfigurationJson[@"credentials"][@"secretKey"]
                                                                        sessionToken:testConfigurationJson[@"credentials"][@"sessionToken"]];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion: [testConfigurationJson[@"credentials"][@"region"] aws_regionTypeValue]
                                                                             credentialsProvider:credentialsProvider];
        [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration
                                                              forKey:AWSTestUtilityCognitoIdentityServiceKey];
    }
}


+ (void)setupCredentialsViaFile {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
#if AWS_TEST_BJS_INSTEAD
        NSDictionary<NSString *, NSString*> *credentialsJson = [AWSTestUtility getCredentialsJsonAsDictionary];
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKeyBJS"]
                                                                                                          secretKey:credentialsJson[@"secretKeyBJS"]];

        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionCNNorth1
                                                                               credentialsProvider:credentialsProvider];
#else
        AWSRegionType region = [AWSTestUtility getDefaultRegionType];
        AWSStaticCredentialsProvider *credentialsProvider = [AWSTestUtility getStaticCredentialsProviderFromFile];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:region
                                                                             credentialsProvider:credentialsProvider];
#endif
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
}

+ (AWSStaticCredentialsProvider *)getStaticCredentialsProviderFromFile {
    NSDictionary<NSString *, NSString*> *credentialsJson = [AWSTestUtility getCredentialsJsonAsDictionary];
    AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                      secretKey:credentialsJson[@"secretKey"]];
    return credentialsProvider;
}

+ (void)setupFakeCognitoCredentialsProvider {
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                    identityPoolId:@"fakeIdentityPoolId"];

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
}

+ (void)setupCognitoCredentialsProvider {
    [AWSTestUtility setupCognitoCredentialsProviderForRegion:[AWSTestUtility getDefaultRegionType]];
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
    NSDictionary<NSString *, NSString*> *credentialsJson = [AWSTestUtility getCredentialsJsonAsDictionary];
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:region
                                                                                                    identityPoolId:credentialsJson[@"identityPoolId"]
                                                                                                     unauthRoleArn:credentialsJson[@"unauthRoleArn"]
                                                                                                       authRoleArn:credentialsJson[@"authRoleArn"]
                                                                                           identityProviderManager:nil];
    return credentialsProvider;
}

+ (void)setupSTS {
    if (![AWSSTS STSForKey:AWSTestUtilitySTSKey]) {
#if AWS_TEST_BJS_INSTEAD
        NSDictionary<NSString *, NSString*> *credentialsJson = [AWSTestUtility getCredentialsJsonAsDictionary];
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKeyBJS"]
                                                                                                          secretKey:credentialsJson[@"secretKeyBJS"]];

        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionCNNorth1
                                                                               credentialsProvider:credentialsProvider];
#else
        AWSRegionType region = [AWSTestUtility getDefaultRegionType];
        AWSStaticCredentialsProvider *credentialsProvider = [AWSTestUtility getStaticCredentialsProviderFromFile];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:region
                                                                             credentialsProvider:credentialsProvider];
#endif
        [AWSSTS registerSTSWithConfiguration:configuration
                                      forKey:AWSTestUtilitySTSKey];
    }
}

+ (NSString *) getIoTEndPoint:(NSString *) endpointName {
    NSDictionary<NSString *, NSString*> *credentialsJson = [AWSTestUtility getCredentialsJsonAsDictionary];
    if ([credentialsJson objectForKey:endpointName]) {
        return [credentialsJson valueForKey:endpointName];
    } else {
        return nil;
    }
}
    
+ (NSDictionary<NSString *, NSString *> *) getCredentialsJsonAsDictionary {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                          ofType:@"json"];
    NSDictionary<NSString *, NSString*> *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                                           options:NSJSONReadingMutableContainers
                                                                                             error:nil];
    return credentialsJson;
}

+ (AWSRegionType)getDefaultRegionType {
    NSDictionary<NSString *, NSString*> *credentialsJson = [AWSTestUtility getCredentialsJsonAsDictionary];
    NSString *regionString = credentialsJson[@"region"] ?: @"us-east-1";
    AWSRegionType region = [regionString aws_regionTypeValue];
    return region;
}

+ (BOOL)isCognitoSupportedInDefaultRegion {
    return [AWSTestUtility isCognitoSupportedInRegion:[AWSTestUtility getDefaultRegionType]];
}

// TODO: This is brittle. Implement a lookup by service like the Java SDK's isServiceSupported method
// https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/java-dg-region-selection.html
+ (BOOL)isCognitoSupportedInRegion:(AWSRegionType)region {
    switch (region) {
        case AWSRegionAPNortheast1:
        case AWSRegionAPNortheast2:
        case AWSRegionAPSouth1:
        case AWSRegionAPSoutheast1:
        case AWSRegionAPSoutheast2:
        case AWSRegionCACentral1:
        case AWSRegionEUCentral1:
        case AWSRegionEUWest1:
        case AWSRegionEUWest2:
        case AWSRegionUSEast1:
        case AWSRegionUSEast2:
        case AWSRegionUSWest2:
            return true;
            break;

        case AWSRegionAFSouth1:
        case AWSRegionAPEast1:
        case AWSRegionCNNorth1:
        case AWSRegionCNNorthWest1:
        case AWSRegionEUNorth1:
        case AWSRegionEUSouth1:
        case AWSRegionEUWest3:
        case AWSRegionMESouth1:
        case AWSRegionSAEast1:
        case AWSRegionUSGovEast1:
        case AWSRegionUSGovWest1:
        case AWSRegionUSWest1:
        case AWSRegionUnknown:
            return false;
            break;
    }
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

@end
