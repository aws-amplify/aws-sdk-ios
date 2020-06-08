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

#import "AWSServicediscoveryModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSServicediscoveryErrorDomain = @"com.amazonaws.AWSServicediscoveryErrorDomain";

@implementation AWSServicediscoveryCreateHttpNamespaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creatorRequestId" : @"CreatorRequestId",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryTag class]];
}

@end

@implementation AWSServicediscoveryCreateHttpNamespaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSServicediscoveryCreatePrivateDnsNamespaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creatorRequestId" : @"CreatorRequestId",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"tags" : @"Tags",
             @"vpc" : @"Vpc",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryTag class]];
}

@end

@implementation AWSServicediscoveryCreatePrivateDnsNamespaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSServicediscoveryCreatePublicDnsNamespaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creatorRequestId" : @"CreatorRequestId",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryTag class]];
}

@end

@implementation AWSServicediscoveryCreatePublicDnsNamespaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSServicediscoveryCreateServiceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creatorRequestId" : @"CreatorRequestId",
             @"detail" : @"Description",
             @"dnsConfig" : @"DnsConfig",
             @"healthCheckConfig" : @"HealthCheckConfig",
             @"healthCheckCustomConfig" : @"HealthCheckCustomConfig",
             @"name" : @"Name",
             @"namespaceId" : @"NamespaceId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)dnsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryDnsConfig class]];
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryHealthCheckConfig class]];
}

+ (NSValueTransformer *)healthCheckCustomConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryHealthCheckCustomConfig class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryTag class]];
}

@end

@implementation AWSServicediscoveryCreateServiceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"service" : @"Service",
             };
}

+ (NSValueTransformer *)serviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryService class]];
}

@end

@implementation AWSServicediscoveryDeleteNamespaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicediscoveryDeleteNamespaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSServicediscoveryDeleteServiceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicediscoveryDeleteServiceResponse

@end

@implementation AWSServicediscoveryDeregisterInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"serviceId" : @"ServiceId",
             };
}

@end

@implementation AWSServicediscoveryDeregisterInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSServicediscoveryDiscoverInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"healthStatus" : @"HealthStatus",
             @"maxResults" : @"MaxResults",
             @"namespaceName" : @"NamespaceName",
             @"queryParameters" : @"QueryParameters",
             @"serviceName" : @"ServiceName",
             };
}

+ (NSValueTransformer *)healthStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HEALTHY"] == NSOrderedSame) {
            return @(AWSServicediscoveryHealthStatusFilterHealthy);
        }
        if ([value caseInsensitiveCompare:@"UNHEALTHY"] == NSOrderedSame) {
            return @(AWSServicediscoveryHealthStatusFilterUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSServicediscoveryHealthStatusFilterAll);
        }
        return @(AWSServicediscoveryHealthStatusFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryHealthStatusFilterHealthy:
                return @"HEALTHY";
            case AWSServicediscoveryHealthStatusFilterUnhealthy:
                return @"UNHEALTHY";
            case AWSServicediscoveryHealthStatusFilterAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryDiscoverInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryHttpInstanceSummary class]];
}

@end

@implementation AWSServicediscoveryDnsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsRecords" : @"DnsRecords",
             @"namespaceId" : @"NamespaceId",
             @"routingPolicy" : @"RoutingPolicy",
             };
}

+ (NSValueTransformer *)dnsRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryDnsRecord class]];
}

+ (NSValueTransformer *)routingPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTIVALUE"] == NSOrderedSame) {
            return @(AWSServicediscoveryRoutingPolicyMultivalue);
        }
        if ([value caseInsensitiveCompare:@"WEIGHTED"] == NSOrderedSame) {
            return @(AWSServicediscoveryRoutingPolicyWeighted);
        }
        return @(AWSServicediscoveryRoutingPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryRoutingPolicyMultivalue:
                return @"MULTIVALUE";
            case AWSServicediscoveryRoutingPolicyWeighted:
                return @"WEIGHTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryDnsConfigChange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsRecords" : @"DnsRecords",
             };
}

+ (NSValueTransformer *)dnsRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryDnsRecord class]];
}

@end

@implementation AWSServicediscoveryDnsProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             };
}

@end

@implementation AWSServicediscoveryDnsRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"TTL" : @"TTL",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSServicediscoveryRecordTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSServicediscoveryRecordTypeA);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSServicediscoveryRecordTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSServicediscoveryRecordTypeCname);
        }
        return @(AWSServicediscoveryRecordTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryRecordTypeSrv:
                return @"SRV";
            case AWSServicediscoveryRecordTypeA:
                return @"A";
            case AWSServicediscoveryRecordTypeAaaa:
                return @"AAAA";
            case AWSServicediscoveryRecordTypeCname:
                return @"CNAME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryGetInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"serviceId" : @"ServiceId",
             };
}

