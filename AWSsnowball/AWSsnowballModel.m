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

#import "AWSsnowballModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSsnowballErrorDomain = @"com.amazonaws.AWSsnowballErrorDomain";

@implementation AWSsnowballAddress

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

@implementation AWSsnowballCancelClusterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSsnowballCancelClusterResult

@end

@implementation AWSsnowballCancelJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSsnowballCancelJobResult

@end

@implementation AWSsnowballClusterListEntry

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
            return @(AWSsnowballClusterStateAwaitingQuorum);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSsnowballClusterStatePending);
        }
        if ([value caseInsensitiveCompare:@"InUse"] == NSOrderedSame) {
            return @(AWSsnowballClusterStateInUse);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSsnowballClusterStateComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSsnowballClusterStateCancelled);
        }
        return @(AWSsnowballClusterStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballClusterStateAwaitingQuorum:
                return @"AwaitingQuorum";
            case AWSsnowballClusterStatePending:
                return @"Pending";
            case AWSsnowballClusterStateInUse:
                return @"InUse";
            case AWSsnowballClusterStateComplete:
                return @"Complete";
            case AWSsnowballClusterStateCancelled:
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

@implementation AWSsnowballClusterMetadata

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
            return @(AWSsnowballClusterStateAwaitingQuorum);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSsnowballClusterStatePending);
        }
        if ([value caseInsensitiveCompare:@"InUse"] == NSOrderedSame) {
            return @(AWSsnowballClusterStateInUse);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSsnowballClusterStateComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSsnowballClusterStateCancelled);
        }
        return @(AWSsnowballClusterStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballClusterStateAwaitingQuorum:
                return @"AwaitingQuorum";
            case AWSsnowballClusterStatePending:
                return @"Pending";
            case AWSsnowballClusterStateInUse:
                return @"InUse";
            case AWSsnowballClusterStateComplete:
                return @"Complete";
            case AWSsnowballClusterStateCancelled:
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
            return @(AWSsnowballJobTypeImport);
        }
        if ([value caseInsensitiveCompare:@"EXPORT"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeExport);
        }
        if ([value caseInsensitiveCompare:@"LOCAL_USE"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeLocalUse);
        }
        return @(AWSsnowballJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballJobTypeImport:
                return @"IMPORT";
            case AWSsnowballJobTypeExport:
                return @"EXPORT";
            case AWSsnowballJobTypeLocalUse:
                return @"LOCAL_USE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballJobResource class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionStandard);
        }
        return @(AWSsnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSsnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSsnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSsnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdge);
        }
        if ([value caseInsensitiveCompare:@"EDGE_C"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeC);
        }
        if ([value caseInsensitiveCompare:@"EDGE_CG"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeCg);
        }
        if ([value caseInsensitiveCompare:@"EDGE_S"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeS);
        }
        return @(AWSsnowballSnowballTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballSnowballTypeStandard:
                return @"STANDARD";
            case AWSsnowballSnowballTypeEdge:
                return @"EDGE";
            case AWSsnowballSnowballTypeEdgeC:
                return @"EDGE_C";
            case AWSsnowballSnowballTypeEdgeCg:
                return @"EDGE_CG";
            case AWSsnowballSnowballTypeEdgeS:
                return @"EDGE_S";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taxDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballTaxDocuments class]];
}

@end

@implementation AWSsnowballCompatibleImage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiId" : @"AmiId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSsnowballCreateAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             };
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballAddress class]];
}

@end

@implementation AWSsnowballCreateAddressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             };
}

@end

