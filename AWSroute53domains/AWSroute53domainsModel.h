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

FOUNDATION_EXPORT NSString *const AWSroute53domainsErrorDomain;

typedef NS_ENUM(NSInteger, AWSroute53domainsErrorType) {
    AWSroute53domainsErrorUnknown,
    AWSroute53domainsErrorDomainLimitExceeded,
    AWSroute53domainsErrorDuplicateRequest,
    AWSroute53domainsErrorInvalidInput,
    AWSroute53domainsErrorOperationLimitExceeded,
    AWSroute53domainsErrorTLDRulesViolation,
    AWSroute53domainsErrorUnsupportedTLD,
};

typedef NS_ENUM(NSInteger, AWSroute53domainsContactType) {
    AWSroute53domainsContactTypeUnknown,
    AWSroute53domainsContactTypePerson,
    AWSroute53domainsContactTypeCompany,
    AWSroute53domainsContactTypeAssociation,
    AWSroute53domainsContactTypePublicBody,
    AWSroute53domainsContactTypeReseller,
};

typedef NS_ENUM(NSInteger, AWSroute53domainsCountryCode) {
    AWSroute53domainsCountryCodeUnknown,
    AWSroute53domainsCountryCodeAd,
    AWSroute53domainsCountryCodeAe,
    AWSroute53domainsCountryCodeAf,
    AWSroute53domainsCountryCodeAg,
    AWSroute53domainsCountryCodeAi,
    AWSroute53domainsCountryCodeAl,
    AWSroute53domainsCountryCodeAm,
    AWSroute53domainsCountryCodeAn,
    AWSroute53domainsCountryCodeAo,
    AWSroute53domainsCountryCodeAq,
    AWSroute53domainsCountryCodeAr,
    AWSroute53domainsCountryCodeAs,
    AWSroute53domainsCountryCodeAt,
    AWSroute53domainsCountryCodeAu,
    AWSroute53domainsCountryCodeAw,
    AWSroute53domainsCountryCodeAz,
    AWSroute53domainsCountryCodeBa,
    AWSroute53domainsCountryCodeBb,
    AWSroute53domainsCountryCodeBd,
    AWSroute53domainsCountryCodeBe,
    AWSroute53domainsCountryCodeBf,
    AWSroute53domainsCountryCodeBg,
    AWSroute53domainsCountryCodeBh,
    AWSroute53domainsCountryCodeBi,
    AWSroute53domainsCountryCodeBj,
    AWSroute53domainsCountryCodeBl,
    AWSroute53domainsCountryCodeBm,
    AWSroute53domainsCountryCodeBn,
    AWSroute53domainsCountryCodeBo,
    AWSroute53domainsCountryCodeBr,
    AWSroute53domainsCountryCodeBs,
    AWSroute53domainsCountryCodeBt,
    AWSroute53domainsCountryCodeBw,
    AWSroute53domainsCountryCodeBy,
    AWSroute53domainsCountryCodeBz,
    AWSroute53domainsCountryCodeCa,
    AWSroute53domainsCountryCodeCc,
    AWSroute53domainsCountryCodeCd,
    AWSroute53domainsCountryCodeCf,
    AWSroute53domainsCountryCodeCg,
    AWSroute53domainsCountryCodeCh,
    AWSroute53domainsCountryCodeCi,
    AWSroute53domainsCountryCodeCk,
    AWSroute53domainsCountryCodeCl,
    AWSroute53domainsCountryCodeCm,
    AWSroute53domainsCountryCodeCn,
    AWSroute53domainsCountryCodeCo,
    AWSroute53domainsCountryCodeCr,
    AWSroute53domainsCountryCodeCu,
    AWSroute53domainsCountryCodeCv,
    AWSroute53domainsCountryCodeCx,
    AWSroute53domainsCountryCodeCy,
    AWSroute53domainsCountryCodeCz,
    AWSroute53domainsCountryCodeDe,
    AWSroute53domainsCountryCodeDj,
    AWSroute53domainsCountryCodeDk,
    AWSroute53domainsCountryCodeDm,
    AWSroute53domainsCountryCodeDo,
    AWSroute53domainsCountryCodeDz,
    AWSroute53domainsCountryCodeEc,
    AWSroute53domainsCountryCodeEe,
    AWSroute53domainsCountryCodeEg,
    AWSroute53domainsCountryCodeEr,
    AWSroute53domainsCountryCodeEs,
    AWSroute53domainsCountryCodeEt,
    AWSroute53domainsCountryCodeFi,
    AWSroute53domainsCountryCodeFj,
    AWSroute53domainsCountryCodeFk,
    AWSroute53domainsCountryCodeFm,
    AWSroute53domainsCountryCodeFo,
    AWSroute53domainsCountryCodeFr,
    AWSroute53domainsCountryCodeGa,
    AWSroute53domainsCountryCodeGb,
    AWSroute53domainsCountryCodeGd,
    AWSroute53domainsCountryCodeGE,
    AWSroute53domainsCountryCodeGh,
    AWSroute53domainsCountryCodeGi,
    AWSroute53domainsCountryCodeGl,
    AWSroute53domainsCountryCodeGm,
    AWSroute53domainsCountryCodeGn,
    AWSroute53domainsCountryCodeGq,
    AWSroute53domainsCountryCodeGr,
    AWSroute53domainsCountryCodeGT,
    AWSroute53domainsCountryCodeGu,
    AWSroute53domainsCountryCodeGw,
    AWSroute53domainsCountryCodeGy,
    AWSroute53domainsCountryCodeHk,
    AWSroute53domainsCountryCodeHn,
    AWSroute53domainsCountryCodeHr,
    AWSroute53domainsCountryCodeHt,
    AWSroute53domainsCountryCodeHu,
    AWSroute53domainsCountryCodeId,
    AWSroute53domainsCountryCodeIe,
    AWSroute53domainsCountryCodeIl,
    AWSroute53domainsCountryCodeIm,
    AWSroute53domainsCountryCodeIN,
    AWSroute53domainsCountryCodeIq,
    AWSroute53domainsCountryCodeIr,
    AWSroute53domainsCountryCodeIs,
    AWSroute53domainsCountryCodeIt,
    AWSroute53domainsCountryCodeJm,
    AWSroute53domainsCountryCodeJo,
    AWSroute53domainsCountryCodeJp,
    AWSroute53domainsCountryCodeKe,
    AWSroute53domainsCountryCodeKg,
    AWSroute53domainsCountryCodeKh,
    AWSroute53domainsCountryCodeKi,
    AWSroute53domainsCountryCodeKm,
    AWSroute53domainsCountryCodeKn,
    AWSroute53domainsCountryCodeKp,
    AWSroute53domainsCountryCodeKr,
    AWSroute53domainsCountryCodeKw,
    AWSroute53domainsCountryCodeKy,
    AWSroute53domainsCountryCodeKz,
    AWSroute53domainsCountryCodeLa,
    AWSroute53domainsCountryCodeLb,
    AWSroute53domainsCountryCodeLc,
    AWSroute53domainsCountryCodeLi,
    AWSroute53domainsCountryCodeLk,
    AWSroute53domainsCountryCodeLr,
    AWSroute53domainsCountryCodeLs,
    AWSroute53domainsCountryCodeLT,
    AWSroute53domainsCountryCodeLu,
    AWSroute53domainsCountryCodeLv,
    AWSroute53domainsCountryCodeLy,
    AWSroute53domainsCountryCodeMa,
    AWSroute53domainsCountryCodeMc,
    AWSroute53domainsCountryCodeMd,
    AWSroute53domainsCountryCodeMe,
    AWSroute53domainsCountryCodeMf,
    AWSroute53domainsCountryCodeMg,
    AWSroute53domainsCountryCodeMh,
    AWSroute53domainsCountryCodeMk,
    AWSroute53domainsCountryCodeMl,
    AWSroute53domainsCountryCodeMm,
    AWSroute53domainsCountryCodeMn,
    AWSroute53domainsCountryCodeMo,
    AWSroute53domainsCountryCodeMp,
    AWSroute53domainsCountryCodeMr,
    AWSroute53domainsCountryCodeMs,
    AWSroute53domainsCountryCodeMt,
    AWSroute53domainsCountryCodeMu,
    AWSroute53domainsCountryCodeMv,
    AWSroute53domainsCountryCodeMw,
    AWSroute53domainsCountryCodeMx,
    AWSroute53domainsCountryCodeMy,
    AWSroute53domainsCountryCodeMz,
    AWSroute53domainsCountryCodeNa,
    AWSroute53domainsCountryCodeNc,
    AWSroute53domainsCountryCodeNE,
    AWSroute53domainsCountryCodeNg,
    AWSroute53domainsCountryCodeNi,
    AWSroute53domainsCountryCodeNl,
    AWSroute53domainsCountryCodeNo,
    AWSroute53domainsCountryCodeNp,
    AWSroute53domainsCountryCodeNr,
    AWSroute53domainsCountryCodeNu,
    AWSroute53domainsCountryCodeNz,
    AWSroute53domainsCountryCodeOm,
    AWSroute53domainsCountryCodePa,
    AWSroute53domainsCountryCodePe,
    AWSroute53domainsCountryCodePf,
    AWSroute53domainsCountryCodePg,
    AWSroute53domainsCountryCodePh,
    AWSroute53domainsCountryCodePk,
    AWSroute53domainsCountryCodePl,
    AWSroute53domainsCountryCodePm,
    AWSroute53domainsCountryCodePn,
    AWSroute53domainsCountryCodePr,
    AWSroute53domainsCountryCodePt,
    AWSroute53domainsCountryCodePw,
    AWSroute53domainsCountryCodePy,
    AWSroute53domainsCountryCodeQa,
    AWSroute53domainsCountryCodeRo,
    AWSroute53domainsCountryCodeRs,
    AWSroute53domainsCountryCodeRu,
    AWSroute53domainsCountryCodeRw,
    AWSroute53domainsCountryCodeSa,
    AWSroute53domainsCountryCodeSb,
    AWSroute53domainsCountryCodeSc,
    AWSroute53domainsCountryCodeSd,
    AWSroute53domainsCountryCodeSe,
    AWSroute53domainsCountryCodeSg,
    AWSroute53domainsCountryCodeSh,
    AWSroute53domainsCountryCodeSi,
    AWSroute53domainsCountryCodeSk,
    AWSroute53domainsCountryCodeSl,
    AWSroute53domainsCountryCodeSm,
    AWSroute53domainsCountryCodeSn,
    AWSroute53domainsCountryCodeSo,
    AWSroute53domainsCountryCodeSr,
    AWSroute53domainsCountryCodeSt,
    AWSroute53domainsCountryCodeSv,
    AWSroute53domainsCountryCodeSy,
    AWSroute53domainsCountryCodeSz,
    AWSroute53domainsCountryCodeTc,
    AWSroute53domainsCountryCodeTd,
    AWSroute53domainsCountryCodeTg,
    AWSroute53domainsCountryCodeTh,
    AWSroute53domainsCountryCodeTj,
    AWSroute53domainsCountryCodeTk,
    AWSroute53domainsCountryCodeTl,
    AWSroute53domainsCountryCodeTm,
    AWSroute53domainsCountryCodeTn,
    AWSroute53domainsCountryCodeTo,
    AWSroute53domainsCountryCodeTr,
    AWSroute53domainsCountryCodeTt,
    AWSroute53domainsCountryCodeTv,
    AWSroute53domainsCountryCodeTw,
    AWSroute53domainsCountryCodeTz,
    AWSroute53domainsCountryCodeUa,
    AWSroute53domainsCountryCodeUg,
    AWSroute53domainsCountryCodeUs,
    AWSroute53domainsCountryCodeUy,
    AWSroute53domainsCountryCodeUz,
    AWSroute53domainsCountryCodeVa,
    AWSroute53domainsCountryCodeVc,
    AWSroute53domainsCountryCodeVe,
    AWSroute53domainsCountryCodeVg,
    AWSroute53domainsCountryCodeVi,
    AWSroute53domainsCountryCodeVn,
    AWSroute53domainsCountryCodeVu,
    AWSroute53domainsCountryCodeWf,
    AWSroute53domainsCountryCodeWs,
    AWSroute53domainsCountryCodeYe,
    AWSroute53domainsCountryCodeYt,
    AWSroute53domainsCountryCodeZa,
    AWSroute53domainsCountryCodeZm,
    AWSroute53domainsCountryCodeZw,
};

