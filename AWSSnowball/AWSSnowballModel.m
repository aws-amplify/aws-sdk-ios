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

#import "AWSSnowballModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSSnowballErrorDomain = @"com.amazonaws.AWSSnowballErrorDomain";

@implementation AWSSnowballAddress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             @"city" : @"City",
             @"company" : @"Company",
             @"country" : @"Country",
             @"isRestricted" : @"IsRestricted",
             @"landmark" : @"Landmark",
             @"name" : @"Name",
             @"phoneNumber" : @"PhoneNumber",
             @"postalCode" : @"PostalCode",
             @"prefectureOrDistrict" : @"PrefectureOrDistrict",
             @"stateOrProvince" : @"StateOrProvince",
             @"street1" : @"Street1",
             @"street2" : @"Street2",
             @"street3" : @"Street3",
             };
}

@end

@implementation AWSSnowballCancelClusterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSSnowballCancelClusterResult

@end

@implementation AWSSnowballCancelJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSSnowballCancelJobResult

@end

@implementation AWSSnowballClusterListEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"clusterState" : @"ClusterState",
             @"creationDate" : @"CreationDate",
             @"detail" : @"Description",
             };
}

+ (NSValueTransformer *)clusterStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AwaitingQuorum"] == NSOrderedSame) {
            return @(AWSSnowballClusterStateAwaitingQuorum);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSnowballClusterStatePending);
        }
        if ([value caseInsensitiveCompare:@"InUse"] == NSOrderedSame) {
            return @(AWSSnowballClusterStateInUse);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSSnowballClusterStateComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSnowballClusterStateCancelled);
        }
        return @(AWSSnowballClusterStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballClusterStateAwaitingQuorum:
                return @"AwaitingQuorum";
            case AWSSnowballClusterStatePending:
                return @"Pending";
            case AWSSnowballClusterStateInUse:
                return @"InUse";
            case AWSSnowballClusterStateComplete:
                return @"Complete";
            case AWSSnowballClusterStateCancelled:
                return @"Cancelled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSSnowballClusterMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             @"clusterId" : @"ClusterId",
             @"clusterState" : @"ClusterState",
             @"creationDate" : @"CreationDate",
             @"detail" : @"Description",
             @"forwardingAddressId" : @"ForwardingAddressId",
             @"jobType" : @"JobType",
             @"kmsKeyARN" : @"KmsKeyARN",
             @"notification" : @"Notification",
             @"resources" : @"Resources",
             @"roleARN" : @"RoleARN",
             @"shippingOption" : @"ShippingOption",
             @"snowballType" : @"SnowballType",
             @"taxDocuments" : @"TaxDocuments",
             };
}

+ (NSValueTransformer *)clusterStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AwaitingQuorum"] == NSOrderedSame) {
            return @(AWSSnowballClusterStateAwaitingQuorum);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSnowballClusterStatePending);
        }
        if ([value caseInsensitiveCompare:@"InUse"] == NSOrderedSame) {
            return @(AWSSnowballClusterStateInUse);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSSnowballClusterStateComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSnowballClusterStateCancelled);
        }
        return @(AWSSnowballClusterStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballClusterStateAwaitingQuorum:
                return @"AwaitingQuorum";
            case AWSSnowballClusterStatePending:
                return @"Pending";
            case AWSSnowballClusterStateInUse:
                return @"InUse";
            case AWSSnowballClusterStateComplete:
                return @"Complete";
            case AWSSnowballClusterStateCancelled:
                return @"Cancelled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeImport);
        }
        if ([value caseInsensitiveCompare:@"EXPORT"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeExport);
        }
        if ([value caseInsensitiveCompare:@"LOCAL_USE"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeLocalUse);
        }
        return @(AWSSnowballJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballJobTypeImport:
                return @"IMPORT";
            case AWSSnowballJobTypeExport:
                return @"EXPORT";
            case AWSSnowballJobTypeLocalUse:
                return @"LOCAL_USE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballJobResource class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionStandard);
        }
        return @(AWSSnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSSnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSSnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSSnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdge);
        }
        if ([value caseInsensitiveCompare:@"EDGE_C"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeC);
        }
        if ([value caseInsensitiveCompare:@"EDGE_CG"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeCg);
        }
        if ([value caseInsensitiveCompare:@"EDGE_S"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeS);
        }
        if ([value caseInsensitiveCompare:@"SNC1_HDD"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeSnc1Hdd);
        }
        return @(AWSSnowballSnowballTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballSnowballTypeStandard:
                return @"STANDARD";
            case AWSSnowballSnowballTypeEdge:
                return @"EDGE";
            case AWSSnowballSnowballTypeEdgeC:
                return @"EDGE_C";
            case AWSSnowballSnowballTypeEdgeCg:
                return @"EDGE_CG";
            case AWSSnowballSnowballTypeEdgeS:
                return @"EDGE_S";
            case AWSSnowballSnowballTypeSnc1Hdd:
                return @"SNC1_HDD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taxDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballTaxDocuments class]];
}

