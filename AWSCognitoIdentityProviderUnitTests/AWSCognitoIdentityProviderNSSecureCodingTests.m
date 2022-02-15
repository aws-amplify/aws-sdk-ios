//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSNSSecureCodingTestBase/AWSNSSecureCodingTestBase.h>
#import "AWSCognitoIdentityProviderModel.h"

@interface AWSCognitoIdentityProviderNSSecureCodingTests : AWSNSSecureCodingTest

- (void) test_AWSCognitoIdentityProviderAccountRecoverySettingType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAccountTakeoverActionType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAccountTakeoverActionsType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAddCustomAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAddCustomAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminAddUserToGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminConfirmSignUpRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminConfirmSignUpResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminCreateUserConfigType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminCreateUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminCreateUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminDeleteUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminDisableProviderForUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminDisableProviderForUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminDisableUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminDisableUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminEnableUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminEnableUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminForgetDeviceRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminGetDeviceRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminGetDeviceResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminGetUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminGetUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminInitiateAuthRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminInitiateAuthResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminLinkProviderForUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminLinkProviderForUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminListDevicesRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminListDevicesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminListGroupsForUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminListGroupsForUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminListUserAuthEventsRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminListUserAuthEventsResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminResetUserPasswordRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminResetUserPasswordResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminSetUserPasswordRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminSetUserPasswordResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminSetUserSettingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminSetUserSettingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAnalyticsConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAnalyticsMetadataType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAssociateSoftwareTokenRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAssociateSoftwareTokenResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAttributeType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAuthEventType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderAuthenticationResultType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderChallengeResponseType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderChangePasswordRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderChangePasswordResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCodeDeliveryDetailsType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCompromisedCredentialsActionsType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderConfirmDeviceRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderConfirmDeviceResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderConfirmForgotPasswordRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderConfirmForgotPasswordResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderConfirmSignUpRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderConfirmSignUpResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderContextDataType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateIdentityProviderRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateIdentityProviderResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateResourceServerRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateResourceServerResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateUserImportJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateUserImportJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateUserPoolClientRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateUserPoolClientResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateUserPoolDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateUserPoolDomainResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateUserPoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCreateUserPoolResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCustomDomainConfigType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCustomEmailLambdaVersionConfigType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderCustomSMSLambdaVersionConfigType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeleteGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeleteIdentityProviderRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeleteResourceServerRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeleteUserAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeleteUserAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeleteUserPoolClientRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeleteUserPoolDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeleteUserPoolDomainResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeleteUserPoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeleteUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeIdentityProviderRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeIdentityProviderResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeResourceServerRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeResourceServerResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeRiskConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeRiskConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeUserImportJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeUserImportJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeUserPoolClientRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeUserPoolClientResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeUserPoolDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeUserPoolDomainResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeUserPoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDescribeUserPoolResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeviceConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeviceSecretVerifierConfigType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDeviceType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderDomainDescriptionType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderEmailConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderEventContextDataType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderEventFeedbackType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderEventRiskType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderForgetDeviceRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderForgotPasswordRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderForgotPasswordResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetCSVHeaderRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetCSVHeaderResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetDeviceRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetDeviceResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetSigningCertificateRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetSigningCertificateResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetUICustomizationRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetUICustomizationResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetUserRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGetUserResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGlobalSignOutRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGlobalSignOutResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderGroupType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderHttpHeader API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderIdentityProviderType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderInitiateAuthRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderInitiateAuthResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderLambdaConfigType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListDevicesRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListDevicesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListGroupsRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListGroupsResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListIdentityProvidersRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListIdentityProvidersResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListResourceServersRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListResourceServersResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListTagsForResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListTagsForResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListUserImportJobsRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListUserImportJobsResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListUserPoolClientsRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListUserPoolClientsResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListUserPoolsRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListUserPoolsResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListUsersInGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListUsersInGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListUsersRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderListUsersResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderMFAOptionType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderMessageTemplateType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderLatestDeviceMetadataType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderNotifyConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderNotifyEmailType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderNumberAttributeConstraintsType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderPasswordPolicyType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderProviderDescription API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderProviderUserIdentifierType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderRecoveryOptionType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderResendConfirmationCodeRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderResendConfirmationCodeResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderResourceServerScopeType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderResourceServerType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderRespondToAuthChallengeRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderRespondToAuthChallengeResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderRevokeTokenRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderRevokeTokenResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderRiskConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderRiskExceptionConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSMSMfaSettingsType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSchemaAttributeType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSetRiskConfigurationRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSetRiskConfigurationResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSetUICustomizationRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSetUICustomizationResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSetUserMFAPreferenceRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSetUserMFAPreferenceResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSetUserSettingsRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSetUserSettingsResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSignUpRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSignUpResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSmsConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSmsMfaConfigType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSoftwareTokenMfaConfigType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderStartUserImportJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderStartUserImportJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderStopUserImportJobRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderStopUserImportJobResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderStringAttributeConstraintsType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderTagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderTagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderTokenValidityUnitsType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUICustomizationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUntagResourceRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUntagResourceResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateDeviceStatusRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateDeviceStatusResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateGroupRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateGroupResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateIdentityProviderRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateIdentityProviderResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateResourceServerRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateResourceServerResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateUserAttributesRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateUserAttributesResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateUserPoolClientRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateUserPoolClientResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateUserPoolDomainRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateUserPoolDomainResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateUserPoolRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUpdateUserPoolResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUserContextDataType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUserImportJobType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUserPoolAddOnsType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUserPoolClientDescription API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUserPoolClientType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUserPoolDescriptionType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUserPoolPolicyType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUserPoolType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUserType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderUsernameConfigurationType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderVerificationMessageTemplateType API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderVerifySoftwareTokenRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderVerifySoftwareTokenResponse API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderVerifyUserAttributeRequest API_AVAILABLE(ios(11));
- (void) test_AWSCognitoIdentityProviderVerifyUserAttributeResponse API_AVAILABLE(ios(11));