typedef NS_ENUM(NSInteger, AWSroute53domainsDomainAvailability) {
    AWSroute53domainsDomainAvailabilityUnknown,
    AWSroute53domainsDomainAvailabilityAvailable,
    AWSroute53domainsDomainAvailabilityAvailableReserved,
    AWSroute53domainsDomainAvailabilityAvailablePreorder,
    AWSroute53domainsDomainAvailabilityUnavailable,
    AWSroute53domainsDomainAvailabilityUnavailablePremium,
    AWSroute53domainsDomainAvailabilityUnavailableRestricted,
    AWSroute53domainsDomainAvailabilityReserved,
    AWSroute53domainsDomainAvailabilityDontKnow,
};

typedef NS_ENUM(NSInteger, AWSroute53domainsExtraParamName) {
    AWSroute53domainsExtraParamNameUnknown,
    AWSroute53domainsExtraParamNameDunsNumber,
    AWSroute53domainsExtraParamNameBrandNumber,
    AWSroute53domainsExtraParamNameBirthDepartment,
    AWSroute53domainsExtraParamNameBirthDateInYyyyMmDd,
    AWSroute53domainsExtraParamNameBirthCountry,
    AWSroute53domainsExtraParamNameBirthCity,
    AWSroute53domainsExtraParamNameDocumentNumber,
    AWSroute53domainsExtraParamNameAuIdNumber,
    AWSroute53domainsExtraParamNameAuIdType,
    AWSroute53domainsExtraParamNameCaLegalType,
    AWSroute53domainsExtraParamNameCaBusinessEntityType,
    AWSroute53domainsExtraParamNameCaLegalRepresentative,
    AWSroute53domainsExtraParamNameCaLegalRepresentativeCapacity,
    AWSroute53domainsExtraParamNameEsIdentification,
    AWSroute53domainsExtraParamNameEsIdentificationType,
    AWSroute53domainsExtraParamNameEsLegalForm,
    AWSroute53domainsExtraParamNameFiBusinessNumber,
    AWSroute53domainsExtraParamNameFiIdNumber,
    AWSroute53domainsExtraParamNameFiNationality,
    AWSroute53domainsExtraParamNameFiOrganizationType,
    AWSroute53domainsExtraParamNameItNationality,
    AWSroute53domainsExtraParamNameItPin,
    AWSroute53domainsExtraParamNameItRegistrantEntityType,
    AWSroute53domainsExtraParamNameRuPassportData,
    AWSroute53domainsExtraParamNameSeIdNumber,
    AWSroute53domainsExtraParamNameSgIdNumber,
    AWSroute53domainsExtraParamNameVatNumber,
    AWSroute53domainsExtraParamNameUkContactType,
    AWSroute53domainsExtraParamNameUkCompanyNumber,
};

typedef NS_ENUM(NSInteger, AWSroute53domainsOperationStatus) {
    AWSroute53domainsOperationStatusUnknown,
    AWSroute53domainsOperationStatusSubmitted,
    AWSroute53domainsOperationStatusInProgress,
    AWSroute53domainsOperationStatusError,
    AWSroute53domainsOperationStatusSuccessful,
    AWSroute53domainsOperationStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSroute53domainsOperationType) {
    AWSroute53domainsOperationTypeUnknown,
    AWSroute53domainsOperationTypeRegisterDomain,
    AWSroute53domainsOperationTypeDeleteDomain,
    AWSroute53domainsOperationTypeTransferInDomain,
    AWSroute53domainsOperationTypeUpdateDomainContact,
    AWSroute53domainsOperationTypeUpdateNameserver,
    AWSroute53domainsOperationTypeChangePrivacyProtection,
    AWSroute53domainsOperationTypeDomainLock,
    AWSroute53domainsOperationTypeEnableAutorenew,
    AWSroute53domainsOperationTypeDisableAutorenew,
    AWSroute53domainsOperationTypeAddDnssec,
    AWSroute53domainsOperationTypeRemoveDnssec,
    AWSroute53domainsOperationTypeExpireDomain,
    AWSroute53domainsOperationTypeTransferOutDomain,
    AWSroute53domainsOperationTypeChangeDomainOwner,
    AWSroute53domainsOperationTypeRenewDomain,
    AWSroute53domainsOperationTypePushDomain,
    AWSroute53domainsOperationTypeInternalTransferOutDomain,
    AWSroute53domainsOperationTypeInternalTransferInDomain,
};

typedef NS_ENUM(NSInteger, AWSroute53domainsReachabilityStatus) {
    AWSroute53domainsReachabilityStatusUnknown,
    AWSroute53domainsReachabilityStatusPending,
    AWSroute53domainsReachabilityStatusDone,
    AWSroute53domainsReachabilityStatusExpired,
};

