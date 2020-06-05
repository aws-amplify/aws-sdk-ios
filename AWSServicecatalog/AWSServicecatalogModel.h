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

FOUNDATION_EXPORT NSString *const AWSServicecatalogErrorDomain;

typedef NS_ENUM(NSInteger, AWSServicecatalogErrorType) {
    AWSServicecatalogErrorUnknown,
    AWSServicecatalogErrorDuplicateResource,
    AWSServicecatalogErrorInvalidParameters,
    AWSServicecatalogErrorInvalidState,
    AWSServicecatalogErrorLimitExceeded,
    AWSServicecatalogErrorOperationNotSupported,
    AWSServicecatalogErrorResourceInUse,
    AWSServicecatalogErrorResourceNotFound,
    AWSServicecatalogErrorTagOptionNotMigrated,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogAccessLevelFilterKey) {
    AWSServicecatalogAccessLevelFilterKeyUnknown,
    AWSServicecatalogAccessLevelFilterKeyAccount,
    AWSServicecatalogAccessLevelFilterKeyRole,
    AWSServicecatalogAccessLevelFilterKeyUser,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogAccessStatus) {
    AWSServicecatalogAccessStatusUnknown,
    AWSServicecatalogAccessStatusEnabled,
    AWSServicecatalogAccessStatusUnderChange,
    AWSServicecatalogAccessStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogChangeAction) {
    AWSServicecatalogChangeActionUnknown,
    AWSServicecatalogChangeActionAdd,
    AWSServicecatalogChangeActionModify,
    AWSServicecatalogChangeActionRemove,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogReplicateOption) {
    AWSServicecatalogReplicateOptionUnknown,
    AWSServicecatalogReplicateOptionCopyTags,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogReplicateProductStatus) {
    AWSServicecatalogReplicateProductStatusUnknown,
    AWSServicecatalogReplicateProductStatusSucceeded,
    AWSServicecatalogReplicateProductStatusInProgress,
    AWSServicecatalogReplicateProductStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogEvaluationType) {
    AWSServicecatalogEvaluationTypeUnknown,
    AWSServicecatalogEvaluationTypeStatic,
    AWSServicecatalogEvaluationTypeDynamic,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogOrganizationNodeType) {
    AWSServicecatalogOrganizationNodeTypeUnknown,
    AWSServicecatalogOrganizationNodeTypeOrganization,
    AWSServicecatalogOrganizationNodeTypeOrganizationalUnit,
    AWSServicecatalogOrganizationNodeTypeAccount,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogPortfolioShareType) {
    AWSServicecatalogPortfolioShareTypeUnknown,
    AWSServicecatalogPortfolioShareTypeImported,
    AWSServicecatalogPortfolioShareTypeAwsServicecatalog,
    AWSServicecatalogPortfolioShareTypeAwsOrganizations,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogPrincipalType) {
    AWSServicecatalogPrincipalTypeUnknown,
    AWSServicecatalogPrincipalTypeIam,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProductSource) {
    AWSServicecatalogProductSourceUnknown,
    AWSServicecatalogProductSourceAccount,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProductType) {
    AWSServicecatalogProductTypeUnknown,
    AWSServicecatalogProductTypeCloudFormationTemplate,
    AWSServicecatalogProductTypeMarketplace,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProductViewFilterBy) {
    AWSServicecatalogProductViewFilterByUnknown,
    AWSServicecatalogProductViewFilterByFullTextSearch,
    AWSServicecatalogProductViewFilterByOwner,
    AWSServicecatalogProductViewFilterByProductType,
    AWSServicecatalogProductViewFilterBySourceProductId,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProductViewSortBy) {
    AWSServicecatalogProductViewSortByUnknown,
    AWSServicecatalogProductViewSortByTitle,
    AWSServicecatalogProductViewSortByVersionCount,
    AWSServicecatalogProductViewSortByCreationDate,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogPropertyKey) {
    AWSServicecatalogPropertyKeyUnknown,
    AWSServicecatalogPropertyKeyOwner,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProvisionedProductPlanStatus) {
    AWSServicecatalogProvisionedProductPlanStatusUnknown,
    AWSServicecatalogProvisionedProductPlanStatusCreateInProgress,
    AWSServicecatalogProvisionedProductPlanStatusCreateSuccess,
    AWSServicecatalogProvisionedProductPlanStatusCreateFailed,
    AWSServicecatalogProvisionedProductPlanStatusExecuteInProgress,
    AWSServicecatalogProvisionedProductPlanStatusExecuteSuccess,
    AWSServicecatalogProvisionedProductPlanStatusExecuteFailed,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProvisionedProductPlanType) {
    AWSServicecatalogProvisionedProductPlanTypeUnknown,
    AWSServicecatalogProvisionedProductPlanTypeCloudformation,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProvisionedProductStatus) {
    AWSServicecatalogProvisionedProductStatusUnknown,
    AWSServicecatalogProvisionedProductStatusAvailable,
    AWSServicecatalogProvisionedProductStatusUnderChange,
    AWSServicecatalogProvisionedProductStatusTainted,
    AWSServicecatalogProvisionedProductStatusError,
    AWSServicecatalogProvisionedProductStatusPlanInProgress,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProvisionedProductViewFilterBy) {
    AWSServicecatalogProvisionedProductViewFilterByUnknown,
    AWSServicecatalogProvisionedProductViewFilterBySearchQuery,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProvisioningArtifactGuidance) {
    AWSServicecatalogProvisioningArtifactGuidanceUnknown,
    AWSServicecatalogProvisioningArtifactGuidanceDefault,
    AWSServicecatalogProvisioningArtifactGuidanceDeprecated,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProvisioningArtifactPropertyName) {
    AWSServicecatalogProvisioningArtifactPropertyNameUnknown,
    AWSServicecatalogProvisioningArtifactPropertyNameId,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogProvisioningArtifactType) {
    AWSServicecatalogProvisioningArtifactTypeUnknown,
    AWSServicecatalogProvisioningArtifactTypeCloudFormationTemplate,
    AWSServicecatalogProvisioningArtifactTypeMarketplaceAmi,
    AWSServicecatalogProvisioningArtifactTypeMarketplaceCar,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogRecordStatus) {
    AWSServicecatalogRecordStatusUnknown,
    AWSServicecatalogRecordStatusCreated,
    AWSServicecatalogRecordStatusInProgress,
    AWSServicecatalogRecordStatusInProgressInError,
    AWSServicecatalogRecordStatusSucceeded,
    AWSServicecatalogRecordStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogReplacement) {
    AWSServicecatalogReplacementUnknown,
    AWSServicecatalogReplacementTrue,
    AWSServicecatalogReplacementFalse,
    AWSServicecatalogReplacementConditional,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogRequiresRecreation) {
    AWSServicecatalogRequiresRecreationUnknown,
    AWSServicecatalogRequiresRecreationNever,
    AWSServicecatalogRequiresRecreationConditionally,
    AWSServicecatalogRequiresRecreationAlways,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogResourceAttribute) {
    AWSServicecatalogResourceAttributeUnknown,
    AWSServicecatalogResourceAttributeProperties,
    AWSServicecatalogResourceAttributeMetadata,
    AWSServicecatalogResourceAttributeCreationpolicy,
    AWSServicecatalogResourceAttributeUpdatepolicy,
    AWSServicecatalogResourceAttributeDeletionpolicy,
    AWSServicecatalogResourceAttributeTags,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogServiceActionAssociationErrorCode) {
    AWSServicecatalogServiceActionAssociationErrorCodeUnknown,
    AWSServicecatalogServiceActionAssociationErrorCodeDuplicateResource,
    AWSServicecatalogServiceActionAssociationErrorCodeInternalFailure,
    AWSServicecatalogServiceActionAssociationErrorCodeLimitExceeded,
    AWSServicecatalogServiceActionAssociationErrorCodeResourceNotFound,
    AWSServicecatalogServiceActionAssociationErrorCodeThrottling,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogServiceActionDefinitionKey) {
    AWSServicecatalogServiceActionDefinitionKeyUnknown,
    AWSServicecatalogServiceActionDefinitionKeyName,
    AWSServicecatalogServiceActionDefinitionKeyVersion,
    AWSServicecatalogServiceActionDefinitionKeyAssumeRole,
    AWSServicecatalogServiceActionDefinitionKeyParameters,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogServiceActionDefinitionType) {
    AWSServicecatalogServiceActionDefinitionTypeUnknown,
    AWSServicecatalogServiceActionDefinitionTypeSsmAutomation,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogShareStatus) {
    AWSServicecatalogShareStatusUnknown,
    AWSServicecatalogShareStatusNotStarted,
    AWSServicecatalogShareStatusInProgress,
    AWSServicecatalogShareStatusCompleted,
    AWSServicecatalogShareStatusCompletedWithErrors,
    AWSServicecatalogShareStatusError,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogSortOrder) {
    AWSServicecatalogSortOrderUnknown,
    AWSServicecatalogSortOrderAscending,
    AWSServicecatalogSortOrderDescending,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogStackInstanceStatus) {
    AWSServicecatalogStackInstanceStatusUnknown,
    AWSServicecatalogStackInstanceStatusCurrent,
    AWSServicecatalogStackInstanceStatusOutdated,
    AWSServicecatalogStackInstanceStatusInoperable,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogStackSetOperationType) {
    AWSServicecatalogStackSetOperationTypeUnknown,
    AWSServicecatalogStackSetOperationTypeCreate,
    AWSServicecatalogStackSetOperationTypeUpdate,
    AWSServicecatalogStackSetOperationTypeDelete,
};

typedef NS_ENUM(NSInteger, AWSServicecatalogStatus) {
    AWSServicecatalogStatusUnknown,
    AWSServicecatalogStatusAvailable,
    AWSServicecatalogStatusCreating,
    AWSServicecatalogStatusFailed,
};

