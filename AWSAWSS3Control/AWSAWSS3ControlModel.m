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

#import "AWSAWSS3ControlModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSAWSS3ControlErrorDomain = @"com.amazonaws.AWSAWSS3ControlErrorDomain";

@implementation AWSAWSS3ControlAccessPoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"name" : @"Name",
             @"networkOrigin" : @"NetworkOrigin",
             @"vpcConfiguration" : @"VpcConfiguration",
             };
}

+ (NSValueTransformer *)networkOriginJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Internet"] == NSOrderedSame) {
            return @(AWSAWSS3ControlNetworkOriginInternet);
        }
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWSAWSS3ControlNetworkOriginVpc);
        }
        return @(AWSAWSS3ControlNetworkOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlNetworkOriginInternet:
                return @"Internet";
            case AWSAWSS3ControlNetworkOriginVpc:
                return @"VPC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlVpcConfiguration class]];
}

@end

@implementation AWSAWSS3ControlCreateAccessPointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"bucket" : @"Bucket",
             @"name" : @"Name",
             @"publicAccessBlockConfiguration" : @"PublicAccessBlockConfiguration",
             @"vpcConfiguration" : @"VpcConfiguration",
             };
}

+ (NSValueTransformer *)publicAccessBlockConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlPublicAccessBlockConfiguration class]];
}

+ (NSValueTransformer *)vpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlVpcConfiguration class]];
}

@end

@implementation AWSAWSS3ControlCreateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"clientRequestToken" : @"ClientRequestToken",
             @"confirmationRequired" : @"ConfirmationRequired",
             @"detail" : @"Description",
             @"manifest" : @"Manifest",
             @"operation" : @"Operation",
             @"priority" : @"Priority",
             @"report" : @"Report",
             @"roleArn" : @"RoleArn",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)manifestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobManifest class]];
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobOperation class]];
}

+ (NSValueTransformer *)reportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobReport class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSS3ControlS3Tag class]];
}

@end

@implementation AWSAWSS3ControlCreateJobResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSS3ControlDeleteAccessPointPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAWSS3ControlDeleteAccessPointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAWSS3ControlDeleteJobTaggingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSS3ControlDeleteJobTaggingResult

@end

@implementation AWSAWSS3ControlDeletePublicAccessBlockRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             };
}

@end

@implementation AWSAWSS3ControlDescribeJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSS3ControlDescribeJobResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"job" : @"Job",
             };
}

+ (NSValueTransformer *)jobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobDescriptor class]];
}

@end

@implementation AWSAWSS3ControlGetAccessPointPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAWSS3ControlGetAccessPointPolicyResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSAWSS3ControlGetAccessPointPolicyStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAWSS3ControlGetAccessPointPolicyStatusResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"policyStatus" : @"PolicyStatus",
             };
}

+ (NSValueTransformer *)policyStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlPolicyStatus class]];
}

@end

@implementation AWSAWSS3ControlGetAccessPointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSAWSS3ControlGetAccessPointResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"creationDate" : @"CreationDate",
             @"name" : @"Name",
             @"networkOrigin" : @"NetworkOrigin",
             @"publicAccessBlockConfiguration" : @"PublicAccessBlockConfiguration",
             @"vpcConfiguration" : @"VpcConfiguration",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)networkOriginJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Internet"] == NSOrderedSame) {
            return @(AWSAWSS3ControlNetworkOriginInternet);
        }
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWSAWSS3ControlNetworkOriginVpc);
        }
        return @(AWSAWSS3ControlNetworkOriginUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlNetworkOriginInternet:
                return @"Internet";
            case AWSAWSS3ControlNetworkOriginVpc:
                return @"VPC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)publicAccessBlockConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlPublicAccessBlockConfiguration class]];
}

+ (NSValueTransformer *)vpcConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlVpcConfiguration class]];
}

@end

@implementation AWSAWSS3ControlGetJobTaggingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSAWSS3ControlGetJobTaggingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSS3ControlS3Tag class]];
}

@end