@implementation AWSsnowballCreateClusterRequest

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
            return @(AWSsnowballJobTypeImport);
        }
        if ([value caseInsensitiveCompare:@"EXPORT"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeExport);
        }
        if ([value caseInsensitiveCompare:@"LOCAL_USE"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeLocalUse);
        }
        return @(AWSsnowballJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballJobTypeImport:
                return @"IMPORT";
            case AWSsnowballJobTypeExport:
                return @"EXPORT";
            case AWSsnowballJobTypeLocalUse:
                return @"LOCAL_USE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballJobResource class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionStandard);
        }
        return @(AWSsnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSsnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSsnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSsnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdge);
        }
        if ([value caseInsensitiveCompare:@"EDGE_C"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeC);
        }
        if ([value caseInsensitiveCompare:@"EDGE_CG"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeCg);
        }
        if ([value caseInsensitiveCompare:@"EDGE_S"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeS);
        }
        return @(AWSsnowballSnowballTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballSnowballTypeStandard:
                return @"STANDARD";
            case AWSsnowballSnowballTypeEdge:
                return @"EDGE";
            case AWSsnowballSnowballTypeEdgeC:
                return @"EDGE_C";
            case AWSsnowballSnowballTypeEdgeCg:
                return @"EDGE_CG";
            case AWSsnowballSnowballTypeEdgeS:
                return @"EDGE_S";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taxDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballTaxDocuments class]];
}

@end

@implementation AWSsnowballCreateClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSsnowballCreateJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             @"clusterId" : @"ClusterId",
             @"detail" : @"Description",
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

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeImport);
        }
        if ([value caseInsensitiveCompare:@"EXPORT"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeExport);
        }
        if ([value caseInsensitiveCompare:@"LOCAL_USE"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeLocalUse);
        }
        return @(AWSsnowballJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballJobTypeImport:
                return @"IMPORT";
            case AWSsnowballJobTypeExport:
                return @"EXPORT";
            case AWSsnowballJobTypeLocalUse:
                return @"LOCAL_USE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballJobResource class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionStandard);
        }
        return @(AWSsnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSsnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSsnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSsnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballCapacityPreferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"T50"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT50);
        }
        if ([value caseInsensitiveCompare:@"T80"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT80);
        }
        if ([value caseInsensitiveCompare:@"T100"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT100);
        }
        if ([value caseInsensitiveCompare:@"T42"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT42);
        }
        if ([value caseInsensitiveCompare:@"T98"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT98);
        }
        if ([value caseInsensitiveCompare:@"NoPreference"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityNoPreference);
        }
        return @(AWSsnowballSnowballCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballSnowballCapacityT50:
                return @"T50";
            case AWSsnowballSnowballCapacityT80:
                return @"T80";
            case AWSsnowballSnowballCapacityT100:
                return @"T100";
            case AWSsnowballSnowballCapacityT42:
                return @"T42";
            case AWSsnowballSnowballCapacityT98:
                return @"T98";
            case AWSsnowballSnowballCapacityNoPreference:
                return @"NoPreference";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdge);
        }
        if ([value caseInsensitiveCompare:@"EDGE_C"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeC);
        }
        if ([value caseInsensitiveCompare:@"EDGE_CG"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeCg);
        }
        if ([value caseInsensitiveCompare:@"EDGE_S"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeS);
        }
        return @(AWSsnowballSnowballTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballSnowballTypeStandard:
                return @"STANDARD";
            case AWSsnowballSnowballTypeEdge:
                return @"EDGE";
            case AWSsnowballSnowballTypeEdgeC:
                return @"EDGE_C";
            case AWSsnowballSnowballTypeEdgeCg:
                return @"EDGE_CG";
            case AWSsnowballSnowballTypeEdgeS:
                return @"EDGE_S";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taxDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballTaxDocuments class]];
}

@end

@implementation AWSsnowballCreateJobResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSsnowballDataTransfer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bytesTransferred" : @"BytesTransferred",
             @"objectsTransferred" : @"ObjectsTransferred",
             @"totalBytes" : @"TotalBytes",
             @"totalObjects" : @"TotalObjects",
             };
}

@end

@implementation AWSsnowballDescribeAddressRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             };
}

@end

@implementation AWSsnowballDescribeAddressResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             };
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballAddress class]];
}

@end

@implementation AWSsnowballDescribeAddressesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsnowballDescribeAddressesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addresses" : @"Addresses",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)addressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsnowballAddress class]];
}

@end

@implementation AWSsnowballDescribeClusterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             };
}

@end

@implementation AWSsnowballDescribeClusterResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterMetadata" : @"ClusterMetadata",
             };
}

+ (NSValueTransformer *)clusterMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballClusterMetadata class]];
}

@end

@implementation AWSsnowballDescribeJobRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSsnowballDescribeJobResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobMetadata" : @"JobMetadata",
             @"subJobMetadata" : @"SubJobMetadata",
             };
}

+ (NSValueTransformer *)jobMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballJobMetadata class]];
}

+ (NSValueTransformer *)subJobMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsnowballJobMetadata class]];
}

@end

@implementation AWSsnowballEc2AmiResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"amiId" : @"AmiId",
             @"snowballAmiId" : @"SnowballAmiId",
             };
}

@end

@implementation AWSsnowballEventTriggerDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventResourceARN" : @"EventResourceARN",
             };
}

@end

@implementation AWSsnowballGetJobManifestRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSsnowballGetJobManifestResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestURI" : @"ManifestURI",
             };
}

@end

@implementation AWSsnowballGetJobUnlockCodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSsnowballGetJobUnlockCodeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unlockCode" : @"UnlockCode",
             };
}

@end

@implementation AWSsnowballGetSnowballUsageRequest

@end

@implementation AWSsnowballGetSnowballUsageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snowballLimit" : @"SnowballLimit",
             @"snowballsInUse" : @"SnowballsInUse",
             };
}

@end

@implementation AWSsnowballGetSoftwareUpdatesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSsnowballGetSoftwareUpdatesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"updatesURI" : @"UpdatesURI",
             };
}

@end

@implementation AWSsnowballINDTaxDocuments

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GSTIN" : @"GSTIN",
             };
}

@end

@implementation AWSsnowballJobListEntry

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
            return @(AWSsnowballJobStateNew);
        }
        if ([value caseInsensitiveCompare:@"PreparingAppliance"] == NSOrderedSame) {
            return @(AWSsnowballJobStatePreparingAppliance);
        }
        if ([value caseInsensitiveCompare:@"PreparingShipment"] == NSOrderedSame) {
            return @(AWSsnowballJobStatePreparingShipment);
        }
        if ([value caseInsensitiveCompare:@"InTransitToCustomer"] == NSOrderedSame) {
            return @(AWSsnowballJobStateInTransitToCustomer);
        }
        if ([value caseInsensitiveCompare:@"WithCustomer"] == NSOrderedSame) {
            return @(AWSsnowballJobStateWithCustomer);
        }
        if ([value caseInsensitiveCompare:@"InTransitToAWS"] == NSOrderedSame) {
            return @(AWSsnowballJobStateInTransitToAWS);
        }
        if ([value caseInsensitiveCompare:@"WithAWSSortingFacility"] == NSOrderedSame) {
            return @(AWSsnowballJobStateWithAWSSortingFacility);
        }
        if ([value caseInsensitiveCompare:@"WithAWS"] == NSOrderedSame) {
            return @(AWSsnowballJobStateWithAWS);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSsnowballJobStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSsnowballJobStateComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSsnowballJobStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"Listing"] == NSOrderedSame) {
            return @(AWSsnowballJobStateListing);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSsnowballJobStatePending);
        }
        return @(AWSsnowballJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballJobStateNew:
                return @"New";
            case AWSsnowballJobStatePreparingAppliance:
                return @"PreparingAppliance";
            case AWSsnowballJobStatePreparingShipment:
                return @"PreparingShipment";
            case AWSsnowballJobStateInTransitToCustomer:
                return @"InTransitToCustomer";
            case AWSsnowballJobStateWithCustomer:
                return @"WithCustomer";
            case AWSsnowballJobStateInTransitToAWS:
                return @"InTransitToAWS";
            case AWSsnowballJobStateWithAWSSortingFacility:
                return @"WithAWSSortingFacility";
            case AWSsnowballJobStateWithAWS:
                return @"WithAWS";
            case AWSsnowballJobStateInProgress:
                return @"InProgress";
            case AWSsnowballJobStateComplete:
                return @"Complete";
            case AWSsnowballJobStateCancelled:
                return @"Cancelled";
            case AWSsnowballJobStateListing:
                return @"Listing";
            case AWSsnowballJobStatePending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeImport);
        }
        if ([value caseInsensitiveCompare:@"EXPORT"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeExport);
        }
        if ([value caseInsensitiveCompare:@"LOCAL_USE"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeLocalUse);
        }
        return @(AWSsnowballJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballJobTypeImport:
                return @"IMPORT";
            case AWSsnowballJobTypeExport:
                return @"EXPORT";
            case AWSsnowballJobTypeLocalUse:
                return @"LOCAL_USE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdge);
        }
        if ([value caseInsensitiveCompare:@"EDGE_C"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeC);
        }
        if ([value caseInsensitiveCompare:@"EDGE_CG"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeCg);
        }
        if ([value caseInsensitiveCompare:@"EDGE_S"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeS);
        }
        return @(AWSsnowballSnowballTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballSnowballTypeStandard:
                return @"STANDARD";
            case AWSsnowballSnowballTypeEdge:
                return @"EDGE";
            case AWSsnowballSnowballTypeEdgeC:
                return @"EDGE_C";
            case AWSsnowballSnowballTypeEdgeCg:
                return @"EDGE_CG";
            case AWSsnowballSnowballTypeEdgeS:
                return @"EDGE_S";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsnowballJobLogs

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobCompletionReportURI" : @"JobCompletionReportURI",
             @"jobFailureLogURI" : @"JobFailureLogURI",
             @"jobSuccessLogURI" : @"JobSuccessLogURI",
             };
}

