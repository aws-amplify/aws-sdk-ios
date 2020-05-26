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

FOUNDATION_EXPORT NSString *const AWSMacieErrorDomain;

typedef NS_ENUM(NSInteger, AWSMacieErrorType) {
    AWSMacieErrorUnknown,
    AWSMacieErrorAccessDenied,
    AWSMacieErrorInternal,
    AWSMacieErrorInvalidInput,
    AWSMacieErrorLimitExceeded,
};

typedef NS_ENUM(NSInteger, AWSMacieS3ContinuousClassificationType) {
    AWSMacieS3ContinuousClassificationTypeUnknown,
    AWSMacieS3ContinuousClassificationTypeFull,
};

typedef NS_ENUM(NSInteger, AWSMacieS3OneTimeClassificationType) {
    AWSMacieS3OneTimeClassificationTypeUnknown,
    AWSMacieS3OneTimeClassificationTypeFull,
    AWSMacieS3OneTimeClassificationTypeNone,
};

@class AWSMacieAssociateMemberAccountRequest;
@class AWSMacieAssociateS3ResourcesRequest;
@class AWSMacieAssociateS3ResourcesResult;
@class AWSMacieClassificationType;
@class AWSMacieClassificationTypeUpdate;
@class AWSMacieDisassociateMemberAccountRequest;
@class AWSMacieDisassociateS3ResourcesRequest;
@class AWSMacieDisassociateS3ResourcesResult;
@class AWSMacieFailedS3Resource;
@class AWSMacieListMemberAccountsRequest;
@class AWSMacieListMemberAccountsResult;
@class AWSMacieListS3ResourcesRequest;
@class AWSMacieListS3ResourcesResult;
@class AWSMacieMemberAccount;
@class AWSMacieS3Resource;
@class AWSMacieS3ResourceClassification;
@class AWSMacieS3ResourceClassificationUpdate;
@class AWSMacieUpdateS3ResourcesRequest;
@class AWSMacieUpdateS3ResourcesResult;

/**
 
 */
@interface AWSMacieAssociateMemberAccountRequest : AWSRequest


/**
 <p>The ID of the AWS account that you want to associate with Amazon Macie Classic as a member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberAccountId;

@end

/**
 
 */
@interface AWSMacieAssociateS3ResourcesRequest : AWSRequest


/**
 <p>The ID of the Amazon Macie Classic member account whose resources you want to associate with Macie Classic. </p>
 */
@property (nonatomic, strong) NSString * _Nullable memberAccountId;

/**
 <p>The S3 resources that you want to associate with Amazon Macie Classic for monitoring and data classification. </p>
 */
@property (nonatomic, strong) NSArray<AWSMacieS3ResourceClassification *> * _Nullable s3Resources;

@end

/**
 
 */
@interface AWSMacieAssociateS3ResourcesResult : AWSModel


/**
 <p>S3 resources that couldn't be associated with Amazon Macie Classic. An error code and an error message are provided for each failed item. </p>
 */
@property (nonatomic, strong) NSArray<AWSMacieFailedS3Resource *> * _Nullable failedS3Resources;

@end

/**
 <p>The classification type that Amazon Macie Classic applies to the associated S3 resources. </p>
 Required parameters: [oneTime, continuous]
 */
@interface AWSMacieClassificationType : AWSModel


/**
 <p>A continuous classification of the objects that are added to a specified S3 bucket. Amazon Macie Classic begins performing continuous classification after a bucket is successfully associated with Amazon Macie Classic. </p>
 */
@property (nonatomic, assign) AWSMacieS3ContinuousClassificationType continuous;

/**
 <p>A one-time classification of all of the existing objects in a specified S3 bucket. </p>
 */
@property (nonatomic, assign) AWSMacieS3OneTimeClassificationType oneTime;

@end

/**
 <p>The classification type that Amazon Macie Classic applies to the associated S3 resources. At least one of the classification types (oneTime or continuous) must be specified. </p>
 */
@interface AWSMacieClassificationTypeUpdate : AWSModel


/**
 <p>A continuous classification of the objects that are added to a specified S3 bucket. Amazon Macie Classic begins performing continuous classification after a bucket is successfully associated with Amazon Macie Classic. </p>
 */
@property (nonatomic, assign) AWSMacieS3ContinuousClassificationType continuous;

/**
 <p>A one-time classification of all of the existing objects in a specified S3 bucket. </p>
 */
@property (nonatomic, assign) AWSMacieS3OneTimeClassificationType oneTime;

@end

/**
 
 */
@interface AWSMacieDisassociateMemberAccountRequest : AWSRequest


/**
 <p>The ID of the member account that you want to remove from Amazon Macie Classic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable memberAccountId;

@end

/**
 
 */
@interface AWSMacieDisassociateS3ResourcesRequest : AWSRequest


/**
 <p>The S3 resources (buckets or prefixes) that you want to remove from being monitored and classified by Amazon Macie Classic. </p>
 */
@property (nonatomic, strong) NSArray<AWSMacieS3Resource *> * _Nullable associatedS3Resources;

/**
 <p>The ID of the Amazon Macie Classic member account whose resources you want to remove from being monitored by Amazon Macie Classic. </p>
 */
@property (nonatomic, strong) NSString * _Nullable memberAccountId;

@end

/**
 
 */
