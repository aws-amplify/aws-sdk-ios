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

#import "AWSServicecatalogModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSServicecatalogErrorDomain = @"com.amazonaws.AWSServicecatalogErrorDomain";

@implementation AWSServicecatalogAcceptPortfolioShareInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"portfolioId" : @"PortfolioId",
             @"portfolioShareType" : @"PortfolioShareType",
             };
}

+ (NSValueTransformer *)portfolioShareTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORTED"] == NSOrderedSame) {
            return @(AWSServicecatalogPortfolioShareTypeImported);
        }
        if ([value caseInsensitiveCompare:@"AWS_SERVICECATALOG"] == NSOrderedSame) {
            return @(AWSServicecatalogPortfolioShareTypeAwsServicecatalog);
        }
        if ([value caseInsensitiveCompare:@"AWS_ORGANIZATIONS"] == NSOrderedSame) {
            return @(AWSServicecatalogPortfolioShareTypeAwsOrganizations);
        }
        return @(AWSServicecatalogPortfolioShareTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogPortfolioShareTypeImported:
                return @"IMPORTED";
            case AWSServicecatalogPortfolioShareTypeAwsServicecatalog:
                return @"AWS_SERVICECATALOG";
            case AWSServicecatalogPortfolioShareTypeAwsOrganizations:
                return @"AWS_ORGANIZATIONS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogAcceptPortfolioShareOutput

@end

@implementation AWSServicecatalogAccessLevelFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Account"] == NSOrderedSame) {
            return @(AWSServicecatalogAccessLevelFilterKeyAccount);
        }
        if ([value caseInsensitiveCompare:@"Role"] == NSOrderedSame) {
            return @(AWSServicecatalogAccessLevelFilterKeyRole);
        }
        if ([value caseInsensitiveCompare:@"User"] == NSOrderedSame) {
            return @(AWSServicecatalogAccessLevelFilterKeyUser);
        }
        return @(AWSServicecatalogAccessLevelFilterKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogAccessLevelFilterKeyAccount:
                return @"Account";
            case AWSServicecatalogAccessLevelFilterKeyRole:
                return @"Role";
            case AWSServicecatalogAccessLevelFilterKeyUser:
                return @"User";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogAssociateBudgetWithResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"budgetName" : @"BudgetName",
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSServicecatalogAssociateBudgetWithResourceOutput

@end

@implementation AWSServicecatalogAssociatePrincipalWithPortfolioInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"portfolioId" : @"PortfolioId",
             @"principalARN" : @"PrincipalARN",
             @"principalType" : @"PrincipalType",
             };
}

+ (NSValueTransformer *)principalTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSServicecatalogPrincipalTypeIam);
        }
        return @(AWSServicecatalogPrincipalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogPrincipalTypeIam:
                return @"IAM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogAssociatePrincipalWithPortfolioOutput

@end

@implementation AWSServicecatalogAssociateProductWithPortfolioInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"portfolioId" : @"PortfolioId",
             @"productId" : @"ProductId",
             @"sourcePortfolioId" : @"SourcePortfolioId",
             };
}

@end

@implementation AWSServicecatalogAssociateProductWithPortfolioOutput

@end

@implementation AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"productId" : @"ProductId",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"serviceActionId" : @"ServiceActionId",
             };
}

@end

@implementation AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput

@end

@implementation AWSServicecatalogAssociateTagOptionWithResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"tagOptionId" : @"TagOptionId",
             };
}

@end

@implementation AWSServicecatalogAssociateTagOptionWithResourceOutput

@end

@implementation AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"serviceActionAssociations" : @"ServiceActionAssociations",
             };
}

+ (NSValueTransformer *)serviceActionAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogServiceActionAssociation class]];
}

@end

@implementation AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedServiceActionAssociations" : @"FailedServiceActionAssociations",
             };
}

+ (NSValueTransformer *)failedServiceActionAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogFailedServiceActionAssociation class]];
}

@end

@implementation AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"serviceActionAssociations" : @"ServiceActionAssociations",
             };
}

+ (NSValueTransformer *)serviceActionAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogServiceActionAssociation class]];
}

@end

@implementation AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"failedServiceActionAssociations" : @"FailedServiceActionAssociations",
             };
}

+ (NSValueTransformer *)failedServiceActionAssociationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogFailedServiceActionAssociation class]];
}

@end

@implementation AWSServicecatalogBudgetDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"budgetName" : @"BudgetName",
             };
}

@end

@implementation AWSServicecatalogCloudWatchDashboard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSServicecatalogConstraintDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraintId" : @"ConstraintId",
             @"detail" : @"Description",
             @"owner" : @"Owner",
             @"portfolioId" : @"PortfolioId",
             @"productId" : @"ProductId",
             @"types" : @"Type",
             };
}

@end

@implementation AWSServicecatalogConstraintSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"types" : @"Type",
             };
}

@end

@implementation AWSServicecatalogReplicateProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"replicateOptions" : @"CopyOptions",
             @"idempotencyToken" : @"IdempotencyToken",
             @"sourceProductArn" : @"SourceProductArn",
             @"sourceProvisioningArtifactIdentifiers" : @"SourceProvisioningArtifactIdentifiers",
             @"targetProductId" : @"TargetProductId",
             @"targetProductName" : @"TargetProductName",
             };
}

+ (NSValueTransformer *)sourceProvisioningArtifactIdentifiersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONArray) {
        return [AWSModelUtility mapMTLArrayFromJSONArray:JSONArray withModelClass:[NSString class]];
    } reverseBlock:^id(id mapMTLArray) {
        return [AWSModelUtility JSONArrayFromMapMTLArray:mapMTLArray];
    }];
}

@end

@implementation AWSServicecatalogReplicateProductOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateProductToken" : @"CopyProductToken",
             };
}

@end

@implementation AWSServicecatalogCreateConstraintInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"detail" : @"Description",
             @"idempotencyToken" : @"IdempotencyToken",
             @"parameters" : @"Parameters",
             @"portfolioId" : @"PortfolioId",
             @"productId" : @"ProductId",
             @"types" : @"Type",
             };
}

@end

@implementation AWSServicecatalogCreateConstraintOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraintDetail" : @"ConstraintDetail",
             @"constraintParameters" : @"ConstraintParameters",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)constraintDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogConstraintDetail class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusFailed);
        }
        return @(AWSServicecatalogStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogStatusAvailable:
                return @"AVAILABLE";
            case AWSServicecatalogStatusCreating:
                return @"CREATING";
            case AWSServicecatalogStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogCreatePortfolioInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"idempotencyToken" : @"IdempotencyToken",
             @"providerName" : @"ProviderName",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogCreatePortfolioOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portfolioDetail" : @"PortfolioDetail",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)portfolioDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogPortfolioDetail class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogCreatePortfolioShareInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"accountId" : @"AccountId",
             @"organizationNode" : @"OrganizationNode",
             @"portfolioId" : @"PortfolioId",
             };
}

+ (NSValueTransformer *)organizationNodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogOrganizationNode class]];
}

@end

@implementation AWSServicecatalogCreatePortfolioShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portfolioShareToken" : @"PortfolioShareToken",
             };
}

@end

@implementation AWSServicecatalogCreateProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"detail" : @"Description",
             @"distributor" : @"Distributor",
             @"idempotencyToken" : @"IdempotencyToken",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"productType" : @"ProductType",
             @"provisioningArtifactParameters" : @"ProvisioningArtifactParameters",
             @"supportDescription" : @"SupportDescription",
             @"supportEmail" : @"SupportEmail",
             @"supportUrl" : @"SupportUrl",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)productTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLOUD_FORMATION_TEMPLATE"] == NSOrderedSame) {
            return @(AWSServicecatalogProductTypeCloudFormationTemplate);
        }
        if ([value caseInsensitiveCompare:@"MARKETPLACE"] == NSOrderedSame) {
            return @(AWSServicecatalogProductTypeMarketplace);
        }
        return @(AWSServicecatalogProductTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProductTypeCloudFormationTemplate:
                return @"CLOUD_FORMATION_TEMPLATE";
            case AWSServicecatalogProductTypeMarketplace:
                return @"MARKETPLACE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)provisioningArtifactParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactProperties class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogCreateProductOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productViewDetail" : @"ProductViewDetail",
             @"provisioningArtifactDetail" : @"ProvisioningArtifactDetail",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)productViewDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProductViewDetail class]];
}