@end

@implementation AWSsnowballJobMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addressId" : @"AddressId",
             @"clusterId" : @"ClusterId",
             @"creationDate" : @"CreationDate",
             @"dataTransferProgress" : @"DataTransferProgress",
             @"detail" : @"Description",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballDataTransfer class]];
}

+ (NSValueTransformer *)jobLogInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballJobLogs class]];
}

+ (NSValueTransformer *)jobStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"New"] == NSOrderedSame) {
            return @(AWSsnowballJobStateNew);
        }
        if ([value caseInsensitiveCompare:@"PreparingAppliance"] == NSOrderedSame) {
            return @(AWSsnowballJobStatePreparingAppliance);
        }
        if ([value caseInsensitiveCompare:@"PreparingShipment"] == NSOrderedSame) {
            return @(AWSsnowballJobStatePreparingShipment);
        }
        if ([value caseInsensitiveCompare:@"InTransitToCustomer"] == NSOrderedSame) {
            return @(AWSsnowballJobStateInTransitToCustomer);
        }
        if ([value caseInsensitiveCompare:@"WithCustomer"] == NSOrderedSame) {
            return @(AWSsnowballJobStateWithCustomer);
        }
        if ([value caseInsensitiveCompare:@"InTransitToAWS"] == NSOrderedSame) {
            return @(AWSsnowballJobStateInTransitToAWS);
        }
        if ([value caseInsensitiveCompare:@"WithAWSSortingFacility"] == NSOrderedSame) {
            return @(AWSsnowballJobStateWithAWSSortingFacility);
        }
        if ([value caseInsensitiveCompare:@"WithAWS"] == NSOrderedSame) {
            return @(AWSsnowballJobStateWithAWS);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSsnowballJobStateInProgress);
        }
        if ([value caseInsensitiveCompare:@"Complete"] == NSOrderedSame) {
            return @(AWSsnowballJobStateComplete);
        }
        if ([value caseInsensitiveCompare:@"Cancelled"] == NSOrderedSame) {
            return @(AWSsnowballJobStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"Listing"] == NSOrderedSame) {
            return @(AWSsnowballJobStateListing);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSsnowballJobStatePending);
        }
        return @(AWSsnowballJobStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballJobStateNew:
                return @"New";
            case AWSsnowballJobStatePreparingAppliance:
                return @"PreparingAppliance";
            case AWSsnowballJobStatePreparingShipment:
                return @"PreparingShipment";
            case AWSsnowballJobStateInTransitToCustomer:
                return @"InTransitToCustomer";
            case AWSsnowballJobStateWithCustomer:
                return @"WithCustomer";
            case AWSsnowballJobStateInTransitToAWS:
                return @"InTransitToAWS";
            case AWSsnowballJobStateWithAWSSortingFacility:
                return @"WithAWSSortingFacility";
            case AWSsnowballJobStateWithAWS:
                return @"WithAWS";
            case AWSsnowballJobStateInProgress:
                return @"InProgress";
            case AWSsnowballJobStateComplete:
                return @"Complete";
            case AWSsnowballJobStateCancelled:
                return @"Cancelled";
            case AWSsnowballJobStateListing:
                return @"Listing";
            case AWSsnowballJobStatePending:
                return @"Pending";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)jobTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeImport);
        }
        if ([value caseInsensitiveCompare:@"EXPORT"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeExport);
        }
        if ([value caseInsensitiveCompare:@"LOCAL_USE"] == NSOrderedSame) {
            return @(AWSsnowballJobTypeLocalUse);
        }
        return @(AWSsnowballJobTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballJobTypeImport:
                return @"IMPORT";
            case AWSsnowballJobTypeExport:
                return @"EXPORT";
            case AWSsnowballJobTypeLocalUse:
                return @"LOCAL_USE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballJobResource class]];
}

