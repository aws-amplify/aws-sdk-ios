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

#import <Foundation/Foundation.h>
#import "AWSCognitoIdentityProviderService.h"

/**
 The status of the user.
 <ul>
 <li>AWSCognitoIdentityUserStatusUnknown - The user status is unknown.</li>
 <li>AWSCognitoIdentityUserStatusConfirmed - The user was auto confirmed.</li>
 <li>AWSCognitoIdentityUserStatusUnconfirmed - The user was not confirmed.</li>
 </ul>
 */
typedef NS_ENUM(NSInteger, AWSCognitoIdentityUserStatus) {
    AWSCognitoIdentityUserStatusUnknown = 0,
    AWSCognitoIdentityUserStatusConfirmed = -1000,
    AWSCognitoIdentityUserStatusUnconfirmed = -2000,
};

@class AWSCognitoIdentityUserPool;
@class AWSCognitoIdentityUserSession;
@class AWSCognitoIdentityUserSessionToken;
@class AWSCognitoIdentityUserSettings;
@class AWSCognitoIdentityUserMFAOption;

@class AWSCognitoIdentityUserConfirmSignUpResponse;
@class AWSCognitoIdentityUserGetDetailsResponse;
@class AWSCognitoIdentityUserResendConfirmationCodeResponse;
@class AWSCognitoIdentityUserForgotPasswordResponse;
@class AWSCognitoIdentityUserConfirmForgotPasswordResponse;
@class AWSCognitoIdentityUserChangePasswordResponse;
@class AWSCognitoIdentityUserAttributeType;
@class AWSCognitoIdentityUserUpdateAttributesResponse;
@class AWSCognitoIdentityUserDeleteAttributesResponse;
@class AWSCognitoIdentityUserVerifyAttributeResponse;
@class AWSCognitoIdentityUserGetAttributeVerificationCodeResponse;
@class AWSCognitoIdentityUserSetUserSettingsResponse;
@class AWSCognitoIdentityUserGlobalSignOutResponse;
@class AWSCognitoIdentityUserListDevicesResponse;
@class AWSCognitoIdentityUserUpdateDeviceStatusResponse;


NS_ASSUME_NONNULL_BEGIN

@interface AWSCognitoIdentityUser : NSObject

/**
 The username of this user
 */
@property (nonatomic, readonly, nullable) NSString *username;

/**
 If this user is a result of a signup, this has the confirmation status
 */
@property (nonatomic, readonly) AWSCognitoIdentityUserStatus confirmedStatus;

/**
 Determines whether this user has an active session or not. If the refresh token is expired
 the user will be prompted to authenticate when you call getSession.
*/
@property (nonatomic, readonly, getter=isSignedIn) BOOL signedIn;

/**
 Get the device id
 */
@property (nonatomic, readonly) NSString * deviceId;

/**
 Confirm a users' sign up with the confirmation code
 */
- (AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *)confirmSignUp:(NSString *)confirmationCode;


/**
 Confirm a users' sign up with the confirmation code.  If forceAliasCreation is set, if another user is aliased to the same email/phone this code was sent to, reassign alias to this user.
 */
-(AWSTask<AWSCognitoIdentityUserConfirmSignUpResponse *> *) confirmSignUp:(NSString *) confirmationCode forceAliasCreation:(BOOL)forceAliasCreation;

/**
 Resend the confirmation code sent during sign up
 */
- (AWSTask<AWSCognitoIdentityUserResendConfirmationCodeResponse *> *)resendConfirmationCode;

/**
 Get a session with id, access and refresh tokens.
 */
- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession;

/**
 Get a session with custom scopes.
 */
- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession:(nullable NSSet<NSString *> *)scopes DEPRECATED_MSG_ATTRIBUTE("Supplying scopes has no impact client side, they are set at the app client level in the user pool.  Use getSession instead.");

/**
 Get a session with the following username and password
 */
- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession:(NSString *)username
                                                password:(NSString *)password
                                          validationData:(nullable NSArray<AWSCognitoIdentityUserAttributeType *> *)validationData;

/**
 Get a session with the following username and password with custom scopes
 */
- (AWSTask<AWSCognitoIdentityUserSession *> *)getSession:(NSString *)username
                                                password:(NSString *)password
                                          validationData:(nullable NSArray<AWSCognitoIdentityUserAttributeType *> *)validationData
                                                  scopes:(nullable NSSet<NSString *> *)scopes DEPRECATED_MSG_ATTRIBUTE("Supplying scopes has no impact client side, they are set at the app client level in the user pool. Use getSession:password:validationData instead .");

/**
 Get details about this user, including user attributes
 */
- (AWSTask<AWSCognitoIdentityUserGetDetailsResponse *> *)getDetails;

/**
 Send a code to this user to initiate the forgot password flow
 */
- (AWSTask<AWSCognitoIdentityUserForgotPasswordResponse *> *)forgotPassword;

/**
 Conclude the forgot password flow by providing the forgot password code and new password.
 */
- (AWSTask<AWSCognitoIdentityUserConfirmForgotPasswordResponse *> *)confirmForgotPassword:(NSString *)confirmationCode
                                                                                 password:(NSString *)password;

/**
 Change this user's password
 */
- (AWSTask<AWSCognitoIdentityUserChangePasswordResponse *> *)changePassword:(NSString *)currentPassword
                                                           proposedPassword:(NSString *)proposedPassword;

