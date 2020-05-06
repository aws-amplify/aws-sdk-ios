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

#import "AWSAWSComprehendMedicalModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAWSComprehendMedicalErrorDomain = @"com.amazonaws.AWSAWSComprehendMedicalErrorDomain";

@implementation AWSAWSComprehendMedicalAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"category" : @"Category",
             @"endOffset" : @"EndOffset",
             @"identifier" : @"Id",
             @"relationshipScore" : @"RelationshipScore",
             @"relationshipType" : @"RelationshipType",
             @"score" : @"Score",
             @"text" : @"Text",
             @"traits" : @"Traits",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)categoryJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MEDICATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeMedication);
        }
        if ([value caseInsensitiveCompare:@"MEDICAL_CONDITION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeMedicalCondition);
        }
        if ([value caseInsensitiveCompare:@"PROTECTED_HEALTH_INFORMATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeProtectedHealthInformation);
        }
        if ([value caseInsensitiveCompare:@"TEST_TREATMENT_PROCEDURE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeTestTreatmentProcedure);
        }
        if ([value caseInsensitiveCompare:@"ANATOMY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeAnatomy);
        }
        if ([value caseInsensitiveCompare:@"TIME_EXPRESSION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeTimeExpression);
        }
        return @(AWSAWSComprehendMedicalEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalEntityTypeMedication:
                return @"MEDICATION";
            case AWSAWSComprehendMedicalEntityTypeMedicalCondition:
                return @"MEDICAL_CONDITION";
            case AWSAWSComprehendMedicalEntityTypeProtectedHealthInformation:
                return @"PROTECTED_HEALTH_INFORMATION";
            case AWSAWSComprehendMedicalEntityTypeTestTreatmentProcedure:
                return @"TEST_TREATMENT_PROCEDURE";
            case AWSAWSComprehendMedicalEntityTypeAnatomy:
                return @"ANATOMY";
            case AWSAWSComprehendMedicalEntityTypeTimeExpression:
                return @"TIME_EXPRESSION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)relationshipTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EVERY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeEvery);
        }
        if ([value caseInsensitiveCompare:@"WITH_DOSAGE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeWithDosage);
        }
        if ([value caseInsensitiveCompare:@"ADMINISTERED_VIA"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeAdministeredVia);
        }
        if ([value caseInsensitiveCompare:@"FOR"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeFor);
        }
        if ([value caseInsensitiveCompare:@"NEGATIVE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeNegative);
        }
        if ([value caseInsensitiveCompare:@"OVERLAP"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeOverlap);
        }
        if ([value caseInsensitiveCompare:@"DOSAGE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeDosage);
        }
        if ([value caseInsensitiveCompare:@"ROUTE_OR_MODE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeRouteOrMode);
        }
        if ([value caseInsensitiveCompare:@"FORM"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeForm);
        }
        if ([value caseInsensitiveCompare:@"FREQUENCY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeFrequency);
        }
        if ([value caseInsensitiveCompare:@"DURATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeDuration);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeStrength);
        }
        if ([value caseInsensitiveCompare:@"RATE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeRate);
        }
        if ([value caseInsensitiveCompare:@"ACUITY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeAcuity);
        }
        if ([value caseInsensitiveCompare:@"TEST_VALUE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeTestValue);
        }
        if ([value caseInsensitiveCompare:@"TEST_UNITS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeTestUnits);
        }
        if ([value caseInsensitiveCompare:@"DIRECTION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRelationshipTypeDirection);
        }
        return @(AWSAWSComprehendMedicalRelationshipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalRelationshipTypeEvery:
                return @"EVERY";
            case AWSAWSComprehendMedicalRelationshipTypeWithDosage:
                return @"WITH_DOSAGE";
            case AWSAWSComprehendMedicalRelationshipTypeAdministeredVia:
                return @"ADMINISTERED_VIA";
            case AWSAWSComprehendMedicalRelationshipTypeFor:
                return @"FOR";
            case AWSAWSComprehendMedicalRelationshipTypeNegative:
                return @"NEGATIVE";
            case AWSAWSComprehendMedicalRelationshipTypeOverlap:
                return @"OVERLAP";
            case AWSAWSComprehendMedicalRelationshipTypeDosage:
                return @"DOSAGE";
            case AWSAWSComprehendMedicalRelationshipTypeRouteOrMode:
                return @"ROUTE_OR_MODE";
            case AWSAWSComprehendMedicalRelationshipTypeForm:
                return @"FORM";
            case AWSAWSComprehendMedicalRelationshipTypeFrequency:
                return @"FREQUENCY";
            case AWSAWSComprehendMedicalRelationshipTypeDuration:
                return @"DURATION";
            case AWSAWSComprehendMedicalRelationshipTypeStrength:
                return @"STRENGTH";
            case AWSAWSComprehendMedicalRelationshipTypeRate:
                return @"RATE";
            case AWSAWSComprehendMedicalRelationshipTypeAcuity:
                return @"ACUITY";
            case AWSAWSComprehendMedicalRelationshipTypeTestValue:
                return @"TEST_VALUE";
            case AWSAWSComprehendMedicalRelationshipTypeTestUnits:
                return @"TEST_UNITS";
            case AWSAWSComprehendMedicalRelationshipTypeDirection:
                return @"DIRECTION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)traitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalTrait class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeName);
        }
        if ([value caseInsensitiveCompare:@"DOSAGE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeDosage);
        }
        if ([value caseInsensitiveCompare:@"ROUTE_OR_MODE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeRouteOrMode);
        }
        if ([value caseInsensitiveCompare:@"FORM"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeForm);
        }
        if ([value caseInsensitiveCompare:@"FREQUENCY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeFrequency);
        }
        if ([value caseInsensitiveCompare:@"DURATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeDuration);
        }
        if ([value caseInsensitiveCompare:@"GENERIC_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeGenericName);
        }
        if ([value caseInsensitiveCompare:@"BRAND_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeBrandName);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeStrength);
        }
        if ([value caseInsensitiveCompare:@"RATE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeRate);
        }
        if ([value caseInsensitiveCompare:@"ACUITY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeAcuity);
        }
        if ([value caseInsensitiveCompare:@"TEST_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTestName);
        }
        if ([value caseInsensitiveCompare:@"TEST_VALUE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTestValue);
        }
        if ([value caseInsensitiveCompare:@"TEST_UNITS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTestUnits);
        }
        if ([value caseInsensitiveCompare:@"PROCEDURE_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeProcedureName);
        }
        if ([value caseInsensitiveCompare:@"TREATMENT_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTreatmentName);
        }
        if ([value caseInsensitiveCompare:@"DATE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeDate);
        }
        if ([value caseInsensitiveCompare:@"AGE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeAge);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_POINT"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeContactPoint);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"IDENTIFIER"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeIdentifier);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeUrl);
        }
        if ([value caseInsensitiveCompare:@"ADDRESS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeAddress);
        }
        if ([value caseInsensitiveCompare:@"PROFESSION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeProfession);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_ORGAN_SITE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeSystemOrganSite);
        }
        if ([value caseInsensitiveCompare:@"DIRECTION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeDirection);
        }
        if ([value caseInsensitiveCompare:@"QUALITY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeQuality);
        }
        if ([value caseInsensitiveCompare:@"QUANTITY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeQuantity);
        }
        if ([value caseInsensitiveCompare:@"TIME_EXPRESSION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeExpression);
        }
        if ([value caseInsensitiveCompare:@"TIME_TO_MEDICATION_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeToMedicationName);
        }
        if ([value caseInsensitiveCompare:@"TIME_TO_DX_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeToDxName);
        }
        if ([value caseInsensitiveCompare:@"TIME_TO_TEST_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeToTestName);
        }
        if ([value caseInsensitiveCompare:@"TIME_TO_PROCEDURE_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeToProcedureName);
        }
        if ([value caseInsensitiveCompare:@"TIME_TO_TREATMENT_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeToTreatmentName);
        }
        return @(AWSAWSComprehendMedicalEntitySubTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalEntitySubTypeName:
                return @"NAME";
            case AWSAWSComprehendMedicalEntitySubTypeDosage:
                return @"DOSAGE";
            case AWSAWSComprehendMedicalEntitySubTypeRouteOrMode:
                return @"ROUTE_OR_MODE";
            case AWSAWSComprehendMedicalEntitySubTypeForm:
                return @"FORM";
            case AWSAWSComprehendMedicalEntitySubTypeFrequency:
                return @"FREQUENCY";
            case AWSAWSComprehendMedicalEntitySubTypeDuration:
                return @"DURATION";
            case AWSAWSComprehendMedicalEntitySubTypeGenericName:
                return @"GENERIC_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeBrandName:
                return @"BRAND_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeStrength:
                return @"STRENGTH";
            case AWSAWSComprehendMedicalEntitySubTypeRate:
                return @"RATE";
            case AWSAWSComprehendMedicalEntitySubTypeAcuity:
                return @"ACUITY";
            case AWSAWSComprehendMedicalEntitySubTypeTestName:
                return @"TEST_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTestValue:
                return @"TEST_VALUE";
            case AWSAWSComprehendMedicalEntitySubTypeTestUnits:
                return @"TEST_UNITS";
            case AWSAWSComprehendMedicalEntitySubTypeProcedureName:
                return @"PROCEDURE_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTreatmentName:
                return @"TREATMENT_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeDate:
                return @"DATE";
            case AWSAWSComprehendMedicalEntitySubTypeAge:
                return @"AGE";
            case AWSAWSComprehendMedicalEntitySubTypeContactPoint:
                return @"CONTACT_POINT";
            case AWSAWSComprehendMedicalEntitySubTypeEmail:
                return @"EMAIL";
            case AWSAWSComprehendMedicalEntitySubTypeIdentifier:
                return @"IDENTIFIER";
            case AWSAWSComprehendMedicalEntitySubTypeUrl:
                return @"URL";
            case AWSAWSComprehendMedicalEntitySubTypeAddress:
                return @"ADDRESS";
            case AWSAWSComprehendMedicalEntitySubTypeProfession:
                return @"PROFESSION";
            case AWSAWSComprehendMedicalEntitySubTypeSystemOrganSite:
                return @"SYSTEM_ORGAN_SITE";
            case AWSAWSComprehendMedicalEntitySubTypeDirection:
                return @"DIRECTION";
            case AWSAWSComprehendMedicalEntitySubTypeQuality:
                return @"QUALITY";
            case AWSAWSComprehendMedicalEntitySubTypeQuantity:
                return @"QUANTITY";
            case AWSAWSComprehendMedicalEntitySubTypeTimeExpression:
                return @"TIME_EXPRESSION";
            case AWSAWSComprehendMedicalEntitySubTypeTimeToMedicationName:
                return @"TIME_TO_MEDICATION_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTimeToDxName:
                return @"TIME_TO_DX_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTimeToTestName:
                return @"TIME_TO_TEST_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTimeToProcedureName:
                return @"TIME_TO_PROCEDURE_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTimeToTreatmentName:
                return @"TIME_TO_TREATMENT_NAME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"submitTimeAfter" : @"SubmitTimeAfter",
             @"submitTimeBefore" : @"SubmitTimeBefore",
             };
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_SUCCESS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusPartialSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusStopped);
        }
        return @(AWSAWSComprehendMedicalJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSAWSComprehendMedicalJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSAWSComprehendMedicalJobStatusCompleted:
                return @"COMPLETED";
            case AWSAWSComprehendMedicalJobStatusPartialSuccess:
                return @"PARTIAL_SUCCESS";
            case AWSAWSComprehendMedicalJobStatusFailed:
                return @"FAILED";
            case AWSAWSComprehendMedicalJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSAWSComprehendMedicalJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)submitTimeAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)submitTimeBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"endTime" : @"EndTime",
             @"expirationTime" : @"ExpirationTime",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"jobStatus" : @"JobStatus",
             @"KMSKey" : @"KMSKey",
             @"languageCode" : @"LanguageCode",
             @"manifestFilePath" : @"ManifestFilePath",
             @"message" : @"Message",
             @"modelVersion" : @"ModelVersion",
             @"outputDataConfig" : @"OutputDataConfig",
             @"submitTime" : @"SubmitTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)expirationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalInputDataConfig class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"PARTIAL_SUCCESS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusPartialSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"STOP_REQUESTED"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusStopRequested);
        }
        if ([value caseInsensitiveCompare:@"STOPPED"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalJobStatusStopped);
        }
        return @(AWSAWSComprehendMedicalJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalJobStatusSubmitted:
                return @"SUBMITTED";
            case AWSAWSComprehendMedicalJobStatusInProgress:
                return @"IN_PROGRESS";
            case AWSAWSComprehendMedicalJobStatusCompleted:
                return @"COMPLETED";
            case AWSAWSComprehendMedicalJobStatusPartialSuccess:
                return @"PARTIAL_SUCCESS";
            case AWSAWSComprehendMedicalJobStatusFailed:
                return @"FAILED";
            case AWSAWSComprehendMedicalJobStatusStopRequested:
                return @"STOP_REQUESTED";
            case AWSAWSComprehendMedicalJobStatusStopped:
                return @"STOPPED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalLanguageCodeEn);
        }
        return @(AWSAWSComprehendMedicalLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalLanguageCodeEn:
                return @"en";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalOutputDataConfig class]];
}

+ (NSValueTransformer *)submitTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comprehendMedicalAsyncJobProperties" : @"ComprehendMedicalAsyncJobProperties",
             };
}

+ (NSValueTransformer *)comprehendMedicalAsyncJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties class]];
}

@end

@implementation AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comprehendMedicalAsyncJobProperties" : @"ComprehendMedicalAsyncJobProperties",
             };
}

+ (NSValueTransformer *)comprehendMedicalAsyncJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties class]];
}

@end

@implementation AWSAWSComprehendMedicalDescribePHIDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalDescribePHIDetectionJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comprehendMedicalAsyncJobProperties" : @"ComprehendMedicalAsyncJobProperties",
             };
}

+ (NSValueTransformer *)comprehendMedicalAsyncJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties class]];
}

@end

@implementation AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comprehendMedicalAsyncJobProperties" : @"ComprehendMedicalAsyncJobProperties",
             };
}

+ (NSValueTransformer *)comprehendMedicalAsyncJobPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties class]];
}

@end

@implementation AWSAWSComprehendMedicalDetectEntitiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             };
}

@end

@implementation AWSAWSComprehendMedicalDetectEntitiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"modelVersion" : @"ModelVersion",
             @"paginationToken" : @"PaginationToken",
             @"unmappedAttributes" : @"UnmappedAttributes",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalEntity class]];
}

+ (NSValueTransformer *)unmappedAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalUnmappedAttribute class]];
}

@end

@implementation AWSAWSComprehendMedicalDetectEntitiesV2Request

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             };
}

@end

@implementation AWSAWSComprehendMedicalDetectEntitiesV2Response

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"modelVersion" : @"ModelVersion",
             @"paginationToken" : @"PaginationToken",
             @"unmappedAttributes" : @"UnmappedAttributes",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalEntity class]];
}

