//
// Copyright 2014-2016 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Amazon Software License (the "License").
// You may not use this file except in compliance with the
// License. A copy of the License is located at
//
//     http://aws.amazon.com/asl/
//
// or in the "license" file accompanying this file. This file is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, express or implied. See the License
// for the specific language governing permissions and
// limitations under the License.
//

#import "AWSCognitoIdentityUser.h"

@interface AWSCognitoIdentityUserSessionToken()
@property (nonatomic, strong) NSString * tokenString;
-(instancetype) initWithToken:(NSString *)token;
@end

@interface AWSCognitoIdentityUserSession()
@property (nonatomic, strong) AWSCognitoIdentityUserSessionToken * idToken;
@property (nonatomic, strong) AWSCognitoIdentityUserSessionToken * accessToken;
@property (nonatomic, strong) AWSCognitoIdentityUserSessionToken * refreshToken;
@property (nonatomic, strong) NSDate * expirationTime;
-(instancetype) initWithIdToken: (NSString *)idToken accessToken:(NSString *) accessToken refreshToken:(NSString *) refreshToken expirationTime:(NSDate*) expirationTime;
-(instancetype) initWithIdToken: (NSString *)idToken accessToken:(NSString *) accessToken refreshToken:(NSString *) refreshToken expiresIn:(NSNumber*) expiresIn;
@end

@interface AWSCognitoIdentityUser()
@property (nonatomic, strong) NSString* username;
@property (nonatomic, assign) AWSCognitoIdentityUserStatus confirmedStatus;
@property (nonatomic, strong) AWSCognitoIdentityUserPool* pool;
@property (nonatomic, strong) NSString* userIdForSRP;
-(instancetype) initWithUsername: (NSString *)username pool:(AWSCognitoIdentityUserPool *)pool;
- (NSString *) asfDeviceId;
@end

@interface AWSCognitoIdentityUserMFAOption()
- (AWSCognitoIdentityProviderMFAOptionType *) mfaOptionTypeValue;
@end

@interface AWSCognitoIdentityUserDeviceCredentials : NSObject
@property (nonatomic, strong) AWSCognitoIdentityUser* user;
@property (nonatomic, strong) NSString * deviceId;
@property (nonatomic, strong) NSString * deviceSecret;
@property (nonatomic, strong) NSString * deviceGroup;
-(instancetype) initWithUser: (AWSCognitoIdentityUser *)user;
@end
