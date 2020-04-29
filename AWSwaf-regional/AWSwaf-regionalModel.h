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
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSwaf-regionalErrorDomain;

typedef NS_ENUM(NSInteger, AWSwaf-regionalErrorType) {
    AWSwaf-regionalErrorUnknown,
    AWSwaf-regionalErrorWAFBadRequest,
    AWSwaf-regionalErrorWAFDisallowedName,
    AWSwaf-regionalErrorWAFEntityMigration,
    AWSwaf-regionalErrorWAFInternalError,
    AWSwaf-regionalErrorWAFInvalidAccount,
    AWSwaf-regionalErrorWAFInvalidOperation,
    AWSwaf-regionalErrorWAFInvalidParameter,
    AWSwaf-regionalErrorWAFInvalidPermissionPolicy,
    AWSwaf-regionalErrorWAFInvalidRegexPattern,
    AWSwaf-regionalErrorWAFLimitsExceeded,
    AWSwaf-regionalErrorWAFNonEmptyEntity,
    AWSwaf-regionalErrorWAFNonexistentContainer,
    AWSwaf-regionalErrorWAFNonexistentItem,
    AWSwaf-regionalErrorWAFReferencedItem,
    AWSwaf-regionalErrorWAFServiceLinkedRoleError,
    AWSwaf-regionalErrorWAFStaleData,
    AWSwaf-regionalErrorWAFSubscriptionNotFound,
    AWSwaf-regionalErrorWAFTagOperation,
    AWSwaf-regionalErrorWAFTagOperationInternalError,
    AWSwaf-regionalErrorWAFUnavailableEntity,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalChangeAction) {
    AWSwaf-regionalChangeActionUnknown,
    AWSwaf-regionalChangeActionInsert,
    AWSwaf-regionalChangeActionDelete,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalChangeTokenStatus) {
    AWSwaf-regionalChangeTokenStatusUnknown,
    AWSwaf-regionalChangeTokenStatusProvisioned,
    AWSwaf-regionalChangeTokenStatusPending,
    AWSwaf-regionalChangeTokenStatusInsync,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalComparisonOperator) {
    AWSwaf-regionalComparisonOperatorUnknown,
    AWSwaf-regionalComparisonOperatorEQ,
    AWSwaf-regionalComparisonOperatorNE,
    AWSwaf-regionalComparisonOperatorLE,
    AWSwaf-regionalComparisonOperatorLT,
    AWSwaf-regionalComparisonOperatorGE,
    AWSwaf-regionalComparisonOperatorGT,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalGeoMatchConstraintType) {
    AWSwaf-regionalGeoMatchConstraintTypeUnknown,
    AWSwaf-regionalGeoMatchConstraintTypeCountry,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalGeoMatchConstraintValue) {
    AWSwaf-regionalGeoMatchConstraintValueUnknown,
    AWSwaf-regionalGeoMatchConstraintValueAf,
    AWSwaf-regionalGeoMatchConstraintValueAx,
    AWSwaf-regionalGeoMatchConstraintValueAl,
    AWSwaf-regionalGeoMatchConstraintValueDz,
    AWSwaf-regionalGeoMatchConstraintValueAs,
    AWSwaf-regionalGeoMatchConstraintValueAd,
    AWSwaf-regionalGeoMatchConstraintValueAo,
    AWSwaf-regionalGeoMatchConstraintValueAi,
    AWSwaf-regionalGeoMatchConstraintValueAq,
    AWSwaf-regionalGeoMatchConstraintValueAg,
    AWSwaf-regionalGeoMatchConstraintValueAr,
    AWSwaf-regionalGeoMatchConstraintValueAm,
    AWSwaf-regionalGeoMatchConstraintValueAw,
    AWSwaf-regionalGeoMatchConstraintValueAu,
    AWSwaf-regionalGeoMatchConstraintValueAt,
    AWSwaf-regionalGeoMatchConstraintValueAz,
    AWSwaf-regionalGeoMatchConstraintValueBs,
    AWSwaf-regionalGeoMatchConstraintValueBh,
    AWSwaf-regionalGeoMatchConstraintValueBd,
    AWSwaf-regionalGeoMatchConstraintValueBb,
    AWSwaf-regionalGeoMatchConstraintValueBy,
    AWSwaf-regionalGeoMatchConstraintValueBe,
    AWSwaf-regionalGeoMatchConstraintValueBz,
    AWSwaf-regionalGeoMatchConstraintValueBj,
    AWSwaf-regionalGeoMatchConstraintValueBm,
    AWSwaf-regionalGeoMatchConstraintValueBt,
    AWSwaf-regionalGeoMatchConstraintValueBo,
    AWSwaf-regionalGeoMatchConstraintValueBq,
    AWSwaf-regionalGeoMatchConstraintValueBa,
    AWSwaf-regionalGeoMatchConstraintValueBw,
    AWSwaf-regionalGeoMatchConstraintValueBv,
    AWSwaf-regionalGeoMatchConstraintValueBr,
    AWSwaf-regionalGeoMatchConstraintValueIo,
    AWSwaf-regionalGeoMatchConstraintValueBn,
    AWSwaf-regionalGeoMatchConstraintValueBg,
    AWSwaf-regionalGeoMatchConstraintValueBf,
    AWSwaf-regionalGeoMatchConstraintValueBi,
    AWSwaf-regionalGeoMatchConstraintValueKh,
    AWSwaf-regionalGeoMatchConstraintValueCm,
    AWSwaf-regionalGeoMatchConstraintValueCa,
    AWSwaf-regionalGeoMatchConstraintValueCv,
    AWSwaf-regionalGeoMatchConstraintValueKy,
    AWSwaf-regionalGeoMatchConstraintValueCf,
    AWSwaf-regionalGeoMatchConstraintValueTd,
    AWSwaf-regionalGeoMatchConstraintValueCl,
    AWSwaf-regionalGeoMatchConstraintValueCn,
    AWSwaf-regionalGeoMatchConstraintValueCx,
    AWSwaf-regionalGeoMatchConstraintValueCc,
    AWSwaf-regionalGeoMatchConstraintValueCo,
    AWSwaf-regionalGeoMatchConstraintValueKm,
    AWSwaf-regionalGeoMatchConstraintValueCg,
    AWSwaf-regionalGeoMatchConstraintValueCd,
    AWSwaf-regionalGeoMatchConstraintValueCk,
    AWSwaf-regionalGeoMatchConstraintValueCr,
    AWSwaf-regionalGeoMatchConstraintValueCi,
    AWSwaf-regionalGeoMatchConstraintValueHr,
    AWSwaf-regionalGeoMatchConstraintValueCu,
    AWSwaf-regionalGeoMatchConstraintValueCw,
    AWSwaf-regionalGeoMatchConstraintValueCy,
    AWSwaf-regionalGeoMatchConstraintValueCz,
    AWSwaf-regionalGeoMatchConstraintValueDk,
    AWSwaf-regionalGeoMatchConstraintValueDj,
    AWSwaf-regionalGeoMatchConstraintValueDm,
    AWSwaf-regionalGeoMatchConstraintValueDo,
    AWSwaf-regionalGeoMatchConstraintValueEc,
    AWSwaf-regionalGeoMatchConstraintValueEg,
    AWSwaf-regionalGeoMatchConstraintValueSv,
    AWSwaf-regionalGeoMatchConstraintValueGq,
    AWSwaf-regionalGeoMatchConstraintValueEr,
    AWSwaf-regionalGeoMatchConstraintValueEe,
    AWSwaf-regionalGeoMatchConstraintValueEt,
    AWSwaf-regionalGeoMatchConstraintValueFk,
    AWSwaf-regionalGeoMatchConstraintValueFo,
    AWSwaf-regionalGeoMatchConstraintValueFj,
    AWSwaf-regionalGeoMatchConstraintValueFi,
    AWSwaf-regionalGeoMatchConstraintValueFr,
    AWSwaf-regionalGeoMatchConstraintValueGf,
    AWSwaf-regionalGeoMatchConstraintValuePf,
    AWSwaf-regionalGeoMatchConstraintValueTf,
    AWSwaf-regionalGeoMatchConstraintValueGa,
    AWSwaf-regionalGeoMatchConstraintValueGm,
    AWSwaf-regionalGeoMatchConstraintValueGE,
    AWSwaf-regionalGeoMatchConstraintValueDe,
    AWSwaf-regionalGeoMatchConstraintValueGh,
    AWSwaf-regionalGeoMatchConstraintValueGi,
    AWSwaf-regionalGeoMatchConstraintValueGr,
    AWSwaf-regionalGeoMatchConstraintValueGl,
    AWSwaf-regionalGeoMatchConstraintValueGd,
    AWSwaf-regionalGeoMatchConstraintValueGp,
    AWSwaf-regionalGeoMatchConstraintValueGu,
    AWSwaf-regionalGeoMatchConstraintValueGT,
    AWSwaf-regionalGeoMatchConstraintValueGg,
    AWSwaf-regionalGeoMatchConstraintValueGn,
    AWSwaf-regionalGeoMatchConstraintValueGw,
    AWSwaf-regionalGeoMatchConstraintValueGy,
    AWSwaf-regionalGeoMatchConstraintValueHt,
    AWSwaf-regionalGeoMatchConstraintValueHm,
    AWSwaf-regionalGeoMatchConstraintValueVa,
    AWSwaf-regionalGeoMatchConstraintValueHn,
    AWSwaf-regionalGeoMatchConstraintValueHk,
    AWSwaf-regionalGeoMatchConstraintValueHu,
    AWSwaf-regionalGeoMatchConstraintValueIs,
    AWSwaf-regionalGeoMatchConstraintValueIN,
    AWSwaf-regionalGeoMatchConstraintValueId,
    AWSwaf-regionalGeoMatchConstraintValueIr,
    AWSwaf-regionalGeoMatchConstraintValueIq,
    AWSwaf-regionalGeoMatchConstraintValueIe,
    AWSwaf-regionalGeoMatchConstraintValueIm,
    AWSwaf-regionalGeoMatchConstraintValueIl,
    AWSwaf-regionalGeoMatchConstraintValueIt,
    AWSwaf-regionalGeoMatchConstraintValueJm,
    AWSwaf-regionalGeoMatchConstraintValueJp,
    AWSwaf-regionalGeoMatchConstraintValueJe,
    AWSwaf-regionalGeoMatchConstraintValueJo,
    AWSwaf-regionalGeoMatchConstraintValueKz,
    AWSwaf-regionalGeoMatchConstraintValueKe,
    AWSwaf-regionalGeoMatchConstraintValueKi,
    AWSwaf-regionalGeoMatchConstraintValueKp,
    AWSwaf-regionalGeoMatchConstraintValueKr,
    AWSwaf-regionalGeoMatchConstraintValueKw,
    AWSwaf-regionalGeoMatchConstraintValueKg,
    AWSwaf-regionalGeoMatchConstraintValueLa,
    AWSwaf-regionalGeoMatchConstraintValueLv,
    AWSwaf-regionalGeoMatchConstraintValueLb,
    AWSwaf-regionalGeoMatchConstraintValueLs,
    AWSwaf-regionalGeoMatchConstraintValueLr,
    AWSwaf-regionalGeoMatchConstraintValueLy,
    AWSwaf-regionalGeoMatchConstraintValueLi,
    AWSwaf-regionalGeoMatchConstraintValueLT,
    AWSwaf-regionalGeoMatchConstraintValueLu,
    AWSwaf-regionalGeoMatchConstraintValueMo,
    AWSwaf-regionalGeoMatchConstraintValueMk,
    AWSwaf-regionalGeoMatchConstraintValueMg,
    AWSwaf-regionalGeoMatchConstraintValueMw,
    AWSwaf-regionalGeoMatchConstraintValueMy,
    AWSwaf-regionalGeoMatchConstraintValueMv,
    AWSwaf-regionalGeoMatchConstraintValueMl,
    AWSwaf-regionalGeoMatchConstraintValueMt,
    AWSwaf-regionalGeoMatchConstraintValueMh,
    AWSwaf-regionalGeoMatchConstraintValueMq,
    AWSwaf-regionalGeoMatchConstraintValueMr,
    AWSwaf-regionalGeoMatchConstraintValueMu,
    AWSwaf-regionalGeoMatchConstraintValueYt,
    AWSwaf-regionalGeoMatchConstraintValueMx,
    AWSwaf-regionalGeoMatchConstraintValueFm,
    AWSwaf-regionalGeoMatchConstraintValueMd,
    AWSwaf-regionalGeoMatchConstraintValueMc,
    AWSwaf-regionalGeoMatchConstraintValueMn,
    AWSwaf-regionalGeoMatchConstraintValueMe,
    AWSwaf-regionalGeoMatchConstraintValueMs,
    AWSwaf-regionalGeoMatchConstraintValueMa,
    AWSwaf-regionalGeoMatchConstraintValueMz,
    AWSwaf-regionalGeoMatchConstraintValueMm,
    AWSwaf-regionalGeoMatchConstraintValueNa,
    AWSwaf-regionalGeoMatchConstraintValueNr,
    AWSwaf-regionalGeoMatchConstraintValueNp,
    AWSwaf-regionalGeoMatchConstraintValueNl,
    AWSwaf-regionalGeoMatchConstraintValueNc,
    AWSwaf-regionalGeoMatchConstraintValueNz,
    AWSwaf-regionalGeoMatchConstraintValueNi,
    AWSwaf-regionalGeoMatchConstraintValueNE,
    AWSwaf-regionalGeoMatchConstraintValueNg,
    AWSwaf-regionalGeoMatchConstraintValueNu,
    AWSwaf-regionalGeoMatchConstraintValueNf,
    AWSwaf-regionalGeoMatchConstraintValueMp,
    AWSwaf-regionalGeoMatchConstraintValueNo,
    AWSwaf-regionalGeoMatchConstraintValueOm,
    AWSwaf-regionalGeoMatchConstraintValuePk,
    AWSwaf-regionalGeoMatchConstraintValuePw,
    AWSwaf-regionalGeoMatchConstraintValuePs,
    AWSwaf-regionalGeoMatchConstraintValuePa,
    AWSwaf-regionalGeoMatchConstraintValuePg,
    AWSwaf-regionalGeoMatchConstraintValuePy,
    AWSwaf-regionalGeoMatchConstraintValuePe,
    AWSwaf-regionalGeoMatchConstraintValuePh,
    AWSwaf-regionalGeoMatchConstraintValuePn,
    AWSwaf-regionalGeoMatchConstraintValuePl,
    AWSwaf-regionalGeoMatchConstraintValuePt,
    AWSwaf-regionalGeoMatchConstraintValuePr,
    AWSwaf-regionalGeoMatchConstraintValueQa,
    AWSwaf-regionalGeoMatchConstraintValueRe,
    AWSwaf-regionalGeoMatchConstraintValueRo,
    AWSwaf-regionalGeoMatchConstraintValueRu,
    AWSwaf-regionalGeoMatchConstraintValueRw,
    AWSwaf-regionalGeoMatchConstraintValueBl,
    AWSwaf-regionalGeoMatchConstraintValueSh,
    AWSwaf-regionalGeoMatchConstraintValueKn,
    AWSwaf-regionalGeoMatchConstraintValueLc,
    AWSwaf-regionalGeoMatchConstraintValueMf,
    AWSwaf-regionalGeoMatchConstraintValuePm,
    AWSwaf-regionalGeoMatchConstraintValueVc,
    AWSwaf-regionalGeoMatchConstraintValueWs,
    AWSwaf-regionalGeoMatchConstraintValueSm,
    AWSwaf-regionalGeoMatchConstraintValueSt,
    AWSwaf-regionalGeoMatchConstraintValueSa,
    AWSwaf-regionalGeoMatchConstraintValueSn,
    AWSwaf-regionalGeoMatchConstraintValueRs,
    AWSwaf-regionalGeoMatchConstraintValueSc,
    AWSwaf-regionalGeoMatchConstraintValueSl,
    AWSwaf-regionalGeoMatchConstraintValueSg,
    AWSwaf-regionalGeoMatchConstraintValueSx,
    AWSwaf-regionalGeoMatchConstraintValueSk,
    AWSwaf-regionalGeoMatchConstraintValueSi,
    AWSwaf-regionalGeoMatchConstraintValueSb,
    AWSwaf-regionalGeoMatchConstraintValueSo,
    AWSwaf-regionalGeoMatchConstraintValueZa,
    AWSwaf-regionalGeoMatchConstraintValueGs,
    AWSwaf-regionalGeoMatchConstraintValueSs,
    AWSwaf-regionalGeoMatchConstraintValueEs,
    AWSwaf-regionalGeoMatchConstraintValueLk,
    AWSwaf-regionalGeoMatchConstraintValueSd,
    AWSwaf-regionalGeoMatchConstraintValueSr,
    AWSwaf-regionalGeoMatchConstraintValueSj,
    AWSwaf-regionalGeoMatchConstraintValueSz,
    AWSwaf-regionalGeoMatchConstraintValueSe,
    AWSwaf-regionalGeoMatchConstraintValueCh,
    AWSwaf-regionalGeoMatchConstraintValueSy,
    AWSwaf-regionalGeoMatchConstraintValueTw,
    AWSwaf-regionalGeoMatchConstraintValueTj,
    AWSwaf-regionalGeoMatchConstraintValueTz,
    AWSwaf-regionalGeoMatchConstraintValueTh,
    AWSwaf-regionalGeoMatchConstraintValueTl,
    AWSwaf-regionalGeoMatchConstraintValueTg,
    AWSwaf-regionalGeoMatchConstraintValueTk,
    AWSwaf-regionalGeoMatchConstraintValueTo,
    AWSwaf-regionalGeoMatchConstraintValueTt,
    AWSwaf-regionalGeoMatchConstraintValueTn,
    AWSwaf-regionalGeoMatchConstraintValueTr,
    AWSwaf-regionalGeoMatchConstraintValueTm,
    AWSwaf-regionalGeoMatchConstraintValueTc,
    AWSwaf-regionalGeoMatchConstraintValueTv,
    AWSwaf-regionalGeoMatchConstraintValueUg,
    AWSwaf-regionalGeoMatchConstraintValueUa,
    AWSwaf-regionalGeoMatchConstraintValueAe,
    AWSwaf-regionalGeoMatchConstraintValueGb,
    AWSwaf-regionalGeoMatchConstraintValueUs,
    AWSwaf-regionalGeoMatchConstraintValueUm,
    AWSwaf-regionalGeoMatchConstraintValueUy,
    AWSwaf-regionalGeoMatchConstraintValueUz,
    AWSwaf-regionalGeoMatchConstraintValueVu,
    AWSwaf-regionalGeoMatchConstraintValueVe,
    AWSwaf-regionalGeoMatchConstraintValueVn,
    AWSwaf-regionalGeoMatchConstraintValueVg,
    AWSwaf-regionalGeoMatchConstraintValueVi,
    AWSwaf-regionalGeoMatchConstraintValueWf,
    AWSwaf-regionalGeoMatchConstraintValueEh,
    AWSwaf-regionalGeoMatchConstraintValueYe,
    AWSwaf-regionalGeoMatchConstraintValueZm,
    AWSwaf-regionalGeoMatchConstraintValueZw,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalIPSetDescriptorType) {
    AWSwaf-regionalIPSetDescriptorTypeUnknown,
    AWSwaf-regionalIPSetDescriptorTypeIpv4,
    AWSwaf-regionalIPSetDescriptorTypeIpv6,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalMatchFieldType) {
    AWSwaf-regionalMatchFieldTypeUnknown,
    AWSwaf-regionalMatchFieldTypeUri,
    AWSwaf-regionalMatchFieldTypeQueryString,
    AWSwaf-regionalMatchFieldTypeHeader,
    AWSwaf-regionalMatchFieldTypeMethod,
    AWSwaf-regionalMatchFieldTypeBody,
    AWSwaf-regionalMatchFieldTypeSingleQueryArg,
    AWSwaf-regionalMatchFieldTypeAllQueryArgs,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalMigrationErrorType) {
    AWSwaf-regionalMigrationErrorTypeUnknown,
    AWSwaf-regionalMigrationErrorTypeEntityNotSupported,
    AWSwaf-regionalMigrationErrorTypeEntityNotFound,
    AWSwaf-regionalMigrationErrorTypeS3BucketNoPermission,
    AWSwaf-regionalMigrationErrorTypeS3BucketNotAccessible,
    AWSwaf-regionalMigrationErrorTypeS3BucketNotFound,
    AWSwaf-regionalMigrationErrorTypeS3BucketInvalidRegion,
    AWSwaf-regionalMigrationErrorTypeS3InternalError,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalParameterExceptionField) {
    AWSwaf-regionalParameterExceptionFieldUnknown,
    AWSwaf-regionalParameterExceptionFieldChangeAction,
    AWSwaf-regionalParameterExceptionFieldWafAction,
    AWSwaf-regionalParameterExceptionFieldWafOverrideAction,
    AWSwaf-regionalParameterExceptionFieldPredicateType,
    AWSwaf-regionalParameterExceptionFieldIpsetType,
    AWSwaf-regionalParameterExceptionFieldByteMatchFieldType,
    AWSwaf-regionalParameterExceptionFieldSqlInjectionMatchFieldType,
    AWSwaf-regionalParameterExceptionFieldByteMatchTextTransformation,
    AWSwaf-regionalParameterExceptionFieldByteMatchPositionalConstraint,
    AWSwaf-regionalParameterExceptionFieldSizeConstraintComparisonOperator,
    AWSwaf-regionalParameterExceptionFieldGeoMatchLocationType,
    AWSwaf-regionalParameterExceptionFieldGeoMatchLocationValue,
    AWSwaf-regionalParameterExceptionFieldRateKey,
    AWSwaf-regionalParameterExceptionFieldRuleType,
    AWSwaf-regionalParameterExceptionFieldNextMarker,
    AWSwaf-regionalParameterExceptionFieldResourceArn,
    AWSwaf-regionalParameterExceptionFieldTags,
    AWSwaf-regionalParameterExceptionFieldTagKeys,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalParameterExceptionReason) {
    AWSwaf-regionalParameterExceptionReasonUnknown,
    AWSwaf-regionalParameterExceptionReasonInvalidOption,
    AWSwaf-regionalParameterExceptionReasonIllegalCombination,
    AWSwaf-regionalParameterExceptionReasonIllegalArgument,
    AWSwaf-regionalParameterExceptionReasonInvalidTagKey,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalPositionalConstraint) {
    AWSwaf-regionalPositionalConstraintUnknown,
    AWSwaf-regionalPositionalConstraintExactly,
    AWSwaf-regionalPositionalConstraintStartsWith,
    AWSwaf-regionalPositionalConstraintEndsWith,
    AWSwaf-regionalPositionalConstraintContains,
    AWSwaf-regionalPositionalConstraintContainsWord,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalPredicateType) {
    AWSwaf-regionalPredicateTypeUnknown,
    AWSwaf-regionalPredicateTypeIPMatch,
    AWSwaf-regionalPredicateTypeByteMatch,
    AWSwaf-regionalPredicateTypeSqlInjectionMatch,
    AWSwaf-regionalPredicateTypeGeoMatch,
    AWSwaf-regionalPredicateTypeSizeConstraint,
    AWSwaf-regionalPredicateTypeXssMatch,
    AWSwaf-regionalPredicateTypeRegexMatch,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalRateKey) {
    AWSwaf-regionalRateKeyUnknown,
    AWSwaf-regionalRateKeyIp,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalResourceType) {
    AWSwaf-regionalResourceTypeUnknown,
    AWSwaf-regionalResourceTypeApplicationLoadBalancer,
    AWSwaf-regionalResourceTypeApiGateway,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalTextTransformation) {
    AWSwaf-regionalTextTransformationUnknown,
    AWSwaf-regionalTextTransformationNone,
    AWSwaf-regionalTextTransformationCompressWhiteSpace,
    AWSwaf-regionalTextTransformationHtmlEntityDecode,
    AWSwaf-regionalTextTransformationLowercase,
    AWSwaf-regionalTextTransformationCmdLine,
    AWSwaf-regionalTextTransformationUrlDecode,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalWafActionType) {
    AWSwaf-regionalWafActionTypeUnknown,
    AWSwaf-regionalWafActionTypeBlock,
    AWSwaf-regionalWafActionTypeAllow,
    AWSwaf-regionalWafActionTypeCount,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalWafOverrideActionType) {
    AWSwaf-regionalWafOverrideActionTypeUnknown,
    AWSwaf-regionalWafOverrideActionTypeNone,
    AWSwaf-regionalWafOverrideActionTypeCount,
};

