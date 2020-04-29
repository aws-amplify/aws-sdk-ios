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

#import "AWSservicediscoveryModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSservicediscoveryErrorDomain = @"com.amazonaws.AWSservicediscoveryErrorDomain";

@implementation AWSservicediscoveryCreateHttpNamespaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creatorRequestId" : @"CreatorRequestId",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSservicediscoveryCreateHttpNamespaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSservicediscoveryCreatePrivateDnsNamespaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creatorRequestId" : @"CreatorRequestId",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"vpc" : @"Vpc",
             };
}

@end

@implementation AWSservicediscoveryCreatePrivateDnsNamespaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSservicediscoveryCreatePublicDnsNamespaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creatorRequestId" : @"CreatorRequestId",
             @"detail" : @"Description",
             @"name" : @"Name",
             };
}

@end

@implementation AWSservicediscoveryCreatePublicDnsNamespaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSservicediscoveryCreateServiceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creatorRequestId" : @"CreatorRequestId",
             @"detail" : @"Description",
             @"dnsConfig" : @"DnsConfig",
             @"healthCheckConfig" : @"HealthCheckConfig",
             @"healthCheckCustomConfig" : @"HealthCheckCustomConfig",
             @"name" : @"Name",
             @"namespaceId" : @"NamespaceId",
             };
}

+ (NSValueTransformer *)dnsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryDnsConfig class]];
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryHealthCheckConfig class]];
}

+ (NSValueTransformer *)healthCheckCustomConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryHealthCheckCustomConfig class]];
}

@end

@implementation AWSservicediscoveryCreateServiceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"service" : @"Service",
             };
}

+ (NSValueTransformer *)serviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryService class]];
}

@end

@implementation AWSservicediscoveryDeleteNamespaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSservicediscoveryDeleteNamespaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSservicediscoveryDeleteServiceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSservicediscoveryDeleteServiceResponse

@end

@implementation AWSservicediscoveryDeregisterInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"serviceId" : @"ServiceId",
             };
}

@end

@implementation AWSservicediscoveryDeregisterInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSservicediscoveryDiscoverInstancesRequest

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
            return @(AWSservicediscoveryHealthStatusFilterHealthy);
        }
        if ([value caseInsensitiveCompare:@"UNHEALTHY"] == NSOrderedSame) {
            return @(AWSservicediscoveryHealthStatusFilterUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSservicediscoveryHealthStatusFilterAll);
        }
        return @(AWSservicediscoveryHealthStatusFilterUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryHealthStatusFilterHealthy:
                return @"HEALTHY";
            case AWSservicediscoveryHealthStatusFilterUnhealthy:
                return @"UNHEALTHY";
            case AWSservicediscoveryHealthStatusFilterAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryDiscoverInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSservicediscoveryHttpInstanceSummary class]];
}

@end

@implementation AWSservicediscoveryDnsConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsRecords" : @"DnsRecords",
             @"namespaceId" : @"NamespaceId",
             @"routingPolicy" : @"RoutingPolicy",
             };
}

+ (NSValueTransformer *)dnsRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSservicediscoveryDnsRecord class]];
}

+ (NSValueTransformer *)routingPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MULTIVALUE"] == NSOrderedSame) {
            return @(AWSservicediscoveryRoutingPolicyMultivalue);
        }
        if ([value caseInsensitiveCompare:@"WEIGHTED"] == NSOrderedSame) {
            return @(AWSservicediscoveryRoutingPolicyWeighted);
        }
        return @(AWSservicediscoveryRoutingPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryRoutingPolicyMultivalue:
                return @"MULTIVALUE";
            case AWSservicediscoveryRoutingPolicyWeighted:
                return @"WEIGHTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryDnsConfigChange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsRecords" : @"DnsRecords",
             };
}

+ (NSValueTransformer *)dnsRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSservicediscoveryDnsRecord class]];
}

@end

@implementation AWSservicediscoveryDnsProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostedZoneId" : @"HostedZoneId",
             };
}

@end

@implementation AWSservicediscoveryDnsRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"TTL" : @"TTL",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SRV"] == NSOrderedSame) {
            return @(AWSservicediscoveryRecordTypeSrv);
        }
        if ([value caseInsensitiveCompare:@"A"] == NSOrderedSame) {
            return @(AWSservicediscoveryRecordTypeA);
        }
        if ([value caseInsensitiveCompare:@"AAAA"] == NSOrderedSame) {
            return @(AWSservicediscoveryRecordTypeAaaa);
        }
        if ([value caseInsensitiveCompare:@"CNAME"] == NSOrderedSame) {
            return @(AWSservicediscoveryRecordTypeCname);
        }
        return @(AWSservicediscoveryRecordTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryRecordTypeSrv:
                return @"SRV";
            case AWSservicediscoveryRecordTypeA:
                return @"A";
            case AWSservicediscoveryRecordTypeAaaa:
                return @"AAAA";
            case AWSservicediscoveryRecordTypeCname:
                return @"CNAME";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryGetInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"serviceId" : @"ServiceId",
             };
}

@end

@implementation AWSservicediscoveryGetInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instance" : @"Instance",
             };
}

+ (NSValueTransformer *)instanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryInstance class]];
}

@end

@implementation AWSservicediscoveryGetInstancesHealthStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serviceId" : @"ServiceId",
             };
}

@end

@implementation AWSservicediscoveryGetInstancesHealthStatusResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             };
}

@end

@implementation AWSservicediscoveryGetNamespaceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSservicediscoveryGetNamespaceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namespace" : @"Namespace",
             };
}

+ (NSValueTransformer *)namespaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryNamespace class]];
}

@end

@implementation AWSservicediscoveryGetOperationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSservicediscoveryGetOperationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operation" : @"Operation",
             };
}

+ (NSValueTransformer *)operationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryOperation class]];
}

@end

@implementation AWSservicediscoveryGetServiceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSservicediscoveryGetServiceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"service" : @"Service",
             };
}

+ (NSValueTransformer *)serviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryService class]];
}

@end

@implementation AWSservicediscoveryHealthCheckConfig

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
            return @(AWSservicediscoveryHealthCheckTypeHttp);
        }
        if ([value caseInsensitiveCompare:@"HTTPS"] == NSOrderedSame) {
            return @(AWSservicediscoveryHealthCheckTypeHttps);
        }
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSservicediscoveryHealthCheckTypeTcp);
        }
        return @(AWSservicediscoveryHealthCheckTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryHealthCheckTypeHttp:
                return @"HTTP";
            case AWSservicediscoveryHealthCheckTypeHttps:
                return @"HTTPS";
            case AWSservicediscoveryHealthCheckTypeTcp:
                return @"TCP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryHealthCheckCustomConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failureThreshold" : @"FailureThreshold",
             };
}

@end

@implementation AWSservicediscoveryHttpInstanceSummary

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
            return @(AWSservicediscoveryHealthStatusHealthy);
        }
        if ([value caseInsensitiveCompare:@"UNHEALTHY"] == NSOrderedSame) {
            return @(AWSservicediscoveryHealthStatusUnhealthy);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSservicediscoveryHealthStatusUnknown);
        }
        return @(AWSservicediscoveryHealthStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryHealthStatusHealthy:
                return @"HEALTHY";
            case AWSservicediscoveryHealthStatusUnhealthy:
                return @"UNHEALTHY";
            case AWSservicediscoveryHealthStatusUnknown:
                return @"UNKNOWN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryHttpProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"httpName" : @"HttpName",
             };
}

@end

@implementation AWSservicediscoveryInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"creatorRequestId" : @"CreatorRequestId",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSservicediscoveryInstanceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSservicediscoveryListInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"serviceId" : @"ServiceId",
             };
}

@end

@implementation AWSservicediscoveryListInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSservicediscoveryInstanceSummary class]];
}

@end

@implementation AWSservicediscoveryListNamespacesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSservicediscoveryNamespaceFilter class]];
}

@end

@implementation AWSservicediscoveryListNamespacesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"namespaces" : @"Namespaces",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)namespacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSservicediscoveryNamespaceSummary class]];
}

@end

@implementation AWSservicediscoveryListOperationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSservicediscoveryOperationFilter class]];
}

@end

@implementation AWSservicediscoveryListOperationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"operations" : @"Operations",
             };
}

+ (NSValueTransformer *)operationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSservicediscoveryOperationSummary class]];
}

@end

@implementation AWSservicediscoveryListServicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSservicediscoveryServiceFilter class]];
}

@end

@implementation AWSservicediscoveryListServicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"services" : @"Services",
             };
}

+ (NSValueTransformer *)servicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSservicediscoveryServiceSummary class]];
}

@end

