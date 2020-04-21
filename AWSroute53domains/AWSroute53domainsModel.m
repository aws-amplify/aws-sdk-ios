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

#import "AWSroute53domainsModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSroute53domainsErrorDomain = @"com.amazonaws.AWSroute53domainsErrorDomain";

@implementation AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"password" : @"Password",
             };
}

@end

@implementation AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsBillingRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billDate" : @"BillDate",
             @"domainName" : @"DomainName",
             @"invoiceId" : @"InvoiceId",
             @"operation" : @"Operation",
             @"price" : @"Price",
             };
}

+ (NSValueTransformer *)billDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGISTER_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeRegisterDomain);
        }
        if ([value caseInsensitiveCompare:@"DELETE_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeDeleteDomain);
        }
        if ([value caseInsensitiveCompare:@"TRANSFER_IN_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeTransferInDomain);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_DOMAIN_CONTACT"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeUpdateDomainContact);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_NAMESERVER"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeUpdateNameserver);
        }
        if ([value caseInsensitiveCompare:@"CHANGE_PRIVACY_PROTECTION"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeChangePrivacyProtection);
        }
        if ([value caseInsensitiveCompare:@"DOMAIN_LOCK"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeDomainLock);
        }
        if ([value caseInsensitiveCompare:@"ENABLE_AUTORENEW"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeEnableAutorenew);
        }
        if ([value caseInsensitiveCompare:@"DISABLE_AUTORENEW"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeDisableAutorenew);
        }
        if ([value caseInsensitiveCompare:@"ADD_DNSSEC"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeAddDnssec);
        }
        if ([value caseInsensitiveCompare:@"REMOVE_DNSSEC"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeRemoveDnssec);
        }
        if ([value caseInsensitiveCompare:@"EXPIRE_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeExpireDomain);
        }
        if ([value caseInsensitiveCompare:@"TRANSFER_OUT_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeTransferOutDomain);
        }
        if ([value caseInsensitiveCompare:@"CHANGE_DOMAIN_OWNER"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeChangeDomainOwner);
        }
        if ([value caseInsensitiveCompare:@"RENEW_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeRenewDomain);
        }
        if ([value caseInsensitiveCompare:@"PUSH_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypePushDomain);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_TRANSFER_OUT_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeInternalTransferOutDomain);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_TRANSFER_IN_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeInternalTransferInDomain);
        }
        return @(AWSroute53domainsOperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsOperationTypeRegisterDomain:
                return @"REGISTER_DOMAIN";
            case AWSroute53domainsOperationTypeDeleteDomain:
                return @"DELETE_DOMAIN";
            case AWSroute53domainsOperationTypeTransferInDomain:
                return @"TRANSFER_IN_DOMAIN";
            case AWSroute53domainsOperationTypeUpdateDomainContact:
                return @"UPDATE_DOMAIN_CONTACT";
            case AWSroute53domainsOperationTypeUpdateNameserver:
                return @"UPDATE_NAMESERVER";
            case AWSroute53domainsOperationTypeChangePrivacyProtection:
                return @"CHANGE_PRIVACY_PROTECTION";
            case AWSroute53domainsOperationTypeDomainLock:
                return @"DOMAIN_LOCK";
            case AWSroute53domainsOperationTypeEnableAutorenew:
                return @"ENABLE_AUTORENEW";
            case AWSroute53domainsOperationTypeDisableAutorenew:
                return @"DISABLE_AUTORENEW";
            case AWSroute53domainsOperationTypeAddDnssec:
                return @"ADD_DNSSEC";
            case AWSroute53domainsOperationTypeRemoveDnssec:
                return @"REMOVE_DNSSEC";
            case AWSroute53domainsOperationTypeExpireDomain:
                return @"EXPIRE_DOMAIN";
            case AWSroute53domainsOperationTypeTransferOutDomain:
                return @"TRANSFER_OUT_DOMAIN";
            case AWSroute53domainsOperationTypeChangeDomainOwner:
                return @"CHANGE_DOMAIN_OWNER";
            case AWSroute53domainsOperationTypeRenewDomain:
                return @"RENEW_DOMAIN";
            case AWSroute53domainsOperationTypePushDomain:
                return @"PUSH_DOMAIN";
            case AWSroute53domainsOperationTypeInternalTransferOutDomain:
                return @"INTERNAL_TRANSFER_OUT_DOMAIN";
            case AWSroute53domainsOperationTypeInternalTransferInDomain:
                return @"INTERNAL_TRANSFER_IN_DOMAIN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsCheckDomainAvailabilityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"idnLangCode" : @"IdnLangCode",
             };
}

@end

@implementation AWSroute53domainsCheckDomainAvailabilityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availability" : @"Availability",
             };
}

+ (NSValueTransformer *)availabilityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSroute53domainsDomainAvailabilityAvailable);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE_RESERVED"] == NSOrderedSame) {
            return @(AWSroute53domainsDomainAvailabilityAvailableReserved);
        }
        if ([value caseInsensitiveCompare:@"AVAILABLE_PREORDER"] == NSOrderedSame) {
            return @(AWSroute53domainsDomainAvailabilityAvailablePreorder);
        }
        if ([value caseInsensitiveCompare:@"UNAVAILABLE"] == NSOrderedSame) {
            return @(AWSroute53domainsDomainAvailabilityUnavailable);
        }
        if ([value caseInsensitiveCompare:@"UNAVAILABLE_PREMIUM"] == NSOrderedSame) {
            return @(AWSroute53domainsDomainAvailabilityUnavailablePremium);
        }
        if ([value caseInsensitiveCompare:@"UNAVAILABLE_RESTRICTED"] == NSOrderedSame) {
            return @(AWSroute53domainsDomainAvailabilityUnavailableRestricted);
        }
        if ([value caseInsensitiveCompare:@"RESERVED"] == NSOrderedSame) {
            return @(AWSroute53domainsDomainAvailabilityReserved);
        }
        if ([value caseInsensitiveCompare:@"DONT_KNOW"] == NSOrderedSame) {
            return @(AWSroute53domainsDomainAvailabilityDontKnow);
        }
        return @(AWSroute53domainsDomainAvailabilityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsDomainAvailabilityAvailable:
                return @"AVAILABLE";
            case AWSroute53domainsDomainAvailabilityAvailableReserved:
                return @"AVAILABLE_RESERVED";
            case AWSroute53domainsDomainAvailabilityAvailablePreorder:
                return @"AVAILABLE_PREORDER";
            case AWSroute53domainsDomainAvailabilityUnavailable:
                return @"UNAVAILABLE";
            case AWSroute53domainsDomainAvailabilityUnavailablePremium:
                return @"UNAVAILABLE_PREMIUM";
            case AWSroute53domainsDomainAvailabilityUnavailableRestricted:
                return @"UNAVAILABLE_RESTRICTED";
            case AWSroute53domainsDomainAvailabilityReserved:
                return @"RESERVED";
            case AWSroute53domainsDomainAvailabilityDontKnow:
                return @"DONT_KNOW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53domainsCheckDomainTransferabilityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authCode" : @"AuthCode",
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsCheckDomainTransferabilityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transferability" : @"Transferability",
             };
}

+ (NSValueTransformer *)transferabilityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsDomainTransferability class]];
}

@end

@implementation AWSroute53domainsContactDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressLine1" : @"AddressLine1",
             @"addressLine2" : @"AddressLine2",
             @"city" : @"City",
             @"contactType" : @"ContactType",
             @"countryCode" : @"CountryCode",
             @"email" : @"Email",
             @"extraParams" : @"ExtraParams",
             @"fax" : @"Fax",
             @"firstName" : @"FirstName",
             @"lastName" : @"LastName",
             @"organizationName" : @"OrganizationName",
             @"phoneNumber" : @"PhoneNumber",
             @"state" : @"State",
             @"zipCode" : @"ZipCode",
             };
}