@end

@implementation AWSSnowballCompatibleImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiId" : @"AmiId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSSnowballCreateAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             };
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballAddress class]];
}

@end

@implementation AWSSnowballCreateAddressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             };
}

@end

@implementation AWSSnowballCreateClusterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             @"detail" : @"Description",
             @"forwardingAddressId" : @"ForwardingAddressId",
             @"jobType" : @"JobType",
             @"kmsKeyARN" : @"KmsKeyARN",
             @"notification" : @"Notification",
             @"resources" : @"Resources",
             @"roleARN" : @"RoleARN",
             @"shippingOption" : @"ShippingOption",
             @"snowballType" : @"SnowballType",
             @"taxDocuments" : @"TaxDocuments",
             };
}

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeImport);
        }
        if ([value caseInsensitiveCompare:@"EXPORT"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeExport);
        }
        if ([value caseInsensitiveCompare:@"LOCAL_USE"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeLocalUse);
        }
        return @(AWSSnowballJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballJobTypeImport:
                return @"IMPORT";
            case AWSSnowballJobTypeExport:
                return @"EXPORT";
            case AWSSnowballJobTypeLocalUse:
                return @"LOCAL_USE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballJobResource class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionStandard);
        }
        return @(AWSSnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSSnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSSnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSSnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdge);
        }
        if ([value caseInsensitiveCompare:@"EDGE_C"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeC);
        }
        if ([value caseInsensitiveCompare:@"EDGE_CG"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeCg);
        }
        if ([value caseInsensitiveCompare:@"EDGE_S"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeS);
        }
        if ([value caseInsensitiveCompare:@"SNC1_HDD"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeSnc1Hdd);
        }
        return @(AWSSnowballSnowballTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballSnowballTypeStandard:
                return @"STANDARD";
            case AWSSnowballSnowballTypeEdge:
                return @"EDGE";
            case AWSSnowballSnowballTypeEdgeC:
                return @"EDGE_C";
            case AWSSnowballSnowballTypeEdgeCg:
                return @"EDGE_CG";
            case AWSSnowballSnowballTypeEdgeS:
                return @"EDGE_S";
            case AWSSnowballSnowballTypeSnc1Hdd:
                return @"SNC1_HDD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taxDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballTaxDocuments class]];
}

@end

@implementation AWSSnowballCreateClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSSnowballCreateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             @"clusterId" : @"ClusterId",
             @"detail" : @"Description",
             @"deviceConfiguration" : @"DeviceConfiguration",
             @"forwardingAddressId" : @"ForwardingAddressId",
             @"jobType" : @"JobType",
             @"kmsKeyARN" : @"KmsKeyARN",
             @"notification" : @"Notification",
             @"resources" : @"Resources",
             @"roleARN" : @"RoleARN",
             @"shippingOption" : @"ShippingOption",
             @"snowballCapacityPreference" : @"SnowballCapacityPreference",
             @"snowballType" : @"SnowballType",
             @"taxDocuments" : @"TaxDocuments",
             };
}