+ (NSValueTransformer *)provisioningArtifactDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactDetail class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogCreateProvisionedProductPlanInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"idempotencyToken" : @"IdempotencyToken",
             @"notificationArns" : @"NotificationArns",
             @"pathId" : @"PathId",
             @"planName" : @"PlanName",
             @"planType" : @"PlanType",
             @"productId" : @"ProductId",
             @"provisionedProductName" : @"ProvisionedProductName",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"provisioningParameters" : @"ProvisioningParameters",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)planTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLOUDFORMATION"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductPlanTypeCloudformation);
        }
        return @(AWSServicecatalogProvisionedProductPlanTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisionedProductPlanTypeCloudformation:
                return @"CLOUDFORMATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)provisioningParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogUpdateProvisioningParameter class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogCreateProvisionedProductPlanOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"planId" : @"PlanId",
             @"planName" : @"PlanName",
             @"provisionProductId" : @"ProvisionProductId",
             @"provisionedProductName" : @"ProvisionedProductName",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             };
}

@end

@implementation AWSServicecatalogCreateProvisioningArtifactInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"idempotencyToken" : @"IdempotencyToken",
             @"parameters" : @"Parameters",
             @"productId" : @"ProductId",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactProperties class]];
}

@end

@implementation AWSServicecatalogCreateProvisioningArtifactOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"info" : @"Info",
             @"provisioningArtifactDetail" : @"ProvisioningArtifactDetail",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)provisioningArtifactDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactDetail class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusFailed);
        }
        return @(AWSServicecatalogStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogStatusAvailable:
                return @"AVAILABLE";
            case AWSServicecatalogStatusCreating:
                return @"CREATING";
            case AWSServicecatalogStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogCreateServiceActionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"definition" : @"Definition",
             @"definitionType" : @"DefinitionType",
             @"detail" : @"Description",
             @"idempotencyToken" : @"IdempotencyToken",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)definitionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSM_AUTOMATION"] == NSOrderedSame) {
            return @(AWSServicecatalogServiceActionDefinitionTypeSsmAutomation);
        }
        return @(AWSServicecatalogServiceActionDefinitionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogServiceActionDefinitionTypeSsmAutomation:
                return @"SSM_AUTOMATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogCreateServiceActionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceActionDetail" : @"ServiceActionDetail",
             };
}

+ (NSValueTransformer *)serviceActionDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogServiceActionDetail class]];
}

@end

@implementation AWSServicecatalogCreateTagOptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicecatalogCreateTagOptionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagOptionDetail" : @"TagOptionDetail",
             };
}

+ (NSValueTransformer *)tagOptionDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogTagOptionDetail class]];
}

@end

@implementation AWSServicecatalogDeleteConstraintInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDeleteConstraintOutput

@end

@implementation AWSServicecatalogDeletePortfolioInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDeletePortfolioOutput

@end

@implementation AWSServicecatalogDeletePortfolioShareInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"accountId" : @"AccountId",
             @"organizationNode" : @"OrganizationNode",
             @"portfolioId" : @"PortfolioId",
             };
}

+ (NSValueTransformer *)organizationNodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogOrganizationNode class]];
}

@end

@implementation AWSServicecatalogDeletePortfolioShareOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portfolioShareToken" : @"PortfolioShareToken",
             };
}

@end

@implementation AWSServicecatalogDeleteProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDeleteProductOutput

@end

@implementation AWSServicecatalogDeleteProvisionedProductPlanInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"ignoreErrors" : @"IgnoreErrors",
             @"planId" : @"PlanId",
             };
}

@end

@implementation AWSServicecatalogDeleteProvisionedProductPlanOutput

@end

@implementation AWSServicecatalogDeleteProvisioningArtifactInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"productId" : @"ProductId",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             };
}

@end

@implementation AWSServicecatalogDeleteProvisioningArtifactOutput

@end

@implementation AWSServicecatalogDeleteServiceActionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDeleteServiceActionOutput

@end

@implementation AWSServicecatalogDeleteTagOptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDeleteTagOptionOutput

@end

@implementation AWSServicecatalogDescribeConstraintInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDescribeConstraintOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraintDetail" : @"ConstraintDetail",
             @"constraintParameters" : @"ConstraintParameters",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)constraintDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogConstraintDetail class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusFailed);
        }
        return @(AWSServicecatalogStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogStatusAvailable:
                return @"AVAILABLE";
            case AWSServicecatalogStatusCreating:
                return @"CREATING";
            case AWSServicecatalogStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogDescribeCopyProductStatusInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"replicateProductToken" : @"CopyProductToken",
             };
}

@end

@implementation AWSServicecatalogDescribeCopyProductStatusOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replicateProductStatus" : @"CopyProductStatus",
             @"statusDetail" : @"StatusDetail",
             @"targetProductId" : @"TargetProductId",
             };
}

+ (NSValueTransformer *)replicateProductStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSServicecatalogReplicateProductStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSServicecatalogReplicateProductStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogReplicateProductStatusFailed);
        }
        return @(AWSServicecatalogReplicateProductStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogReplicateProductStatusSucceeded:
                return @"SUCCEEDED";
            case AWSServicecatalogReplicateProductStatusInProgress:
                return @"IN_PROGRESS";
            case AWSServicecatalogReplicateProductStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogDescribePortfolioInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDescribePortfolioOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"budgets" : @"Budgets",
             @"portfolioDetail" : @"PortfolioDetail",
             @"tagOptions" : @"TagOptions",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)budgetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogBudgetDetail class]];
}

+ (NSValueTransformer *)portfolioDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogPortfolioDetail class]];
}

+ (NSValueTransformer *)tagOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTagOptionDetail class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogDescribePortfolioShareStatusInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portfolioShareToken" : @"PortfolioShareToken",
             };
}

@end

@implementation AWSServicecatalogDescribePortfolioShareStatusOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"organizationNodeValue" : @"OrganizationNodeValue",
             @"portfolioId" : @"PortfolioId",
             @"portfolioShareToken" : @"PortfolioShareToken",
             @"shareDetails" : @"ShareDetails",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)shareDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogShareDetails class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NOT_STARTED"] == NSOrderedSame) {
            return @(AWSServicecatalogShareStatusNotStarted);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSServicecatalogShareStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSServicecatalogShareStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED_WITH_ERRORS"] == NSOrderedSame) {
            return @(AWSServicecatalogShareStatusCompletedWithErrors);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSServicecatalogShareStatusError);
        }
        return @(AWSServicecatalogShareStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogShareStatusNotStarted:
                return @"NOT_STARTED";
            case AWSServicecatalogShareStatusInProgress:
                return @"IN_PROGRESS";
            case AWSServicecatalogShareStatusCompleted:
                return @"COMPLETED";
            case AWSServicecatalogShareStatusCompletedWithErrors:
                return @"COMPLETED_WITH_ERRORS";
            case AWSServicecatalogShareStatusError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogDescribeProductAsAdminInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSServicecatalogDescribeProductAsAdminOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"budgets" : @"Budgets",
             @"productViewDetail" : @"ProductViewDetail",
             @"provisioningArtifactSummaries" : @"ProvisioningArtifactSummaries",
             @"tagOptions" : @"TagOptions",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)budgetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogBudgetDetail class]];
}

+ (NSValueTransformer *)productViewDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProductViewDetail class]];
}

+ (NSValueTransformer *)provisioningArtifactSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactSummary class]];
}

+ (NSValueTransformer *)tagOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTagOptionDetail class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogDescribeProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSServicecatalogDescribeProductOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"budgets" : @"Budgets",
             @"launchPaths" : @"LaunchPaths",
             @"productViewSummary" : @"ProductViewSummary",
             @"provisioningArtifacts" : @"ProvisioningArtifacts",
             };
}

+ (NSValueTransformer *)budgetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogBudgetDetail class]];
}

+ (NSValueTransformer *)launchPathsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogLaunchPath class]];
}

+ (NSValueTransformer *)productViewSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProductViewSummary class]];
}

+ (NSValueTransformer *)provisioningArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProvisioningArtifact class]];
}

@end

@implementation AWSServicecatalogDescribeProductViewInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDescribeProductViewOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productViewSummary" : @"ProductViewSummary",
             @"provisioningArtifacts" : @"ProvisioningArtifacts",
             };
}

+ (NSValueTransformer *)productViewSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProductViewSummary class]];
}

+ (NSValueTransformer *)provisioningArtifactsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProvisioningArtifact class]];
}

@end

@implementation AWSServicecatalogDescribeProvisionedProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDescribeProvisionedProductOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchDashboards" : @"CloudWatchDashboards",
             @"provisionedProductDetail" : @"ProvisionedProductDetail",
             };
}

+ (NSValueTransformer *)cloudWatchDashboardsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogCloudWatchDashboard class]];
}

+ (NSValueTransformer *)provisionedProductDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisionedProductDetail class]];
}

@end

@implementation AWSServicecatalogDescribeProvisionedProductPlanInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"planId" : @"PlanId",
             };
}

@end

@implementation AWSServicecatalogDescribeProvisionedProductPlanOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"provisionedProductPlanDetails" : @"ProvisionedProductPlanDetails",
             @"resourceChanges" : @"ResourceChanges",
             };
}