typedef NS_ENUM(NSInteger, AWSroute53domainsTransferable) {
    AWSroute53domainsTransferableUnknown,
    AWSroute53domainsTransferableTransferable,
    AWSroute53domainsTransferableUntransferable,
    AWSroute53domainsTransferableDontKnow,
};

@class AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest;
@class AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse;
@class AWSroute53domainsBillingRecord;
@class AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest;
@class AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse;
@class AWSroute53domainsCheckDomainAvailabilityRequest;
@class AWSroute53domainsCheckDomainAvailabilityResponse;
@class AWSroute53domainsCheckDomainTransferabilityRequest;
@class AWSroute53domainsCheckDomainTransferabilityResponse;
@class AWSroute53domainsContactDetail;
@class AWSroute53domainsDeleteTagsForDomainRequest;
@class AWSroute53domainsDeleteTagsForDomainResponse;
@class AWSroute53domainsDisableDomainAutoRenewRequest;
@class AWSroute53domainsDisableDomainAutoRenewResponse;
@class AWSroute53domainsDisableDomainTransferLockRequest;
@class AWSroute53domainsDisableDomainTransferLockResponse;
@class AWSroute53domainsDomainSuggestion;
@class AWSroute53domainsDomainSummary;
@class AWSroute53domainsDomainTransferability;
@class AWSroute53domainsEnableDomainAutoRenewRequest;
@class AWSroute53domainsEnableDomainAutoRenewResponse;
@class AWSroute53domainsEnableDomainTransferLockRequest;
@class AWSroute53domainsEnableDomainTransferLockResponse;
@class AWSroute53domainsExtraParam;
@class AWSroute53domainsGetContactReachabilityStatusRequest;
@class AWSroute53domainsGetContactReachabilityStatusResponse;
@class AWSroute53domainsGetDomainDetailRequest;
@class AWSroute53domainsGetDomainDetailResponse;
@class AWSroute53domainsGetDomainSuggestionsRequest;
@class AWSroute53domainsGetDomainSuggestionsResponse;
@class AWSroute53domainsGetOperationDetailRequest;
@class AWSroute53domainsGetOperationDetailResponse;
@class AWSroute53domainsListDomainsRequest;
@class AWSroute53domainsListDomainsResponse;
@class AWSroute53domainsListOperationsRequest;
@class AWSroute53domainsListOperationsResponse;
@class AWSroute53domainsListTagsForDomainRequest;
@class AWSroute53domainsListTagsForDomainResponse;
@class AWSroute53domainsNameserver;
@class AWSroute53domainsOperationSummary;
@class AWSroute53domainsRegisterDomainRequest;
@class AWSroute53domainsRegisterDomainResponse;
@class AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest;
@class AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse;
@class AWSroute53domainsRenewDomainRequest;
@class AWSroute53domainsRenewDomainResponse;
@class AWSroute53domainsResendContactReachabilityEmailRequest;
@class AWSroute53domainsResendContactReachabilityEmailResponse;
@class AWSroute53domainsRetrieveDomainAuthCodeRequest;
@class AWSroute53domainsRetrieveDomainAuthCodeResponse;
@class AWSroute53domainsTag;
@class AWSroute53domainsTransferDomainRequest;
@class AWSroute53domainsTransferDomainResponse;
@class AWSroute53domainsTransferDomainToAnotherAwsAccountRequest;
@class AWSroute53domainsTransferDomainToAnotherAwsAccountResponse;
@class AWSroute53domainsUpdateDomainContactPrivacyRequest;
@class AWSroute53domainsUpdateDomainContactPrivacyResponse;
@class AWSroute53domainsUpdateDomainContactRequest;
@class AWSroute53domainsUpdateDomainContactResponse;
@class AWSroute53domainsUpdateDomainNameserversRequest;
@class AWSroute53domainsUpdateDomainNameserversResponse;
@class AWSroute53domainsUpdateTagsForDomainRequest;
@class AWSroute53domainsUpdateTagsForDomainResponse;
@class AWSroute53domainsViewBillingRequest;
@class AWSroute53domainsViewBillingResponse;

/**
 <p>The AcceptDomainTransferFromAnotherAwsAccount request includes the following elements.</p>
 Required parameters: [DomainName, Password]
 */
@interface AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest : AWSRequest


/**
 <p>The name of the domain that was specified when another AWS account submitted a <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a> request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The password that was returned by the <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a> request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

@end

/**
 <p>The AcceptDomainTransferFromAnotherAwsAccount response includes the following element.</p>
 */
@interface AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse : AWSModel


/**
 <p>Identifier for tracking the progress of the request. To query the operation status, use <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>Information for one billing record.</p>
 */
@interface AWSroute53domainsBillingRecord : AWSModel


/**
 <p>The date that the operation was billed, in Unix format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable billDate;

/**
 <p>The name of the domain that the billing record applies to. If the domain name contains characters other than a-z, 0-9, and - (hyphen), such as an internationalized domain name, then this value is in Punycode. For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html">DNS Domain Name Format</a> in the <i>Amazon Route 53 Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The ID of the invoice that is associated with the billing record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invoiceId;

/**
 <p>The operation that you were charged for.</p>
 */
@property (nonatomic, assign) AWSroute53domainsOperationType operation;

/**
 <p>The price that you were charged for the operation, in US dollars.</p><p>Example value: 12.0</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable price;

@end

/**
 <p>The CancelDomainTransferToAnotherAwsAccount request includes the following element.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest : AWSRequest


/**
 <p>The name of the domain for which you want to cancel the transfer to another AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The <code>CancelDomainTransferToAnotherAwsAccount</code> response includes the following element.</p>
 */
@interface AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse : AWSModel


/**
 <p>The identifier that <code>TransferDomainToAnotherAwsAccount</code> returned to track the progress of the request. Because the transfer request was canceled, the value is no longer valid, and you can't use <code>GetOperationDetail</code> to query the operation status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>The CheckDomainAvailability request contains the following elements.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsCheckDomainAvailabilityRequest : AWSRequest


/**
 <p>The name of the domain that you want to get availability for. The top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>The domain name can contain only the following characters:</p><ul><li><p>Letters a through z. Domain names are not case sensitive.</p></li><li><p>Numbers 0 through 9.</p></li><li><p>Hyphen (-). You can't specify a hyphen at the beginning or end of a label. </p></li><li><p>Period (.) to separate the labels in the name, such as the <code>.</code> in <code>example.com</code>.</p></li></ul><p>Internationalized domain names are not supported for some top-level domains. To determine whether the TLD that you want to use supports internationalized domain names, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a>. For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html#domain-name-format-idns">Formatting Internationalized Domain Names</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idnLangCode;

@end

/**
 <p>The CheckDomainAvailability response includes the following elements.</p>
 Required parameters: [Availability]
 */
@interface AWSroute53domainsCheckDomainAvailabilityResponse : AWSModel


/**
 <p>Whether the domain name is available for registering.</p><note><p>You can register only domains designated as <code>AVAILABLE</code>.</p></note><p>Valid values:</p><dl><dt>AVAILABLE</dt><dd><p>The domain name is available.</p></dd><dt>AVAILABLE_RESERVED</dt><dd><p>The domain name is reserved under specific conditions.</p></dd><dt>AVAILABLE_PREORDER</dt><dd><p>The domain name is available and can be preordered.</p></dd><dt>DONT_KNOW</dt><dd><p>The TLD registry didn't reply with a definitive answer about whether the domain name is available. Route 53 can return this response for a variety of reasons, for example, the registry is performing maintenance. Try again later.</p></dd><dt>PENDING</dt><dd><p>The TLD registry didn't return a response in the expected amount of time. When the response is delayed, it usually takes just a few extra seconds. You can resubmit the request immediately.</p></dd><dt>RESERVED</dt><dd><p>The domain name has been reserved for another person or organization.</p></dd><dt>UNAVAILABLE</dt><dd><p>The domain name is not available.</p></dd><dt>UNAVAILABLE_PREMIUM</dt><dd><p>The domain name is not available.</p></dd><dt>UNAVAILABLE_RESTRICTED</dt><dd><p>The domain name is forbidden.</p></dd></dl>
 */
@property (nonatomic, assign) AWSroute53domainsDomainAvailability availability;

@end

/**
 <p>The CheckDomainTransferability request contains the following elements.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsCheckDomainTransferabilityRequest : AWSRequest


/**
 <p>If the registrar for the top-level domain (TLD) requires an authorization code to transfer the domain, the code that you got from the current registrar for the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authCode;

/**
 <p>The name of the domain that you want to transfer to Route 53. The top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>The domain name can contain only the following characters:</p><ul><li><p>Letters a through z. Domain names are not case sensitive.</p></li><li><p>Numbers 0 through 9.</p></li><li><p>Hyphen (-). You can't specify a hyphen at the beginning or end of a label. </p></li><li><p>Period (.) to separate the labels in the name, such as the <code>.</code> in <code>example.com</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The CheckDomainTransferability response includes the following elements.</p>
 Required parameters: [Transferability]
 */