+ (NSValueTransformer *)shippingDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballShippingDetails class]];
}

+ (NSValueTransformer *)snowballCapacityPreferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"T50"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT50);
        }
        if ([value caseInsensitiveCompare:@"T80"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT80);
        }
        if ([value caseInsensitiveCompare:@"T100"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT100);
        }
        if ([value caseInsensitiveCompare:@"T42"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT42);
        }
        if ([value caseInsensitiveCompare:@"T98"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT98);
        }
        if ([value caseInsensitiveCompare:@"NoPreference"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityNoPreference);
        }
        return @(AWSsnowballSnowballCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballSnowballCapacityT50:
                return @"T50";
            case AWSsnowballSnowballCapacityT80:
                return @"T80";
            case AWSsnowballSnowballCapacityT100:
                return @"T100";
            case AWSsnowballSnowballCapacityT42:
                return @"T42";
            case AWSsnowballSnowballCapacityT98:
                return @"T98";
            case AWSsnowballSnowballCapacityNoPreference:
                return @"NoPreference";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"EDGE"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdge);
        }
        if ([value caseInsensitiveCompare:@"EDGE_C"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeC);
        }
        if ([value caseInsensitiveCompare:@"EDGE_CG"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeCg);
        }
        if ([value caseInsensitiveCompare:@"EDGE_S"] == NSOrderedSame) {
            return @(AWSsnowballSnowballTypeEdgeS);
        }
        return @(AWSsnowballSnowballTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballSnowballTypeStandard:
                return @"STANDARD";
            case AWSsnowballSnowballTypeEdge:
                return @"EDGE";
            case AWSsnowballSnowballTypeEdgeC:
                return @"EDGE_C";
            case AWSsnowballSnowballTypeEdgeCg:
                return @"EDGE_CG";
            case AWSsnowballSnowballTypeEdgeS:
                return @"EDGE_S";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)taxDocumentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballTaxDocuments class]];
}

@end

@implementation AWSsnowballJobResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ec2AmiResources" : @"Ec2AmiResources",
             @"lambdaResources" : @"LambdaResources",
             @"s3Resources" : @"S3Resources",
             };
}

+ (NSValueTransformer *)ec2AmiResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsnowballEc2AmiResource class]];
}

+ (NSValueTransformer *)lambdaResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsnowballLambdaResource class]];
}

+ (NSValueTransformer *)s3ResourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsnowballS3Resource class]];
}

@end

@implementation AWSsnowballKeyRange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"beginMarker" : @"BeginMarker",
             @"endMarker" : @"EndMarker",
             };
}

@end

@implementation AWSsnowballLambdaResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventTriggers" : @"EventTriggers",
             @"lambdaArn" : @"LambdaArn",
             };
}

+ (NSValueTransformer *)eventTriggersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsnowballEventTriggerDefinition class]];
}