+ (NSValueTransformer *)provisionedProductPlanDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisionedProductPlanDetails class]];
}

+ (NSValueTransformer *)resourceChangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogResourceChange class]];
}

@end

@implementation AWSServicecatalogDescribeProvisioningArtifactInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"productId" : @"ProductId",
             @"productName" : @"ProductName",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"provisioningArtifactName" : @"ProvisioningArtifactName",
             @"verbose" : @"Verbose",
             };
}

@end

@implementation AWSServicecatalogDescribeProvisioningArtifactOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"info" : @"Info",
             @"provisioningArtifactDetail" : @"ProvisioningArtifactDetail",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)provisioningArtifactDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactDetail class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusFailed);
        }
        return @(AWSServicecatalogStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogStatusAvailable:
                return @"AVAILABLE";
            case AWSServicecatalogStatusCreating:
                return @"CREATING";
            case AWSServicecatalogStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogDescribeProvisioningParametersInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pathId" : @"PathId",
             @"productId" : @"ProductId",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             };
}

@end

@implementation AWSServicecatalogDescribeProvisioningParametersOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraintSummaries" : @"ConstraintSummaries",
             @"provisioningArtifactParameters" : @"ProvisioningArtifactParameters",
             @"provisioningArtifactPreferences" : @"ProvisioningArtifactPreferences",
             @"tagOptions" : @"TagOptions",
             @"usageInstructions" : @"UsageInstructions",
             };
}

+ (NSValueTransformer *)constraintSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogConstraintSummary class]];
}

+ (NSValueTransformer *)provisioningArtifactParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactParameter class]];
}

+ (NSValueTransformer *)provisioningArtifactPreferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactPreferences class]];
}

+ (NSValueTransformer *)tagOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTagOptionSummary class]];
}

+ (NSValueTransformer *)usageInstructionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogUsageInstruction class]];
}

@end

@implementation AWSServicecatalogDescribeRecordInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             };
}

@end

@implementation AWSServicecatalogDescribeRecordOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"recordDetail" : @"RecordDetail",
             @"recordOutputs" : @"RecordOutputs",
             };
}

+ (NSValueTransformer *)recordDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogRecordDetail class]];
}

+ (NSValueTransformer *)recordOutputsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogRecordOutput class]];
}

@end

@implementation AWSServicecatalogDescribeServiceActionExecutionParametersInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"provisionedProductId" : @"ProvisionedProductId",
             @"serviceActionId" : @"ServiceActionId",
             };
}

@end

@implementation AWSServicecatalogDescribeServiceActionExecutionParametersOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceActionParameters" : @"ServiceActionParameters",
             };
}

+ (NSValueTransformer *)serviceActionParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogExecutionParameter class]];
}

@end

@implementation AWSServicecatalogDescribeServiceActionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDescribeServiceActionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceActionDetail" : @"ServiceActionDetail",
             };
}

+ (NSValueTransformer *)serviceActionDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogServiceActionDetail class]];
}

@end

@implementation AWSServicecatalogDescribeTagOptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             };
}

@end

@implementation AWSServicecatalogDescribeTagOptionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagOptionDetail" : @"TagOptionDetail",
             };
}

+ (NSValueTransformer *)tagOptionDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogTagOptionDetail class]];
}

@end

@implementation AWSServicecatalogDisableAWSOrganizationsAccessInput

@end

@implementation AWSServicecatalogDisableAWSOrganizationsAccessOutput

@end

@implementation AWSServicecatalogDisassociateBudgetFromResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"budgetName" : @"BudgetName",
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSServicecatalogDisassociateBudgetFromResourceOutput

@end

@implementation AWSServicecatalogDisassociatePrincipalFromPortfolioInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"portfolioId" : @"PortfolioId",
             @"principalARN" : @"PrincipalARN",
             };
}

@end

@implementation AWSServicecatalogDisassociatePrincipalFromPortfolioOutput

@end

@implementation AWSServicecatalogDisassociateProductFromPortfolioInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"portfolioId" : @"PortfolioId",
             @"productId" : @"ProductId",
             };
}

@end

@implementation AWSServicecatalogDisassociateProductFromPortfolioOutput

@end

@implementation AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"productId" : @"ProductId",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"serviceActionId" : @"ServiceActionId",
             };
}

@end

@implementation AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput

@end

@implementation AWSServicecatalogDisassociateTagOptionFromResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceId" : @"ResourceId",
             @"tagOptionId" : @"TagOptionId",
             };
}

@end

@implementation AWSServicecatalogDisassociateTagOptionFromResourceOutput

@end

@implementation AWSServicecatalogEnableAWSOrganizationsAccessInput

@end

@implementation AWSServicecatalogEnableAWSOrganizationsAccessOutput

@end

@implementation AWSServicecatalogExecuteProvisionedProductPlanInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"idempotencyToken" : @"IdempotencyToken",
             @"planId" : @"PlanId",
             };
}

@end

@implementation AWSServicecatalogExecuteProvisionedProductPlanOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recordDetail" : @"RecordDetail",
             };
}

+ (NSValueTransformer *)recordDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogRecordDetail class]];
}

@end

@implementation AWSServicecatalogExecuteProvisionedProductServiceActionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"executeToken" : @"ExecuteToken",
             @"parameters" : @"Parameters",
             @"provisionedProductId" : @"ProvisionedProductId",
             @"serviceActionId" : @"ServiceActionId",
             };
}

@end

@implementation AWSServicecatalogExecuteProvisionedProductServiceActionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recordDetail" : @"RecordDetail",
             };
}

+ (NSValueTransformer *)recordDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogRecordDetail class]];
}

@end

@implementation AWSServicecatalogExecutionParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValues" : @"DefaultValues",
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

@end

@implementation AWSServicecatalogFailedServiceActionAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"productId" : @"ProductId",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"serviceActionId" : @"ServiceActionId",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DUPLICATE_RESOURCE"] == NSOrderedSame) {
            return @(AWSServicecatalogServiceActionAssociationErrorCodeDuplicateResource);
        }
        if ([value caseInsensitiveCompare:@"INTERNAL_FAILURE"] == NSOrderedSame) {
            return @(AWSServicecatalogServiceActionAssociationErrorCodeInternalFailure);
        }
        if ([value caseInsensitiveCompare:@"LIMIT_EXCEEDED"] == NSOrderedSame) {
            return @(AWSServicecatalogServiceActionAssociationErrorCodeLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"RESOURCE_NOT_FOUND"] == NSOrderedSame) {
            return @(AWSServicecatalogServiceActionAssociationErrorCodeResourceNotFound);
        }
        if ([value caseInsensitiveCompare:@"THROTTLING"] == NSOrderedSame) {
            return @(AWSServicecatalogServiceActionAssociationErrorCodeThrottling);
        }
        return @(AWSServicecatalogServiceActionAssociationErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogServiceActionAssociationErrorCodeDuplicateResource:
                return @"DUPLICATE_RESOURCE";
            case AWSServicecatalogServiceActionAssociationErrorCodeInternalFailure:
                return @"INTERNAL_FAILURE";
            case AWSServicecatalogServiceActionAssociationErrorCodeLimitExceeded:
                return @"LIMIT_EXCEEDED";
            case AWSServicecatalogServiceActionAssociationErrorCodeResourceNotFound:
                return @"RESOURCE_NOT_FOUND";
            case AWSServicecatalogServiceActionAssociationErrorCodeThrottling:
                return @"THROTTLING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogGetAWSOrganizationsAccessStatusInput

@end

@implementation AWSServicecatalogGetAWSOrganizationsAccessStatusOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessStatus" : @"AccessStatus",
             };
}

+ (NSValueTransformer *)accessStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSServicecatalogAccessStatusEnabled);
        }
        if ([value caseInsensitiveCompare:@"UNDER_CHANGE"] == NSOrderedSame) {
            return @(AWSServicecatalogAccessStatusUnderChange);
        }
        if ([value caseInsensitiveCompare:@"DISABLED"] == NSOrderedSame) {
            return @(AWSServicecatalogAccessStatusDisabled);
        }
        return @(AWSServicecatalogAccessStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogAccessStatusEnabled:
                return @"ENABLED";
            case AWSServicecatalogAccessStatusUnderChange:
                return @"UNDER_CHANGE";
            case AWSServicecatalogAccessStatusDisabled:
                return @"DISABLED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogLaunchPath

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSServicecatalogLaunchPathSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraintSummaries" : @"ConstraintSummaries",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)constraintSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogConstraintSummary class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogListAcceptedPortfolioSharesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"portfolioShareType" : @"PortfolioShareType",
             };
}