typedef NS_ENUM(NSInteger, AWSwaf-regionalWafRuleType) {
    AWSwaf-regionalWafRuleTypeUnknown,
    AWSwaf-regionalWafRuleTypeRegular,
    AWSwaf-regionalWafRuleTypeRateBased,
    AWSwaf-regionalWafRuleTypeGroup,
};

@class AWSwaf-regionalActivatedRule;
@class AWSwaf-regionalAssociateWebACLRequest;
@class AWSwaf-regionalAssociateWebACLResponse;
@class AWSwaf-regionalByteMatchSet;
@class AWSwaf-regionalByteMatchSetSummary;
@class AWSwaf-regionalByteMatchSetUpdate;
@class AWSwaf-regionalByteMatchTuple;
@class AWSwaf-regionalCreateByteMatchSetRequest;
@class AWSwaf-regionalCreateByteMatchSetResponse;
@class AWSwaf-regionalCreateGeoMatchSetRequest;
@class AWSwaf-regionalCreateGeoMatchSetResponse;
@class AWSwaf-regionalCreateIPSetRequest;
@class AWSwaf-regionalCreateIPSetResponse;
@class AWSwaf-regionalCreateRateBasedRuleRequest;
@class AWSwaf-regionalCreateRateBasedRuleResponse;
@class AWSwaf-regionalCreateRegexMatchSetRequest;
@class AWSwaf-regionalCreateRegexMatchSetResponse;
@class AWSwaf-regionalCreateRegexPatternSetRequest;
@class AWSwaf-regionalCreateRegexPatternSetResponse;
@class AWSwaf-regionalCreateRuleGroupRequest;
@class AWSwaf-regionalCreateRuleGroupResponse;
@class AWSwaf-regionalCreateRuleRequest;
@class AWSwaf-regionalCreateRuleResponse;
@class AWSwaf-regionalCreateSizeConstraintSetRequest;
@class AWSwaf-regionalCreateSizeConstraintSetResponse;
@class AWSwaf-regionalCreateSqlInjectionMatchSetRequest;
@class AWSwaf-regionalCreateSqlInjectionMatchSetResponse;
@class AWSwaf-regionalCreateWebACLMigrationStackRequest;
@class AWSwaf-regionalCreateWebACLMigrationStackResponse;
@class AWSwaf-regionalCreateWebACLRequest;
@class AWSwaf-regionalCreateWebACLResponse;
@class AWSwaf-regionalCreateXssMatchSetRequest;
@class AWSwaf-regionalCreateXssMatchSetResponse;
@class AWSwaf-regionalDeleteByteMatchSetRequest;
@class AWSwaf-regionalDeleteByteMatchSetResponse;
@class AWSwaf-regionalDeleteGeoMatchSetRequest;
@class AWSwaf-regionalDeleteGeoMatchSetResponse;
@class AWSwaf-regionalDeleteIPSetRequest;
@class AWSwaf-regionalDeleteIPSetResponse;
@class AWSwaf-regionalDeleteLoggingConfigurationRequest;
@class AWSwaf-regionalDeleteLoggingConfigurationResponse;
@class AWSwaf-regionalDeletePermissionPolicyRequest;
@class AWSwaf-regionalDeletePermissionPolicyResponse;
@class AWSwaf-regionalDeleteRateBasedRuleRequest;
@class AWSwaf-regionalDeleteRateBasedRuleResponse;
@class AWSwaf-regionalDeleteRegexMatchSetRequest;
@class AWSwaf-regionalDeleteRegexMatchSetResponse;
@class AWSwaf-regionalDeleteRegexPatternSetRequest;
@class AWSwaf-regionalDeleteRegexPatternSetResponse;
@class AWSwaf-regionalDeleteRuleGroupRequest;
@class AWSwaf-regionalDeleteRuleGroupResponse;
@class AWSwaf-regionalDeleteRuleRequest;
@class AWSwaf-regionalDeleteRuleResponse;
@class AWSwaf-regionalDeleteSizeConstraintSetRequest;
@class AWSwaf-regionalDeleteSizeConstraintSetResponse;
@class AWSwaf-regionalDeleteSqlInjectionMatchSetRequest;
@class AWSwaf-regionalDeleteSqlInjectionMatchSetResponse;
@class AWSwaf-regionalDeleteWebACLRequest;
@class AWSwaf-regionalDeleteWebACLResponse;
@class AWSwaf-regionalDeleteXssMatchSetRequest;
@class AWSwaf-regionalDeleteXssMatchSetResponse;
@class AWSwaf-regionalDisassociateWebACLRequest;
@class AWSwaf-regionalDisassociateWebACLResponse;
@class AWSwaf-regionalExcludedRule;
@class AWSwaf-regionalFieldToMatch;
@class AWSwaf-regionalGeoMatchConstraint;
@class AWSwaf-regionalGeoMatchSet;
@class AWSwaf-regionalGeoMatchSetSummary;
@class AWSwaf-regionalGeoMatchSetUpdate;
@class AWSwaf-regionalGetByteMatchSetRequest;
@class AWSwaf-regionalGetByteMatchSetResponse;
@class AWSwaf-regionalGetChangeTokenRequest;
@class AWSwaf-regionalGetChangeTokenResponse;
@class AWSwaf-regionalGetChangeTokenStatusRequest;
@class AWSwaf-regionalGetChangeTokenStatusResponse;
@class AWSwaf-regionalGetGeoMatchSetRequest;
@class AWSwaf-regionalGetGeoMatchSetResponse;
@class AWSwaf-regionalGetIPSetRequest;
@class AWSwaf-regionalGetIPSetResponse;
@class AWSwaf-regionalGetLoggingConfigurationRequest;
@class AWSwaf-regionalGetLoggingConfigurationResponse;
@class AWSwaf-regionalGetPermissionPolicyRequest;
@class AWSwaf-regionalGetPermissionPolicyResponse;
@class AWSwaf-regionalGetRateBasedRuleManagedKeysRequest;
@class AWSwaf-regionalGetRateBasedRuleManagedKeysResponse;
@class AWSwaf-regionalGetRateBasedRuleRequest;
@class AWSwaf-regionalGetRateBasedRuleResponse;
@class AWSwaf-regionalGetRegexMatchSetRequest;
@class AWSwaf-regionalGetRegexMatchSetResponse;
@class AWSwaf-regionalGetRegexPatternSetRequest;
@class AWSwaf-regionalGetRegexPatternSetResponse;
@class AWSwaf-regionalGetRuleGroupRequest;
@class AWSwaf-regionalGetRuleGroupResponse;
@class AWSwaf-regionalGetRuleRequest;
@class AWSwaf-regionalGetRuleResponse;
@class AWSwaf-regionalGetSampledRequestsRequest;
@class AWSwaf-regionalGetSampledRequestsResponse;
@class AWSwaf-regionalGetSizeConstraintSetRequest;
@class AWSwaf-regionalGetSizeConstraintSetResponse;
@class AWSwaf-regionalGetSqlInjectionMatchSetRequest;
@class AWSwaf-regionalGetSqlInjectionMatchSetResponse;
@class AWSwaf-regionalGetWebACLForResourceRequest;
@class AWSwaf-regionalGetWebACLForResourceResponse;
@class AWSwaf-regionalGetWebACLRequest;
@class AWSwaf-regionalGetWebACLResponse;
@class AWSwaf-regionalGetXssMatchSetRequest;
@class AWSwaf-regionalGetXssMatchSetResponse;
@class AWSwaf-regionalHTTPHeader;
@class AWSwaf-regionalHTTPRequest;
@class AWSwaf-regionalIPSet;
@class AWSwaf-regionalIPSetDescriptor;
@class AWSwaf-regionalIPSetSummary;
@class AWSwaf-regionalIPSetUpdate;
@class AWSwaf-regionalListActivatedRulesInRuleGroupRequest;
@class AWSwaf-regionalListActivatedRulesInRuleGroupResponse;
@class AWSwaf-regionalListByteMatchSetsRequest;
@class AWSwaf-regionalListByteMatchSetsResponse;
@class AWSwaf-regionalListGeoMatchSetsRequest;
@class AWSwaf-regionalListGeoMatchSetsResponse;
@class AWSwaf-regionalListIPSetsRequest;
@class AWSwaf-regionalListIPSetsResponse;
@class AWSwaf-regionalListLoggingConfigurationsRequest;
@class AWSwaf-regionalListLoggingConfigurationsResponse;
@class AWSwaf-regionalListRateBasedRulesRequest;
@class AWSwaf-regionalListRateBasedRulesResponse;
@class AWSwaf-regionalListRegexMatchSetsRequest;
@class AWSwaf-regionalListRegexMatchSetsResponse;
@class AWSwaf-regionalListRegexPatternSetsRequest;
@class AWSwaf-regionalListRegexPatternSetsResponse;
@class AWSwaf-regionalListResourcesForWebACLRequest;
@class AWSwaf-regionalListResourcesForWebACLResponse;
@class AWSwaf-regionalListRuleGroupsRequest;
@class AWSwaf-regionalListRuleGroupsResponse;
@class AWSwaf-regionalListRulesRequest;
@class AWSwaf-regionalListRulesResponse;
@class AWSwaf-regionalListSizeConstraintSetsRequest;
@class AWSwaf-regionalListSizeConstraintSetsResponse;
@class AWSwaf-regionalListSqlInjectionMatchSetsRequest;
@class AWSwaf-regionalListSqlInjectionMatchSetsResponse;
@class AWSwaf-regionalListSubscribedRuleGroupsRequest;
@class AWSwaf-regionalListSubscribedRuleGroupsResponse;
@class AWSwaf-regionalListTagsForResourceRequest;
@class AWSwaf-regionalListTagsForResourceResponse;
@class AWSwaf-regionalListWebACLsRequest;
@class AWSwaf-regionalListWebACLsResponse;
@class AWSwaf-regionalListXssMatchSetsRequest;
@class AWSwaf-regionalListXssMatchSetsResponse;
@class AWSwaf-regionalLoggingConfiguration;
@class AWSwaf-regionalPredicate;
@class AWSwaf-regionalPutLoggingConfigurationRequest;
@class AWSwaf-regionalPutLoggingConfigurationResponse;
@class AWSwaf-regionalPutPermissionPolicyRequest;
@class AWSwaf-regionalPutPermissionPolicyResponse;
@class AWSwaf-regionalRateBasedRule;
@class AWSwaf-regionalRegexMatchSet;
@class AWSwaf-regionalRegexMatchSetSummary;
@class AWSwaf-regionalRegexMatchSetUpdate;
@class AWSwaf-regionalRegexMatchTuple;
@class AWSwaf-regionalRegexPatternSet;
@class AWSwaf-regionalRegexPatternSetSummary;
@class AWSwaf-regionalRegexPatternSetUpdate;
@class AWSwaf-regionalRule;
@class AWSwaf-regionalRuleGroup;
@class AWSwaf-regionalRuleGroupSummary;
@class AWSwaf-regionalRuleGroupUpdate;
@class AWSwaf-regionalRuleSummary;
@class AWSwaf-regionalRuleUpdate;
@class AWSwaf-regionalSampledHTTPRequest;
@class AWSwaf-regionalSizeConstraint;
@class AWSwaf-regionalSizeConstraintSet;
@class AWSwaf-regionalSizeConstraintSetSummary;
@class AWSwaf-regionalSizeConstraintSetUpdate;
@class AWSwaf-regionalSqlInjectionMatchSet;
@class AWSwaf-regionalSqlInjectionMatchSetSummary;
@class AWSwaf-regionalSqlInjectionMatchSetUpdate;
@class AWSwaf-regionalSqlInjectionMatchTuple;
@class AWSwaf-regionalSubscribedRuleGroupSummary;
@class AWSwaf-regionalTag;
@class AWSwaf-regionalTagInfoForResource;
@class AWSwaf-regionalTagResourceRequest;
@class AWSwaf-regionalTagResourceResponse;
@class AWSwaf-regionalTimeWindow;
@class AWSwaf-regionalUntagResourceRequest;
@class AWSwaf-regionalUntagResourceResponse;
@class AWSwaf-regionalUpdateByteMatchSetRequest;
@class AWSwaf-regionalUpdateByteMatchSetResponse;
@class AWSwaf-regionalUpdateGeoMatchSetRequest;
@class AWSwaf-regionalUpdateGeoMatchSetResponse;
@class AWSwaf-regionalUpdateIPSetRequest;
@class AWSwaf-regionalUpdateIPSetResponse;
@class AWSwaf-regionalUpdateRateBasedRuleRequest;
@class AWSwaf-regionalUpdateRateBasedRuleResponse;
@class AWSwaf-regionalUpdateRegexMatchSetRequest;
@class AWSwaf-regionalUpdateRegexMatchSetResponse;
@class AWSwaf-regionalUpdateRegexPatternSetRequest;
@class AWSwaf-regionalUpdateRegexPatternSetResponse;
@class AWSwaf-regionalUpdateRuleGroupRequest;
@class AWSwaf-regionalUpdateRuleGroupResponse;
@class AWSwaf-regionalUpdateRuleRequest;
@class AWSwaf-regionalUpdateRuleResponse;
@class AWSwaf-regionalUpdateSizeConstraintSetRequest;
@class AWSwaf-regionalUpdateSizeConstraintSetResponse;
@class AWSwaf-regionalUpdateSqlInjectionMatchSetRequest;
@class AWSwaf-regionalUpdateSqlInjectionMatchSetResponse;
@class AWSwaf-regionalUpdateWebACLRequest;
@class AWSwaf-regionalUpdateWebACLResponse;
@class AWSwaf-regionalUpdateXssMatchSetRequest;
@class AWSwaf-regionalUpdateXssMatchSetResponse;
@class AWSwaf-regionalWafAction;
@class AWSwaf-regionalWafOverrideAction;
@class AWSwaf-regionalWebACL;
@class AWSwaf-regionalWebACLSummary;
@class AWSwaf-regionalWebACLUpdate;
@class AWSwaf-regionalXssMatchSet;
@class AWSwaf-regionalXssMatchSetSummary;
@class AWSwaf-regionalXssMatchSetUpdate;
@class AWSwaf-regionalXssMatchTuple;

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The <code>ActivatedRule</code> object in an <a>UpdateWebACL</a> request specifies a <code>Rule</code> that you want to insert or delete, the priority of the <code>Rule</code> in the <code>WebACL</code>, and the action that you want AWS WAF to take when a web request matches the <code>Rule</code> (<code>ALLOW</code>, <code>BLOCK</code>, or <code>COUNT</code>).</p><p>To specify whether to insert or delete a <code>Rule</code>, use the <code>Action</code> parameter in the <a>WebACLUpdate</a> data type.</p>
 Required parameters: [Priority, RuleId]
 */
@interface AWSwaf-regionalActivatedRule : AWSModel


/**
 <p>Specifies the action that CloudFront or AWS WAF takes when a web request matches the conditions in the <code>Rule</code>. Valid values for <code>Action</code> include the following:</p><ul><li><p><code>ALLOW</code>: CloudFront responds with the requested object.</p></li><li><p><code>BLOCK</code>: CloudFront responds with an HTTP 403 (Forbidden) status code.</p></li><li><p><code>COUNT</code>: AWS WAF increments a counter of requests that match the conditions in the rule and then continues to inspect the web request based on the remaining rules in the web ACL. </p></li></ul><p><code>ActivatedRule|OverrideAction</code> applies only when updating or adding a <code>RuleGroup</code> to a <code>WebACL</code>. In this case, you do not use <code>ActivatedRule|Action</code>. For all other update requests, <code>ActivatedRule|Action</code> is used instead of <code>ActivatedRule|OverrideAction</code>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalWafAction * _Nullable action;

/**
 <p>An array of rules to exclude from a rule group. This is applicable only when the <code>ActivatedRule</code> refers to a <code>RuleGroup</code>.</p><p>Sometimes it is necessary to troubleshoot rule groups that are blocking traffic unexpectedly (false positives). One troubleshooting technique is to identify the specific rule within the rule group that is blocking the legitimate traffic and then disable (exclude) that particular rule. You can exclude rules from both your own rule groups and AWS Marketplace rule groups that have been associated with a web ACL.</p><p>Specifying <code>ExcludedRules</code> does not remove those rules from the rule group. Rather, it changes the action for the rules to <code>COUNT</code>. Therefore, requests that match an <code>ExcludedRule</code> are counted but not blocked. The <code>RuleGroup</code> owner will receive COUNT metrics for each <code>ExcludedRule</code>.</p><p>If you want to exclude rules from a rule group that is already associated with a web ACL, perform the following steps:</p><ol><li><p>Use the AWS WAF logs to identify the IDs of the rules that you want to exclude. For more information about the logs, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/logging.html">Logging Web ACL Traffic Information</a>.</p></li><li><p>Submit an <a>UpdateWebACL</a> request that has two actions:</p><ul><li><p>The first action deletes the existing rule group from the web ACL. That is, in the <a>UpdateWebACL</a> request, the first <code>Updates:Action</code> should be <code>DELETE</code> and <code>Updates:ActivatedRule:RuleId</code> should be the rule group that contains the rules that you want to exclude.</p></li><li><p>The second action inserts the same rule group back in, but specifying the rules to exclude. That is, the second <code>Updates:Action</code> should be <code>INSERT</code>, <code>Updates:ActivatedRule:RuleId</code> should be the rule group that you just removed, and <code>ExcludedRules</code> should contain the rules that you want to exclude.</p></li></ul></li></ol>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalExcludedRule *> * _Nullable excludedRules;

/**
 <p>Use the <code>OverrideAction</code> to test your <code>RuleGroup</code>.</p><p>Any rule in a <code>RuleGroup</code> can potentially block a request. If you set the <code>OverrideAction</code> to <code>None</code>, the <code>RuleGroup</code> will block a request if any individual rule in the <code>RuleGroup</code> matches the request and is configured to block that request. However if you first want to test the <code>RuleGroup</code>, set the <code>OverrideAction</code> to <code>Count</code>. The <code>RuleGroup</code> will then override any block action specified by individual rules contained within the group. Instead of blocking matching requests, those requests will be counted. You can view a record of counted requests using <a>GetSampledRequests</a>. </p><p><code>ActivatedRule|OverrideAction</code> applies only when updating or adding a <code>RuleGroup</code> to a <code>WebACL</code>. In this case you do not use <code>ActivatedRule|Action</code>. For all other update requests, <code>ActivatedRule|Action</code> is used instead of <code>ActivatedRule|OverrideAction</code>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalWafOverrideAction * _Nullable overrideAction;

/**
 <p>Specifies the order in which the <code>Rules</code> in a <code>WebACL</code> are evaluated. Rules with a lower value for <code>Priority</code> are evaluated before <code>Rules</code> with a higher value. The value must be a unique integer. If you add multiple <code>Rules</code> to a <code>WebACL</code>, the values don't need to be consecutive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p>The <code>RuleId</code> for a <code>Rule</code>. You use <code>RuleId</code> to get more information about a <code>Rule</code> (see <a>GetRule</a>), update a <code>Rule</code> (see <a>UpdateRule</a>), insert a <code>Rule</code> into a <code>WebACL</code> or delete a one from a <code>WebACL</code> (see <a>UpdateWebACL</a>), or delete a <code>Rule</code> from AWS WAF (see <a>DeleteRule</a>).</p><p><code>RuleId</code> is returned by <a>CreateRule</a> and by <a>ListRules</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>The rule type, either <code>REGULAR</code>, as defined by <a>Rule</a>, <code>RATE_BASED</code>, as defined by <a>RateBasedRule</a>, or <code>GROUP</code>, as defined by <a>RuleGroup</a>. The default is REGULAR. Although this field is optional, be aware that if you try to add a RATE_BASED rule to a web ACL without setting the type, the <a>UpdateWebACL</a> request will fail because the request tries to add a REGULAR rule with the specified ID, which does not exist. </p>
 */