+ (NSValueTransformer *)deviceConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballDeviceConfiguration class]];
}

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeImport);
        }
        if ([value caseInsensitiveCompare:@"EXPORT"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeExport);
        }
        if ([value caseInsensitiveCompare:@"LOCAL_USE"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeLocalUse);
        }
        return @(AWSSnowballJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballJobTypeImport:
                return @"IMPORT";
            case AWSSnowballJobTypeExport:
                return @"EXPORT";
            case AWSSnowballJobTypeLocalUse:
                return @"LOCAL_USE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballJobResource class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionStandard);
        }
        return @(AWSSnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSSnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSSnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSSnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballCapacityPreferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"T50"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT50);
        }
        if ([value caseInsensitiveCompare:@"T80"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT80);
        }
        if ([value caseInsensitiveCompare:@"T100"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT100);
        }
        if ([value caseInsensitiveCompare:@"T42"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT42);
        }
        if ([value caseInsensitiveCompare:@"T98"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT98);
        }
        if ([value caseInsensitiveCompare:@"T8"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT8);
        }
        if ([value caseInsensitiveCompare:@"NoPreference"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityNoPreference);
        }
        return @(AWSSnowballSnowballCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballSnowballCapacityT50:
                return @"T50";
            case AWSSnowballSnowballCapacityT80:
                return @"T80";
            case AWSSnowballSnowballCapacityT100:
                return @"T100";
            case AWSSnowballSnowballCapacityT42:
                return @"T42";
            case AWSSnowballSnowballCapacityT98:
                return @"T98";
            case AWSSnowballSnowballCapacityT8:
                return @"T8";
            case AWSSnowballSnowballCapacityNoPreference:
                return @"NoPreference";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdge);
        }
        if ([value caseInsensitiveCompare:@"EDGE_C"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeC);
        }
        if ([value caseInsensitiveCompare:@"EDGE_CG"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeCg);
        }
        if ([value caseInsensitiveCompare:@"EDGE_S"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeS);
        }
        if ([value caseInsensitiveCompare:@"SNC1_HDD"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeSnc1Hdd);
        }
        return @(AWSSnowballSnowballTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballSnowballTypeStandard:
                return @"STANDARD";
            case AWSSnowballSnowballTypeEdge:
                return @"EDGE";
            case AWSSnowballSnowballTypeEdgeC:
                return @"EDGE_C";
            case AWSSnowballSnowballTypeEdgeCg:
                return @"EDGE_CG";
            case AWSSnowballSnowballTypeEdgeS:
                return @"EDGE_S";
            case AWSSnowballSnowballTypeSnc1Hdd:
                return @"SNC1_HDD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taxDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballTaxDocuments class]];
}

@end

@implementation AWSSnowballCreateJobResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSSnowballDataTransfer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytesTransferred" : @"BytesTransferred",
             @"objectsTransferred" : @"ObjectsTransferred",
             @"totalBytes" : @"TotalBytes",
             @"totalObjects" : @"TotalObjects",
             };
}

@end

@implementation AWSSnowballDescribeAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             };
}

@end

@implementation AWSSnowballDescribeAddressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             };
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballAddress class]];
}

@end

@implementation AWSSnowballDescribeAddressesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSnowballDescribeAddressesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addresses" : @"Addresses",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)addressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSnowballAddress class]];
}

@end

@implementation AWSSnowballDescribeClusterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSSnowballDescribeClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterMetadata" : @"ClusterMetadata",
             };
}

+ (NSValueTransformer *)clusterMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballClusterMetadata class]];
}

@end

@implementation AWSSnowballDescribeJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSSnowballDescribeJobResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobMetadata" : @"JobMetadata",
             @"subJobMetadata" : @"SubJobMetadata",
             };
}

+ (NSValueTransformer *)jobMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballJobMetadata class]];
}

+ (NSValueTransformer *)subJobMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSnowballJobMetadata class]];
}

@end

@implementation AWSSnowballDeviceConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snowconeDeviceConfiguration" : @"SnowconeDeviceConfiguration",
             };
}

+ (NSValueTransformer *)snowconeDeviceConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballSnowconeDeviceConfiguration class]];
}

@end

@implementation AWSSnowballEc2AmiResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiId" : @"AmiId",
             @"snowballAmiId" : @"SnowballAmiId",
             };
}

@end

@implementation AWSSnowballEventTriggerDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventResourceARN" : @"EventResourceARN",
             };
}

@end

@implementation AWSSnowballGetJobManifestRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSSnowballGetJobManifestResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestURI" : @"ManifestURI",
             };
}

@end

@implementation AWSSnowballGetJobUnlockCodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSSnowballGetJobUnlockCodeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unlockCode" : @"UnlockCode",
             };
}