+ (NSValueTransformer *)contactTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PERSON"] == NSOrderedSame) {
            return @(AWSroute53domainsContactTypePerson);
        }
        if ([value caseInsensitiveCompare:@"COMPANY"] == NSOrderedSame) {
            return @(AWSroute53domainsContactTypeCompany);
        }
        if ([value caseInsensitiveCompare:@"ASSOCIATION"] == NSOrderedSame) {
            return @(AWSroute53domainsContactTypeAssociation);
        }
        if ([value caseInsensitiveCompare:@"PUBLIC_BODY"] == NSOrderedSame) {
            return @(AWSroute53domainsContactTypePublicBody);
        }
        if ([value caseInsensitiveCompare:@"RESELLER"] == NSOrderedSame) {
            return @(AWSroute53domainsContactTypeReseller);
        }
        return @(AWSroute53domainsContactTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsContactTypePerson:
                return @"PERSON";
            case AWSroute53domainsContactTypeCompany:
                return @"COMPANY";
            case AWSroute53domainsContactTypeAssociation:
                return @"ASSOCIATION";
            case AWSroute53domainsContactTypePublicBody:
                return @"PUBLIC_BODY";
            case AWSroute53domainsContactTypeReseller:
                return @"RESELLER";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)countryCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AD"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAd);
        }
        if ([value caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAe);
        }
        if ([value caseInsensitiveCompare:@"AF"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAf);
        }
        if ([value caseInsensitiveCompare:@"AG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAg);
        }
        if ([value caseInsensitiveCompare:@"AI"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAi);
        }
        if ([value caseInsensitiveCompare:@"AL"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAl);
        }
        if ([value caseInsensitiveCompare:@"AM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAm);
        }
        if ([value caseInsensitiveCompare:@"AN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAn);
        }
        if ([value caseInsensitiveCompare:@"AO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAo);
        }
        if ([value caseInsensitiveCompare:@"AQ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAq);
        }
        if ([value caseInsensitiveCompare:@"AR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAr);
        }
        if ([value caseInsensitiveCompare:@"AS"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAs);
        }
        if ([value caseInsensitiveCompare:@"AT"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAt);
        }
        if ([value caseInsensitiveCompare:@"AU"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAu);
        }
        if ([value caseInsensitiveCompare:@"AW"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAw);
        }
        if ([value caseInsensitiveCompare:@"AZ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeAz);
        }
        if ([value caseInsensitiveCompare:@"BA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBa);
        }
        if ([value caseInsensitiveCompare:@"BB"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBb);
        }
        if ([value caseInsensitiveCompare:@"BD"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBd);
        }
        if ([value caseInsensitiveCompare:@"BE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBe);
        }
        if ([value caseInsensitiveCompare:@"BF"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBf);
        }
        if ([value caseInsensitiveCompare:@"BG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBg);
        }
        if ([value caseInsensitiveCompare:@"BH"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBh);
        }
        if ([value caseInsensitiveCompare:@"BI"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBi);
        }
        if ([value caseInsensitiveCompare:@"BJ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBj);
        }
        if ([value caseInsensitiveCompare:@"BL"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBl);
        }
        if ([value caseInsensitiveCompare:@"BM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBm);
        }
        if ([value caseInsensitiveCompare:@"BN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBn);
        }
        if ([value caseInsensitiveCompare:@"BO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBo);
        }
        if ([value caseInsensitiveCompare:@"BR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBr);
        }
        if ([value caseInsensitiveCompare:@"BS"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBs);
        }
        if ([value caseInsensitiveCompare:@"BT"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBt);
        }
        if ([value caseInsensitiveCompare:@"BW"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBw);
        }
        if ([value caseInsensitiveCompare:@"BY"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBy);
        }
        if ([value caseInsensitiveCompare:@"BZ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeBz);
        }
        if ([value caseInsensitiveCompare:@"CA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCa);
        }
        if ([value caseInsensitiveCompare:@"CC"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCc);
        }
        if ([value caseInsensitiveCompare:@"CD"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCd);
        }
        if ([value caseInsensitiveCompare:@"CF"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCf);
        }
        if ([value caseInsensitiveCompare:@"CG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCg);
        }
        if ([value caseInsensitiveCompare:@"CH"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCh);
        }
        if ([value caseInsensitiveCompare:@"CI"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCi);
        }
        if ([value caseInsensitiveCompare:@"CK"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCk);
        }
        if ([value caseInsensitiveCompare:@"CL"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCl);
        }
        if ([value caseInsensitiveCompare:@"CM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCm);
        }
        if ([value caseInsensitiveCompare:@"CN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCn);
        }
        if ([value caseInsensitiveCompare:@"CO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCo);
        }
        if ([value caseInsensitiveCompare:@"CR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCr);
        }
        if ([value caseInsensitiveCompare:@"CU"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCu);
        }
        if ([value caseInsensitiveCompare:@"CV"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCv);
        }
        if ([value caseInsensitiveCompare:@"CX"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCx);
        }
        if ([value caseInsensitiveCompare:@"CY"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCy);
        }
        if ([value caseInsensitiveCompare:@"CZ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeCz);
        }
        if ([value caseInsensitiveCompare:@"DE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeDe);
        }
        if ([value caseInsensitiveCompare:@"DJ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeDj);
        }
        if ([value caseInsensitiveCompare:@"DK"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeDk);
        }
        if ([value caseInsensitiveCompare:@"DM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeDm);
        }
        if ([value caseInsensitiveCompare:@"DO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeDo);
        }
        if ([value caseInsensitiveCompare:@"DZ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeDz);
        }
        if ([value caseInsensitiveCompare:@"EC"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeEc);
        }
        if ([value caseInsensitiveCompare:@"EE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeEe);
        }
        if ([value caseInsensitiveCompare:@"EG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeEg);
        }
        if ([value caseInsensitiveCompare:@"ER"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeEr);
        }
        if ([value caseInsensitiveCompare:@"ES"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeEs);
        }
        if ([value caseInsensitiveCompare:@"ET"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeEt);
        }
        if ([value caseInsensitiveCompare:@"FI"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeFi);
        }
        if ([value caseInsensitiveCompare:@"FJ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeFj);
        }
        if ([value caseInsensitiveCompare:@"FK"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeFk);
        }
        if ([value caseInsensitiveCompare:@"FM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeFm);
        }
        if ([value caseInsensitiveCompare:@"FO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeFo);
        }
        if ([value caseInsensitiveCompare:@"FR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeFr);
        }
        if ([value caseInsensitiveCompare:@"GA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGa);
        }
        if ([value caseInsensitiveCompare:@"GB"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGb);
        }
        if ([value caseInsensitiveCompare:@"GD"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGd);
        }
        if ([value caseInsensitiveCompare:@"GE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGE);
        }
        if ([value caseInsensitiveCompare:@"GH"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGh);
        }
        if ([value caseInsensitiveCompare:@"GI"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGi);
        }
        if ([value caseInsensitiveCompare:@"GL"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGl);
        }
        if ([value caseInsensitiveCompare:@"GM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGm);
        }
        if ([value caseInsensitiveCompare:@"GN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGn);
        }
        if ([value caseInsensitiveCompare:@"GQ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGq);
        }
        if ([value caseInsensitiveCompare:@"GR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGr);
        }
        if ([value caseInsensitiveCompare:@"GT"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGT);
        }
        if ([value caseInsensitiveCompare:@"GU"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGu);
        }
        if ([value caseInsensitiveCompare:@"GW"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGw);
        }
        if ([value caseInsensitiveCompare:@"GY"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeGy);
        }
        if ([value caseInsensitiveCompare:@"HK"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeHk);
        }
        if ([value caseInsensitiveCompare:@"HN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeHn);
        }
        if ([value caseInsensitiveCompare:@"HR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeHr);
        }
        if ([value caseInsensitiveCompare:@"HT"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeHt);
        }
        if ([value caseInsensitiveCompare:@"HU"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeHu);
        }
        if ([value caseInsensitiveCompare:@"ID"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeId);
        }
        if ([value caseInsensitiveCompare:@"IE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeIe);
        }
        if ([value caseInsensitiveCompare:@"IL"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeIl);
        }
        if ([value caseInsensitiveCompare:@"IM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeIm);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeIN);
        }
        if ([value caseInsensitiveCompare:@"IQ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeIq);
        }
        if ([value caseInsensitiveCompare:@"IR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeIr);
        }
        if ([value caseInsensitiveCompare:@"IS"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeIs);
        }
        if ([value caseInsensitiveCompare:@"IT"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeIt);
        }
        if ([value caseInsensitiveCompare:@"JM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeJm);
        }
        if ([value caseInsensitiveCompare:@"JO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeJo);
        }
        if ([value caseInsensitiveCompare:@"JP"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeJp);
        }
        if ([value caseInsensitiveCompare:@"KE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKe);
        }
        if ([value caseInsensitiveCompare:@"KG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKg);
        }
        if ([value caseInsensitiveCompare:@"KH"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKh);
        }
        if ([value caseInsensitiveCompare:@"KI"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKi);
        }
        if ([value caseInsensitiveCompare:@"KM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKm);
        }
        if ([value caseInsensitiveCompare:@"KN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKn);
        }
        if ([value caseInsensitiveCompare:@"KP"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKp);
        }
        if ([value caseInsensitiveCompare:@"KR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKr);
        }
        if ([value caseInsensitiveCompare:@"KW"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKw);
        }
        if ([value caseInsensitiveCompare:@"KY"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKy);
        }
        if ([value caseInsensitiveCompare:@"KZ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeKz);
        }
        if ([value caseInsensitiveCompare:@"LA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLa);
        }
        if ([value caseInsensitiveCompare:@"LB"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLb);
        }
        if ([value caseInsensitiveCompare:@"LC"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLc);
        }
        if ([value caseInsensitiveCompare:@"LI"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLi);
        }
        if ([value caseInsensitiveCompare:@"LK"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLk);
        }
        if ([value caseInsensitiveCompare:@"LR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLr);
        }
        if ([value caseInsensitiveCompare:@"LS"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLs);
        }
        if ([value caseInsensitiveCompare:@"LT"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLT);
        }
        if ([value caseInsensitiveCompare:@"LU"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLu);
        }
        if ([value caseInsensitiveCompare:@"LV"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLv);
        }
        if ([value caseInsensitiveCompare:@"LY"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeLy);
        }
        if ([value caseInsensitiveCompare:@"MA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMa);
        }
        if ([value caseInsensitiveCompare:@"MC"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMc);
        }
        if ([value caseInsensitiveCompare:@"MD"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMd);
        }
        if ([value caseInsensitiveCompare:@"ME"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMe);
        }
        if ([value caseInsensitiveCompare:@"MF"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMf);
        }
        if ([value caseInsensitiveCompare:@"MG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMg);
        }
        if ([value caseInsensitiveCompare:@"MH"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMh);
        }
        if ([value caseInsensitiveCompare:@"MK"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMk);
        }
        if ([value caseInsensitiveCompare:@"ML"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMl);
        }
        if ([value caseInsensitiveCompare:@"MM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMm);
        }
        if ([value caseInsensitiveCompare:@"MN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMn);
        }
        if ([value caseInsensitiveCompare:@"MO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMo);
        }
        if ([value caseInsensitiveCompare:@"MP"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMp);
        }
        if ([value caseInsensitiveCompare:@"MR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMr);
        }
        if ([value caseInsensitiveCompare:@"MS"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMs);
        }
        if ([value caseInsensitiveCompare:@"MT"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMt);
        }
        if ([value caseInsensitiveCompare:@"MU"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMu);
        }
        if ([value caseInsensitiveCompare:@"MV"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMv);
        }
        if ([value caseInsensitiveCompare:@"MW"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMw);
        }
        if ([value caseInsensitiveCompare:@"MX"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMx);
        }
        if ([value caseInsensitiveCompare:@"MY"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMy);
        }
        if ([value caseInsensitiveCompare:@"MZ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeMz);
        }
        if ([value caseInsensitiveCompare:@"NA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNa);
        }
        if ([value caseInsensitiveCompare:@"NC"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNc);
        }
        if ([value caseInsensitiveCompare:@"NE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNE);
        }
        if ([value caseInsensitiveCompare:@"NG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNg);
        }
        if ([value caseInsensitiveCompare:@"NI"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNi);
        }
        if ([value caseInsensitiveCompare:@"NL"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNl);
        }
        if ([value caseInsensitiveCompare:@"NO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNo);
        }
        if ([value caseInsensitiveCompare:@"NP"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNp);
        }
        if ([value caseInsensitiveCompare:@"NR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNr);
        }
        if ([value caseInsensitiveCompare:@"NU"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNu);
        }
        if ([value caseInsensitiveCompare:@"NZ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeNz);
        }
        if ([value caseInsensitiveCompare:@"OM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeOm);
        }
        if ([value caseInsensitiveCompare:@"PA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePa);
        }
        if ([value caseInsensitiveCompare:@"PE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePe);
        }
        if ([value caseInsensitiveCompare:@"PF"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePf);
        }
        if ([value caseInsensitiveCompare:@"PG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePg);
        }
        if ([value caseInsensitiveCompare:@"PH"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePh);
        }
        if ([value caseInsensitiveCompare:@"PK"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePk);
        }
        if ([value caseInsensitiveCompare:@"PL"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePl);
        }
        if ([value caseInsensitiveCompare:@"PM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePm);
        }
        if ([value caseInsensitiveCompare:@"PN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePn);
        }
        if ([value caseInsensitiveCompare:@"PR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePr);
        }
        if ([value caseInsensitiveCompare:@"PT"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePt);
        }
        if ([value caseInsensitiveCompare:@"PW"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePw);
        }
        if ([value caseInsensitiveCompare:@"PY"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodePy);
        }
        if ([value caseInsensitiveCompare:@"QA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeQa);
        }
        if ([value caseInsensitiveCompare:@"RO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeRo);
        }
        if ([value caseInsensitiveCompare:@"RS"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeRs);
        }
        if ([value caseInsensitiveCompare:@"RU"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeRu);
        }
        if ([value caseInsensitiveCompare:@"RW"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeRw);
        }
        if ([value caseInsensitiveCompare:@"SA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSa);
        }
        if ([value caseInsensitiveCompare:@"SB"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSb);
        }
        if ([value caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSc);
        }
        if ([value caseInsensitiveCompare:@"SD"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSd);
        }
        if ([value caseInsensitiveCompare:@"SE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSe);
        }
        if ([value caseInsensitiveCompare:@"SG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSg);
        }
        if ([value caseInsensitiveCompare:@"SH"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSh);
        }
        if ([value caseInsensitiveCompare:@"SI"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSi);
        }
        if ([value caseInsensitiveCompare:@"SK"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSk);
        }
        if ([value caseInsensitiveCompare:@"SL"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSl);
        }
        if ([value caseInsensitiveCompare:@"SM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSm);
        }
        if ([value caseInsensitiveCompare:@"SN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSn);
        }
        if ([value caseInsensitiveCompare:@"SO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSo);
        }
        if ([value caseInsensitiveCompare:@"SR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSr);
        }
        if ([value caseInsensitiveCompare:@"ST"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSt);
        }
        if ([value caseInsensitiveCompare:@"SV"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSv);
        }
        if ([value caseInsensitiveCompare:@"SY"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSy);
        }
        if ([value caseInsensitiveCompare:@"SZ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeSz);
        }
        if ([value caseInsensitiveCompare:@"TC"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTc);
        }
        if ([value caseInsensitiveCompare:@"TD"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTd);
        }
        if ([value caseInsensitiveCompare:@"TG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTg);
        }
        if ([value caseInsensitiveCompare:@"TH"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTh);
        }
        if ([value caseInsensitiveCompare:@"TJ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTj);
        }
        if ([value caseInsensitiveCompare:@"TK"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTk);
        }
        if ([value caseInsensitiveCompare:@"TL"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTl);
        }
        if ([value caseInsensitiveCompare:@"TM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTm);
        }
        if ([value caseInsensitiveCompare:@"TN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTn);
        }
        if ([value caseInsensitiveCompare:@"TO"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTo);
        }
        if ([value caseInsensitiveCompare:@"TR"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTr);
        }
        if ([value caseInsensitiveCompare:@"TT"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTt);
        }
        if ([value caseInsensitiveCompare:@"TV"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTv);
        }
        if ([value caseInsensitiveCompare:@"TW"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTw);
        }
        if ([value caseInsensitiveCompare:@"TZ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeTz);
        }
        if ([value caseInsensitiveCompare:@"UA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeUa);
        }
        if ([value caseInsensitiveCompare:@"UG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeUg);
        }
        if ([value caseInsensitiveCompare:@"US"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeUs);
        }
        if ([value caseInsensitiveCompare:@"UY"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeUy);
        }
        if ([value caseInsensitiveCompare:@"UZ"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeUz);
        }
        if ([value caseInsensitiveCompare:@"VA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeVa);
        }
        if ([value caseInsensitiveCompare:@"VC"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeVc);
        }
        if ([value caseInsensitiveCompare:@"VE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeVe);
        }
        if ([value caseInsensitiveCompare:@"VG"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeVg);
        }
        if ([value caseInsensitiveCompare:@"VI"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeVi);
        }
        if ([value caseInsensitiveCompare:@"VN"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeVn);
        }
        if ([value caseInsensitiveCompare:@"VU"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeVu);
        }
        if ([value caseInsensitiveCompare:@"WF"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeWf);
        }
        if ([value caseInsensitiveCompare:@"WS"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeWs);
        }
        if ([value caseInsensitiveCompare:@"YE"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeYe);
        }
        if ([value caseInsensitiveCompare:@"YT"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeYt);
        }
        if ([value caseInsensitiveCompare:@"ZA"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeZa);
        }
        if ([value caseInsensitiveCompare:@"ZM"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeZm);
        }
        if ([value caseInsensitiveCompare:@"ZW"] == NSOrderedSame) {
            return @(AWSroute53domainsCountryCodeZw);
        }
        return @(AWSroute53domainsCountryCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsCountryCodeAd:
                return @"AD";
            case AWSroute53domainsCountryCodeAe:
                return @"AE";
            case AWSroute53domainsCountryCodeAf:
                return @"AF";
            case AWSroute53domainsCountryCodeAg:
                return @"AG";
            case AWSroute53domainsCountryCodeAi:
                return @"AI";
            case AWSroute53domainsCountryCodeAl:
                return @"AL";
            case AWSroute53domainsCountryCodeAm:
                return @"AM";
            case AWSroute53domainsCountryCodeAn:
                return @"AN";
            case AWSroute53domainsCountryCodeAo:
                return @"AO";
            case AWSroute53domainsCountryCodeAq:
                return @"AQ";
            case AWSroute53domainsCountryCodeAr:
                return @"AR";
            case AWSroute53domainsCountryCodeAs:
                return @"AS";
            case AWSroute53domainsCountryCodeAt:
                return @"AT";
            case AWSroute53domainsCountryCodeAu:
                return @"AU";
            case AWSroute53domainsCountryCodeAw:
                return @"AW";
            case AWSroute53domainsCountryCodeAz:
                return @"AZ";
            case AWSroute53domainsCountryCodeBa:
                return @"BA";
            case AWSroute53domainsCountryCodeBb:
                return @"BB";
            case AWSroute53domainsCountryCodeBd:
                return @"BD";
            case AWSroute53domainsCountryCodeBe:
                return @"BE";
            case AWSroute53domainsCountryCodeBf:
                return @"BF";
            case AWSroute53domainsCountryCodeBg:
                return @"BG";
            case AWSroute53domainsCountryCodeBh:
                return @"BH";
            case AWSroute53domainsCountryCodeBi:
                return @"BI";
            case AWSroute53domainsCountryCodeBj:
                return @"BJ";
            case AWSroute53domainsCountryCodeBl:
                return @"BL";
            case AWSroute53domainsCountryCodeBm:
                return @"BM";
            case AWSroute53domainsCountryCodeBn:
                return @"BN";
            case AWSroute53domainsCountryCodeBo:
                return @"BO";
            case AWSroute53domainsCountryCodeBr:
                return @"BR";
            case AWSroute53domainsCountryCodeBs:
                return @"BS";
            case AWSroute53domainsCountryCodeBt:
                return @"BT";
            case AWSroute53domainsCountryCodeBw:
                return @"BW";
            case AWSroute53domainsCountryCodeBy:
                return @"BY";
            case AWSroute53domainsCountryCodeBz:
                return @"BZ";
            case AWSroute53domainsCountryCodeCa:
                return @"CA";
            case AWSroute53domainsCountryCodeCc:
                return @"CC";
            case AWSroute53domainsCountryCodeCd:
                return @"CD";
            case AWSroute53domainsCountryCodeCf:
                return @"CF";
            case AWSroute53domainsCountryCodeCg:
                return @"CG";
            case AWSroute53domainsCountryCodeCh:
                return @"CH";
            case AWSroute53domainsCountryCodeCi:
                return @"CI";
            case AWSroute53domainsCountryCodeCk:
                return @"CK";
            case AWSroute53domainsCountryCodeCl:
                return @"CL";
            case AWSroute53domainsCountryCodeCm:
                return @"CM";
            case AWSroute53domainsCountryCodeCn:
                return @"CN";
            case AWSroute53domainsCountryCodeCo:
                return @"CO";
            case AWSroute53domainsCountryCodeCr:
                return @"CR";
            case AWSroute53domainsCountryCodeCu:
                return @"CU";
            case AWSroute53domainsCountryCodeCv:
                return @"CV";
            case AWSroute53domainsCountryCodeCx:
                return @"CX";
            case AWSroute53domainsCountryCodeCy:
                return @"CY";
            case AWSroute53domainsCountryCodeCz:
                return @"CZ";
            case AWSroute53domainsCountryCodeDe:
                return @"DE";
            case AWSroute53domainsCountryCodeDj:
                return @"DJ";
            case AWSroute53domainsCountryCodeDk:
                return @"DK";
            case AWSroute53domainsCountryCodeDm:
                return @"DM";
            case AWSroute53domainsCountryCodeDo:
                return @"DO";
            case AWSroute53domainsCountryCodeDz:
                return @"DZ";
            case AWSroute53domainsCountryCodeEc:
                return @"EC";
            case AWSroute53domainsCountryCodeEe:
                return @"EE";
            case AWSroute53domainsCountryCodeEg:
                return @"EG";
            case AWSroute53domainsCountryCodeEr:
                return @"ER";
            case AWSroute53domainsCountryCodeEs:
                return @"ES";
            case AWSroute53domainsCountryCodeEt:
                return @"ET";
            case AWSroute53domainsCountryCodeFi:
                return @"FI";
            case AWSroute53domainsCountryCodeFj:
                return @"FJ";
            case AWSroute53domainsCountryCodeFk:
                return @"FK";
            case AWSroute53domainsCountryCodeFm:
                return @"FM";
            case AWSroute53domainsCountryCodeFo:
                return @"FO";
            case AWSroute53domainsCountryCodeFr:
                return @"FR";
            case AWSroute53domainsCountryCodeGa:
                return @"GA";
            case AWSroute53domainsCountryCodeGb:
                return @"GB";
            case AWSroute53domainsCountryCodeGd:
                return @"GD";
            case AWSroute53domainsCountryCodeGE:
                return @"GE";
            case AWSroute53domainsCountryCodeGh:
                return @"GH";
            case AWSroute53domainsCountryCodeGi:
                return @"GI";
            case AWSroute53domainsCountryCodeGl:
                return @"GL";
            case AWSroute53domainsCountryCodeGm:
                return @"GM";
            case AWSroute53domainsCountryCodeGn:
                return @"GN";
            case AWSroute53domainsCountryCodeGq:
                return @"GQ";
            case AWSroute53domainsCountryCodeGr:
                return @"GR";
            case AWSroute53domainsCountryCodeGT:
                return @"GT";
            case AWSroute53domainsCountryCodeGu:
                return @"GU";
            case AWSroute53domainsCountryCodeGw:
                return @"GW";
            case AWSroute53domainsCountryCodeGy:
                return @"GY";
            case AWSroute53domainsCountryCodeHk:
                return @"HK";
            case AWSroute53domainsCountryCodeHn:
                return @"HN";
            case AWSroute53domainsCountryCodeHr:
                return @"HR";
            case AWSroute53domainsCountryCodeHt:
                return @"HT";
            case AWSroute53domainsCountryCodeHu:
                return @"HU";
            case AWSroute53domainsCountryCodeId:
                return @"ID";
            case AWSroute53domainsCountryCodeIe:
                return @"IE";
            case AWSroute53domainsCountryCodeIl:
                return @"IL";
            case AWSroute53domainsCountryCodeIm:
                return @"IM";
            case AWSroute53domainsCountryCodeIN:
                return @"IN";
            case AWSroute53domainsCountryCodeIq:
                return @"IQ";
            case AWSroute53domainsCountryCodeIr:
                return @"IR";
            case AWSroute53domainsCountryCodeIs:
                return @"IS";
            case AWSroute53domainsCountryCodeIt:
                return @"IT";
            case AWSroute53domainsCountryCodeJm:
                return @"JM";
            case AWSroute53domainsCountryCodeJo:
                return @"JO";
            case AWSroute53domainsCountryCodeJp:
                return @"JP";
            case AWSroute53domainsCountryCodeKe:
                return @"KE";
            case AWSroute53domainsCountryCodeKg:
                return @"KG";
            case AWSroute53domainsCountryCodeKh:
                return @"KH";
            case AWSroute53domainsCountryCodeKi:
                return @"KI";
            case AWSroute53domainsCountryCodeKm:
                return @"KM";
            case AWSroute53domainsCountryCodeKn:
                return @"KN";
            case AWSroute53domainsCountryCodeKp:
                return @"KP";
            case AWSroute53domainsCountryCodeKr:
                return @"KR";
            case AWSroute53domainsCountryCodeKw:
                return @"KW";
            case AWSroute53domainsCountryCodeKy:
                return @"KY";
            case AWSroute53domainsCountryCodeKz:
                return @"KZ";
            case AWSroute53domainsCountryCodeLa:
                return @"LA";
            case AWSroute53domainsCountryCodeLb:
                return @"LB";
            case AWSroute53domainsCountryCodeLc:
                return @"LC";
            case AWSroute53domainsCountryCodeLi:
                return @"LI";
            case AWSroute53domainsCountryCodeLk:
                return @"LK";
            case AWSroute53domainsCountryCodeLr:
                return @"LR";
            case AWSroute53domainsCountryCodeLs:
                return @"LS";
            case AWSroute53domainsCountryCodeLT:
                return @"LT";
            case AWSroute53domainsCountryCodeLu:
                return @"LU";
            case AWSroute53domainsCountryCodeLv:
                return @"LV";
            case AWSroute53domainsCountryCodeLy:
                return @"LY";
            case AWSroute53domainsCountryCodeMa:
                return @"MA";
            case AWSroute53domainsCountryCodeMc:
                return @"MC";
            case AWSroute53domainsCountryCodeMd:
                return @"MD";
            case AWSroute53domainsCountryCodeMe:
                return @"ME";
            case AWSroute53domainsCountryCodeMf:
                return @"MF";
            case AWSroute53domainsCountryCodeMg:
                return @"MG";
            case AWSroute53domainsCountryCodeMh:
                return @"MH";
            case AWSroute53domainsCountryCodeMk:
                return @"MK";
            case AWSroute53domainsCountryCodeMl:
                return @"ML";
            case AWSroute53domainsCountryCodeMm:
                return @"MM";
            case AWSroute53domainsCountryCodeMn:
                return @"MN";
            case AWSroute53domainsCountryCodeMo:
                return @"MO";
            case AWSroute53domainsCountryCodeMp:
                return @"MP";
            case AWSroute53domainsCountryCodeMr:
                return @"MR";
            case AWSroute53domainsCountryCodeMs:
                return @"MS";
            case AWSroute53domainsCountryCodeMt:
                return @"MT";
            case AWSroute53domainsCountryCodeMu:
                return @"MU";
            case AWSroute53domainsCountryCodeMv:
                return @"MV";
            case AWSroute53domainsCountryCodeMw:
                return @"MW";
            case AWSroute53domainsCountryCodeMx:
                return @"MX";
            case AWSroute53domainsCountryCodeMy:
                return @"MY";
            case AWSroute53domainsCountryCodeMz:
                return @"MZ";
            case AWSroute53domainsCountryCodeNa:
                return @"NA";
            case AWSroute53domainsCountryCodeNc:
                return @"NC";
            case AWSroute53domainsCountryCodeNE:
                return @"NE";
            case AWSroute53domainsCountryCodeNg:
                return @"NG";
            case AWSroute53domainsCountryCodeNi:
                return @"NI";
            case AWSroute53domainsCountryCodeNl:
                return @"NL";
            case AWSroute53domainsCountryCodeNo:
                return @"NO";
            case AWSroute53domainsCountryCodeNp:
                return @"NP";
            case AWSroute53domainsCountryCodeNr:
                return @"NR";
            case AWSroute53domainsCountryCodeNu:
                return @"NU";
            case AWSroute53domainsCountryCodeNz:
                return @"NZ";
            case AWSroute53domainsCountryCodeOm:
                return @"OM";
            case AWSroute53domainsCountryCodePa:
                return @"PA";
            case AWSroute53domainsCountryCodePe:
                return @"PE";
            case AWSroute53domainsCountryCodePf:
                return @"PF";
            case AWSroute53domainsCountryCodePg:
                return @"PG";
            case AWSroute53domainsCountryCodePh:
                return @"PH";
            case AWSroute53domainsCountryCodePk:
                return @"PK";
            case AWSroute53domainsCountryCodePl:
                return @"PL";
            case AWSroute53domainsCountryCodePm:
                return @"PM";
            case AWSroute53domainsCountryCodePn:
                return @"PN";
            case AWSroute53domainsCountryCodePr:
                return @"PR";
            case AWSroute53domainsCountryCodePt:
                return @"PT";
            case AWSroute53domainsCountryCodePw:
                return @"PW";
            case AWSroute53domainsCountryCodePy:
                return @"PY";
            case AWSroute53domainsCountryCodeQa:
                return @"QA";
            case AWSroute53domainsCountryCodeRo:
                return @"RO";
            case AWSroute53domainsCountryCodeRs:
                return @"RS";
            case AWSroute53domainsCountryCodeRu:
                return @"RU";
            case AWSroute53domainsCountryCodeRw:
                return @"RW";
            case AWSroute53domainsCountryCodeSa:
                return @"SA";
            case AWSroute53domainsCountryCodeSb:
                return @"SB";
            case AWSroute53domainsCountryCodeSc:
                return @"SC";
            case AWSroute53domainsCountryCodeSd:
                return @"SD";
            case AWSroute53domainsCountryCodeSe:
                return @"SE";
            case AWSroute53domainsCountryCodeSg:
                return @"SG";
            case AWSroute53domainsCountryCodeSh:
                return @"SH";
            case AWSroute53domainsCountryCodeSi:
                return @"SI";
            case AWSroute53domainsCountryCodeSk:
                return @"SK";
            case AWSroute53domainsCountryCodeSl:
                return @"SL";
            case AWSroute53domainsCountryCodeSm:
                return @"SM";
            case AWSroute53domainsCountryCodeSn:
                return @"SN";
            case AWSroute53domainsCountryCodeSo:
                return @"SO";
            case AWSroute53domainsCountryCodeSr:
                return @"SR";
            case AWSroute53domainsCountryCodeSt:
                return @"ST";
            case AWSroute53domainsCountryCodeSv:
                return @"SV";
            case AWSroute53domainsCountryCodeSy:
                return @"SY";
            case AWSroute53domainsCountryCodeSz:
                return @"SZ";
            case AWSroute53domainsCountryCodeTc:
                return @"TC";
            case AWSroute53domainsCountryCodeTd:
                return @"TD";
            case AWSroute53domainsCountryCodeTg:
                return @"TG";
            case AWSroute53domainsCountryCodeTh:
                return @"TH";
            case AWSroute53domainsCountryCodeTj:
                return @"TJ";
            case AWSroute53domainsCountryCodeTk:
                return @"TK";
            case AWSroute53domainsCountryCodeTl:
                return @"TL";
            case AWSroute53domainsCountryCodeTm:
                return @"TM";
            case AWSroute53domainsCountryCodeTn:
                return @"TN";
            case AWSroute53domainsCountryCodeTo:
                return @"TO";
            case AWSroute53domainsCountryCodeTr:
                return @"TR";
            case AWSroute53domainsCountryCodeTt:
                return @"TT";
            case AWSroute53domainsCountryCodeTv:
                return @"TV";
            case AWSroute53domainsCountryCodeTw:
                return @"TW";
            case AWSroute53domainsCountryCodeTz:
                return @"TZ";
            case AWSroute53domainsCountryCodeUa:
                return @"UA";
            case AWSroute53domainsCountryCodeUg:
                return @"UG";
            case AWSroute53domainsCountryCodeUs:
                return @"US";
            case AWSroute53domainsCountryCodeUy:
                return @"UY";
            case AWSroute53domainsCountryCodeUz:
                return @"UZ";
            case AWSroute53domainsCountryCodeVa:
                return @"VA";
            case AWSroute53domainsCountryCodeVc:
                return @"VC";
            case AWSroute53domainsCountryCodeVe:
                return @"VE";
            case AWSroute53domainsCountryCodeVg:
                return @"VG";
            case AWSroute53domainsCountryCodeVi:
                return @"VI";
            case AWSroute53domainsCountryCodeVn:
                return @"VN";
            case AWSroute53domainsCountryCodeVu:
                return @"VU";
            case AWSroute53domainsCountryCodeWf:
                return @"WF";
            case AWSroute53domainsCountryCodeWs:
                return @"WS";
            case AWSroute53domainsCountryCodeYe:
                return @"YE";
            case AWSroute53domainsCountryCodeYt:
                return @"YT";
            case AWSroute53domainsCountryCodeZa:
                return @"ZA";
            case AWSroute53domainsCountryCodeZm:
                return @"ZM";
            case AWSroute53domainsCountryCodeZw:
                return @"ZW";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)extraParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53domainsExtraParam class]];
}

@end

@implementation AWSroute53domainsDeleteTagsForDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"tagsToDelete" : @"TagsToDelete",
             };
}

@end

@implementation AWSroute53domainsDeleteTagsForDomainResponse

@end

@implementation AWSroute53domainsDisableDomainAutoRenewRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsDisableDomainAutoRenewResponse

@end

@implementation AWSroute53domainsDisableDomainTransferLockRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsDisableDomainTransferLockResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsDomainSuggestion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availability" : @"Availability",
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsDomainSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoRenew" : @"AutoRenew",
             @"domainName" : @"DomainName",
             @"expiry" : @"Expiry",
             @"transferLock" : @"TransferLock",
             };
}

+ (NSValueTransformer *)expiryJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSroute53domainsDomainTransferability

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transferable" : @"Transferable",
             };
}

+ (NSValueTransformer *)transferableJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRANSFERABLE"] == NSOrderedSame) {
            return @(AWSroute53domainsTransferableTransferable);
        }
        if ([value caseInsensitiveCompare:@"UNTRANSFERABLE"] == NSOrderedSame) {
            return @(AWSroute53domainsTransferableUntransferable);
        }
        if ([value caseInsensitiveCompare:@"DONT_KNOW"] == NSOrderedSame) {
            return @(AWSroute53domainsTransferableDontKnow);
        }
        return @(AWSroute53domainsTransferableUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsTransferableTransferable:
                return @"TRANSFERABLE";
            case AWSroute53domainsTransferableUntransferable:
                return @"UNTRANSFERABLE";
            case AWSroute53domainsTransferableDontKnow:
                return @"DONT_KNOW";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53domainsEnableDomainAutoRenewRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsEnableDomainAutoRenewResponse

@end

@implementation AWSroute53domainsEnableDomainTransferLockRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsEnableDomainTransferLockResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsExtraParam

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUNS_NUMBER"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameDunsNumber);
        }
        if ([value caseInsensitiveCompare:@"BRAND_NUMBER"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameBrandNumber);
        }
        if ([value caseInsensitiveCompare:@"BIRTH_DEPARTMENT"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameBirthDepartment);
        }
        if ([value caseInsensitiveCompare:@"BIRTH_DATE_IN_YYYY_MM_DD"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameBirthDateInYyyyMmDd);
        }
        if ([value caseInsensitiveCompare:@"BIRTH_COUNTRY"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameBirthCountry);
        }
        if ([value caseInsensitiveCompare:@"BIRTH_CITY"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameBirthCity);
        }
        if ([value caseInsensitiveCompare:@"DOCUMENT_NUMBER"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameDocumentNumber);
        }
        if ([value caseInsensitiveCompare:@"AU_ID_NUMBER"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameAuIdNumber);
        }
        if ([value caseInsensitiveCompare:@"AU_ID_TYPE"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameAuIdType);
        }
        if ([value caseInsensitiveCompare:@"CA_LEGAL_TYPE"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameCaLegalType);
        }
        if ([value caseInsensitiveCompare:@"CA_BUSINESS_ENTITY_TYPE"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameCaBusinessEntityType);
        }
        if ([value caseInsensitiveCompare:@"CA_LEGAL_REPRESENTATIVE"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameCaLegalRepresentative);
        }
        if ([value caseInsensitiveCompare:@"CA_LEGAL_REPRESENTATIVE_CAPACITY"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameCaLegalRepresentativeCapacity);
        }
        if ([value caseInsensitiveCompare:@"ES_IDENTIFICATION"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameEsIdentification);
        }
        if ([value caseInsensitiveCompare:@"ES_IDENTIFICATION_TYPE"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameEsIdentificationType);
        }
        if ([value caseInsensitiveCompare:@"ES_LEGAL_FORM"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameEsLegalForm);
        }
        if ([value caseInsensitiveCompare:@"FI_BUSINESS_NUMBER"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameFiBusinessNumber);
        }
        if ([value caseInsensitiveCompare:@"FI_ID_NUMBER"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameFiIdNumber);
        }
        if ([value caseInsensitiveCompare:@"FI_NATIONALITY"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameFiNationality);
        }
        if ([value caseInsensitiveCompare:@"FI_ORGANIZATION_TYPE"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameFiOrganizationType);
        }
        if ([value caseInsensitiveCompare:@"IT_NATIONALITY"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameItNationality);
        }
        if ([value caseInsensitiveCompare:@"IT_PIN"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameItPin);
        }
        if ([value caseInsensitiveCompare:@"IT_REGISTRANT_ENTITY_TYPE"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameItRegistrantEntityType);
        }
        if ([value caseInsensitiveCompare:@"RU_PASSPORT_DATA"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameRuPassportData);
        }
        if ([value caseInsensitiveCompare:@"SE_ID_NUMBER"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameSeIdNumber);
        }
        if ([value caseInsensitiveCompare:@"SG_ID_NUMBER"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameSgIdNumber);
        }
        if ([value caseInsensitiveCompare:@"VAT_NUMBER"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameVatNumber);
        }
        if ([value caseInsensitiveCompare:@"UK_CONTACT_TYPE"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameUkContactType);
        }
        if ([value caseInsensitiveCompare:@"UK_COMPANY_NUMBER"] == NSOrderedSame) {
            return @(AWSroute53domainsExtraParamNameUkCompanyNumber);
        }
        return @(AWSroute53domainsExtraParamNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsExtraParamNameDunsNumber:
                return @"DUNS_NUMBER";
            case AWSroute53domainsExtraParamNameBrandNumber:
                return @"BRAND_NUMBER";
            case AWSroute53domainsExtraParamNameBirthDepartment:
                return @"BIRTH_DEPARTMENT";
            case AWSroute53domainsExtraParamNameBirthDateInYyyyMmDd:
                return @"BIRTH_DATE_IN_YYYY_MM_DD";
            case AWSroute53domainsExtraParamNameBirthCountry:
                return @"BIRTH_COUNTRY";
            case AWSroute53domainsExtraParamNameBirthCity:
                return @"BIRTH_CITY";
            case AWSroute53domainsExtraParamNameDocumentNumber:
                return @"DOCUMENT_NUMBER";
            case AWSroute53domainsExtraParamNameAuIdNumber:
                return @"AU_ID_NUMBER";
            case AWSroute53domainsExtraParamNameAuIdType:
                return @"AU_ID_TYPE";
            case AWSroute53domainsExtraParamNameCaLegalType:
                return @"CA_LEGAL_TYPE";
            case AWSroute53domainsExtraParamNameCaBusinessEntityType:
                return @"CA_BUSINESS_ENTITY_TYPE";
            case AWSroute53domainsExtraParamNameCaLegalRepresentative:
                return @"CA_LEGAL_REPRESENTATIVE";
            case AWSroute53domainsExtraParamNameCaLegalRepresentativeCapacity:
                return @"CA_LEGAL_REPRESENTATIVE_CAPACITY";
            case AWSroute53domainsExtraParamNameEsIdentification:
                return @"ES_IDENTIFICATION";
            case AWSroute53domainsExtraParamNameEsIdentificationType:
                return @"ES_IDENTIFICATION_TYPE";
            case AWSroute53domainsExtraParamNameEsLegalForm:
                return @"ES_LEGAL_FORM";
            case AWSroute53domainsExtraParamNameFiBusinessNumber:
                return @"FI_BUSINESS_NUMBER";
            case AWSroute53domainsExtraParamNameFiIdNumber:
                return @"FI_ID_NUMBER";
            case AWSroute53domainsExtraParamNameFiNationality:
                return @"FI_NATIONALITY";
            case AWSroute53domainsExtraParamNameFiOrganizationType:
                return @"FI_ORGANIZATION_TYPE";
            case AWSroute53domainsExtraParamNameItNationality:
                return @"IT_NATIONALITY";
            case AWSroute53domainsExtraParamNameItPin:
                return @"IT_PIN";
            case AWSroute53domainsExtraParamNameItRegistrantEntityType:
                return @"IT_REGISTRANT_ENTITY_TYPE";
            case AWSroute53domainsExtraParamNameRuPassportData:
                return @"RU_PASSPORT_DATA";
            case AWSroute53domainsExtraParamNameSeIdNumber:
                return @"SE_ID_NUMBER";
            case AWSroute53domainsExtraParamNameSgIdNumber:
                return @"SG_ID_NUMBER";
            case AWSroute53domainsExtraParamNameVatNumber:
                return @"VAT_NUMBER";
            case AWSroute53domainsExtraParamNameUkContactType:
                return @"UK_CONTACT_TYPE";
            case AWSroute53domainsExtraParamNameUkCompanyNumber:
                return @"UK_COMPANY_NUMBER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53domainsGetContactReachabilityStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"domainName",
             };
}

@end

@implementation AWSroute53domainsGetContactReachabilityStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"domainName",
             @"status" : @"status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSroute53domainsReachabilityStatusPending);
        }
        if ([value caseInsensitiveCompare:@"DONE"] == NSOrderedSame) {
            return @(AWSroute53domainsReachabilityStatusDone);
        }
        if ([value caseInsensitiveCompare:@"EXPIRED"] == NSOrderedSame) {
            return @(AWSroute53domainsReachabilityStatusExpired);
        }
        return @(AWSroute53domainsReachabilityStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsReachabilityStatusPending:
                return @"PENDING";
            case AWSroute53domainsReachabilityStatusDone:
                return @"DONE";
            case AWSroute53domainsReachabilityStatusExpired:
                return @"EXPIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53domainsGetDomainDetailRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsGetDomainDetailResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abuseContactEmail" : @"AbuseContactEmail",
             @"abuseContactPhone" : @"AbuseContactPhone",
             @"adminContact" : @"AdminContact",
             @"adminPrivacy" : @"AdminPrivacy",
             @"autoRenew" : @"AutoRenew",
             @"creationDate" : @"CreationDate",
             @"dnsSec" : @"DnsSec",
             @"domainName" : @"DomainName",
             @"expirationDate" : @"ExpirationDate",
             @"nameservers" : @"Nameservers",
             @"registrantContact" : @"RegistrantContact",
             @"registrantPrivacy" : @"RegistrantPrivacy",
             @"registrarName" : @"RegistrarName",
             @"registrarUrl" : @"RegistrarUrl",
             @"registryDomainId" : @"RegistryDomainId",
             @"reseller" : @"Reseller",
             @"statusList" : @"StatusList",
             @"techContact" : @"TechContact",
             @"techPrivacy" : @"TechPrivacy",
             @"updatedDate" : @"UpdatedDate",
             @"whoIsServer" : @"WhoIsServer",
             };
}

+ (NSValueTransformer *)adminContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)expirationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)nameserversJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53domainsNameserver class]];
}

+ (NSValueTransformer *)registrantContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

+ (NSValueTransformer *)techContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

+ (NSValueTransformer *)updatedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSroute53domainsGetDomainSuggestionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"onlyAvailable" : @"OnlyAvailable",
             @"suggestionCount" : @"SuggestionCount",
             };
}

@end

@implementation AWSroute53domainsGetDomainSuggestionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"suggestionsList" : @"SuggestionsList",
             };
}

+ (NSValueTransformer *)suggestionsListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53domainsDomainSuggestion class]];
}

@end

@implementation AWSroute53domainsGetOperationDetailRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsGetOperationDetailResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"message" : @"Message",
             @"operationId" : @"OperationId",
             @"status" : @"Status",
             @"submittedDate" : @"SubmittedDate",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationStatusError);
        }
        if ([value caseInsensitiveCompare:@"SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationStatusFailed);
        }
        return @(AWSroute53domainsOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsOperationStatusSubmitted:
                return @"SUBMITTED";
            case AWSroute53domainsOperationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSroute53domainsOperationStatusError:
                return @"ERROR";
            case AWSroute53domainsOperationStatusSuccessful:
                return @"SUCCESSFUL";
            case AWSroute53domainsOperationStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submittedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGISTER_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeRegisterDomain);
        }
        if ([value caseInsensitiveCompare:@"DELETE_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeDeleteDomain);
        }
        if ([value caseInsensitiveCompare:@"TRANSFER_IN_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeTransferInDomain);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_DOMAIN_CONTACT"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeUpdateDomainContact);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_NAMESERVER"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeUpdateNameserver);
        }
        if ([value caseInsensitiveCompare:@"CHANGE_PRIVACY_PROTECTION"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeChangePrivacyProtection);
        }
        if ([value caseInsensitiveCompare:@"DOMAIN_LOCK"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeDomainLock);
        }
        if ([value caseInsensitiveCompare:@"ENABLE_AUTORENEW"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeEnableAutorenew);
        }
        if ([value caseInsensitiveCompare:@"DISABLE_AUTORENEW"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeDisableAutorenew);
        }
        if ([value caseInsensitiveCompare:@"ADD_DNSSEC"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeAddDnssec);
        }
        if ([value caseInsensitiveCompare:@"REMOVE_DNSSEC"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeRemoveDnssec);
        }
        if ([value caseInsensitiveCompare:@"EXPIRE_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeExpireDomain);
        }
        if ([value caseInsensitiveCompare:@"TRANSFER_OUT_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeTransferOutDomain);
        }
        if ([value caseInsensitiveCompare:@"CHANGE_DOMAIN_OWNER"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeChangeDomainOwner);
        }
        if ([value caseInsensitiveCompare:@"RENEW_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeRenewDomain);
        }
        if ([value caseInsensitiveCompare:@"PUSH_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypePushDomain);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_TRANSFER_OUT_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeInternalTransferOutDomain);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_TRANSFER_IN_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeInternalTransferInDomain);
        }
        return @(AWSroute53domainsOperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsOperationTypeRegisterDomain:
                return @"REGISTER_DOMAIN";
            case AWSroute53domainsOperationTypeDeleteDomain:
                return @"DELETE_DOMAIN";
            case AWSroute53domainsOperationTypeTransferInDomain:
                return @"TRANSFER_IN_DOMAIN";
            case AWSroute53domainsOperationTypeUpdateDomainContact:
                return @"UPDATE_DOMAIN_CONTACT";
            case AWSroute53domainsOperationTypeUpdateNameserver:
                return @"UPDATE_NAMESERVER";
            case AWSroute53domainsOperationTypeChangePrivacyProtection:
                return @"CHANGE_PRIVACY_PROTECTION";
            case AWSroute53domainsOperationTypeDomainLock:
                return @"DOMAIN_LOCK";
            case AWSroute53domainsOperationTypeEnableAutorenew:
                return @"ENABLE_AUTORENEW";
            case AWSroute53domainsOperationTypeDisableAutorenew:
                return @"DISABLE_AUTORENEW";
            case AWSroute53domainsOperationTypeAddDnssec:
                return @"ADD_DNSSEC";
            case AWSroute53domainsOperationTypeRemoveDnssec:
                return @"REMOVE_DNSSEC";
            case AWSroute53domainsOperationTypeExpireDomain:
                return @"EXPIRE_DOMAIN";
            case AWSroute53domainsOperationTypeTransferOutDomain:
                return @"TRANSFER_OUT_DOMAIN";
            case AWSroute53domainsOperationTypeChangeDomainOwner:
                return @"CHANGE_DOMAIN_OWNER";
            case AWSroute53domainsOperationTypeRenewDomain:
                return @"RENEW_DOMAIN";
            case AWSroute53domainsOperationTypePushDomain:
                return @"PUSH_DOMAIN";
            case AWSroute53domainsOperationTypeInternalTransferOutDomain:
                return @"INTERNAL_TRANSFER_OUT_DOMAIN";
            case AWSroute53domainsOperationTypeInternalTransferInDomain:
                return @"INTERNAL_TRANSFER_IN_DOMAIN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53domainsListDomainsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             };
}

@end

@implementation AWSroute53domainsListDomainsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domains" : @"Domains",
             @"nextPageMarker" : @"NextPageMarker",
             };
}

+ (NSValueTransformer *)domainsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53domainsDomainSummary class]];
}

@end

@implementation AWSroute53domainsListOperationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"submittedSince" : @"SubmittedSince",
             };
}

+ (NSValueTransformer *)submittedSinceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSroute53domainsListOperationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageMarker" : @"NextPageMarker",
             @"operations" : @"Operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53domainsOperationSummary class]];
}

@end

@implementation AWSroute53domainsListTagsForDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsListTagsForDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagList" : @"TagList",
             };
}

+ (NSValueTransformer *)tagListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53domainsTag class]];
}

@end

@implementation AWSroute53domainsNameserver

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"glueIps" : @"GlueIps",
             @"name" : @"Name",
             };
}

@end

@implementation AWSroute53domainsOperationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             @"status" : @"Status",
             @"submittedDate" : @"SubmittedDate",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationStatusError);
        }
        if ([value caseInsensitiveCompare:@"SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationStatusFailed);
        }
        return @(AWSroute53domainsOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsOperationStatusSubmitted:
                return @"SUBMITTED";
            case AWSroute53domainsOperationStatusInProgress:
                return @"IN_PROGRESS";
            case AWSroute53domainsOperationStatusError:
                return @"ERROR";
            case AWSroute53domainsOperationStatusSuccessful:
                return @"SUCCESSFUL";
            case AWSroute53domainsOperationStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submittedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"REGISTER_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeRegisterDomain);
        }
        if ([value caseInsensitiveCompare:@"DELETE_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeDeleteDomain);
        }
        if ([value caseInsensitiveCompare:@"TRANSFER_IN_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeTransferInDomain);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_DOMAIN_CONTACT"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeUpdateDomainContact);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_NAMESERVER"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeUpdateNameserver);
        }
        if ([value caseInsensitiveCompare:@"CHANGE_PRIVACY_PROTECTION"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeChangePrivacyProtection);
        }
        if ([value caseInsensitiveCompare:@"DOMAIN_LOCK"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeDomainLock);
        }
        if ([value caseInsensitiveCompare:@"ENABLE_AUTORENEW"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeEnableAutorenew);
        }
        if ([value caseInsensitiveCompare:@"DISABLE_AUTORENEW"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeDisableAutorenew);
        }
        if ([value caseInsensitiveCompare:@"ADD_DNSSEC"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeAddDnssec);
        }
        if ([value caseInsensitiveCompare:@"REMOVE_DNSSEC"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeRemoveDnssec);
        }
        if ([value caseInsensitiveCompare:@"EXPIRE_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeExpireDomain);
        }
        if ([value caseInsensitiveCompare:@"TRANSFER_OUT_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeTransferOutDomain);
        }
        if ([value caseInsensitiveCompare:@"CHANGE_DOMAIN_OWNER"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeChangeDomainOwner);
        }
        if ([value caseInsensitiveCompare:@"RENEW_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeRenewDomain);
        }
        if ([value caseInsensitiveCompare:@"PUSH_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypePushDomain);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_TRANSFER_OUT_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeInternalTransferOutDomain);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_TRANSFER_IN_DOMAIN"] == NSOrderedSame) {
            return @(AWSroute53domainsOperationTypeInternalTransferInDomain);
        }
        return @(AWSroute53domainsOperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSroute53domainsOperationTypeRegisterDomain:
                return @"REGISTER_DOMAIN";
            case AWSroute53domainsOperationTypeDeleteDomain:
                return @"DELETE_DOMAIN";
            case AWSroute53domainsOperationTypeTransferInDomain:
                return @"TRANSFER_IN_DOMAIN";
            case AWSroute53domainsOperationTypeUpdateDomainContact:
                return @"UPDATE_DOMAIN_CONTACT";
            case AWSroute53domainsOperationTypeUpdateNameserver:
                return @"UPDATE_NAMESERVER";
            case AWSroute53domainsOperationTypeChangePrivacyProtection:
                return @"CHANGE_PRIVACY_PROTECTION";
            case AWSroute53domainsOperationTypeDomainLock:
                return @"DOMAIN_LOCK";
            case AWSroute53domainsOperationTypeEnableAutorenew:
                return @"ENABLE_AUTORENEW";
            case AWSroute53domainsOperationTypeDisableAutorenew:
                return @"DISABLE_AUTORENEW";
            case AWSroute53domainsOperationTypeAddDnssec:
                return @"ADD_DNSSEC";
            case AWSroute53domainsOperationTypeRemoveDnssec:
                return @"REMOVE_DNSSEC";
            case AWSroute53domainsOperationTypeExpireDomain:
                return @"EXPIRE_DOMAIN";
            case AWSroute53domainsOperationTypeTransferOutDomain:
                return @"TRANSFER_OUT_DOMAIN";
            case AWSroute53domainsOperationTypeChangeDomainOwner:
                return @"CHANGE_DOMAIN_OWNER";
            case AWSroute53domainsOperationTypeRenewDomain:
                return @"RENEW_DOMAIN";
            case AWSroute53domainsOperationTypePushDomain:
                return @"PUSH_DOMAIN";
            case AWSroute53domainsOperationTypeInternalTransferOutDomain:
                return @"INTERNAL_TRANSFER_OUT_DOMAIN";
            case AWSroute53domainsOperationTypeInternalTransferInDomain:
                return @"INTERNAL_TRANSFER_IN_DOMAIN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSroute53domainsRegisterDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminContact" : @"AdminContact",
             @"autoRenew" : @"AutoRenew",
             @"domainName" : @"DomainName",
             @"durationInYears" : @"DurationInYears",
             @"idnLangCode" : @"IdnLangCode",
             @"privacyProtectAdminContact" : @"PrivacyProtectAdminContact",
             @"privacyProtectRegistrantContact" : @"PrivacyProtectRegistrantContact",
             @"privacyProtectTechContact" : @"PrivacyProtectTechContact",
             @"registrantContact" : @"RegistrantContact",
             @"techContact" : @"TechContact",
             };
}

+ (NSValueTransformer *)adminContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

+ (NSValueTransformer *)registrantContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

+ (NSValueTransformer *)techContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

@end

@implementation AWSroute53domainsRegisterDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsRenewDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentExpiryYear" : @"CurrentExpiryYear",
             @"domainName" : @"DomainName",
             @"durationInYears" : @"DurationInYears",
             };
}

@end

@implementation AWSroute53domainsRenewDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsResendContactReachabilityEmailRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"domainName",
             };
}

@end

@implementation AWSroute53domainsResendContactReachabilityEmailResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"domainName",
             @"emailAddress" : @"emailAddress",
             @"isAlreadyVerified" : @"isAlreadyVerified",
             };
}

@end

@implementation AWSroute53domainsRetrieveDomainAuthCodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsRetrieveDomainAuthCodeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authCode" : @"AuthCode",
             };
}

@end

@implementation AWSroute53domainsTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSroute53domainsTransferDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminContact" : @"AdminContact",
             @"authCode" : @"AuthCode",
             @"autoRenew" : @"AutoRenew",
             @"domainName" : @"DomainName",
             @"durationInYears" : @"DurationInYears",
             @"idnLangCode" : @"IdnLangCode",
             @"nameservers" : @"Nameservers",
             @"privacyProtectAdminContact" : @"PrivacyProtectAdminContact",
             @"privacyProtectRegistrantContact" : @"PrivacyProtectRegistrantContact",
             @"privacyProtectTechContact" : @"PrivacyProtectTechContact",
             @"registrantContact" : @"RegistrantContact",
             @"techContact" : @"TechContact",
             };
}

+ (NSValueTransformer *)adminContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

+ (NSValueTransformer *)nameserversJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53domainsNameserver class]];
}

+ (NSValueTransformer *)registrantContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

+ (NSValueTransformer *)techContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

@end

@implementation AWSroute53domainsTransferDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsTransferDomainToAnotherAwsAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"domainName" : @"DomainName",
             };
}

@end

@implementation AWSroute53domainsTransferDomainToAnotherAwsAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             @"password" : @"Password",
             };
}

@end

@implementation AWSroute53domainsUpdateDomainContactPrivacyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminPrivacy" : @"AdminPrivacy",
             @"domainName" : @"DomainName",
             @"registrantPrivacy" : @"RegistrantPrivacy",
             @"techPrivacy" : @"TechPrivacy",
             };
}

@end

@implementation AWSroute53domainsUpdateDomainContactPrivacyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsUpdateDomainContactRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adminContact" : @"AdminContact",
             @"domainName" : @"DomainName",
             @"registrantContact" : @"RegistrantContact",
             @"techContact" : @"TechContact",
             };
}

+ (NSValueTransformer *)adminContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

+ (NSValueTransformer *)registrantContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

+ (NSValueTransformer *)techContactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSroute53domainsContactDetail class]];
}

@end

@implementation AWSroute53domainsUpdateDomainContactResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsUpdateDomainNameserversRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"FIAuthKey" : @"FIAuthKey",
             @"nameservers" : @"Nameservers",
             };
}

+ (NSValueTransformer *)nameserversJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53domainsNameserver class]];
}

@end

@implementation AWSroute53domainsUpdateDomainNameserversResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSroute53domainsUpdateTagsForDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"tagsToUpdate" : @"TagsToUpdate",
             };
}

+ (NSValueTransformer *)tagsToUpdateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53domainsTag class]];
}

@end

@implementation AWSroute53domainsUpdateTagsForDomainResponse

@end

@implementation AWSroute53domainsViewBillingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"end" : @"End",
             @"marker" : @"Marker",
             @"maxItems" : @"MaxItems",
             @"start" : @"Start",
             };
}

+ (NSValueTransformer *)endJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSroute53domainsViewBillingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"billingRecords" : @"BillingRecords",
             @"nextPageMarker" : @"NextPageMarker",
             };
}

+ (NSValueTransformer *)billingRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSroute53domainsBillingRecord class]];
}

@end