@interface AWSroute53domainsCheckDomainTransferabilityResponse : AWSModel


/**
 <p>A complex type that contains information about whether the specified domain can be transferred to Route 53.</p>
 */
@property (nonatomic, strong) AWSroute53domainsDomainTransferability * _Nullable transferability;

@end

/**
 <p>ContactDetail includes the following elements.</p>
 */
@interface AWSroute53domainsContactDetail : AWSModel


/**
 <p>First line of the contact's address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressLine1;

/**
 <p>Second line of contact's address, if any.</p>
 */
@property (nonatomic, strong) NSString * _Nullable addressLine2;

/**
 <p>The city of the contact's address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable city;

/**
 <p>Indicates whether the contact is a person, company, association, or public organization. Note the following:</p><ul><li><p>If you specify a value other than <code>PERSON</code>, you must also specify a value for <code>OrganizationName</code>.</p></li><li><p>For some TLDs, the privacy protection available depends on the value that you specify for <code>Contact Type</code>. For the privacy protection settings for your TLD, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i></p></li><li><p>For .es domains, if you specify <code>PERSON</code>, you must specify <code>INDIVIDUAL</code> for the value of <code>ES_LEGAL_FORM</code>.</p></li></ul>
 */
@property (nonatomic, assign) AWSroute53domainsContactType contactType;

/**
 <p>Code for the country of the contact's address.</p>
 */
@property (nonatomic, assign) AWSroute53domainsCountryCode countryCode;

/**
 <p>Email address of the contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>A list of name-value pairs for parameters required by certain top-level domains.</p>
 */
@property (nonatomic, strong) NSArray<AWSroute53domainsExtraParam *> * _Nullable extraParams;

/**
 <p>Fax number of the contact.</p><p>Constraints: Phone number must be specified in the format "+[country dialing code].[number including any area code]". For example, a US phone number might appear as <code>"+1.1234567890"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fax;

/**
 <p>First name of contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable firstName;

/**
 <p>Last name of contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastName;

/**
 <p>Name of the organization for contact types other than <code>PERSON</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationName;

/**
 <p>The phone number of the contact.</p><p>Constraints: Phone number must be specified in the format "+[country dialing code].[number including any area code&gt;]". For example, a US phone number might appear as <code>"+1.1234567890"</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable phoneNumber;

/**
 <p>The state or province of the contact's city.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The zip or postal code of the contact's address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable zipCode;

@end

/**
 <p>The DeleteTagsForDomainRequest includes the following elements.</p>
 Required parameters: [DomainName, TagsToDelete]
 */
@interface AWSroute53domainsDeleteTagsForDomainRequest : AWSRequest


/**
 <p>The domain for which you want to delete one or more tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>A list of tag keys to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagsToDelete;

@end

/**
 
 */
@interface AWSroute53domainsDeleteTagsForDomainResponse : AWSModel


@end

/**
 
 */
@interface AWSroute53domainsDisableDomainAutoRenewRequest : AWSRequest


/**
 <p>The name of the domain that you want to disable automatic renewal for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSroute53domainsDisableDomainAutoRenewResponse : AWSModel


@end

/**
 <p>The DisableDomainTransferLock request includes the following element.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsDisableDomainTransferLockRequest : AWSRequest


/**
 <p>The name of the domain that you want to remove the transfer lock for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The DisableDomainTransferLock response includes the following element.</p>
 Required parameters: [OperationId]
 */
@interface AWSroute53domainsDisableDomainTransferLockResponse : AWSModel


/**
 <p>Identifier for tracking the progress of the request. To query the operation status, use <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>Information about one suggested domain name.</p>
 */
@interface AWSroute53domainsDomainSuggestion : AWSModel


/**
 <p>Whether the domain name is available for registering.</p><note><p>You can register only the domains that are designated as <code>AVAILABLE</code>.</p></note><p>Valid values:</p><dl><dt>AVAILABLE</dt><dd><p>The domain name is available.</p></dd><dt>AVAILABLE_RESERVED</dt><dd><p>The domain name is reserved under specific conditions.</p></dd><dt>AVAILABLE_PREORDER</dt><dd><p>The domain name is available and can be preordered.</p></dd><dt>DONT_KNOW</dt><dd><p>The TLD registry didn't reply with a definitive answer about whether the domain name is available. Route 53 can return this response for a variety of reasons, for example, the registry is performing maintenance. Try again later.</p></dd><dt>PENDING</dt><dd><p>The TLD registry didn't return a response in the expected amount of time. When the response is delayed, it usually takes just a few extra seconds. You can resubmit the request immediately.</p></dd><dt>RESERVED</dt><dd><p>The domain name has been reserved for another person or organization.</p></dd><dt>UNAVAILABLE</dt><dd><p>The domain name is not available.</p></dd><dt>UNAVAILABLE_PREMIUM</dt><dd><p>The domain name is not available.</p></dd><dt>UNAVAILABLE_RESTRICTED</dt><dd><p>The domain name is forbidden.</p></dd></dl>
 */
@property (nonatomic, strong) NSString * _Nullable availability;

/**
 <p>A suggested domain name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>Summary information about one domain.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsDomainSummary : AWSModel


/**
 <p>Indicates whether the domain is automatically renewed upon expiration.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoRenew;

/**
 <p>The name of the domain that the summary information applies to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Expiration date of the domain in Unix time format and Coordinated Universal Time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiry;

/**
 <p>Indicates whether a domain is locked from unauthorized transfer to another party.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable transferLock;

@end

/**
 <p>A complex type that contains information about whether the specified domain can be transferred to Route 53.</p>
 */
@interface AWSroute53domainsDomainTransferability : AWSModel


/**
 <p>Whether the domain name can be transferred to Route 53.</p><note><p>You can transfer only domains that have a value of <code>TRANSFERABLE</code> for <code>Transferable</code>.</p></note><p>Valid values:</p><dl><dt>TRANSFERABLE</dt><dd><p>The domain name can be transferred to Route 53.</p></dd><dt>UNTRANSFERRABLE</dt><dd><p>The domain name can't be transferred to Route 53.</p></dd><dt>DONT_KNOW</dt><dd><p>Reserved for future use.</p></dd></dl>
 */
@property (nonatomic, assign) AWSroute53domainsTransferable transferable;

@end

/**
 
 */
@interface AWSroute53domainsEnableDomainAutoRenewRequest : AWSRequest


/**
 <p>The name of the domain that you want to enable automatic renewal for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSroute53domainsEnableDomainAutoRenewResponse : AWSModel


@end

/**
 <p>A request to set the transfer lock for the specified domain.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsEnableDomainTransferLockRequest : AWSRequest


/**
 <p>The name of the domain that you want to set the transfer lock for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The EnableDomainTransferLock response includes the following elements.</p>
 Required parameters: [OperationId]
 */
@interface AWSroute53domainsEnableDomainTransferLockResponse : AWSModel


/**
 <p>Identifier for tracking the progress of the request. To use this ID to query the operation status, use GetOperationDetail.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>ExtraParam includes the following elements.</p>
 Required parameters: [Name, Value]
 */
@interface AWSroute53domainsExtraParam : AWSModel