+ (NSValueTransformer *)portfolioShareTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORTED"] == NSOrderedSame) {
            return @(AWSServicecatalogPortfolioShareTypeImported);
        }
        if ([value caseInsensitiveCompare:@"AWS_SERVICECATALOG"] == NSOrderedSame) {
            return @(AWSServicecatalogPortfolioShareTypeAwsServicecatalog);
        }
        if ([value caseInsensitiveCompare:@"AWS_ORGANIZATIONS"] == NSOrderedSame) {
            return @(AWSServicecatalogPortfolioShareTypeAwsOrganizations);
        }
        return @(AWSServicecatalogPortfolioShareTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogPortfolioShareTypeImported:
                return @"IMPORTED";
            case AWSServicecatalogPortfolioShareTypeAwsServicecatalog:
                return @"AWS_SERVICECATALOG";
            case AWSServicecatalogPortfolioShareTypeAwsOrganizations:
                return @"AWS_ORGANIZATIONS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogListAcceptedPortfolioSharesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"portfolioDetails" : @"PortfolioDetails",
             };
}

+ (NSValueTransformer *)portfolioDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogPortfolioDetail class]];
}

@end

@implementation AWSServicecatalogListBudgetsForResourceInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"resourceId" : @"ResourceId",
             };
}

@end

@implementation AWSServicecatalogListBudgetsForResourceOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"budgets" : @"Budgets",
             @"nextPageToken" : @"NextPageToken",
             };
}

+ (NSValueTransformer *)budgetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogBudgetDetail class]];
}

@end

@implementation AWSServicecatalogListConstraintsForPortfolioInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"portfolioId" : @"PortfolioId",
             @"productId" : @"ProductId",
             };
}

@end

@implementation AWSServicecatalogListConstraintsForPortfolioOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraintDetails" : @"ConstraintDetails",
             @"nextPageToken" : @"NextPageToken",
             };
}

+ (NSValueTransformer *)constraintDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogConstraintDetail class]];
}

@end

@implementation AWSServicecatalogListLaunchPathsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"productId" : @"ProductId",
             };
}

@end

@implementation AWSServicecatalogListLaunchPathsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"launchPathSummaries" : @"LaunchPathSummaries",
             @"nextPageToken" : @"NextPageToken",
             };
}

+ (NSValueTransformer *)launchPathSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogLaunchPathSummary class]];
}

@end

@implementation AWSServicecatalogListOrganizationPortfolioAccessInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"organizationNodeType" : @"OrganizationNodeType",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"portfolioId" : @"PortfolioId",
             };
}

+ (NSValueTransformer *)organizationNodeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ORGANIZATION"] == NSOrderedSame) {
            return @(AWSServicecatalogOrganizationNodeTypeOrganization);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATIONAL_UNIT"] == NSOrderedSame) {
            return @(AWSServicecatalogOrganizationNodeTypeOrganizationalUnit);
        }
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSServicecatalogOrganizationNodeTypeAccount);
        }
        return @(AWSServicecatalogOrganizationNodeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogOrganizationNodeTypeOrganization:
                return @"ORGANIZATION";
            case AWSServicecatalogOrganizationNodeTypeOrganizationalUnit:
                return @"ORGANIZATIONAL_UNIT";
            case AWSServicecatalogOrganizationNodeTypeAccount:
                return @"ACCOUNT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogListOrganizationPortfolioAccessOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"organizationNodes" : @"OrganizationNodes",
             };
}

+ (NSValueTransformer *)organizationNodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogOrganizationNode class]];
}

@end

@implementation AWSServicecatalogListPortfolioAccessInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"organizationParentId" : @"OrganizationParentId",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"portfolioId" : @"PortfolioId",
             };
}

@end

@implementation AWSServicecatalogListPortfolioAccessOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountIds" : @"AccountIds",
             @"nextPageToken" : @"NextPageToken",
             };
}

@end

@implementation AWSServicecatalogListPortfoliosForProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"productId" : @"ProductId",
             };
}

@end

@implementation AWSServicecatalogListPortfoliosForProductOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"portfolioDetails" : @"PortfolioDetails",
             };
}

+ (NSValueTransformer *)portfolioDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogPortfolioDetail class]];
}

@end

@implementation AWSServicecatalogListPortfoliosInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             };
}

@end

@implementation AWSServicecatalogListPortfoliosOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"portfolioDetails" : @"PortfolioDetails",
             };
}

+ (NSValueTransformer *)portfolioDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogPortfolioDetail class]];
}

@end

@implementation AWSServicecatalogListPrincipalsForPortfolioInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"portfolioId" : @"PortfolioId",
             };
}

@end

@implementation AWSServicecatalogListPrincipalsForPortfolioOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"principals" : @"Principals",
             };
}

+ (NSValueTransformer *)principalsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogPrincipal class]];
}

@end

@implementation AWSServicecatalogListProvisionedProductPlansInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"accessLevelFilter" : @"AccessLevelFilter",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"provisionProductId" : @"ProvisionProductId",
             };
}

+ (NSValueTransformer *)accessLevelFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogAccessLevelFilter class]];
}

@end

@implementation AWSServicecatalogListProvisionedProductPlansOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"provisionedProductPlans" : @"ProvisionedProductPlans",
             };
}

+ (NSValueTransformer *)provisionedProductPlansJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProvisionedProductPlanSummary class]];
}

@end

@implementation AWSServicecatalogListProvisioningArtifactsForServiceActionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"serviceActionId" : @"ServiceActionId",
             };
}

@end

@implementation AWSServicecatalogListProvisioningArtifactsForServiceActionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"provisioningArtifactViews" : @"ProvisioningArtifactViews",
             };
}

+ (NSValueTransformer *)provisioningArtifactViewsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactView class]];
}

@end

@implementation AWSServicecatalogListProvisioningArtifactsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"productId" : @"ProductId",
             };
}

@end

@implementation AWSServicecatalogListProvisioningArtifactsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"provisioningArtifactDetails" : @"ProvisioningArtifactDetails",
             };
}

+ (NSValueTransformer *)provisioningArtifactDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactDetail class]];
}

@end

@implementation AWSServicecatalogListRecordHistoryInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"accessLevelFilter" : @"AccessLevelFilter",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"searchFilter" : @"SearchFilter",
             };
}

+ (NSValueTransformer *)accessLevelFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogAccessLevelFilter class]];
}

+ (NSValueTransformer *)searchFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogListRecordHistorySearchFilter class]];
}

@end

@implementation AWSServicecatalogListRecordHistoryOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"recordDetails" : @"RecordDetails",
             };
}

+ (NSValueTransformer *)recordDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogRecordDetail class]];
}

@end

@implementation AWSServicecatalogListRecordHistorySearchFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicecatalogListResourcesForTagOptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"resourceType" : @"ResourceType",
             @"tagOptionId" : @"TagOptionId",
             };
}

@end

@implementation AWSServicecatalogListResourcesForTagOptionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"PageToken",
             @"resourceDetails" : @"ResourceDetails",
             };
}

+ (NSValueTransformer *)resourceDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogResourceDetail class]];
}

@end

@implementation AWSServicecatalogListServiceActionsForProvisioningArtifactInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"productId" : @"ProductId",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             };
}

@end

@implementation AWSServicecatalogListServiceActionsForProvisioningArtifactOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"serviceActionSummaries" : @"ServiceActionSummaries",
             };
}

+ (NSValueTransformer *)serviceActionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogServiceActionSummary class]];
}

@end

@implementation AWSServicecatalogListServiceActionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             };
}

@end

@implementation AWSServicecatalogListServiceActionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"serviceActionSummaries" : @"ServiceActionSummaries",
             };
}

+ (NSValueTransformer *)serviceActionSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogServiceActionSummary class]];
}

@end

@implementation AWSServicecatalogListStackInstancesForProvisionedProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"provisionedProductId" : @"ProvisionedProductId",
             };
}

@end

@implementation AWSServicecatalogListStackInstancesForProvisionedProductOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"stackInstances" : @"StackInstances",
             };
}

+ (NSValueTransformer *)stackInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogStackInstance class]];
}

@end

@implementation AWSServicecatalogListTagOptionsFilters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"active" : @"Active",
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicecatalogListTagOptionsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filters" : @"Filters",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogListTagOptionsFilters class]];
}

@end

@implementation AWSServicecatalogListTagOptionsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageToken" : @"PageToken",
             @"tagOptionDetails" : @"TagOptionDetails",
             };
}

+ (NSValueTransformer *)tagOptionDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTagOptionDetail class]];
}

@end

@implementation AWSServicecatalogOrganizationNode

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ORGANIZATION"] == NSOrderedSame) {
            return @(AWSServicecatalogOrganizationNodeTypeOrganization);
        }
        if ([value caseInsensitiveCompare:@"ORGANIZATIONAL_UNIT"] == NSOrderedSame) {
            return @(AWSServicecatalogOrganizationNodeTypeOrganizationalUnit);
        }
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSServicecatalogOrganizationNodeTypeAccount);
        }
        return @(AWSServicecatalogOrganizationNodeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogOrganizationNodeTypeOrganization:
                return @"ORGANIZATION";
            case AWSServicecatalogOrganizationNodeTypeOrganizationalUnit:
                return @"ORGANIZATIONAL_UNIT";
            case AWSServicecatalogOrganizationNodeTypeAccount:
                return @"ACCOUNT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogParameterConstraints

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedValues" : @"AllowedValues",
             };
}