@end

@implementation AWSCognitoIdentityProviderNSSecureCodingTests

- (void) test_AWSCognitoIdentityProviderAccountRecoverySettingType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAccountRecoverySettingType class]];
}

- (void) test_AWSCognitoIdentityProviderAccountTakeoverActionType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAccountTakeoverActionType class]];
}

- (void) test_AWSCognitoIdentityProviderAccountTakeoverActionsType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAccountTakeoverActionsType class]];
}

- (void) test_AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType class]];
}

- (void) test_AWSCognitoIdentityProviderAddCustomAttributesRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAddCustomAttributesRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAddCustomAttributesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAddCustomAttributesResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminAddUserToGroupRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminAddUserToGroupRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminConfirmSignUpRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminConfirmSignUpRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminConfirmSignUpResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminConfirmSignUpResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminCreateUserConfigType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminCreateUserConfigType class]];
}

- (void) test_AWSCognitoIdentityProviderAdminCreateUserRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminCreateUserRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminCreateUserResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminCreateUserResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminDeleteUserRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminDeleteUserRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminDisableProviderForUserRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminDisableProviderForUserRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminDisableProviderForUserResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminDisableProviderForUserResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminDisableUserRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminDisableUserRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminDisableUserResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminDisableUserResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminEnableUserRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminEnableUserRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminEnableUserResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminEnableUserResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminForgetDeviceRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminForgetDeviceRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminGetDeviceRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminGetDeviceRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminGetDeviceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminGetDeviceResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminGetUserRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminGetUserRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminGetUserResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminGetUserResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminInitiateAuthRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminInitiateAuthRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminInitiateAuthResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminInitiateAuthResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminLinkProviderForUserRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminLinkProviderForUserRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminLinkProviderForUserResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminLinkProviderForUserResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminListDevicesRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminListDevicesRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminListDevicesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminListDevicesResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminListGroupsForUserRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminListGroupsForUserRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminListGroupsForUserResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminListGroupsForUserResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminListUserAuthEventsRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminListUserAuthEventsRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminListUserAuthEventsResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminListUserAuthEventsResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminResetUserPasswordRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminResetUserPasswordRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminResetUserPasswordResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminResetUserPasswordResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminSetUserPasswordRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminSetUserPasswordRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminSetUserPasswordResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminSetUserPasswordResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminSetUserSettingsRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminSetUserSettingsRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminSetUserSettingsResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminSetUserSettingsResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAnalyticsConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAnalyticsConfigurationType class]];
}