/**
 <p>The name of an additional parameter that is required by a top-level domain. Here are the top-level domains that require additional parameters and the names of the parameters that they require:</p><dl><dt>.com.au and .net.au</dt><dd><ul><li><p><code>AU_ID_NUMBER</code></p></li><li><p><code>AU_ID_TYPE</code></p><p>Valid values include the following:</p><ul><li><p><code>ABN</code> (Australian business number)</p></li><li><p><code>ACN</code> (Australian company number)</p></li><li><p><code>TM</code> (Trademark number)</p></li></ul></li></ul></dd><dt>.ca</dt><dd><ul><li><p><code>BRAND_NUMBER</code></p></li><li><p><code>CA_BUSINESS_ENTITY_TYPE</code></p><p>Valid values include the following:</p><ul><li><p><code>BANK</code> (Bank)</p></li><li><p><code>COMMERCIAL_COMPANY</code> (Commercial company)</p></li><li><p><code>COMPANY</code> (Company)</p></li><li><p><code>COOPERATION</code> (Cooperation)</p></li><li><p><code>COOPERATIVE</code> (Cooperative)</p></li><li><p><code>COOPRIX</code> (Cooprix)</p></li><li><p><code>CORP</code> (Corporation)</p></li><li><p><code>CREDIT_UNION</code> (Credit union)</p></li><li><p><code>FOMIA</code> (Federation of mutual insurance associations)</p></li><li><p><code>INC</code> (Incorporated)</p></li><li><p><code>LTD</code> (Limited)</p></li><li><p><code>LTEE</code> (Limitée)</p></li><li><p><code>LLC</code> (Limited liability corporation)</p></li><li><p><code>LLP</code> (Limited liability partnership)</p></li><li><p><code>LTE</code> (Lte.)</p></li><li><p><code>MBA</code> (Mutual benefit association)</p></li><li><p><code>MIC</code> (Mutual insurance company)</p></li><li><p><code>NFP</code> (Not-for-profit corporation)</p></li><li><p><code>SA</code> (S.A.)</p></li><li><p><code>SAVINGS_COMPANY</code> (Savings company)</p></li><li><p><code>SAVINGS_UNION</code> (Savings union)</p></li><li><p><code>SARL</code> (Société à responsabilité limitée)</p></li><li><p><code>TRUST</code> (Trust)</p></li><li><p><code>ULC</code> (Unlimited liability corporation)</p></li></ul></li><li><p><code>CA_LEGAL_TYPE</code></p><p>When <code>ContactType</code> is <code>PERSON</code>, valid values include the following:</p><ul><li><p><code>ABO</code> (Aboriginal Peoples indigenous to Canada)</p></li><li><p><code>CCT</code> (Canadian citizen)</p></li><li><p><code>LGR</code> (Legal Representative of a Canadian Citizen or Permanent Resident)</p></li><li><p><code>RES</code> (Permanent resident of Canada)</p></li></ul><p>When <code>ContactType</code> is a value other than <code>PERSON</code>, valid values include the following:</p><ul><li><p><code>ASS</code> (Canadian unincorporated association)</p></li><li><p><code>CCO</code> (Canadian corporation)</p></li><li><p><code>EDU</code> (Canadian educational institution)</p></li><li><p><code>GOV</code> (Government or government entity in Canada)</p></li><li><p><code>HOP</code> (Canadian Hospital)</p></li><li><p><code>INB</code> (Indian Band recognized by the Indian Act of Canada)</p></li><li><p><code>LAM</code> (Canadian Library, Archive, or Museum)</p></li><li><p><code>MAJ</code> (Her/His Majesty the Queen/King)</p></li><li><p><code>OMK</code> (Official mark registered in Canada)</p></li><li><p><code>PLT</code> (Canadian Political Party)</p></li><li><p><code>PRT</code> (Partnership Registered in Canada)</p></li><li><p><code>TDM</code> (Trademark registered in Canada)</p></li><li><p><code>TRD</code> (Canadian Trade Union)</p></li><li><p><code>TRS</code> (Trust established in Canada)</p></li></ul></li></ul></dd><dt>.es</dt><dd><ul><li><p><code>ES_IDENTIFICATION</code></p><p>Specify the applicable value:</p><ul><li><p><b>For contacts inside Spain:</b> Enter your passport ID.</p></li><li><p><b>For contacts outside of Spain:</b> Enter the VAT identification number for the company.</p><note><p>For .es domains, the value of <code>ContactType</code> must be <code>PERSON</code>.</p></note></li></ul></li><li><p><code>ES_IDENTIFICATION_TYPE</code></p><p>Valid values include the following:</p><ul><li><p><code>DNI_AND_NIF</code> (For Spanish contacts)</p></li><li><p><code>NIE</code> (For foreigners with legal residence)</p></li><li><p><code>OTHER</code> (For contacts outside of Spain)</p></li></ul></li><li><p><code>ES_LEGAL_FORM</code></p><p>Valid values include the following:</p><ul><li><p><code>ASSOCIATION</code></p></li><li><p><code>CENTRAL_GOVERNMENT_BODY</code></p></li><li><p><code>CIVIL_SOCIETY</code></p></li><li><p><code>COMMUNITY_OF_OWNERS</code></p></li><li><p><code>COMMUNITY_PROPERTY</code></p></li><li><p><code>CONSULATE</code></p></li><li><p><code>COOPERATIVE</code></p></li><li><p><code>DESIGNATION_OF_ORIGIN_SUPERVISORY_COUNCIL</code></p></li><li><p><code>ECONOMIC_INTEREST_GROUP</code></p></li><li><p><code>EMBASSY</code></p></li><li><p><code>ENTITY_MANAGING_NATURAL_AREAS</code></p></li><li><p><code>FARM_PARTNERSHIP</code></p></li><li><p><code>FOUNDATION</code></p></li><li><p><code>GENERAL_AND_LIMITED_PARTNERSHIP</code></p></li><li><p><code>GENERAL_PARTNERSHIP</code></p></li><li><p><code>INDIVIDUAL</code></p></li><li><p><code>LIMITED_COMPANY</code></p></li><li><p><code>LOCAL_AUTHORITY</code></p></li><li><p><code>LOCAL_PUBLIC_ENTITY</code></p></li><li><p><code>MUTUAL_INSURANCE_COMPANY</code></p></li><li><p><code>NATIONAL_PUBLIC_ENTITY</code></p></li><li><p><code>ORDER_OR_RELIGIOUS_INSTITUTION</code></p></li><li><p><code>OTHERS (Only for contacts outside of Spain)</code></p></li><li><p><code>POLITICAL_PARTY</code></p></li><li><p><code>PROFESSIONAL_ASSOCIATION</code></p></li><li><p><code>PUBLIC_LAW_ASSOCIATION</code></p></li><li><p><code>PUBLIC_LIMITED_COMPANY</code></p></li><li><p><code>REGIONAL_GOVERNMENT_BODY</code></p></li><li><p><code>REGIONAL_PUBLIC_ENTITY</code></p></li><li><p><code>SAVINGS_BANK</code></p></li><li><p><code>SPANISH_OFFICE</code></p></li><li><p><code>SPORTS_ASSOCIATION</code></p></li><li><p><code>SPORTS_FEDERATION</code></p></li><li><p><code>SPORTS_LIMITED_COMPANY</code></p></li><li><p><code>TEMPORARY_ALLIANCE_OF_ENTERPRISES</code></p></li><li><p><code>TRADE_UNION</code></p></li><li><p><code>WORKER_OWNED_COMPANY</code></p></li><li><p><code>WORKER_OWNED_LIMITED_COMPANY</code></p></li></ul></li></ul></dd><dt>.fi</dt><dd><ul><li><p><code>BIRTH_DATE_IN_YYYY_MM_DD</code></p></li><li><p><code>FI_BUSINESS_NUMBER</code></p></li><li><p><code>FI_ID_NUMBER</code></p></li><li><p><code>FI_NATIONALITY</code></p><p>Valid values include the following:</p><ul><li><p><code>FINNISH</code></p></li><li><p><code>NOT_FINNISH</code></p></li></ul></li><li><p><code>FI_ORGANIZATION_TYPE</code></p><p>Valid values include the following:</p><ul><li><p><code>COMPANY</code></p></li><li><p><code>CORPORATION</code></p></li><li><p><code>GOVERNMENT</code></p></li><li><p><code>INSTITUTION</code></p></li><li><p><code>POLITICAL_PARTY</code></p></li><li><p><code>PUBLIC_COMMUNITY</code></p></li><li><p><code>TOWNSHIP</code></p></li></ul></li></ul></dd><dt>.fr</dt><dd><ul><li><p><code>BIRTH_CITY</code></p></li><li><p><code>BIRTH_COUNTRY</code></p></li><li><p><code>BIRTH_DATE_IN_YYYY_MM_DD</code></p></li><li><p><code>BIRTH_DEPARTMENT</code>: Specify the INSEE code that corresponds with the department where the contact was born. If the contact was born somewhere other than France or its overseas departments, specify <code>99</code>. For more information, including a list of departments and the corresponding INSEE numbers, see the Wikipedia entry <a href="https://en.wikipedia.org/wiki/Departments_of_France">Departments of France</a>.</p></li><li><p><code>BRAND_NUMBER</code></p></li></ul></dd><dt>.it</dt><dd><ul><li><p><code>IT_NATIONALITY</code></p></li><li><p><code>IT_PIN</code></p></li><li><p><code>IT_REGISTRANT_ENTITY_TYPE</code></p><p>Valid values include the following:</p><ul><li><p><code>FOREIGNERS</code></p></li><li><p><code>FREELANCE_WORKERS</code> (Freelance workers and professionals)</p></li><li><p><code>ITALIAN_COMPANIES</code> (Italian companies and one-person companies)</p></li><li><p><code>NON_PROFIT_ORGANIZATIONS</code></p></li><li><p><code>OTHER_SUBJECTS</code></p></li><li><p><code>PUBLIC_ORGANIZATIONS</code></p></li></ul></li></ul></dd><dt>.ru</dt><dd><ul><li><p><code>BIRTH_DATE_IN_YYYY_MM_DD</code></p></li><li><p><code>RU_PASSPORT_DATA</code></p></li></ul></dd><dt>.se</dt><dd><ul><li><p><code>BIRTH_COUNTRY</code></p></li><li><p><code>SE_ID_NUMBER</code></p></li></ul></dd><dt>.sg</dt><dd><ul><li><p><code>SG_ID_NUMBER</code></p></li></ul></dd><dt>.co.uk, .me.uk, and .org.uk</dt><dd><ul><li><p><code>UK_CONTACT_TYPE</code></p><p>Valid values include the following:</p><ul><li><p><code>CRC</code> (UK Corporation by Royal Charter)</p></li><li><p><code>FCORP</code> (Non-UK Corporation)</p></li><li><p><code>FIND</code> (Non-UK Individual, representing self)</p></li><li><p><code>FOTHER</code> (Non-UK Entity that does not fit into any other category)</p></li><li><p><code>GOV</code> (UK Government Body)</p></li><li><p><code>IND</code> (UK Individual (representing self))</p></li><li><p><code>IP</code> (UK Industrial/Provident Registered Company)</p></li><li><p><code>LLP</code> (UK Limited Liability Partnership)</p></li><li><p><code>LTD</code> (UK Limited Company)</p></li><li><p><code>OTHER</code> (UK Entity that does not fit into any other category)</p></li><li><p><code>PLC</code> (UK Public Limited Company)</p></li><li><p><code>PTNR</code> (UK Partnership)</p></li><li><p><code>RCHAR</code> (UK Registered Charity)</p></li><li><p><code>SCH</code> (UK School)</p></li><li><p><code>STAT</code> (UK Statutory Body)</p></li><li><p><code>STRA</code> (UK Sole Trader)</p></li></ul></li><li><p><code>UK_COMPANY_NUMBER</code></p></li></ul></dd></dl><p>In addition, many TLDs require a <code>VAT_NUMBER</code>.</p>
 */
