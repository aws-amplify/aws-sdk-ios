//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <XCTest/XCTest.h>
#import "AWSCognitoIdentityProvider.h"
#import "AWSTestUtility.h"
#include <libkern/OSAtomic.h>

@interface AWSCognitoIdentityProviderTests : XCTestCase<AWSCognitoIdentityInteractiveAuthenticationDelegate, AWSCognitoIdentityPasswordAuthentication>

@end

@implementation AWSCognitoIdentityProviderTests

//pool/client
static NSString * poolId = nil;
static NSString * clientId = nil;
static NSString * clientSecret = nil;

//user
static NSString * username = nil;
static NSString * password = nil;

static NSString * CIP_POOL_KEY = @"createUserPool";
static NSString * PP_APP_ID = @"pinpointAppId";

static AWSCognitoIdentityUserPool *pool;
static AWSCognitoIdentityUserPool *migrationPool;
static BOOL passwordAuthError = NO;

static int testsInFlight = 8; //for knowing when to tear down the user pool

#pragma mark interactive auth delegate
-(id<AWSCognitoIdentityPasswordAuthentication>) startPasswordAuthentication {
    return self;
}

-(void) getPasswordAuthenticationDetails: (AWSCognitoIdentityPasswordAuthenticationInput *) authenticationInput  passwordAuthenticationCompletionSource: (AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails *> *) passwordAuthenticationCompletionSource {
    
    AWSCognitoIdentityPasswordAuthenticationDetails * result = [[AWSCognitoIdentityPasswordAuthenticationDetails alloc] initWithUsername:username password:password];
    if(passwordAuthError){
        [passwordAuthenticationCompletionSource cancel];
    }else {
        passwordAuthenticationCompletionSource.result = result;
    }
}

-(void) didCompletePasswordAuthenticationStepWithError:(NSError* _Nullable) error{
    if(error){
        passwordAuthError = YES;
    }
}

#pragma mark test suite setup
+ (AWSTask *) initializeTests {
    
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"credentials"
                                                                              ofType:@"json"];
        NSDictionary *credentialsJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        
        AWSStaticCredentialsProvider *credentialsProvider = [[AWSStaticCredentialsProvider alloc] initWithAccessKey:credentialsJson[@"accessKey"]
                                                                                                          secretKey:credentialsJson[@"secretKey"]];
        AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                             credentialsProvider:credentialsProvider];
        [AWSCognitoIdentityProvider registerCognitoIdentityProviderWithConfiguration:configuration forKey:CIP_POOL_KEY];
        AWSCognitoIdentityProvider *cip = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:CIP_POOL_KEY];
    
        //create a pool
        AWSCognitoIdentityProviderCreateUserPoolRequest *createUserPool = [AWSCognitoIdentityProviderCreateUserPoolRequest new];
        createUserPool.poolName = @"iOSTestPool";
        AWSCognitoIdentityProviderPasswordPolicyType *passwordPolicy = [AWSCognitoIdentityProviderPasswordPolicyType new];
        passwordPolicy.requireNumbers = @NO;
        passwordPolicy.requireUppercase = @NO;
        passwordPolicy.requireSymbols = @NO;
        passwordPolicy.requireLowercase = @NO;
        passwordPolicy.minimumLength = @6;
        AWSCognitoIdentityProviderUserPoolPolicyType *policies = [AWSCognitoIdentityProviderUserPoolPolicyType new];
        policies.passwordPolicy = passwordPolicy;
        createUserPool.policies = policies;
    
        return [[[[[[cip createUserPool:createUserPool] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderCreateUserPoolResponse *> * _Nonnull task) {
            //create a client for admin purposes
            AWSCognitoIdentityProviderCreateUserPoolResponse *pool = task.result;
            AWSCognitoIdentityProviderCreateUserPoolClientRequest *client = [AWSCognitoIdentityProviderCreateUserPoolClientRequest new];
            poolId = pool.userPool.identifier;
            client.userPoolId = pool.userPool.identifier;
            client.clientName = @"Admin";
            client.generateSecret = @NO;
            return [cip createUserPoolClient:client];
        }] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderCreateUserPoolClientResponse *> * _Nonnull task) {
            [NSThread sleepForTimeInterval:2];
            //create a user
            AWSCognitoIdentityProviderCreateUserPoolClientResponse *result = task.result;
            clientId = result.userPoolClient.clientId;
            AWSCognitoIdentityProviderSignUpRequest * request = [AWSCognitoIdentityProviderSignUpRequest new];
            request.clientId = clientId;
            username = request.username = [[NSUUID UUID] UUIDString];
            password = request.password = [[NSUUID UUID] UUIDString];
            return [cip signUp:request];
        }] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderSignUpResponse *> * _Nonnull task) {
            //confirm user
            [NSThread sleepForTimeInterval:2];
            AWSCognitoIdentityProviderAdminConfirmSignUpRequest * request = [AWSCognitoIdentityProviderAdminConfirmSignUpRequest new];
            request.username = username;
            request.userPoolId = poolId;
            return [cip adminConfirmSignUp:request];
        }] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderAdminConfirmSignUpResponse *>* _Nonnull task) {
            //create a client for ios
            AWSCognitoIdentityProviderCreateUserPoolClientRequest *client = [AWSCognitoIdentityProviderCreateUserPoolClientRequest new];
            client.userPoolId = poolId;
            client.clientName = @"iOS";
            client.generateSecret = @YES;
            return [cip createUserPoolClient:client];
        }] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSCognitoIdentityProviderCreateUserPoolClientResponse *> * _Nonnull task) {
            AWSCognitoIdentityProviderCreateUserPoolClientResponse *result = task.result;
            clientId = result.userPoolClient.clientId;
            clientSecret = result.userPoolClient.clientSecret;
            return task;
        }];
    
}