@end

@implementation AWSServicediscoveryGetInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instance" : @"Instance",
             };
}

+ (NSValueTransformer *)instanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryInstance class]];
}

@end

@implementation AWSServicediscoveryGetInstancesHealthStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serviceId" : @"ServiceId",
             };
}

@end

@implementation AWSServicediscoveryGetInstancesHealthStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             };
}

@end

@implementation AWSServicediscoveryGetNamespaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicediscoveryGetNamespaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namespace" : @"Namespace",
             };
}

+ (NSValueTransformer *)namespaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryNamespace class]];
}

@end

@implementation AWSServicediscoveryGetOperationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSServicediscoveryGetOperationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"Operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryOperation class]];
}

@end

@implementation AWSServicediscoveryGetServiceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicediscoveryGetServiceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"service" : @"Service",
             };
}

+ (NSValueTransformer *)serviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryService class]];
}

@end

@implementation AWSServicediscoveryHealthCheckConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureThreshold" : @"FailureThreshold",
             @"resourcePath" : @"ResourcePath",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSServicediscoveryHealthCheckTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSServicediscoveryHealthCheckTypeHttps);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSServicediscoveryHealthCheckTypeTcp);
        }
        return @(AWSServicediscoveryHealthCheckTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryHealthCheckTypeHttp:
                return @"HTTP";
            case AWSServicediscoveryHealthCheckTypeHttps:
                return @"HTTPS";
            case AWSServicediscoveryHealthCheckTypeTcp:
                return @"TCP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryHealthCheckCustomConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureThreshold" : @"FailureThreshold",
             };
}

@end

@implementation AWSServicediscoveryHttpInstanceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"healthStatus" : @"HealthStatus",
             @"instanceId" : @"InstanceId",
             @"namespaceName" : @"NamespaceName",
             @"serviceName" : @"ServiceName",
             };
}

+ (NSValueTransformer *)healthStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HEALTHY"] == NSOrderedSame) {
            return @(AWSServicediscoveryHealthStatusHealthy);
        }
        if ([value caseInsensitiveCompare:@"UNHEALTHY"] == NSOrderedSame) {
            return @(AWSServicediscoveryHealthStatusUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSServicediscoveryHealthStatusUnknown);
        }
        return @(AWSServicediscoveryHealthStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryHealthStatusHealthy:
                return @"HEALTHY";
            case AWSServicediscoveryHealthStatusUnhealthy:
                return @"UNHEALTHY";
            case AWSServicediscoveryHealthStatusUnknown:
                return @"UNKNOWN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryHttpProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"httpName" : @"HttpName",
             };
}

@end

@implementation AWSServicediscoveryInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"creatorRequestId" : @"CreatorRequestId",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicediscoveryInstanceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicediscoveryListInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serviceId" : @"ServiceId",
             };
}

@end

@implementation AWSServicediscoveryListInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryInstanceSummary class]];
}

@end

@implementation AWSServicediscoveryListNamespacesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryNamespaceFilter class]];
}

@end

@implementation AWSServicediscoveryListNamespacesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namespaces" : @"Namespaces",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)namespacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryNamespaceSummary class]];
}

@end

@implementation AWSServicediscoveryListOperationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryOperationFilter class]];
}

@end

@implementation AWSServicediscoveryListOperationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"operations" : @"Operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryOperationSummary class]];
}

@end

@implementation AWSServicediscoveryListServicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryServiceFilter class]];
}

@end

@implementation AWSServicediscoveryListServicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"services" : @"Services",
             };
}

+ (NSValueTransformer *)servicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryServiceSummary class]];
}

@end

@implementation AWSServicediscoveryListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSServicediscoveryListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryTag class]];
}

@end