- (void) test_AWSCognitoIdentityProviderAnalyticsMetadataType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAnalyticsMetadataType class]];
}

- (void) test_AWSCognitoIdentityProviderAssociateSoftwareTokenRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAssociateSoftwareTokenRequest class]];
}

- (void) test_AWSCognitoIdentityProviderAssociateSoftwareTokenResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAssociateSoftwareTokenResponse class]];
}

- (void) test_AWSCognitoIdentityProviderAttributeType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAttributeType class]];
}

- (void) test_AWSCognitoIdentityProviderAuthEventType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAuthEventType class]];
}

- (void) test_AWSCognitoIdentityProviderAuthenticationResultType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderAuthenticationResultType class]];
}

- (void) test_AWSCognitoIdentityProviderChallengeResponseType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderChallengeResponseType class]];
}

- (void) test_AWSCognitoIdentityProviderChangePasswordRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderChangePasswordRequest class]];
}

- (void) test_AWSCognitoIdentityProviderChangePasswordResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderChangePasswordResponse class]];
}

- (void) test_AWSCognitoIdentityProviderCodeDeliveryDetailsType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

- (void) test_AWSCognitoIdentityProviderCompromisedCredentialsActionsType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCompromisedCredentialsActionsType class]];
}

- (void) test_AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType class]];
}

- (void) test_AWSCognitoIdentityProviderConfirmDeviceRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderConfirmDeviceRequest class]];
}

- (void) test_AWSCognitoIdentityProviderConfirmDeviceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderConfirmDeviceResponse class]];
}

- (void) test_AWSCognitoIdentityProviderConfirmForgotPasswordRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderConfirmForgotPasswordRequest class]];
}

- (void) test_AWSCognitoIdentityProviderConfirmForgotPasswordResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderConfirmForgotPasswordResponse class]];
}

- (void) test_AWSCognitoIdentityProviderConfirmSignUpRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderConfirmSignUpRequest class]];
}

- (void) test_AWSCognitoIdentityProviderConfirmSignUpResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderConfirmSignUpResponse class]];
}

- (void) test_AWSCognitoIdentityProviderContextDataType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderContextDataType class]];
}

- (void) test_AWSCognitoIdentityProviderCreateGroupRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateGroupRequest class]];
}

- (void) test_AWSCognitoIdentityProviderCreateGroupResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateGroupResponse class]];
}

- (void) test_AWSCognitoIdentityProviderCreateIdentityProviderRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateIdentityProviderRequest class]];
}

- (void) test_AWSCognitoIdentityProviderCreateIdentityProviderResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateIdentityProviderResponse class]];
}

- (void) test_AWSCognitoIdentityProviderCreateResourceServerRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateResourceServerRequest class]];
}

- (void) test_AWSCognitoIdentityProviderCreateResourceServerResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateResourceServerResponse class]];
}

- (void) test_AWSCognitoIdentityProviderCreateUserImportJobRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateUserImportJobRequest class]];
}

- (void) test_AWSCognitoIdentityProviderCreateUserImportJobResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateUserImportJobResponse class]];
}

- (void) test_AWSCognitoIdentityProviderCreateUserPoolClientRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateUserPoolClientRequest class]];
}

- (void) test_AWSCognitoIdentityProviderCreateUserPoolClientResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateUserPoolClientResponse class]];
}