@end

@implementation AWSServicecatalogPortfolioDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"createdTime" : @"CreatedTime",
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"identifier" : @"Id",
             @"providerName" : @"ProviderName",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSServicecatalogPrincipal

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"principalARN" : @"PrincipalARN",
             @"principalType" : @"PrincipalType",
             };
}

+ (NSValueTransformer *)principalTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IAM"] == NSOrderedSame) {
            return @(AWSServicecatalogPrincipalTypeIam);
        }
        return @(AWSServicecatalogPrincipalTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogPrincipalTypeIam:
                return @"IAM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogProductViewAggregationValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"approximateCount" : @"ApproximateCount",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicecatalogProductViewDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"CreatedTime",
             @"productARN" : @"ProductARN",
             @"productViewSummary" : @"ProductViewSummary",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)productViewSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProductViewSummary class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusFailed);
        }
        return @(AWSServicecatalogStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogStatusAvailable:
                return @"AVAILABLE";
            case AWSServicecatalogStatusCreating:
                return @"CREATING";
            case AWSServicecatalogStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogProductViewSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"distributor" : @"Distributor",
             @"hasDefaultPath" : @"HasDefaultPath",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"productId" : @"ProductId",
             @"shortDescription" : @"ShortDescription",
             @"supportDescription" : @"SupportDescription",
             @"supportEmail" : @"SupportEmail",
             @"supportUrl" : @"SupportUrl",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLOUD_FORMATION_TEMPLATE"] == NSOrderedSame) {
            return @(AWSServicecatalogProductTypeCloudFormationTemplate);
        }
        if ([value caseInsensitiveCompare:@"MARKETPLACE"] == NSOrderedSame) {
            return @(AWSServicecatalogProductTypeMarketplace);
        }
        return @(AWSServicecatalogProductTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProductTypeCloudFormationTemplate:
                return @"CLOUD_FORMATION_TEMPLATE";
            case AWSServicecatalogProductTypeMarketplace:
                return @"MARKETPLACE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogProvisionProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"notificationArns" : @"NotificationArns",
             @"pathId" : @"PathId",
             @"productId" : @"ProductId",
             @"provisionToken" : @"ProvisionToken",
             @"provisionedProductName" : @"ProvisionedProductName",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"provisioningParameters" : @"ProvisioningParameters",
             @"provisioningPreferences" : @"ProvisioningPreferences",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)provisioningParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProvisioningParameter class]];
}

+ (NSValueTransformer *)provisioningPreferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisioningPreferences class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogProvisionProductOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recordDetail" : @"RecordDetail",
             };
}

+ (NSValueTransformer *)recordDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogRecordDetail class]];
}

@end

@implementation AWSServicecatalogProvisionedProductAttribute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"identifier" : @"Id",
             @"idempotencyToken" : @"IdempotencyToken",
             @"lastRecordId" : @"LastRecordId",
             @"name" : @"Name",
             @"physicalId" : @"PhysicalId",
             @"productId" : @"ProductId",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"tags" : @"Tags",
             @"types" : @"Type",
             @"userArn" : @"UserArn",
             @"userArnSession" : @"UserArnSession",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"UNDER_CHANGE"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductStatusUnderChange);
        }
        if ([value caseInsensitiveCompare:@"TAINTED"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductStatusTainted);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductStatusError);
        }
        if ([value caseInsensitiveCompare:@"PLAN_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductStatusPlanInProgress);
        }
        return @(AWSServicecatalogProvisionedProductStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisionedProductStatusAvailable:
                return @"AVAILABLE";
            case AWSServicecatalogProvisionedProductStatusUnderChange:
                return @"UNDER_CHANGE";
            case AWSServicecatalogProvisionedProductStatusTainted:
                return @"TAINTED";
            case AWSServicecatalogProvisionedProductStatusError:
                return @"ERROR";
            case AWSServicecatalogProvisionedProductStatusPlanInProgress:
                return @"PLAN_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogProvisionedProductDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"createdTime" : @"CreatedTime",
             @"identifier" : @"Id",
             @"idempotencyToken" : @"IdempotencyToken",
             @"lastRecordId" : @"LastRecordId",
             @"name" : @"Name",
             @"productId" : @"ProductId",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"UNDER_CHANGE"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductStatusUnderChange);
        }
        if ([value caseInsensitiveCompare:@"TAINTED"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductStatusTainted);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductStatusError);
        }
        if ([value caseInsensitiveCompare:@"PLAN_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductStatusPlanInProgress);
        }
        return @(AWSServicecatalogProvisionedProductStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisionedProductStatusAvailable:
                return @"AVAILABLE";
            case AWSServicecatalogProvisionedProductStatusUnderChange:
                return @"UNDER_CHANGE";
            case AWSServicecatalogProvisionedProductStatusTainted:
                return @"TAINTED";
            case AWSServicecatalogProvisionedProductStatusError:
                return @"ERROR";
            case AWSServicecatalogProvisionedProductStatusPlanInProgress:
                return @"PLAN_IN_PROGRESS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogProvisionedProductPlanDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"CreatedTime",
             @"notificationArns" : @"NotificationArns",
             @"pathId" : @"PathId",
             @"planId" : @"PlanId",
             @"planName" : @"PlanName",
             @"planType" : @"PlanType",
             @"productId" : @"ProductId",
             @"provisionProductId" : @"ProvisionProductId",
             @"provisionProductName" : @"ProvisionProductName",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"provisioningParameters" : @"ProvisioningParameters",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"tags" : @"Tags",
             @"updatedTime" : @"UpdatedTime",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)planTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLOUDFORMATION"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductPlanTypeCloudformation);
        }
        return @(AWSServicecatalogProvisionedProductPlanTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisionedProductPlanTypeCloudformation:
                return @"CLOUDFORMATION";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)provisioningParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogUpdateProvisioningParameter class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductPlanStatusCreateInProgress);
        }
        if ([value caseInsensitiveCompare:@"CREATE_SUCCESS"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductPlanStatusCreateSuccess);
        }
        if ([value caseInsensitiveCompare:@"CREATE_FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductPlanStatusCreateFailed);
        }
        if ([value caseInsensitiveCompare:@"EXECUTE_IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductPlanStatusExecuteInProgress);
        }
        if ([value caseInsensitiveCompare:@"EXECUTE_SUCCESS"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductPlanStatusExecuteSuccess);
        }
        if ([value caseInsensitiveCompare:@"EXECUTE_FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductPlanStatusExecuteFailed);
        }
        return @(AWSServicecatalogProvisionedProductPlanStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisionedProductPlanStatusCreateInProgress:
                return @"CREATE_IN_PROGRESS";
            case AWSServicecatalogProvisionedProductPlanStatusCreateSuccess:
                return @"CREATE_SUCCESS";
            case AWSServicecatalogProvisionedProductPlanStatusCreateFailed:
                return @"CREATE_FAILED";
            case AWSServicecatalogProvisionedProductPlanStatusExecuteInProgress:
                return @"EXECUTE_IN_PROGRESS";
            case AWSServicecatalogProvisionedProductPlanStatusExecuteSuccess:
                return @"EXECUTE_SUCCESS";
            case AWSServicecatalogProvisionedProductPlanStatusExecuteFailed:
                return @"EXECUTE_FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

+ (NSValueTransformer *)updatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSServicecatalogProvisionedProductPlanSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"planId" : @"PlanId",
             @"planName" : @"PlanName",
             @"planType" : @"PlanType",
             @"provisionProductId" : @"ProvisionProductId",
             @"provisionProductName" : @"ProvisionProductName",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             };
}

+ (NSValueTransformer *)planTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLOUDFORMATION"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisionedProductPlanTypeCloudformation);
        }
        return @(AWSServicecatalogProvisionedProductPlanTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisionedProductPlanTypeCloudformation:
                return @"CLOUDFORMATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogProvisioningArtifact

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"CreatedTime",
             @"detail" : @"Description",
             @"guidance" : @"Guidance",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)guidanceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactGuidanceDefault);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactGuidanceDeprecated);
        }
        return @(AWSServicecatalogProvisioningArtifactGuidanceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisioningArtifactGuidanceDefault:
                return @"DEFAULT";
            case AWSServicecatalogProvisioningArtifactGuidanceDeprecated:
                return @"DEPRECATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogProvisioningArtifactDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"active" : @"Active",
             @"createdTime" : @"CreatedTime",
             @"detail" : @"Description",
             @"guidance" : @"Guidance",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)guidanceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactGuidanceDefault);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactGuidanceDeprecated);
        }
        return @(AWSServicecatalogProvisioningArtifactGuidanceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisioningArtifactGuidanceDefault:
                return @"DEFAULT";
            case AWSServicecatalogProvisioningArtifactGuidanceDeprecated:
                return @"DEPRECATED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLOUD_FORMATION_TEMPLATE"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactTypeCloudFormationTemplate);
        }
        if ([value caseInsensitiveCompare:@"MARKETPLACE_AMI"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactTypeMarketplaceAmi);
        }
        if ([value caseInsensitiveCompare:@"MARKETPLACE_CAR"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactTypeMarketplaceCar);
        }
        return @(AWSServicecatalogProvisioningArtifactTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisioningArtifactTypeCloudFormationTemplate:
                return @"CLOUD_FORMATION_TEMPLATE";
            case AWSServicecatalogProvisioningArtifactTypeMarketplaceAmi:
                return @"MARKETPLACE_AMI";
            case AWSServicecatalogProvisioningArtifactTypeMarketplaceCar:
                return @"MARKETPLACE_CAR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogProvisioningArtifactParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultValue" : @"DefaultValue",
             @"detail" : @"Description",
             @"isNoEcho" : @"IsNoEcho",
             @"parameterConstraints" : @"ParameterConstraints",
             @"parameterKey" : @"ParameterKey",
             @"parameterType" : @"ParameterType",
             };
}