+ (NSValueTransformer *)unmappedAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalUnmappedAttribute class]];
}

@end

@implementation AWSAWSComprehendMedicalDetectPHIRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             };
}

@end

@implementation AWSAWSComprehendMedicalDetectPHIResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"modelVersion" : @"ModelVersion",
             @"paginationToken" : @"PaginationToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalEntity class]];
}

@end

@implementation AWSAWSComprehendMedicalEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"beginOffset" : @"BeginOffset",
             @"category" : @"Category",
             @"endOffset" : @"EndOffset",
             @"identifier" : @"Id",
             @"score" : @"Score",
             @"text" : @"Text",
             @"traits" : @"Traits",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalAttribute class]];
}

+ (NSValueTransformer *)categoryJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MEDICATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeMedication);
        }
        if ([value caseInsensitiveCompare:@"MEDICAL_CONDITION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeMedicalCondition);
        }
        if ([value caseInsensitiveCompare:@"PROTECTED_HEALTH_INFORMATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeProtectedHealthInformation);
        }
        if ([value caseInsensitiveCompare:@"TEST_TREATMENT_PROCEDURE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeTestTreatmentProcedure);
        }
        if ([value caseInsensitiveCompare:@"ANATOMY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeAnatomy);
        }
        if ([value caseInsensitiveCompare:@"TIME_EXPRESSION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeTimeExpression);
        }
        return @(AWSAWSComprehendMedicalEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalEntityTypeMedication:
                return @"MEDICATION";
            case AWSAWSComprehendMedicalEntityTypeMedicalCondition:
                return @"MEDICAL_CONDITION";
            case AWSAWSComprehendMedicalEntityTypeProtectedHealthInformation:
                return @"PROTECTED_HEALTH_INFORMATION";
            case AWSAWSComprehendMedicalEntityTypeTestTreatmentProcedure:
                return @"TEST_TREATMENT_PROCEDURE";
            case AWSAWSComprehendMedicalEntityTypeAnatomy:
                return @"ANATOMY";
            case AWSAWSComprehendMedicalEntityTypeTimeExpression:
                return @"TIME_EXPRESSION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)traitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalTrait class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeName);
        }
        if ([value caseInsensitiveCompare:@"DOSAGE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeDosage);
        }
        if ([value caseInsensitiveCompare:@"ROUTE_OR_MODE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeRouteOrMode);
        }
        if ([value caseInsensitiveCompare:@"FORM"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeForm);
        }
        if ([value caseInsensitiveCompare:@"FREQUENCY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeFrequency);
        }
        if ([value caseInsensitiveCompare:@"DURATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeDuration);
        }
        if ([value caseInsensitiveCompare:@"GENERIC_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeGenericName);
        }
        if ([value caseInsensitiveCompare:@"BRAND_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeBrandName);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeStrength);
        }
        if ([value caseInsensitiveCompare:@"RATE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeRate);
        }
        if ([value caseInsensitiveCompare:@"ACUITY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeAcuity);
        }
        if ([value caseInsensitiveCompare:@"TEST_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTestName);
        }
        if ([value caseInsensitiveCompare:@"TEST_VALUE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTestValue);
        }
        if ([value caseInsensitiveCompare:@"TEST_UNITS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTestUnits);
        }
        if ([value caseInsensitiveCompare:@"PROCEDURE_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeProcedureName);
        }
        if ([value caseInsensitiveCompare:@"TREATMENT_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTreatmentName);
        }
        if ([value caseInsensitiveCompare:@"DATE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeDate);
        }
        if ([value caseInsensitiveCompare:@"AGE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeAge);
        }
        if ([value caseInsensitiveCompare:@"CONTACT_POINT"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeContactPoint);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"IDENTIFIER"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeIdentifier);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeUrl);
        }
        if ([value caseInsensitiveCompare:@"ADDRESS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeAddress);
        }
        if ([value caseInsensitiveCompare:@"PROFESSION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeProfession);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_ORGAN_SITE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeSystemOrganSite);
        }
        if ([value caseInsensitiveCompare:@"DIRECTION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeDirection);
        }
        if ([value caseInsensitiveCompare:@"QUALITY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeQuality);
        }
        if ([value caseInsensitiveCompare:@"QUANTITY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeQuantity);
        }
        if ([value caseInsensitiveCompare:@"TIME_EXPRESSION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeExpression);
        }
        if ([value caseInsensitiveCompare:@"TIME_TO_MEDICATION_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeToMedicationName);
        }
        if ([value caseInsensitiveCompare:@"TIME_TO_DX_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeToDxName);
        }
        if ([value caseInsensitiveCompare:@"TIME_TO_TEST_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeToTestName);
        }
        if ([value caseInsensitiveCompare:@"TIME_TO_PROCEDURE_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeToProcedureName);
        }
        if ([value caseInsensitiveCompare:@"TIME_TO_TREATMENT_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntitySubTypeTimeToTreatmentName);
        }
        return @(AWSAWSComprehendMedicalEntitySubTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalEntitySubTypeName:
                return @"NAME";
            case AWSAWSComprehendMedicalEntitySubTypeDosage:
                return @"DOSAGE";
            case AWSAWSComprehendMedicalEntitySubTypeRouteOrMode:
                return @"ROUTE_OR_MODE";
            case AWSAWSComprehendMedicalEntitySubTypeForm:
                return @"FORM";
            case AWSAWSComprehendMedicalEntitySubTypeFrequency:
                return @"FREQUENCY";
            case AWSAWSComprehendMedicalEntitySubTypeDuration:
                return @"DURATION";
            case AWSAWSComprehendMedicalEntitySubTypeGenericName:
                return @"GENERIC_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeBrandName:
                return @"BRAND_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeStrength:
                return @"STRENGTH";
            case AWSAWSComprehendMedicalEntitySubTypeRate:
                return @"RATE";
            case AWSAWSComprehendMedicalEntitySubTypeAcuity:
                return @"ACUITY";
            case AWSAWSComprehendMedicalEntitySubTypeTestName:
                return @"TEST_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTestValue:
                return @"TEST_VALUE";
            case AWSAWSComprehendMedicalEntitySubTypeTestUnits:
                return @"TEST_UNITS";
            case AWSAWSComprehendMedicalEntitySubTypeProcedureName:
                return @"PROCEDURE_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTreatmentName:
                return @"TREATMENT_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeDate:
                return @"DATE";
            case AWSAWSComprehendMedicalEntitySubTypeAge:
                return @"AGE";
            case AWSAWSComprehendMedicalEntitySubTypeContactPoint:
                return @"CONTACT_POINT";
            case AWSAWSComprehendMedicalEntitySubTypeEmail:
                return @"EMAIL";
            case AWSAWSComprehendMedicalEntitySubTypeIdentifier:
                return @"IDENTIFIER";
            case AWSAWSComprehendMedicalEntitySubTypeUrl:
                return @"URL";
            case AWSAWSComprehendMedicalEntitySubTypeAddress:
                return @"ADDRESS";
            case AWSAWSComprehendMedicalEntitySubTypeProfession:
                return @"PROFESSION";
            case AWSAWSComprehendMedicalEntitySubTypeSystemOrganSite:
                return @"SYSTEM_ORGAN_SITE";
            case AWSAWSComprehendMedicalEntitySubTypeDirection:
                return @"DIRECTION";
            case AWSAWSComprehendMedicalEntitySubTypeQuality:
                return @"QUALITY";
            case AWSAWSComprehendMedicalEntitySubTypeQuantity:
                return @"QUANTITY";
            case AWSAWSComprehendMedicalEntitySubTypeTimeExpression:
                return @"TIME_EXPRESSION";
            case AWSAWSComprehendMedicalEntitySubTypeTimeToMedicationName:
                return @"TIME_TO_MEDICATION_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTimeToDxName:
                return @"TIME_TO_DX_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTimeToTestName:
                return @"TIME_TO_TEST_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTimeToProcedureName:
                return @"TIME_TO_PROCEDURE_NAME";
            case AWSAWSComprehendMedicalEntitySubTypeTimeToTreatmentName:
                return @"TIME_TO_TREATMENT_NAME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSComprehendMedicalICD10CMAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"endOffset" : @"EndOffset",
             @"identifier" : @"Id",
             @"relationshipScore" : @"RelationshipScore",
             @"score" : @"Score",
             @"text" : @"Text",
             @"traits" : @"Traits",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)traitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalICD10CMTrait class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACUITY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMAttributeTypeAcuity);
        }
        if ([value caseInsensitiveCompare:@"DIRECTION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMAttributeTypeDirection);
        }
        if ([value caseInsensitiveCompare:@"SYSTEM_ORGAN_SITE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMAttributeTypeSystemOrganSite);
        }
        if ([value caseInsensitiveCompare:@"QUALITY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMAttributeTypeQuality);
        }
        if ([value caseInsensitiveCompare:@"QUANTITY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMAttributeTypeQuantity);
        }
        return @(AWSAWSComprehendMedicalICD10CMAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalICD10CMAttributeTypeAcuity:
                return @"ACUITY";
            case AWSAWSComprehendMedicalICD10CMAttributeTypeDirection:
                return @"DIRECTION";
            case AWSAWSComprehendMedicalICD10CMAttributeTypeSystemOrganSite:
                return @"SYSTEM_ORGAN_SITE";
            case AWSAWSComprehendMedicalICD10CMAttributeTypeQuality:
                return @"QUALITY";
            case AWSAWSComprehendMedicalICD10CMAttributeTypeQuantity:
                return @"QUANTITY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSComprehendMedicalICD10CMConcept

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"detail" : @"Description",
             @"score" : @"Score",
             };
}

@end

@implementation AWSAWSComprehendMedicalICD10CMEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"beginOffset" : @"BeginOffset",
             @"category" : @"Category",
             @"endOffset" : @"EndOffset",
             @"ICD10CMConcepts" : @"ICD10CMConcepts",
             @"identifier" : @"Id",
             @"score" : @"Score",
             @"text" : @"Text",
             @"traits" : @"Traits",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalICD10CMAttribute class]];
}

+ (NSValueTransformer *)categoryJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MEDICAL_CONDITION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMEntityCategoryMedicalCondition);
        }
        return @(AWSAWSComprehendMedicalICD10CMEntityCategoryUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalICD10CMEntityCategoryMedicalCondition:
                return @"MEDICAL_CONDITION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)ICD10CMConceptsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalICD10CMConcept class]];
}

+ (NSValueTransformer *)traitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalICD10CMTrait class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DX_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMEntityTypeDxName);
        }
        return @(AWSAWSComprehendMedicalICD10CMEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalICD10CMEntityTypeDxName:
                return @"DX_NAME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSComprehendMedicalICD10CMTrait

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"score" : @"Score",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEGATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMTraitNameNegation);
        }
        if ([value caseInsensitiveCompare:@"DIAGNOSIS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMTraitNameDiagnosis);
        }
        if ([value caseInsensitiveCompare:@"SIGN"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMTraitNameSign);
        }
        if ([value caseInsensitiveCompare:@"SYMPTOM"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalICD10CMTraitNameSymptom);
        }
        return @(AWSAWSComprehendMedicalICD10CMTraitNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalICD10CMTraitNameNegation:
                return @"NEGATION";
            case AWSAWSComprehendMedicalICD10CMTraitNameDiagnosis:
                return @"DIAGNOSIS";
            case AWSAWSComprehendMedicalICD10CMTraitNameSign:
                return @"SIGN";
            case AWSAWSComprehendMedicalICD10CMTraitNameSymptom:
                return @"SYMPTOM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSComprehendMedicalInferICD10CMRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             };
}

@end

@implementation AWSAWSComprehendMedicalInferICD10CMResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"modelVersion" : @"ModelVersion",
             @"paginationToken" : @"PaginationToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalICD10CMEntity class]];
}

@end

@implementation AWSAWSComprehendMedicalInferRxNormRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"text" : @"Text",
             };
}

@end

@implementation AWSAWSComprehendMedicalInferRxNormResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entities" : @"Entities",
             @"modelVersion" : @"ModelVersion",
             @"paginationToken" : @"PaginationToken",
             };
}

+ (NSValueTransformer *)entitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalRxNormEntity class]];
}

@end

@implementation AWSAWSComprehendMedicalInputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             };
}

@end

@implementation AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter class]];
}

@end

@implementation AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comprehendMedicalAsyncJobPropertiesList" : @"ComprehendMedicalAsyncJobPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)comprehendMedicalAsyncJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties class]];
}

@end

@implementation AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter class]];
}

@end

@implementation AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comprehendMedicalAsyncJobPropertiesList" : @"ComprehendMedicalAsyncJobPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)comprehendMedicalAsyncJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties class]];
}