- (void) test_AWSCognitoIdentityProviderCreateUserPoolDomainRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateUserPoolDomainRequest class]];
}

- (void) test_AWSCognitoIdentityProviderCreateUserPoolDomainResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateUserPoolDomainResponse class]];
}

- (void) test_AWSCognitoIdentityProviderCreateUserPoolRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateUserPoolRequest class]];
}

- (void) test_AWSCognitoIdentityProviderCreateUserPoolResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCreateUserPoolResponse class]];
}

- (void) test_AWSCognitoIdentityProviderCustomDomainConfigType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCustomDomainConfigType class]];
}

- (void) test_AWSCognitoIdentityProviderCustomEmailLambdaVersionConfigType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCustomEmailLambdaVersionConfigType class]];
}

- (void) test_AWSCognitoIdentityProviderCustomSMSLambdaVersionConfigType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderCustomSMSLambdaVersionConfigType class]];
}

- (void) test_AWSCognitoIdentityProviderDeleteGroupRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeleteGroupRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDeleteIdentityProviderRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeleteIdentityProviderRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDeleteResourceServerRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeleteResourceServerRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDeleteUserAttributesRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeleteUserAttributesRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDeleteUserAttributesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeleteUserAttributesResponse class]];
}

- (void) test_AWSCognitoIdentityProviderDeleteUserPoolClientRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeleteUserPoolClientRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDeleteUserPoolDomainRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeleteUserPoolDomainRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDeleteUserPoolDomainResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeleteUserPoolDomainResponse class]];
}

- (void) test_AWSCognitoIdentityProviderDeleteUserPoolRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeleteUserPoolRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDeleteUserRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeleteUserRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeIdentityProviderRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeIdentityProviderRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeIdentityProviderResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeIdentityProviderResponse class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeResourceServerRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeResourceServerRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeResourceServerResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeResourceServerResponse class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeRiskConfigurationRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeRiskConfigurationRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeRiskConfigurationResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeRiskConfigurationResponse class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeUserImportJobRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeUserImportJobRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeUserImportJobResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeUserImportJobResponse class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeUserPoolClientRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeUserPoolClientRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeUserPoolClientResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeUserPoolClientResponse class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeUserPoolDomainRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeUserPoolDomainRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeUserPoolDomainResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeUserPoolDomainResponse class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeUserPoolRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeUserPoolRequest class]];
}

- (void) test_AWSCognitoIdentityProviderDescribeUserPoolResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDescribeUserPoolResponse class]];
}

- (void) test_AWSCognitoIdentityProviderDeviceConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeviceConfigurationType class]];
}

- (void) test_AWSCognitoIdentityProviderDeviceSecretVerifierConfigType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeviceSecretVerifierConfigType class]];
}

- (void) test_AWSCognitoIdentityProviderDeviceType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDeviceType class]];
}

- (void) test_AWSCognitoIdentityProviderDomainDescriptionType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderDomainDescriptionType class]];
}

- (void) test_AWSCognitoIdentityProviderEmailConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderEmailConfigurationType class]];
}

- (void) test_AWSCognitoIdentityProviderEventContextDataType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderEventContextDataType class]];
}

- (void) test_AWSCognitoIdentityProviderEventFeedbackType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderEventFeedbackType class]];
}

- (void) test_AWSCognitoIdentityProviderEventRiskType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderEventRiskType class]];
}

- (void) test_AWSCognitoIdentityProviderForgetDeviceRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderForgetDeviceRequest class]];
}

- (void) test_AWSCognitoIdentityProviderForgotPasswordRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderForgotPasswordRequest class]];
}

- (void) test_AWSCognitoIdentityProviderForgotPasswordResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderForgotPasswordResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGetCSVHeaderRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetCSVHeaderRequest class]];
}

- (void) test_AWSCognitoIdentityProviderGetCSVHeaderResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetCSVHeaderResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGetDeviceRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetDeviceRequest class]];
}

- (void) test_AWSCognitoIdentityProviderGetDeviceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetDeviceResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGetGroupRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetGroupRequest class]];
}