@implementation AWSservicediscoveryNamespace

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryNamespaceProperties class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DNS_PUBLIC"] == NSOrderedSame) {
            return @(AWSservicediscoveryNamespaceTypeDnsPublic);
        }
        if ([value caseInsensitiveCompare:@"DNS_PRIVATE"] == NSOrderedSame) {
            return @(AWSservicediscoveryNamespaceTypeDnsPrivate);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSservicediscoveryNamespaceTypeHttp);
        }
        return @(AWSservicediscoveryNamespaceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryNamespaceTypeDnsPublic:
                return @"DNS_PUBLIC";
            case AWSservicediscoveryNamespaceTypeDnsPrivate:
                return @"DNS_PRIVATE";
            case AWSservicediscoveryNamespaceTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryNamespaceFilter

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
            return @(AWSservicediscoveryFilterConditionEQ);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSservicediscoveryFilterConditionIN);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSservicediscoveryFilterConditionBetween);
        }
        return @(AWSservicediscoveryFilterConditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryFilterConditionEQ:
                return @"EQ";
            case AWSservicediscoveryFilterConditionIN:
                return @"IN";
            case AWSservicediscoveryFilterConditionBetween:
                return @"BETWEEN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TYPE"] == NSOrderedSame) {
            return @(AWSservicediscoveryNamespaceFilterNameType);
        }
        return @(AWSservicediscoveryNamespaceFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryNamespaceFilterNameType:
                return @"TYPE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryNamespaceProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dnsProperties" : @"DnsProperties",
             @"httpProperties" : @"HttpProperties",
             };
}

+ (NSValueTransformer *)dnsPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryDnsProperties class]];
}

+ (NSValueTransformer *)httpPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryHttpProperties class]];
}

@end

@implementation AWSservicediscoveryNamespaceSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryNamespaceProperties class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DNS_PUBLIC"] == NSOrderedSame) {
            return @(AWSservicediscoveryNamespaceTypeDnsPublic);
        }
        if ([value caseInsensitiveCompare:@"DNS_PRIVATE"] == NSOrderedSame) {
            return @(AWSservicediscoveryNamespaceTypeDnsPrivate);
        }
        if ([value caseInsensitiveCompare:@"HTTP"] == NSOrderedSame) {
            return @(AWSservicediscoveryNamespaceTypeHttp);
        }
        return @(AWSservicediscoveryNamespaceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryNamespaceTypeDnsPublic:
                return @"DNS_PUBLIC";
            case AWSservicediscoveryNamespaceTypeDnsPrivate:
                return @"DNS_PRIVATE";
            case AWSservicediscoveryNamespaceTypeHttp:
                return @"HTTP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryOperation

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
            return @(AWSservicediscoveryOperationStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAIL"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationStatusFail);
        }
        return @(AWSservicediscoveryOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryOperationStatusSubmitted:
                return @"SUBMITTED";
            case AWSservicediscoveryOperationStatusPending:
                return @"PENDING";
            case AWSservicediscoveryOperationStatusSuccess:
                return @"SUCCESS";
            case AWSservicediscoveryOperationStatusFail:
                return @"FAIL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_NAMESPACE"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationTypeCreateNamespace);
        }
        if ([value caseInsensitiveCompare:@"DELETE_NAMESPACE"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationTypeDeleteNamespace);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_SERVICE"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationTypeUpdateService);
        }
        if ([value caseInsensitiveCompare:@"REGISTER_INSTANCE"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationTypeRegisterInstance);
        }
        if ([value caseInsensitiveCompare:@"DEREGISTER_INSTANCE"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationTypeDeregisterInstance);
        }
        return @(AWSservicediscoveryOperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryOperationTypeCreateNamespace:
                return @"CREATE_NAMESPACE";
            case AWSservicediscoveryOperationTypeDeleteNamespace:
                return @"DELETE_NAMESPACE";
            case AWSservicediscoveryOperationTypeUpdateService:
                return @"UPDATE_SERVICE";
            case AWSservicediscoveryOperationTypeRegisterInstance:
                return @"REGISTER_INSTANCE";
            case AWSservicediscoveryOperationTypeDeregisterInstance:
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

@implementation AWSservicediscoveryOperationFilter

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
            return @(AWSservicediscoveryFilterConditionEQ);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSservicediscoveryFilterConditionIN);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSservicediscoveryFilterConditionBetween);
        }
        return @(AWSservicediscoveryFilterConditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryFilterConditionEQ:
                return @"EQ";
            case AWSservicediscoveryFilterConditionIN:
                return @"IN";
            case AWSservicediscoveryFilterConditionBetween:
                return @"BETWEEN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAMESPACE_ID"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationFilterNameNamespaceId);
        }
        if ([value caseInsensitiveCompare:@"SERVICE_ID"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationFilterNameServiceId);
        }
        if ([value caseInsensitiveCompare:@"STATUS"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationFilterNameStatus);
        }
        if ([value caseInsensitiveCompare:@"TYPE"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationFilterNameType);
        }
        if ([value caseInsensitiveCompare:@"UPDATE_DATE"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationFilterNameUpdateDate);
        }
        return @(AWSservicediscoveryOperationFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryOperationFilterNameNamespaceId:
                return @"NAMESPACE_ID";
            case AWSservicediscoveryOperationFilterNameServiceId:
                return @"SERVICE_ID";
            case AWSservicediscoveryOperationFilterNameStatus:
                return @"STATUS";
            case AWSservicediscoveryOperationFilterNameType:
                return @"TYPE";
            case AWSservicediscoveryOperationFilterNameUpdateDate:
                return @"UPDATE_DATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryOperationSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUBMITTED"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationStatusSubmitted);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationStatusPending);
        }
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationStatusSuccess);
        }
        if ([value caseInsensitiveCompare:@"FAIL"] == NSOrderedSame) {
            return @(AWSservicediscoveryOperationStatusFail);
        }
        return @(AWSservicediscoveryOperationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryOperationStatusSubmitted:
                return @"SUBMITTED";
            case AWSservicediscoveryOperationStatusPending:
                return @"PENDING";
            case AWSservicediscoveryOperationStatusSuccess:
                return @"SUCCESS";
            case AWSservicediscoveryOperationStatusFail:
                return @"FAIL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryRegisterInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"creatorRequestId" : @"CreatorRequestId",
             @"instanceId" : @"InstanceId",
             @"serviceId" : @"ServiceId",
             };
}