@implementation AWSServicediscoveryNamespace

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createDate" : @"CreateDate",
             @"creatorRequestId" : @"CreatorRequestId",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"properties" : @"Properties",
             @"serviceCount" : @"ServiceCount",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)propertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryNamespaceProperties class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DNS_PUBLIC"] == NSOrderedSame) {
            return @(AWSServicediscoveryNamespaceTypeDnsPublic);
        }
        if ([value caseInsensitiveCompare:@"DNS_PRIVATE"] == NSOrderedSame) {
            return @(AWSServicediscoveryNamespaceTypeDnsPrivate);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSServicediscoveryNamespaceTypeHttp);
        }
        return @(AWSServicediscoveryNamespaceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryNamespaceTypeDnsPublic:
                return @"DNS_PUBLIC";
            case AWSServicediscoveryNamespaceTypeDnsPrivate:
                return @"DNS_PRIVATE";
            case AWSServicediscoveryNamespaceTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryNamespaceFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"condition" : @"Condition",
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)conditionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQ"] == NSOrderedSame) {
            return @(AWSServicediscoveryFilterConditionEQ);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSServicediscoveryFilterConditionIN);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSServicediscoveryFilterConditionBetween);
        }
        return @(AWSServicediscoveryFilterConditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryFilterConditionEQ:
                return @"EQ";
            case AWSServicediscoveryFilterConditionIN:
                return @"IN";
            case AWSServicediscoveryFilterConditionBetween:
                return @"BETWEEN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TYPE"] == NSOrderedSame) {
            return @(AWSServicediscoveryNamespaceFilterNameType);
        }
        return @(AWSServicediscoveryNamespaceFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryNamespaceFilterNameType:
                return @"TYPE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryNamespaceProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsProperties" : @"DnsProperties",
             @"httpProperties" : @"HttpProperties",
             };
}

+ (NSValueTransformer *)dnsPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryDnsProperties class]];
}

+ (NSValueTransformer *)httpPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryHttpProperties class]];
}

@end

@implementation AWSServicediscoveryNamespaceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createDate" : @"CreateDate",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"properties" : @"Properties",
             @"serviceCount" : @"ServiceCount",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)propertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryNamespaceProperties class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DNS_PUBLIC"] == NSOrderedSame) {
            return @(AWSServicediscoveryNamespaceTypeDnsPublic);
        }
        if ([value caseInsensitiveCompare:@"DNS_PRIVATE"] == NSOrderedSame) {
            return @(AWSServicediscoveryNamespaceTypeDnsPrivate);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSServicediscoveryNamespaceTypeHttp);
        }
        return @(AWSServicediscoveryNamespaceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryNamespaceTypeDnsPublic:
                return @"DNS_PUBLIC";
            case AWSServicediscoveryNamespaceTypeDnsPrivate:
                return @"DNS_PRIVATE";
            case AWSServicediscoveryNamespaceTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryOperation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createDate" : @"CreateDate",
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"identifier" : @"Id",
             @"status" : @"Status",
             @"targets" : @"Targets",
             @"types" : @"Type",
             @"updateDate" : @"UpdateDate",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAIL"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationStatusFail);
        }
        return @(AWSServicediscoveryOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryOperationStatusSubmitted:
                return @"SUBMITTED";
            case AWSServicediscoveryOperationStatusPending:
                return @"PENDING";
            case AWSServicediscoveryOperationStatusSuccess:
                return @"SUCCESS";
            case AWSServicediscoveryOperationStatusFail:
                return @"FAIL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_NAMESPACE"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationTypeCreateNamespace);
        }
        if ([value caseInsensitiveCompare:@"DELETE_NAMESPACE"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationTypeDeleteNamespace);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SERVICE"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationTypeUpdateService);
        }
        if ([value caseInsensitiveCompare:@"REGISTER_INSTANCE"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationTypeRegisterInstance);
        }
        if ([value caseInsensitiveCompare:@"DEREGISTER_INSTANCE"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationTypeDeregisterInstance);
        }
        return @(AWSServicediscoveryOperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryOperationTypeCreateNamespace:
                return @"CREATE_NAMESPACE";
            case AWSServicediscoveryOperationTypeDeleteNamespace:
                return @"DELETE_NAMESPACE";
            case AWSServicediscoveryOperationTypeUpdateService:
                return @"UPDATE_SERVICE";
            case AWSServicediscoveryOperationTypeRegisterInstance:
                return @"REGISTER_INSTANCE";
            case AWSServicediscoveryOperationTypeDeregisterInstance:
                return @"DEREGISTER_INSTANCE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSServicediscoveryOperationFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"condition" : @"Condition",
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)conditionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQ"] == NSOrderedSame) {
            return @(AWSServicediscoveryFilterConditionEQ);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSServicediscoveryFilterConditionIN);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSServicediscoveryFilterConditionBetween);
        }
        return @(AWSServicediscoveryFilterConditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryFilterConditionEQ:
                return @"EQ";
            case AWSServicediscoveryFilterConditionIN:
                return @"IN";
            case AWSServicediscoveryFilterConditionBetween:
                return @"BETWEEN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAMESPACE_ID"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationFilterNameNamespaceId);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_ID"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationFilterNameServiceId);
        }
        if ([value caseInsensitiveCompare:@"STATUS"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationFilterNameStatus);
        }
        if ([value caseInsensitiveCompare:@"TYPE"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationFilterNameType);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_DATE"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationFilterNameUpdateDate);
        }
        return @(AWSServicediscoveryOperationFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryOperationFilterNameNamespaceId:
                return @"NAMESPACE_ID";
            case AWSServicediscoveryOperationFilterNameServiceId:
                return @"SERVICE_ID";
            case AWSServicediscoveryOperationFilterNameStatus:
                return @"STATUS";
            case AWSServicediscoveryOperationFilterNameType:
                return @"TYPE";
            case AWSServicediscoveryOperationFilterNameUpdateDate:
                return @"UPDATE_DATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryOperationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAIL"] == NSOrderedSame) {
            return @(AWSServicediscoveryOperationStatusFail);
        }
        return @(AWSServicediscoveryOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryOperationStatusSubmitted:
                return @"SUBMITTED";
            case AWSServicediscoveryOperationStatusPending:
                return @"PENDING";
            case AWSServicediscoveryOperationStatusSuccess:
                return @"SUCCESS";
            case AWSServicediscoveryOperationStatusFail:
                return @"FAIL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryRegisterInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"creatorRequestId" : @"CreatorRequestId",
             @"instanceId" : @"InstanceId",
             @"serviceId" : @"ServiceId",
             };
}

