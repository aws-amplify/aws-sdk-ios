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

FOUNDATION_EXPORT NSString *const AWSdlmErrorDomain;

typedef NS_ENUM(NSInteger, AWSdlmErrorType) {
    AWSdlmErrorUnknown,
    AWSdlmErrorInternalServer,
    AWSdlmErrorInvalidRequest,
    AWSdlmErrorLimitExceeded,
    AWSdlmErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSdlmGettablePolicyStateValues) {
    AWSdlmGettablePolicyStateValuesUnknown,
    AWSdlmGettablePolicyStateValuesEnabled,
    AWSdlmGettablePolicyStateValuesDisabled,
    AWSdlmGettablePolicyStateValuesError,
};

typedef NS_ENUM(NSInteger, AWSdlmIntervalUnitValues) {
    AWSdlmIntervalUnitValuesUnknown,
    AWSdlmIntervalUnitValuesHours,
};

typedef NS_ENUM(NSInteger, AWSdlmPolicyTypeValues) {
    AWSdlmPolicyTypeValuesUnknown,
    AWSdlmPolicyTypeValuesEbsSnapshotManagement,
};

typedef NS_ENUM(NSInteger, AWSdlmResourceTypeValues) {
    AWSdlmResourceTypeValuesUnknown,
    AWSdlmResourceTypeValuesVolume,
    AWSdlmResourceTypeValuesInstance,
};

typedef NS_ENUM(NSInteger, AWSdlmRetentionIntervalUnitValues) {
    AWSdlmRetentionIntervalUnitValuesUnknown,
    AWSdlmRetentionIntervalUnitValuesDays,
    AWSdlmRetentionIntervalUnitValuesWeeks,
    AWSdlmRetentionIntervalUnitValuesMonths,
    AWSdlmRetentionIntervalUnitValuesYears,
};

typedef NS_ENUM(NSInteger, AWSdlmSettablePolicyStateValues) {
    AWSdlmSettablePolicyStateValuesUnknown,
    AWSdlmSettablePolicyStateValuesEnabled,
    AWSdlmSettablePolicyStateValuesDisabled,
};

@class AWSdlmCreateLifecyclePolicyRequest;
@class AWSdlmCreateLifecyclePolicyResponse;
@class AWSdlmCreateRule;
@class AWSdlmCrossRegionCopyRetainRule;
@class AWSdlmCrossRegionCopyRule;
@class AWSdlmDeleteLifecyclePolicyRequest;
@class AWSdlmDeleteLifecyclePolicyResponse;
@class AWSdlmFastRestoreRule;
@class AWSdlmGetLifecyclePoliciesRequest;
@class AWSdlmGetLifecyclePoliciesResponse;
@class AWSdlmGetLifecyclePolicyRequest;
@class AWSdlmGetLifecyclePolicyResponse;
@class AWSdlmLifecyclePolicy;
@class AWSdlmLifecyclePolicySummary;
@class AWSdlmListTagsForResourceRequest;
@class AWSdlmListTagsForResourceResponse;
@class AWSdlmParameters;
@class AWSdlmPolicyDetails;
@class AWSdlmRetainRule;
@class AWSdlmSchedule;
@class AWSdlmTag;
@class AWSdlmTagResourceRequest;
@class AWSdlmTagResourceResponse;
@class AWSdlmUntagResourceRequest;
@class AWSdlmUntagResourceResponse;
@class AWSdlmUpdateLifecyclePolicyRequest;
@class AWSdlmUpdateLifecyclePolicyResponse;

/**
 
 */
@interface AWSdlmCreateLifecyclePolicyRequest : AWSRequest


/**
 <p>A description of the lifecycle policy. The characters ^[0-9A-Za-z _-]+$ are supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleArn;

/**
 <p>The configuration details of the lifecycle policy.</p>
 */
@property (nonatomic, strong) AWSdlmPolicyDetails * _Nullable policyDetails;

/**
 <p>The desired activation state of the lifecycle policy after creation.</p>
 */
@property (nonatomic, assign) AWSdlmSettablePolicyStateValues state;

/**
 <p>The tags to apply to the lifecycle policy during creation.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSdlmCreateLifecyclePolicyResponse : AWSModel


/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 <p>Specifies when to create snapshots of EBS volumes.</p>
 Required parameters: [Interval, IntervalUnit]
 */
@interface AWSdlmCreateRule : AWSModel


/**
 <p>The interval between snapshots. The supported values are 1, 2, 3, 4, 6, 8, 12, and 24.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interval;

/**
 <p>The interval unit.</p>
 */