@end

@implementation AWSAWSComprehendMedicalListPHIDetectionJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter class]];
}

@end

@implementation AWSAWSComprehendMedicalListPHIDetectionJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comprehendMedicalAsyncJobPropertiesList" : @"ComprehendMedicalAsyncJobPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)comprehendMedicalAsyncJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties class]];
}

@end

@implementation AWSAWSComprehendMedicalListRxNormInferenceJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobFilter class]];
}

@end

@implementation AWSAWSComprehendMedicalListRxNormInferenceJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comprehendMedicalAsyncJobPropertiesList" : @"ComprehendMedicalAsyncJobPropertiesList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)comprehendMedicalAsyncJobPropertiesListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalComprehendMedicalAsyncJobProperties class]];
}

@end

@implementation AWSAWSComprehendMedicalOutputDataConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             };
}

@end

@implementation AWSAWSComprehendMedicalRxNormAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginOffset" : @"BeginOffset",
             @"endOffset" : @"EndOffset",
             @"identifier" : @"Id",
             @"relationshipScore" : @"RelationshipScore",
             @"score" : @"Score",
             @"text" : @"Text",
             @"traits" : @"Traits",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)traitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalRxNormTrait class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DOSAGE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormAttributeTypeDosage);
        }
        if ([value caseInsensitiveCompare:@"DURATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormAttributeTypeDuration);
        }
        if ([value caseInsensitiveCompare:@"FORM"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormAttributeTypeForm);
        }
        if ([value caseInsensitiveCompare:@"FREQUENCY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormAttributeTypeFrequency);
        }
        if ([value caseInsensitiveCompare:@"RATE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormAttributeTypeRate);
        }
        if ([value caseInsensitiveCompare:@"ROUTE_OR_MODE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormAttributeTypeRouteOrMode);
        }
        if ([value caseInsensitiveCompare:@"STRENGTH"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormAttributeTypeStrength);
        }
        return @(AWSAWSComprehendMedicalRxNormAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalRxNormAttributeTypeDosage:
                return @"DOSAGE";
            case AWSAWSComprehendMedicalRxNormAttributeTypeDuration:
                return @"DURATION";
            case AWSAWSComprehendMedicalRxNormAttributeTypeForm:
                return @"FORM";
            case AWSAWSComprehendMedicalRxNormAttributeTypeFrequency:
                return @"FREQUENCY";
            case AWSAWSComprehendMedicalRxNormAttributeTypeRate:
                return @"RATE";
            case AWSAWSComprehendMedicalRxNormAttributeTypeRouteOrMode:
                return @"ROUTE_OR_MODE";
            case AWSAWSComprehendMedicalRxNormAttributeTypeStrength:
                return @"STRENGTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSComprehendMedicalRxNormConcept

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"detail" : @"Description",
             @"score" : @"Score",
             };
}

@end

@implementation AWSAWSComprehendMedicalRxNormEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"beginOffset" : @"BeginOffset",
             @"category" : @"Category",
             @"endOffset" : @"EndOffset",
             @"identifier" : @"Id",
             @"rxNormConcepts" : @"RxNormConcepts",
             @"score" : @"Score",
             @"text" : @"Text",
             @"traits" : @"Traits",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalRxNormAttribute class]];
}

