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

@interface AWSTestCredentialsProvider : NSObject <AWSCredentialsProvider>

@property (nonatomic) NSString *accessKey;
@property (nonatomic) NSString *secretKey;
@property (nonatomic) NSString *sessionKey;

@end

@implementation AWSTestCredentialsProvider

@end

@implementation AWSTestUtility

+(void)setupCrdentialsViaFile {
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
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
#endif
        [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    }
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
#endif
}

+ (void)setupSTS {
    
    if (![[AWSServiceManager defaultServiceManager] serviceForKey:AWSTestUtilitySTSKey]) {
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
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
#endif
        AWSSTS *sts = [[AWSSTS alloc] initWithConfiguration:configuration];
        [[AWSServiceManager defaultServiceManager] setService:sts forKey:AWSTestUtilitySTSKey];
    }

}

+ (void)setupCognitoIdentityService {
    if (![[AWSServiceManager defaultServiceManager] serviceForKey:AWSTestUtilityCognitoIdentityServiceKey]) {
        AWSStaticCredentialsProvider *credentialsProvider = [AWSStaticCredentialsProvider credentialsWithCredentialsFilename:@"credentials"];
        AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
        AWSCognitoIdentity *cis = [[AWSCognitoIdentity alloc] initWithConfiguration:configuration];
        [[AWSServiceManager defaultServiceManager] setService:cis forKey:AWSTestUtilityCognitoIdentityServiceKey];
    }
}

+ (void)runServiceWithStsCredential {
    AWSTestCredentialsProvider *testCredentialProvider = [AWSTestCredentialsProvider new];
    
    AWSSTS *sts = (AWSSTS *)[[AWSServiceManager defaultServiceManager] serviceForKey:AWSTestUtilitySTSKey];
    
    AWSSTSGetSessionTokenRequest *getSessionTokenRequest = [AWSSTSGetSessionTokenRequest new];
    getSessionTokenRequest.durationSeconds = @900;
    
    [[[sts getSessionToken:getSessionTokenRequest] continueWithBlock:^id(BFTask *task) {
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
    AWSServiceConfiguration *configuration = [AWSServiceConfiguration  configurationWithRegion:AWSRegionUSEast1
                                                                           credentialsProvider:testCredentialProvider];

#endif
    [[AWSServiceManager defaultServiceManager] setDefaultServiceConfiguration:configuration];
    
    
}

@end