@implementation AWSAWSS3ControlGetPublicAccessBlockOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"publicAccessBlockConfiguration" : @"PublicAccessBlockConfiguration",
             };
}

+ (NSValueTransformer *)publicAccessBlockConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlPublicAccessBlockConfiguration class]];
}

@end

@implementation AWSAWSS3ControlGetPublicAccessBlockRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             };
}

@end

@implementation AWSAWSS3ControlJobDescriptor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"confirmationRequired" : @"ConfirmationRequired",
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"failureReasons" : @"FailureReasons",
             @"jobArn" : @"JobArn",
             @"jobId" : @"JobId",
             @"manifest" : @"Manifest",
             @"operation" : @"Operation",
             @"priority" : @"Priority",
             @"progressSummary" : @"ProgressSummary",
             @"report" : @"Report",
             @"roleArn" : @"RoleArn",
             @"status" : @"Status",
             @"statusUpdateReason" : @"StatusUpdateReason",
             @"suspendedCause" : @"SuspendedCause",
             @"suspendedDate" : @"SuspendedDate",
             @"terminationDate" : @"TerminationDate",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)failureReasonsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSS3ControlJobFailure class]];
}

+ (NSValueTransformer *)manifestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobManifest class]];
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobOperation class]];
}

+ (NSValueTransformer *)progressSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobProgressSummary class]];
}

+ (NSValueTransformer *)reportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobReport class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"Completing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusCompleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Failing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusFailing);
        }
        if ([value caseInsensitiveCompare:@"New"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusNew);
        }
        if ([value caseInsensitiveCompare:@"Paused"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusPaused);
        }
        if ([value caseInsensitiveCompare:@"Pausing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusPausing);
        }
        if ([value caseInsensitiveCompare:@"Preparing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusPreparing);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusReady);
        }
        if ([value caseInsensitiveCompare:@"Suspended"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusSuspended);
        }
        return @(AWSAWSS3ControlJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlJobStatusActive:
                return @"Active";
            case AWSAWSS3ControlJobStatusCancelled:
                return @"Cancelled";
            case AWSAWSS3ControlJobStatusCancelling:
                return @"Cancelling";
            case AWSAWSS3ControlJobStatusComplete:
                return @"Complete";
            case AWSAWSS3ControlJobStatusCompleting:
                return @"Completing";
            case AWSAWSS3ControlJobStatusFailed:
                return @"Failed";
            case AWSAWSS3ControlJobStatusFailing:
                return @"Failing";
            case AWSAWSS3ControlJobStatusNew:
                return @"New";
            case AWSAWSS3ControlJobStatusPaused:
                return @"Paused";
            case AWSAWSS3ControlJobStatusPausing:
                return @"Pausing";
            case AWSAWSS3ControlJobStatusPreparing:
                return @"Preparing";
            case AWSAWSS3ControlJobStatusReady:
                return @"Ready";
            case AWSAWSS3ControlJobStatusSuspended:
                return @"Suspended";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)suspendedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)terminationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSAWSS3ControlJobFailure

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureCode" : @"FailureCode",
             @"failureReason" : @"FailureReason",
             };
}

@end