#pragma mark test suite tear down
- (void) shutDownTests {
    AWSCognitoIdentityProvider *cip = [AWSCognitoIdentityProvider CognitoIdentityProviderForKey:CIP_POOL_KEY];
    AWSCognitoIdentityProviderDeleteUserPoolRequest *dupr = [AWSCognitoIdentityProviderDeleteUserPoolRequest new];
    dupr.userPoolId = poolId;
    [[[cip deleteUserPool:dupr] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if(task.error){
            NSLog(@"Unable to delete pool %@",poolId);
        }else{
            NSLog(@"Successfully deleted pool %@", poolId);
        }
        return task;
    }] waitUntilFinished];
    [AWSCognitoIdentityProvider removeCognitoIdentityProviderForKey:CIP_POOL_KEY];
}

#pragma mark test setup/teardown
- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [super setUp];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[[AWSCognitoIdentityProviderTests initializeTests] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
            if(task.error){
                XCTFail(@"Unable to create pool, clients and user.");
            }
            return nil;
        }] waitUntilFinished];
        AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
        AWSCognitoIdentityUserPoolConfiguration *iDPConfiguration = [[AWSCognitoIdentityUserPoolConfiguration alloc] initWithClientId:clientId
                                                                                                                         clientSecret:clientSecret
                                                                                                                               poolId:poolId
                                                                                                   shouldProvideCognitoValidationData:YES
                                                                                                                        pinpointAppId:PP_APP_ID];
        AWSCognitoIdentityUserPoolConfiguration *migrationConfiguration = [[AWSCognitoIdentityUserPoolConfiguration alloc] initWithClientId:clientId
                                                                                                                         clientSecret:clientSecret
                                                                                                                               poolId:poolId
                                                                                                   shouldProvideCognitoValidationData:YES
                                                                                                                        pinpointAppId:PP_APP_ID
                                                                                                                     migrationEnabled:YES];
        
        [AWSCognitoIdentityUserPool registerCognitoIdentityUserPoolWithConfiguration:serviceConfiguration userPoolConfiguration:iDPConfiguration forKey:@"UserPool"];
        
        [AWSCognitoIdentityUserPool registerCognitoIdentityUserPoolWithConfiguration:serviceConfiguration userPoolConfiguration:migrationConfiguration forKey:@"MigrationUserPool"];
        
        pool = [AWSCognitoIdentityUserPool CognitoIdentityUserPoolForKey:@"UserPool"];
        
        pool.delegate = self;
        
        migrationPool = [AWSCognitoIdentityUserPool CognitoIdentityUserPoolForKey:@"MigrationUserPool"];
        
        migrationPool.delegate = self;
    });
    passwordAuthError = NO;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    OSAtomicDecrement32(&testsInFlight);
    if(testsInFlight == 0){
        [self shutDownTests];
    }
    [super tearDown];
}


- (void)testSignInUser {
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"testSignInUser"];
    AWSCognitoIdentityUser* user = [pool getUser];
    XCTAssertEqualObjects(PP_APP_ID, pool.userPoolConfiguration.pinpointAppId);
    [[user getSession] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        if(task.error || task.isCancelled){
            XCTFail(@"Unable to sign in user: %@", task.error);
        }
        XCTAssertNotNil(task.result.accessToken);
        XCTAssertTrue(user.isSignedIn);
        [expectation fulfill];
        return task;
    }];
     
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];

}

