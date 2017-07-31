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

+ (void)setupCrdentialsViaFile {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
#if AWS_TEST_BJS_INSTEAD
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials" ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKeyBJS"]
                                                                                                          secretKey:credentialsJson[@"secretKeyBJS"]];

        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionCNNorth1
                                                                               credentialsProvider:credentialsProvider];

#else
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                              ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                          secretKey:credentialsJson[@"secretKey"]];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                             credentialsProvider:credentialsProvider];
#endif
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
}

+ (void)setupFakeCognitoCredentialsProvider {

    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1 identityPoolId:@"fakeIdentityPoolId"];

    
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:credentialsProvider];
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

}

+ (void)setupCognitoCredentialsProvider {
#if AWS_TEST_BJS_INSTEAD
    //since BJS doesn't support Cognito, we are using STS instead
    [self setupSTS];
    [self runServiceWithStsCredential];

#else
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                              ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];

        AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                        identityPoolId:credentialsJson[@"identityPoolId"]
                                                                                                         unauthRoleArn:credentialsJson[@"unauthRoleArn"]
                                                                                                           authRoleArn:credentialsJson[@"authRoleArn"]
                                                                                               identityProviderManager:nil];

        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                             credentialsProvider:credentialsProvider];
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
#endif
}

+ (void)setupSTS {
    if (![AWSSTS STSForKey:AWSTestUtilitySTSKey]) {
#if AWS_TEST_BJS_INSTEAD
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials" ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKeyBJS"]
                                                                                                          secretKey:credentialsJson[@"secretKeyBJS"]];

        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionCNNorth1
                                                                               credentialsProvider:credentialsProvider];
#else
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                              ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                          secretKey:credentialsJson[@"secretKey"]];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                             credentialsProvider:credentialsProvider];
#endif
        [AWSSTS registerSTSWithConfiguration:configuration
                                      forKey:AWSTestUtilitySTSKey];
    }
}

+ (void)setupCognitoIdentityService {
    if (![AWSCognitoIdentity CognitoIdentityForKey:AWSTestUtilityCognitoIdentityServiceKey]) {
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                              ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                          secretKey:credentialsJson[@"secretKey"]];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                             credentialsProvider:credentialsProvider];
        [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:configuration
                                                              forKey:AWSTestUtilityCognitoIdentityServiceKey];
    }
}

/* TODO: currently not used. Should clean this up.
+ (void)runServiceWithStsCredential {
    AWSTestCredentialsProvider *testCredentialProvider = [AWSTestCredentialsProvider new];

    AWSSTS *sts = [AWSSTS STSForKey:AWSTestUtilitySTSKey];

    AWSSTSGetSessionTokenRequest *getSessionTokenRequest = [AWSSTSGetSessionTokenRequest new];
    getSessionTokenRequest.durationSeconds = @900;

    [[[sts getSessionToken:getSessionTokenRequest] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            //XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            AWSSTSGetSessionTokenResponse *getSessionTokenResponse = task.result;
            //XCTAssertTrue([getSessionTokenResponse.credentials.accessKeyId length] > 0);
            testCredentialProvider.accessKey = getSessionTokenResponse.credentials.accessKeyId;

            //XCTAssertTrue([getSessionTokenResponse.credentials.secretAccessKey length] > 0);
            testCredentialProvider.secretKey = getSessionTokenResponse.credentials.secretAccessKey;

            //XCTAssertTrue([getSessionTokenResponse.credentials.sessionToken length] > 0);
            testCredentialProvider.sessionKey = getSessionTokenResponse.credentials.sessionToken;

            //XCTAssertTrue([getSessionTokenResponse.credentials.expiration isKindOfClass:[NSDate class]]);
        }

        return nil;
    }] waitUntilFinished];
#if AWS_TEST_BJS_INSTEAD
    AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionCNNorth1
                                                                           credentialsProvider:testCredentialProvider];
#else
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                         credentialsProvider:testCredentialProvider];

#endif
    [[AWSServiceManager defaultServiceManager] setDefaultServiceConfiguration:configuration];
    
    
}
*/

Method _originalDateMethod;
Method _mockDateMethod;
static char mockDateKey;

// Mock Method, replaces [NSDate date]
- (NSDate *)mockDateSwizzle {
    return objc_getAssociatedObject([NSDate class], &mockDateKey);
}

// Convenience method so tests can set want they want [NSDate date] to return
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