@class AWSServicecatalogAcceptPortfolioShareInput;
@class AWSServicecatalogAcceptPortfolioShareOutput;
@class AWSServicecatalogAccessLevelFilter;
@class AWSServicecatalogAssociateBudgetWithResourceInput;
@class AWSServicecatalogAssociateBudgetWithResourceOutput;
@class AWSServicecatalogAssociatePrincipalWithPortfolioInput;
@class AWSServicecatalogAssociatePrincipalWithPortfolioOutput;
@class AWSServicecatalogAssociateProductWithPortfolioInput;
@class AWSServicecatalogAssociateProductWithPortfolioOutput;
@class AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput;
@class AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput;
@class AWSServicecatalogAssociateTagOptionWithResourceInput;
@class AWSServicecatalogAssociateTagOptionWithResourceOutput;
@class AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput;
@class AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput;
@class AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput;
@class AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput;
@class AWSServicecatalogBudgetDetail;
@class AWSServicecatalogCloudWatchDashboard;
@class AWSServicecatalogConstraintDetail;
@class AWSServicecatalogConstraintSummary;
@class AWSServicecatalogReplicateProductInput;
@class AWSServicecatalogReplicateProductOutput;
@class AWSServicecatalogCreateConstraintInput;
@class AWSServicecatalogCreateConstraintOutput;
@class AWSServicecatalogCreatePortfolioInput;
@class AWSServicecatalogCreatePortfolioOutput;
@class AWSServicecatalogCreatePortfolioShareInput;
@class AWSServicecatalogCreatePortfolioShareOutput;
@class AWSServicecatalogCreateProductInput;
@class AWSServicecatalogCreateProductOutput;
@class AWSServicecatalogCreateProvisionedProductPlanInput;
@class AWSServicecatalogCreateProvisionedProductPlanOutput;
@class AWSServicecatalogCreateProvisioningArtifactInput;
@class AWSServicecatalogCreateProvisioningArtifactOutput;
@class AWSServicecatalogCreateServiceActionInput;
@class AWSServicecatalogCreateServiceActionOutput;
@class AWSServicecatalogCreateTagOptionInput;
@class AWSServicecatalogCreateTagOptionOutput;
@class AWSServicecatalogDeleteConstraintInput;
@class AWSServicecatalogDeleteConstraintOutput;
@class AWSServicecatalogDeletePortfolioInput;
@class AWSServicecatalogDeletePortfolioOutput;
@class AWSServicecatalogDeletePortfolioShareInput;
@class AWSServicecatalogDeletePortfolioShareOutput;
@class AWSServicecatalogDeleteProductInput;
@class AWSServicecatalogDeleteProductOutput;
@class AWSServicecatalogDeleteProvisionedProductPlanInput;
@class AWSServicecatalogDeleteProvisionedProductPlanOutput;
@class AWSServicecatalogDeleteProvisioningArtifactInput;
@class AWSServicecatalogDeleteProvisioningArtifactOutput;
@class AWSServicecatalogDeleteServiceActionInput;
@class AWSServicecatalogDeleteServiceActionOutput;
@class AWSServicecatalogDeleteTagOptionInput;
@class AWSServicecatalogDeleteTagOptionOutput;
@class AWSServicecatalogDescribeConstraintInput;
@class AWSServicecatalogDescribeConstraintOutput;
@class AWSServicecatalogDescribeCopyProductStatusInput;
@class AWSServicecatalogDescribeCopyProductStatusOutput;
@class AWSServicecatalogDescribePortfolioInput;
@class AWSServicecatalogDescribePortfolioOutput;
@class AWSServicecatalogDescribePortfolioShareStatusInput;
@class AWSServicecatalogDescribePortfolioShareStatusOutput;
@class AWSServicecatalogDescribeProductAsAdminInput;
@class AWSServicecatalogDescribeProductAsAdminOutput;
@class AWSServicecatalogDescribeProductInput;
@class AWSServicecatalogDescribeProductOutput;
@class AWSServicecatalogDescribeProductViewInput;
@class AWSServicecatalogDescribeProductViewOutput;
@class AWSServicecatalogDescribeProvisionedProductInput;
@class AWSServicecatalogDescribeProvisionedProductOutput;
@class AWSServicecatalogDescribeProvisionedProductPlanInput;
@class AWSServicecatalogDescribeProvisionedProductPlanOutput;
@class AWSServicecatalogDescribeProvisioningArtifactInput;
@class AWSServicecatalogDescribeProvisioningArtifactOutput;
@class AWSServicecatalogDescribeProvisioningParametersInput;
@class AWSServicecatalogDescribeProvisioningParametersOutput;
@class AWSServicecatalogDescribeRecordInput;
@class AWSServicecatalogDescribeRecordOutput;
@class AWSServicecatalogDescribeServiceActionExecutionParametersInput;
@class AWSServicecatalogDescribeServiceActionExecutionParametersOutput;
@class AWSServicecatalogDescribeServiceActionInput;
@class AWSServicecatalogDescribeServiceActionOutput;
@class AWSServicecatalogDescribeTagOptionInput;
@class AWSServicecatalogDescribeTagOptionOutput;
@class AWSServicecatalogDisableAWSOrganizationsAccessInput;
@class AWSServicecatalogDisableAWSOrganizationsAccessOutput;
@class AWSServicecatalogDisassociateBudgetFromResourceInput;
@class AWSServicecatalogDisassociateBudgetFromResourceOutput;
@class AWSServicecatalogDisassociatePrincipalFromPortfolioInput;
@class AWSServicecatalogDisassociatePrincipalFromPortfolioOutput;
@class AWSServicecatalogDisassociateProductFromPortfolioInput;
@class AWSServicecatalogDisassociateProductFromPortfolioOutput;
@class AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput;
@class AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput;
@class AWSServicecatalogDisassociateTagOptionFromResourceInput;
@class AWSServicecatalogDisassociateTagOptionFromResourceOutput;
@class AWSServicecatalogEnableAWSOrganizationsAccessInput;
@class AWSServicecatalogEnableAWSOrganizationsAccessOutput;
@class AWSServicecatalogExecuteProvisionedProductPlanInput;
@class AWSServicecatalogExecuteProvisionedProductPlanOutput;
@class AWSServicecatalogExecuteProvisionedProductServiceActionInput;
@class AWSServicecatalogExecuteProvisionedProductServiceActionOutput;
@class AWSServicecatalogExecutionParameter;
@class AWSServicecatalogFailedServiceActionAssociation;
@class AWSServicecatalogGetAWSOrganizationsAccessStatusInput;
@class AWSServicecatalogGetAWSOrganizationsAccessStatusOutput;
@class AWSServicecatalogLaunchPath;
@class AWSServicecatalogLaunchPathSummary;
@class AWSServicecatalogListAcceptedPortfolioSharesInput;
@class AWSServicecatalogListAcceptedPortfolioSharesOutput;
@class AWSServicecatalogListBudgetsForResourceInput;
@class AWSServicecatalogListBudgetsForResourceOutput;
@class AWSServicecatalogListConstraintsForPortfolioInput;
@class AWSServicecatalogListConstraintsForPortfolioOutput;
@class AWSServicecatalogListLaunchPathsInput;
@class AWSServicecatalogListLaunchPathsOutput;
@class AWSServicecatalogListOrganizationPortfolioAccessInput;
@class AWSServicecatalogListOrganizationPortfolioAccessOutput;
@class AWSServicecatalogListPortfolioAccessInput;
@class AWSServicecatalogListPortfolioAccessOutput;
@class AWSServicecatalogListPortfoliosForProductInput;
@class AWSServicecatalogListPortfoliosForProductOutput;
@class AWSServicecatalogListPortfoliosInput;
@class AWSServicecatalogListPortfoliosOutput;
@class AWSServicecatalogListPrincipalsForPortfolioInput;
@class AWSServicecatalogListPrincipalsForPortfolioOutput;
@class AWSServicecatalogListProvisionedProductPlansInput;
@class AWSServicecatalogListProvisionedProductPlansOutput;
@class AWSServicecatalogListProvisioningArtifactsForServiceActionInput;
@class AWSServicecatalogListProvisioningArtifactsForServiceActionOutput;
@class AWSServicecatalogListProvisioningArtifactsInput;
@class AWSServicecatalogListProvisioningArtifactsOutput;
@class AWSServicecatalogListRecordHistoryInput;
@class AWSServicecatalogListRecordHistoryOutput;
@class AWSServicecatalogListRecordHistorySearchFilter;
@class AWSServicecatalogListResourcesForTagOptionInput;
@class AWSServicecatalogListResourcesForTagOptionOutput;
@class AWSServicecatalogListServiceActionsForProvisioningArtifactInput;
@class AWSServicecatalogListServiceActionsForProvisioningArtifactOutput;
@class AWSServicecatalogListServiceActionsInput;
@class AWSServicecatalogListServiceActionsOutput;
@class AWSServicecatalogListStackInstancesForProvisionedProductInput;
@class AWSServicecatalogListStackInstancesForProvisionedProductOutput;
@class AWSServicecatalogListTagOptionsFilters;
@class AWSServicecatalogListTagOptionsInput;
@class AWSServicecatalogListTagOptionsOutput;
@class AWSServicecatalogOrganizationNode;
@class AWSServicecatalogParameterConstraints;
@class AWSServicecatalogPortfolioDetail;
@class AWSServicecatalogPrincipal;
@class AWSServicecatalogProductViewAggregationValue;
@class AWSServicecatalogProductViewDetail;
@class AWSServicecatalogProductViewSummary;
@class AWSServicecatalogProvisionProductInput;
@class AWSServicecatalogProvisionProductOutput;
@class AWSServicecatalogProvisionedProductAttribute;
@class AWSServicecatalogProvisionedProductDetail;
@class AWSServicecatalogProvisionedProductPlanDetails;
@class AWSServicecatalogProvisionedProductPlanSummary;
@class AWSServicecatalogProvisioningArtifact;
@class AWSServicecatalogProvisioningArtifactDetail;
@class AWSServicecatalogProvisioningArtifactParameter;
@class AWSServicecatalogProvisioningArtifactPreferences;
@class AWSServicecatalogProvisioningArtifactProperties;
@class AWSServicecatalogProvisioningArtifactSummary;
@class AWSServicecatalogProvisioningArtifactView;
@class AWSServicecatalogProvisioningParameter;
@class AWSServicecatalogProvisioningPreferences;
@class AWSServicecatalogRecordDetail;
@class AWSServicecatalogRecordError;
@class AWSServicecatalogRecordOutput;
@class AWSServicecatalogRecordTag;
@class AWSServicecatalogRejectPortfolioShareInput;
@class AWSServicecatalogRejectPortfolioShareOutput;
@class AWSServicecatalogResourceChange;
@class AWSServicecatalogResourceChangeDetail;
@class AWSServicecatalogResourceDetail;
@class AWSServicecatalogResourceTargetDefinition;
@class AWSServicecatalogScanProvisionedProductsInput;
@class AWSServicecatalogScanProvisionedProductsOutput;
@class AWSServicecatalogSearchProductsAsAdminInput;
@class AWSServicecatalogSearchProductsAsAdminOutput;
@class AWSServicecatalogSearchProductsInput;
@class AWSServicecatalogSearchProductsOutput;
@class AWSServicecatalogSearchProvisionedProductsInput;
@class AWSServicecatalogSearchProvisionedProductsOutput;
@class AWSServicecatalogServiceActionAssociation;
@class AWSServicecatalogServiceActionDetail;
@class AWSServicecatalogServiceActionSummary;
@class AWSServicecatalogShareDetails;
@class AWSServicecatalogShareError;
@class AWSServicecatalogStackInstance;
@class AWSServicecatalogTag;
@class AWSServicecatalogTagOptionDetail;
@class AWSServicecatalogTagOptionSummary;
@class AWSServicecatalogTerminateProvisionedProductInput;
@class AWSServicecatalogTerminateProvisionedProductOutput;
@class AWSServicecatalogUpdateConstraintInput;
@class AWSServicecatalogUpdateConstraintOutput;
@class AWSServicecatalogUpdatePortfolioInput;
@class AWSServicecatalogUpdatePortfolioOutput;
@class AWSServicecatalogUpdateProductInput;
@class AWSServicecatalogUpdateProductOutput;
@class AWSServicecatalogUpdateProvisionedProductInput;
@class AWSServicecatalogUpdateProvisionedProductOutput;
@class AWSServicecatalogUpdateProvisionedProductPropertiesInput;
@class AWSServicecatalogUpdateProvisionedProductPropertiesOutput;
@class AWSServicecatalogUpdateProvisioningArtifactInput;
@class AWSServicecatalogUpdateProvisioningArtifactOutput;
@class AWSServicecatalogUpdateProvisioningParameter;
@class AWSServicecatalogUpdateProvisioningPreferences;
@class AWSServicecatalogUpdateServiceActionInput;
@class AWSServicecatalogUpdateServiceActionOutput;
@class AWSServicecatalogUpdateTagOptionInput;
@class AWSServicecatalogUpdateTagOptionOutput;
@class AWSServicecatalogUsageInstruction;

/**
 
 */
@interface AWSServicecatalogAcceptPortfolioShareInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>The type of shared portfolios to accept. The default is to accept imported portfolios.</p><ul><li><p><code>AWS_ORGANIZATIONS</code> - Accept portfolios shared by the master account of your organization.</p></li><li><p><code>IMPORTED</code> - Accept imported portfolios.</p></li><li><p><code>AWS_SERVICECATALOG</code> - Not supported. (Throws ResourceNotFoundException.)</p></li></ul><p>For example, <code>aws servicecatalog accept-portfolio-share --portfolio-id "port-2qwzkwxt3y5fk" --portfolio-share-type AWS_ORGANIZATIONS</code></p>
 */
@property (nonatomic, assign) AWSServicecatalogPortfolioShareType portfolioShareType;

@end

/**
 
 */
@interface AWSServicecatalogAcceptPortfolioShareOutput : AWSModel


@end

/**
 <p>The access level to use to filter results.</p>
 */
@interface AWSServicecatalogAccessLevelFilter : AWSModel


/**
 <p>The access level.</p><ul><li><p><code>Account</code> - Filter results based on the account.</p></li><li><p><code>Role</code> - Filter results based on the federated role of the specified user.</p></li><li><p><code>User</code> - Filter results based on the specified user.</p></li></ul>
 */
@property (nonatomic, assign) AWSServicecatalogAccessLevelFilterKey key;

/**
 <p>The user to which the access level applies. The only supported value is <code>Self</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSServicecatalogAssociateBudgetWithResourceInput : AWSRequest


/**
 <p>The name of the budget you want to associate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable budgetName;

/**
 <p> The resource identifier. Either a portfolio-id or a product-id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSServicecatalogAssociateBudgetWithResourceOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogAssociatePrincipalWithPortfolioInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>The ARN of the principal (IAM user, role, or group).</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalARN;

/**
 <p>The principal type. The supported value is <code>IAM</code>.</p>
 */
@property (nonatomic, assign) AWSServicecatalogPrincipalType principalType;

@end

/**
 
 */
@interface AWSServicecatalogAssociatePrincipalWithPortfolioOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogAssociateProductWithPortfolioInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the source portfolio.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourcePortfolioId;

@end

/**
 
 */
@interface AWSServicecatalogAssociateProductWithPortfolioOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioning artifact. For example, <code>pa-4abcdjnxjj6ne</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>The self-service action identifier. For example, <code>act-fs7abcd89wxyz</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceActionId;

@end

/**
 
 */
@interface AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogAssociateTagOptionWithResourceInput : AWSRequest


/**
 <p>The resource identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The TagOption identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagOptionId;

@end

/**
 
 */
@interface AWSServicecatalogAssociateTagOptionWithResourceOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>One or more associations, each consisting of the Action ID, the Product ID, and the Provisioning Artifact ID.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogServiceActionAssociation *> * _Nullable serviceActionAssociations;

@end

/**
 
 */
@interface AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput : AWSModel


/**
 <p>An object that contains a list of errors, along with information to help you identify the self-service action.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogFailedServiceActionAssociation *> * _Nullable failedServiceActionAssociations;

@end

/**
 
 */
