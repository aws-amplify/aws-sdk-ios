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

#import "AWSMarketplacemeteringModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSMarketplacemeteringErrorDomain = @"com.amazonaws.AWSMarketplacemeteringErrorDomain";

@implementation AWSMarketplacemeteringBatchMeterUsageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productCode" : @"ProductCode",
             @"usageRecords" : @"UsageRecords",
             };
}

+ (NSValueTransformer *)usageRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMarketplacemeteringUsageRecord class]];
}

@end

@implementation AWSMarketplacemeteringBatchMeterUsageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"results" : @"Results",
             @"unprocessedRecords" : @"UnprocessedRecords",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMarketplacemeteringUsageRecordResult class]];
}

+ (NSValueTransformer *)unprocessedRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMarketplacemeteringUsageRecord class]];
}

@end

@implementation AWSMarketplacemeteringMeterUsageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"productCode" : @"ProductCode",
             @"timestamp" : @"Timestamp",
             @"usageDimension" : @"UsageDimension",
             @"usageQuantity" : @"UsageQuantity",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSMarketplacemeteringMeterUsageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meteringRecordId" : @"MeteringRecordId",
             };
}

@end

@implementation AWSMarketplacemeteringRegisterUsageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nonce" : @"Nonce",
             @"productCode" : @"ProductCode",
             @"publicKeyVersion" : @"PublicKeyVersion",
             };
}

@end

@implementation AWSMarketplacemeteringRegisterUsageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"publicKeyRotationTimestamp" : @"PublicKeyRotationTimestamp",
             @"signature" : @"Signature",
             };
}

+ (NSValueTransformer *)publicKeyRotationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSMarketplacemeteringResolveCustomerRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"registrationToken" : @"RegistrationToken",
             };
}

@end

@implementation AWSMarketplacemeteringResolveCustomerResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerIdentifier" : @"CustomerIdentifier",
             @"productCode" : @"ProductCode",
             };
}

@end

@implementation AWSMarketplacemeteringUsageRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerIdentifier" : @"CustomerIdentifier",
             @"dimension" : @"Dimension",
             @"quantity" : @"Quantity",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSMarketplacemeteringUsageRecordResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meteringRecordId" : @"MeteringRecordId",
             @"status" : @"Status",
             @"usageRecord" : @"UsageRecord",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSMarketplacemeteringUsageRecordResultStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"CustomerNotSubscribed"] == NSOrderedSame) {
            return @(AWSMarketplacemeteringUsageRecordResultStatusCustomerNotSubscribed);
        }
        if ([value caseInsensitiveCompare:@"DuplicateRecord"] == NSOrderedSame) {
            return @(AWSMarketplacemeteringUsageRecordResultStatusDuplicateRecord);
        }
        return @(AWSMarketplacemeteringUsageRecordResultStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMarketplacemeteringUsageRecordResultStatusSuccess:
                return @"Success";
            case AWSMarketplacemeteringUsageRecordResultStatusCustomerNotSubscribed:
                return @"CustomerNotSubscribed";
            case AWSMarketplacemeteringUsageRecordResultStatusDuplicateRecord:
                return @"DuplicateRecord";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)usageRecordJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMarketplacemeteringUsageRecord class]];
}

@end