- (void) test_AWSCognitoIdentityProviderGetGroupResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetGroupResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest class]];
}

- (void) test_AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGetSigningCertificateRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetSigningCertificateRequest class]];
}

- (void) test_AWSCognitoIdentityProviderGetSigningCertificateResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetSigningCertificateResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGetUICustomizationRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetUICustomizationRequest class]];
}

- (void) test_AWSCognitoIdentityProviderGetUICustomizationResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetUICustomizationResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest class]];
}

- (void) test_AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest class]];
}

- (void) test_AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGetUserRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetUserRequest class]];
}

- (void) test_AWSCognitoIdentityProviderGetUserResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGetUserResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGlobalSignOutRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGlobalSignOutRequest class]];
}

- (void) test_AWSCognitoIdentityProviderGlobalSignOutResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGlobalSignOutResponse class]];
}

- (void) test_AWSCognitoIdentityProviderGroupType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderGroupType class]];
}

- (void) test_AWSCognitoIdentityProviderHttpHeader {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderHttpHeader class]];
}

- (void) test_AWSCognitoIdentityProviderIdentityProviderType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderIdentityProviderType class]];
}

- (void) test_AWSCognitoIdentityProviderInitiateAuthRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderInitiateAuthRequest class]];
}

- (void) test_AWSCognitoIdentityProviderInitiateAuthResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderInitiateAuthResponse class]];
}

- (void) test_AWSCognitoIdentityProviderLambdaConfigType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderLambdaConfigType class]];
}

- (void) test_AWSCognitoIdentityProviderListDevicesRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListDevicesRequest class]];
}

- (void) test_AWSCognitoIdentityProviderListDevicesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListDevicesResponse class]];
}

- (void) test_AWSCognitoIdentityProviderListGroupsRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListGroupsRequest class]];
}

- (void) test_AWSCognitoIdentityProviderListGroupsResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListGroupsResponse class]];
}

- (void) test_AWSCognitoIdentityProviderListIdentityProvidersRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListIdentityProvidersRequest class]];
}

- (void) test_AWSCognitoIdentityProviderListIdentityProvidersResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListIdentityProvidersResponse class]];
}

- (void) test_AWSCognitoIdentityProviderListResourceServersRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListResourceServersRequest class]];
}

- (void) test_AWSCognitoIdentityProviderListResourceServersResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListResourceServersResponse class]];
}

- (void) test_AWSCognitoIdentityProviderListTagsForResourceRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListTagsForResourceRequest class]];
}

- (void) test_AWSCognitoIdentityProviderListTagsForResourceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListTagsForResourceResponse class]];
}

- (void) test_AWSCognitoIdentityProviderListUserImportJobsRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListUserImportJobsRequest class]];
}

- (void) test_AWSCognitoIdentityProviderListUserImportJobsResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListUserImportJobsResponse class]];
}

- (void) test_AWSCognitoIdentityProviderListUserPoolClientsRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListUserPoolClientsRequest class]];
}

- (void) test_AWSCognitoIdentityProviderListUserPoolClientsResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListUserPoolClientsResponse class]];
}

- (void) test_AWSCognitoIdentityProviderListUserPoolsRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListUserPoolsRequest class]];
}

- (void) test_AWSCognitoIdentityProviderListUserPoolsResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListUserPoolsResponse class]];
}

- (void) test_AWSCognitoIdentityProviderListUsersInGroupRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListUsersInGroupRequest class]];
}

- (void) test_AWSCognitoIdentityProviderListUsersInGroupResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListUsersInGroupResponse class]];
}

- (void) test_AWSCognitoIdentityProviderListUsersRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListUsersRequest class]];
}

- (void) test_AWSCognitoIdentityProviderListUsersResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderListUsersResponse class]];
}

- (void) test_AWSCognitoIdentityProviderMFAOptionType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderMFAOptionType class]];
}

- (void) test_AWSCognitoIdentityProviderMessageTemplateType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderMessageTemplateType class]];
}

- (void) test_AWSCognitoIdentityProviderLatestDeviceMetadataType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderLatestDeviceMetadataType class]];
}