@interface AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>One or more associations, each consisting of the Action ID, the Product ID, and the Provisioning Artifact ID.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogServiceActionAssociation *> * _Nullable serviceActionAssociations;

@end

/**
 
 */
@interface AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput : AWSModel


/**
 <p>An object that contains a list of errors, along with information to help you identify the self-service action.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogFailedServiceActionAssociation *> * _Nullable failedServiceActionAssociations;

@end

/**
 <p>Information about a budget.</p>
 */
@interface AWSServicecatalogBudgetDetail : AWSModel


/**
 <p>Name of the associated budget.</p>
 */
@property (nonatomic, strong) NSString * _Nullable budgetName;

@end

/**
 <p>Information about a CloudWatch dashboard.</p>
 */
@interface AWSServicecatalogCloudWatchDashboard : AWSModel


/**
 <p>The name of the CloudWatch dashboard.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about a constraint.</p>
 */
@interface AWSServicecatalogConstraintDetail : AWSModel


/**
 <p>The identifier of the constraint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable constraintId;

/**
 <p>The description of the constraint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The owner of the constraint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The identifier of the portfolio the product resides in. The constraint applies only to the instance of the product that lives within this portfolio.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>The identifier of the product the constraint applies to. Note that a constraint applies to a specific instance of a product within a certain portfolio.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The type of constraint.</p><ul><li><p><code>LAUNCH</code></p></li><li><p><code>NOTIFICATION</code></p></li><li><p>STACKSET</p></li><li><p><code>TEMPLATE</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Summary information about a constraint.</p>
 */
@interface AWSServicecatalogConstraintSummary : AWSModel


/**
 <p>The description of the constraint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The type of constraint.</p><ul><li><p><code>LAUNCH</code></p></li><li><p><code>NOTIFICATION</code></p></li><li><p>STACKSET</p></li><li><p><code>TEMPLATE</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 
 */
@interface AWSServicecatalogReplicateProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The copy options. If the value is <code>CopyTags</code>, the tags from the source product are copied to the target product.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable replicateOptions;

/**
 <p> A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the idempotency token, the same response is returned for each repeated request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The Amazon Resource Name (ARN) of the source product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceProductArn;

/**
 <p>The identifiers of the provisioning artifacts (also known as versions) of the product to copy. By default, all provisioning artifacts are copied.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> * _Nullable sourceProvisioningArtifactIdentifiers;

/**
 <p>The identifier of the target product. By default, a new product is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetProductId;

/**
 <p>A name for the target product. The default is the name of the source product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetProductName;

@end

/**
 
 */
@interface AWSServicecatalogReplicateProductOutput : AWSModel


/**
 <p>The token to use to track the progress of the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateProductToken;

@end

/**
 
 */
@interface AWSServicecatalogCreateConstraintInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The description of the constraint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the idempotency token, the same response is returned for each repeated request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The constraint parameters, in JSON format. The syntax depends on the constraint type as follows:</p><dl><dt>LAUNCH</dt><dd><p>You are required to specify either the <code>RoleArn</code> or the <code>LocalRoleName</code> but can't use both.</p><p>Specify the <code>RoleArn</code> property as follows:</p><p><code>{"RoleArn" : "arn:aws:iam::123456789012:role/LaunchRole"}</code></p><p>Specify the <code>LocalRoleName</code> property as follows:</p><p><code>{"LocalRoleName": "SCBasicLaunchRole"}</code></p><p>If you specify the <code>LocalRoleName</code> property, when an account uses the launch constraint, the IAM role with that name in the account will be used. This allows launch-role constraints to be account-agnostic so the administrator can create fewer resources per shared account.</p><note><p>The given role name must exist in the account used to create the launch constraint and the account of the user who launches a product with this launch constraint.</p></note><p>You cannot have both a <code>LAUNCH</code> and a <code>STACKSET</code> constraint.</p><p>You also cannot have more than one <code>LAUNCH</code> constraint on a product and portfolio.</p></dd><dt>NOTIFICATION</dt><dd><p>Specify the <code>NotificationArns</code> property as follows:</p><p><code>{"NotificationArns" : ["arn:aws:sns:us-east-1:123456789012:Topic"]}</code></p></dd><dt>RESOURCE_UPDATE</dt><dd><p>Specify the <code>TagUpdatesOnProvisionedProduct</code> property as follows:</p><p><code>{"Version":"2.0","Properties":{"TagUpdateOnProvisionedProduct":"String"}}</code></p><p>The <code>TagUpdatesOnProvisionedProduct</code> property accepts a string value of <code>ALLOWED</code> or <code>NOT_ALLOWED</code>.</p></dd><dt>STACKSET</dt><dd><p>Specify the <code>Parameters</code> property as follows:</p><p><code>{"Version": "String", "Properties": {"AccountList": [ "String" ], "RegionList": [ "String" ], "AdminRole": "String", "ExecutionRole": "String"}}</code></p><p>You cannot have both a <code>LAUNCH</code> and a <code>STACKSET</code> constraint.</p><p>You also cannot have more than one <code>STACKSET</code> constraint on a product and portfolio.</p><p>Products with a <code>STACKSET</code> constraint will launch an AWS CloudFormation stack set.</p></dd><dt>TEMPLATE</dt><dd><p>Specify the <code>Rules</code> property. For more information, see <a href="http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html">Template Constraint Rules</a>.</p></dd></dl>
 */
@property (nonatomic, strong) NSString * _Nullable parameters;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The type of constraint.</p><ul><li><p><code>LAUNCH</code></p></li><li><p><code>NOTIFICATION</code></p></li><li><p><code>RESOURCE_UPDATE</code></p></li><li><p><code>STACKSET</code></p></li><li><p><code>TEMPLATE</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 
 */
@interface AWSServicecatalogCreateConstraintOutput : AWSModel


/**
 <p>Information about the constraint.</p>
 */
@property (nonatomic, strong) AWSServicecatalogConstraintDetail * _Nullable constraintDetail;

/**
 <p>The constraint parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable constraintParameters;

/**
 <p>The status of the current request.</p>
 */
@property (nonatomic, assign) AWSServicecatalogStatus status;

@end

/**
 
 */
@interface AWSServicecatalogCreatePortfolioInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The description of the portfolio.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name to use for display purposes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the idempotency token, the same response is returned for each repeated request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The name of the portfolio provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogCreatePortfolioOutput : AWSModel


/**
 <p>Information about the portfolio.</p>
 */
@property (nonatomic, strong) AWSServicecatalogPortfolioDetail * _Nullable portfolioDetail;

/**
 <p>Information about the tags associated with the portfolio.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogCreatePortfolioShareInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The AWS account ID. For example, <code>123456789012</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The organization node to whom you are going to share. If <code>OrganizationNode</code> is passed in, <code>PortfolioShare</code> will be created for the node and its children (when applies), and a <code>PortfolioShareToken</code> will be returned in the output in order for the administrator to monitor the status of the <code>PortfolioShare</code> creation process.</p>
 */
@property (nonatomic, strong) AWSServicecatalogOrganizationNode * _Nullable organizationNode;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

@end

/**
 
 */
@interface AWSServicecatalogCreatePortfolioShareOutput : AWSModel


/**
 <p>The portfolio share unique identifier. This will only be returned if portfolio is shared to an organization node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioShareToken;

@end

/**
 
 */
@interface AWSServicecatalogCreateProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The description of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The distributor of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable distributor;

/**
 <p>A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the idempotency token, the same response is returned for each repeated request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The name of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The owner of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The type of product.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProductType productType;

/**
 <p>The configuration of the provisioning artifact.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisioningArtifactProperties * _Nullable provisioningArtifactParameters;

/**
 <p>The support information about the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportDescription;

/**
 <p>The contact email for product support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportEmail;

/**
 <p>The contact URL for product support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportUrl;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogCreateProductOutput : AWSModel


/**
 <p>Information about the product view.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProductViewDetail * _Nullable productViewDetail;

/**
 <p>Information about the provisioning artifact.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisioningArtifactDetail * _Nullable provisioningArtifactDetail;

/**
 <p>Information about the tags associated with the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogCreateProvisionedProductPlanInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the idempotency token, the same response is returned for each repeated request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>Passed to CloudFormation. The SNS topic ARNs to which to publish stack-related events.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationArns;

/**
 <p>The path identifier of the product. This value is optional if the product has a default path, and required if the product has more than one path. To list the paths for a product, use <a>ListLaunchPaths</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathId;

/**
 <p>The name of the plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable planName;

/**
 <p>The plan type.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProvisionedProductPlanType planType;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>A user-friendly name for the provisioned product. This value must be unique for the AWS account and cannot be updated after the product is provisioned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductName;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>Parameters specified by the administrator that are required for provisioning the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogUpdateProvisioningParameter *> * _Nullable provisioningParameters;

/**
 <p>One or more tags.</p><p>If the plan is for an existing provisioned product, the product must have a <code>RESOURCE_UPDATE</code> constraint with <code>TagUpdatesOnProvisionedProduct</code> set to <code>ALLOWED</code> to allow tag updates.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogCreateProvisionedProductPlanOutput : AWSModel


/**
 <p>The plan identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable planId;

/**
 <p>The name of the plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable planName;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionProductId;

/**
 <p>The user-friendly name of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductName;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

@end

/**
 
 */
@interface AWSServicecatalogCreateProvisioningArtifactInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the idempotency token, the same response is returned for each repeated request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The configuration for the provisioning artifact.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisioningArtifactProperties * _Nullable parameters;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

@end

/**
 
 */
@interface AWSServicecatalogCreateProvisioningArtifactOutput : AWSModel


/**
 <p>The URL of the CloudFormation template in Amazon S3, in JSON format.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable info;

/**
 <p>Information about the provisioning artifact.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisioningArtifactDetail * _Nullable provisioningArtifactDetail;

/**
 <p>The status of the current request.</p>
 */
@property (nonatomic, assign) AWSServicecatalogStatus status;

@end

/**
 
 */
@interface AWSServicecatalogCreateServiceActionInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The self-service action definition. Can be one of the following:</p><dl><dt>Name</dt><dd><p>The name of the AWS Systems Manager document (SSM document). For example, <code>AWS-RestartEC2Instance</code>.</p><p>If you are using a shared SSM document, you must provide the ARN instead of the name.</p></dd><dt>Version</dt><dd><p>The AWS Systems Manager automation document version. For example, <code>"Version": "1"</code></p></dd><dt>AssumeRole</dt><dd><p>The Amazon Resource Name (ARN) of the role that performs the self-service actions on your behalf. For example, <code>"AssumeRole": "arn:aws:iam::12345678910:role/ActionRole"</code>.</p><p>To reuse the provisioned product launch role, set to <code>"AssumeRole": "LAUNCH_ROLE"</code>.</p></dd><dt>Parameters</dt><dd><p>The list of parameters in JSON format.</p><p>For example: <code>[{\"Name\":\"InstanceId\",\"Type\":\"TARGET\"}]</code> or <code>[{\"Name\":\"InstanceId\",\"Type\":\"TEXT_VALUE\"}]</code>.</p></dd></dl>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable definition;

/**
 <p>The service action definition type. For example, <code>SSM_AUTOMATION</code>.</p>
 */
@property (nonatomic, assign) AWSServicecatalogServiceActionDefinitionType definitionType;

/**
 <p>The self-service action description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the idempotency token, the same response is returned for each repeated request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The self-service action name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSServicecatalogCreateServiceActionOutput : AWSModel


/**
 <p>An object containing information about the self-service action.</p>
 */
@property (nonatomic, strong) AWSServicecatalogServiceActionDetail * _Nullable serviceActionDetail;

@end

/**
 
 */
@interface AWSServicecatalogCreateTagOptionInput : AWSRequest


/**
 <p>The TagOption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The TagOption value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSServicecatalogCreateTagOptionOutput : AWSModel


/**
 <p>Information about the TagOption.</p>
 */
@property (nonatomic, strong) AWSServicecatalogTagOptionDetail * _Nullable tagOptionDetail;

@end

/**
 
 */
@interface AWSServicecatalogDeleteConstraintInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The identifier of the constraint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDeleteConstraintOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDeletePortfolioInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDeletePortfolioOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDeletePortfolioShareInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The organization node to whom you are going to stop sharing.</p>
 */
@property (nonatomic, strong) AWSServicecatalogOrganizationNode * _Nullable organizationNode;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

@end

/**
 
 */
@interface AWSServicecatalogDeletePortfolioShareOutput : AWSModel


/**
 <p>The portfolio share unique identifier. This will only be returned if delete is made to an organization node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioShareToken;

@end

/**
 
 */
@interface AWSServicecatalogDeleteProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDeleteProductOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDeleteProvisionedProductPlanInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>If set to true, AWS Service Catalog stops managing the specified provisioned product even if it cannot delete the underlying resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ignoreErrors;

/**
 <p>The plan identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable planId;

@end

/**
 
 */
@interface AWSServicecatalogDeleteProvisionedProductPlanOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDeleteProvisioningArtifactInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

@end

/**
 
 */
@interface AWSServicecatalogDeleteProvisioningArtifactOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDeleteServiceActionInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The self-service action identifier. For example, <code>act-fs7abcd89wxyz</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDeleteServiceActionOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDeleteTagOptionInput : AWSRequest


/**
 <p>The TagOption identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDeleteTagOptionOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDescribeConstraintInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The identifier of the constraint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDescribeConstraintOutput : AWSModel


/**
 <p>Information about the constraint.</p>
 */
@property (nonatomic, strong) AWSServicecatalogConstraintDetail * _Nullable constraintDetail;

/**
 <p>The constraint parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable constraintParameters;

/**
 <p>The status of the current request.</p>
 */
@property (nonatomic, assign) AWSServicecatalogStatus status;

@end

/**
 
 */
@interface AWSServicecatalogDescribeCopyProductStatusInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The token for the copy product operation. This token is returned by <a>CopyProduct</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replicateProductToken;

@end

/**
 
 */
@interface AWSServicecatalogDescribeCopyProductStatusOutput : AWSModel


/**
 <p>The status of the copy product operation.</p>
 */
@property (nonatomic, assign) AWSServicecatalogReplicateProductStatus replicateProductStatus;

/**
 <p>The status message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusDetail;

/**
 <p>The identifier of the copied product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetProductId;

@end

/**
 
 */
@interface AWSServicecatalogDescribePortfolioInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDescribePortfolioOutput : AWSModel


/**
 <p>Information about the associated budgets.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogBudgetDetail *> * _Nullable budgets;

/**
 <p>Information about the portfolio.</p>
 */
@property (nonatomic, strong) AWSServicecatalogPortfolioDetail * _Nullable portfolioDetail;

/**
 <p>Information about the TagOptions associated with the portfolio.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTagOptionDetail *> * _Nullable tagOptions;

/**
 <p>Information about the tags associated with the portfolio.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogDescribePortfolioShareStatusInput : AWSRequest


/**
 <p>The token for the portfolio share operation. This token is returned either by CreatePortfolioShare or by DeletePortfolioShare.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioShareToken;

@end

/**
 
 */
@interface AWSServicecatalogDescribePortfolioShareStatusOutput : AWSModel


/**
 <p>Organization node identifier. It can be either account id, organizational unit id or organization id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationNodeValue;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>The token for the portfolio share operation. For example, <code>share-6v24abcdefghi</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioShareToken;

/**
 <p>Information about the portfolio share operation.</p>
 */
@property (nonatomic, strong) AWSServicecatalogShareDetails * _Nullable shareDetails;

/**
 <p>Status of the portfolio share operation.</p>
 */
@property (nonatomic, assign) AWSServicecatalogShareStatus status;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProductAsAdminInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The product name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProductAsAdminOutput : AWSModel


/**
 <p>Information about the associated budgets.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogBudgetDetail *> * _Nullable budgets;

/**
 <p>Information about the product view.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProductViewDetail * _Nullable productViewDetail;

/**
 <p>Information about the provisioning artifacts (also known as versions) for the specified product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProvisioningArtifactSummary *> * _Nullable provisioningArtifactSummaries;

/**
 <p>Information about the TagOptions associated with the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTagOptionDetail *> * _Nullable tagOptions;

/**
 <p>Information about the tags associated with the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The product name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProductOutput : AWSModel


/**
 <p>Information about the associated budgets.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogBudgetDetail *> * _Nullable budgets;

/**
 <p>Information about the associated launch paths.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogLaunchPath *> * _Nullable launchPaths;

/**
 <p>Summary information about the product view.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProductViewSummary * _Nullable productViewSummary;

/**
 <p>Information about the provisioning artifacts for the specified product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProvisioningArtifact *> * _Nullable provisioningArtifacts;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProductViewInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The product view identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProductViewOutput : AWSModel


/**
 <p>Summary information about the product.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProductViewSummary * _Nullable productViewSummary;

/**
 <p>Information about the provisioning artifacts for the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProvisioningArtifact *> * _Nullable provisioningArtifacts;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProvisionedProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The provisioned product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProvisionedProductOutput : AWSModel


/**
 <p>Any CloudWatch dashboards that were created when provisioning the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogCloudWatchDashboard *> * _Nullable cloudWatchDashboards;

/**
 <p>Information about the provisioned product.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisionedProductDetail * _Nullable provisionedProductDetail;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProvisionedProductPlanInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The plan identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable planId;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProvisionedProductPlanOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Information about the plan.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisionedProductPlanDetails * _Nullable provisionedProductPlanDetails;

/**
 <p>Information about the resource changes that will occur when the plan is executed.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogResourceChange *> * _Nullable resourceChanges;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProvisioningArtifactInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The product name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productName;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>The provisioning artifact name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactName;

/**
 <p>Indicates whether a verbose level of detail is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable verbose;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProvisioningArtifactOutput : AWSModel


/**
 <p>The URL of the CloudFormation template in Amazon S3.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable info;

/**
 <p>Information about the provisioning artifact.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisioningArtifactDetail * _Nullable provisioningArtifactDetail;

/**
 <p>The status of the current request.</p>
 */
@property (nonatomic, assign) AWSServicecatalogStatus status;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProvisioningParametersInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The path identifier of the product. This value is optional if the product has a default path, and required if the product has more than one path. To list the paths for a product, use <a>ListLaunchPaths</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathId;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

@end

/**
 
 */
@interface AWSServicecatalogDescribeProvisioningParametersOutput : AWSModel


/**
 <p>Information about the constraints used to provision the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogConstraintSummary *> * _Nullable constraintSummaries;

/**
 <p>Information about the parameters used to provision the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProvisioningArtifactParameter *> * _Nullable provisioningArtifactParameters;

/**
 <p>An object that contains information about preferences, such as regions and accounts, for the provisioning artifact.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisioningArtifactPreferences * _Nullable provisioningArtifactPreferences;

/**
 <p>Information about the TagOptions associated with the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTagOptionSummary *> * _Nullable tagOptions;

/**
 <p>Any additional metadata specifically related to the provisioning of the product. For example, see the <code>Version</code> field of the CloudFormation template.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogUsageInstruction *> * _Nullable usageInstructions;

@end

/**
 
 */
@interface AWSServicecatalogDescribeRecordInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The record identifier of the provisioned product. This identifier is returned by the request operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSServicecatalogDescribeRecordOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Information about the product.</p>
 */
@property (nonatomic, strong) AWSServicecatalogRecordDetail * _Nullable recordDetail;

/**
 <p>Information about the product created as the result of a request. For example, the output for a CloudFormation-backed product that creates an S3 bucket would include the S3 bucket URL.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogRecordOutput *> * _Nullable recordOutputs;

@end

/**
 
 */
@interface AWSServicecatalogDescribeServiceActionExecutionParametersInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The identifier of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductId;

/**
 <p>The self-service action identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceActionId;

@end

/**
 
 */
@interface AWSServicecatalogDescribeServiceActionExecutionParametersOutput : AWSModel


/**
 <p>The parameters of the self-service action.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogExecutionParameter *> * _Nullable serviceActionParameters;

@end

/**
 
 */
@interface AWSServicecatalogDescribeServiceActionInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The self-service action identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDescribeServiceActionOutput : AWSModel


/**
 <p>Detailed information about the self-service action.</p>
 */
@property (nonatomic, strong) AWSServicecatalogServiceActionDetail * _Nullable serviceActionDetail;

@end

/**
 
 */
@interface AWSServicecatalogDescribeTagOptionInput : AWSRequest


/**
 <p>The TagOption identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 
 */
@interface AWSServicecatalogDescribeTagOptionOutput : AWSModel


/**
 <p>Information about the TagOption.</p>
 */
@property (nonatomic, strong) AWSServicecatalogTagOptionDetail * _Nullable tagOptionDetail;

@end

/**
 
 */
@interface AWSServicecatalogDisableAWSOrganizationsAccessInput : AWSRequest


@end

/**
 
 */
@interface AWSServicecatalogDisableAWSOrganizationsAccessOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDisassociateBudgetFromResourceInput : AWSRequest


/**
 <p>The name of the budget you want to disassociate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable budgetName;

/**
 <p>The resource identifier you want to disassociate from. Either a portfolio-id or a product-id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSServicecatalogDisassociateBudgetFromResourceOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDisassociatePrincipalFromPortfolioInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>The ARN of the principal (IAM user, role, or group).</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalARN;

@end

/**
 
 */
@interface AWSServicecatalogDisassociatePrincipalFromPortfolioOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDisassociateProductFromPortfolioInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

@end

/**
 
 */
@interface AWSServicecatalogDisassociateProductFromPortfolioOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioning artifact. For example, <code>pa-4abcdjnxjj6ne</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>The self-service action identifier. For example, <code>act-fs7abcd89wxyz</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceActionId;

@end

/**
 
 */
@interface AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogDisassociateTagOptionFromResourceInput : AWSRequest


/**
 <p>The resource identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The TagOption identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagOptionId;

@end

/**
 
 */
@interface AWSServicecatalogDisassociateTagOptionFromResourceOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogEnableAWSOrganizationsAccessInput : AWSRequest


@end

/**
 
 */
@interface AWSServicecatalogEnableAWSOrganizationsAccessOutput : AWSModel


@end

/**
 
 */
@interface AWSServicecatalogExecuteProvisionedProductPlanInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the idempotency token, the same response is returned for each repeated request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The plan identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable planId;

@end

/**
 
 */
@interface AWSServicecatalogExecuteProvisionedProductPlanOutput : AWSModel


/**
 <p>Information about the result of provisioning the product.</p>
 */
@property (nonatomic, strong) AWSServicecatalogRecordDetail * _Nullable recordDetail;

@end

/**
 
 */
@interface AWSServicecatalogExecuteProvisionedProductServiceActionInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>An idempotency token that uniquely identifies the execute request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executeToken;

/**
 <p>A map of all self-service action parameters and their values. If a provided parameter is of a special type, such as <code>TARGET</code>, the provided value will override the default value generated by AWS Service Catalog. If the parameters field is not provided, no additional parameters are passed and default values will be used for any special parameters such as <code>TARGET</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable parameters;

/**
 <p>The identifier of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductId;

/**
 <p>The self-service action identifier. For example, <code>act-fs7abcd89wxyz</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceActionId;

@end

/**
 
 */
@interface AWSServicecatalogExecuteProvisionedProductServiceActionOutput : AWSModel


/**
 <p>An object containing detailed information about the result of provisioning the product.</p>
 */
@property (nonatomic, strong) AWSServicecatalogRecordDetail * _Nullable recordDetail;

@end

/**
 <p>Details of an execution parameter value that is passed to a self-service action when executed on a provisioned product.</p>
 */
@interface AWSServicecatalogExecutionParameter : AWSModel


/**
 <p>The default values for the execution parameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable defaultValues;

/**
 <p>The name of the execution parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The execution parameter type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>An object containing information about the error, along with identifying information about the self-service action and its associations.</p>
 */
@interface AWSServicecatalogFailedServiceActionAssociation : AWSModel


/**
 <p>The error code. Valid values are listed below.</p>
 */
@property (nonatomic, assign) AWSServicecatalogServiceActionAssociationErrorCode errorCode;

/**
 <p>A text description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioning artifact. For example, <code>pa-4abcdjnxjj6ne</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>The self-service action identifier. For example, <code>act-fs7abcd89wxyz</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceActionId;

@end

/**
 
 */
@interface AWSServicecatalogGetAWSOrganizationsAccessStatusInput : AWSRequest


@end

/**
 
 */
@interface AWSServicecatalogGetAWSOrganizationsAccessStatusOutput : AWSModel


/**
 <p>The status of the portfolio share feature.</p>
 */
@property (nonatomic, assign) AWSServicecatalogAccessStatus accessStatus;

@end

/**
 <p>A launch path object.</p>
 */
@interface AWSServicecatalogLaunchPath : AWSModel


/**
 <p>The identifier of the launch path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the launch path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Summary information about a product path for a user.</p>
 */
@interface AWSServicecatalogLaunchPathSummary : AWSModel


/**
 <p>The constraints on the portfolio-product relationship.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogConstraintSummary *> * _Nullable constraintSummaries;

/**
 <p>The identifier of the product path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the portfolio to which the user was assigned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags associated with this product path.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogListAcceptedPortfolioSharesInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The type of shared portfolios to list. The default is to list imported portfolios.</p><ul><li><p><code>AWS_ORGANIZATIONS</code> - List portfolios shared by the master account of your organization</p></li><li><p><code>AWS_SERVICECATALOG</code> - List default portfolios</p></li><li><p><code>IMPORTED</code> - List imported portfolios</p></li></ul>
 */
@property (nonatomic, assign) AWSServicecatalogPortfolioShareType portfolioShareType;

@end

/**
 
 */
@interface AWSServicecatalogListAcceptedPortfolioSharesOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Information about the portfolios.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogPortfolioDetail *> * _Nullable portfolioDetails;

@end

/**
 
 */
@interface AWSServicecatalogListBudgetsForResourceInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The resource identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSServicecatalogListBudgetsForResourceOutput : AWSModel


/**
 <p>Information about the associated budgets.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogBudgetDetail *> * _Nullable budgets;

/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSServicecatalogListConstraintsForPortfolioInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

@end

/**
 
 */
@interface AWSServicecatalogListConstraintsForPortfolioOutput : AWSModel


/**
 <p>Information about the constraints.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogConstraintDetail *> * _Nullable constraintDetails;

/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSServicecatalogListLaunchPathsInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

@end

/**
 
 */
@interface AWSServicecatalogListLaunchPathsOutput : AWSModel


/**
 <p>Information about the launch path.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogLaunchPathSummary *> * _Nullable launchPathSummaries;

/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSServicecatalogListOrganizationPortfolioAccessInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The organization node type that will be returned in the output.</p><ul><li><p><code>ORGANIZATION</code> - Organization that has access to the portfolio. </p></li><li><p><code>ORGANIZATIONAL_UNIT</code> - Organizational unit that has access to the portfolio within your organization.</p></li><li><p><code>ACCOUNT</code> - Account that has access to the portfolio within your organization.</p></li></ul>
 */
@property (nonatomic, assign) AWSServicecatalogOrganizationNodeType organizationNodeType;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The portfolio identifier. For example, <code>port-2abcdext3y5fk</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

@end

/**
 
 */
@interface AWSServicecatalogListOrganizationPortfolioAccessOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Displays information about the organization nodes.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogOrganizationNode *> * _Nullable organizationNodes;

@end

/**
 
 */
@interface AWSServicecatalogListPortfolioAccessInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The ID of an organization node the portfolio is shared with. All children of this node with an inherited portfolio share will be returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationParentId;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

@end

/**
 
 */
@interface AWSServicecatalogListPortfolioAccessOutput : AWSModel


/**
 <p>Information about the AWS accounts with access to the portfolio.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

@end

/**
 
 */
@interface AWSServicecatalogListPortfoliosForProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

@end

/**
 
 */
@interface AWSServicecatalogListPortfoliosForProductOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Information about the portfolios.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogPortfolioDetail *> * _Nullable portfolioDetails;

@end

/**
 
 */
@interface AWSServicecatalogListPortfoliosInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSServicecatalogListPortfoliosOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Information about the portfolios.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogPortfolioDetail *> * _Nullable portfolioDetails;

@end

/**
 
 */
@interface AWSServicecatalogListPrincipalsForPortfolioInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

@end

/**
 
 */
@interface AWSServicecatalogListPrincipalsForPortfolioOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The IAM principals (users or roles) associated with the portfolio.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogPrincipal *> * _Nullable principals;

@end

/**
 
 */
@interface AWSServicecatalogListProvisionedProductPlansInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The access level to use to obtain results. The default is <code>User</code>.</p>
 */
@property (nonatomic, strong) AWSServicecatalogAccessLevelFilter * _Nullable accessLevelFilter;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionProductId;

@end

/**
 
 */
@interface AWSServicecatalogListProvisionedProductPlansOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Information about the plans.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProvisionedProductPlanSummary *> * _Nullable provisionedProductPlans;

@end

/**
 
 */
@interface AWSServicecatalogListProvisioningArtifactsForServiceActionInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The self-service action identifier. For example, <code>act-fs7abcd89wxyz</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceActionId;

@end

/**
 
 */
@interface AWSServicecatalogListProvisioningArtifactsForServiceActionOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>An array of objects with information about product views and provisioning artifacts.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProvisioningArtifactView *> * _Nullable provisioningArtifactViews;

@end

/**
 
 */
@interface AWSServicecatalogListProvisioningArtifactsInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

@end

/**
 
 */
@interface AWSServicecatalogListProvisioningArtifactsOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Information about the provisioning artifacts.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProvisioningArtifactDetail *> * _Nullable provisioningArtifactDetails;

@end

/**
 
 */
@interface AWSServicecatalogListRecordHistoryInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The access level to use to obtain results. The default is <code>User</code>.</p>
 */
@property (nonatomic, strong) AWSServicecatalogAccessLevelFilter * _Nullable accessLevelFilter;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The search filter to scope the results.</p>
 */
@property (nonatomic, strong) AWSServicecatalogListRecordHistorySearchFilter * _Nullable searchFilter;

@end

/**
 
 */
@interface AWSServicecatalogListRecordHistoryOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The records, in reverse chronological order.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogRecordDetail *> * _Nullable recordDetails;

@end

/**
 <p>The search filter to use when listing history records.</p>
 */
@interface AWSServicecatalogListRecordHistorySearchFilter : AWSModel


/**
 <p>The filter key.</p><ul><li><p><code>product</code> - Filter results based on the specified product identifier.</p></li><li><p><code>provisionedproduct</code> - Filter results based on the provisioned product identifier.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The filter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSServicecatalogListResourcesForTagOptionInput : AWSRequest


/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The resource type.</p><ul><li><p><code>Portfolio</code></p></li><li><p><code>Product</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The TagOption identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tagOptionId;

@end

/**
 
 */
@interface AWSServicecatalogListResourcesForTagOptionOutput : AWSModel


/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>Information about the resources.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogResourceDetail *> * _Nullable resourceDetails;

@end

/**
 
 */
@interface AWSServicecatalogListServiceActionsForProvisioningArtifactInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioning artifact. For example, <code>pa-4abcdjnxjj6ne</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

@end

/**
 
 */
@interface AWSServicecatalogListServiceActionsForProvisioningArtifactOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>An object containing information about the self-service actions associated with the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogServiceActionSummary *> * _Nullable serviceActionSummaries;

@end

/**
 
 */
@interface AWSServicecatalogListServiceActionsInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSServicecatalogListServiceActionsOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>An object containing information about the service actions associated with the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogServiceActionSummary *> * _Nullable serviceActionSummaries;

@end

/**
 
 */
@interface AWSServicecatalogListStackInstancesForProvisionedProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The identifier of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductId;

@end

/**
 
 */
@interface AWSServicecatalogListStackInstancesForProvisionedProductOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>List of stack instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogStackInstance *> * _Nullable stackInstances;

@end

/**
 <p>Filters to use when listing TagOptions.</p>
 */
@interface AWSServicecatalogListTagOptionsFilters : AWSModel


/**
 <p>The active state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable active;

/**
 <p>The TagOption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The TagOption value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSServicecatalogListTagOptionsInput : AWSRequest


/**
 <p>The search filters. If no search filters are specified, the output includes all TagOptions.</p>
 */
@property (nonatomic, strong) AWSServicecatalogListTagOptionsFilters * _Nullable filters;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSServicecatalogListTagOptionsOutput : AWSModel


/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>Information about the TagOptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTagOptionDetail *> * _Nullable tagOptionDetails;

@end

/**
 <p>Information about the organization node.</p>
 */
@interface AWSServicecatalogOrganizationNode : AWSModel


/**
 <p>The organization node type.</p>
 */
@property (nonatomic, assign) AWSServicecatalogOrganizationNodeType types;

/**
 <p>The identifier of the organization node.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The constraints that the administrator has put on the parameter.</p>
 */
@interface AWSServicecatalogParameterConstraints : AWSModel


/**
 <p>The values that the administrator has allowed for the parameter.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedValues;

@end

/**
 <p>Information about a portfolio.</p>
 */
@interface AWSServicecatalogPortfolioDetail : AWSModel


/**
 <p>The ARN assigned to the portfolio.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The UTC time stamp of the creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The description of the portfolio.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name to use for display purposes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the portfolio provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

@end

/**
 <p>Information about a principal.</p>
 */
@interface AWSServicecatalogPrincipal : AWSModel


/**
 <p>The ARN of the principal (IAM user, role, or group).</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalARN;

/**
 <p>The principal type. The supported value is <code>IAM</code>.</p>
 */
@property (nonatomic, assign) AWSServicecatalogPrincipalType principalType;

@end

/**
 <p>A single product view aggregation value/count pair, containing metadata about each product to which the calling user has access.</p>
 */
@interface AWSServicecatalogProductViewAggregationValue : AWSModel


/**
 <p>An approximate count of the products that match the value.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable approximateCount;

/**
 <p>The value of the product view aggregation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about a product view.</p>
 */
@interface AWSServicecatalogProductViewDetail : AWSModel


/**
 <p>The UTC time stamp of the creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The ARN of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productARN;

/**
 <p>Summary information about the product view.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProductViewSummary * _Nullable productViewSummary;

/**
 <p>The status of the product.</p><ul><li><p><code>AVAILABLE</code> - The product is ready for use.</p></li><li><p><code>CREATING</code> - Product creation has started; the product is not ready for use.</p></li><li><p><code>FAILED</code> - An action failed.</p></li></ul>
 */
@property (nonatomic, assign) AWSServicecatalogStatus status;

@end

/**
 <p>Summary information about a product view.</p>
 */
@interface AWSServicecatalogProductViewSummary : AWSModel


/**
 <p>The distributor of the product. Contact the product administrator for the significance of this value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable distributor;

/**
 <p>Indicates whether the product has a default path. If the product does not have a default path, call <a>ListLaunchPaths</a> to disambiguate between paths. Otherwise, <a>ListLaunchPaths</a> is not required, and the output of <a>ProductViewSummary</a> can be used directly with <a>DescribeProvisioningParameters</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasDefaultPath;

/**
 <p>The product view identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The owner of the product. Contact the product administrator for the significance of this value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>Short description of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable shortDescription;

/**
 <p>The description of the support for this Product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportDescription;

/**
 <p>The email contact information to obtain support for this Product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportEmail;

/**
 <p>The URL information to obtain support for this Product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportUrl;

/**
 <p>The product type. Contact the product administrator for the significance of this value. If this value is <code>MARKETPLACE</code>, the product was created by AWS Marketplace.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProductType types;

@end

/**
 
 */
@interface AWSServicecatalogProvisionProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>Passed to CloudFormation. The SNS topic ARNs to which to publish stack-related events.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationArns;

/**
 <p>The path identifier of the product. This value is optional if the product has a default path, and required if the product has more than one path. To list the paths for a product, use <a>ListLaunchPaths</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathId;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>An idempotency token that uniquely identifies the provisioning request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionToken;

/**
 <p>A user-friendly name for the provisioned product. This value must be unique for the AWS account and cannot be updated after the product is provisioned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductName;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>Parameters specified by the administrator that are required for provisioning the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProvisioningParameter *> * _Nullable provisioningParameters;

/**
 <p>An object that contains information about the provisioning preferences for a stack set.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisioningPreferences * _Nullable provisioningPreferences;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogProvisionProductOutput : AWSModel


/**
 <p>Information about the result of provisioning the product.</p>
 */
@property (nonatomic, strong) AWSServicecatalogRecordDetail * _Nullable recordDetail;

@end

/**
 <p>Information about a provisioned product.</p>
 */
@interface AWSServicecatalogProvisionedProductAttribute : AWSModel


/**
 <p>The ARN of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The UTC time stamp of the creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The identifier of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the idempotency token, the same response is returned for each repeated request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The record identifier of the last request performed on this provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastRecordId;

/**
 <p>The user-friendly name of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The assigned identifier for the resource, such as an EC2 instance ID or an S3 bucket name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable physicalId;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>The current status of the provisioned product.</p><ul><li><p><code>AVAILABLE</code> - Stable state, ready to perform any operation. The most recent operation succeeded and completed.</p></li><li><p><code>UNDER_CHANGE</code> - Transitive state. Operations performed might not have valid results. Wait for an <code>AVAILABLE</code> status before performing operations.</p></li><li><p><code>TAINTED</code> - Stable state, ready to perform any operation. The stack has completed the requested operation but is not exactly what was requested. For example, a request to update to a new version failed and the stack rolled back to the current version.</p></li><li><p><code>ERROR</code> - An unexpected error occurred. The provisioned product exists but the stack is not running. For example, CloudFormation received a parameter value that was not valid and could not launch the stack.</p></li><li><p><code>PLAN_IN_PROGRESS</code> - Transitive state. The plan operations were performed to provision a new product, but resources have not yet been created. After reviewing the list of resources to be created, execute the plan. Wait for an <code>AVAILABLE</code> status before performing operations.</p></li></ul>
 */
@property (nonatomic, assign) AWSServicecatalogProvisionedProductStatus status;

/**
 <p>The current status message of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

/**
 <p>The type of provisioned product. The supported values are <code>CFN_STACK</code> and <code>CFN_STACKSET</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The Amazon Resource Name (ARN) of the IAM user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userArn;

/**
 <p>The ARN of the IAM user in the session. This ARN might contain a session ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userArnSession;

@end

/**
 <p>Information about a provisioned product.</p>
 */
@interface AWSServicecatalogProvisionedProductDetail : AWSModel


/**
 <p>The ARN of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The UTC time stamp of the creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The identifier of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A unique identifier that you provide to ensure idempotency. If multiple requests differ only by the idempotency token, the same response is returned for each repeated request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The record identifier of the last request performed on this provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastRecordId;

/**
 <p>The user-friendly name of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioning artifact. For example, <code>pa-4abcdjnxjj6ne</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>The current status of the provisioned product.</p><ul><li><p><code>AVAILABLE</code> - Stable state, ready to perform any operation. The most recent operation succeeded and completed.</p></li><li><p><code>UNDER_CHANGE</code> - Transitive state. Operations performed might not have valid results. Wait for an <code>AVAILABLE</code> status before performing operations.</p></li><li><p><code>TAINTED</code> - Stable state, ready to perform any operation. The stack has completed the requested operation but is not exactly what was requested. For example, a request to update to a new version failed and the stack rolled back to the current version.</p></li><li><p><code>ERROR</code> - An unexpected error occurred. The provisioned product exists but the stack is not running. For example, CloudFormation received a parameter value that was not valid and could not launch the stack.</p></li><li><p><code>PLAN_IN_PROGRESS</code> - Transitive state. The plan operations were performed to provision a new product, but resources have not yet been created. After reviewing the list of resources to be created, execute the plan. Wait for an <code>AVAILABLE</code> status before performing operations.</p></li></ul>
 */
@property (nonatomic, assign) AWSServicecatalogProvisionedProductStatus status;

/**
 <p>The current status message of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>The type of provisioned product. The supported values are <code>CFN_STACK</code> and <code>CFN_STACKSET</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>Information about a plan.</p>
 */
@interface AWSServicecatalogProvisionedProductPlanDetails : AWSModel


/**
 <p>The UTC time stamp of the creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>Passed to CloudFormation. The SNS topic ARNs to which to publish stack-related events.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notificationArns;

/**
 <p>The path identifier of the product. This value is optional if the product has a default path, and required if the product has more than one path. To list the paths for a product, use <a>ListLaunchPaths</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathId;

/**
 <p>The plan identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable planId;

/**
 <p>The name of the plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable planName;

/**
 <p>The plan type.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProvisionedProductPlanType planType;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionProductId;

/**
 <p>The user-friendly name of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionProductName;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>Parameters specified by the administrator that are required for provisioning the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogUpdateProvisioningParameter *> * _Nullable provisioningParameters;

/**
 <p>The status.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProvisionedProductPlanStatus status;

/**
 <p>The status message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

/**
 <p>The time when the plan was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedTime;

@end

/**
 <p>Summary information about a plan.</p>
 */
@interface AWSServicecatalogProvisionedProductPlanSummary : AWSModel


/**
 <p>The plan identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable planId;

/**
 <p>The name of the plan.</p>
 */
@property (nonatomic, strong) NSString * _Nullable planName;

/**
 <p>The plan type.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProvisionedProductPlanType planType;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionProductId;

/**
 <p>The user-friendly name of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionProductName;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

@end

/**
 <p>Information about a provisioning artifact. A provisioning artifact is also known as a product version.</p>
 */
@interface AWSServicecatalogProvisioningArtifact : AWSModel


/**
 <p>The UTC time stamp of the creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The description of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information set by the administrator to provide guidance to end users about which provisioning artifacts to use.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProvisioningArtifactGuidance guidance;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about a provisioning artifact (also known as a version) for a product.</p>
 */
@interface AWSServicecatalogProvisioningArtifactDetail : AWSModel


/**
 <p>Indicates whether the product version is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable active;

/**
 <p>The UTC time stamp of the creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The description of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information set by the administrator to provide guidance to end users about which provisioning artifacts to use.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProvisioningArtifactGuidance guidance;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of provisioning artifact.</p><ul><li><p><code>CLOUD_FORMATION_TEMPLATE</code> - AWS CloudFormation template</p></li><li><p><code>MARKETPLACE_AMI</code> - AWS Marketplace AMI</p></li><li><p><code>MARKETPLACE_CAR</code> - AWS Marketplace Clusters and AWS Resources</p></li></ul>
 */
@property (nonatomic, assign) AWSServicecatalogProvisioningArtifactType types;

@end

/**
 <p>Information about a parameter used to provision a product.</p>
 */
@interface AWSServicecatalogProvisioningArtifactParameter : AWSModel


/**
 <p>The default value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultValue;

/**
 <p>The description of the parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If this value is true, the value for this parameter is obfuscated from view when the parameter is retrieved. This parameter is used to hide sensitive information.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isNoEcho;

/**
 <p>Constraints that the administrator has put on a parameter.</p>
 */
@property (nonatomic, strong) AWSServicecatalogParameterConstraints * _Nullable parameterConstraints;

/**
 <p>The parameter key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterKey;

/**
 <p>The parameter type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parameterType;

@end

/**
 <p>The user-defined preferences that will be applied during product provisioning, unless overridden by <code>ProvisioningPreferences</code> or <code>UpdateProvisioningPreferences</code>.</p><p>For more information on maximum concurrent accounts and failure tolerance, see <a href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html#stackset-ops-options">Stack set operation options</a> in the <i>AWS CloudFormation User Guide</i>.</p>
 */
@interface AWSServicecatalogProvisioningArtifactPreferences : AWSModel


/**
 <p>One or more AWS accounts where stack instances are deployed from the stack set. These accounts can be scoped in <code>ProvisioningPreferences$StackSetAccounts</code> and <code>UpdateProvisioningPreferences$StackSetAccounts</code>.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stackSetAccounts;

/**
 <p>One or more AWS Regions where stack instances are deployed from the stack set. These regions can be scoped in <code>ProvisioningPreferences$StackSetRegions</code> and <code>UpdateProvisioningPreferences$StackSetRegions</code>.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stackSetRegions;

@end

/**
 <p>Information about a provisioning artifact (also known as a version) for a product.</p>
 Required parameters: [Info]
 */
@interface AWSServicecatalogProvisioningArtifactProperties : AWSModel


/**
 <p>The description of the provisioning artifact, including how it differs from the previous provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If set to true, AWS Service Catalog stops validating the specified provisioning artifact even if it is invalid.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableTemplateValidation;

/**
 <p>The URL of the CloudFormation template in Amazon S3. Specify the URL in JSON format as follows:</p><p><code>"LoadTemplateFromURL": "https://s3.amazonaws.com/cf-templates-ozkq9d3hgiq2-us-east-1/..."</code></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable info;

/**
 <p>The name of the provisioning artifact (for example, v1 v2beta). No spaces are allowed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of provisioning artifact.</p><ul><li><p><code>CLOUD_FORMATION_TEMPLATE</code> - AWS CloudFormation template</p></li><li><p><code>MARKETPLACE_AMI</code> - AWS Marketplace AMI</p></li><li><p><code>MARKETPLACE_CAR</code> - AWS Marketplace Clusters and AWS Resources</p></li></ul>
 */
@property (nonatomic, assign) AWSServicecatalogProvisioningArtifactType types;

@end

/**
 <p>Summary information about a provisioning artifact (also known as a version) for a product.</p>
 */
@interface AWSServicecatalogProvisioningArtifactSummary : AWSModel


/**
 <p>The UTC time stamp of the creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The description of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The metadata for the provisioning artifact. This is used with AWS Marketplace products.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable provisioningArtifactMetadata;

@end

/**
 <p>An object that contains summary information about a product view and a provisioning artifact.</p>
 */
@interface AWSServicecatalogProvisioningArtifactView : AWSModel


/**
 <p>Summary information about a product view.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProductViewSummary * _Nullable productViewSummary;

/**
 <p>Information about a provisioning artifact. A provisioning artifact is also known as a product version.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisioningArtifact * _Nullable provisioningArtifact;

@end

/**
 <p>Information about a parameter used to provision a product.</p>
 */
@interface AWSServicecatalogProvisioningParameter : AWSModel


/**
 <p>The parameter key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The parameter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The user-defined preferences that will be applied when updating a provisioned product. Not all preferences are applicable to all provisioned product types.</p>
 */
@interface AWSServicecatalogProvisioningPreferences : AWSModel


/**
 <p>One or more AWS accounts that will have access to the provisioned product.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>The AWS accounts specified should be within the list of accounts in the <code>STACKSET</code> constraint. To get the list of accounts in the <code>STACKSET</code> constraint, use the <code>DescribeProvisioningParameters</code> operation.</p><p>If no values are specified, the default value is all accounts from the <code>STACKSET</code> constraint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stackSetAccounts;

/**
 <p>The number of accounts, per region, for which this operation can fail before AWS Service Catalog stops the operation in that region. If the operation is stopped in a region, AWS Service Catalog doesn't attempt the operation in any subsequent regions.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>Conditional: You must specify either <code>StackSetFailureToleranceCount</code> or <code>StackSetFailureTolerancePercentage</code>, but not both.</p><p>The default value is <code>0</code> if no value is specified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stackSetFailureToleranceCount;

/**
 <p>The percentage of accounts, per region, for which this stack operation can fail before AWS Service Catalog stops the operation in that region. If the operation is stopped in a region, AWS Service Catalog doesn't attempt the operation in any subsequent regions.</p><p>When calculating the number of accounts based on the specified percentage, AWS Service Catalog rounds down to the next whole number.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>Conditional: You must specify either <code>StackSetFailureToleranceCount</code> or <code>StackSetFailureTolerancePercentage</code>, but not both.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stackSetFailureTolerancePercentage;

/**
 <p>The maximum number of accounts in which to perform this operation at one time. This is dependent on the value of <code>StackSetFailureToleranceCount</code>. <code>StackSetMaxConcurrentCount</code> is at most one more than the <code>StackSetFailureToleranceCount</code>.</p><p>Note that this setting lets you specify the maximum for operations. For large deployments, under certain circumstances the actual number of accounts acted upon concurrently may be lower due to service throttling.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>Conditional: You must specify either <code>StackSetMaxConcurrentCount</code> or <code>StackSetMaxConcurrentPercentage</code>, but not both.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stackSetMaxConcurrencyCount;

/**
 <p>The maximum percentage of accounts in which to perform this operation at one time.</p><p>When calculating the number of accounts based on the specified percentage, AWS Service Catalog rounds down to the next whole number. This is true except in cases where rounding down would result is zero. In this case, AWS Service Catalog sets the number as <code>1</code> instead.</p><p>Note that this setting lets you specify the maximum for operations. For large deployments, under certain circumstances the actual number of accounts acted upon concurrently may be lower due to service throttling.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>Conditional: You must specify either <code>StackSetMaxConcurrentCount</code> or <code>StackSetMaxConcurrentPercentage</code>, but not both.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stackSetMaxConcurrencyPercentage;

/**
 <p>One or more AWS Regions where the provisioned product will be available.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>The specified regions should be within the list of regions from the <code>STACKSET</code> constraint. To get the list of regions in the <code>STACKSET</code> constraint, use the <code>DescribeProvisioningParameters</code> operation.</p><p>If no values are specified, the default value is all regions from the <code>STACKSET</code> constraint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stackSetRegions;

@end

/**
 <p>Information about a request operation.</p>
 */
@interface AWSServicecatalogRecordDetail : AWSModel


/**
 <p>The UTC time stamp of the creation time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The path identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathId;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductId;

/**
 <p>The user-friendly name of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductName;

/**
 <p>The type of provisioned product. The supported values are <code>CFN_STACK</code> and <code>CFN_STACKSET</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductType;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>The errors that occurred.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogRecordError *> * _Nullable recordErrors;

/**
 <p>The identifier of the record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordId;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogRecordTag *> * _Nullable recordTags;

/**
 <p>The record type.</p><ul><li><p><code>PROVISION_PRODUCT</code></p></li><li><p><code>UPDATE_PROVISIONED_PRODUCT</code></p></li><li><p><code>TERMINATE_PROVISIONED_PRODUCT</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable recordType;

/**
 <p>The status of the provisioned product.</p><ul><li><p><code>CREATED</code> - The request was created but the operation has not started.</p></li><li><p><code>IN_PROGRESS</code> - The requested operation is in progress.</p></li><li><p><code>IN_PROGRESS_IN_ERROR</code> - The provisioned product is under change but the requested operation failed and some remediation is occurring. For example, a rollback.</p></li><li><p><code>SUCCEEDED</code> - The requested operation has successfully completed.</p></li><li><p><code>FAILED</code> - The requested operation has unsuccessfully completed. Investigate using the error messages returned.</p></li></ul>
 */
@property (nonatomic, assign) AWSServicecatalogRecordStatus status;

/**
 <p>The time when the record was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updatedTime;

@end

/**
 <p>The error code and description resulting from an operation.</p>
 */
@interface AWSServicecatalogRecordError : AWSModel


/**
 <p>The numeric value of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The description of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 <p>The output for the product created as the result of a request. For example, the output for a CloudFormation-backed product that creates an S3 bucket would include the S3 bucket URL.</p>
 */
@interface AWSServicecatalogRecordOutput : AWSModel


/**
 <p>The description of the output.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The output key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputKey;

/**
 <p>The output value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outputValue;

@end

/**
 <p>Information about a tag, which is a key-value pair.</p>
 */
@interface AWSServicecatalogRecordTag : AWSModel


/**
 <p>The key for this tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value for this tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSServicecatalogRejectPortfolioShareInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>The type of shared portfolios to reject. The default is to reject imported portfolios.</p><ul><li><p><code>AWS_ORGANIZATIONS</code> - Reject portfolios shared by the master account of your organization.</p></li><li><p><code>IMPORTED</code> - Reject imported portfolios.</p></li><li><p><code>AWS_SERVICECATALOG</code> - Not supported. (Throws ResourceNotFoundException.)</p></li></ul><p>For example, <code>aws servicecatalog reject-portfolio-share --portfolio-id "port-2qwzkwxt3y5fk" --portfolio-share-type AWS_ORGANIZATIONS</code></p>
 */
@property (nonatomic, assign) AWSServicecatalogPortfolioShareType portfolioShareType;

@end

/**
 
 */
@interface AWSServicecatalogRejectPortfolioShareOutput : AWSModel


@end

/**
 <p>Information about a resource change that will occur when a plan is executed.</p>
 */
@interface AWSServicecatalogResourceChange : AWSModel


/**
 <p>The change action.</p>
 */
@property (nonatomic, assign) AWSServicecatalogChangeAction action;

/**
 <p>Information about the resource changes.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogResourceChangeDetail *> * _Nullable details;

/**
 <p>The ID of the resource, as defined in the CloudFormation template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logicalResourceId;

/**
 <p>The ID of the resource, if it was already created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable physicalResourceId;

/**
 <p>If the change type is <code>Modify</code>, indicates whether the existing resource is deleted and replaced with a new one.</p>
 */
@property (nonatomic, assign) AWSServicecatalogReplacement replacement;

/**
 <p>The type of resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

/**
 <p>The change scope.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable scope;

@end

/**
 <p>Information about a change to a resource attribute.</p>
 */
@interface AWSServicecatalogResourceChangeDetail : AWSModel


/**
 <p>The ID of the entity that caused the change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable causingEntity;

/**
 <p>For static evaluations, the value of the resource attribute will change and the new value is known. For dynamic evaluations, the value might change, and any new value will be determined when the plan is updated.</p>
 */
@property (nonatomic, assign) AWSServicecatalogEvaluationType evaluation;

/**
 <p>Information about the resource attribute to be modified.</p>
 */
@property (nonatomic, strong) AWSServicecatalogResourceTargetDefinition * _Nullable target;

@end

/**
 <p>Information about a resource.</p>
 */
@interface AWSServicecatalogResourceDetail : AWSModel


/**
 <p>The ARN of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The creation time of the resource.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The description of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about a change to a resource attribute.</p>
 */
@interface AWSServicecatalogResourceTargetDefinition : AWSModel


/**
 <p>The attribute to be changed.</p>
 */
@property (nonatomic, assign) AWSServicecatalogResourceAttribute attribute;

/**
 <p>If the attribute is <code>Properties</code>, the value is the name of the property. Otherwise, the value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If the attribute is <code>Properties</code>, indicates whether a change to this property causes the resource to be re-created.</p>
 */
@property (nonatomic, assign) AWSServicecatalogRequiresRecreation requiresRecreation;

@end

/**
 
 */
@interface AWSServicecatalogScanProvisionedProductsInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The access level to use to obtain results. The default is <code>User</code>.</p>
 */
@property (nonatomic, strong) AWSServicecatalogAccessLevelFilter * _Nullable accessLevelFilter;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

@end

/**
 
 */
@interface AWSServicecatalogScanProvisionedProductsOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Information about the provisioned products.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProvisionedProductDetail *> * _Nullable provisionedProducts;

@end

/**
 
 */
@interface AWSServicecatalogSearchProductsAsAdminInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The search filters. If no search filters are specified, the output includes all products to which the administrator has access.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable filters;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portfolioId;

/**
 <p>Access level of the source of the product.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProductSource productSource;

/**
 <p>The sort field. If no value is specified, the results are not sorted.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProductViewSortBy sortBy;

/**
 <p>The sort order. If no value is specified, the results are not sorted.</p>
 */
@property (nonatomic, assign) AWSServicecatalogSortOrder sortOrder;

@end

/**
 
 */
@interface AWSServicecatalogSearchProductsAsAdminOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Information about the product views.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProductViewDetail *> * _Nullable productViewDetails;

@end

/**
 
 */
@interface AWSServicecatalogSearchProductsInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The search filters. If no search filters are specified, the output includes all products to which the caller has access.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable filters;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The sort field. If no value is specified, the results are not sorted.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProductViewSortBy sortBy;

/**
 <p>The sort order. If no value is specified, the results are not sorted.</p>
 */
@property (nonatomic, assign) AWSServicecatalogSortOrder sortOrder;

@end

/**
 
 */
@interface AWSServicecatalogSearchProductsOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>The product view aggregations.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<AWSServicecatalogProductViewAggregationValue *> *> * _Nullable productViewAggregations;

/**
 <p>Information about the product views.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProductViewSummary *> * _Nullable productViewSummaries;

@end

/**
 
 */
@interface AWSServicecatalogSearchProvisionedProductsInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The access level to use to obtain results. The default is <code>User</code>.</p>
 */
@property (nonatomic, strong) AWSServicecatalogAccessLevelFilter * _Nullable accessLevelFilter;

/**
 <p>The search filters.</p><p>When the key is <code>SearchQuery</code>, the searchable fields are <code>arn</code>, <code>createdTime</code>, <code>id</code>, <code>lastRecordId</code>, <code>idempotencyToken</code>, <code>name</code>, <code>physicalId</code>, <code>productId</code>, <code>provisioningArtifact</code>, <code>type</code>, <code>status</code>, <code>tags</code>, <code>userArn</code>, and <code>userArnSession</code>.</p><p>Example: <code>"SearchQuery":["status:AVAILABLE"]</code></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable filters;

/**
 <p>The maximum number of items to return with this call.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The page token for the next set of results. To retrieve the first set of results, use null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pageToken;

/**
 <p>The sort field. If no value is specified, the results are not sorted. The valid values are <code>arn</code>, <code>id</code>, <code>name</code>, and <code>lastRecordId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sortBy;

/**
 <p>The sort order. If no value is specified, the results are not sorted.</p>
 */
@property (nonatomic, assign) AWSServicecatalogSortOrder sortOrder;

@end

/**
 
 */
@interface AWSServicecatalogSearchProvisionedProductsOutput : AWSModel


/**
 <p>The page token to use to retrieve the next set of results. If there are no additional results, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Information about the provisioned products.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogProvisionedProductAttribute *> * _Nullable provisionedProducts;

/**
 <p>The number of provisioned products found.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalResultsCount;

@end

/**
 <p>A self-service action association consisting of the Action ID, the Product ID, and the Provisioning Artifact ID.</p>
 Required parameters: [ServiceActionId, ProductId, ProvisioningArtifactId]
 */
@interface AWSServicecatalogServiceActionAssociation : AWSModel


/**
 <p>The product identifier. For example, <code>prod-abcdzk7xy33qa</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioning artifact. For example, <code>pa-4abcdjnxjj6ne</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>The self-service action identifier. For example, <code>act-fs7abcd89wxyz</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceActionId;

@end

/**
 <p>An object containing detailed information about the self-service action.</p>
 */
@interface AWSServicecatalogServiceActionDetail : AWSModel


/**
 <p>A map that defines the self-service action.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable definition;

/**
 <p>Summary information about the self-service action.</p>
 */
@property (nonatomic, strong) AWSServicecatalogServiceActionSummary * _Nullable serviceActionSummary;

@end

/**
 <p>Detailed information about the self-service action.</p>
 */
@interface AWSServicecatalogServiceActionSummary : AWSModel


/**
 <p>The self-service action definition type. For example, <code>SSM_AUTOMATION</code>.</p>
 */
@property (nonatomic, assign) AWSServicecatalogServiceActionDefinitionType definitionType;

/**
 <p>The self-service action description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The self-service action identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The self-service action name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Information about the portfolio share operation.</p>
 */
@interface AWSServicecatalogShareDetails : AWSModel


/**
 <p>List of errors.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogShareError *> * _Nullable shareErrors;

/**
 <p>List of accounts for whom the operation succeeded.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable successfulShares;

@end

/**
 <p>Errors that occurred during the portfolio share operation.</p>
 */
@interface AWSServicecatalogShareError : AWSModel


/**
 <p>List of accounts impacted by the error.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accounts;

/**
 <p>Error type that happened when processing the operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable error;

/**
 <p>Information about the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>An AWS CloudFormation stack, in a specific account and region, that's part of a stack set operation. A stack instance is a reference to an attempted or actual stack in a given account within a given region. A stack instance can exist without a stack—for example, if the stack couldn't be created for some reason. A stack instance is associated with only one stack set. Each stack instance contains the ID of its associated stack set, as well as the ID of the actual stack and the stack status. </p>
 */
@interface AWSServicecatalogStackInstance : AWSModel


/**
 <p>The name of the AWS account that the stack instance is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable account;

/**
 <p>The name of the AWS region that the stack instance is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The status of the stack instance, in terms of its synchronization with its associated stack set. </p><ul><li><p><code>INOPERABLE</code>: A <code>DeleteStackInstances</code> operation has failed and left the stack in an unstable state. Stacks in this state are excluded from further <code>UpdateStackSet</code> operations. You might need to perform a <code>DeleteStackInstances</code> operation, with <code>RetainStacks</code> set to true, to delete the stack instance, and then delete the stack manually. </p></li><li><p><code>OUTDATED</code>: The stack isn't currently up to date with the stack set because either the associated stack failed during a <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation, or the stack was part of a <code>CreateStackSet</code> or <code>UpdateStackSet</code> operation that failed or was stopped before the stack was created or updated.</p></li><li><p><code>CURRENT</code>: The stack is currently up to date with the stack set.</p></li></ul>
 */
@property (nonatomic, assign) AWSServicecatalogStackInstanceStatus stackInstanceStatus;

@end

/**
 <p>Information about a tag. A tag is a key-value pair. Tags are propagated to the resources created when provisioning a product.</p>
 Required parameters: [Key, Value]
 */
@interface AWSServicecatalogTag : AWSModel


/**
 <p>The tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value for this key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Information about a TagOption.</p>
 */
@interface AWSServicecatalogTagOptionDetail : AWSModel


/**
 <p>The TagOption active state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable active;

/**
 <p>The TagOption identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The TagOption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The TagOption value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Summary information about a TagOption.</p>
 */
@interface AWSServicecatalogTagOptionSummary : AWSModel


/**
 <p>The TagOption key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The TagOption value.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSServicecatalogTerminateProvisionedProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>If set to true, AWS Service Catalog stops managing the specified provisioned product even if it cannot delete the underlying resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ignoreErrors;

/**
 <p>The identifier of the provisioned product. You cannot specify both <code>ProvisionedProductName</code> and <code>ProvisionedProductId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductId;

/**
 <p>The name of the provisioned product. You cannot specify both <code>ProvisionedProductName</code> and <code>ProvisionedProductId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductName;

/**
 <p>An idempotency token that uniquely identifies the termination request. This token is only valid during the termination process. After the provisioned product is terminated, subsequent requests to terminate the same provisioned product always return <b>ResourceNotFound</b>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable terminateToken;

@end

/**
 
 */
@interface AWSServicecatalogTerminateProvisionedProductOutput : AWSModel


/**
 <p>Information about the result of this request.</p>
 */
@property (nonatomic, strong) AWSServicecatalogRecordDetail * _Nullable recordDetail;

@end

/**
 
 */
@interface AWSServicecatalogUpdateConstraintInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The updated description of the constraint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the constraint.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The constraint parameters, in JSON format. The syntax depends on the constraint type as follows:</p><dl><dt>LAUNCH</dt><dd><p>You are required to specify either the <code>RoleArn</code> or the <code>LocalRoleName</code> but can't use both.</p><p>Specify the <code>RoleArn</code> property as follows:</p><p><code>{"RoleArn" : "arn:aws:iam::123456789012:role/LaunchRole"}</code></p><p>Specify the <code>LocalRoleName</code> property as follows:</p><p><code>{"LocalRoleName": "SCBasicLaunchRole"}</code></p><p>If you specify the <code>LocalRoleName</code> property, when an account uses the launch constraint, the IAM role with that name in the account will be used. This allows launch-role constraints to be account-agnostic so the administrator can create fewer resources per shared account.</p><note><p>The given role name must exist in the account used to create the launch constraint and the account of the user who launches a product with this launch constraint.</p></note><p>You cannot have both a <code>LAUNCH</code> and a <code>STACKSET</code> constraint.</p><p>You also cannot have more than one <code>LAUNCH</code> constraint on a product and portfolio.</p></dd><dt>NOTIFICATION</dt><dd><p>Specify the <code>NotificationArns</code> property as follows:</p><p><code>{"NotificationArns" : ["arn:aws:sns:us-east-1:123456789012:Topic"]}</code></p></dd><dt>RESOURCE_UPDATE</dt><dd><p>Specify the <code>TagUpdatesOnProvisionedProduct</code> property as follows:</p><p><code>{"Version":"2.0","Properties":{"TagUpdateOnProvisionedProduct":"String"}}</code></p><p>The <code>TagUpdatesOnProvisionedProduct</code> property accepts a string value of <code>ALLOWED</code> or <code>NOT_ALLOWED</code>.</p></dd><dt>STACKSET</dt><dd><p>Specify the <code>Parameters</code> property as follows:</p><p><code>{"Version": "String", "Properties": {"AccountList": [ "String" ], "RegionList": [ "String" ], "AdminRole": "String", "ExecutionRole": "String"}}</code></p><p>You cannot have both a <code>LAUNCH</code> and a <code>STACKSET</code> constraint.</p><p>You also cannot have more than one <code>STACKSET</code> constraint on a product and portfolio.</p><p>Products with a <code>STACKSET</code> constraint will launch an AWS CloudFormation stack set.</p></dd><dt>TEMPLATE</dt><dd><p>Specify the <code>Rules</code> property. For more information, see <a href="http://docs.aws.amazon.com/servicecatalog/latest/adminguide/reference-template_constraint_rules.html">Template Constraint Rules</a>.</p></dd></dl>
 */
@property (nonatomic, strong) NSString * _Nullable parameters;

@end

/**
 
 */
@interface AWSServicecatalogUpdateConstraintOutput : AWSModel


/**
 <p>Information about the constraint.</p>
 */
@property (nonatomic, strong) AWSServicecatalogConstraintDetail * _Nullable constraintDetail;

/**
 <p>The constraint parameters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable constraintParameters;

/**
 <p>The status of the current request.</p>
 */
@property (nonatomic, assign) AWSServicecatalogStatus status;

@end

/**
 
 */
@interface AWSServicecatalogUpdatePortfolioInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The tags to add.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable addTags;

/**
 <p>The updated description of the portfolio.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name to use for display purposes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The portfolio identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The updated name of the portfolio provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The tags to remove.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable removeTags;

@end

/**
 
 */
@interface AWSServicecatalogUpdatePortfolioOutput : AWSModel


/**
 <p>Information about the portfolio.</p>
 */
@property (nonatomic, strong) AWSServicecatalogPortfolioDetail * _Nullable portfolioDetail;

/**
 <p>Information about the tags associated with the portfolio.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogUpdateProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The tags to add to the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable addTags;

/**
 <p>The updated description of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The updated distributor of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable distributor;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The updated product name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The updated owner of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owner;

/**
 <p>The tags to remove from the product.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable removeTags;

/**
 <p>The updated support description for the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportDescription;

/**
 <p>The updated support email for the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportEmail;

/**
 <p>The updated support URL for the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable supportUrl;

@end

/**
 
 */
@interface AWSServicecatalogUpdateProductOutput : AWSModel


/**
 <p>Information about the product view.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProductViewDetail * _Nullable productViewDetail;

/**
 <p>Information about the tags associated with the product.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSServicecatalogUpdateProvisionedProductInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The new path identifier. This value is optional if the product has a default path, and required if the product has more than one path.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathId;

/**
 <p>The identifier of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioned product. You cannot specify both <code>ProvisionedProductName</code> and <code>ProvisionedProductId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductId;

/**
 <p>The name of the provisioned product. You cannot specify both <code>ProvisionedProductName</code> and <code>ProvisionedProductId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductName;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

/**
 <p>The new parameters.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogUpdateProvisioningParameter *> * _Nullable provisioningParameters;

/**
 <p>An object that contains information about the provisioning preferences for a stack set.</p>
 */
@property (nonatomic, strong) AWSServicecatalogUpdateProvisioningPreferences * _Nullable provisioningPreferences;

/**
 <p>One or more tags. Requires the product to have <code>RESOURCE_UPDATE</code> constraint with <code>TagUpdatesOnProvisionedProduct</code> set to <code>ALLOWED</code> to allow tag updates.</p>
 */
@property (nonatomic, strong) NSArray<AWSServicecatalogTag *> * _Nullable tags;

/**
 <p>The idempotency token that uniquely identifies the provisioning update request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updateToken;

@end

/**
 
 */
@interface AWSServicecatalogUpdateProvisionedProductOutput : AWSModel


/**
 <p>Information about the result of the request.</p>
 */
@property (nonatomic, strong) AWSServicecatalogRecordDetail * _Nullable recordDetail;

@end

/**
 
 */
@interface AWSServicecatalogUpdateProvisionedProductPropertiesInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>The idempotency token that uniquely identifies the provisioning product update request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idempotencyToken;

/**
 <p>The identifier of the provisioned product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductId;

/**
 <p>A map that contains the provisioned product properties to be updated.</p><p>The <code>OWNER</code> key accepts user ARNs and role ARNs. The owner is the user that is allowed to see, update, terminate, and execute service actions in the provisioned product.</p><p>The administrator can change the owner of a provisioned product to another IAM user within the same account. Both end user owners and administrators can see ownership history of the provisioned product using the <code>ListRecordHistory</code> API. The new owner can describe all past records for the provisioned product using the <code>DescribeRecord</code> API. The previous owner can no longer use <code>DescribeRecord</code>, but can still see the product's history from when he was an owner using <code>ListRecordHistory</code>.</p><p>If a provisioned product ownership is assigned to an end user, they can see and perform any action through the API or Service Catalog console such as update, terminate, and execute service actions. If an end user provisions a product and the owner is updated to someone else, they will no longer be able to see or perform any actions through API or the Service Catalog console on that provisioned product.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable provisionedProductProperties;

@end

/**
 
 */
@interface AWSServicecatalogUpdateProvisionedProductPropertiesOutput : AWSModel


/**
 <p>The provisioned product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisionedProductId;

/**
 <p>A map that contains the properties updated.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable provisionedProductProperties;

/**
 <p>The identifier of the record.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recordId;

/**
 <p>The status of the request.</p>
 */
@property (nonatomic, assign) AWSServicecatalogRecordStatus status;

@end

/**
 
 */
@interface AWSServicecatalogUpdateProvisioningArtifactInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>Indicates whether the product version is active.</p><p>Inactive provisioning artifacts are invisible to end users. End users cannot launch or update a provisioned product from an inactive provisioning artifact.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable active;

/**
 <p>The updated description of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information set by the administrator to provide guidance to end users about which provisioning artifacts to use.</p><p>The <code>DEFAULT</code> value indicates that the product version is active.</p><p>The administrator can set the guidance to <code>DEPRECATED</code> to inform users that the product version is deprecated. Users are able to make updates to a provisioned product of a deprecated version but cannot launch new provisioned products using a deprecated version.</p>
 */
@property (nonatomic, assign) AWSServicecatalogProvisioningArtifactGuidance guidance;

/**
 <p>The updated name of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The product identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productId;

/**
 <p>The identifier of the provisioning artifact.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provisioningArtifactId;

@end

/**
 
 */
@interface AWSServicecatalogUpdateProvisioningArtifactOutput : AWSModel


/**
 <p>The URL of the CloudFormation template in Amazon S3.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable info;

/**
 <p>Information about the provisioning artifact.</p>
 */
@property (nonatomic, strong) AWSServicecatalogProvisioningArtifactDetail * _Nullable provisioningArtifactDetail;

/**
 <p>The status of the current request.</p>
 */
@property (nonatomic, assign) AWSServicecatalogStatus status;

@end

/**
 <p>The parameter key-value pair used to update a provisioned product.</p>
 */
@interface AWSServicecatalogUpdateProvisioningParameter : AWSModel


/**
 <p>The parameter key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>If set to true, <code>Value</code> is ignored and the previous parameter value is kept.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usePreviousValue;

/**
 <p>The parameter value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>The user-defined preferences that will be applied when updating a provisioned product. Not all preferences are applicable to all provisioned product types.</p>
 */
@interface AWSServicecatalogUpdateProvisioningPreferences : AWSModel


/**
 <p>One or more AWS accounts that will have access to the provisioned product.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>The AWS accounts specified should be within the list of accounts in the <code>STACKSET</code> constraint. To get the list of accounts in the <code>STACKSET</code> constraint, use the <code>DescribeProvisioningParameters</code> operation.</p><p>If no values are specified, the default value is all accounts from the <code>STACKSET</code> constraint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stackSetAccounts;

/**
 <p>The number of accounts, per region, for which this operation can fail before AWS Service Catalog stops the operation in that region. If the operation is stopped in a region, AWS Service Catalog doesn't attempt the operation in any subsequent regions.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>Conditional: You must specify either <code>StackSetFailureToleranceCount</code> or <code>StackSetFailureTolerancePercentage</code>, but not both.</p><p>The default value is <code>0</code> if no value is specified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stackSetFailureToleranceCount;

/**
 <p>The percentage of accounts, per region, for which this stack operation can fail before AWS Service Catalog stops the operation in that region. If the operation is stopped in a region, AWS Service Catalog doesn't attempt the operation in any subsequent regions.</p><p>When calculating the number of accounts based on the specified percentage, AWS Service Catalog rounds down to the next whole number.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>Conditional: You must specify either <code>StackSetFailureToleranceCount</code> or <code>StackSetFailureTolerancePercentage</code>, but not both.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stackSetFailureTolerancePercentage;

/**
 <p>The maximum number of accounts in which to perform this operation at one time. This is dependent on the value of <code>StackSetFailureToleranceCount</code>. <code>StackSetMaxConcurrentCount</code> is at most one more than the <code>StackSetFailureToleranceCount</code>.</p><p>Note that this setting lets you specify the maximum for operations. For large deployments, under certain circumstances the actual number of accounts acted upon concurrently may be lower due to service throttling.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>Conditional: You must specify either <code>StackSetMaxConcurrentCount</code> or <code>StackSetMaxConcurrentPercentage</code>, but not both.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stackSetMaxConcurrencyCount;

/**
 <p>The maximum percentage of accounts in which to perform this operation at one time.</p><p>When calculating the number of accounts based on the specified percentage, AWS Service Catalog rounds down to the next whole number. This is true except in cases where rounding down would result is zero. In this case, AWS Service Catalog sets the number as <code>1</code> instead.</p><p>Note that this setting lets you specify the maximum for operations. For large deployments, under certain circumstances the actual number of accounts acted upon concurrently may be lower due to service throttling.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>Conditional: You must specify either <code>StackSetMaxConcurrentCount</code> or <code>StackSetMaxConcurrentPercentage</code>, but not both.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable stackSetMaxConcurrencyPercentage;

/**
 <p>Determines what action AWS Service Catalog performs to a stack set or a stack instance represented by the provisioned product. The default value is <code>UPDATE</code> if nothing is specified.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><dl><dt>CREATE</dt><dd><p>Creates a new stack instance in the stack set represented by the provisioned product. In this case, only new stack instances are created based on accounts and regions; if new ProductId or ProvisioningArtifactID are passed, they will be ignored.</p></dd><dt>UPDATE</dt><dd><p>Updates the stack set represented by the provisioned product and also its stack instances.</p></dd><dt>DELETE</dt><dd><p>Deletes a stack instance in the stack set represented by the provisioned product.</p></dd></dl>
 */
@property (nonatomic, assign) AWSServicecatalogStackSetOperationType stackSetOperationType;

/**
 <p>One or more AWS Regions where the provisioned product will be available.</p><p>Applicable only to a <code>CFN_STACKSET</code> provisioned product type.</p><p>The specified regions should be within the list of regions from the <code>STACKSET</code> constraint. To get the list of regions in the <code>STACKSET</code> constraint, use the <code>DescribeProvisioningParameters</code> operation.</p><p>If no values are specified, the default value is all regions from the <code>STACKSET</code> constraint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable stackSetRegions;

@end

/**
 
 */
@interface AWSServicecatalogUpdateServiceActionInput : AWSRequest


/**
 <p>The language code.</p><ul><li><p><code>en</code> - English (default)</p></li><li><p><code>jp</code> - Japanese</p></li><li><p><code>zh</code> - Chinese</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/**
 <p>A map that defines the self-service action.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable definition;

/**
 <p>The self-service action description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The self-service action identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The self-service action name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSServicecatalogUpdateServiceActionOutput : AWSModel


/**
 <p>Detailed information about the self-service action.</p>
 */
@property (nonatomic, strong) AWSServicecatalogServiceActionDetail * _Nullable serviceActionDetail;

@end

/**
 
 */
@interface AWSServicecatalogUpdateTagOptionInput : AWSRequest


/**
 <p>The updated active state.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable active;

/**
 <p>The TagOption identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The updated value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSServicecatalogUpdateTagOptionOutput : AWSModel


/**
 <p>Information about the TagOption.</p>
 */
@property (nonatomic, strong) AWSServicecatalogTagOptionDetail * _Nullable tagOptionDetail;

@end

/**
 <p>Additional information provided by the administrator.</p>
 */
@interface AWSServicecatalogUsageInstruction : AWSModel


/**
 <p>The usage instruction type for the value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The usage instruction value for this type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

NS_ASSUME_NONNULL_END