@implementation AWSAWSS3ControlJobListDescriptor

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"detail" : @"Description",
             @"jobId" : @"JobId",
             @"operation" : @"Operation",
             @"priority" : @"Priority",
             @"progressSummary" : @"ProgressSummary",
             @"status" : @"Status",
             @"terminationDate" : @"TerminationDate",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LambdaInvoke"] == NSOrderedSame) {
            return @(AWSAWSS3ControlOperationNameLambdaInvoke);
        }
        if ([value caseInsensitiveCompare:@"S3PutObjectCopy"] == NSOrderedSame) {
            return @(AWSAWSS3ControlOperationNameS3PutObjectCopy);
        }
        if ([value caseInsensitiveCompare:@"S3PutObjectAcl"] == NSOrderedSame) {
            return @(AWSAWSS3ControlOperationNameS3PutObjectAcl);
        }
        if ([value caseInsensitiveCompare:@"S3PutObjectTagging"] == NSOrderedSame) {
            return @(AWSAWSS3ControlOperationNameS3PutObjectTagging);
        }
        if ([value caseInsensitiveCompare:@"S3InitiateRestoreObject"] == NSOrderedSame) {
            return @(AWSAWSS3ControlOperationNameS3InitiateRestoreObject);
        }
        if ([value caseInsensitiveCompare:@"S3PutObjectLegalHold"] == NSOrderedSame) {
            return @(AWSAWSS3ControlOperationNameS3PutObjectLegalHold);
        }
        if ([value caseInsensitiveCompare:@"S3PutObjectRetention"] == NSOrderedSame) {
            return @(AWSAWSS3ControlOperationNameS3PutObjectRetention);
        }
        return @(AWSAWSS3ControlOperationNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlOperationNameLambdaInvoke:
                return @"LambdaInvoke";
            case AWSAWSS3ControlOperationNameS3PutObjectCopy:
                return @"S3PutObjectCopy";
            case AWSAWSS3ControlOperationNameS3PutObjectAcl:
                return @"S3PutObjectAcl";
            case AWSAWSS3ControlOperationNameS3PutObjectTagging:
                return @"S3PutObjectTagging";
            case AWSAWSS3ControlOperationNameS3InitiateRestoreObject:
                return @"S3InitiateRestoreObject";
            case AWSAWSS3ControlOperationNameS3PutObjectLegalHold:
                return @"S3PutObjectLegalHold";
            case AWSAWSS3ControlOperationNameS3PutObjectRetention:
                return @"S3PutObjectRetention";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)progressSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobProgressSummary class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"Completing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusCompleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Failing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusFailing);
        }
        if ([value caseInsensitiveCompare:@"New"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusNew);
        }
        if ([value caseInsensitiveCompare:@"Paused"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusPaused);
        }
        if ([value caseInsensitiveCompare:@"Pausing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusPausing);
        }
        if ([value caseInsensitiveCompare:@"Preparing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusPreparing);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusReady);
        }
        if ([value caseInsensitiveCompare:@"Suspended"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusSuspended);
        }
        return @(AWSAWSS3ControlJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlJobStatusActive:
                return @"Active";
            case AWSAWSS3ControlJobStatusCancelled:
                return @"Cancelled";
            case AWSAWSS3ControlJobStatusCancelling:
                return @"Cancelling";
            case AWSAWSS3ControlJobStatusComplete:
                return @"Complete";
            case AWSAWSS3ControlJobStatusCompleting:
                return @"Completing";
            case AWSAWSS3ControlJobStatusFailed:
                return @"Failed";
            case AWSAWSS3ControlJobStatusFailing:
                return @"Failing";
            case AWSAWSS3ControlJobStatusNew:
                return @"New";
            case AWSAWSS3ControlJobStatusPaused:
                return @"Paused";
            case AWSAWSS3ControlJobStatusPausing:
                return @"Pausing";
            case AWSAWSS3ControlJobStatusPreparing:
                return @"Preparing";
            case AWSAWSS3ControlJobStatusReady:
                return @"Ready";
            case AWSAWSS3ControlJobStatusSuspended:
                return @"Suspended";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)terminationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSAWSS3ControlJobManifest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"location" : @"Location",
             @"spec" : @"Spec",
             };
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobManifestLocation class]];
}

+ (NSValueTransformer *)specJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlJobManifestSpec class]];
}

@end

@implementation AWSAWSS3ControlJobManifestLocation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ETag" : @"ETag",
             @"objectArn" : @"ObjectArn",
             @"objectVersionId" : @"ObjectVersionId",
             };
}

@end