@interface AWSMacieDisassociateS3ResourcesResult : AWSModel


/**
 <p>S3 resources that couldn't be removed from being monitored and classified by Amazon Macie Classic. An error code and an error message are provided for each failed item. </p>
 */
@property (nonatomic, strong) NSArray<AWSMacieFailedS3Resource *> * _Nullable failedS3Resources;

@end

/**
 <p>Includes details about the failed S3 resources.</p>
 */
@interface AWSMacieFailedS3Resource : AWSModel


/**
 <p>The status code of a failed item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorCode;

/**
 <p>The error message of a failed item.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The failed S3 resources.</p>
 */
@property (nonatomic, strong) AWSMacieS3Resource * _Nullable failedItem;

@end

/**
 
 */
@interface AWSMacieListMemberAccountsRequest : AWSRequest


/**
 <p>Use this parameter to indicate the maximum number of items that you want in the response. The default value is 250. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Use this parameter when paginating results. Set the value of this parameter to null on your first call to the ListMemberAccounts action. Subsequent calls to the action fill nextToken in the request with the value of nextToken from the previous response to continue listing data. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSMacieListMemberAccountsResult : AWSModel


/**
 <p>A list of the Amazon Macie Classic member accounts returned by the action. The current master account is also included in this list. </p>
 */
@property (nonatomic, strong) NSArray<AWSMacieMemberAccount *> * _Nullable memberAccounts;

/**
 <p>When a response is generated, if there is more data to be listed, this parameter is present in the response and contains the value to use for the nextToken parameter in a subsequent pagination request. If there is no more data to be listed, this parameter is set to null. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSMacieListS3ResourcesRequest : AWSRequest


/**
 <p>Use this parameter to indicate the maximum number of items that you want in the response. The default value is 250. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The Amazon Macie Classic member account ID whose associated S3 resources you want to list. </p>
 */
@property (nonatomic, strong) NSString * _Nullable memberAccountId;

/**
 <p>Use this parameter when paginating results. Set its value to null on your first call to the ListS3Resources action. Subsequent calls to the action fill nextToken in the request with the value of nextToken from the previous response to continue listing data. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSMacieListS3ResourcesResult : AWSModel


/**
 <p>When a response is generated, if there is more data to be listed, this parameter is present in the response and contains the value to use for the nextToken parameter in a subsequent pagination request. If there is no more data to be listed, this parameter is set to null. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the associated S3 resources returned by the action.</p>
 */
@property (nonatomic, strong) NSArray<AWSMacieS3ResourceClassification *> * _Nullable s3Resources;

@end

/**
 <p>Contains information about the Amazon Macie Classic member account.</p>
 */
@interface AWSMacieMemberAccount : AWSModel


/**
 <p>The AWS account ID of the Amazon Macie Classic member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

@end

/**
 <p>Contains information about the S3 resource. This data type is used as a request parameter in the DisassociateS3Resources action and can be used as a response parameter in the AssociateS3Resources and UpdateS3Resources actions. </p>
 Required parameters: [bucketName]
 */
@interface AWSMacieS3Resource : AWSModel


/**
 <p>The name of the S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The prefix of the S3 bucket. </p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 <p>The S3 resources that you want to associate with Amazon Macie Classic for monitoring and data classification. This data type is used as a request parameter in the AssociateS3Resources action and a response parameter in the ListS3Resources action. </p>
 Required parameters: [bucketName, classificationType]
 */
@interface AWSMacieS3ResourceClassification : AWSModel


/**
 <p>The name of the S3 bucket that you want to associate with Amazon Macie Classic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The classification type that you want to specify for the resource associated with Amazon Macie Classic. </p>
 */
@property (nonatomic, strong) AWSMacieClassificationType * _Nullable classificationType;

/**
 <p>The prefix of the S3 bucket that you want to associate with Amazon Macie Classic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 <p>The S3 resources whose classification types you want to update. This data type is used as a request parameter in the UpdateS3Resources action. </p>
 Required parameters: [bucketName, classificationTypeUpdate]
 */
@interface AWSMacieS3ResourceClassificationUpdate : AWSModel


/**
 <p>The name of the S3 bucket whose classification types you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The classification type that you want to update for the resource associated with Amazon Macie Classic. </p>
 */
@property (nonatomic, strong) AWSMacieClassificationTypeUpdate * _Nullable classificationTypeUpdate;

/**
 <p>The prefix of the S3 bucket whose classification types you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable prefix;

@end

/**
 
 */
@interface AWSMacieUpdateS3ResourcesRequest : AWSRequest


/**
 <p>The AWS ID of the Amazon Macie Classic member account whose S3 resources' classification types you want to update. </p>
 */
@property (nonatomic, strong) NSString * _Nullable memberAccountId;

/**
 <p>The S3 resources whose classification types you want to update.</p>
 */
@property (nonatomic, strong) NSArray<AWSMacieS3ResourceClassificationUpdate *> * _Nullable s3ResourcesUpdate;

@end

/**
 
 */
@interface AWSMacieUpdateS3ResourcesResult : AWSModel


/**
 <p>The S3 resources whose classification types can't be updated. An error code and an error message are provided for each failed item. </p>
 */
@property (nonatomic, strong) NSArray<AWSMacieFailedS3Resource *> * _Nullable failedS3Resources;

@end

NS_ASSUME_NONNULL_END