@property (nonatomic, assign) AWSwaf-regionalWafRuleType types;

@end

/**
 
 */
@interface AWSwaf-regionalAssociateWebACLRequest : AWSRequest


/**
 <p>The ARN (Amazon Resource Name) of the resource to be protected, either an application load balancer or Amazon API Gateway stage. </p><p>The ARN should be in one of the following formats:</p><ul><li><p>For an Application Load Balancer: <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i></code></p></li><li><p>For an Amazon API Gateway stage: <code>arn:aws:apigateway:<i>region</i>::/restapis/<i>api-id</i>/stages/<i>stage-name</i></code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A unique identifier (ID) for the web ACL. </p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 
 */
@interface AWSwaf-regionalAssociateWebACLResponse : AWSModel


@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>In a <a>GetByteMatchSet</a> request, <code>ByteMatchSet</code> is a complex type that contains the <code>ByteMatchSetId</code> and <code>Name</code> of a <code>ByteMatchSet</code>, and the values that you specified when you updated the <code>ByteMatchSet</code>. </p><p>A complex type that contains <code>ByteMatchTuple</code> objects, which specify the parts of web requests that you want AWS WAF to inspect and the values that you want AWS WAF to search for. If a <code>ByteMatchSet</code> contains more than one <code>ByteMatchTuple</code> object, a request needs to match the settings in only one <code>ByteMatchTuple</code> to be considered a match.</p>
 Required parameters: [ByteMatchSetId, ByteMatchTuples]
 */
@interface AWSwaf-regionalByteMatchSet : AWSModel


/**
 <p>The <code>ByteMatchSetId</code> for a <code>ByteMatchSet</code>. You use <code>ByteMatchSetId</code> to get information about a <code>ByteMatchSet</code> (see <a>GetByteMatchSet</a>), update a <code>ByteMatchSet</code> (see <a>UpdateByteMatchSet</a>), insert a <code>ByteMatchSet</code> into a <code>Rule</code> or delete one from a <code>Rule</code> (see <a>UpdateRule</a>), and delete a <code>ByteMatchSet</code> from AWS WAF (see <a>DeleteByteMatchSet</a>).</p><p><code>ByteMatchSetId</code> is returned by <a>CreateByteMatchSet</a> and by <a>ListByteMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable byteMatchSetId;

/**
 <p>Specifies the bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to search for in web requests, the location in requests that you want AWS WAF to search, and other settings.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalByteMatchTuple *> * _Nullable byteMatchTuples;

/**
 <p>A friendly name or description of the <a>ByteMatchSet</a>. You can't change <code>Name</code> after you create a <code>ByteMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returned by <a>ListByteMatchSets</a>. Each <code>ByteMatchSetSummary</code> object includes the <code>Name</code> and <code>ByteMatchSetId</code> for one <a>ByteMatchSet</a>.</p>
 Required parameters: [ByteMatchSetId, Name]
 */
@interface AWSwaf-regionalByteMatchSetSummary : AWSModel


/**
 <p>The <code>ByteMatchSetId</code> for a <code>ByteMatchSet</code>. You use <code>ByteMatchSetId</code> to get information about a <code>ByteMatchSet</code>, update a <code>ByteMatchSet</code>, remove a <code>ByteMatchSet</code> from a <code>Rule</code>, and delete a <code>ByteMatchSet</code> from AWS WAF.</p><p><code>ByteMatchSetId</code> is returned by <a>CreateByteMatchSet</a> and by <a>ListByteMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable byteMatchSetId;

/**
 <p>A friendly name or description of the <a>ByteMatchSet</a>. You can't change <code>Name</code> after you create a <code>ByteMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>In an <a>UpdateByteMatchSet</a> request, <code>ByteMatchSetUpdate</code> specifies whether to insert or delete a <a>ByteMatchTuple</a> and includes the settings for the <code>ByteMatchTuple</code>.</p>
 Required parameters: [Action, ByteMatchTuple]
 */
@interface AWSwaf-regionalByteMatchSetUpdate : AWSModel


/**
 <p>Specifies whether to insert or delete a <a>ByteMatchTuple</a>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>Information about the part of a web request that you want AWS WAF to inspect and the value that you want AWS WAF to search for. If you specify <code>DELETE</code> for the value of <code>Action</code>, the <code>ByteMatchTuple</code> values must exactly match the values in the <code>ByteMatchTuple</code> that you want to delete from the <code>ByteMatchSet</code>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalByteMatchTuple * _Nullable byteMatchTuple;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to search for in web requests, the location in requests that you want AWS WAF to search, and other settings.</p>
 Required parameters: [FieldToMatch, TargetString, TextTransformation, PositionalConstraint]
 */
@interface AWSwaf-regionalByteMatchTuple : AWSModel


/**
 <p>The part of a web request that you want AWS WAF to search, such as a specified header or a query string. For more information, see <a>FieldToMatch</a>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalFieldToMatch * _Nullable fieldToMatch;

/**
 <p>Within the portion of a web request that you want to search (for example, in the query string, if any), specify where you want AWS WAF to search. Valid values include the following:</p><p><b>CONTAINS</b></p><p>The specified part of the web request must include the value of <code>TargetString</code>, but the location doesn't matter.</p><p><b>CONTAINS_WORD</b></p><p>The specified part of the web request must include the value of <code>TargetString</code>, and <code>TargetString</code> must contain only alphanumeric characters or underscore (A-Z, a-z, 0-9, or _). In addition, <code>TargetString</code> must be a word, which means one of the following:</p><ul><li><p><code>TargetString</code> exactly matches the value of the specified part of the web request, such as the value of a header.</p></li><li><p><code>TargetString</code> is at the beginning of the specified part of the web request and is followed by a character other than an alphanumeric character or underscore (_), for example, <code>BadBot;</code>.</p></li><li><p><code>TargetString</code> is at the end of the specified part of the web request and is preceded by a character other than an alphanumeric character or underscore (_), for example, <code>;BadBot</code>.</p></li><li><p><code>TargetString</code> is in the middle of the specified part of the web request and is preceded and followed by characters other than alphanumeric characters or underscore (_), for example, <code>-BadBot;</code>.</p></li></ul><p><b>EXACTLY</b></p><p>The value of the specified part of the web request must exactly match the value of <code>TargetString</code>.</p><p><b>STARTS_WITH</b></p><p>The value of <code>TargetString</code> must appear at the beginning of the specified part of the web request.</p><p><b>ENDS_WITH</b></p><p>The value of <code>TargetString</code> must appear at the end of the specified part of the web request.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalPositionalConstraint positionalConstraint;

/**
 <p>The value that you want AWS WAF to search for. AWS WAF searches for the specified string in the part of web requests that you specified in <code>FieldToMatch</code>. The maximum length of the value is 50 bytes.</p><p>Valid values depend on the values that you specified for <code>FieldToMatch</code>:</p><ul><li><p><code>HEADER</code>: The value that you want AWS WAF to search for in the request header that you specified in <a>FieldToMatch</a>, for example, the value of the <code>User-Agent</code> or <code>Referer</code> header.</p></li><li><p><code>METHOD</code>: The HTTP method, which indicates the type of operation specified in the request. CloudFront supports the following methods: <code>DELETE</code>, <code>GET</code>, <code>HEAD</code>, <code>OPTIONS</code>, <code>PATCH</code>, <code>POST</code>, and <code>PUT</code>.</p></li><li><p><code>QUERY_STRING</code>: The value that you want AWS WAF to search for in the query string, which is the part of a URL that appears after a <code>?</code> character.</p></li><li><p><code>URI</code>: The value that you want AWS WAF to search for in the part of a URL that identifies a resource, for example, <code>/images/daily-ad.jpg</code>.</p></li><li><p><code>BODY</code>: The part of a request that contains any additional data that you want to send to your web server as the HTTP request body, such as data from a form. The request body immediately follows the request headers. Note that only the first <code>8192</code> bytes of the request body are forwarded to AWS WAF for inspection. To allow or block requests based on the length of the body, you can create a size constraint set. For more information, see <a>CreateSizeConstraintSet</a>. </p></li><li><p><code>SINGLE_QUERY_ARG</code>: The parameter in the query string that you will inspect, such as <i>UserName</i> or <i>SalesRegion</i>. The maximum length for <code>SINGLE_QUERY_ARG</code> is 30 characters.</p></li><li><p><code>ALL_QUERY_ARGS</code>: Similar to <code>SINGLE_QUERY_ARG</code>, but instead of inspecting a single parameter, AWS WAF inspects all parameters within the query string for the value or regex pattern that you specify in <code>TargetString</code>.</p></li></ul><p>If <code>TargetString</code> includes alphabetic characters A-Z and a-z, note that the value is case sensitive.</p><p><b>If you're using the AWS WAF API</b></p><p>Specify a base64-encoded version of the value. The maximum length of the value before you base64-encode it is 50 bytes.</p><p>For example, suppose the value of <code>Type</code> is <code>HEADER</code> and the value of <code>Data</code> is <code>User-Agent</code>. If you want to search the <code>User-Agent</code> header for the value <code>BadBot</code>, you base64-encode <code>BadBot</code> using MIME base64-encoding and include the resulting value, <code>QmFkQm90</code>, in the value of <code>TargetString</code>.</p><p><b>If you're using the AWS CLI or one of the AWS SDKs</b></p><p>The value that you want AWS WAF to search for. The SDK automatically base64 encodes the value.</p>
 */
@property (nonatomic, strong) NSData * _Nullable targetString;

/**
 <p>Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on <code>FieldToMatch</code> before inspecting it for a match.</p><p>You can only specify a single type of TextTransformation.</p><p><b>CMD_LINE</b></p><p>When you're concerned that attackers are injecting an operating system command line command and using unusual formatting to disguise some or all of the command, use this option to perform the following transformations:</p><ul><li><p>Delete the following characters: \ " ' ^</p></li><li><p>Delete spaces before the following characters: / (</p></li><li><p>Replace the following characters with a space: , ;</p></li><li><p>Replace multiple spaces with one space</p></li><li><p>Convert uppercase letters (A-Z) to lowercase (a-z)</p></li></ul><p><b>COMPRESS_WHITE_SPACE</b></p><p>Use this option to replace the following characters with a space character (decimal 32):</p><ul><li><p>\f, formfeed, decimal 12</p></li><li><p>\t, tab, decimal 9</p></li><li><p>\n, newline, decimal 10</p></li><li><p>\r, carriage return, decimal 13</p></li><li><p>\v, vertical tab, decimal 11</p></li><li><p>non-breaking space, decimal 160</p></li></ul><p><code>COMPRESS_WHITE_SPACE</code> also replaces multiple spaces with one space.</p><p><b>HTML_ENTITY_DECODE</b></p><p>Use this option to replace HTML-encoded characters with unencoded characters. <code>HTML_ENTITY_DECODE</code> performs the following operations:</p><ul><li><p>Replaces <code>(ampersand)quot;</code> with <code>"</code></p></li><li><p>Replaces <code>(ampersand)nbsp;</code> with a non-breaking space, decimal 160</p></li><li><p>Replaces <code>(ampersand)lt;</code> with a "less than" symbol</p></li><li><p>Replaces <code>(ampersand)gt;</code> with <code>&gt;</code></p></li><li><p>Replaces characters that are represented in hexadecimal format, <code>(ampersand)#xhhhh;</code>, with the corresponding characters</p></li><li><p>Replaces characters that are represented in decimal format, <code>(ampersand)#nnnn;</code>, with the corresponding characters</p></li></ul><p><b>LOWERCASE</b></p><p>Use this option to convert uppercase letters (A-Z) to lowercase (a-z).</p><p><b>URL_DECODE</b></p><p>Use this option to decode a URL-encoded value.</p><p><b>NONE</b></p><p>Specify <code>NONE</code> if you don't want to perform any text transformations.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalTextTransformation textTransformation;

@end

/**
 
 */
@interface AWSwaf-regionalCreateByteMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description of the <a>ByteMatchSet</a>. You can't change <code>Name</code> after you create a <code>ByteMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSwaf-regionalCreateByteMatchSetResponse : AWSModel


/**
 <p>A <a>ByteMatchSet</a> that contains no <code>ByteMatchTuple</code> objects.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalByteMatchSet * _Nullable byteMatchSet;

/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateByteMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalCreateGeoMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description of the <a>GeoMatchSet</a>. You can't change <code>Name</code> after you create the <code>GeoMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSwaf-regionalCreateGeoMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateGeoMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <a>GeoMatchSet</a> returned in the <code>CreateGeoMatchSet</code> response. The <code>GeoMatchSet</code> contains no <code>GeoMatchConstraints</code>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalGeoMatchSet * _Nullable geoMatchSet;

@end

/**
 
 */
@interface AWSwaf-regionalCreateIPSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description of the <a>IPSet</a>. You can't change <code>Name</code> after you create the <code>IPSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSwaf-regionalCreateIPSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateIPSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <a>IPSet</a> returned in the <code>CreateIPSet</code> response.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalIPSet * _Nullable IPSet;

@end

/**
 
 */
@interface AWSwaf-regionalCreateRateBasedRuleRequest : AWSRequest


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateRateBasedRule</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description for the metrics for this <code>RateBasedRule</code>. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the <code>RateBasedRule</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>A friendly name or description of the <a>RateBasedRule</a>. You can't change the name of a <code>RateBasedRule</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The field that AWS WAF uses to determine if requests are likely arriving from a single source and thus subject to rate monitoring. The only valid value for <code>RateKey</code> is <code>IP</code>. <code>IP</code> indicates that requests that arrive from the same IP address are subject to the <code>RateLimit</code> that is specified in the <code>RateBasedRule</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalRateKey rateKey;

/**
 <p>The maximum number of requests, which have an identical value in the field that is specified by <code>RateKey</code>, allowed in a five-minute period. If the number of requests exceeds the <code>RateLimit</code> and the other predicates specified in the rule are also met, AWS WAF triggers the action that is specified for this rule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rateLimit;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSwaf-regionalCreateRateBasedRuleResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateRateBasedRule</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <a>RateBasedRule</a> that is returned in the <code>CreateRateBasedRule</code> response.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalRateBasedRule * _Nullable rule;

@end

/**
 
 */
@interface AWSwaf-regionalCreateRegexMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description of the <a>RegexMatchSet</a>. You can't change <code>Name</code> after you create a <code>RegexMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSwaf-regionalCreateRegexMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateRegexMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A <a>RegexMatchSet</a> that contains no <code>RegexMatchTuple</code> objects.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalRegexMatchSet * _Nullable regexMatchSet;

@end

/**
 
 */
@interface AWSwaf-regionalCreateRegexPatternSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description of the <a>RegexPatternSet</a>. You can't change <code>Name</code> after you create a <code>RegexPatternSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSwaf-regionalCreateRegexPatternSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateRegexPatternSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A <a>RegexPatternSet</a> that contains no objects.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalRegexPatternSet * _Nullable regexPatternSet;

@end

/**
 
 */
@interface AWSwaf-regionalCreateRuleGroupRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description for the metrics for this <code>RuleGroup</code>. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the <code>RuleGroup</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>A friendly name or description of the <a>RuleGroup</a>. You can't change <code>Name</code> after you create a <code>RuleGroup</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSwaf-regionalCreateRuleGroupResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateRuleGroup</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>An empty <a>RuleGroup</a>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalRuleGroup * _Nullable ruleGroup;

@end

/**
 
 */
@interface AWSwaf-regionalCreateRuleRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description for the metrics for this <code>Rule</code>. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the <code>Rule</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>A friendly name or description of the <a>Rule</a>. You can't change the name of a <code>Rule</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSwaf-regionalCreateRuleResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateRule</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <a>Rule</a> returned in the <code>CreateRule</code> response.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalRule * _Nullable rule;

@end

/**
 
 */
@interface AWSwaf-regionalCreateSizeConstraintSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description of the <a>SizeConstraintSet</a>. You can't change <code>Name</code> after you create a <code>SizeConstraintSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSwaf-regionalCreateSizeConstraintSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateSizeConstraintSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A <a>SizeConstraintSet</a> that contains no <code>SizeConstraint</code> objects.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalSizeConstraintSet * _Nullable sizeConstraintSet;

@end

/**
 <p>A request to create a <a>SqlInjectionMatchSet</a>.</p>
 Required parameters: [Name, ChangeToken]
 */
@interface AWSwaf-regionalCreateSqlInjectionMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description for the <a>SqlInjectionMatchSet</a> that you're creating. You can't change <code>Name</code> after you create the <code>SqlInjectionMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The response to a <code>CreateSqlInjectionMatchSet</code> request.</p>
 */
@interface AWSwaf-regionalCreateSqlInjectionMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateSqlInjectionMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A <a>SqlInjectionMatchSet</a>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalSqlInjectionMatchSet * _Nullable sqlInjectionMatchSet;

@end

/**
 
 */
@interface AWSwaf-regionalCreateWebACLMigrationStackRequest : AWSRequest


/**
 <p>Indicates whether to exclude entities that can't be migrated or to stop the migration. Set this to true to ignore unsupported entities in the web ACL during the migration. Otherwise, if AWS WAF encounters unsupported entities, it stops the process and throws an exception. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ignoreUnsupportedType;

/**
 <p>The name of the Amazon S3 bucket to store the CloudFormation template in. The S3 bucket must be configured as follows for the migration: </p><ul><li><p>The bucket name must start with <code>aws-waf-migration-</code>. For example, <code>aws-waf-migration-my-web-acl</code>.</p></li><li><p>The bucket must be in the Region where you are deploying the template. For example, for a web ACL in us-west-2, you must use an Amazon S3 bucket in us-west-2 and you must deploy the template stack to us-west-2. </p></li><li><p>The bucket policies must permit the migration process to write data. For listings of the bucket policies, see the Examples section. </p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>The UUID of the WAF Classic web ACL that you want to migrate to WAF v2.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 
 */
@interface AWSwaf-regionalCreateWebACLMigrationStackResponse : AWSModel


/**
 <p>The URL of the template created in Amazon S3. </p>
 */
@property (nonatomic, strong) NSString * _Nullable s3ObjectUrl;

@end

/**
 
 */
@interface AWSwaf-regionalCreateWebACLRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The action that you want AWS WAF to take when a request doesn't match the criteria specified in any of the <code>Rule</code> objects that are associated with the <code>WebACL</code>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalWafAction * _Nullable defaultAction;

/**
 <p>A friendly name or description for the metrics for this <code>WebACL</code>.The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change <code>MetricName</code> after you create the <code>WebACL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>A friendly name or description of the <a>WebACL</a>. You can't change <code>Name</code> after you create the <code>WebACL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSwaf-regionalCreateWebACLResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateWebACL</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <a>WebACL</a> returned in the <code>CreateWebACL</code> response.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalWebACL * _Nullable webACL;

@end

/**
 <p>A request to create an <a>XssMatchSet</a>.</p>
 Required parameters: [Name, ChangeToken]
 */
@interface AWSwaf-regionalCreateXssMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A friendly name or description for the <a>XssMatchSet</a> that you're creating. You can't change <code>Name</code> after you create the <code>XssMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The response to a <code>CreateXssMatchSet</code> request.</p>
 */
@interface AWSwaf-regionalCreateXssMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>CreateXssMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>An <a>XssMatchSet</a>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalXssMatchSet * _Nullable xssMatchSet;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteByteMatchSetRequest : AWSRequest


/**
 <p>The <code>ByteMatchSetId</code> of the <a>ByteMatchSet</a> that you want to delete. <code>ByteMatchSetId</code> is returned by <a>CreateByteMatchSet</a> and by <a>ListByteMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable byteMatchSetId;

/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteByteMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteByteMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteGeoMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>GeoMatchSetID</code> of the <a>GeoMatchSet</a> that you want to delete. <code>GeoMatchSetId</code> is returned by <a>CreateGeoMatchSet</a> and by <a>ListGeoMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geoMatchSetId;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteGeoMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteGeoMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteIPSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>IPSetId</code> of the <a>IPSet</a> that you want to delete. <code>IPSetId</code> is returned by <a>CreateIPSet</a> and by <a>ListIPSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IPSetId;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteIPSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteIPSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteLoggingConfigurationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the web ACL from which you want to delete the <a>LoggingConfiguration</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteLoggingConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSwaf-regionalDeletePermissionPolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the RuleGroup from which you want to delete the policy.</p><p>The user making the request must be the owner of the RuleGroup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSwaf-regionalDeletePermissionPolicyResponse : AWSModel


@end

/**
 
 */