@implementation AWSAWSS3ControlJobManifestSpec

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fields" : @"Fields",
             @"format" : @"Format",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"S3BatchOperations_CSV_20180820"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobManifestFormatS3BatchOperationsCSV20180820);
        }
        if ([value caseInsensitiveCompare:@"S3InventoryReport_CSV_20161130"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobManifestFormatS3InventoryReportCSV20161130);
        }
        return @(AWSAWSS3ControlJobManifestFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlJobManifestFormatS3BatchOperationsCSV20180820:
                return @"S3BatchOperations_CSV_20180820";
            case AWSAWSS3ControlJobManifestFormatS3InventoryReportCSV20161130:
                return @"S3InventoryReport_CSV_20161130";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSS3ControlJobOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lambdaInvoke" : @"LambdaInvoke",
             @"s3InitiateRestoreObject" : @"S3InitiateRestoreObject",
             @"s3PutObjectAcl" : @"S3PutObjectAcl",
             @"s3PutObjectCopy" : @"S3PutObjectCopy",
             @"s3PutObjectLegalHold" : @"S3PutObjectLegalHold",
             @"s3PutObjectRetention" : @"S3PutObjectRetention",
             @"s3PutObjectTagging" : @"S3PutObjectTagging",
             };
}

+ (NSValueTransformer *)lambdaInvokeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlLambdaInvokeOperation class]];
}

+ (NSValueTransformer *)s3InitiateRestoreObjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3InitiateRestoreObjectOperation class]];
}

+ (NSValueTransformer *)s3PutObjectAclJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3SetObjectAclOperation class]];
}

+ (NSValueTransformer *)s3PutObjectCopyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3CopyObjectOperation class]];
}

+ (NSValueTransformer *)s3PutObjectLegalHoldJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3SetObjectLegalHoldOperation class]];
}

+ (NSValueTransformer *)s3PutObjectRetentionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3SetObjectRetentionOperation class]];
}

+ (NSValueTransformer *)s3PutObjectTaggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3SetObjectTaggingOperation class]];
}

@end

@implementation AWSAWSS3ControlJobProgressSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberOfTasksFailed" : @"NumberOfTasksFailed",
             @"numberOfTasksSucceeded" : @"NumberOfTasksSucceeded",
             @"totalNumberOfTasks" : @"TotalNumberOfTasks",
             };
}

@end

@implementation AWSAWSS3ControlJobReport

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucket" : @"Bucket",
             @"enabled" : @"Enabled",
             @"format" : @"Format",
             @"prefix" : @"Prefix",
             @"reportScope" : @"ReportScope",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Report_CSV_20180820"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobReportFormatReportCSV20180820);
        }
        return @(AWSAWSS3ControlJobReportFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlJobReportFormatReportCSV20180820:
                return @"Report_CSV_20180820";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)reportScopeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AllTasks"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobReportScopeAllTasks);
        }
        if ([value caseInsensitiveCompare:@"FailedTasksOnly"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobReportScopeFailedTasksOnly);
        }
        return @(AWSAWSS3ControlJobReportScopeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlJobReportScopeAllTasks:
                return @"AllTasks";
            case AWSAWSS3ControlJobReportScopeFailedTasksOnly:
                return @"FailedTasksOnly";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSS3ControlLambdaInvokeOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"functionArn" : @"FunctionArn",
             };
}

@end

@implementation AWSAWSS3ControlListAccessPointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"bucket" : @"Bucket",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAWSS3ControlListAccessPointsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessPointList" : @"AccessPointList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)accessPointListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSS3ControlAccessPoint class]];
}

@end

@implementation AWSAWSS3ControlListJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"jobStatuses" : @"JobStatuses",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSAWSS3ControlListJobsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobs" : @"Jobs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSS3ControlJobListDescriptor class]];
}

@end

@implementation AWSAWSS3ControlPolicyStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isPublic" : @"IsPublic",
             };
}

@end

@implementation AWSAWSS3ControlPublicAccessBlockConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockPublicAcls" : @"BlockPublicAcls",
             @"blockPublicPolicy" : @"BlockPublicPolicy",
             @"ignorePublicAcls" : @"IgnorePublicAcls",
             @"restrictPublicBuckets" : @"RestrictPublicBuckets",
             };
}

@end

@implementation AWSAWSS3ControlPutAccessPointPolicyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"name" : @"Name",
             @"policy" : @"Policy",
             };
}

@end

@implementation AWSAWSS3ControlPutJobTaggingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"jobId" : @"JobId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSS3ControlS3Tag class]];
}