- (void)testUserMigrationFlowInvoked {
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"testMigrationSignInUser"];
    AWSCognitoIdentityUser* user = [migrationPool getUser:@"unknown"];
    XCTAssertEqual(YES, migrationPool.userPoolConfiguration.migrationEnabled);
    [[user getSession:@"unknown" password:@"willfail" validationData:nil] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        if(task.error || task.isCancelled){
            XCTAssertEqualObjects(@"USER_PASSWORD_AUTH flow not enabled for this client",task.error.userInfo[@"message"]);
            [expectation fulfill];
        }else {
            XCTFail(@"Pool doesn't have migration enabled. %@", task.error);
        }
        return task;
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
    
}

- (void)testSignOutUser {
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"testSignOutUser"];
    AWSCognitoIdentityUser* user = [pool getUser];
    [[user getSession] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        if(task.error || task.isCancelled){
            XCTFail(@"Unable to sign in user: %@", task.error);
        }
        XCTAssertTrue(user.signedIn);
        [user signOut];
        XCTAssertFalse(user.signedIn);
        [expectation fulfill];
        return task;
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];

     
}


- (void)testRegisterUser {
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"testRegisterUser"];
    AWSCognitoIdentityUserAttributeType * email = [AWSCognitoIdentityUserAttributeType new];
    email.name = @"email";
    email.value = @"nobody@amazon.com";
    
    NSString * username = [[NSUUID UUID] UUIDString];
    [[pool signUp:username
          password:[[NSUUID UUID] UUIDString]
    userAttributes:@[email]
    validationData:nil] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserPoolSignUpResponse *> * _Nonnull task) {
        if(task.isCancelled || task.error){
            XCTFail(@"Request returned an error %@",task.error);
        }else {
            AWSCognitoIdentityUser * user = task.result.user;
            XCTAssertNotNil(user);
            XCTAssertEqualObjects(username,user.username);
        }
        [expectation fulfill];
        return task;
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testUpdateAttribute {
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"testUpdateAttribute"];
    AWSCognitoIdentityUserAttributeType * name = [AWSCognitoIdentityUserAttributeType new];
    name.name = @"name";
    name.value = @"Joe Test";
    AWSCognitoIdentityUser * user = [pool getUser:username];
    [[user updateAttributes:@[name]] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserUpdateAttributesResponse *> * _Nonnull task) {
        if(task.isCancelled || task.error){
            XCTFail(@"Request returned an error %@",task.error);
        }
        [expectation fulfill];
        return task;
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
    expectation =
    [self expectationWithDescription:@"testSessionNowHasUpdatedAttribute"];
    [[user getSession] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSession *> * _Nonnull task) {
        if(task.isCancelled || task.error){
            XCTFail(@"Request returned an error %@",task.error);
        }
        XCTAssertTrue([name.value isEqualToString:task.result.idToken.tokenClaims[@"name"]]);
        [expectation fulfill];
        return task;
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
    
}


- (void)testSetUserSettings {
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"testSetUserSettings"];
    AWSCognitoIdentityUser * user = [pool getUser:username];
    [user signOut];
    AWSCognitoIdentityUserSettings * settings = [AWSCognitoIdentityUserSettings new];
    AWSCognitoIdentityUserMFAOption * mfaOptions = [AWSCognitoIdentityUserMFAOption new];
    mfaOptions.attributeName = @"phone_number";
    mfaOptions.deliveryMedium = AWSCognitoIdentityProviderDeliveryMediumTypeSms;
    settings.mfaOptions = @[mfaOptions];
    [[user setUserSettings:settings]continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserSetUserSettingsResponse *> * _Nonnull task) {
        if(!task.error || task.error.code != AWSCognitoIdentityProviderErrorInvalidParameter){
            XCTFail(@"Request should have failed with InvalidParameterException (Cannot change the MFA setting when the user pool MFA is off.)");
        }
        [expectation fulfill];
        return task;
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];

}

- (void)testGetAttributeVerification {
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"testGetAttributeVerification"];
    AWSCognitoIdentityUser * user = [pool getUser:username];
    [[user getAttributeVerificationCode:@"phone_number"] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserGetAttributeVerificationCodeResponse *> * _Nonnull task) {
        if(!task.error || task.error.code != AWSCognitoIdentityProviderErrorInvalidParameter){
            XCTFail(@"Request should have failed with InvalidParameterException (Invalid phone number provided..)");
        }
        [expectation fulfill];
        return task;
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];

}


- (void)testChangePassword {
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"testChangePassword"];
    AWSCognitoIdentityUser * user = [pool getUser:username];
    [[user changePassword:password proposedPassword:password] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUserChangePasswordResponse *> * _Nonnull task) {
        if(task.isCancelled || task.error){
            XCTFail(@"Request returned an error %@",task.error);
        }
        [expectation fulfill];
        return task;
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];

}

                  

@end