@end

@implementation AWSservicediscoveryRegisterInstanceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end

@implementation AWSservicediscoveryService

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryDnsConfig class]];
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryHealthCheckConfig class]];
}

+ (NSValueTransformer *)healthCheckCustomConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryHealthCheckCustomConfig class]];
}

@end

@implementation AWSservicediscoveryServiceChange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"dnsConfig" : @"DnsConfig",
             @"healthCheckConfig" : @"HealthCheckConfig",
             };
}

+ (NSValueTransformer *)dnsConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryDnsConfigChange class]];
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryHealthCheckConfig class]];
}

@end

@implementation AWSservicediscoveryServiceFilter

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
            return @(AWSservicediscoveryFilterConditionEQ);
        }
        if ([value caseInsensitiveCompare:@"IN"] == NSOrderedSame) {
            return @(AWSservicediscoveryFilterConditionIN);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSservicediscoveryFilterConditionBetween);
        }
        return @(AWSservicediscoveryFilterConditionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryFilterConditionEQ:
                return @"EQ";
            case AWSservicediscoveryFilterConditionIN:
                return @"IN";
            case AWSservicediscoveryFilterConditionBetween:
                return @"BETWEEN";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NAMESPACE_ID"] == NSOrderedSame) {
            return @(AWSservicediscoveryServiceFilterNameNamespaceId);
        }
        return @(AWSservicediscoveryServiceFilterNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryServiceFilterNameNamespaceId:
                return @"NAMESPACE_ID";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryServiceSummary

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryDnsConfig class]];
}

+ (NSValueTransformer *)healthCheckConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryHealthCheckConfig class]];
}

+ (NSValueTransformer *)healthCheckCustomConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryHealthCheckCustomConfig class]];
}

@end

@implementation AWSservicediscoveryUpdateInstanceCustomHealthStatusRequest

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
            return @(AWSservicediscoveryCustomHealthStatusHealthy);
        }
        if ([value caseInsensitiveCompare:@"UNHEALTHY"] == NSOrderedSame) {
            return @(AWSservicediscoveryCustomHealthStatusUnhealthy);
        }
        return @(AWSservicediscoveryCustomHealthStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSservicediscoveryCustomHealthStatusHealthy:
                return @"HEALTHY";
            case AWSservicediscoveryCustomHealthStatusUnhealthy:
                return @"UNHEALTHY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSservicediscoveryUpdateServiceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"service" : @"Service",
             };
}

+ (NSValueTransformer *)serviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSservicediscoveryServiceChange class]];
}

@end

@implementation AWSservicediscoveryUpdateServiceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"operationId" : @"OperationId",
             };
}

@end