@end

@implementation AWSAWSS3ControlPutJobTaggingResult

@end

@implementation AWSAWSS3ControlPutPublicAccessBlockRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"publicAccessBlockConfiguration" : @"PublicAccessBlockConfiguration",
             };
}

+ (NSValueTransformer *)publicAccessBlockConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlPublicAccessBlockConfiguration class]];
}

@end

@implementation AWSAWSS3ControlS3AccessControlList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grants" : @"Grants",
             @"owner" : @"Owner",
             };
}

+ (NSValueTransformer *)grantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSS3ControlS3Grant class]];
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3ObjectOwner class]];
}

@end

@implementation AWSAWSS3ControlS3AccessControlPolicy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControlList" : @"AccessControlList",
             @"cannedAccessControlList" : @"CannedAccessControlList",
             };
}

+ (NSValueTransformer *)accessControlListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3AccessControlList class]];
}

+ (NSValueTransformer *)cannedAccessControlListJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListAwsExecRead);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListBucketOwnerFullControl);
        }
        return @(AWSAWSS3ControlS3CannedAccessControlListUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3CannedAccessControlListPrivate:
                return @"private";
            case AWSAWSS3ControlS3CannedAccessControlListPublicRead:
                return @"public-read";
            case AWSAWSS3ControlS3CannedAccessControlListPublicReadWrite:
                return @"public-read-write";
            case AWSAWSS3ControlS3CannedAccessControlListAwsExecRead:
                return @"aws-exec-read";
            case AWSAWSS3ControlS3CannedAccessControlListAuthenticatedRead:
                return @"authenticated-read";
            case AWSAWSS3ControlS3CannedAccessControlListBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSAWSS3ControlS3CannedAccessControlListBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSS3ControlS3CopyObjectOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControlGrants" : @"AccessControlGrants",
             @"cannedAccessControlList" : @"CannedAccessControlList",
             @"metadataDirective" : @"MetadataDirective",
             @"modifiedSinceConstraint" : @"ModifiedSinceConstraint",
             @"latestObjectMetadata" : @"NewObjectMetadata",
             @"latestObjectTagging" : @"NewObjectTagging",
             @"objectLockLegalHoldStatus" : @"ObjectLockLegalHoldStatus",
             @"objectLockMode" : @"ObjectLockMode",
             @"objectLockRetainUntilDate" : @"ObjectLockRetainUntilDate",
             @"redirectLocation" : @"RedirectLocation",
             @"requesterPays" : @"RequesterPays",
             @"SSEAwsKmsKeyId" : @"SSEAwsKmsKeyId",
             @"storageClass" : @"StorageClass",
             @"targetKeyPrefix" : @"TargetKeyPrefix",
             @"targetResource" : @"TargetResource",
             @"unModifiedSinceConstraint" : @"UnModifiedSinceConstraint",
             };
}

+ (NSValueTransformer *)accessControlGrantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSS3ControlS3Grant class]];
}

+ (NSValueTransformer *)cannedAccessControlListJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"private"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListPrivate);
        }
        if ([value caseInsensitiveCompare:@"public-read"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListPublicRead);
        }
        if ([value caseInsensitiveCompare:@"public-read-write"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListPublicReadWrite);
        }
        if ([value caseInsensitiveCompare:@"aws-exec-read"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListAwsExecRead);
        }
        if ([value caseInsensitiveCompare:@"authenticated-read"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListAuthenticatedRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-read"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListBucketOwnerRead);
        }
        if ([value caseInsensitiveCompare:@"bucket-owner-full-control"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3CannedAccessControlListBucketOwnerFullControl);
        }
        return @(AWSAWSS3ControlS3CannedAccessControlListUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3CannedAccessControlListPrivate:
                return @"private";
            case AWSAWSS3ControlS3CannedAccessControlListPublicRead:
                return @"public-read";
            case AWSAWSS3ControlS3CannedAccessControlListPublicReadWrite:
                return @"public-read-write";
            case AWSAWSS3ControlS3CannedAccessControlListAwsExecRead:
                return @"aws-exec-read";
            case AWSAWSS3ControlS3CannedAccessControlListAuthenticatedRead:
                return @"authenticated-read";
            case AWSAWSS3ControlS3CannedAccessControlListBucketOwnerRead:
                return @"bucket-owner-read";
            case AWSAWSS3ControlS3CannedAccessControlListBucketOwnerFullControl:
                return @"bucket-owner-full-control";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)metadataDirectiveJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COPY"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3MetadataDirectiveCopy);
        }
        if ([value caseInsensitiveCompare:@"REPLACE"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3MetadataDirectiveReplace);
        }
        return @(AWSAWSS3ControlS3MetadataDirectiveUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3MetadataDirectiveCopy:
                return @"COPY";
            case AWSAWSS3ControlS3MetadataDirectiveReplace:
                return @"REPLACE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)modifiedSinceConstraintJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)latestObjectMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3ObjectMetadata class]];
}