@property (nonatomic, assign) AWSroute53domainsExtraParamName name;

/**
 <p>The value that corresponds with the name of an extra parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSroute53domainsGetContactReachabilityStatusRequest : AWSRequest


/**
 <p>The name of the domain for which you want to know whether the registrant contact has confirmed that the email address is valid.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSroute53domainsGetContactReachabilityStatusResponse : AWSModel


/**
 <p>The domain name for which you requested the reachability status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Whether the registrant contact has responded. Values include the following:</p><dl><dt>PENDING</dt><dd><p>We sent the confirmation email and haven't received a response yet.</p></dd><dt>DONE</dt><dd><p>We sent the email and got confirmation from the registrant contact.</p></dd><dt>EXPIRED</dt><dd><p>The time limit expired before the registrant contact responded.</p></dd></dl>
 */
@property (nonatomic, assign) AWSroute53domainsReachabilityStatus status;

@end

/**
 <p>The GetDomainDetail request includes the following element.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsGetDomainDetailRequest : AWSRequest


/**
 <p>The name of the domain that you want to get detailed information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The GetDomainDetail response includes the following elements.</p>
 Required parameters: [DomainName, Nameservers, AdminContact, RegistrantContact, TechContact]
 */
@interface AWSroute53domainsGetDomainDetailResponse : AWSModel


/**
 <p>Email address to contact to report incorrect contact information for a domain, to report that the domain is being used to send spam, to report that someone is cybersquatting on a domain name, or report some other type of abuse.</p>
 */
@property (nonatomic, strong) NSString * _Nullable abuseContactEmail;

/**
 <p>Phone number for reporting abuse.</p>
 */
@property (nonatomic, strong) NSString * _Nullable abuseContactPhone;

/**
 <p>Provides details about the domain administrative contact.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable adminContact;

/**
 <p>Specifies whether contact information is concealed from WHOIS queries. If the value is <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If the value is <code>false</code>, WHOIS queries return the information that you entered for the admin contact.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable adminPrivacy;

/**
 <p>Specifies whether the domain registration is set to renew automatically.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoRenew;

/**
 <p>The date when the domain was created as found in the response to a WHOIS query. The date and time is in Unix time format and Coordinated Universal time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dnsSec;

/**
 <p>The name of a domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The date when the registration for the domain is set to expire. The date and time is in Unix time format and Coordinated Universal time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expirationDate;

/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSArray<AWSroute53domainsNameserver *> * _Nullable nameservers;

/**
 <p>Provides details about the domain registrant.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable registrantContact;

/**
 <p>Specifies whether contact information is concealed from WHOIS queries. If the value is <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If the value is <code>false</code>, WHOIS queries return the information that you entered for the registrant contact (domain owner).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable registrantPrivacy;

/**
 <p>Name of the registrar of the domain as identified in the registry. Domains with a .com, .net, or .org TLD are registered by Amazon Registrar. All other domains are registered by our registrar associate, Gandi. The value for domains that are registered by Gandi is <code>"GANDI SAS"</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable registrarName;

/**
 <p>Web address of the registrar.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registrarUrl;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registryDomainId;

/**
 <p>Reseller of the domain. Domains registered or transferred using Route 53 domains will have <code>"Amazon"</code> as the reseller. </p>
 */
@property (nonatomic, strong) NSString * _Nullable reseller;

/**
 <p>An array of domain name status codes, also known as Extensible Provisioning Protocol (EPP) status codes.</p><p>ICANN, the organization that maintains a central database of domain names, has developed a set of domain name status codes that tell you the status of a variety of operations on a domain name, for example, registering a domain name, transferring a domain name to another registrar, renewing the registration for a domain name, and so on. All registrars use this same set of status codes.</p><p>For a current list of domain name status codes and an explanation of what each code means, go to the <a href="https://www.icann.org/">ICANN website</a> and search for <code>epp status codes</code>. (Search on the ICANN website; web searches sometimes return an old version of the document.)</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable statusList;

/**
 <p>Provides details about the domain technical contact.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable techContact;

/**
 <p>Specifies whether contact information is concealed from WHOIS queries. If the value is <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If the value is <code>false</code>, WHOIS queries return the information that you entered for the technical contact.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable techPrivacy;

/**
 <p>The last updated date of the domain as found in the response to a WHOIS query. The date and time is in Unix time format and Coordinated Universal time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedDate;

/**
 <p>The fully qualified name of the WHOIS server that can answer the WHOIS query for the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable whoIsServer;

@end

/**
 
 */
@interface AWSroute53domainsGetDomainSuggestionsRequest : AWSRequest


/**
 <p>A domain name that you want to use as the basis for a list of possible domain names. The top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>The domain name can contain only the following characters:</p><ul><li><p>Letters a through z. Domain names are not case sensitive.</p></li><li><p>Numbers 0 through 9.</p></li><li><p>Hyphen (-). You can't specify a hyphen at the beginning or end of a label. </p></li><li><p>Period (.) to separate the labels in the name, such as the <code>.</code> in <code>example.com</code>.</p></li></ul><p>Internationalized domain names are not supported for some top-level domains. To determine whether the TLD that you want to use supports internationalized domain names, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>If <code>OnlyAvailable</code> is <code>true</code>, Route 53 returns only domain names that are available. If <code>OnlyAvailable</code> is <code>false</code>, Route 53 returns domain names without checking whether they're available to be registered. To determine whether the domain is available, you can call <code>checkDomainAvailability</code> for each suggestion.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable onlyAvailable;

/**
 <p>The number of suggested domain names that you want Route 53 to return. Specify a value between 1 and 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable suggestionCount;

@end

/**
 
 */
@interface AWSroute53domainsGetDomainSuggestionsResponse : AWSModel


/**
 <p>A list of possible domain names. If you specified <code>true</code> for <code>OnlyAvailable</code> in the request, the list contains only domains that are available for registration.</p>
 */
@property (nonatomic, strong) NSArray<AWSroute53domainsDomainSuggestion *> * _Nullable suggestionsList;

@end

/**
 <p>The <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a> request includes the following element.</p>
 Required parameters: [OperationId]
 */
@interface AWSroute53domainsGetOperationDetailRequest : AWSRequest


/**
 <p>The identifier for the operation for which you want to get the status. Route 53 returned the identifier in the response to the original request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>The GetOperationDetail response includes the following elements.</p>
 */
@interface AWSroute53domainsGetOperationDetailResponse : AWSModel


/**
 <p>The name of a domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Detailed information on the status including possible errors.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The identifier for the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>The current status of the requested operation in the system.</p>
 */