@interface AWSwaf-regionalDeleteRateBasedRuleRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>RuleId</code> of the <a>RateBasedRule</a> that you want to delete. <code>RuleId</code> is returned by <a>CreateRateBasedRule</a> and by <a>ListRateBasedRules</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteRateBasedRuleResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteRateBasedRule</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteRegexMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>RegexMatchSetId</code> of the <a>RegexMatchSet</a> that you want to delete. <code>RegexMatchSetId</code> is returned by <a>CreateRegexMatchSet</a> and by <a>ListRegexMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexMatchSetId;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteRegexMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteRegexMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteRegexPatternSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>RegexPatternSetId</code> of the <a>RegexPatternSet</a> that you want to delete. <code>RegexPatternSetId</code> is returned by <a>CreateRegexPatternSet</a> and by <a>ListRegexPatternSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexPatternSetId;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteRegexPatternSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteRegexPatternSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteRuleGroupRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>RuleGroupId</code> of the <a>RuleGroup</a> that you want to delete. <code>RuleGroupId</code> is returned by <a>CreateRuleGroup</a> and by <a>ListRuleGroups</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleGroupId;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteRuleGroupResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteRuleGroup</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteRuleRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>RuleId</code> of the <a>Rule</a> that you want to delete. <code>RuleId</code> is returned by <a>CreateRule</a> and by <a>ListRules</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteRuleResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteRule</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteSizeConstraintSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>SizeConstraintSetId</code> of the <a>SizeConstraintSet</a> that you want to delete. <code>SizeConstraintSetId</code> is returned by <a>CreateSizeConstraintSet</a> and by <a>ListSizeConstraintSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sizeConstraintSetId;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteSizeConstraintSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteSizeConstraintSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 <p>A request to delete a <a>SqlInjectionMatchSet</a> from AWS WAF.</p>
 Required parameters: [SqlInjectionMatchSetId, ChangeToken]
 */
@interface AWSwaf-regionalDeleteSqlInjectionMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>SqlInjectionMatchSetId</code> of the <a>SqlInjectionMatchSet</a> that you want to delete. <code>SqlInjectionMatchSetId</code> is returned by <a>CreateSqlInjectionMatchSet</a> and by <a>ListSqlInjectionMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sqlInjectionMatchSetId;

@end

/**
 <p>The response to a request to delete a <a>SqlInjectionMatchSet</a> from AWS WAF.</p>
 */
@interface AWSwaf-regionalDeleteSqlInjectionMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteSqlInjectionMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteWebACLRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>WebACLId</code> of the <a>WebACL</a> that you want to delete. <code>WebACLId</code> is returned by <a>CreateWebACL</a> and by <a>ListWebACLs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 
 */
@interface AWSwaf-regionalDeleteWebACLResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteWebACL</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 <p>A request to delete an <a>XssMatchSet</a> from AWS WAF.</p>
 Required parameters: [XssMatchSetId, ChangeToken]
 */
@interface AWSwaf-regionalDeleteXssMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>XssMatchSetId</code> of the <a>XssMatchSet</a> that you want to delete. <code>XssMatchSetId</code> is returned by <a>CreateXssMatchSet</a> and by <a>ListXssMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable xssMatchSetId;

@end

/**
 <p>The response to a request to delete an <a>XssMatchSet</a> from AWS WAF.</p>
 */
@interface AWSwaf-regionalDeleteXssMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>DeleteXssMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalDisassociateWebACLRequest : AWSRequest


/**
 <p>The ARN (Amazon Resource Name) of the resource from which the web ACL is being removed, either an application load balancer or Amazon API Gateway stage.</p><p>The ARN should be in one of the following formats:</p><ul><li><p>For an Application Load Balancer: <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i></code></p></li><li><p>For an Amazon API Gateway stage: <code>arn:aws:apigateway:<i>region</i>::/restapis/<i>api-id</i>/stages/<i>stage-name</i></code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSwaf-regionalDisassociateWebACLResponse : AWSModel


@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The rule to exclude from a rule group. This is applicable only when the <code>ActivatedRule</code> refers to a <code>RuleGroup</code>. The rule must belong to the <code>RuleGroup</code> that is specified by the <code>ActivatedRule</code>. </p>
 Required parameters: [RuleId]
 */
@interface AWSwaf-regionalExcludedRule : AWSModel


/**
 <p>The unique identifier for the rule to exclude from the rule group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies where in a web request to look for <code>TargetString</code>.</p>
 Required parameters: [Type]
 */
@interface AWSwaf-regionalFieldToMatch : AWSModel


/**
 <p>When the value of <code>Type</code> is <code>HEADER</code>, enter the name of the header that you want AWS WAF to search, for example, <code>User-Agent</code> or <code>Referer</code>. The name of the header is not case sensitive.</p><p>When the value of <code>Type</code> is <code>SINGLE_QUERY_ARG</code>, enter the name of the parameter that you want AWS WAF to search, for example, <code>UserName</code> or <code>SalesRegion</code>. The parameter name is not case sensitive.</p><p>If the value of <code>Type</code> is any other value, omit <code>Data</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable data;

/**
 <p>The part of the web request that you want AWS WAF to search for a specified string. Parts of a request that you can search include the following:</p><ul><li><p><code>HEADER</code>: A specified request header, for example, the value of the <code>User-Agent</code> or <code>Referer</code> header. If you choose <code>HEADER</code> for the type, specify the name of the header in <code>Data</code>.</p></li><li><p><code>METHOD</code>: The HTTP method, which indicated the type of operation that the request is asking the origin to perform. Amazon CloudFront supports the following methods: <code>DELETE</code>, <code>GET</code>, <code>HEAD</code>, <code>OPTIONS</code>, <code>PATCH</code>, <code>POST</code>, and <code>PUT</code>.</p></li><li><p><code>QUERY_STRING</code>: A query string, which is the part of a URL that appears after a <code>?</code> character, if any.</p></li><li><p><code>URI</code>: The part of a web request that identifies a resource, for example, <code>/images/daily-ad.jpg</code>.</p></li><li><p><code>BODY</code>: The part of a request that contains any additional data that you want to send to your web server as the HTTP request body, such as data from a form. The request body immediately follows the request headers. Note that only the first <code>8192</code> bytes of the request body are forwarded to AWS WAF for inspection. To allow or block requests based on the length of the body, you can create a size constraint set. For more information, see <a>CreateSizeConstraintSet</a>. </p></li><li><p><code>SINGLE_QUERY_ARG</code>: The parameter in the query string that you will inspect, such as <i>UserName</i> or <i>SalesRegion</i>. The maximum length for <code>SINGLE_QUERY_ARG</code> is 30 characters.</p></li><li><p><code>ALL_QUERY_ARGS</code>: Similar to <code>SINGLE_QUERY_ARG</code>, but rather than inspecting a single parameter, AWS WAF will inspect all parameters within the query for the value or regex pattern that you specify in <code>TargetString</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSwaf-regionalMatchFieldType types;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The country from which web requests originate that you want AWS WAF to search for.</p>
 Required parameters: [Type, Value]
 */
@interface AWSwaf-regionalGeoMatchConstraint : AWSModel


/**
 <p>The type of geographical area you want AWS WAF to search for. Currently <code>Country</code> is the only valid value.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalGeoMatchConstraintType types;

/**
 <p>The country that you want AWS WAF to search for.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalGeoMatchConstraintValue value;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Contains one or more countries that AWS WAF will search for.</p>
 Required parameters: [GeoMatchSetId, GeoMatchConstraints]
 */
@interface AWSwaf-regionalGeoMatchSet : AWSModel


/**
 <p>An array of <a>GeoMatchConstraint</a> objects, which contain the country that you want AWS WAF to search for.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalGeoMatchConstraint *> * _Nullable geoMatchConstraints;

/**
 <p>The <code>GeoMatchSetId</code> for an <code>GeoMatchSet</code>. You use <code>GeoMatchSetId</code> to get information about a <code>GeoMatchSet</code> (see <a>GeoMatchSet</a>), update a <code>GeoMatchSet</code> (see <a>UpdateGeoMatchSet</a>), insert a <code>GeoMatchSet</code> into a <code>Rule</code> or delete one from a <code>Rule</code> (see <a>UpdateRule</a>), and delete a <code>GeoMatchSet</code> from AWS WAF (see <a>DeleteGeoMatchSet</a>).</p><p><code>GeoMatchSetId</code> is returned by <a>CreateGeoMatchSet</a> and by <a>ListGeoMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geoMatchSetId;

/**
 <p>A friendly name or description of the <a>GeoMatchSet</a>. You can't change the name of an <code>GeoMatchSet</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Contains the identifier and the name of the <code>GeoMatchSet</code>.</p>
 Required parameters: [GeoMatchSetId, Name]
 */
@interface AWSwaf-regionalGeoMatchSetSummary : AWSModel


/**
 <p>The <code>GeoMatchSetId</code> for an <a>GeoMatchSet</a>. You can use <code>GeoMatchSetId</code> in a <a>GetGeoMatchSet</a> request to get detailed information about an <a>GeoMatchSet</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geoMatchSetId;

/**
 <p>A friendly name or description of the <a>GeoMatchSet</a>. You can't change the name of an <code>GeoMatchSet</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies the type of update to perform to an <a>GeoMatchSet</a> with <a>UpdateGeoMatchSet</a>.</p>
 Required parameters: [Action, GeoMatchConstraint]
 */
@interface AWSwaf-regionalGeoMatchSetUpdate : AWSModel


/**
 <p>Specifies whether to insert or delete a country with <a>UpdateGeoMatchSet</a>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>The country from which web requests originate that you want AWS WAF to search for.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalGeoMatchConstraint * _Nullable geoMatchConstraint;

@end

/**
 
 */
@interface AWSwaf-regionalGetByteMatchSetRequest : AWSRequest


/**
 <p>The <code>ByteMatchSetId</code> of the <a>ByteMatchSet</a> that you want to get. <code>ByteMatchSetId</code> is returned by <a>CreateByteMatchSet</a> and by <a>ListByteMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable byteMatchSetId;

@end

/**
 
 */
@interface AWSwaf-regionalGetByteMatchSetResponse : AWSModel


/**
 <p>Information about the <a>ByteMatchSet</a> that you specified in the <code>GetByteMatchSet</code> request. For more information, see the following topics:</p><ul><li><p><a>ByteMatchSet</a>: Contains <code>ByteMatchSetId</code>, <code>ByteMatchTuples</code>, and <code>Name</code></p></li><li><p><code>ByteMatchTuples</code>: Contains an array of <a>ByteMatchTuple</a> objects. Each <code>ByteMatchTuple</code> object contains <a>FieldToMatch</a>, <code>PositionalConstraint</code>, <code>TargetString</code>, and <code>TextTransformation</code></p></li><li><p><a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) AWSwaf-regionalByteMatchSet * _Nullable byteMatchSet;

@end

/**
 
 */
@interface AWSwaf-regionalGetChangeTokenRequest : AWSRequest


@end

/**
 
 */
@interface AWSwaf-regionalGetChangeTokenResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used in the request. Use this value in a <code>GetChangeTokenStatus</code> request to get the current status of the request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalGetChangeTokenStatusRequest : AWSRequest


/**
 <p>The change token for which you want to get the status. This change token was previously returned in the <code>GetChangeToken</code> response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalGetChangeTokenStatusResponse : AWSModel


/**
 <p>The status of the change token.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeTokenStatus changeTokenStatus;

@end

/**
 
 */
@interface AWSwaf-regionalGetGeoMatchSetRequest : AWSRequest


/**
 <p>The <code>GeoMatchSetId</code> of the <a>GeoMatchSet</a> that you want to get. <code>GeoMatchSetId</code> is returned by <a>CreateGeoMatchSet</a> and by <a>ListGeoMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geoMatchSetId;

@end

/**
 
 */
@interface AWSwaf-regionalGetGeoMatchSetResponse : AWSModel


/**
 <p>Information about the <a>GeoMatchSet</a> that you specified in the <code>GetGeoMatchSet</code> request. This includes the <code>Type</code>, which for a <code>GeoMatchContraint</code> is always <code>Country</code>, as well as the <code>Value</code>, which is the identifier for a specific country.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalGeoMatchSet * _Nullable geoMatchSet;

@end

/**
 
 */
@interface AWSwaf-regionalGetIPSetRequest : AWSRequest


/**
 <p>The <code>IPSetId</code> of the <a>IPSet</a> that you want to get. <code>IPSetId</code> is returned by <a>CreateIPSet</a> and by <a>ListIPSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IPSetId;

@end

/**
 
 */
@interface AWSwaf-regionalGetIPSetResponse : AWSModel


/**
 <p>Information about the <a>IPSet</a> that you specified in the <code>GetIPSet</code> request. For more information, see the following topics:</p><ul><li><p><a>IPSet</a>: Contains <code>IPSetDescriptors</code>, <code>IPSetId</code>, and <code>Name</code></p></li><li><p><code>IPSetDescriptors</code>: Contains an array of <a>IPSetDescriptor</a> objects. Each <code>IPSetDescriptor</code> object contains <code>Type</code> and <code>Value</code></p></li></ul>
 */
@property (nonatomic, strong) AWSwaf-regionalIPSet * _Nullable IPSet;

@end

/**
 
 */
@interface AWSwaf-regionalGetLoggingConfigurationRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the web ACL for which you want to get the <a>LoggingConfiguration</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSwaf-regionalGetLoggingConfigurationResponse : AWSModel


/**
 <p>The <a>LoggingConfiguration</a> for the specified web ACL.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalLoggingConfiguration * _Nullable loggingConfiguration;

@end

/**
 
 */
@interface AWSwaf-regionalGetPermissionPolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the RuleGroup for which you want to get the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSwaf-regionalGetPermissionPolicyResponse : AWSModel


/**
 <p>The IAM policy attached to the specified RuleGroup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

@end

/**
 
 */
@interface AWSwaf-regionalGetRateBasedRuleManagedKeysRequest : AWSRequest


/**
 <p>A null value and not currently used. Do not include this in your request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The <code>RuleId</code> of the <a>RateBasedRule</a> for which you want to get a list of <code>ManagedKeys</code>. <code>RuleId</code> is returned by <a>CreateRateBasedRule</a> and by <a>ListRateBasedRules</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 
 */
@interface AWSwaf-regionalGetRateBasedRuleManagedKeysResponse : AWSModel


/**
 <p>An array of IP addresses that currently are blocked by the specified <a>RateBasedRule</a>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable managedKeys;

/**
 <p>A null value and not currently used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalGetRateBasedRuleRequest : AWSRequest


/**
 <p>The <code>RuleId</code> of the <a>RateBasedRule</a> that you want to get. <code>RuleId</code> is returned by <a>CreateRateBasedRule</a> and by <a>ListRateBasedRules</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 
 */
@interface AWSwaf-regionalGetRateBasedRuleResponse : AWSModel


/**
 <p>Information about the <a>RateBasedRule</a> that you specified in the <code>GetRateBasedRule</code> request.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalRateBasedRule * _Nullable rule;

@end

/**
 
 */
@interface AWSwaf-regionalGetRegexMatchSetRequest : AWSRequest


/**
 <p>The <code>RegexMatchSetId</code> of the <a>RegexMatchSet</a> that you want to get. <code>RegexMatchSetId</code> is returned by <a>CreateRegexMatchSet</a> and by <a>ListRegexMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexMatchSetId;

@end

/**
 
 */
@interface AWSwaf-regionalGetRegexMatchSetResponse : AWSModel


/**
 <p>Information about the <a>RegexMatchSet</a> that you specified in the <code>GetRegexMatchSet</code> request. For more information, see <a>RegexMatchTuple</a>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalRegexMatchSet * _Nullable regexMatchSet;

@end

/**
 
 */
@interface AWSwaf-regionalGetRegexPatternSetRequest : AWSRequest


/**
 <p>The <code>RegexPatternSetId</code> of the <a>RegexPatternSet</a> that you want to get. <code>RegexPatternSetId</code> is returned by <a>CreateRegexPatternSet</a> and by <a>ListRegexPatternSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexPatternSetId;

@end

/**
 
 */
@interface AWSwaf-regionalGetRegexPatternSetResponse : AWSModel


/**
 <p>Information about the <a>RegexPatternSet</a> that you specified in the <code>GetRegexPatternSet</code> request, including the identifier of the pattern set and the regular expression patterns you want AWS WAF to search for. </p>
 */
@property (nonatomic, strong) AWSwaf-regionalRegexPatternSet * _Nullable regexPatternSet;

@end

/**
 
 */
@interface AWSwaf-regionalGetRuleGroupRequest : AWSRequest


/**
 <p>The <code>RuleGroupId</code> of the <a>RuleGroup</a> that you want to get. <code>RuleGroupId</code> is returned by <a>CreateRuleGroup</a> and by <a>ListRuleGroups</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleGroupId;

@end

/**
 
 */
@interface AWSwaf-regionalGetRuleGroupResponse : AWSModel


/**
 <p>Information about the <a>RuleGroup</a> that you specified in the <code>GetRuleGroup</code> request. </p>
 */
@property (nonatomic, strong) AWSwaf-regionalRuleGroup * _Nullable ruleGroup;

@end

/**
 
 */
@interface AWSwaf-regionalGetRuleRequest : AWSRequest


/**
 <p>The <code>RuleId</code> of the <a>Rule</a> that you want to get. <code>RuleId</code> is returned by <a>CreateRule</a> and by <a>ListRules</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 
 */
@interface AWSwaf-regionalGetRuleResponse : AWSModel


/**
 <p>Information about the <a>Rule</a> that you specified in the <code>GetRule</code> request. For more information, see the following topics:</p><ul><li><p><a>Rule</a>: Contains <code>MetricName</code>, <code>Name</code>, an array of <code>Predicate</code> objects, and <code>RuleId</code></p></li><li><p><a>Predicate</a>: Each <code>Predicate</code> object contains <code>DataId</code>, <code>Negated</code>, and <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) AWSwaf-regionalRule * _Nullable rule;

@end

/**
 
 */
@interface AWSwaf-regionalGetSampledRequestsRequest : AWSRequest


/**
 <p>The number of requests that you want AWS WAF to return from among the first 5,000 requests that your AWS resource received during the time range. If your resource received fewer requests than the value of <code>MaxItems</code>, <code>GetSampledRequests</code> returns information about all of them. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p><code>RuleId</code> is one of three values:</p><ul><li><p>The <code>RuleId</code> of the <code>Rule</code> or the <code>RuleGroupId</code> of the <code>RuleGroup</code> for which you want <code>GetSampledRequests</code> to return a sample of requests.</p></li><li><p><code>Default_Action</code>, which causes <code>GetSampledRequests</code> to return a sample of the requests that didn't match any of the rules in the specified <code>WebACL</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>The start date and time and the end date and time of the range for which you want <code>GetSampledRequests</code> to return a sample of requests. You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>. You can specify any time range in the previous three hours.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalTimeWindow * _Nullable timeWindow;

/**
 <p>The <code>WebACLId</code> of the <code>WebACL</code> for which you want <code>GetSampledRequests</code> to return a sample of requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webAclId;

@end

/**
 
 */
@interface AWSwaf-regionalGetSampledRequestsResponse : AWSModel


/**
 <p>The total number of requests from which <code>GetSampledRequests</code> got a sample of <code>MaxItems</code> requests. If <code>PopulationSize</code> is less than <code>MaxItems</code>, the sample includes every request that your AWS resource received during the specified time range.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable populationSize;

/**
 <p>A complex type that contains detailed information about each of the requests in the sample.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalSampledHTTPRequest *> * _Nullable sampledRequests;

/**
 <p>Usually, <code>TimeWindow</code> is the time range that you specified in the <code>GetSampledRequests</code> request. However, if your AWS resource received more than 5,000 requests during the time range that you specified in the request, <code>GetSampledRequests</code> returns the time range for the first 5,000 requests. Times are in Coordinated Universal Time (UTC) format.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalTimeWindow * _Nullable timeWindow;

@end

/**
 
 */
@interface AWSwaf-regionalGetSizeConstraintSetRequest : AWSRequest


/**
 <p>The <code>SizeConstraintSetId</code> of the <a>SizeConstraintSet</a> that you want to get. <code>SizeConstraintSetId</code> is returned by <a>CreateSizeConstraintSet</a> and by <a>ListSizeConstraintSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sizeConstraintSetId;

@end

/**
 
 */
@interface AWSwaf-regionalGetSizeConstraintSetResponse : AWSModel


/**
 <p>Information about the <a>SizeConstraintSet</a> that you specified in the <code>GetSizeConstraintSet</code> request. For more information, see the following topics:</p><ul><li><p><a>SizeConstraintSet</a>: Contains <code>SizeConstraintSetId</code>, <code>SizeConstraints</code>, and <code>Name</code></p></li><li><p><code>SizeConstraints</code>: Contains an array of <a>SizeConstraint</a> objects. Each <code>SizeConstraint</code> object contains <a>FieldToMatch</a>, <code>TextTransformation</code>, <code>ComparisonOperator</code>, and <code>Size</code></p></li><li><p><a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) AWSwaf-regionalSizeConstraintSet * _Nullable sizeConstraintSet;

@end

/**
 <p>A request to get a <a>SqlInjectionMatchSet</a>.</p>
 Required parameters: [SqlInjectionMatchSetId]
 */
@interface AWSwaf-regionalGetSqlInjectionMatchSetRequest : AWSRequest


/**
 <p>The <code>SqlInjectionMatchSetId</code> of the <a>SqlInjectionMatchSet</a> that you want to get. <code>SqlInjectionMatchSetId</code> is returned by <a>CreateSqlInjectionMatchSet</a> and by <a>ListSqlInjectionMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sqlInjectionMatchSetId;

@end

/**
 <p>The response to a <a>GetSqlInjectionMatchSet</a> request.</p>
 */
@interface AWSwaf-regionalGetSqlInjectionMatchSetResponse : AWSModel


