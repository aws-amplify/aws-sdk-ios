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

FOUNDATION_EXPORT NSString *const AWSMarketplacemeteringErrorDomain;

typedef NS_ENUM(NSInteger, AWSMarketplacemeteringErrorType) {
    AWSMarketplacemeteringErrorUnknown,
    AWSMarketplacemeteringErrorCustomerNotEntitled,
    AWSMarketplacemeteringErrorDisabledApi,
    AWSMarketplacemeteringErrorDuplicateRequest,
    AWSMarketplacemeteringErrorExpiredToken,
    AWSMarketplacemeteringErrorInternalServiceError,
    AWSMarketplacemeteringErrorInvalidCustomerIdentifier,
    AWSMarketplacemeteringErrorInvalidEndpointRegion,
    AWSMarketplacemeteringErrorInvalidProductCode,
    AWSMarketplacemeteringErrorInvalidPublicKeyVersion,
    AWSMarketplacemeteringErrorInvalidRegion,
    AWSMarketplacemeteringErrorInvalidToken,
    AWSMarketplacemeteringErrorInvalidUsageDimension,
    AWSMarketplacemeteringErrorPlatformNotSupported,
    AWSMarketplacemeteringErrorThrottling,
    AWSMarketplacemeteringErrorTimestampOutOfBounds,
};

typedef NS_ENUM(NSInteger, AWSMarketplacemeteringUsageRecordResultStatus) {
    AWSMarketplacemeteringUsageRecordResultStatusUnknown,
    AWSMarketplacemeteringUsageRecordResultStatusSuccess,
    AWSMarketplacemeteringUsageRecordResultStatusCustomerNotSubscribed,
    AWSMarketplacemeteringUsageRecordResultStatusDuplicateRecord,
};

@class AWSMarketplacemeteringBatchMeterUsageRequest;
@class AWSMarketplacemeteringBatchMeterUsageResult;
@class AWSMarketplacemeteringMeterUsageRequest;
@class AWSMarketplacemeteringMeterUsageResult;
@class AWSMarketplacemeteringRegisterUsageRequest;
@class AWSMarketplacemeteringRegisterUsageResult;
@class AWSMarketplacemeteringResolveCustomerRequest;
@class AWSMarketplacemeteringResolveCustomerResult;
@class AWSMarketplacemeteringUsageRecord;
@class AWSMarketplacemeteringUsageRecordResult;

/**
 <p>A BatchMeterUsageRequest contains UsageRecords, which indicate quantities of usage within your application.</p>
 Required parameters: [UsageRecords, ProductCode]
 */
@interface AWSMarketplacemeteringBatchMeterUsageRequest : AWSRequest


/**
 <p>Product code is used to uniquely identify a product in AWS Marketplace. The product code should be the same as the one used during the publishing of a new product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productCode;

/**
 <p>The set of UsageRecords to submit. BatchMeterUsage accepts up to 25 UsageRecords at a time.</p>
 */
@property (nonatomic, strong) NSArray<AWSMarketplacemeteringUsageRecord *> * _Nullable usageRecords;

@end

/**
 <p>Contains the UsageRecords processed by BatchMeterUsage and any records that have failed due to transient error.</p>
 */
@interface AWSMarketplacemeteringBatchMeterUsageResult : AWSModel


/**
 <p>Contains all UsageRecords processed by BatchMeterUsage. These records were either honored by AWS Marketplace Metering Service or were invalid.</p>
 */
@property (nonatomic, strong) NSArray<AWSMarketplacemeteringUsageRecordResult *> * _Nullable results;

/**
 <p>Contains all UsageRecords that were not processed by BatchMeterUsage. This is a list of UsageRecords. You can retry the failed request by making another BatchMeterUsage call with this list as input in the BatchMeterUsageRequest.</p>
 */
@property (nonatomic, strong) NSArray<AWSMarketplacemeteringUsageRecord *> * _Nullable unprocessedRecords;

@end

/**
 
 */
@interface AWSMarketplacemeteringMeterUsageRequest : AWSRequest


/**
 <p>Checks whether you have the permissions required for the action, but does not make the request. If you have the permissions, the request returns DryRunOperation; otherwise, it returns UnauthorizedException. Defaults to <code>false</code> if not specified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dryRun;

/**
 <p>Product code is used to uniquely identify a product in AWS Marketplace. The product code should be the same as the one used during the publishing of a new product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productCode;

/**
 <p>Timestamp, in UTC, for which the usage is being reported. Your application can meter usage for up to one hour in the past. Make sure the timestamp value is not before the start of the software usage.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 <p>It will be one of the fcp dimension name provided during the publishing of the product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable usageDimension;

/**
 <p>Consumption value for the hour. Defaults to <code>0</code> if not specified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usageQuantity;

@end

/**
 
 */