@property (nonatomic, assign) AWSdlmIntervalUnitValues intervalUnit;

/**
 <p>The time, in UTC, to start the operation. The supported format is hh:mm.</p><p>The operation occurs within a one-hour window following the specified time.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable times;

@end

/**
 <p>Specifies the retention rule for cross-Region snapshot copies.</p>
 */
@interface AWSdlmCrossRegionCopyRetainRule : AWSModel


/**
 <p>The amount of time to retain each snapshot. The maximum is 100 years. This is equivalent to 1200 months, 5200 weeks, or 36500 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interval;

/**
 <p>The unit of time for time-based retention.</p>
 */
@property (nonatomic, assign) AWSdlmRetentionIntervalUnitValues intervalUnit;

@end

/**
 <p>Specifies a rule for cross-Region snapshot copies.</p>
 Required parameters: [TargetRegion, Encrypted]
 */
@interface AWSdlmCrossRegionCopyRule : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the AWS KMS customer master key (CMK) to use for EBS encryption. If this parameter is not specified, your AWS managed CMK for EBS is used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cmkArn;

/**
 <p>Copy all user-defined tags from the source snapshot to the copied snapshot.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTags;

/**
 <p>To encrypt a copy of an unencrypted snapshot if encryption by default is not enabled, enable encryption using this parameter. Copies of encrypted snapshots are encrypted, even if this parameter is false or if encryption by default is not enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable encrypted;

/**
 <p>The retention rule.</p>
 */
@property (nonatomic, strong) AWSdlmCrossRegionCopyRetainRule * _Nullable retainRule;

/**
 <p>The target Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetRegion;

@end

/**
 
 */
@interface AWSdlmDeleteLifecyclePolicyRequest : AWSRequest


/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSdlmDeleteLifecyclePolicyResponse : AWSModel


@end

/**
 <p>Specifies a rule for enabling fast snapshot restore. You can enable fast snapshot restore based on either a count or a time interval.</p>
 Required parameters: [AvailabilityZones]
 */
@interface AWSdlmFastRestoreRule : AWSModel


/**
 <p>The Availability Zones in which to enable fast snapshot restore.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>The number of snapshots to be enabled with fast snapshot restore.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The amount of time to enable fast snapshot restore. The maximum is 100 years. This is equivalent to 1200 months, 5200 weeks, or 36500 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interval;

/**
 <p>The unit of time for enabling fast snapshot restore.</p>
 */
@property (nonatomic, assign) AWSdlmRetentionIntervalUnitValues intervalUnit;

@end

/**
 
 */
@interface AWSdlmGetLifecyclePoliciesRequest : AWSRequest


/**
 <p>The identifiers of the data lifecycle policies.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyIds;

/**
 <p>The resource type.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypes;

/**
 <p>The activation state.</p>
 */
@property (nonatomic, assign) AWSdlmGettablePolicyStateValues state;

/**
 <p>The tags to add to objects created by the policy.</p><p>Tags are strings in the format <code>key=value</code>.</p><p>These user-defined tags are added in addition to the AWS-added lifecycle tags.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagsToAdd;

/**
 <p>The target tag for a policy.</p><p>Tags are strings in the format <code>key=value</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetTags;

@end

/**
 
 */
@interface AWSdlmGetLifecyclePoliciesResponse : AWSModel


/**
 <p>Summary information about the lifecycle policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSdlmLifecyclePolicySummary *> * _Nullable policies;

@end

/**
 
 */
@interface AWSdlmGetLifecyclePolicyRequest : AWSRequest


/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSdlmGetLifecyclePolicyResponse : AWSModel


/**
 <p>Detailed information about the lifecycle policy.</p>
 */
@property (nonatomic, strong) AWSdlmLifecyclePolicy * _Nullable policy;

@end

/**
 <p>Detailed information about a lifecycle policy.</p>
 */
@interface AWSdlmLifecyclePolicy : AWSModel


/**
 <p>The local date and time when the lifecycle policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateCreated;

/**
 <p>The local date and time when the lifecycle policy was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateModified;

/**
 <p>The description of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleArn;

/**
 <p>The Amazon Resource Name (ARN) of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The configuration of the lifecycle policy</p>
 */
@property (nonatomic, strong) AWSdlmPolicyDetails * _Nullable policyDetails;

/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The activation state of the lifecycle policy.</p>
 */
@property (nonatomic, assign) AWSdlmGettablePolicyStateValues state;