+ (NSValueTransformer *)latestObjectTaggingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSS3ControlS3Tag class]];
}

+ (NSValueTransformer *)objectLockLegalHoldStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3ObjectLockLegalHoldStatusOff);
        }
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3ObjectLockLegalHoldStatusOn);
        }
        return @(AWSAWSS3ControlS3ObjectLockLegalHoldStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3ObjectLockLegalHoldStatusOff:
                return @"OFF";
            case AWSAWSS3ControlS3ObjectLockLegalHoldStatusOn:
                return @"ON";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANCE"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3ObjectLockModeCompliance);
        }
        if ([value caseInsensitiveCompare:@"GOVERNANCE"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3ObjectLockModeGovernance);
        }
        return @(AWSAWSS3ControlS3ObjectLockModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3ObjectLockModeCompliance:
                return @"COMPLIANCE";
            case AWSAWSS3ControlS3ObjectLockModeGovernance:
                return @"GOVERNANCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)objectLockRetainUntilDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)storageClassJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3StorageClassStandard);
        }
        if ([value caseInsensitiveCompare:@"STANDARD_IA"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3StorageClassStandardIa);
        }
        if ([value caseInsensitiveCompare:@"ONEZONE_IA"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3StorageClassOnezoneIa);
        }
        if ([value caseInsensitiveCompare:@"GLACIER"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3StorageClassGlacier);
        }
        if ([value caseInsensitiveCompare:@"INTELLIGENT_TIERING"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3StorageClassIntelligentTiering);
        }
        if ([value caseInsensitiveCompare:@"DEEP_ARCHIVE"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3StorageClassDeepArchive);
        }
        return @(AWSAWSS3ControlS3StorageClassUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3StorageClassStandard:
                return @"STANDARD";
            case AWSAWSS3ControlS3StorageClassStandardIa:
                return @"STANDARD_IA";
            case AWSAWSS3ControlS3StorageClassOnezoneIa:
                return @"ONEZONE_IA";
            case AWSAWSS3ControlS3StorageClassGlacier:
                return @"GLACIER";
            case AWSAWSS3ControlS3StorageClassIntelligentTiering:
                return @"INTELLIGENT_TIERING";
            case AWSAWSS3ControlS3StorageClassDeepArchive:
                return @"DEEP_ARCHIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)unModifiedSinceConstraintJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSAWSS3ControlS3Grant

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"grantee" : @"Grantee",
             @"permission" : @"Permission",
             };
}

+ (NSValueTransformer *)granteeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3Grantee class]];
}