/**
 Update this user's attributes
 */
- (AWSTask<AWSCognitoIdentityUserUpdateAttributesResponse *> *)updateAttributes:(NSArray<AWSCognitoIdentityUserAttributeType *> *)attributes;

/**
 Delete the attributes specified by attributeNames
 */
- (AWSTask<AWSCognitoIdentityUserDeleteAttributesResponse *> *)deleteAttributes:(NSArray<NSString *> *)attributeNames;


/**
 Verify a user attribute upon receiving the verification code.
 */
- (AWSTask<AWSCognitoIdentityUserVerifyAttributeResponse *> *)verifyAttribute:(NSString *)attributeName
                                                                         code:(NSString *)code;

/**
 Request a verification code to verify an attribute.
 */
- (AWSTask<AWSCognitoIdentityUserGetAttributeVerificationCodeResponse *> *)getAttributeVerificationCode:(NSString *)attributeName;

/**
 Set the user settings for this user such as MFA
 */
- (AWSTask<AWSCognitoIdentityUserSetUserSettingsResponse *> *)setUserSettings:(AWSCognitoIdentityUserSettings *)settings;

/**
 Delete this user
 */
- (AWSTask *)deleteUser;

/**
 Remove all sessions from the keychain for this user.  Last known user remains.
 */
- (void)signOut;

/**
 Invalidate any active sessions with the service.  Last known user remains.
 */
- (AWSTask<AWSCognitoIdentityUserGlobalSignOutResponse *> *) globalSignOut;

/**
 Remove all sessions from the keychain for this user and clear last known user.
 */
- (void)signOutAndClearLastKnownUser;


/**
 List devices for this user
 */
- (AWSTask<AWSCognitoIdentityUserListDevicesResponse *> *) listDevices: (int) limit paginationToken:(NSString * _Nullable) paginationToken;

/**
 Update device status for the provided device.
 */
- (AWSTask<AWSCognitoIdentityUserUpdateDeviceStatusResponse *> *) updateDeviceStatus: (NSString *) deviceId remembered:(BOOL) remembered;


@end


/**
 A User session.  Encapsulates all tokens (id, access and refresh tokens) for a user.
 */
@interface AWSCognitoIdentityUserSession : NSObject

@property (nonatomic, readonly) AWSCognitoIdentityUserSessionToken * _Nullable idToken;
@property (nonatomic, readonly) AWSCognitoIdentityUserSessionToken * _Nullable accessToken;
@property (nonatomic, readonly) AWSCognitoIdentityUserSessionToken * _Nullable refreshToken;
@property (nonatomic, readonly) NSDate * _Nullable expirationTime;

@end

/**
 A JWT session token.
 */
@interface AWSCognitoIdentityUserSessionToken : NSObject

@property (nonatomic, readonly) NSString *  tokenString;

@end

/**
 User settings.  Currently only mfa options.
 */
@interface AWSCognitoIdentityUserSettings : NSObject

@property (nonatomic, copy) NSArray<AWSCognitoIdentityUserMFAOption *>* _Nullable mfaOptions;

@end

@interface AWSCognitoIdentityUserMFAOption : NSObject

@property (nonatomic, strong) NSString *  attributeName;
@property (nonatomic, assign) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;

@end

@interface AWSCognitoIdentityUserAttributeType : AWSCognitoIdentityProviderAttributeType

@end

#pragma Response wrappers
@interface AWSCognitoIdentityUserConfirmSignUpResponse : AWSCognitoIdentityProviderConfirmSignUpResponse

@end

@interface AWSCognitoIdentityUserResendConfirmationCodeResponse :AWSCognitoIdentityProviderResendConfirmationCodeResponse

@end

@interface AWSCognitoIdentityUserGetDetailsResponse : AWSCognitoIdentityProviderGetUserResponse

@end

@interface AWSCognitoIdentityUserForgotPasswordResponse : AWSCognitoIdentityProviderForgotPasswordResponse

@end

@interface AWSCognitoIdentityUserConfirmForgotPasswordResponse : AWSCognitoIdentityProviderConfirmForgotPasswordResponse

@end

@interface AWSCognitoIdentityUserChangePasswordResponse : AWSCognitoIdentityProviderChangePasswordResponse

@end

@interface AWSCognitoIdentityUserUpdateAttributesResponse : AWSCognitoIdentityProviderUpdateUserAttributesResponse

@end

@interface AWSCognitoIdentityUserDeleteAttributesResponse : AWSCognitoIdentityProviderDeleteUserAttributesResponse

@end

@interface AWSCognitoIdentityUserVerifyAttributeResponse : AWSCognitoIdentityProviderVerifyUserAttributeResponse

@end

@interface AWSCognitoIdentityUserGetAttributeVerificationCodeResponse : AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse

@end

@interface AWSCognitoIdentityUserSetUserSettingsResponse : AWSCognitoIdentityProviderSetUserSettingsResponse

@end

@interface AWSCognitoIdentityUserGlobalSignOutResponse : AWSCognitoIdentityProviderGlobalSignOutResponse

@end

@interface AWSCognitoIdentityUserListDevicesResponse : AWSCognitoIdentityProviderListDevicesResponse

@end

@interface AWSCognitoIdentityUserUpdateDeviceStatusResponse : AWSCognitoIdentityProviderUpdateDeviceStatusResponse

@end

NS_ASSUME_NONNULL_END