+ (NSValueTransformer *)parameterConstraintsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogParameterConstraints class]];
}

@end

@implementation AWSServicecatalogProvisioningArtifactPreferences

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackSetAccounts" : @"StackSetAccounts",
             @"stackSetRegions" : @"StackSetRegions",
             };
}

@end

@implementation AWSServicecatalogProvisioningArtifactProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"disableTemplateValidation" : @"DisableTemplateValidation",
             @"info" : @"Info",
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CLOUD_FORMATION_TEMPLATE"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactTypeCloudFormationTemplate);
        }
        if ([value caseInsensitiveCompare:@"MARKETPLACE_AMI"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactTypeMarketplaceAmi);
        }
        if ([value caseInsensitiveCompare:@"MARKETPLACE_CAR"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactTypeMarketplaceCar);
        }
        return @(AWSServicecatalogProvisioningArtifactTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisioningArtifactTypeCloudFormationTemplate:
                return @"CLOUD_FORMATION_TEMPLATE";
            case AWSServicecatalogProvisioningArtifactTypeMarketplaceAmi:
                return @"MARKETPLACE_AMI";
            case AWSServicecatalogProvisioningArtifactTypeMarketplaceCar:
                return @"MARKETPLACE_CAR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogProvisioningArtifactSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"CreatedTime",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"provisioningArtifactMetadata" : @"ProvisioningArtifactMetadata",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSServicecatalogProvisioningArtifactView

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productViewSummary" : @"ProductViewSummary",
             @"provisioningArtifact" : @"ProvisioningArtifact",
             };
}

+ (NSValueTransformer *)productViewSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProductViewSummary class]];
}

+ (NSValueTransformer *)provisioningArtifactJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisioningArtifact class]];
}

@end

@implementation AWSServicecatalogProvisioningParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicecatalogProvisioningPreferences

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackSetAccounts" : @"StackSetAccounts",
             @"stackSetFailureToleranceCount" : @"StackSetFailureToleranceCount",
             @"stackSetFailureTolerancePercentage" : @"StackSetFailureTolerancePercentage",
             @"stackSetMaxConcurrencyCount" : @"StackSetMaxConcurrencyCount",
             @"stackSetMaxConcurrencyPercentage" : @"StackSetMaxConcurrencyPercentage",
             @"stackSetRegions" : @"StackSetRegions",
             };
}

@end

@implementation AWSServicecatalogRecordDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"CreatedTime",
             @"pathId" : @"PathId",
             @"productId" : @"ProductId",
             @"provisionedProductId" : @"ProvisionedProductId",
             @"provisionedProductName" : @"ProvisionedProductName",
             @"provisionedProductType" : @"ProvisionedProductType",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"recordErrors" : @"RecordErrors",
             @"recordId" : @"RecordId",
             @"recordTags" : @"RecordTags",
             @"recordType" : @"RecordType",
             @"status" : @"Status",
             @"updatedTime" : @"UpdatedTime",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)recordErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogRecordError class]];
}

+ (NSValueTransformer *)recordTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogRecordTag class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSServicecatalogRecordStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSServicecatalogRecordStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS_IN_ERROR"] == NSOrderedSame) {
            return @(AWSServicecatalogRecordStatusInProgressInError);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSServicecatalogRecordStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogRecordStatusFailed);
        }
        return @(AWSServicecatalogRecordStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogRecordStatusCreated:
                return @"CREATED";
            case AWSServicecatalogRecordStatusInProgress:
                return @"IN_PROGRESS";
            case AWSServicecatalogRecordStatusInProgressInError:
                return @"IN_PROGRESS_IN_ERROR";
            case AWSServicecatalogRecordStatusSucceeded:
                return @"SUCCEEDED";
            case AWSServicecatalogRecordStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSServicecatalogRecordError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"detail" : @"Description",
             };
}

@end

@implementation AWSServicecatalogRecordOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"outputKey" : @"OutputKey",
             @"outputValue" : @"OutputValue",
             };
}

@end

@implementation AWSServicecatalogRecordTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicecatalogRejectPortfolioShareInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"portfolioId" : @"PortfolioId",
             @"portfolioShareType" : @"PortfolioShareType",
             };
}

+ (NSValueTransformer *)portfolioShareTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"IMPORTED"] == NSOrderedSame) {
            return @(AWSServicecatalogPortfolioShareTypeImported);
        }
        if ([value caseInsensitiveCompare:@"AWS_SERVICECATALOG"] == NSOrderedSame) {
            return @(AWSServicecatalogPortfolioShareTypeAwsServicecatalog);
        }
        if ([value caseInsensitiveCompare:@"AWS_ORGANIZATIONS"] == NSOrderedSame) {
            return @(AWSServicecatalogPortfolioShareTypeAwsOrganizations);
        }
        return @(AWSServicecatalogPortfolioShareTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogPortfolioShareTypeImported:
                return @"IMPORTED";
            case AWSServicecatalogPortfolioShareTypeAwsServicecatalog:
                return @"AWS_SERVICECATALOG";
            case AWSServicecatalogPortfolioShareTypeAwsOrganizations:
                return @"AWS_ORGANIZATIONS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogRejectPortfolioShareOutput

@end

@implementation AWSServicecatalogResourceChange

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"details" : @"Details",
             @"logicalResourceId" : @"LogicalResourceId",
             @"physicalResourceId" : @"PhysicalResourceId",
             @"replacement" : @"Replacement",
             @"resourceType" : @"ResourceType",
             @"scope" : @"Scope",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ADD"] == NSOrderedSame) {
            return @(AWSServicecatalogChangeActionAdd);
        }
        if ([value caseInsensitiveCompare:@"MODIFY"] == NSOrderedSame) {
            return @(AWSServicecatalogChangeActionModify);
        }
        if ([value caseInsensitiveCompare:@"REMOVE"] == NSOrderedSame) {
            return @(AWSServicecatalogChangeActionRemove);
        }
        return @(AWSServicecatalogChangeActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogChangeActionAdd:
                return @"ADD";
            case AWSServicecatalogChangeActionModify:
                return @"MODIFY";
            case AWSServicecatalogChangeActionRemove:
                return @"REMOVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)detailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogResourceChangeDetail class]];
}

+ (NSValueTransformer *)replacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRUE"] == NSOrderedSame) {
            return @(AWSServicecatalogReplacementTrue);
        }
        if ([value caseInsensitiveCompare:@"FALSE"] == NSOrderedSame) {
            return @(AWSServicecatalogReplacementFalse);
        }
        if ([value caseInsensitiveCompare:@"CONDITIONAL"] == NSOrderedSame) {
            return @(AWSServicecatalogReplacementConditional);
        }
        return @(AWSServicecatalogReplacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogReplacementTrue:
                return @"TRUE";
            case AWSServicecatalogReplacementFalse:
                return @"FALSE";
            case AWSServicecatalogReplacementConditional:
                return @"CONDITIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogResourceChangeDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"causingEntity" : @"CausingEntity",
             @"evaluation" : @"Evaluation",
             @"target" : @"Target",
             };
}

+ (NSValueTransformer *)evaluationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STATIC"] == NSOrderedSame) {
            return @(AWSServicecatalogEvaluationTypeStatic);
        }
        if ([value caseInsensitiveCompare:@"DYNAMIC"] == NSOrderedSame) {
            return @(AWSServicecatalogEvaluationTypeDynamic);
        }
        return @(AWSServicecatalogEvaluationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogEvaluationTypeStatic:
                return @"STATIC";
            case AWSServicecatalogEvaluationTypeDynamic:
                return @"DYNAMIC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)targetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogResourceTargetDefinition class]];
}