@end

@implementation AWSSnowballGetSnowballUsageRequest

@end

@implementation AWSSnowballGetSnowballUsageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snowballLimit" : @"SnowballLimit",
             @"snowballsInUse" : @"SnowballsInUse",
             };
}

@end

@implementation AWSSnowballGetSoftwareUpdatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSSnowballGetSoftwareUpdatesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"updatesURI" : @"UpdatesURI",
             };
}

@end

@implementation AWSSnowballINDTaxDocuments

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GSTIN" : @"GSTIN",
             };
}

@end

@implementation AWSSnowballJobListEntry

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"detail" : @"Description",
             @"isMaster" : @"IsMaster",
             @"jobId" : @"JobId",
             @"jobState" : @"JobState",
             @"jobType" : @"JobType",
             @"snowballType" : @"SnowballType",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)jobStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"New"] == NSOrderedSame) {
            return @(AWSSnowballJobStateNew);
        }
        if ([value caseInsensitiveCompare:@"PreparingAppliance"] == NSOrderedSame) {
            return @(AWSSnowballJobStatePreparingAppliance);
        }
        if ([value caseInsensitiveCompare:@"PreparingShipment"] == NSOrderedSame) {
            return @(AWSSnowballJobStatePreparingShipment);
        }
        if ([value caseInsensitiveCompare:@"InTransitToCustomer"] == NSOrderedSame) {
            return @(AWSSnowballJobStateInTransitToCustomer);
        }
        if ([value caseInsensitiveCompare:@"WithCustomer"] == NSOrderedSame) {
            return @(AWSSnowballJobStateWithCustomer);
        }
        if ([value caseInsensitiveCompare:@"InTransitToAWS"] == NSOrderedSame) {
            return @(AWSSnowballJobStateInTransitToAWS);
        }
        if ([value caseInsensitiveCompare:@"WithAWSSortingFacility"] == NSOrderedSame) {
            return @(AWSSnowballJobStateWithAWSSortingFacility);
        }
        if ([value caseInsensitiveCompare:@"WithAWS"] == NSOrderedSame) {
            return @(AWSSnowballJobStateWithAWS);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSnowballJobStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSSnowballJobStateComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSnowballJobStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"Listing"] == NSOrderedSame) {
            return @(AWSSnowballJobStateListing);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSnowballJobStatePending);
        }
        return @(AWSSnowballJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballJobStateNew:
                return @"New";
            case AWSSnowballJobStatePreparingAppliance:
                return @"PreparingAppliance";
            case AWSSnowballJobStatePreparingShipment:
                return @"PreparingShipment";
            case AWSSnowballJobStateInTransitToCustomer:
                return @"InTransitToCustomer";
            case AWSSnowballJobStateWithCustomer:
                return @"WithCustomer";
            case AWSSnowballJobStateInTransitToAWS:
                return @"InTransitToAWS";
            case AWSSnowballJobStateWithAWSSortingFacility:
                return @"WithAWSSortingFacility";
            case AWSSnowballJobStateWithAWS:
                return @"WithAWS";
            case AWSSnowballJobStateInProgress:
                return @"InProgress";
            case AWSSnowballJobStateComplete:
                return @"Complete";
            case AWSSnowballJobStateCancelled:
                return @"Cancelled";
            case AWSSnowballJobStateListing:
                return @"Listing";
            case AWSSnowballJobStatePending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeImport);
        }
        if ([value caseInsensitiveCompare:@"EXPORT"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeExport);
        }
        if ([value caseInsensitiveCompare:@"LOCAL_USE"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeLocalUse);
        }
        return @(AWSSnowballJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballJobTypeImport:
                return @"IMPORT";
            case AWSSnowballJobTypeExport:
                return @"EXPORT";
            case AWSSnowballJobTypeLocalUse:
                return @"LOCAL_USE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdge);
        }
        if ([value caseInsensitiveCompare:@"EDGE_C"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeC);
        }
        if ([value caseInsensitiveCompare:@"EDGE_CG"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeCg);
        }
        if ([value caseInsensitiveCompare:@"EDGE_S"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeS);
        }
        if ([value caseInsensitiveCompare:@"SNC1_HDD"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeSnc1Hdd);
        }
        return @(AWSSnowballSnowballTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballSnowballTypeStandard:
                return @"STANDARD";
            case AWSSnowballSnowballTypeEdge:
                return @"EDGE";
            case AWSSnowballSnowballTypeEdgeC:
                return @"EDGE_C";
            case AWSSnowballSnowballTypeEdgeCg:
                return @"EDGE_CG";
            case AWSSnowballSnowballTypeEdgeS:
                return @"EDGE_S";
            case AWSSnowballSnowballTypeSnc1Hdd:
                return @"SNC1_HDD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSnowballJobLogs

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobCompletionReportURI" : @"JobCompletionReportURI",
             @"jobFailureLogURI" : @"JobFailureLogURI",
             @"jobSuccessLogURI" : @"JobSuccessLogURI",
             };
}