- (void) test_AWSCognitoIdentityProviderNotifyConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderNotifyConfigurationType class]];
}

- (void) test_AWSCognitoIdentityProviderNotifyEmailType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderNotifyEmailType class]];
}

- (void) test_AWSCognitoIdentityProviderNumberAttributeConstraintsType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderNumberAttributeConstraintsType class]];
}

- (void) test_AWSCognitoIdentityProviderPasswordPolicyType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderPasswordPolicyType class]];
}

- (void) test_AWSCognitoIdentityProviderProviderDescription {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderProviderDescription class]];
}

- (void) test_AWSCognitoIdentityProviderProviderUserIdentifierType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderProviderUserIdentifierType class]];
}

- (void) test_AWSCognitoIdentityProviderRecoveryOptionType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderRecoveryOptionType class]];
}

- (void) test_AWSCognitoIdentityProviderResendConfirmationCodeRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderResendConfirmationCodeRequest class]];
}

- (void) test_AWSCognitoIdentityProviderResendConfirmationCodeResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderResendConfirmationCodeResponse class]];
}

- (void) test_AWSCognitoIdentityProviderResourceServerScopeType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderResourceServerScopeType class]];
}

- (void) test_AWSCognitoIdentityProviderResourceServerType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderResourceServerType class]];
}

- (void) test_AWSCognitoIdentityProviderRespondToAuthChallengeRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderRespondToAuthChallengeRequest class]];
}

- (void) test_AWSCognitoIdentityProviderRespondToAuthChallengeResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderRespondToAuthChallengeResponse class]];
}

- (void) test_AWSCognitoIdentityProviderRevokeTokenRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderRevokeTokenRequest class]];
}

- (void) test_AWSCognitoIdentityProviderRevokeTokenResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderRevokeTokenResponse class]];
}

- (void) test_AWSCognitoIdentityProviderRiskConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderRiskConfigurationType class]];
}

- (void) test_AWSCognitoIdentityProviderRiskExceptionConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderRiskExceptionConfigurationType class]];
}

- (void) test_AWSCognitoIdentityProviderSMSMfaSettingsType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSMSMfaSettingsType class]];
}

- (void) test_AWSCognitoIdentityProviderSchemaAttributeType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSchemaAttributeType class]];
}

- (void) test_AWSCognitoIdentityProviderSetRiskConfigurationRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSetRiskConfigurationRequest class]];
}

- (void) test_AWSCognitoIdentityProviderSetRiskConfigurationResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSetRiskConfigurationResponse class]];
}

- (void) test_AWSCognitoIdentityProviderSetUICustomizationRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSetUICustomizationRequest class]];
}

- (void) test_AWSCognitoIdentityProviderSetUICustomizationResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSetUICustomizationResponse class]];
}

- (void) test_AWSCognitoIdentityProviderSetUserMFAPreferenceRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSetUserMFAPreferenceRequest class]];
}

- (void) test_AWSCognitoIdentityProviderSetUserMFAPreferenceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSetUserMFAPreferenceResponse class]];
}

- (void) test_AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest class]];
}

- (void) test_AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse class]];
}

- (void) test_AWSCognitoIdentityProviderSetUserSettingsRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSetUserSettingsRequest class]];
}

- (void) test_AWSCognitoIdentityProviderSetUserSettingsResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSetUserSettingsResponse class]];
}

- (void) test_AWSCognitoIdentityProviderSignUpRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSignUpRequest class]];
}

- (void) test_AWSCognitoIdentityProviderSignUpResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSignUpResponse class]];
}

- (void) test_AWSCognitoIdentityProviderSmsConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSmsConfigurationType class]];
}

- (void) test_AWSCognitoIdentityProviderSmsMfaConfigType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSmsMfaConfigType class]];
}

- (void) test_AWSCognitoIdentityProviderSoftwareTokenMfaConfigType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSoftwareTokenMfaConfigType class]];
}

- (void) test_AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType class]];
}

- (void) test_AWSCognitoIdentityProviderStartUserImportJobRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderStartUserImportJobRequest class]];
}