@end

@implementation AWSServicecatalogResourceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ARN" : @"ARN",
             @"createdTime" : @"CreatedTime",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSServicecatalogResourceTargetDefinition

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attribute" : @"Attribute",
             @"name" : @"Name",
             @"requiresRecreation" : @"RequiresRecreation",
             };
}

+ (NSValueTransformer *)attributeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PROPERTIES"] == NSOrderedSame) {
            return @(AWSServicecatalogResourceAttributeProperties);
        }
        if ([value caseInsensitiveCompare:@"METADATA"] == NSOrderedSame) {
            return @(AWSServicecatalogResourceAttributeMetadata);
        }
        if ([value caseInsensitiveCompare:@"CREATIONPOLICY"] == NSOrderedSame) {
            return @(AWSServicecatalogResourceAttributeCreationpolicy);
        }
        if ([value caseInsensitiveCompare:@"UPDATEPOLICY"] == NSOrderedSame) {
            return @(AWSServicecatalogResourceAttributeUpdatepolicy);
        }
        if ([value caseInsensitiveCompare:@"DELETIONPOLICY"] == NSOrderedSame) {
            return @(AWSServicecatalogResourceAttributeDeletionpolicy);
        }
        if ([value caseInsensitiveCompare:@"TAGS"] == NSOrderedSame) {
            return @(AWSServicecatalogResourceAttributeTags);
        }
        return @(AWSServicecatalogResourceAttributeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogResourceAttributeProperties:
                return @"PROPERTIES";
            case AWSServicecatalogResourceAttributeMetadata:
                return @"METADATA";
            case AWSServicecatalogResourceAttributeCreationpolicy:
                return @"CREATIONPOLICY";
            case AWSServicecatalogResourceAttributeUpdatepolicy:
                return @"UPDATEPOLICY";
            case AWSServicecatalogResourceAttributeDeletionpolicy:
                return @"DELETIONPOLICY";
            case AWSServicecatalogResourceAttributeTags:
                return @"TAGS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)requiresRecreationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NEVER"] == NSOrderedSame) {
            return @(AWSServicecatalogRequiresRecreationNever);
        }
        if ([value caseInsensitiveCompare:@"CONDITIONALLY"] == NSOrderedSame) {
            return @(AWSServicecatalogRequiresRecreationConditionally);
        }
        if ([value caseInsensitiveCompare:@"ALWAYS"] == NSOrderedSame) {
            return @(AWSServicecatalogRequiresRecreationAlways);
        }
        return @(AWSServicecatalogRequiresRecreationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogRequiresRecreationNever:
                return @"NEVER";
            case AWSServicecatalogRequiresRecreationConditionally:
                return @"CONDITIONALLY";
            case AWSServicecatalogRequiresRecreationAlways:
                return @"ALWAYS";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogScanProvisionedProductsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"accessLevelFilter" : @"AccessLevelFilter",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             };
}

+ (NSValueTransformer *)accessLevelFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogAccessLevelFilter class]];
}

@end

@implementation AWSServicecatalogScanProvisionedProductsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"provisionedProducts" : @"ProvisionedProducts",
             };
}

+ (NSValueTransformer *)provisionedProductsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProvisionedProductDetail class]];
}

@end

@implementation AWSServicecatalogSearchProductsAsAdminInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"filters" : @"Filters",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"portfolioId" : @"PortfolioId",
             @"productSource" : @"ProductSource",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)productSourceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCOUNT"] == NSOrderedSame) {
            return @(AWSServicecatalogProductSourceAccount);
        }
        return @(AWSServicecatalogProductSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProductSourceAccount:
                return @"ACCOUNT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Title"] == NSOrderedSame) {
            return @(AWSServicecatalogProductViewSortByTitle);
        }
        if ([value caseInsensitiveCompare:@"VersionCount"] == NSOrderedSame) {
            return @(AWSServicecatalogProductViewSortByVersionCount);
        }
        if ([value caseInsensitiveCompare:@"CreationDate"] == NSOrderedSame) {
            return @(AWSServicecatalogProductViewSortByCreationDate);
        }
        return @(AWSServicecatalogProductViewSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProductViewSortByTitle:
                return @"Title";
            case AWSServicecatalogProductViewSortByVersionCount:
                return @"VersionCount";
            case AWSServicecatalogProductViewSortByCreationDate:
                return @"CreationDate";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSServicecatalogSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSServicecatalogSortOrderDescending);
        }
        return @(AWSServicecatalogSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogSortOrderAscending:
                return @"ASCENDING";
            case AWSServicecatalogSortOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogSearchProductsAsAdminOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"productViewDetails" : @"ProductViewDetails",
             };
}

+ (NSValueTransformer *)productViewDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProductViewDetail class]];
}

@end

@implementation AWSServicecatalogSearchProductsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"filters" : @"Filters",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)sortByJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Title"] == NSOrderedSame) {
            return @(AWSServicecatalogProductViewSortByTitle);
        }
        if ([value caseInsensitiveCompare:@"VersionCount"] == NSOrderedSame) {
            return @(AWSServicecatalogProductViewSortByVersionCount);
        }
        if ([value caseInsensitiveCompare:@"CreationDate"] == NSOrderedSame) {
            return @(AWSServicecatalogProductViewSortByCreationDate);
        }
        return @(AWSServicecatalogProductViewSortByUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProductViewSortByTitle:
                return @"Title";
            case AWSServicecatalogProductViewSortByVersionCount:
                return @"VersionCount";
            case AWSServicecatalogProductViewSortByCreationDate:
                return @"CreationDate";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSServicecatalogSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSServicecatalogSortOrderDescending);
        }
        return @(AWSServicecatalogSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogSortOrderAscending:
                return @"ASCENDING";
            case AWSServicecatalogSortOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogSearchProductsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"productViewAggregations" : @"ProductViewAggregations",
             @"productViewSummaries" : @"ProductViewSummaries",
             };
}

+ (NSValueTransformer *)productViewAggregationsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONArrayDictionary:JSONDictionary arrayElementType:@"structure" withModelClass:[AWSServicecatalogProductViewAggregationValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONArrayDictionaryFromMapMTLDictionary:mapMTLDictionary arrayElementType:@"structure"];
    }];
}

+ (NSValueTransformer *)productViewSummariesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProductViewSummary class]];
}

@end

@implementation AWSServicecatalogSearchProvisionedProductsInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"accessLevelFilter" : @"AccessLevelFilter",
             @"filters" : @"Filters",
             @"pageSize" : @"PageSize",
             @"pageToken" : @"PageToken",
             @"sortBy" : @"SortBy",
             @"sortOrder" : @"SortOrder",
             };
}

+ (NSValueTransformer *)accessLevelFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogAccessLevelFilter class]];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSServicecatalogSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSServicecatalogSortOrderDescending);
        }
        return @(AWSServicecatalogSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogSortOrderAscending:
                return @"ASCENDING";
            case AWSServicecatalogSortOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogSearchProvisionedProductsOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"provisionedProducts" : @"ProvisionedProducts",
             @"totalResultsCount" : @"TotalResultsCount",
             };
}

+ (NSValueTransformer *)provisionedProductsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogProvisionedProductAttribute class]];
}

@end

@implementation AWSServicecatalogServiceActionAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productId" : @"ProductId",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"serviceActionId" : @"ServiceActionId",
             };
}

@end

@implementation AWSServicecatalogServiceActionDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"definition" : @"Definition",
             @"serviceActionSummary" : @"ServiceActionSummary",
             };
}

+ (NSValueTransformer *)serviceActionSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogServiceActionSummary class]];
}

@end

@implementation AWSServicecatalogServiceActionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"definitionType" : @"DefinitionType",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)definitionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SSM_AUTOMATION"] == NSOrderedSame) {
            return @(AWSServicecatalogServiceActionDefinitionTypeSsmAutomation);
        }
        return @(AWSServicecatalogServiceActionDefinitionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogServiceActionDefinitionTypeSsmAutomation:
                return @"SSM_AUTOMATION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogShareDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shareErrors" : @"ShareErrors",
             @"successfulShares" : @"SuccessfulShares",
             };
}

+ (NSValueTransformer *)shareErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogShareError class]];
}

@end

@implementation AWSServicecatalogShareError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accounts" : @"Accounts",
             @"error" : @"Error",
             @"message" : @"Message",
             };
}

@end

@implementation AWSServicecatalogStackInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"Account",
             @"region" : @"Region",
             @"stackInstanceStatus" : @"StackInstanceStatus",
             };
}