@end

@implementation AWSSnowballJobMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             @"clusterId" : @"ClusterId",
             @"creationDate" : @"CreationDate",
             @"dataTransferProgress" : @"DataTransferProgress",
             @"detail" : @"Description",
             @"deviceConfiguration" : @"DeviceConfiguration",
             @"forwardingAddressId" : @"ForwardingAddressId",
             @"jobId" : @"JobId",
             @"jobLogInfo" : @"JobLogInfo",
             @"jobState" : @"JobState",
             @"jobType" : @"JobType",
             @"kmsKeyARN" : @"KmsKeyARN",
             @"notification" : @"Notification",
             @"resources" : @"Resources",
             @"roleARN" : @"RoleARN",
             @"shippingDetails" : @"ShippingDetails",
             @"snowballCapacityPreference" : @"SnowballCapacityPreference",
             @"snowballType" : @"SnowballType",
             @"taxDocuments" : @"TaxDocuments",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dataTransferProgressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballDataTransfer class]];
}

+ (NSValueTransformer *)deviceConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballDeviceConfiguration class]];
}

+ (NSValueTransformer *)jobLogInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballJobLogs class]];
}

+ (NSValueTransformer *)jobStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"New"] == NSOrderedSame) {
            return @(AWSSnowballJobStateNew);
        }
        if ([value caseInsensitiveCompare:@"PreparingAppliance"] == NSOrderedSame) {
            return @(AWSSnowballJobStatePreparingAppliance);
        }
        if ([value caseInsensitiveCompare:@"PreparingShipment"] == NSOrderedSame) {
            return @(AWSSnowballJobStatePreparingShipment);
        }
        if ([value caseInsensitiveCompare:@"InTransitToCustomer"] == NSOrderedSame) {
            return @(AWSSnowballJobStateInTransitToCustomer);
        }
        if ([value caseInsensitiveCompare:@"WithCustomer"] == NSOrderedSame) {
            return @(AWSSnowballJobStateWithCustomer);
        }
        if ([value caseInsensitiveCompare:@"InTransitToAWS"] == NSOrderedSame) {
            return @(AWSSnowballJobStateInTransitToAWS);
        }
        if ([value caseInsensitiveCompare:@"WithAWSSortingFacility"] == NSOrderedSame) {
            return @(AWSSnowballJobStateWithAWSSortingFacility);
        }
        if ([value caseInsensitiveCompare:@"WithAWS"] == NSOrderedSame) {
            return @(AWSSnowballJobStateWithAWS);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSSnowballJobStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSSnowballJobStateComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSSnowballJobStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"Listing"] == NSOrderedSame) {
            return @(AWSSnowballJobStateListing);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSSnowballJobStatePending);
        }
        return @(AWSSnowballJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballJobStateNew:
                return @"New";
            case AWSSnowballJobStatePreparingAppliance:
                return @"PreparingAppliance";
            case AWSSnowballJobStatePreparingShipment:
                return @"PreparingShipment";
            case AWSSnowballJobStateInTransitToCustomer:
                return @"InTransitToCustomer";
            case AWSSnowballJobStateWithCustomer:
                return @"WithCustomer";
            case AWSSnowballJobStateInTransitToAWS:
                return @"InTransitToAWS";
            case AWSSnowballJobStateWithAWSSortingFacility:
                return @"WithAWSSortingFacility";
            case AWSSnowballJobStateWithAWS:
                return @"WithAWS";
            case AWSSnowballJobStateInProgress:
                return @"InProgress";
            case AWSSnowballJobStateComplete:
                return @"Complete";
            case AWSSnowballJobStateCancelled:
                return @"Cancelled";
            case AWSSnowballJobStateListing:
                return @"Listing";
            case AWSSnowballJobStatePending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeImport);
        }
        if ([value caseInsensitiveCompare:@"EXPORT"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeExport);
        }
        if ([value caseInsensitiveCompare:@"LOCAL_USE"] == NSOrderedSame) {
            return @(AWSSnowballJobTypeLocalUse);
        }
        return @(AWSSnowballJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballJobTypeImport:
                return @"IMPORT";
            case AWSSnowballJobTypeExport:
                return @"EXPORT";
            case AWSSnowballJobTypeLocalUse:
                return @"LOCAL_USE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballJobResource class]];
}