+ (NSValueTransformer *)categoryJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MEDICATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormEntityCategoryMedication);
        }
        return @(AWSAWSComprehendMedicalRxNormEntityCategoryUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalRxNormEntityCategoryMedication:
                return @"MEDICATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)rxNormConceptsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalRxNormConcept class]];
}

+ (NSValueTransformer *)traitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSComprehendMedicalRxNormTrait class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BRAND_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormEntityTypeBrandName);
        }
        if ([value caseInsensitiveCompare:@"GENERIC_NAME"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormEntityTypeGenericName);
        }
        return @(AWSAWSComprehendMedicalRxNormEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalRxNormEntityTypeBrandName:
                return @"BRAND_NAME";
            case AWSAWSComprehendMedicalRxNormEntityTypeGenericName:
                return @"GENERIC_NAME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSComprehendMedicalRxNormTrait

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"score" : @"Score",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEGATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalRxNormTraitNameNegation);
        }
        return @(AWSAWSComprehendMedicalRxNormTraitNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalRxNormTraitNameNegation:
                return @"NEGATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"KMSKey" : @"KMSKey",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalLanguageCodeEn);
        }
        return @(AWSAWSComprehendMedicalLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalLanguageCodeEn:
                return @"en";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalOutputDataConfig class]];
}