@interface AWSMarketplacemeteringMeterUsageResult : AWSModel


/**
 <p>Metering record id.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meteringRecordId;

@end

/**
 
 */
@interface AWSMarketplacemeteringRegisterUsageRequest : AWSRequest


/**
 <p>(Optional) To scope down the registration to a specific running software instance and guard against replay attacks.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nonce;

/**
 <p>Product code is used to uniquely identify a product in AWS Marketplace. The product code should be the same as the one used during the publishing of a new product.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productCode;

/**
 <p>Public Key Version provided by AWS Marketplace</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publicKeyVersion;

@end

/**
 
 */
@interface AWSMarketplacemeteringRegisterUsageResult : AWSModel


/**
 <p>(Optional) Only included when public key version has expired</p>
 */
@property (nonatomic, strong) NSDate * _Nullable publicKeyRotationTimestamp;

/**
 <p>JWT Token</p>
 */
@property (nonatomic, strong) NSString * _Nullable signature;

@end

/**
 <p>Contains input to the ResolveCustomer operation.</p>
 Required parameters: [RegistrationToken]
 */
@interface AWSMarketplacemeteringResolveCustomerRequest : AWSRequest


/**
 <p>When a buyer visits your website during the registration process, the buyer submits a registration token through the browser. The registration token is resolved to obtain a CustomerIdentifier and product code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registrationToken;

@end

/**
 <p>The result of the ResolveCustomer operation. Contains the CustomerIdentifier and product code.</p>
 */
@interface AWSMarketplacemeteringResolveCustomerResult : AWSModel


/**
 <p>The CustomerIdentifier is used to identify an individual customer in your application. Calls to BatchMeterUsage require CustomerIdentifiers for each UsageRecord.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerIdentifier;

/**
 <p>The product code is returned to confirm that the buyer is registering for your product. Subsequent BatchMeterUsage calls should be made using this product code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productCode;

@end

/**
 <p>A UsageRecord indicates a quantity of usage for a given product, customer, dimension and time.</p><p>Multiple requests with the same UsageRecords as input will be deduplicated to prevent double charges.</p>
 Required parameters: [Timestamp, CustomerIdentifier, Dimension]
 */
@interface AWSMarketplacemeteringUsageRecord : AWSModel


/**
 <p>The CustomerIdentifier is obtained through the ResolveCustomer operation and represents an individual buyer in your application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customerIdentifier;

/**
 <p>During the process of registering a product on AWS Marketplace, up to eight dimensions are specified. These represent different units of value in your application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dimension;

/**
 <p>The quantity of usage consumed by the customer for the given dimension and time. Defaults to <code>0</code> if not specified.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable quantity;

/**
 <p>Timestamp, in UTC, for which the usage is being reported.</p><p>Your application can meter usage for up to one hour in the past. Make sure the timestamp value is not before the start of the software usage.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

@end

/**
 <p>A UsageRecordResult indicates the status of a given UsageRecord processed by BatchMeterUsage.</p>
 */
@interface AWSMarketplacemeteringUsageRecordResult : AWSModel


/**
 <p>The MeteringRecordId is a unique identifier for this metering event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable meteringRecordId;

/**
 <p>The UsageRecordResult Status indicates the status of an individual UsageRecord processed by BatchMeterUsage.</p><ul><li><p><i>Success</i>- The UsageRecord was accepted and honored by BatchMeterUsage.</p></li><li><p><i>CustomerNotSubscribed</i>- The CustomerIdentifier specified is not subscribed to your product. The UsageRecord was not honored. Future UsageRecords for this customer will fail until the customer subscribes to your product.</p></li><li><p><i>DuplicateRecord</i>- Indicates that the UsageRecord was invalid and not honored. A previously metered UsageRecord had the same customer, dimension, and time, but a different quantity.</p></li></ul>
 */
@property (nonatomic, assign) AWSMarketplacemeteringUsageRecordResultStatus status;

/**
 <p>The UsageRecord that was part of the BatchMeterUsage request.</p>
 */
@property (nonatomic, strong) AWSMarketplacemeteringUsageRecord * _Nullable usageRecord;

@end

NS_ASSUME_NONNULL_END