/**
 <p>Information about the <a>SqlInjectionMatchSet</a> that you specified in the <code>GetSqlInjectionMatchSet</code> request. For more information, see the following topics:</p><ul><li><p><a>SqlInjectionMatchSet</a>: Contains <code>Name</code>, <code>SqlInjectionMatchSetId</code>, and an array of <code>SqlInjectionMatchTuple</code> objects</p></li><li><p><a>SqlInjectionMatchTuple</a>: Each <code>SqlInjectionMatchTuple</code> object contains <code>FieldToMatch</code> and <code>TextTransformation</code></p></li><li><p><a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) AWSwaf-regionalSqlInjectionMatchSet * _Nullable sqlInjectionMatchSet;

@end

/**
 
 */
@interface AWSwaf-regionalGetWebACLForResourceRequest : AWSRequest


/**
 <p>The ARN (Amazon Resource Name) of the resource for which to get the web ACL, either an application load balancer or Amazon API Gateway stage.</p><p>The ARN should be in one of the following formats:</p><ul><li><p>For an Application Load Balancer: <code>arn:aws:elasticloadbalancing:<i>region</i>:<i>account-id</i>:loadbalancer/app/<i>load-balancer-name</i>/<i>load-balancer-id</i></code></p></li><li><p>For an Amazon API Gateway stage: <code>arn:aws:apigateway:<i>region</i>::/restapis/<i>api-id</i>/stages/<i>stage-name</i></code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSwaf-regionalGetWebACLForResourceResponse : AWSModel


/**
 <p>Information about the web ACL that you specified in the <code>GetWebACLForResource</code> request. If there is no associated resource, a null WebACLSummary is returned.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalWebACLSummary * _Nullable webACLSummary;

@end

/**
 
 */
@interface AWSwaf-regionalGetWebACLRequest : AWSRequest


/**
 <p>The <code>WebACLId</code> of the <a>WebACL</a> that you want to get. <code>WebACLId</code> is returned by <a>CreateWebACL</a> and by <a>ListWebACLs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 
 */
@interface AWSwaf-regionalGetWebACLResponse : AWSModel


/**
 <p>Information about the <a>WebACL</a> that you specified in the <code>GetWebACL</code> request. For more information, see the following topics:</p><ul><li><p><a>WebACL</a>: Contains <code>DefaultAction</code>, <code>MetricName</code>, <code>Name</code>, an array of <code>Rule</code> objects, and <code>WebACLId</code></p></li><li><p><code>DefaultAction</code> (Data type is <a>WafAction</a>): Contains <code>Type</code></p></li><li><p><code>Rules</code>: Contains an array of <code>ActivatedRule</code> objects, which contain <code>Action</code>, <code>Priority</code>, and <code>RuleId</code></p></li><li><p><code>Action</code>: Contains <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) AWSwaf-regionalWebACL * _Nullable webACL;

@end

/**
 <p>A request to get an <a>XssMatchSet</a>.</p>
 Required parameters: [XssMatchSetId]
 */
@interface AWSwaf-regionalGetXssMatchSetRequest : AWSRequest


/**
 <p>The <code>XssMatchSetId</code> of the <a>XssMatchSet</a> that you want to get. <code>XssMatchSetId</code> is returned by <a>CreateXssMatchSet</a> and by <a>ListXssMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable xssMatchSetId;

@end

/**
 <p>The response to a <a>GetXssMatchSet</a> request.</p>
 */
@interface AWSwaf-regionalGetXssMatchSetResponse : AWSModel


/**
 <p>Information about the <a>XssMatchSet</a> that you specified in the <code>GetXssMatchSet</code> request. For more information, see the following topics:</p><ul><li><p><a>XssMatchSet</a>: Contains <code>Name</code>, <code>XssMatchSetId</code>, and an array of <code>XssMatchTuple</code> objects</p></li><li><p><a>XssMatchTuple</a>: Each <code>XssMatchTuple</code> object contains <code>FieldToMatch</code> and <code>TextTransformation</code></p></li><li><p><a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) AWSwaf-regionalXssMatchSet * _Nullable xssMatchSet;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The response from a <a>GetSampledRequests</a> request includes an <code>HTTPHeader</code> complex type that appears as <code>Headers</code> in the response syntax. <code>HTTPHeader</code> contains the names and values of all of the headers that appear in one of the web requests that were returned by <code>GetSampledRequests</code>. </p>
 */
@interface AWSwaf-regionalHTTPHeader : AWSModel


/**
 <p>The name of one of the headers in the sampled web request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of one of the headers in the sampled web request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The response from a <a>GetSampledRequests</a> request includes an <code>HTTPRequest</code> complex type that appears as <code>Request</code> in the response syntax. <code>HTTPRequest</code> contains information about one of the web requests that were returned by <code>GetSampledRequests</code>. </p>
 */
@interface AWSwaf-regionalHTTPRequest : AWSModel


/**
 <p>The IP address that the request originated from. If the <code>WebACL</code> is associated with a CloudFront distribution, this is the value of one of the following fields in CloudFront access logs:</p><ul><li><p><code>c-ip</code>, if the viewer did not use an HTTP proxy or a load balancer to send the request</p></li><li><p><code>x-forwarded-for</code>, if the viewer did use an HTTP proxy or a load balancer to send the request</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable clientIP;

/**
 <p>The two-letter country code for the country that the request originated from. For a current list of country codes, see the Wikipedia entry <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1 alpha-2</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 <p>The HTTP version specified in the sampled web request, for example, <code>HTTP/1.1</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable HTTPVersion;

/**
 <p>A complex type that contains two values for each header in the sampled web request: the name of the header and the value of the header.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalHTTPHeader *> * _Nullable headers;

/**
 <p>The HTTP method specified in the sampled web request. CloudFront supports the following methods: <code>DELETE</code>, <code>GET</code>, <code>HEAD</code>, <code>OPTIONS</code>, <code>PATCH</code>, <code>POST</code>, and <code>PUT</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable method;

/**
 <p>The part of a web request that identifies the resource, for example, <code>/images/daily-ad.jpg</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable URI;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Contains one or more IP addresses or blocks of IP addresses specified in Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128.</p><p>To specify an individual IP address, you specify the four-part IP address followed by a <code>/32</code>, for example, 192.0.2.0/32. To block a range of IP addresses, you can specify /8 or any range between /16 through /32 (for IPv4) or /24, /32, /48, /56, /64, or /128 (for IPv6). For more information about CIDR notation, see the Wikipedia entry <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless Inter-Domain Routing</a>. </p>
 Required parameters: [IPSetId, IPSetDescriptors]
 */
@interface AWSwaf-regionalIPSet : AWSModel


/**
 <p>The IP address type (<code>IPV4</code> or <code>IPV6</code>) and the IP address range (in CIDR notation) that web requests originate from. If the <code>WebACL</code> is associated with a CloudFront distribution and the viewer did not use an HTTP proxy or a load balancer to send the request, this is the value of the c-ip field in the CloudFront access logs.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalIPSetDescriptor *> * _Nullable IPSetDescriptors;

/**
 <p>The <code>IPSetId</code> for an <code>IPSet</code>. You use <code>IPSetId</code> to get information about an <code>IPSet</code> (see <a>GetIPSet</a>), update an <code>IPSet</code> (see <a>UpdateIPSet</a>), insert an <code>IPSet</code> into a <code>Rule</code> or delete one from a <code>Rule</code> (see <a>UpdateRule</a>), and delete an <code>IPSet</code> from AWS WAF (see <a>DeleteIPSet</a>).</p><p><code>IPSetId</code> is returned by <a>CreateIPSet</a> and by <a>ListIPSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IPSetId;

/**
 <p>A friendly name or description of the <a>IPSet</a>. You can't change the name of an <code>IPSet</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies the IP address type (<code>IPV4</code> or <code>IPV6</code>) and the IP address range (in CIDR format) that web requests originate from.</p>
 Required parameters: [Type, Value]
 */
@interface AWSwaf-regionalIPSetDescriptor : AWSModel


/**
 <p>Specify <code>IPV4</code> or <code>IPV6</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalIPSetDescriptorType types;

/**
 <p>Specify an IPv4 address by using CIDR notation. For example:</p><ul><li><p>To configure AWS WAF to allow, block, or count requests that originated from the IP address 192.0.2.44, specify <code>192.0.2.44/32</code>.</p></li><li><p>To configure AWS WAF to allow, block, or count requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255, specify <code>192.0.2.0/24</code>.</p></li></ul><p>For more information about CIDR notation, see the Wikipedia entry <a href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing">Classless Inter-Domain Routing</a>.</p><p>Specify an IPv6 address by using CIDR notation. For example:</p><ul><li><p>To configure AWS WAF to allow, block, or count requests that originated from the IP address 1111:0000:0000:0000:0000:0000:0000:0111, specify <code>1111:0000:0000:0000:0000:0000:0000:0111/128</code>.</p></li><li><p>To configure AWS WAF to allow, block, or count requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify <code>1111:0000:0000:0000:0000:0000:0000:0000/64</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Contains the identifier and the name of the <code>IPSet</code>.</p>
 Required parameters: [IPSetId, Name]
 */
@interface AWSwaf-regionalIPSetSummary : AWSModel


/**
 <p>The <code>IPSetId</code> for an <a>IPSet</a>. You can use <code>IPSetId</code> in a <a>GetIPSet</a> request to get detailed information about an <a>IPSet</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IPSetId;

/**
 <p>A friendly name or description of the <a>IPSet</a>. You can't change the name of an <code>IPSet</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies the type of update to perform to an <a>IPSet</a> with <a>UpdateIPSet</a>.</p>
 Required parameters: [Action, IPSetDescriptor]
 */
@interface AWSwaf-regionalIPSetUpdate : AWSModel


/**
 <p>Specifies whether to insert or delete an IP address with <a>UpdateIPSet</a>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>The IP address type (<code>IPV4</code> or <code>IPV6</code>) and the IP address range (in CIDR notation) that web requests originate from.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalIPSetDescriptor * _Nullable IPSetDescriptor;

@end

/**
 
 */
@interface AWSwaf-regionalListActivatedRulesInRuleGroupRequest : AWSRequest


/**
 <p>Specifies the number of <code>ActivatedRules</code> that you want AWS WAF to return for this request. If you have more <code>ActivatedRules</code> than the number that you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>ActivatedRules</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>ActivatedRules</code> than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>ActivatedRules</code>. For the second and subsequent <code>ListActivatedRulesInRuleGroup</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>ActivatedRules</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The <code>RuleGroupId</code> of the <a>RuleGroup</a> for which you want to get a list of <a>ActivatedRule</a> objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleGroupId;

@end

/**
 
 */
@interface AWSwaf-regionalListActivatedRulesInRuleGroupResponse : AWSModel


/**
 <p>An array of <code>ActivatedRules</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalActivatedRule *> * _Nullable activatedRules;

/**
 <p>If you have more <code>ActivatedRules</code> than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>ActivatedRules</code>, submit another <code>ListActivatedRulesInRuleGroup</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListByteMatchSetsRequest : AWSRequest


/**
 <p>Specifies the number of <code>ByteMatchSet</code> objects that you want AWS WAF to return for this request. If you have more <code>ByteMatchSets</code> objects than the number you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>ByteMatchSet</code> objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>ByteMatchSets</code> than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>ByteMatchSets</code>. For the second and subsequent <code>ListByteMatchSets</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>ByteMatchSets</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListByteMatchSetsResponse : AWSModel


/**
 <p>An array of <a>ByteMatchSetSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalByteMatchSetSummary *> * _Nullable byteMatchSets;

/**
 <p>If you have more <code>ByteMatchSet</code> objects than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>ByteMatchSet</code> objects, submit another <code>ListByteMatchSets</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListGeoMatchSetsRequest : AWSRequest


/**
 <p>Specifies the number of <code>GeoMatchSet</code> objects that you want AWS WAF to return for this request. If you have more <code>GeoMatchSet</code> objects than the number you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>GeoMatchSet</code> objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>GeoMatchSet</code>s than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>GeoMatchSet</code> objects. For the second and subsequent <code>ListGeoMatchSets</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>GeoMatchSet</code> objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListGeoMatchSetsResponse : AWSModel


/**
 <p>An array of <a>GeoMatchSetSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalGeoMatchSetSummary *> * _Nullable geoMatchSets;

/**
 <p>If you have more <code>GeoMatchSet</code> objects than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>GeoMatchSet</code> objects, submit another <code>ListGeoMatchSets</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListIPSetsRequest : AWSRequest


/**
 <p>Specifies the number of <code>IPSet</code> objects that you want AWS WAF to return for this request. If you have more <code>IPSet</code> objects than the number you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>IPSet</code> objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>IPSets</code>. For the second and subsequent <code>ListIPSets</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>IPSets</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListIPSetsResponse : AWSModel


/**
 <p>An array of <a>IPSetSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalIPSetSummary *> * _Nullable IPSets;

/**
 <p>To list more <code>IPSet</code> objects, submit another <code>ListIPSets</code> request, and in the next request use the <code>NextMarker</code> response value as the <code>NextMarker</code> value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListLoggingConfigurationsRequest : AWSRequest


/**
 <p>Specifies the number of <code>LoggingConfigurations</code> that you want AWS WAF to return for this request. If you have more <code>LoggingConfigurations</code> than the number that you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>LoggingConfigurations</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>LoggingConfigurations</code> than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>LoggingConfigurations</code>. For the second and subsequent <code>ListLoggingConfigurations</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>ListLoggingConfigurations</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListLoggingConfigurationsResponse : AWSModel


/**
 <p>An array of <a>LoggingConfiguration</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalLoggingConfiguration *> * _Nullable loggingConfigurations;

/**
 <p>If you have more <code>LoggingConfigurations</code> than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>LoggingConfigurations</code>, submit another <code>ListLoggingConfigurations</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListRateBasedRulesRequest : AWSRequest


/**
 <p>Specifies the number of <code>Rules</code> that you want AWS WAF to return for this request. If you have more <code>Rules</code> than the number that you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>Rules</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>Rules</code> than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>Rules</code>. For the second and subsequent <code>ListRateBasedRules</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>Rules</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListRateBasedRulesResponse : AWSModel


/**
 <p>If you have more <code>Rules</code> than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>Rules</code>, submit another <code>ListRateBasedRules</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>An array of <a>RuleSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRuleSummary *> * _Nullable rules;

@end

/**
 
 */
@interface AWSwaf-regionalListRegexMatchSetsRequest : AWSRequest


/**
 <p>Specifies the number of <code>RegexMatchSet</code> objects that you want AWS WAF to return for this request. If you have more <code>RegexMatchSet</code> objects than the number you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>RegexMatchSet</code> objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>RegexMatchSet</code> objects than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>ByteMatchSets</code>. For the second and subsequent <code>ListRegexMatchSets</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>RegexMatchSet</code> objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListRegexMatchSetsResponse : AWSModel


/**
 <p>If you have more <code>RegexMatchSet</code> objects than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>RegexMatchSet</code> objects, submit another <code>ListRegexMatchSets</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>An array of <a>RegexMatchSetSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRegexMatchSetSummary *> * _Nullable regexMatchSets;

@end

/**
 
 */
@interface AWSwaf-regionalListRegexPatternSetsRequest : AWSRequest


/**
 <p>Specifies the number of <code>RegexPatternSet</code> objects that you want AWS WAF to return for this request. If you have more <code>RegexPatternSet</code> objects than the number you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>RegexPatternSet</code> objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>RegexPatternSet</code> objects than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>RegexPatternSet</code> objects. For the second and subsequent <code>ListRegexPatternSets</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>RegexPatternSet</code> objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListRegexPatternSetsResponse : AWSModel


/**
 <p>If you have more <code>RegexPatternSet</code> objects than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>RegexPatternSet</code> objects, submit another <code>ListRegexPatternSets</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>An array of <a>RegexPatternSetSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRegexPatternSetSummary *> * _Nullable regexPatternSets;

@end

/**
 
 */
@interface AWSwaf-regionalListResourcesForWebACLRequest : AWSRequest


/**
 <p>The type of resource to list, either an application load balancer or Amazon API Gateway.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalResourceType resourceType;

/**
 <p>The unique identifier (ID) of the web ACL for which to list the associated resources.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 
 */
@interface AWSwaf-regionalListResourcesForWebACLResponse : AWSModel


/**
 <p>An array of ARNs (Amazon Resource Names) of the resources associated with the specified web ACL. An array with zero elements is returned if there are no resources associated with the web ACL.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

@end

/**
 
 */
@interface AWSwaf-regionalListRuleGroupsRequest : AWSRequest


/**
 <p>Specifies the number of <code>RuleGroups</code> that you want AWS WAF to return for this request. If you have more <code>RuleGroups</code> than the number that you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>RuleGroups</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>RuleGroups</code> than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>RuleGroups</code>. For the second and subsequent <code>ListRuleGroups</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>RuleGroups</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListRuleGroupsResponse : AWSModel


/**
 <p>If you have more <code>RuleGroups</code> than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>RuleGroups</code>, submit another <code>ListRuleGroups</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>An array of <a>RuleGroup</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRuleGroupSummary *> * _Nullable ruleGroups;

@end

/**
 
 */
@interface AWSwaf-regionalListRulesRequest : AWSRequest


/**
 <p>Specifies the number of <code>Rules</code> that you want AWS WAF to return for this request. If you have more <code>Rules</code> than the number that you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>Rules</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>Rules</code> than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>Rules</code>. For the second and subsequent <code>ListRules</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>Rules</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListRulesResponse : AWSModel


/**
 <p>If you have more <code>Rules</code> than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>Rules</code>, submit another <code>ListRules</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>An array of <a>RuleSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRuleSummary *> * _Nullable rules;

@end

/**
 
 */
@interface AWSwaf-regionalListSizeConstraintSetsRequest : AWSRequest


/**
 <p>Specifies the number of <code>SizeConstraintSet</code> objects that you want AWS WAF to return for this request. If you have more <code>SizeConstraintSets</code> objects than the number you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>SizeConstraintSet</code> objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>SizeConstraintSets</code> than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>SizeConstraintSets</code>. For the second and subsequent <code>ListSizeConstraintSets</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>SizeConstraintSets</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListSizeConstraintSetsResponse : AWSModel


/**
 <p>If you have more <code>SizeConstraintSet</code> objects than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>SizeConstraintSet</code> objects, submit another <code>ListSizeConstraintSets</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>An array of <a>SizeConstraintSetSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalSizeConstraintSetSummary *> * _Nullable sizeConstraintSets;

@end

/**
 <p>A request to list the <a>SqlInjectionMatchSet</a> objects created by the current AWS account.</p>
 */
@interface AWSwaf-regionalListSqlInjectionMatchSetsRequest : AWSRequest


/**
 <p>Specifies the number of <a>SqlInjectionMatchSet</a> objects that you want AWS WAF to return for this request. If you have more <code>SqlInjectionMatchSet</code> objects than the number you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>Rules</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <a>SqlInjectionMatchSet</a> objects than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>SqlInjectionMatchSets</code>. For the second and subsequent <code>ListSqlInjectionMatchSets</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>SqlInjectionMatchSets</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>The response to a <a>ListSqlInjectionMatchSets</a> request.</p>
 */
@interface AWSwaf-regionalListSqlInjectionMatchSetsResponse : AWSModel


/**
 <p>If you have more <a>SqlInjectionMatchSet</a> objects than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>SqlInjectionMatchSet</code> objects, submit another <code>ListSqlInjectionMatchSets</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>An array of <a>SqlInjectionMatchSetSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalSqlInjectionMatchSetSummary *> * _Nullable sqlInjectionMatchSets;

@end

/**
 
 */
@interface AWSwaf-regionalListSubscribedRuleGroupsRequest : AWSRequest


/**
 <p>Specifies the number of subscribed rule groups that you want AWS WAF to return for this request. If you have more objects than the number you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>ByteMatchSets</code>subscribed rule groups than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of subscribed rule groups. For the second and subsequent <code>ListSubscribedRuleGroupsRequest</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of subscribed rule groups.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListSubscribedRuleGroupsResponse : AWSModel


/**
 <p>If you have more objects than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more objects, submit another <code>ListSubscribedRuleGroups</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>An array of <a>RuleGroup</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalSubscribedRuleGroupSummary *> * _Nullable ruleGroups;

@end

/**
 
 */
@interface AWSwaf-regionalListTagsForResourceRequest : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

@end

/**
 
 */
@interface AWSwaf-regionalListTagsForResourceResponse : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p/>
 */
@property (nonatomic, strong) AWSwaf-regionalTagInfoForResource * _Nullable tagInfoForResource;

@end

/**
 
 */
@interface AWSwaf-regionalListWebACLsRequest : AWSRequest


/**
 <p>Specifies the number of <code>WebACL</code> objects that you want AWS WAF to return for this request. If you have more <code>WebACL</code> objects than the number that you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>WebACL</code> objects.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <code>WebACL</code> objects than the number that you specify for <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>WebACL</code> objects. For the second and subsequent <code>ListWebACLs</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>WebACL</code> objects.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 
 */
@interface AWSwaf-regionalListWebACLsResponse : AWSModel


/**
 <p>If you have more <code>WebACL</code> objects than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>WebACL</code> objects, submit another <code>ListWebACLs</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>An array of <a>WebACLSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalWebACLSummary *> * _Nullable webACLs;

@end

/**
 <p>A request to list the <a>XssMatchSet</a> objects created by the current AWS account.</p>
 */
@interface AWSwaf-regionalListXssMatchSetsRequest : AWSRequest


/**
 <p>Specifies the number of <a>XssMatchSet</a> objects that you want AWS WAF to return for this request. If you have more <code>XssMatchSet</code> objects than the number you specify for <code>Limit</code>, the response includes a <code>NextMarker</code> value that you can use to get another batch of <code>Rules</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>If you specify a value for <code>Limit</code> and you have more <a>XssMatchSet</a> objects than the value of <code>Limit</code>, AWS WAF returns a <code>NextMarker</code> value in the response that allows you to list another group of <code>XssMatchSets</code>. For the second and subsequent <code>ListXssMatchSets</code> requests, specify the value of <code>NextMarker</code> from the previous response to get information about another batch of <code>XssMatchSets</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>The response to a <a>ListXssMatchSets</a> request.</p>
 */