+ (NSValueTransformer *)stackInstanceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CURRENT"] == NSOrderedSame) {
            return @(AWSServicecatalogStackInstanceStatusCurrent);
        }
        if ([value caseInsensitiveCompare:@"OUTDATED"] == NSOrderedSame) {
            return @(AWSServicecatalogStackInstanceStatusOutdated);
        }
        if ([value caseInsensitiveCompare:@"INOPERABLE"] == NSOrderedSame) {
            return @(AWSServicecatalogStackInstanceStatusInoperable);
        }
        return @(AWSServicecatalogStackInstanceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogStackInstanceStatusCurrent:
                return @"CURRENT";
            case AWSServicecatalogStackInstanceStatusOutdated:
                return @"OUTDATED";
            case AWSServicecatalogStackInstanceStatusInoperable:
                return @"INOPERABLE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicecatalogTagOptionDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"active" : @"Active",
             @"identifier" : @"Id",
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicecatalogTagOptionSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"values" : @"Values",
             };
}

@end

@implementation AWSServicecatalogTerminateProvisionedProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"ignoreErrors" : @"IgnoreErrors",
             @"provisionedProductId" : @"ProvisionedProductId",
             @"provisionedProductName" : @"ProvisionedProductName",
             @"terminateToken" : @"TerminateToken",
             };
}

@end

@implementation AWSServicecatalogTerminateProvisionedProductOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recordDetail" : @"RecordDetail",
             };
}

+ (NSValueTransformer *)recordDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogRecordDetail class]];
}

@end

@implementation AWSServicecatalogUpdateConstraintInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"parameters" : @"Parameters",
             };
}

@end

@implementation AWSServicecatalogUpdateConstraintOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"constraintDetail" : @"ConstraintDetail",
             @"constraintParameters" : @"ConstraintParameters",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)constraintDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogConstraintDetail class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusFailed);
        }
        return @(AWSServicecatalogStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogStatusAvailable:
                return @"AVAILABLE";
            case AWSServicecatalogStatusCreating:
                return @"CREATING";
            case AWSServicecatalogStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogUpdatePortfolioInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"addTags" : @"AddTags",
             @"detail" : @"Description",
             @"displayName" : @"DisplayName",
             @"identifier" : @"Id",
             @"providerName" : @"ProviderName",
             @"removeTags" : @"RemoveTags",
             };
}

+ (NSValueTransformer *)addTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogUpdatePortfolioOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"portfolioDetail" : @"PortfolioDetail",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)portfolioDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogPortfolioDetail class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogUpdateProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"addTags" : @"AddTags",
             @"detail" : @"Description",
             @"distributor" : @"Distributor",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"owner" : @"Owner",
             @"removeTags" : @"RemoveTags",
             @"supportDescription" : @"SupportDescription",
             @"supportEmail" : @"SupportEmail",
             @"supportUrl" : @"SupportUrl",
             };
}

+ (NSValueTransformer *)addTagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogUpdateProductOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"productViewDetail" : @"ProductViewDetail",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)productViewDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProductViewDetail class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogUpdateProvisionedProductInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"pathId" : @"PathId",
             @"productId" : @"ProductId",
             @"provisionedProductId" : @"ProvisionedProductId",
             @"provisionedProductName" : @"ProvisionedProductName",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             @"provisioningParameters" : @"ProvisioningParameters",
             @"provisioningPreferences" : @"ProvisioningPreferences",
             @"tags" : @"Tags",
             @"updateToken" : @"UpdateToken",
             };
}

+ (NSValueTransformer *)provisioningParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogUpdateProvisioningParameter class]];
}

+ (NSValueTransformer *)provisioningPreferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogUpdateProvisioningPreferences class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSServicecatalogTag class]];
}

@end

@implementation AWSServicecatalogUpdateProvisionedProductOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recordDetail" : @"RecordDetail",
             };
}

+ (NSValueTransformer *)recordDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogRecordDetail class]];
}

@end

@implementation AWSServicecatalogUpdateProvisionedProductPropertiesInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"idempotencyToken" : @"IdempotencyToken",
             @"provisionedProductId" : @"ProvisionedProductId",
             @"provisionedProductProperties" : @"ProvisionedProductProperties",
             };
}

@end

@implementation AWSServicecatalogUpdateProvisionedProductPropertiesOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"provisionedProductId" : @"ProvisionedProductId",
             @"provisionedProductProperties" : @"ProvisionedProductProperties",
             @"recordId" : @"RecordId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSServicecatalogRecordStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS"] == NSOrderedSame) {
            return @(AWSServicecatalogRecordStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"IN_PROGRESS_IN_ERROR"] == NSOrderedSame) {
            return @(AWSServicecatalogRecordStatusInProgressInError);
        }
        if ([value caseInsensitiveCompare:@"SUCCEEDED"] == NSOrderedSame) {
            return @(AWSServicecatalogRecordStatusSucceeded);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogRecordStatusFailed);
        }
        return @(AWSServicecatalogRecordStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogRecordStatusCreated:
                return @"CREATED";
            case AWSServicecatalogRecordStatusInProgress:
                return @"IN_PROGRESS";
            case AWSServicecatalogRecordStatusInProgressInError:
                return @"IN_PROGRESS_IN_ERROR";
            case AWSServicecatalogRecordStatusSucceeded:
                return @"SUCCEEDED";
            case AWSServicecatalogRecordStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogUpdateProvisioningArtifactInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"active" : @"Active",
             @"detail" : @"Description",
             @"guidance" : @"Guidance",
             @"name" : @"Name",
             @"productId" : @"ProductId",
             @"provisioningArtifactId" : @"ProvisioningArtifactId",
             };
}

+ (NSValueTransformer *)guidanceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactGuidanceDefault);
        }
        if ([value caseInsensitiveCompare:@"DEPRECATED"] == NSOrderedSame) {
            return @(AWSServicecatalogProvisioningArtifactGuidanceDeprecated);
        }
        return @(AWSServicecatalogProvisioningArtifactGuidanceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogProvisioningArtifactGuidanceDefault:
                return @"DEFAULT";
            case AWSServicecatalogProvisioningArtifactGuidanceDeprecated:
                return @"DEPRECATED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogUpdateProvisioningArtifactOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"info" : @"Info",
             @"provisioningArtifactDetail" : @"ProvisioningArtifactDetail",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)provisioningArtifactDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogProvisioningArtifactDetail class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AVAILABLE"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSServicecatalogStatusFailed);
        }
        return @(AWSServicecatalogStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogStatusAvailable:
                return @"AVAILABLE";
            case AWSServicecatalogStatusCreating:
                return @"CREATING";
            case AWSServicecatalogStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogUpdateProvisioningParameter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"usePreviousValue" : @"UsePreviousValue",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicecatalogUpdateProvisioningPreferences

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stackSetAccounts" : @"StackSetAccounts",
             @"stackSetFailureToleranceCount" : @"StackSetFailureToleranceCount",
             @"stackSetFailureTolerancePercentage" : @"StackSetFailureTolerancePercentage",
             @"stackSetMaxConcurrencyCount" : @"StackSetMaxConcurrencyCount",
             @"stackSetMaxConcurrencyPercentage" : @"StackSetMaxConcurrencyPercentage",
             @"stackSetOperationType" : @"StackSetOperationType",
             @"stackSetRegions" : @"StackSetRegions",
             };
}

+ (NSValueTransformer *)stackSetOperationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATE"] == NSOrderedSame) {
            return @(AWSServicecatalogStackSetOperationTypeCreate);
        }
        if ([value caseInsensitiveCompare:@"UPDATE"] == NSOrderedSame) {
            return @(AWSServicecatalogStackSetOperationTypeUpdate);
        }
        if ([value caseInsensitiveCompare:@"DELETE"] == NSOrderedSame) {
            return @(AWSServicecatalogStackSetOperationTypeDelete);
        }
        return @(AWSServicecatalogStackSetOperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSServicecatalogStackSetOperationTypeCreate:
                return @"CREATE";
            case AWSServicecatalogStackSetOperationTypeUpdate:
                return @"UPDATE";
            case AWSServicecatalogStackSetOperationTypeDelete:
                return @"DELETE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSServicecatalogUpdateServiceActionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceptLanguage" : @"AcceptLanguage",
             @"definition" : @"Definition",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"name" : @"Name",
             };
}

@end

@implementation AWSServicecatalogUpdateServiceActionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"serviceActionDetail" : @"ServiceActionDetail",
             };
}

+ (NSValueTransformer *)serviceActionDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogServiceActionDetail class]];
}

@end

@implementation AWSServicecatalogUpdateTagOptionInput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"active" : @"Active",
             @"identifier" : @"Id",
             @"value" : @"Value",
             };
}

@end

@implementation AWSServicecatalogUpdateTagOptionOutput

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagOptionDetail" : @"TagOptionDetail",
             };
}

+ (NSValueTransformer *)tagOptionDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSServicecatalogTagOptionDetail class]];
}

@end

@implementation AWSServicecatalogUsageInstruction

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

@end