@property (nonatomic, assign) AWSroute53domainsOperationStatus status;

/**
 <p>The date when the request was submitted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submittedDate;

/**
 <p>The type of operation that was requested.</p>
 */
@property (nonatomic, assign) AWSroute53domainsOperationType types;

@end

/**
 <p>The ListDomains request includes the following elements.</p>
 */
@interface AWSroute53domainsListDomainsRequest : AWSRequest


/**
 <p>For an initial request for a list of domains, omit this element. If the number of domains that are associated with the current AWS account is greater than the value that you specified for <code>MaxItems</code>, you can use <code>Marker</code> to return additional domains. Get the value of <code>NextPageMarker</code> from the previous response, and submit another request that includes the value of <code>NextPageMarker</code> in the <code>Marker</code> element.</p><p>Constraints: The marker must match the value specified in the previous request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Number of domains to be returned.</p><p>Default: 20</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 <p>The ListDomains response includes the following elements.</p>
 Required parameters: [Domains]
 */
@interface AWSroute53domainsListDomainsResponse : AWSModel


/**
 <p>A summary of domains.</p>
 */
@property (nonatomic, strong) NSArray<AWSroute53domainsDomainSummary *> * _Nullable domains;

/**
 <p>If there are more domains than you specified for <code>MaxItems</code> in the request, submit another request and include the value of <code>NextPageMarker</code> in the value of <code>Marker</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageMarker;

@end

/**
 <p>The ListOperations request includes the following elements.</p>
 */
@interface AWSroute53domainsListOperationsRequest : AWSRequest


/**
 <p>For an initial request for a list of operations, omit this element. If the number of operations that are not yet complete is greater than the value that you specified for <code>MaxItems</code>, you can use <code>Marker</code> to return additional operations. Get the value of <code>NextPageMarker</code> from the previous response, and submit another request that includes the value of <code>NextPageMarker</code> in the <code>Marker</code> element.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Number of domains to be returned.</p><p>Default: 20</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>An optional parameter that lets you get information about all the operations that you submitted after a specified date and time. Specify the date and time in Unix time format and Coordinated Universal time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submittedSince;

@end

/**
 <p>The ListOperations response includes the following elements.</p>
 Required parameters: [Operations]
 */
@interface AWSroute53domainsListOperationsResponse : AWSModel


/**
 <p>If there are more operations than you specified for <code>MaxItems</code> in the request, submit another request and include the value of <code>NextPageMarker</code> in the value of <code>Marker</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageMarker;

/**
 <p>Lists summaries of the operations.</p>
 */
@property (nonatomic, strong) NSArray<AWSroute53domainsOperationSummary *> * _Nullable operations;

@end

/**
 <p>The ListTagsForDomainRequest includes the following elements.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsListTagsForDomainRequest : AWSRequest


/**
 <p>The domain for which you want to get a list of tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The ListTagsForDomain response includes the following elements.</p>
 Required parameters: [TagList]
 */
@interface AWSroute53domainsListTagsForDomainResponse : AWSModel


/**
 <p>A list of the tags that are associated with the specified domain.</p>
 */
@property (nonatomic, strong) NSArray<AWSroute53domainsTag *> * _Nullable tagList;

@end

/**
 <p>Nameserver includes the following elements.</p>
 Required parameters: [Name]
 */
@interface AWSroute53domainsNameserver : AWSModel


/**
 <p>Glue IP address of a name server entry. Glue IP addresses are required only when the name of the name server is a subdomain of the domain. For example, if your domain is example.com and the name server for the domain is ns.example.com, you need to specify the IP address for ns.example.com.</p><p>Constraints: The list can contain only one IPv4 and one IPv6 address.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable glueIps;

/**
 <p>The fully qualified host name of the name server.</p><p>Constraint: Maximum 255 characters</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>OperationSummary includes the following elements.</p>
 Required parameters: [OperationId, Status, Type, SubmittedDate]
 */
@interface AWSroute53domainsOperationSummary : AWSModel


/**
 <p>Identifier returned to track the requested action.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>The current status of the requested operation in the system.</p>
 */
@property (nonatomic, assign) AWSroute53domainsOperationStatus status;

/**
 <p>The date when the request was submitted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable submittedDate;

/**
 <p>Type of the action requested.</p>
 */
@property (nonatomic, assign) AWSroute53domainsOperationType types;

@end

/**
 <p>The RegisterDomain request includes the following elements.</p>
 Required parameters: [DomainName, DurationInYears, AdminContact, RegistrantContact, TechContact]
 */
@interface AWSroute53domainsRegisterDomainRequest : AWSRequest


/**
 <p>Provides detailed contact information. For information about the values that you specify for each element, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html">ContactDetail</a>.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable adminContact;

/**
 <p>Indicates whether the domain will be automatically renewed (<code>true</code>) or not (<code>false</code>). Autorenewal only takes effect after the account is charged.</p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoRenew;

/**
 <p>The domain name that you want to register. The top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>The domain name can contain only the following characters:</p><ul><li><p>Letters a through z. Domain names are not case sensitive.</p></li><li><p>Numbers 0 through 9.</p></li><li><p>Hyphen (-). You can't specify a hyphen at the beginning or end of a label. </p></li><li><p>Period (.) to separate the labels in the name, such as the <code>.</code> in <code>example.com</code>.</p></li></ul><p>Internationalized domain names are not supported for some top-level domains. To determine whether the TLD that you want to use supports internationalized domain names, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a>. For more information, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html#domain-name-format-idns">Formatting Internationalized Domain Names</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The number of years that you want to register the domain for. Domains are registered for a minimum of one year. The maximum period depends on the top-level domain. For the range of valid values for your domain, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>Default: 1</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInYears;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idnLangCode;

/**
 <p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the admin contact.</p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable privacyProtectAdminContact;

/**
 <p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the registrant contact (the domain owner).</p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable privacyProtectRegistrantContact;

/**
 <p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the technical contact.</p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable privacyProtectTechContact;

/**
 <p>Provides detailed contact information. For information about the values that you specify for each element, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html">ContactDetail</a>.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable registrantContact;

/**
 <p>Provides detailed contact information. For information about the values that you specify for each element, see <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html">ContactDetail</a>.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable techContact;

@end

/**
 <p>The RegisterDomain response includes the following element.</p>
 Required parameters: [OperationId]
 */
@interface AWSroute53domainsRegisterDomainResponse : AWSModel


/**
 <p>Identifier for tracking the progress of the request. To query the operation status, use <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>The RejectDomainTransferFromAnotherAwsAccount request includes the following element.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest : AWSRequest


/**
 <p>The name of the domain that was specified when another AWS account submitted a <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a> request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The RejectDomainTransferFromAnotherAwsAccount response includes the following element.</p>
 */
@interface AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse : AWSModel


/**
 <p>The identifier that <code>TransferDomainToAnotherAwsAccount</code> returned to track the progress of the request. Because the transfer request was rejected, the value is no longer valid, and you can't use <code>GetOperationDetail</code> to query the operation status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>A <code>RenewDomain</code> request includes the number of years that you want to renew for and the current expiration year.</p>
 Required parameters: [DomainName, CurrentExpiryYear]
 */
@interface AWSroute53domainsRenewDomainRequest : AWSRequest


/**
 <p>The year when the registration for the domain is set to expire. This value must match the current expiration date for the domain.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable currentExpiryYear;

/**
 <p>The name of the domain that you want to renew.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The number of years that you want to renew the domain for. The maximum number of years depends on the top-level domain. For the range of valid values for your domain, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>Default: 1</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInYears;

@end

/**
 
 */
@interface AWSroute53domainsRenewDomainResponse : AWSModel


/**
 <p>Identifier for tracking the progress of the request. To query the operation status, use <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 
 */
@interface AWSroute53domainsResendContactReachabilityEmailRequest : AWSRequest


/**
 <p>The name of the domain for which you want Route 53 to resend a confirmation email to the registrant contact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSroute53domainsResendContactReachabilityEmailResponse : AWSModel


/**
 <p>The domain name for which you requested a confirmation email.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The email address for the registrant contact at the time that we sent the verification email.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailAddress;

/**
 <p><code>True</code> if the email address for the registrant contact has already been verified, and <code>false</code> otherwise. If the email address has already been verified, we don't send another confirmation email.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAlreadyVerified;

@end

/**
 <p>A request for the authorization code for the specified domain. To transfer a domain to another registrar, you provide this value to the new registrar.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsRetrieveDomainAuthCodeRequest : AWSRequest


/**
 <p>The name of the domain that you want to get an authorization code for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The RetrieveDomainAuthCode response includes the following element.</p>
 Required parameters: [AuthCode]
 */