@interface AWSwaf-regionalListXssMatchSetsResponse : AWSModel


/**
 <p>If you have more <a>XssMatchSet</a> objects than the number that you specified for <code>Limit</code> in the request, the response includes a <code>NextMarker</code> value. To list more <code>XssMatchSet</code> objects, submit another <code>ListXssMatchSets</code> request, and specify the <code>NextMarker</code> value from the response in the <code>NextMarker</code> value in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>An array of <a>XssMatchSetSummary</a> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalXssMatchSetSummary *> * _Nullable xssMatchSets;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The Amazon Kinesis Data Firehose, <code>RedactedFields</code> information, and the web ACL Amazon Resource Name (ARN).</p>
 Required parameters: [ResourceArn, LogDestinationConfigs]
 */
@interface AWSwaf-regionalLoggingConfiguration : AWSModel


/**
 <p>An array of Amazon Kinesis Data Firehose ARNs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logDestinationConfigs;

/**
 <p>The parts of the request that you want redacted from the logs. For example, if you redact the cookie field, the cookie field in the firehose will be <code>xxx</code>. </p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalFieldToMatch *> * _Nullable redactedFields;

/**
 <p>The Amazon Resource Name (ARN) of the web ACL that you want to associate with <code>LogDestinationConfigs</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies the <a>ByteMatchSet</a>, <a>IPSet</a>, <a>SqlInjectionMatchSet</a>, <a>XssMatchSet</a>, <a>RegexMatchSet</a>, <a>GeoMatchSet</a>, and <a>SizeConstraintSet</a> objects that you want to add to a <code>Rule</code> and, for each object, indicates whether you want to negate the settings, for example, requests that do NOT originate from the IP address 192.0.2.44. </p>
 Required parameters: [Negated, Type, DataId]
 */
@interface AWSwaf-regionalPredicate : AWSModel


/**
 <p>A unique identifier for a predicate in a <code>Rule</code>, such as <code>ByteMatchSetId</code> or <code>IPSetId</code>. The ID is returned by the corresponding <code>Create</code> or <code>List</code> command.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataId;

/**
 <p>Set <code>Negated</code> to <code>False</code> if you want AWS WAF to allow, block, or count requests based on the settings in the specified <a>ByteMatchSet</a>, <a>IPSet</a>, <a>SqlInjectionMatchSet</a>, <a>XssMatchSet</a>, <a>RegexMatchSet</a>, <a>GeoMatchSet</a>, or <a>SizeConstraintSet</a>. For example, if an <code>IPSet</code> includes the IP address <code>192.0.2.44</code>, AWS WAF will allow or block requests based on that IP address.</p><p>Set <code>Negated</code> to <code>True</code> if you want AWS WAF to allow or block a request based on the negation of the settings in the <a>ByteMatchSet</a>, <a>IPSet</a>, <a>SqlInjectionMatchSet</a>, <a>XssMatchSet</a>, <a>RegexMatchSet</a>, <a>GeoMatchSet</a>, or <a>SizeConstraintSet</a>. For example, if an <code>IPSet</code> includes the IP address <code>192.0.2.44</code>, AWS WAF will allow, block, or count requests based on all IP addresses <i>except</i><code>192.0.2.44</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable negated;

/**
 <p>The type of predicate in a <code>Rule</code>, such as <code>ByteMatch</code> or <code>IPSet</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalPredicateType types;

@end

/**
 
 */
@interface AWSwaf-regionalPutLoggingConfigurationRequest : AWSRequest


/**
 <p>The Amazon Kinesis Data Firehose that contains the inspected traffic information, the redacted fields details, and the Amazon Resource Name (ARN) of the web ACL to monitor.</p><note><p>When specifying <code>Type</code> in <code>RedactedFields</code>, you must use one of the following values: <code>URI</code>, <code>QUERY_STRING</code>, <code>HEADER</code>, or <code>METHOD</code>.</p></note>
 */
@property (nonatomic, strong) AWSwaf-regionalLoggingConfiguration * _Nullable loggingConfiguration;

@end

/**
 
 */
@interface AWSwaf-regionalPutLoggingConfigurationResponse : AWSModel


/**
 <p>The <a>LoggingConfiguration</a> that you submitted in the request.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalLoggingConfiguration * _Nullable loggingConfiguration;

@end

/**
 
 */
@interface AWSwaf-regionalPutPermissionPolicyRequest : AWSRequest


/**
 <p>The policy to attach to the specified RuleGroup.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policy;

/**
 <p>The Amazon Resource Name (ARN) of the RuleGroup to which you want to attach the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSwaf-regionalPutPermissionPolicyResponse : AWSModel


@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>A <code>RateBasedRule</code> is identical to a regular <a>Rule</a>, with one addition: a <code>RateBasedRule</code> counts the number of requests that arrive from a specified IP address every five minutes. For example, based on recent requests that you've seen from an attacker, you might create a <code>RateBasedRule</code> that includes the following conditions: </p><ul><li><p>The requests come from 192.0.2.44.</p></li><li><p>They contain the value <code>BadBot</code> in the <code>User-Agent</code> header.</p></li></ul><p>In the rule, you also define the rate limit as 1,000.</p><p>Requests that meet both of these conditions and exceed 1,000 requests every five minutes trigger the rule's action (block or count), which is defined in the web ACL.</p>
 Required parameters: [RuleId, MatchPredicates, RateKey, RateLimit]
 */
@interface AWSwaf-regionalRateBasedRule : AWSModel


/**
 <p>The <code>Predicates</code> object contains one <code>Predicate</code> element for each <a>ByteMatchSet</a>, <a>IPSet</a>, or <a>SqlInjectionMatchSet</a> object that you want to include in a <code>RateBasedRule</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalPredicate *> * _Nullable matchPredicates;

/**
 <p>A friendly name or description for the metrics for a <code>RateBasedRule</code>. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the <code>RateBasedRule</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>A friendly name or description for a <code>RateBasedRule</code>. You can't change the name of a <code>RateBasedRule</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The field that AWS WAF uses to determine if requests are likely arriving from single source and thus subject to rate monitoring. The only valid value for <code>RateKey</code> is <code>IP</code>. <code>IP</code> indicates that requests arriving from the same IP address are subject to the <code>RateLimit</code> that is specified in the <code>RateBasedRule</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalRateKey rateKey;

/**
 <p>The maximum number of requests, which have an identical value in the field specified by the <code>RateKey</code>, allowed in a five-minute period. If the number of requests exceeds the <code>RateLimit</code> and the other predicates specified in the rule are also met, AWS WAF triggers the action that is specified for this rule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rateLimit;

/**
 <p>A unique identifier for a <code>RateBasedRule</code>. You use <code>RuleId</code> to get more information about a <code>RateBasedRule</code> (see <a>GetRateBasedRule</a>), update a <code>RateBasedRule</code> (see <a>UpdateRateBasedRule</a>), insert a <code>RateBasedRule</code> into a <code>WebACL</code> or delete one from a <code>WebACL</code> (see <a>UpdateWebACL</a>), or delete a <code>RateBasedRule</code> from AWS WAF (see <a>DeleteRateBasedRule</a>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>In a <a>GetRegexMatchSet</a> request, <code>RegexMatchSet</code> is a complex type that contains the <code>RegexMatchSetId</code> and <code>Name</code> of a <code>RegexMatchSet</code>, and the values that you specified when you updated the <code>RegexMatchSet</code>.</p><p> The values are contained in a <code>RegexMatchTuple</code> object, which specify the parts of web requests that you want AWS WAF to inspect and the values that you want AWS WAF to search for. If a <code>RegexMatchSet</code> contains more than one <code>RegexMatchTuple</code> object, a request needs to match the settings in only one <code>ByteMatchTuple</code> to be considered a match.</p>
 */
@interface AWSwaf-regionalRegexMatchSet : AWSModel


/**
 <p>A friendly name or description of the <a>RegexMatchSet</a>. You can't change <code>Name</code> after you create a <code>RegexMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The <code>RegexMatchSetId</code> for a <code>RegexMatchSet</code>. You use <code>RegexMatchSetId</code> to get information about a <code>RegexMatchSet</code> (see <a>GetRegexMatchSet</a>), update a <code>RegexMatchSet</code> (see <a>UpdateRegexMatchSet</a>), insert a <code>RegexMatchSet</code> into a <code>Rule</code> or delete one from a <code>Rule</code> (see <a>UpdateRule</a>), and delete a <code>RegexMatchSet</code> from AWS WAF (see <a>DeleteRegexMatchSet</a>).</p><p><code>RegexMatchSetId</code> is returned by <a>CreateRegexMatchSet</a> and by <a>ListRegexMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexMatchSetId;

/**
 <p>Contains an array of <a>RegexMatchTuple</a> objects. Each <code>RegexMatchTuple</code> object contains: </p><ul><li><p>The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the <code>User-Agent</code> header. </p></li><li><p>The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see <a>RegexPatternSet</a>.</p></li><li><p>Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRegexMatchTuple *> * _Nullable regexMatchTuples;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returned by <a>ListRegexMatchSets</a>. Each <code>RegexMatchSetSummary</code> object includes the <code>Name</code> and <code>RegexMatchSetId</code> for one <a>RegexMatchSet</a>.</p>
 Required parameters: [RegexMatchSetId, Name]
 */
@interface AWSwaf-regionalRegexMatchSetSummary : AWSModel


/**
 <p>A friendly name or description of the <a>RegexMatchSet</a>. You can't change <code>Name</code> after you create a <code>RegexMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The <code>RegexMatchSetId</code> for a <code>RegexMatchSet</code>. You use <code>RegexMatchSetId</code> to get information about a <code>RegexMatchSet</code>, update a <code>RegexMatchSet</code>, remove a <code>RegexMatchSet</code> from a <code>Rule</code>, and delete a <code>RegexMatchSet</code> from AWS WAF.</p><p><code>RegexMatchSetId</code> is returned by <a>CreateRegexMatchSet</a> and by <a>ListRegexMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexMatchSetId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>In an <a>UpdateRegexMatchSet</a> request, <code>RegexMatchSetUpdate</code> specifies whether to insert or delete a <a>RegexMatchTuple</a> and includes the settings for the <code>RegexMatchTuple</code>.</p>
 Required parameters: [Action, RegexMatchTuple]
 */
@interface AWSwaf-regionalRegexMatchSetUpdate : AWSModel


/**
 <p>Specifies whether to insert or delete a <a>RegexMatchTuple</a>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>Information about the part of a web request that you want AWS WAF to inspect and the identifier of the regular expression (regex) pattern that you want AWS WAF to search for. If you specify <code>DELETE</code> for the value of <code>Action</code>, the <code>RegexMatchTuple</code> values must exactly match the values in the <code>RegexMatchTuple</code> that you want to delete from the <code>RegexMatchSet</code>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalRegexMatchTuple * _Nullable regexMatchTuple;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The regular expression pattern that you want AWS WAF to search for in web requests, the location in requests that you want AWS WAF to search, and other settings. Each <code>RegexMatchTuple</code> object contains: </p><ul><li><p>The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the <code>User-Agent</code> header. </p></li><li><p>The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see <a>RegexPatternSet</a>. </p></li><li><p>Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.</p></li></ul>
 Required parameters: [FieldToMatch, TextTransformation, RegexPatternSetId]
 */
@interface AWSwaf-regionalRegexMatchTuple : AWSModel


/**
 <p>Specifies where in a web request to look for the <code>RegexPatternSet</code>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalFieldToMatch * _Nullable fieldToMatch;

/**
 <p>The <code>RegexPatternSetId</code> for a <code>RegexPatternSet</code>. You use <code>RegexPatternSetId</code> to get information about a <code>RegexPatternSet</code> (see <a>GetRegexPatternSet</a>), update a <code>RegexPatternSet</code> (see <a>UpdateRegexPatternSet</a>), insert a <code>RegexPatternSet</code> into a <code>RegexMatchSet</code> or delete one from a <code>RegexMatchSet</code> (see <a>UpdateRegexMatchSet</a>), and delete an <code>RegexPatternSet</code> from AWS WAF (see <a>DeleteRegexPatternSet</a>).</p><p><code>RegexPatternSetId</code> is returned by <a>CreateRegexPatternSet</a> and by <a>ListRegexPatternSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexPatternSetId;

/**
 <p>Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on <code>RegexPatternSet</code> before inspecting a request for a match.</p><p>You can only specify a single type of TextTransformation.</p><p><b>CMD_LINE</b></p><p>When you're concerned that attackers are injecting an operating system commandline command and using unusual formatting to disguise some or all of the command, use this option to perform the following transformations:</p><ul><li><p>Delete the following characters: \ " ' ^</p></li><li><p>Delete spaces before the following characters: / (</p></li><li><p>Replace the following characters with a space: , ;</p></li><li><p>Replace multiple spaces with one space</p></li><li><p>Convert uppercase letters (A-Z) to lowercase (a-z)</p></li></ul><p><b>COMPRESS_WHITE_SPACE</b></p><p>Use this option to replace the following characters with a space character (decimal 32):</p><ul><li><p>\f, formfeed, decimal 12</p></li><li><p>\t, tab, decimal 9</p></li><li><p>\n, newline, decimal 10</p></li><li><p>\r, carriage return, decimal 13</p></li><li><p>\v, vertical tab, decimal 11</p></li><li><p>non-breaking space, decimal 160</p></li></ul><p><code>COMPRESS_WHITE_SPACE</code> also replaces multiple spaces with one space.</p><p><b>HTML_ENTITY_DECODE</b></p><p>Use this option to replace HTML-encoded characters with unencoded characters. <code>HTML_ENTITY_DECODE</code> performs the following operations:</p><ul><li><p>Replaces <code>(ampersand)quot;</code> with <code>"</code></p></li><li><p>Replaces <code>(ampersand)nbsp;</code> with a non-breaking space, decimal 160</p></li><li><p>Replaces <code>(ampersand)lt;</code> with a "less than" symbol</p></li><li><p>Replaces <code>(ampersand)gt;</code> with <code>&gt;</code></p></li><li><p>Replaces characters that are represented in hexadecimal format, <code>(ampersand)#xhhhh;</code>, with the corresponding characters</p></li><li><p>Replaces characters that are represented in decimal format, <code>(ampersand)#nnnn;</code>, with the corresponding characters</p></li></ul><p><b>LOWERCASE</b></p><p>Use this option to convert uppercase letters (A-Z) to lowercase (a-z).</p><p><b>URL_DECODE</b></p><p>Use this option to decode a URL-encoded value.</p><p><b>NONE</b></p><p>Specify <code>NONE</code> if you don't want to perform any text transformations.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalTextTransformation textTransformation;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The <code>RegexPatternSet</code> specifies the regular expression (regex) pattern that you want AWS WAF to search for, such as <code>B[a@]dB[o0]t</code>. You can then configure AWS WAF to reject those requests.</p>
 Required parameters: [RegexPatternSetId, RegexPatternStrings]
 */
@interface AWSwaf-regionalRegexPatternSet : AWSModel


/**
 <p>A friendly name or description of the <a>RegexPatternSet</a>. You can't change <code>Name</code> after you create a <code>RegexPatternSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The identifier for the <code>RegexPatternSet</code>. You use <code>RegexPatternSetId</code> to get information about a <code>RegexPatternSet</code>, update a <code>RegexPatternSet</code>, remove a <code>RegexPatternSet</code> from a <code>RegexMatchSet</code>, and delete a <code>RegexPatternSet</code> from AWS WAF.</p><p><code>RegexMatchSetId</code> is returned by <a>CreateRegexPatternSet</a> and by <a>ListRegexPatternSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexPatternSetId;

/**
 <p>Specifies the regular expression (regex) patterns that you want AWS WAF to search for, such as <code>B[a@]dB[o0]t</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regexPatternStrings;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Returned by <a>ListRegexPatternSets</a>. Each <code>RegexPatternSetSummary</code> object includes the <code>Name</code> and <code>RegexPatternSetId</code> for one <a>RegexPatternSet</a>.</p>
 Required parameters: [RegexPatternSetId, Name]
 */
@interface AWSwaf-regionalRegexPatternSetSummary : AWSModel


/**
 <p>A friendly name or description of the <a>RegexPatternSet</a>. You can't change <code>Name</code> after you create a <code>RegexPatternSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The <code>RegexPatternSetId</code> for a <code>RegexPatternSet</code>. You use <code>RegexPatternSetId</code> to get information about a <code>RegexPatternSet</code>, update a <code>RegexPatternSet</code>, remove a <code>RegexPatternSet</code> from a <code>RegexMatchSet</code>, and delete a <code>RegexPatternSet</code> from AWS WAF.</p><p><code>RegexPatternSetId</code> is returned by <a>CreateRegexPatternSet</a> and by <a>ListRegexPatternSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexPatternSetId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>In an <a>UpdateRegexPatternSet</a> request, <code>RegexPatternSetUpdate</code> specifies whether to insert or delete a <code>RegexPatternString</code> and includes the settings for the <code>RegexPatternString</code>.</p>
 Required parameters: [Action, RegexPatternString]
 */
@interface AWSwaf-regionalRegexPatternSetUpdate : AWSModel


/**
 <p>Specifies whether to insert or delete a <code>RegexPatternString</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>Specifies the regular expression (regex) pattern that you want AWS WAF to search for, such as <code>B[a@]dB[o0]t</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexPatternString;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>A combination of <a>ByteMatchSet</a>, <a>IPSet</a>, and/or <a>SqlInjectionMatchSet</a> objects that identify the web requests that you want to allow, block, or count. For example, you might create a <code>Rule</code> that includes the following predicates:</p><ul><li><p>An <code>IPSet</code> that causes AWS WAF to search for web requests that originate from the IP address <code>192.0.2.44</code></p></li><li><p>A <code>ByteMatchSet</code> that causes AWS WAF to search for web requests for which the value of the <code>User-Agent</code> header is <code>BadBot</code>.</p></li></ul><p>To match the settings in this <code>Rule</code>, a request must originate from <code>192.0.2.44</code> AND include a <code>User-Agent</code> header for which the value is <code>BadBot</code>.</p>
 Required parameters: [RuleId, Predicates]
 */
@interface AWSwaf-regionalRule : AWSModel


/**
 <p>A friendly name or description for the metrics for this <code>Rule</code>. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change <code>MetricName</code> after you create the <code>Rule</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The friendly name or description for the <code>Rule</code>. You can't change the name of a <code>Rule</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The <code>Predicates</code> object contains one <code>Predicate</code> element for each <a>ByteMatchSet</a>, <a>IPSet</a>, or <a>SqlInjectionMatchSet</a> object that you want to include in a <code>Rule</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalPredicate *> * _Nullable predicates;

/**
 <p>A unique identifier for a <code>Rule</code>. You use <code>RuleId</code> to get more information about a <code>Rule</code> (see <a>GetRule</a>), update a <code>Rule</code> (see <a>UpdateRule</a>), insert a <code>Rule</code> into a <code>WebACL</code> or delete a one from a <code>WebACL</code> (see <a>UpdateWebACL</a>), or delete a <code>Rule</code> from AWS WAF (see <a>DeleteRule</a>).</p><p><code>RuleId</code> is returned by <a>CreateRule</a> and by <a>ListRules</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>A collection of predefined rules that you can add to a web ACL.</p><p>Rule groups are subject to the following limits:</p><ul><li><p>Three rule groups per account. You can request an increase to this limit by contacting customer support.</p></li><li><p>One rule group per web ACL.</p></li><li><p>Ten rules per rule group.</p></li></ul>
 Required parameters: [RuleGroupId]
 */
@interface AWSwaf-regionalRuleGroup : AWSModel


/**
 <p>A friendly name or description for the metrics for this <code>RuleGroup</code>. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the <code>RuleGroup</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The friendly name or description for the <code>RuleGroup</code>. You can't change the name of a <code>RuleGroup</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a <code>RuleGroup</code>. You use <code>RuleGroupId</code> to get more information about a <code>RuleGroup</code> (see <a>GetRuleGroup</a>), update a <code>RuleGroup</code> (see <a>UpdateRuleGroup</a>), insert a <code>RuleGroup</code> into a <code>WebACL</code> or delete a one from a <code>WebACL</code> (see <a>UpdateWebACL</a>), or delete a <code>RuleGroup</code> from AWS WAF (see <a>DeleteRuleGroup</a>).</p><p><code>RuleGroupId</code> is returned by <a>CreateRuleGroup</a> and by <a>ListRuleGroups</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleGroupId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Contains the identifier and the friendly name or description of the <code>RuleGroup</code>.</p>
 Required parameters: [RuleGroupId, Name]
 */
@interface AWSwaf-regionalRuleGroupSummary : AWSModel


/**
 <p>A friendly name or description of the <a>RuleGroup</a>. You can't change the name of a <code>RuleGroup</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a <code>RuleGroup</code>. You use <code>RuleGroupId</code> to get more information about a <code>RuleGroup</code> (see <a>GetRuleGroup</a>), update a <code>RuleGroup</code> (see <a>UpdateRuleGroup</a>), insert a <code>RuleGroup</code> into a <code>WebACL</code> or delete one from a <code>WebACL</code> (see <a>UpdateWebACL</a>), or delete a <code>RuleGroup</code> from AWS WAF (see <a>DeleteRuleGroup</a>).</p><p><code>RuleGroupId</code> is returned by <a>CreateRuleGroup</a> and by <a>ListRuleGroups</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleGroupId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies an <code>ActivatedRule</code> and indicates whether you want to add it to a <code>RuleGroup</code> or delete it from a <code>RuleGroup</code>.</p>
 Required parameters: [Action, ActivatedRule]
 */