+ (NSValueTransformer *)shippingDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballShippingDetails class]];
}

+ (NSValueTransformer *)snowballCapacityPreferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"T50"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT50);
        }
        if ([value caseInsensitiveCompare:@"T80"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT80);
        }
        if ([value caseInsensitiveCompare:@"T100"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT100);
        }
        if ([value caseInsensitiveCompare:@"T42"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT42);
        }
        if ([value caseInsensitiveCompare:@"T98"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT98);
        }
        if ([value caseInsensitiveCompare:@"T8"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT8);
        }
        if ([value caseInsensitiveCompare:@"NoPreference"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityNoPreference);
        }
        return @(AWSSnowballSnowballCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballSnowballCapacityT50:
                return @"T50";
            case AWSSnowballSnowballCapacityT80:
                return @"T80";
            case AWSSnowballSnowballCapacityT100:
                return @"T100";
            case AWSSnowballSnowballCapacityT42:
                return @"T42";
            case AWSSnowballSnowballCapacityT98:
                return @"T98";
            case AWSSnowballSnowballCapacityT8:
                return @"T8";
            case AWSSnowballSnowballCapacityNoPreference:
                return @"NoPreference";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdge);
        }
        if ([value caseInsensitiveCompare:@"EDGE_C"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeC);
        }
        if ([value caseInsensitiveCompare:@"EDGE_CG"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeCg);
        }
        if ([value caseInsensitiveCompare:@"EDGE_S"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeEdgeS);
        }
        if ([value caseInsensitiveCompare:@"SNC1_HDD"] == NSOrderedSame) {
            return @(AWSSnowballSnowballTypeSnc1Hdd);
        }
        return @(AWSSnowballSnowballTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballSnowballTypeStandard:
                return @"STANDARD";
            case AWSSnowballSnowballTypeEdge:
                return @"EDGE";
            case AWSSnowballSnowballTypeEdgeC:
                return @"EDGE_C";
            case AWSSnowballSnowballTypeEdgeCg:
                return @"EDGE_CG";
            case AWSSnowballSnowballTypeEdgeS:
                return @"EDGE_S";
            case AWSSnowballSnowballTypeSnc1Hdd:
                return @"SNC1_HDD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taxDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballTaxDocuments class]];
}

@end

@implementation AWSSnowballJobResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ec2AmiResources" : @"Ec2AmiResources",
             @"lambdaResources" : @"LambdaResources",
             @"s3Resources" : @"S3Resources",
             };
}

+ (NSValueTransformer *)ec2AmiResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSnowballEc2AmiResource class]];
}

+ (NSValueTransformer *)lambdaResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSnowballLambdaResource class]];
}

+ (NSValueTransformer *)s3ResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSnowballS3Resource class]];
}

@end

@implementation AWSSnowballKeyRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginMarker" : @"BeginMarker",
             @"endMarker" : @"EndMarker",
             };
}

@end

@implementation AWSSnowballLambdaResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventTriggers" : @"EventTriggers",
             @"lambdaArn" : @"LambdaArn",
             };
}

+ (NSValueTransformer *)eventTriggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSnowballEventTriggerDefinition class]];
}

@end

@implementation AWSSnowballListClusterJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSnowballListClusterJobsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobListEntries" : @"JobListEntries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobListEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSnowballJobListEntry class]];
}

@end