@end

@implementation AWSServicediscoveryRegisterInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSServicediscoveryService

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createDate" : @"CreateDate",
             @"creatorRequestId" : @"CreatorRequestId",
             @"detail" : @"Description",
             @"dnsConfig" : @"DnsConfig",
             @"healthCheckConfig" : @"HealthCheckConfig",
             @"healthCheckCustomConfig" : @"HealthCheckCustomConfig",
             @"identifier" : @"Id",
             @"instanceCount" : @"InstanceCount",
             @"name" : @"Name",
             @"namespaceId" : @"NamespaceId",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dnsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryDnsConfig class]];
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryHealthCheckConfig class]];
}

+ (NSValueTransformer *)healthCheckCustomConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryHealthCheckCustomConfig class]];
}

@end

@implementation AWSServicediscoveryServiceChange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"dnsConfig" : @"DnsConfig",
             @"healthCheckConfig" : @"HealthCheckConfig",
             };
}

+ (NSValueTransformer *)dnsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryDnsConfigChange class]];
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryHealthCheckConfig class]];
}

@end

@implementation AWSServicediscoveryServiceFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"condition" : @"Condition",
             @"name" : @"Name",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)conditionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQ"] == NSOrderedSame) {
            return @(AWSServicediscoveryFilterConditionEQ);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSServicediscoveryFilterConditionIN);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSServicediscoveryFilterConditionBetween);
        }
        return @(AWSServicediscoveryFilterConditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryFilterConditionEQ:
                return @"EQ";
            case AWSServicediscoveryFilterConditionIN:
                return @"IN";
            case AWSServicediscoveryFilterConditionBetween:
                return @"BETWEEN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAMESPACE_ID"] == NSOrderedSame) {
            return @(AWSServicediscoveryServiceFilterNameNamespaceId);
        }
        return @(AWSServicediscoveryServiceFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryServiceFilterNameNamespaceId:
                return @"NAMESPACE_ID";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryServiceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createDate" : @"CreateDate",
             @"detail" : @"Description",
             @"dnsConfig" : @"DnsConfig",
             @"healthCheckConfig" : @"HealthCheckConfig",
             @"healthCheckCustomConfig" : @"HealthCheckCustomConfig",
             @"identifier" : @"Id",
             @"instanceCount" : @"InstanceCount",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)dnsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryDnsConfig class]];
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryHealthCheckConfig class]];
}

+ (NSValueTransformer *)healthCheckCustomConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryHealthCheckCustomConfig class]];
}

@end

@implementation AWSServicediscoveryTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicediscoveryTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicediscoveryTag class]];
}

@end

@implementation AWSServicediscoveryTagResourceResponse

@end

@implementation AWSServicediscoveryUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSServicediscoveryUntagResourceResponse

@end

@implementation AWSServicediscoveryUpdateInstanceCustomHealthStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"serviceId" : @"ServiceId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HEALTHY"] == NSOrderedSame) {
            return @(AWSServicediscoveryCustomHealthStatusHealthy);
        }
        if ([value caseInsensitiveCompare:@"UNHEALTHY"] == NSOrderedSame) {
            return @(AWSServicediscoveryCustomHealthStatusUnhealthy);
        }
        return @(AWSServicediscoveryCustomHealthStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicediscoveryCustomHealthStatusHealthy:
                return @"HEALTHY";
            case AWSServicediscoveryCustomHealthStatusUnhealthy:
                return @"UNHEALTHY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicediscoveryUpdateServiceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"service" : @"Service",
             };
}

+ (NSValueTransformer *)serviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicediscoveryServiceChange class]];
}

@end

@implementation AWSServicediscoveryUpdateServiceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end