@end

@implementation AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"KMSKey" : @"KMSKey",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalLanguageCodeEn);
        }
        return @(AWSAWSComprehendMedicalLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalLanguageCodeEn:
                return @"en";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalOutputDataConfig class]];
}

@end

@implementation AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStartPHIDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"KMSKey" : @"KMSKey",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalLanguageCodeEn);
        }
        return @(AWSAWSComprehendMedicalLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalLanguageCodeEn:
                return @"en";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalOutputDataConfig class]];
}

@end

@implementation AWSAWSComprehendMedicalStartPHIDetectionJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStartRxNormInferenceJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"dataAccessRoleArn" : @"DataAccessRoleArn",
             @"inputDataConfig" : @"InputDataConfig",
             @"jobName" : @"JobName",
             @"KMSKey" : @"KMSKey",
             @"languageCode" : @"LanguageCode",
             @"outputDataConfig" : @"OutputDataConfig",
             };
}

+ (NSValueTransformer *)inputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalInputDataConfig class]];
}

+ (NSValueTransformer *)languageCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalLanguageCodeEn);
        }
        return @(AWSAWSComprehendMedicalLanguageCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalLanguageCodeEn:
                return @"en";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)outputDataConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalOutputDataConfig class]];
}

@end

@implementation AWSAWSComprehendMedicalStartRxNormInferenceJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStopPHIDetectionJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStopPHIDetectionJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStopRxNormInferenceJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalStopRxNormInferenceJobResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSComprehendMedicalTrait

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"score" : @"Score",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SIGN"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalAttributeNameSign);
        }
        if ([value caseInsensitiveCompare:@"SYMPTOM"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalAttributeNameSymptom);
        }
        if ([value caseInsensitiveCompare:@"DIAGNOSIS"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalAttributeNameDiagnosis);
        }
        if ([value caseInsensitiveCompare:@"NEGATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalAttributeNameNegation);
        }
        return @(AWSAWSComprehendMedicalAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalAttributeNameSign:
                return @"SIGN";
            case AWSAWSComprehendMedicalAttributeNameSymptom:
                return @"SYMPTOM";
            case AWSAWSComprehendMedicalAttributeNameDiagnosis:
                return @"DIAGNOSIS";
            case AWSAWSComprehendMedicalAttributeNameNegation:
                return @"NEGATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSComprehendMedicalUnmappedAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSComprehendMedicalAttribute class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MEDICATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeMedication);
        }
        if ([value caseInsensitiveCompare:@"MEDICAL_CONDITION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeMedicalCondition);
        }
        if ([value caseInsensitiveCompare:@"PROTECTED_HEALTH_INFORMATION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeProtectedHealthInformation);
        }
        if ([value caseInsensitiveCompare:@"TEST_TREATMENT_PROCEDURE"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeTestTreatmentProcedure);
        }
        if ([value caseInsensitiveCompare:@"ANATOMY"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeAnatomy);
        }
        if ([value caseInsensitiveCompare:@"TIME_EXPRESSION"] == NSOrderedSame) {
            return @(AWSAWSComprehendMedicalEntityTypeTimeExpression);
        }
        return @(AWSAWSComprehendMedicalEntityTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSComprehendMedicalEntityTypeMedication:
                return @"MEDICATION";
            case AWSAWSComprehendMedicalEntityTypeMedicalCondition:
                return @"MEDICAL_CONDITION";
            case AWSAWSComprehendMedicalEntityTypeProtectedHealthInformation:
                return @"PROTECTED_HEALTH_INFORMATION";
            case AWSAWSComprehendMedicalEntityTypeTestTreatmentProcedure:
                return @"TEST_TREATMENT_PROCEDURE";
            case AWSAWSComprehendMedicalEntityTypeAnatomy:
                return @"ANATOMY";
            case AWSAWSComprehendMedicalEntityTypeTimeExpression:
                return @"TIME_EXPRESSION";
            default:
                return nil;
        }
    }];
}

@end