+ (NSValueTransformer *)permissionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"FULL_CONTROL"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3PermissionFullControl);
        }
        if ([value caseInsensitiveCompare:@"READ"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3PermissionRead);
        }
        if ([value caseInsensitiveCompare:@"WRITE"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3PermissionWrite);
        }
        if ([value caseInsensitiveCompare:@"READ_ACP"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3PermissionReadAcp);
        }
        if ([value caseInsensitiveCompare:@"WRITE_ACP"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3PermissionWriteAcp);
        }
        return @(AWSAWSS3ControlS3PermissionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3PermissionFullControl:
                return @"FULL_CONTROL";
            case AWSAWSS3ControlS3PermissionRead:
                return @"READ";
            case AWSAWSS3ControlS3PermissionWrite:
                return @"WRITE";
            case AWSAWSS3ControlS3PermissionReadAcp:
                return @"READ_ACP";
            case AWSAWSS3ControlS3PermissionWriteAcp:
                return @"WRITE_ACP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSS3ControlS3Grantee

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"identifier" : @"Identifier",
             @"typeIdentifier" : @"TypeIdentifier",
             };
}

+ (NSValueTransformer *)typeIdentifierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"id"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3GranteeTypeIdentifierId);
        }
        if ([value caseInsensitiveCompare:@"emailAddress"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3GranteeTypeIdentifierEmailAddress);
        }
        if ([value caseInsensitiveCompare:@"uri"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3GranteeTypeIdentifierUri);
        }
        return @(AWSAWSS3ControlS3GranteeTypeIdentifierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3GranteeTypeIdentifierId:
                return @"id";
            case AWSAWSS3ControlS3GranteeTypeIdentifierEmailAddress:
                return @"emailAddress";
            case AWSAWSS3ControlS3GranteeTypeIdentifierUri:
                return @"uri";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSS3ControlS3InitiateRestoreObjectOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expirationInDays" : @"ExpirationInDays",
             @"glacierJobTier" : @"GlacierJobTier",
             };
}

+ (NSValueTransformer *)glacierJobTierJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BULK"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3GlacierJobTierBulk);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3GlacierJobTierStandard);
        }
        return @(AWSAWSS3ControlS3GlacierJobTierUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3GlacierJobTierBulk:
                return @"BULK";
            case AWSAWSS3ControlS3GlacierJobTierStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSS3ControlS3ObjectLockLegalHold

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3ObjectLockLegalHoldStatusOff);
        }
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3ObjectLockLegalHoldStatusOn);
        }
        return @(AWSAWSS3ControlS3ObjectLockLegalHoldStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3ObjectLockLegalHoldStatusOff:
                return @"OFF";
            case AWSAWSS3ControlS3ObjectLockLegalHoldStatusOn:
                return @"ON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSS3ControlS3ObjectMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cacheControl" : @"CacheControl",
             @"contentDisposition" : @"ContentDisposition",
             @"contentEncoding" : @"ContentEncoding",
             @"contentLanguage" : @"ContentLanguage",
             @"contentLength" : @"ContentLength",
             @"contentMD5" : @"ContentMD5",
             @"contentType" : @"ContentType",
             @"httpExpiresDate" : @"HttpExpiresDate",
             @"requesterCharged" : @"RequesterCharged",
             @"SSEAlgorithm" : @"SSEAlgorithm",
             @"userMetadata" : @"UserMetadata",
             };
}

+ (NSValueTransformer *)httpExpiresDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)SSEAlgorithmJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AES256"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3SSEAlgorithmAES256);
        }
        if ([value caseInsensitiveCompare:@"KMS"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3SSEAlgorithmKms);
        }
        return @(AWSAWSS3ControlS3SSEAlgorithmUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3SSEAlgorithmAES256:
                return @"AES256";
            case AWSAWSS3ControlS3SSEAlgorithmKms:
                return @"KMS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSS3ControlS3ObjectOwner

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"identifier" : @"ID",
             };
}

@end

@implementation AWSAWSS3ControlS3Retention

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mode" : @"Mode",
             @"retainUntilDate" : @"RetainUntilDate",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COMPLIANCE"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3ObjectLockRetentionModeCompliance);
        }
        if ([value caseInsensitiveCompare:@"GOVERNANCE"] == NSOrderedSame) {
            return @(AWSAWSS3ControlS3ObjectLockRetentionModeGovernance);
        }
        return @(AWSAWSS3ControlS3ObjectLockRetentionModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlS3ObjectLockRetentionModeCompliance:
                return @"COMPLIANCE";
            case AWSAWSS3ControlS3ObjectLockRetentionModeGovernance:
                return @"GOVERNANCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)retainUntilDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSAWSS3ControlS3SetObjectAclOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessControlPolicy" : @"AccessControlPolicy",
             };
}