@implementation AWSSnowballListClustersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSnowballListClustersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterListEntries" : @"ClusterListEntries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)clusterListEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSnowballClusterListEntry class]];
}

@end

@implementation AWSSnowballListCompatibleImagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSnowballListCompatibleImagesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleImages" : @"CompatibleImages",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)compatibleImagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSnowballCompatibleImage class]];
}

@end

@implementation AWSSnowballListJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSSnowballListJobsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobListEntries" : @"JobListEntries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobListEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSSnowballJobListEntry class]];
}

@end

@implementation AWSSnowballNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobStatesToNotify" : @"JobStatesToNotify",
             @"notifyAll" : @"NotifyAll",
             @"snsTopicARN" : @"SnsTopicARN",
             };
}

@end

@implementation AWSSnowballS3Resource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketArn" : @"BucketArn",
             @"keyRange" : @"KeyRange",
             };
}

+ (NSValueTransformer *)keyRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballKeyRange class]];
}

@end

@implementation AWSSnowballShipment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"trackingNumber" : @"TrackingNumber",
             };
}

@end

@implementation AWSSnowballShippingDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inboundShipment" : @"InboundShipment",
             @"outboundShipment" : @"OutboundShipment",
             @"shippingOption" : @"ShippingOption",
             };
}

+ (NSValueTransformer *)inboundShipmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballShipment class]];
}

+ (NSValueTransformer *)outboundShipmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballShipment class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionStandard);
        }
        return @(AWSSnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSSnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSSnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSSnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSnowballSnowconeDeviceConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"wirelessConnection" : @"WirelessConnection",
             };
}

+ (NSValueTransformer *)wirelessConnectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballWirelessConnection class]];
}

@end

@implementation AWSSnowballTaxDocuments

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IND" : @"IND",
             };
}

+ (NSValueTransformer *)INDJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballINDTaxDocuments class]];
}

@end

@implementation AWSSnowballUpdateClusterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             @"clusterId" : @"ClusterId",
             @"detail" : @"Description",
             @"forwardingAddressId" : @"ForwardingAddressId",
             @"notification" : @"Notification",
             @"resources" : @"Resources",
             @"roleARN" : @"RoleARN",
             @"shippingOption" : @"ShippingOption",
             };
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballJobResource class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionStandard);
        }
        return @(AWSSnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSSnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSSnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSSnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSnowballUpdateClusterResult

@end

@implementation AWSSnowballUpdateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             @"detail" : @"Description",
             @"forwardingAddressId" : @"ForwardingAddressId",
             @"jobId" : @"JobId",
             @"notification" : @"Notification",
             @"resources" : @"Resources",
             @"roleARN" : @"RoleARN",
             @"shippingOption" : @"ShippingOption",
             @"snowballCapacityPreference" : @"SnowballCapacityPreference",
             };
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSSnowballJobResource class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSSnowballShippingOptionStandard);
        }
        return @(AWSSnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSSnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSSnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSSnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballCapacityPreferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"T50"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT50);
        }
        if ([value caseInsensitiveCompare:@"T80"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT80);
        }
        if ([value caseInsensitiveCompare:@"T100"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT100);
        }
        if ([value caseInsensitiveCompare:@"T42"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT42);
        }
        if ([value caseInsensitiveCompare:@"T98"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT98);
        }
        if ([value caseInsensitiveCompare:@"T8"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityT8);
        }
        if ([value caseInsensitiveCompare:@"NoPreference"] == NSOrderedSame) {
            return @(AWSSnowballSnowballCapacityNoPreference);
        }
        return @(AWSSnowballSnowballCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSSnowballSnowballCapacityT50:
                return @"T50";
            case AWSSnowballSnowballCapacityT80:
                return @"T80";
            case AWSSnowballSnowballCapacityT100:
                return @"T100";
            case AWSSnowballSnowballCapacityT42:
                return @"T42";
            case AWSSnowballSnowballCapacityT98:
                return @"T98";
            case AWSSnowballSnowballCapacityT8:
                return @"T8";
            case AWSSnowballSnowballCapacityNoPreference:
                return @"NoPreference";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSSnowballUpdateJobResult

@end

@implementation AWSSnowballWirelessConnection

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isWifiEnabled" : @"IsWifiEnabled",
             };
}

@end