- (void) test_AWSCognitoIdentityProviderStartUserImportJobResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderStartUserImportJobResponse class]];
}

- (void) test_AWSCognitoIdentityProviderStopUserImportJobRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderStopUserImportJobRequest class]];
}

- (void) test_AWSCognitoIdentityProviderStopUserImportJobResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderStopUserImportJobResponse class]];
}

- (void) test_AWSCognitoIdentityProviderStringAttributeConstraintsType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderStringAttributeConstraintsType class]];
}

- (void) test_AWSCognitoIdentityProviderTagResourceRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderTagResourceRequest class]];
}

- (void) test_AWSCognitoIdentityProviderTagResourceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderTagResourceResponse class]];
}

- (void) test_AWSCognitoIdentityProviderTokenValidityUnitsType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderTokenValidityUnitsType class]];
}

- (void) test_AWSCognitoIdentityProviderUICustomizationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUICustomizationType class]];
}

- (void) test_AWSCognitoIdentityProviderUntagResourceRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUntagResourceRequest class]];
}

- (void) test_AWSCognitoIdentityProviderUntagResourceResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUntagResourceResponse class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateDeviceStatusRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateDeviceStatusRequest class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateDeviceStatusResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateDeviceStatusResponse class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateGroupRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateGroupRequest class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateGroupResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateGroupResponse class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateIdentityProviderRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateIdentityProviderRequest class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateIdentityProviderResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateIdentityProviderResponse class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateResourceServerRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateResourceServerRequest class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateResourceServerResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateResourceServerResponse class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateUserAttributesRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateUserAttributesRequest class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateUserAttributesResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateUserAttributesResponse class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateUserPoolClientRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateUserPoolClientRequest class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateUserPoolClientResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateUserPoolClientResponse class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateUserPoolDomainRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateUserPoolDomainRequest class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateUserPoolDomainResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateUserPoolDomainResponse class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateUserPoolRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateUserPoolRequest class]];
}

- (void) test_AWSCognitoIdentityProviderUpdateUserPoolResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUpdateUserPoolResponse class]];
}

- (void) test_AWSCognitoIdentityProviderUserContextDataType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUserContextDataType class]];
}

- (void) test_AWSCognitoIdentityProviderUserImportJobType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUserImportJobType class]];
}

- (void) test_AWSCognitoIdentityProviderUserPoolAddOnsType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUserPoolAddOnsType class]];
}

- (void) test_AWSCognitoIdentityProviderUserPoolClientDescription {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUserPoolClientDescription class]];
}

- (void) test_AWSCognitoIdentityProviderUserPoolClientType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUserPoolClientType class]];
}

- (void) test_AWSCognitoIdentityProviderUserPoolDescriptionType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUserPoolDescriptionType class]];
}

- (void) test_AWSCognitoIdentityProviderUserPoolPolicyType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUserPoolPolicyType class]];
}

- (void) test_AWSCognitoIdentityProviderUserPoolType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUserPoolType class]];
}

- (void) test_AWSCognitoIdentityProviderUserType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUserType class]];
}

- (void) test_AWSCognitoIdentityProviderUsernameConfigurationType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderUsernameConfigurationType class]];
}

- (void) test_AWSCognitoIdentityProviderVerificationMessageTemplateType {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderVerificationMessageTemplateType class]];
}

- (void) test_AWSCognitoIdentityProviderVerifySoftwareTokenRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderVerifySoftwareTokenRequest class]];
}

- (void) test_AWSCognitoIdentityProviderVerifySoftwareTokenResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderVerifySoftwareTokenResponse class]];
}

- (void) test_AWSCognitoIdentityProviderVerifyUserAttributeRequest {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderVerifyUserAttributeRequest class]];
}

- (void) test_AWSCognitoIdentityProviderVerifyUserAttributeResponse {
    [self validateSecureCodingForClass:[AWSCognitoIdentityProviderVerifyUserAttributeResponse class]];
}

@end