+ (NSValueTransformer *)accessControlPolicyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3AccessControlPolicy class]];
}

@end

@implementation AWSAWSS3ControlS3SetObjectLegalHoldOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"legalHold" : @"LegalHold",
             };
}

+ (NSValueTransformer *)legalHoldJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3ObjectLockLegalHold class]];
}

@end

@implementation AWSAWSS3ControlS3SetObjectRetentionOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bypassGovernanceRetention" : @"BypassGovernanceRetention",
             @"retention" : @"Retention",
             };
}

+ (NSValueTransformer *)retentionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSAWSS3ControlS3Retention class]];
}

@end

@implementation AWSAWSS3ControlS3SetObjectTaggingOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagSet" : @"TagSet",
             };
}

+ (NSValueTransformer *)tagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSAWSS3ControlS3Tag class]];
}

@end

@implementation AWSAWSS3ControlS3Tag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSAWSS3ControlUpdateJobPriorityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"jobId" : @"JobId",
             @"priority" : @"Priority",
             };
}

@end

@implementation AWSAWSS3ControlUpdateJobPriorityResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"priority" : @"Priority",
             };
}

@end

@implementation AWSAWSS3ControlUpdateJobStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"jobId" : @"JobId",
             @"requestedJobStatus" : @"RequestedJobStatus",
             @"statusUpdateReason" : @"StatusUpdateReason",
             };
}

+ (NSValueTransformer *)requestedJobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSAWSS3ControlRequestedJobStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSAWSS3ControlRequestedJobStatusReady);
        }
        return @(AWSAWSS3ControlRequestedJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlRequestedJobStatusCancelled:
                return @"Cancelled";
            case AWSAWSS3ControlRequestedJobStatusReady:
                return @"Ready";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSS3ControlUpdateJobStatusResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"status" : @"Status",
             @"statusUpdateReason" : @"StatusUpdateReason",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusActive);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"Cancelling"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusCancelling);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusComplete);
        }
        if ([value caseInsensitiveCompare:@"Completing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusCompleting);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Failing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusFailing);
        }
        if ([value caseInsensitiveCompare:@"New"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusNew);
        }
        if ([value caseInsensitiveCompare:@"Paused"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusPaused);
        }
        if ([value caseInsensitiveCompare:@"Pausing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusPausing);
        }
        if ([value caseInsensitiveCompare:@"Preparing"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusPreparing);
        }
        if ([value caseInsensitiveCompare:@"Ready"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusReady);
        }
        if ([value caseInsensitiveCompare:@"Suspended"] == NSOrderedSame) {
            return @(AWSAWSS3ControlJobStatusSuspended);
        }
        return @(AWSAWSS3ControlJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSAWSS3ControlJobStatusActive:
                return @"Active";
            case AWSAWSS3ControlJobStatusCancelled:
                return @"Cancelled";
            case AWSAWSS3ControlJobStatusCancelling:
                return @"Cancelling";
            case AWSAWSS3ControlJobStatusComplete:
                return @"Complete";
            case AWSAWSS3ControlJobStatusCompleting:
                return @"Completing";
            case AWSAWSS3ControlJobStatusFailed:
                return @"Failed";
            case AWSAWSS3ControlJobStatusFailing:
                return @"Failing";
            case AWSAWSS3ControlJobStatusNew:
                return @"New";
            case AWSAWSS3ControlJobStatusPaused:
                return @"Paused";
            case AWSAWSS3ControlJobStatusPausing:
                return @"Pausing";
            case AWSAWSS3ControlJobStatusPreparing:
                return @"Preparing";
            case AWSAWSS3ControlJobStatusReady:
                return @"Ready";
            case AWSAWSS3ControlJobStatusSuspended:
                return @"Suspended";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSAWSS3ControlVpcConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcId" : @"VpcId",
             };
}

@end