@interface AWSroute53domainsRetrieveDomainAuthCodeResponse : AWSModel


/**
 <p>The authorization code for the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authCode;

@end

/**
 <p>Each tag includes the following elements.</p>
 */
@interface AWSroute53domainsTag : AWSModel


/**
 <p>The key (name) of a tag.</p><p>Valid values: A-Z, a-z, 0-9, space, ".:/=+\-@"</p><p>Constraints: Each key can be 1-128 characters long.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value of a tag.</p><p>Valid values: A-Z, a-z, 0-9, space, ".:/=+\-@"</p><p>Constraints: Each value can be 0-256 characters long.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The TransferDomain request includes the following elements.</p>
 Required parameters: [DomainName, DurationInYears, AdminContact, RegistrantContact, TechContact]
 */
@interface AWSroute53domainsTransferDomainRequest : AWSRequest


/**
 <p>Provides detailed contact information.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable adminContact;

/**
 <p>The authorization code for the domain. You get this value from the current registrar.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authCode;

/**
 <p>Indicates whether the domain will be automatically renewed (true) or not (false). Autorenewal only takes effect after the account is charged.</p><p>Default: true</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoRenew;

/**
 <p>The name of the domain that you want to transfer to Route 53. The top-level domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see <a href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53 Developer Guide</i>.</p><p>The domain name can contain only the following characters:</p><ul><li><p>Letters a through z. Domain names are not case sensitive.</p></li><li><p>Numbers 0 through 9.</p></li><li><p>Hyphen (-). You can't specify a hyphen at the beginning or end of a label. </p></li><li><p>Period (.) to separate the labels in the name, such as the <code>.</code> in <code>example.com</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The number of years that you want to register the domain for. Domains are registered for a minimum of one year. The maximum period depends on the top-level domain.</p><p>Default: 1</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationInYears;

/**
 <p>Reserved for future use.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idnLangCode;

/**
 <p>Contains details for the host and glue IP addresses.</p>
 */
@property (nonatomic, strong) NSArray<AWSroute53domainsNameserver *> * _Nullable nameservers;

/**
 <p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the admin contact.</p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable privacyProtectAdminContact;

/**
 <p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the registrant contact (domain owner).</p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable privacyProtectRegistrantContact;

/**
 <p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the technical contact.</p><p>Default: <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable privacyProtectTechContact;

/**
 <p>Provides detailed contact information.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable registrantContact;

/**
 <p>Provides detailed contact information.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable techContact;

@end

/**
 <p>The TransferDomain response includes the following element.</p>
 Required parameters: [OperationId]
 */
@interface AWSroute53domainsTransferDomainResponse : AWSModel


/**
 <p>Identifier for tracking the progress of the request. To query the operation status, use <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>The TransferDomainToAnotherAwsAccount request includes the following elements.</p>
 Required parameters: [DomainName, AccountId]
 */
@interface AWSroute53domainsTransferDomainToAnotherAwsAccountRequest : AWSRequest


/**
 <p>The account ID of the AWS account that you want to transfer the domain to, for example, <code>111122223333</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The name of the domain that you want to transfer from the current AWS account to another account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The <code>TransferDomainToAnotherAwsAccount</code> response includes the following elements.</p>
 */
@interface AWSroute53domainsTransferDomainToAnotherAwsAccountResponse : AWSModel


/**
 <p>Identifier for tracking the progress of the request. To query the operation status, use <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

/**
 <p>To finish transferring a domain to another AWS account, the account that the domain is being transferred to must submit an <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html">AcceptDomainTransferFromAnotherAwsAccount</a> request. The request must include the value of the <code>Password</code> element that was returned in the <code>TransferDomainToAnotherAwsAccount</code> response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

@end

/**
 <p>The UpdateDomainContactPrivacy request includes the following elements.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsUpdateDomainContactPrivacyRequest : AWSRequest


/**
 <p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the admin contact.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable adminPrivacy;

/**
 <p>The name of the domain that you want to update the privacy setting for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the registrant contact (domain owner).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable registrantPrivacy;

/**
 <p>Whether you want to conceal contact information from WHOIS queries. If you specify <code>true</code>, WHOIS ("who is") queries return contact information either for Amazon Registrar (for .com, .net, and .org domains) or for our registrar associate, Gandi (for all other TLDs). If you specify <code>false</code>, WHOIS queries return the information that you entered for the technical contact.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable techPrivacy;

@end

/**
 <p>The UpdateDomainContactPrivacy response includes the following element.</p>
 Required parameters: [OperationId]
 */
@interface AWSroute53domainsUpdateDomainContactPrivacyResponse : AWSModel


/**
 <p>Identifier for tracking the progress of the request. To use this ID to query the operation status, use GetOperationDetail.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>The UpdateDomainContact request includes the following elements.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsUpdateDomainContactRequest : AWSRequest


/**
 <p>Provides detailed contact information.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable adminContact;

/**
 <p>The name of the domain that you want to update contact information for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Provides detailed contact information.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable registrantContact;

/**
 <p>Provides detailed contact information.</p>
 */
@property (nonatomic, strong) AWSroute53domainsContactDetail * _Nullable techContact;

@end

/**
 <p>The UpdateDomainContact response includes the following element.</p>
 Required parameters: [OperationId]
 */
@interface AWSroute53domainsUpdateDomainContactResponse : AWSModel


/**
 <p>Identifier for tracking the progress of the request. To query the operation status, use <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>Replaces the current set of name servers for the domain with the specified set of name servers. If you use Amazon Route 53 as your DNS service, specify the four name servers in the delegation set for the hosted zone for the domain.</p><p>If successful, this operation returns an operation ID that you can use to track the progress and completion of the action. If the request is not completed successfully, the domain registrant will be notified by email. </p>
 Required parameters: [DomainName, Nameservers]
 */
@interface AWSroute53domainsUpdateDomainNameserversRequest : AWSRequest


/**
 <p>The name of the domain that you want to change name servers for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The authorization key for .fi domains</p>
 */
@property (nonatomic, strong) NSString * _Nullable FIAuthKey;

/**
 <p>A list of new name servers for the domain.</p>
 */
@property (nonatomic, strong) NSArray<AWSroute53domainsNameserver *> * _Nullable nameservers;

@end

/**
 <p>The UpdateDomainNameservers response includes the following element.</p>
 Required parameters: [OperationId]
 */
@interface AWSroute53domainsUpdateDomainNameserversResponse : AWSModel


/**
 <p>Identifier for tracking the progress of the request. To query the operation status, use <a href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operationId;

@end

/**
 <p>The UpdateTagsForDomainRequest includes the following elements.</p>
 Required parameters: [DomainName]
 */
@interface AWSroute53domainsUpdateTagsForDomainRequest : AWSRequest


/**
 <p>The domain for which you want to add or update tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>A list of the tag keys and values that you want to add or update. If you specify a key that already exists, the corresponding value will be replaced.</p>
 */
@property (nonatomic, strong) NSArray<AWSroute53domainsTag *> * _Nullable tagsToUpdate;

@end

/**
 
 */
@interface AWSroute53domainsUpdateTagsForDomainResponse : AWSModel


@end

/**
 <p>The ViewBilling request includes the following elements.</p>
 */
@interface AWSroute53domainsViewBillingRequest : AWSRequest


/**
 <p>The end date and time for the time period for which you want a list of billing records. Specify the date and time in Unix time format and Coordinated Universal time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable end;

/**
 <p>For an initial request for a list of billing records, omit this element. If the number of billing records that are associated with the current AWS account during the specified period is greater than the value that you specified for <code>MaxItems</code>, you can use <code>Marker</code> to return additional billing records. Get the value of <code>NextPageMarker</code> from the previous response, and submit another request that includes the value of <code>NextPageMarker</code> in the <code>Marker</code> element. </p><p>Constraints: The marker must match the value of <code>NextPageMarker</code> that was returned in the previous response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The number of billing records to be returned.</p><p>Default: 20</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The beginning date and time for the time period for which you want a list of billing records. Specify the date and time in Unix time format and Coordinated Universal time (UTC).</p>
 */
@property (nonatomic, strong) NSDate * _Nullable start;

@end

/**
 <p>The ViewBilling response includes the following elements.</p>
 */
@interface AWSroute53domainsViewBillingResponse : AWSModel


/**
 <p>A summary of billing records.</p>
 */
@property (nonatomic, strong) NSArray<AWSroute53domainsBillingRecord *> * _Nullable billingRecords;

/**
 <p>If there are more billing records than you specified for <code>MaxItems</code> in the request, submit another request and include the value of <code>NextPageMarker</code> in the value of <code>Marker</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageMarker;

@end

NS_ASSUME_NONNULL_END