@end

@implementation AWSsnowballListClusterJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterId" : @"ClusterId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsnowballListClusterJobsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobListEntries" : @"JobListEntries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobListEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsnowballJobListEntry class]];
}

@end

@implementation AWSsnowballListClustersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsnowballListClustersResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clusterListEntries" : @"ClusterListEntries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)clusterListEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsnowballClusterListEntry class]];
}

@end

@implementation AWSsnowballListCompatibleImagesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsnowballListCompatibleImagesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compatibleImages" : @"CompatibleImages",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)compatibleImagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsnowballCompatibleImage class]];
}

@end

@implementation AWSsnowballListJobsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSsnowballListJobsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobListEntries" : @"JobListEntries",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)jobListEntriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSsnowballJobListEntry class]];
}

@end

@implementation AWSsnowballNotification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobStatesToNotify" : @"JobStatesToNotify",
             @"notifyAll" : @"NotifyAll",
             @"snsTopicARN" : @"SnsTopicARN",
             };
}

@end

@implementation AWSsnowballS3Resource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bucketArn" : @"BucketArn",
             @"keyRange" : @"KeyRange",
             };
}

+ (NSValueTransformer *)keyRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballKeyRange class]];
}

@end

@implementation AWSsnowballShipment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"trackingNumber" : @"TrackingNumber",
             };
}

@end

@implementation AWSsnowballShippingDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inboundShipment" : @"InboundShipment",
             @"outboundShipment" : @"OutboundShipment",
             @"shippingOption" : @"ShippingOption",
             };
}

+ (NSValueTransformer *)inboundShipmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballShipment class]];
}

+ (NSValueTransformer *)outboundShipmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballShipment class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionStandard);
        }
        return @(AWSsnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSsnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSsnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSsnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsnowballTaxDocuments

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"IND" : @"IND",
             };
}

+ (NSValueTransformer *)INDJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballINDTaxDocuments class]];
}

@end

@implementation AWSsnowballUpdateClusterRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballJobResource class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionStandard);
        }
        return @(AWSsnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSsnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSsnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSsnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsnowballUpdateClusterResult

@end

@implementation AWSsnowballUpdateJobRequest

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballNotification class]];
}

+ (NSValueTransformer *)resourcesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSsnowballJobResource class]];
}

+ (NSValueTransformer *)shippingOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SECOND_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionSecondDay);
        }
        if ([value caseInsensitiveCompare:@"NEXT_DAY"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionNextDay);
        }
        if ([value caseInsensitiveCompare:@"EXPRESS"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionExpress);
        }
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSsnowballShippingOptionStandard);
        }
        return @(AWSsnowballShippingOptionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballShippingOptionSecondDay:
                return @"SECOND_DAY";
            case AWSsnowballShippingOptionNextDay:
                return @"NEXT_DAY";
            case AWSsnowballShippingOptionExpress:
                return @"EXPRESS";
            case AWSsnowballShippingOptionStandard:
                return @"STANDARD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)snowballCapacityPreferenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"T50"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT50);
        }
        if ([value caseInsensitiveCompare:@"T80"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT80);
        }
        if ([value caseInsensitiveCompare:@"T100"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT100);
        }
        if ([value caseInsensitiveCompare:@"T42"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT42);
        }
        if ([value caseInsensitiveCompare:@"T98"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityT98);
        }
        if ([value caseInsensitiveCompare:@"NoPreference"] == NSOrderedSame) {
            return @(AWSsnowballSnowballCapacityNoPreference);
        }
        return @(AWSsnowballSnowballCapacityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSsnowballSnowballCapacityT50:
                return @"T50";
            case AWSsnowballSnowballCapacityT80:
                return @"T80";
            case AWSsnowballSnowballCapacityT100:
                return @"T100";
            case AWSsnowballSnowballCapacityT42:
                return @"T42";
            case AWSsnowballSnowballCapacityT98:
                return @"T98";
            case AWSsnowballSnowballCapacityNoPreference:
                return @"NoPreference";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSsnowballUpdateJobResult

@end