@interface AWSwaf-regionalRuleGroupUpdate : AWSModel


/**
 <p>Specify <code>INSERT</code> to add an <code>ActivatedRule</code> to a <code>RuleGroup</code>. Use <code>DELETE</code> to remove an <code>ActivatedRule</code> from a <code>RuleGroup</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>The <code>ActivatedRule</code> object specifies a <code>Rule</code> that you want to insert or delete, the priority of the <code>Rule</code> in the <code>WebACL</code>, and the action that you want AWS WAF to take when a web request matches the <code>Rule</code> (<code>ALLOW</code>, <code>BLOCK</code>, or <code>COUNT</code>).</p>
 */
@property (nonatomic, strong) AWSwaf-regionalActivatedRule * _Nullable activatedRule;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Contains the identifier and the friendly name or description of the <code>Rule</code>.</p>
 Required parameters: [RuleId, Name]
 */
@interface AWSwaf-regionalRuleSummary : AWSModel


/**
 <p>A friendly name or description of the <a>Rule</a>. You can't change the name of a <code>Rule</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a <code>Rule</code>. You use <code>RuleId</code> to get more information about a <code>Rule</code> (see <a>GetRule</a>), update a <code>Rule</code> (see <a>UpdateRule</a>), insert a <code>Rule</code> into a <code>WebACL</code> or delete one from a <code>WebACL</code> (see <a>UpdateWebACL</a>), or delete a <code>Rule</code> from AWS WAF (see <a>DeleteRule</a>).</p><p><code>RuleId</code> is returned by <a>CreateRule</a> and by <a>ListRules</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies a <code>Predicate</code> (such as an <code>IPSet</code>) and indicates whether you want to add it to a <code>Rule</code> or delete it from a <code>Rule</code>.</p>
 Required parameters: [Action, Predicate]
 */
@interface AWSwaf-regionalRuleUpdate : AWSModel


/**
 <p>Specify <code>INSERT</code> to add a <code>Predicate</code> to a <code>Rule</code>. Use <code>DELETE</code> to remove a <code>Predicate</code> from a <code>Rule</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>The ID of the <code>Predicate</code> (such as an <code>IPSet</code>) that you want to add to a <code>Rule</code>.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalPredicate * _Nullable predicate;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The response from a <a>GetSampledRequests</a> request includes a <code>SampledHTTPRequests</code> complex type that appears as <code>SampledRequests</code> in the response syntax. <code>SampledHTTPRequests</code> contains one <code>SampledHTTPRequest</code> object for each web request that is returned by <code>GetSampledRequests</code>.</p>
 Required parameters: [Request, Weight]
 */
@interface AWSwaf-regionalSampledHTTPRequest : AWSModel


/**
 <p>The action for the <code>Rule</code> that the request matched: <code>ALLOW</code>, <code>BLOCK</code>, or <code>COUNT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable action;

/**
 <p>A complex type that contains detailed information about the request.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalHTTPRequest * _Nullable request;

/**
 <p>This value is returned if the <code>GetSampledRequests</code> request specifies the ID of a <code>RuleGroup</code> rather than the ID of an individual rule. <code>RuleWithinRuleGroup</code> is the rule within the specified <code>RuleGroup</code> that matched the request listed in the response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleWithinRuleGroup;

/**
 <p>The time at which AWS WAF received the request from your AWS resource, in Unix time format (in seconds).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>A value that indicates how one result in the response relates proportionally to other results in the response. A result that has a weight of <code>2</code> represents roughly twice as many CloudFront web requests as a result that has a weight of <code>1</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable weight;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies a constraint on the size of a part of the web request. AWS WAF uses the <code>Size</code>, <code>ComparisonOperator</code>, and <code>FieldToMatch</code> to build an expression in the form of "<code>Size</code><code>ComparisonOperator</code> size in bytes of <code>FieldToMatch</code>". If that expression is true, the <code>SizeConstraint</code> is considered to match.</p>
 Required parameters: [FieldToMatch, TextTransformation, ComparisonOperator, Size]
 */
@interface AWSwaf-regionalSizeConstraint : AWSModel


/**
 <p>The type of comparison you want AWS WAF to perform. AWS WAF uses this in combination with the provided <code>Size</code> and <code>FieldToMatch</code> to build an expression in the form of "<code>Size</code><code>ComparisonOperator</code> size in bytes of <code>FieldToMatch</code>". If that expression is true, the <code>SizeConstraint</code> is considered to match.</p><p><b>EQ</b>: Used to test if the <code>Size</code> is equal to the size of the <code>FieldToMatch</code></p><p><b>NE</b>: Used to test if the <code>Size</code> is not equal to the size of the <code>FieldToMatch</code></p><p><b>LE</b>: Used to test if the <code>Size</code> is less than or equal to the size of the <code>FieldToMatch</code></p><p><b>LT</b>: Used to test if the <code>Size</code> is strictly less than the size of the <code>FieldToMatch</code></p><p><b>GE</b>: Used to test if the <code>Size</code> is greater than or equal to the size of the <code>FieldToMatch</code></p><p><b>GT</b>: Used to test if the <code>Size</code> is strictly greater than the size of the <code>FieldToMatch</code></p>
 */
@property (nonatomic, assign) AWSwaf-regionalComparisonOperator comparisonOperator;

/**
 <p>Specifies where in a web request to look for the size constraint.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalFieldToMatch * _Nullable fieldToMatch;

/**
 <p>The size in bytes that you want AWS WAF to compare against the size of the specified <code>FieldToMatch</code>. AWS WAF uses this in combination with <code>ComparisonOperator</code> and <code>FieldToMatch</code> to build an expression in the form of "<code>Size</code><code>ComparisonOperator</code> size in bytes of <code>FieldToMatch</code>". If that expression is true, the <code>SizeConstraint</code> is considered to match.</p><p>Valid values for size are 0 - 21474836480 bytes (0 - 20 GB).</p><p>If you specify <code>URI</code> for the value of <code>Type</code>, the / in the URI counts as one character. For example, the URI <code>/logo.jpg</code> is nine characters long.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable size;

/**
 <p>Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on <code>FieldToMatch</code> before inspecting it for a match.</p><p>You can only specify a single type of TextTransformation.</p><p>Note that if you choose <code>BODY</code> for the value of <code>Type</code>, you must choose <code>NONE</code> for <code>TextTransformation</code> because CloudFront forwards only the first 8192 bytes for inspection. </p><p><b>NONE</b></p><p>Specify <code>NONE</code> if you don't want to perform any text transformations.</p><p><b>CMD_LINE</b></p><p>When you're concerned that attackers are injecting an operating system command line command and using unusual formatting to disguise some or all of the command, use this option to perform the following transformations:</p><ul><li><p>Delete the following characters: \ " ' ^</p></li><li><p>Delete spaces before the following characters: / (</p></li><li><p>Replace the following characters with a space: , ;</p></li><li><p>Replace multiple spaces with one space</p></li><li><p>Convert uppercase letters (A-Z) to lowercase (a-z)</p></li></ul><p><b>COMPRESS_WHITE_SPACE</b></p><p>Use this option to replace the following characters with a space character (decimal 32):</p><ul><li><p>\f, formfeed, decimal 12</p></li><li><p>\t, tab, decimal 9</p></li><li><p>\n, newline, decimal 10</p></li><li><p>\r, carriage return, decimal 13</p></li><li><p>\v, vertical tab, decimal 11</p></li><li><p>non-breaking space, decimal 160</p></li></ul><p><code>COMPRESS_WHITE_SPACE</code> also replaces multiple spaces with one space.</p><p><b>HTML_ENTITY_DECODE</b></p><p>Use this option to replace HTML-encoded characters with unencoded characters. <code>HTML_ENTITY_DECODE</code> performs the following operations:</p><ul><li><p>Replaces <code>(ampersand)quot;</code> with <code>"</code></p></li><li><p>Replaces <code>(ampersand)nbsp;</code> with a non-breaking space, decimal 160</p></li><li><p>Replaces <code>(ampersand)lt;</code> with a "less than" symbol</p></li><li><p>Replaces <code>(ampersand)gt;</code> with <code>&gt;</code></p></li><li><p>Replaces characters that are represented in hexadecimal format, <code>(ampersand)#xhhhh;</code>, with the corresponding characters</p></li><li><p>Replaces characters that are represented in decimal format, <code>(ampersand)#nnnn;</code>, with the corresponding characters</p></li></ul><p><b>LOWERCASE</b></p><p>Use this option to convert uppercase letters (A-Z) to lowercase (a-z).</p><p><b>URL_DECODE</b></p><p>Use this option to decode a URL-encoded value.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalTextTransformation textTransformation;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>A complex type that contains <code>SizeConstraint</code> objects, which specify the parts of web requests that you want AWS WAF to inspect the size of. If a <code>SizeConstraintSet</code> contains more than one <code>SizeConstraint</code> object, a request only needs to match one constraint to be considered a match.</p>
 Required parameters: [SizeConstraintSetId, SizeConstraints]
 */
@interface AWSwaf-regionalSizeConstraintSet : AWSModel


/**
 <p>The name, if any, of the <code>SizeConstraintSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a <code>SizeConstraintSet</code>. You use <code>SizeConstraintSetId</code> to get information about a <code>SizeConstraintSet</code> (see <a>GetSizeConstraintSet</a>), update a <code>SizeConstraintSet</code> (see <a>UpdateSizeConstraintSet</a>), insert a <code>SizeConstraintSet</code> into a <code>Rule</code> or delete one from a <code>Rule</code> (see <a>UpdateRule</a>), and delete a <code>SizeConstraintSet</code> from AWS WAF (see <a>DeleteSizeConstraintSet</a>).</p><p><code>SizeConstraintSetId</code> is returned by <a>CreateSizeConstraintSet</a> and by <a>ListSizeConstraintSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sizeConstraintSetId;

/**
 <p>Specifies the parts of web requests that you want to inspect the size of.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalSizeConstraint *> * _Nullable sizeConstraints;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The <code>Id</code> and <code>Name</code> of a <code>SizeConstraintSet</code>.</p>
 Required parameters: [SizeConstraintSetId, Name]
 */
@interface AWSwaf-regionalSizeConstraintSetSummary : AWSModel


/**
 <p>The name of the <code>SizeConstraintSet</code>, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a <code>SizeConstraintSet</code>. You use <code>SizeConstraintSetId</code> to get information about a <code>SizeConstraintSet</code> (see <a>GetSizeConstraintSet</a>), update a <code>SizeConstraintSet</code> (see <a>UpdateSizeConstraintSet</a>), insert a <code>SizeConstraintSet</code> into a <code>Rule</code> or delete one from a <code>Rule</code> (see <a>UpdateRule</a>), and delete a <code>SizeConstraintSet</code> from AWS WAF (see <a>DeleteSizeConstraintSet</a>).</p><p><code>SizeConstraintSetId</code> is returned by <a>CreateSizeConstraintSet</a> and by <a>ListSizeConstraintSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sizeConstraintSetId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies the part of a web request that you want to inspect the size of and indicates whether you want to add the specification to a <a>SizeConstraintSet</a> or delete it from a <code>SizeConstraintSet</code>.</p>
 Required parameters: [Action, SizeConstraint]
 */
@interface AWSwaf-regionalSizeConstraintSetUpdate : AWSModel


/**
 <p>Specify <code>INSERT</code> to add a <a>SizeConstraintSetUpdate</a> to a <a>SizeConstraintSet</a>. Use <code>DELETE</code> to remove a <code>SizeConstraintSetUpdate</code> from a <code>SizeConstraintSet</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>Specifies a constraint on the size of a part of the web request. AWS WAF uses the <code>Size</code>, <code>ComparisonOperator</code>, and <code>FieldToMatch</code> to build an expression in the form of "<code>Size</code><code>ComparisonOperator</code> size in bytes of <code>FieldToMatch</code>". If that expression is true, the <code>SizeConstraint</code> is considered to match.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalSizeConstraint * _Nullable sizeConstraint;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>A complex type that contains <code>SqlInjectionMatchTuple</code> objects, which specify the parts of web requests that you want AWS WAF to inspect for snippets of malicious SQL code and, if you want AWS WAF to inspect a header, the name of the header. If a <code>SqlInjectionMatchSet</code> contains more than one <code>SqlInjectionMatchTuple</code> object, a request needs to include snippets of SQL code in only one of the specified parts of the request to be considered a match.</p>
 Required parameters: [SqlInjectionMatchSetId, SqlInjectionMatchTuples]
 */
@interface AWSwaf-regionalSqlInjectionMatchSet : AWSModel


/**
 <p>The name, if any, of the <code>SqlInjectionMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a <code>SqlInjectionMatchSet</code>. You use <code>SqlInjectionMatchSetId</code> to get information about a <code>SqlInjectionMatchSet</code> (see <a>GetSqlInjectionMatchSet</a>), update a <code>SqlInjectionMatchSet</code> (see <a>UpdateSqlInjectionMatchSet</a>), insert a <code>SqlInjectionMatchSet</code> into a <code>Rule</code> or delete one from a <code>Rule</code> (see <a>UpdateRule</a>), and delete a <code>SqlInjectionMatchSet</code> from AWS WAF (see <a>DeleteSqlInjectionMatchSet</a>).</p><p><code>SqlInjectionMatchSetId</code> is returned by <a>CreateSqlInjectionMatchSet</a> and by <a>ListSqlInjectionMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sqlInjectionMatchSetId;

/**
 <p>Specifies the parts of web requests that you want to inspect for snippets of malicious SQL code.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalSqlInjectionMatchTuple *> * _Nullable sqlInjectionMatchTuples;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The <code>Id</code> and <code>Name</code> of a <code>SqlInjectionMatchSet</code>.</p>
 Required parameters: [SqlInjectionMatchSetId, Name]
 */
@interface AWSwaf-regionalSqlInjectionMatchSetSummary : AWSModel


/**
 <p>The name of the <code>SqlInjectionMatchSet</code>, if any, specified by <code>Id</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a <code>SqlInjectionMatchSet</code>. You use <code>SqlInjectionMatchSetId</code> to get information about a <code>SqlInjectionMatchSet</code> (see <a>GetSqlInjectionMatchSet</a>), update a <code>SqlInjectionMatchSet</code> (see <a>UpdateSqlInjectionMatchSet</a>), insert a <code>SqlInjectionMatchSet</code> into a <code>Rule</code> or delete one from a <code>Rule</code> (see <a>UpdateRule</a>), and delete a <code>SqlInjectionMatchSet</code> from AWS WAF (see <a>DeleteSqlInjectionMatchSet</a>).</p><p><code>SqlInjectionMatchSetId</code> is returned by <a>CreateSqlInjectionMatchSet</a> and by <a>ListSqlInjectionMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sqlInjectionMatchSetId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies the part of a web request that you want to inspect for snippets of malicious SQL code and indicates whether you want to add the specification to a <a>SqlInjectionMatchSet</a> or delete it from a <code>SqlInjectionMatchSet</code>.</p>
 Required parameters: [Action, SqlInjectionMatchTuple]
 */
@interface AWSwaf-regionalSqlInjectionMatchSetUpdate : AWSModel


/**
 <p>Specify <code>INSERT</code> to add a <a>SqlInjectionMatchSetUpdate</a> to a <a>SqlInjectionMatchSet</a>. Use <code>DELETE</code> to remove a <code>SqlInjectionMatchSetUpdate</code> from a <code>SqlInjectionMatchSet</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>Specifies the part of a web request that you want AWS WAF to inspect for snippets of malicious SQL code and, if you want AWS WAF to inspect a header, the name of the header.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalSqlInjectionMatchTuple * _Nullable sqlInjectionMatchTuple;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies the part of a web request that you want AWS WAF to inspect for snippets of malicious SQL code and, if you want AWS WAF to inspect a header, the name of the header.</p>
 Required parameters: [FieldToMatch, TextTransformation]
 */
@interface AWSwaf-regionalSqlInjectionMatchTuple : AWSModel


/**
 <p>Specifies where in a web request to look for snippets of malicious SQL code.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalFieldToMatch * _Nullable fieldToMatch;

/**
 <p>Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on <code>FieldToMatch</code> before inspecting it for a match.</p><p>You can only specify a single type of TextTransformation.</p><p><b>CMD_LINE</b></p><p>When you're concerned that attackers are injecting an operating system command line command and using unusual formatting to disguise some or all of the command, use this option to perform the following transformations:</p><ul><li><p>Delete the following characters: \ " ' ^</p></li><li><p>Delete spaces before the following characters: / (</p></li><li><p>Replace the following characters with a space: , ;</p></li><li><p>Replace multiple spaces with one space</p></li><li><p>Convert uppercase letters (A-Z) to lowercase (a-z)</p></li></ul><p><b>COMPRESS_WHITE_SPACE</b></p><p>Use this option to replace the following characters with a space character (decimal 32):</p><ul><li><p>\f, formfeed, decimal 12</p></li><li><p>\t, tab, decimal 9</p></li><li><p>\n, newline, decimal 10</p></li><li><p>\r, carriage return, decimal 13</p></li><li><p>\v, vertical tab, decimal 11</p></li><li><p>non-breaking space, decimal 160</p></li></ul><p><code>COMPRESS_WHITE_SPACE</code> also replaces multiple spaces with one space.</p><p><b>HTML_ENTITY_DECODE</b></p><p>Use this option to replace HTML-encoded characters with unencoded characters. <code>HTML_ENTITY_DECODE</code> performs the following operations:</p><ul><li><p>Replaces <code>(ampersand)quot;</code> with <code>"</code></p></li><li><p>Replaces <code>(ampersand)nbsp;</code> with a non-breaking space, decimal 160</p></li><li><p>Replaces <code>(ampersand)lt;</code> with a "less than" symbol</p></li><li><p>Replaces <code>(ampersand)gt;</code> with <code>&gt;</code></p></li><li><p>Replaces characters that are represented in hexadecimal format, <code>(ampersand)#xhhhh;</code>, with the corresponding characters</p></li><li><p>Replaces characters that are represented in decimal format, <code>(ampersand)#nnnn;</code>, with the corresponding characters</p></li></ul><p><b>LOWERCASE</b></p><p>Use this option to convert uppercase letters (A-Z) to lowercase (a-z).</p><p><b>URL_DECODE</b></p><p>Use this option to decode a URL-encoded value.</p><p><b>NONE</b></p><p>Specify <code>NONE</code> if you don't want to perform any text transformations.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalTextTransformation textTransformation;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>A summary of the rule groups you are subscribed to.</p>
 Required parameters: [RuleGroupId, Name, MetricName]
 */
@interface AWSwaf-regionalSubscribedRuleGroupSummary : AWSModel


/**
 <p>A friendly name or description for the metrics for this <code>RuleGroup</code>. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change the name of the metric after you create the <code>RuleGroup</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>A friendly name or description of the <code>RuleGroup</code>. You can't change the name of a <code>RuleGroup</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a <code>RuleGroup</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleGroupId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>A tag associated with an AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.</p><p>Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. </p>
 Required parameters: [Key, Value]
 */
@interface AWSwaf-regionalTag : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Information for a tag associated with an AWS resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each AWS resource, up to 50 tags for a resource.</p><p>Tagging is only available through the API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules. </p>
 */
@interface AWSwaf-regionalTagInfoForResource : AWSModel


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalTag *> * _Nullable tagList;

@end

/**
 
 */
@interface AWSwaf-regionalTagResourceRequest : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSwaf-regionalTagResourceResponse : AWSModel


@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>In a <a>GetSampledRequests</a> request, the <code>StartTime</code> and <code>EndTime</code> objects specify the time range for which you want AWS WAF to return a sample of web requests.</p><p>You must specify the times in Coordinated Universal Time (UTC) format. UTC format includes the special designator, <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>. </p><p>In a <a>GetSampledRequests</a> response, the <code>StartTime</code> and <code>EndTime</code> objects specify the time range for which AWS WAF actually returned a sample of web requests. AWS WAF gets the specified number of requests from among the first 5,000 requests that your AWS resource receives during the specified time period. If your resource receives more than 5,000 requests during that period, AWS WAF stops sampling after the 5,000th request. In that case, <code>EndTime</code> is the time that AWS WAF received the 5,000th request. </p>
 Required parameters: [StartTime, EndTime]
 */
@interface AWSwaf-regionalTimeWindow : AWSModel


/**
 <p>The end of the time range from which you want <code>GetSampledRequests</code> to return a sample of the requests that your AWS resource received. You must specify the date and time in Coordinated Universal Time (UTC) format. UTC format includes the special designator, <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>. You can specify any time range in the previous three hours.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 <p>The beginning of the time range from which you want <code>GetSampledRequests</code> to return a sample of the requests that your AWS resource received. You must specify the date and time in Coordinated Universal Time (UTC) format. UTC format includes the special designator, <code>Z</code>. For example, <code>"2016-09-27T14:50Z"</code>. You can specify any time range in the previous three hours.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

@end

/**
 
 */
@interface AWSwaf-regionalUntagResourceRequest : AWSRequest


/**
 <p/>
 */
@property (nonatomic, strong) NSString * _Nullable resourceARN;