/**
 <p>The description of the status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statusMessage;

/**
 <p>The tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Summary information about a lifecycle policy.</p>
 */
@interface AWSdlmLifecyclePolicySummary : AWSModel


/**
 <p>The description of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The activation state of the lifecycle policy.</p>
 */
@property (nonatomic, assign) AWSdlmGettablePolicyStateValues state;

/**
 <p>The tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSdlmListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSdlmListTagsForResourceResponse : AWSModel


/**
 <p>Information about the tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Specifies optional parameters to add to a policy. The set of valid parameters depends on the combination of policy type and resource type.</p>
 */
@interface AWSdlmParameters : AWSModel


/**
 <p>[EBS Snapshot Management – Instance policies only] Indicates whether to exclude the root volume from snapshots created using <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateSnapshots.html">CreateSnapshots</a>. The default is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable excludeBootVolume;

@end

/**
 <p>Specifies the configuration of a lifecycle policy.</p>
 */
@interface AWSdlmPolicyDetails : AWSModel


/**
 <p>A set of optional parameters for the policy. </p>
 */
@property (nonatomic, strong) AWSdlmParameters * _Nullable parameters;

/**
 <p>The valid target resource types and actions a policy can manage. The default is EBS_SNAPSHOT_MANAGEMENT.</p>
 */
@property (nonatomic, assign) AWSdlmPolicyTypeValues policyType;

/**
 <p>The resource type.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypes;

/**
 <p>The schedule of policy-defined actions.</p>
 */
@property (nonatomic, strong) NSArray<AWSdlmSchedule *> * _Nullable schedules;

/**
 <p>The single tag that identifies targeted resources for this policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSdlmTag *> * _Nullable targetTags;

@end

/**
 <p>Specifies the retention rule for a lifecycle policy. You can retain snapshots based on either a count or a time interval.</p>
 */
@interface AWSdlmRetainRule : AWSModel


/**
 <p>The number of snapshots to retain for each volume, up to a maximum of 1000.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The amount of time to retain each snapshot. The maximum is 100 years. This is equivalent to 1200 months, 5200 weeks, or 36500 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interval;

/**
 <p>The unit of time for time-based retention.</p>
 */
@property (nonatomic, assign) AWSdlmRetentionIntervalUnitValues intervalUnit;

@end

/**
 <p>Specifies a backup schedule.</p>
 */
@interface AWSdlmSchedule : AWSModel


/**
 <p>Copy all user-defined tags on a source volume to snapshots of the volume created by this policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTags;

/**
 <p>The creation rule.</p>
 */
@property (nonatomic, strong) AWSdlmCreateRule * _Nullable createRule;

/**
 <p>The rule for cross-Region snapshot copies.</p>
 */
@property (nonatomic, strong) NSArray<AWSdlmCrossRegionCopyRule *> * _Nullable crossRegionCopyRules;

/**
 <p>The rule for enabling fast snapshot restore.</p>
 */
@property (nonatomic, strong) AWSdlmFastRestoreRule * _Nullable fastRestoreRule;

/**
 <p>The name of the schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The retention rule.</p>
 */
@property (nonatomic, strong) AWSdlmRetainRule * _Nullable retainRule;

/**
 <p>The tags to apply to policy-created resources. These user-defined tags are in addition to the AWS-added lifecycle tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSdlmTag *> * _Nullable tagsToAdd;

/**
 <p>A collection of key/value pairs with values determined dynamically when the policy is executed. Keys may be any valid Amazon EC2 tag key. Values must be in one of the two following formats: <code>$(instance-id)</code> or <code>$(timestamp)</code>. Variable tags are only valid for EBS Snapshot Management – Instance policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSdlmTag *> * _Nullable variableTags;

@end

/**
 <p>Specifies a tag for a resource.</p>
 Required parameters: [Key, Value]
 */
@interface AWSdlmTag : AWSModel


/**
 <p>The tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The tag value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSdlmTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>One or more tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSdlmTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSdlmUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tag keys.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSdlmUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSdlmUpdateLifecyclePolicyRequest : AWSRequest


/**
 <p>A description of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable executionRoleArn;

/**
 <p>The configuration of the lifecycle policy. You cannot update the policy type or the resource type.</p>
 */
@property (nonatomic, strong) AWSdlmPolicyDetails * _Nullable policyDetails;

/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The desired activation state of the lifecycle policy after creation.</p>
 */
@property (nonatomic, assign) AWSdlmSettablePolicyStateValues state;

@end

/**
 
 */
@interface AWSdlmUpdateLifecyclePolicyResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