/**
 <p/>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSwaf-regionalUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSwaf-regionalUpdateByteMatchSetRequest : AWSRequest


/**
 <p>The <code>ByteMatchSetId</code> of the <a>ByteMatchSet</a> that you want to update. <code>ByteMatchSetId</code> is returned by <a>CreateByteMatchSet</a> and by <a>ListByteMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable byteMatchSetId;

/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>An array of <code>ByteMatchSetUpdate</code> objects that you want to insert into or delete from a <a>ByteMatchSet</a>. For more information, see the applicable data types:</p><ul><li><p><a>ByteMatchSetUpdate</a>: Contains <code>Action</code> and <code>ByteMatchTuple</code></p></li><li><p><a>ByteMatchTuple</a>: Contains <code>FieldToMatch</code>, <code>PositionalConstraint</code>, <code>TargetString</code>, and <code>TextTransformation</code></p></li><li><p><a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalByteMatchSetUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateByteMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateByteMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateGeoMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>GeoMatchSetId</code> of the <a>GeoMatchSet</a> that you want to update. <code>GeoMatchSetId</code> is returned by <a>CreateGeoMatchSet</a> and by <a>ListGeoMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geoMatchSetId;

/**
 <p>An array of <code>GeoMatchSetUpdate</code> objects that you want to insert into or delete from an <a>GeoMatchSet</a>. For more information, see the applicable data types:</p><ul><li><p><a>GeoMatchSetUpdate</a>: Contains <code>Action</code> and <code>GeoMatchConstraint</code></p></li><li><p><a>GeoMatchConstraint</a>: Contains <code>Type</code> and <code>Value</code></p><p>You can have only one <code>Type</code> and <code>Value</code> per <code>GeoMatchConstraint</code>. To add multiple countries, include multiple <code>GeoMatchSetUpdate</code> objects in your request.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalGeoMatchSetUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateGeoMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateGeoMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateIPSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>IPSetId</code> of the <a>IPSet</a> that you want to update. <code>IPSetId</code> is returned by <a>CreateIPSet</a> and by <a>ListIPSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable IPSetId;

/**
 <p>An array of <code>IPSetUpdate</code> objects that you want to insert into or delete from an <a>IPSet</a>. For more information, see the applicable data types:</p><ul><li><p><a>IPSetUpdate</a>: Contains <code>Action</code> and <code>IPSetDescriptor</code></p></li><li><p><a>IPSetDescriptor</a>: Contains <code>Type</code> and <code>Value</code></p></li></ul><p>You can insert a maximum of 1000 addresses in a single request.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalIPSetUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateIPSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateIPSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateRateBasedRuleRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The maximum number of requests, which have an identical value in the field specified by the <code>RateKey</code>, allowed in a five-minute period. If the number of requests exceeds the <code>RateLimit</code> and the other predicates specified in the rule are also met, AWS WAF triggers the action that is specified for this rule.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rateLimit;

/**
 <p>The <code>RuleId</code> of the <code>RateBasedRule</code> that you want to update. <code>RuleId</code> is returned by <code>CreateRateBasedRule</code> and by <a>ListRateBasedRules</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>An array of <code>RuleUpdate</code> objects that you want to insert into or delete from a <a>RateBasedRule</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRuleUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateRateBasedRuleResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateRateBasedRule</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateRegexMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>RegexMatchSetId</code> of the <a>RegexMatchSet</a> that you want to update. <code>RegexMatchSetId</code> is returned by <a>CreateRegexMatchSet</a> and by <a>ListRegexMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexMatchSetId;

/**
 <p>An array of <code>RegexMatchSetUpdate</code> objects that you want to insert into or delete from a <a>RegexMatchSet</a>. For more information, see <a>RegexMatchTuple</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRegexMatchSetUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateRegexMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateRegexMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateRegexPatternSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>RegexPatternSetId</code> of the <a>RegexPatternSet</a> that you want to update. <code>RegexPatternSetId</code> is returned by <a>CreateRegexPatternSet</a> and by <a>ListRegexPatternSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable regexPatternSetId;

/**
 <p>An array of <code>RegexPatternSetUpdate</code> objects that you want to insert into or delete from a <a>RegexPatternSet</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRegexPatternSetUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateRegexPatternSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateRegexPatternSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateRuleGroupRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>RuleGroupId</code> of the <a>RuleGroup</a> that you want to update. <code>RuleGroupId</code> is returned by <a>CreateRuleGroup</a> and by <a>ListRuleGroups</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleGroupId;

/**
 <p>An array of <code>RuleGroupUpdate</code> objects that you want to insert into or delete from a <a>RuleGroup</a>.</p><p>You can only insert <code>REGULAR</code> rules into a rule group.</p><p><code>ActivatedRule|OverrideAction</code> applies only when updating or adding a <code>RuleGroup</code> to a <code>WebACL</code>. In this case you do not use <code>ActivatedRule|Action</code>. For all other update requests, <code>ActivatedRule|Action</code> is used instead of <code>ActivatedRule|OverrideAction</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRuleGroupUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateRuleGroupResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateRuleGroup</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateRuleRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>RuleId</code> of the <code>Rule</code> that you want to update. <code>RuleId</code> is returned by <code>CreateRule</code> and by <a>ListRules</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleId;

/**
 <p>An array of <code>RuleUpdate</code> objects that you want to insert into or delete from a <a>Rule</a>. For more information, see the applicable data types:</p><ul><li><p><a>RuleUpdate</a>: Contains <code>Action</code> and <code>Predicate</code></p></li><li><p><a>Predicate</a>: Contains <code>DataId</code>, <code>Negated</code>, and <code>Type</code></p></li><li><p><a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalRuleUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateRuleResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateRule</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateSizeConstraintSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>SizeConstraintSetId</code> of the <a>SizeConstraintSet</a> that you want to update. <code>SizeConstraintSetId</code> is returned by <a>CreateSizeConstraintSet</a> and by <a>ListSizeConstraintSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sizeConstraintSetId;

/**
 <p>An array of <code>SizeConstraintSetUpdate</code> objects that you want to insert into or delete from a <a>SizeConstraintSet</a>. For more information, see the applicable data types:</p><ul><li><p><a>SizeConstraintSetUpdate</a>: Contains <code>Action</code> and <code>SizeConstraint</code></p></li><li><p><a>SizeConstraint</a>: Contains <code>FieldToMatch</code>, <code>TextTransformation</code>, <code>ComparisonOperator</code>, and <code>Size</code></p></li><li><p><a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalSizeConstraintSetUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateSizeConstraintSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateSizeConstraintSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 <p>A request to update a <a>SqlInjectionMatchSet</a>.</p>
 Required parameters: [SqlInjectionMatchSetId, ChangeToken, Updates]
 */
@interface AWSwaf-regionalUpdateSqlInjectionMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>The <code>SqlInjectionMatchSetId</code> of the <code>SqlInjectionMatchSet</code> that you want to update. <code>SqlInjectionMatchSetId</code> is returned by <a>CreateSqlInjectionMatchSet</a> and by <a>ListSqlInjectionMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sqlInjectionMatchSetId;

/**
 <p>An array of <code>SqlInjectionMatchSetUpdate</code> objects that you want to insert into or delete from a <a>SqlInjectionMatchSet</a>. For more information, see the applicable data types:</p><ul><li><p><a>SqlInjectionMatchSetUpdate</a>: Contains <code>Action</code> and <code>SqlInjectionMatchTuple</code></p></li><li><p><a>SqlInjectionMatchTuple</a>: Contains <code>FieldToMatch</code> and <code>TextTransformation</code></p></li><li><p><a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalSqlInjectionMatchSetUpdate *> * _Nullable updates;

@end

/**
 <p>The response to an <a>UpdateSqlInjectionMatchSets</a> request.</p>
 */
@interface AWSwaf-regionalUpdateSqlInjectionMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateSqlInjectionMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateWebACLRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>A default action for the web ACL, either ALLOW or BLOCK. AWS WAF performs the default action if a request doesn't match the criteria in any of the rules in a web ACL.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalWafAction * _Nullable defaultAction;

/**
 <p>An array of updates to make to the <a>WebACL</a>.</p><p>An array of <code>WebACLUpdate</code> objects that you want to insert into or delete from a <a>WebACL</a>. For more information, see the applicable data types:</p><ul><li><p><a>WebACLUpdate</a>: Contains <code>Action</code> and <code>ActivatedRule</code></p></li><li><p><a>ActivatedRule</a>: Contains <code>Action</code>, <code>OverrideAction</code>, <code>Priority</code>, <code>RuleId</code>, and <code>Type</code>. <code>ActivatedRule|OverrideAction</code> applies only when updating or adding a <code>RuleGroup</code> to a <code>WebACL</code>. In this case, you do not use <code>ActivatedRule|Action</code>. For all other update requests, <code>ActivatedRule|Action</code> is used instead of <code>ActivatedRule|OverrideAction</code>. </p></li><li><p><a>WafAction</a>: Contains <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalWebACLUpdate *> * _Nullable updates;

/**
 <p>The <code>WebACLId</code> of the <a>WebACL</a> that you want to update. <code>WebACLId</code> is returned by <a>CreateWebACL</a> and by <a>ListWebACLs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 
 */
@interface AWSwaf-regionalUpdateWebACLResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateWebACL</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 <p>A request to update an <a>XssMatchSet</a>.</p>
 Required parameters: [XssMatchSetId, ChangeToken, Updates]
 */
@interface AWSwaf-regionalUpdateXssMatchSetRequest : AWSRequest


/**
 <p>The value returned by the most recent call to <a>GetChangeToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

/**
 <p>An array of <code>XssMatchSetUpdate</code> objects that you want to insert into or delete from an <a>XssMatchSet</a>. For more information, see the applicable data types:</p><ul><li><p><a>XssMatchSetUpdate</a>: Contains <code>Action</code> and <code>XssMatchTuple</code></p></li><li><p><a>XssMatchTuple</a>: Contains <code>FieldToMatch</code> and <code>TextTransformation</code></p></li><li><p><a>FieldToMatch</a>: Contains <code>Data</code> and <code>Type</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalXssMatchSetUpdate *> * _Nullable updates;

/**
 <p>The <code>XssMatchSetId</code> of the <code>XssMatchSet</code> that you want to update. <code>XssMatchSetId</code> is returned by <a>CreateXssMatchSet</a> and by <a>ListXssMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable xssMatchSetId;

@end

/**
 <p>The response to an <a>UpdateXssMatchSets</a> request.</p>
 */
@interface AWSwaf-regionalUpdateXssMatchSetResponse : AWSModel


/**
 <p>The <code>ChangeToken</code> that you used to submit the <code>UpdateXssMatchSet</code> request. You can also use this value to query the status of the request. For more information, see <a>GetChangeTokenStatus</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable changeToken;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>For the action that is associated with a rule in a <code>WebACL</code>, specifies the action that you want AWS WAF to perform when a web request matches all of the conditions in a rule. For the default action in a <code>WebACL</code>, specifies the action that you want AWS WAF to take when a web request doesn't match all of the conditions in any of the rules in a <code>WebACL</code>. </p>
 Required parameters: [Type]
 */
@interface AWSwaf-regionalWafAction : AWSModel


/**
 <p>Specifies how you want AWS WAF to respond to requests that match the settings in a <code>Rule</code>. Valid settings include the following:</p><ul><li><p><code>ALLOW</code>: AWS WAF allows requests</p></li><li><p><code>BLOCK</code>: AWS WAF blocks requests</p></li><li><p><code>COUNT</code>: AWS WAF increments a counter of the requests that match all of the conditions in the rule. AWS WAF then continues to inspect the web request based on the remaining rules in the web ACL. You can't specify <code>COUNT</code> for the default action for a <code>WebACL</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSwaf-regionalWafActionType types;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The action to take if any rule within the <code>RuleGroup</code> matches a request. </p>
 Required parameters: [Type]
 */
@interface AWSwaf-regionalWafOverrideAction : AWSModel


/**
 <p><code>COUNT</code> overrides the action specified by the individual rule within a <code>RuleGroup</code> . If set to <code>NONE</code>, the rule's action will take place.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalWafOverrideActionType types;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Contains the <code>Rules</code> that identify the requests that you want to allow, block, or count. In a <code>WebACL</code>, you also specify a default action (<code>ALLOW</code> or <code>BLOCK</code>), and the action for each <code>Rule</code> that you add to a <code>WebACL</code>, for example, block requests from specified IP addresses or block requests from specified referrers. You also associate the <code>WebACL</code> with a CloudFront distribution to identify the requests that you want AWS WAF to filter. If you add more than one <code>Rule</code> to a <code>WebACL</code>, a request needs to match only one of the specifications to be allowed, blocked, or counted. For more information, see <a>UpdateWebACL</a>.</p>
 Required parameters: [WebACLId, DefaultAction, Rules]
 */
@interface AWSwaf-regionalWebACL : AWSModel


/**
 <p>The action to perform if none of the <code>Rules</code> contained in the <code>WebACL</code> match. The action is specified by the <a>WafAction</a> object.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalWafAction * _Nullable defaultAction;

/**
 <p>A friendly name or description for the metrics for this <code>WebACL</code>. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You can't change <code>MetricName</code> after you create the <code>WebACL</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>A friendly name or description of the <code>WebACL</code>. You can't change the name of a <code>WebACL</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An array that contains the action for each <code>Rule</code> in a <code>WebACL</code>, the priority of the <code>Rule</code>, and the ID of the <code>Rule</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalActivatedRule *> * _Nullable rules;

/**
 <p>Tha Amazon Resource Name (ARN) of the web ACL.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLArn;

/**
 <p>A unique identifier for a <code>WebACL</code>. You use <code>WebACLId</code> to get information about a <code>WebACL</code> (see <a>GetWebACL</a>), update a <code>WebACL</code> (see <a>UpdateWebACL</a>), and delete a <code>WebACL</code> from AWS WAF (see <a>DeleteWebACL</a>).</p><p><code>WebACLId</code> is returned by <a>CreateWebACL</a> and by <a>ListWebACLs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Contains the identifier and the name or description of the <a>WebACL</a>.</p>
 Required parameters: [WebACLId, Name]
 */
@interface AWSwaf-regionalWebACLSummary : AWSModel


/**
 <p>A friendly name or description of the <a>WebACL</a>. You can't change the name of a <code>WebACL</code> after you create it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a <code>WebACL</code>. You use <code>WebACLId</code> to get information about a <code>WebACL</code> (see <a>GetWebACL</a>), update a <code>WebACL</code> (see <a>UpdateWebACL</a>), and delete a <code>WebACL</code> from AWS WAF (see <a>DeleteWebACL</a>).</p><p><code>WebACLId</code> is returned by <a>CreateWebACL</a> and by <a>ListWebACLs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable webACLId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies whether to insert a <code>Rule</code> into or delete a <code>Rule</code> from a <code>WebACL</code>.</p>
 Required parameters: [Action, ActivatedRule]
 */
@interface AWSwaf-regionalWebACLUpdate : AWSModel


/**
 <p>Specifies whether to insert a <code>Rule</code> into or delete a <code>Rule</code> from a <code>WebACL</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>The <code>ActivatedRule</code> object in an <a>UpdateWebACL</a> request specifies a <code>Rule</code> that you want to insert or delete, the priority of the <code>Rule</code> in the <code>WebACL</code>, and the action that you want AWS WAF to take when a web request matches the <code>Rule</code> (<code>ALLOW</code>, <code>BLOCK</code>, or <code>COUNT</code>).</p>
 */
@property (nonatomic, strong) AWSwaf-regionalActivatedRule * _Nullable activatedRule;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>A complex type that contains <code>XssMatchTuple</code> objects, which specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks and, if you want AWS WAF to inspect a header, the name of the header. If a <code>XssMatchSet</code> contains more than one <code>XssMatchTuple</code> object, a request needs to include cross-site scripting attacks in only one of the specified parts of the request to be considered a match.</p>
 Required parameters: [XssMatchSetId, XssMatchTuples]
 */
@interface AWSwaf-regionalXssMatchSet : AWSModel


/**
 <p>The name, if any, of the <code>XssMatchSet</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for an <code>XssMatchSet</code>. You use <code>XssMatchSetId</code> to get information about an <code>XssMatchSet</code> (see <a>GetXssMatchSet</a>), update an <code>XssMatchSet</code> (see <a>UpdateXssMatchSet</a>), insert an <code>XssMatchSet</code> into a <code>Rule</code> or delete one from a <code>Rule</code> (see <a>UpdateRule</a>), and delete an <code>XssMatchSet</code> from AWS WAF (see <a>DeleteXssMatchSet</a>).</p><p><code>XssMatchSetId</code> is returned by <a>CreateXssMatchSet</a> and by <a>ListXssMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable xssMatchSetId;

/**
 <p>Specifies the parts of web requests that you want to inspect for cross-site scripting attacks.</p>
 */
@property (nonatomic, strong) NSArray<AWSwaf-regionalXssMatchTuple *> * _Nullable xssMatchTuples;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>The <code>Id</code> and <code>Name</code> of an <code>XssMatchSet</code>.</p>
 Required parameters: [XssMatchSetId, Name]
 */
@interface AWSwaf-regionalXssMatchSetSummary : AWSModel


/**
 <p>The name of the <code>XssMatchSet</code>, if any, specified by <code>Id</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for an <code>XssMatchSet</code>. You use <code>XssMatchSetId</code> to get information about a <code>XssMatchSet</code> (see <a>GetXssMatchSet</a>), update an <code>XssMatchSet</code> (see <a>UpdateXssMatchSet</a>), insert an <code>XssMatchSet</code> into a <code>Rule</code> or delete one from a <code>Rule</code> (see <a>UpdateRule</a>), and delete an <code>XssMatchSet</code> from AWS WAF (see <a>DeleteXssMatchSet</a>).</p><p><code>XssMatchSetId</code> is returned by <a>CreateXssMatchSet</a> and by <a>ListXssMatchSets</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable xssMatchSetId;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies the part of a web request that you want to inspect for cross-site scripting attacks and indicates whether you want to add the specification to an <a>XssMatchSet</a> or delete it from an <code>XssMatchSet</code>.</p>
 Required parameters: [Action, XssMatchTuple]
 */
@interface AWSwaf-regionalXssMatchSetUpdate : AWSModel


/**
 <p>Specify <code>INSERT</code> to add an <a>XssMatchSetUpdate</a> to an <a>XssMatchSet</a>. Use <code>DELETE</code> to remove an <code>XssMatchSetUpdate</code> from an <code>XssMatchSet</code>.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalChangeAction action;

/**
 <p>Specifies the part of a web request that you want AWS WAF to inspect for cross-site scripting attacks and, if you want AWS WAF to inspect a header, the name of the header.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalXssMatchTuple * _Nullable xssMatchTuple;

@end

/**
 <note><p>This is <b>AWS WAF Classic</b> documentation. For more information, see <a href="https://docs.aws.amazon.com/waf/latest/developerguide/classic-waf-chapter.html">AWS WAF Classic</a> in the developer guide.</p><p><b>For the latest version of AWS WAF</b>, use the AWS WAFV2 API and see the <a href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">AWS WAF Developer Guide</a>. With the latest version, AWS WAF has a single set of endpoints for regional and global use. </p></note><p>Specifies the part of a web request that you want AWS WAF to inspect for cross-site scripting attacks and, if you want AWS WAF to inspect a header, the name of the header.</p>
 Required parameters: [FieldToMatch, TextTransformation]
 */
@interface AWSwaf-regionalXssMatchTuple : AWSModel


/**
 <p>Specifies where in a web request to look for cross-site scripting attacks.</p>
 */
@property (nonatomic, strong) AWSwaf-regionalFieldToMatch * _Nullable fieldToMatch;

/**
 <p>Text transformations eliminate some of the unusual formatting that attackers use in web requests in an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on <code>FieldToMatch</code> before inspecting it for a match.</p><p>You can only specify a single type of TextTransformation.</p><p><b>CMD_LINE</b></p><p>When you're concerned that attackers are injecting an operating system command line command and using unusual formatting to disguise some or all of the command, use this option to perform the following transformations:</p><ul><li><p>Delete the following characters: \ " ' ^</p></li><li><p>Delete spaces before the following characters: / (</p></li><li><p>Replace the following characters with a space: , ;</p></li><li><p>Replace multiple spaces with one space</p></li><li><p>Convert uppercase letters (A-Z) to lowercase (a-z)</p></li></ul><p><b>COMPRESS_WHITE_SPACE</b></p><p>Use this option to replace the following characters with a space character (decimal 32):</p><ul><li><p>\f, formfeed, decimal 12</p></li><li><p>\t, tab, decimal 9</p></li><li><p>\n, newline, decimal 10</p></li><li><p>\r, carriage return, decimal 13</p></li><li><p>\v, vertical tab, decimal 11</p></li><li><p>non-breaking space, decimal 160</p></li></ul><p><code>COMPRESS_WHITE_SPACE</code> also replaces multiple spaces with one space.</p><p><b>HTML_ENTITY_DECODE</b></p><p>Use this option to replace HTML-encoded characters with unencoded characters. <code>HTML_ENTITY_DECODE</code> performs the following operations:</p><ul><li><p>Replaces <code>(ampersand)quot;</code> with <code>"</code></p></li><li><p>Replaces <code>(ampersand)nbsp;</code> with a non-breaking space, decimal 160</p></li><li><p>Replaces <code>(ampersand)lt;</code> with a "less than" symbol</p></li><li><p>Replaces <code>(ampersand)gt;</code> with <code>&gt;</code></p></li><li><p>Replaces characters that are represented in hexadecimal format, <code>(ampersand)#xhhhh;</code>, with the corresponding characters</p></li><li><p>Replaces characters that are represented in decimal format, <code>(ampersand)#nnnn;</code>, with the corresponding characters</p></li></ul><p><b>LOWERCASE</b></p><p>Use this option to convert uppercase letters (A-Z) to lowercase (a-z).</p><p><b>URL_DECODE</b></p><p>Use this option to decode a URL-encoded value.</p><p><b>NONE</b></p><p>Specify <code>NONE</code> if you don't want to perform any text transformations.</p>
 */
@property (nonatomic, assign) AWSwaf-regionalTextTransformation textTransformation;

@end

NS_ASSUME_NONNULL_END
