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

FOUNDATION_EXPORT NSString *const AWSDlmErrorDomain;

typedef NS_ENUM(NSInteger, AWSDlmErrorType) {
    AWSDlmErrorUnknown,
    AWSDlmErrorInternalServer,
    AWSDlmErrorInvalidRequest,
    AWSDlmErrorLimitExceeded,
    AWSDlmErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSDlmGettablePolicyStateValues) {
    AWSDlmGettablePolicyStateValuesUnknown,
    AWSDlmGettablePolicyStateValuesEnabled,
    AWSDlmGettablePolicyStateValuesDisabled,
    AWSDlmGettablePolicyStateValuesError,
};

typedef NS_ENUM(NSInteger, AWSDlmIntervalUnitValues) {
    AWSDlmIntervalUnitValuesUnknown,
    AWSDlmIntervalUnitValuesHours,
};

typedef NS_ENUM(NSInteger, AWSDlmPolicyTypeValues) {
    AWSDlmPolicyTypeValuesUnknown,
    AWSDlmPolicyTypeValuesEbsSnapshotManagement,
};

typedef NS_ENUM(NSInteger, AWSDlmResourceTypeValues) {
    AWSDlmResourceTypeValuesUnknown,
    AWSDlmResourceTypeValuesVolume,
    AWSDlmResourceTypeValuesInstance,
};

typedef NS_ENUM(NSInteger, AWSDlmRetentionIntervalUnitValues) {
    AWSDlmRetentionIntervalUnitValuesUnknown,
    AWSDlmRetentionIntervalUnitValuesDays,
    AWSDlmRetentionIntervalUnitValuesWeeks,
    AWSDlmRetentionIntervalUnitValuesMonths,
    AWSDlmRetentionIntervalUnitValuesYears,
};

typedef NS_ENUM(NSInteger, AWSDlmSettablePolicyStateValues) {
    AWSDlmSettablePolicyStateValuesUnknown,
    AWSDlmSettablePolicyStateValuesEnabled,
    AWSDlmSettablePolicyStateValuesDisabled,
};

@class AWSDlmCreateLifecyclePolicyRequest;
@class AWSDlmCreateLifecyclePolicyResponse;
@class AWSDlmCreateRule;
@class AWSDlmCrossRegionCopyRetainRule;
@class AWSDlmCrossRegionCopyRule;
@class AWSDlmDeleteLifecyclePolicyRequest;
@class AWSDlmDeleteLifecyclePolicyResponse;
@class AWSDlmFastRestoreRule;
@class AWSDlmGetLifecyclePoliciesRequest;
@class AWSDlmGetLifecyclePoliciesResponse;
@class AWSDlmGetLifecyclePolicyRequest;
@class AWSDlmGetLifecyclePolicyResponse;
@class AWSDlmLifecyclePolicy;
@class AWSDlmLifecyclePolicySummary;
@class AWSDlmListTagsForResourceRequest;
@class AWSDlmListTagsForResourceResponse;
@class AWSDlmParameters;
@class AWSDlmPolicyDetails;
@class AWSDlmRetainRule;
@class AWSDlmSchedule;
@class AWSDlmTag;
@class AWSDlmTagResourceRequest;
@class AWSDlmTagResourceResponse;
@class AWSDlmUntagResourceRequest;
@class AWSDlmUntagResourceResponse;
@class AWSDlmUpdateLifecyclePolicyRequest;
@class AWSDlmUpdateLifecyclePolicyResponse;

/**
 
 */
@interface AWSDlmCreateLifecyclePolicyRequest : AWSRequest


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
@property (nonatomic, strong) AWSDlmPolicyDetails * _Nullable policyDetails;

/**
 <p>The desired activation state of the lifecycle policy after creation.</p>
 */
@property (nonatomic, assign) AWSDlmSettablePolicyStateValues state;

/**
 <p>The tags to apply to the lifecycle policy during creation.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDlmCreateLifecyclePolicyResponse : AWSModel


/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 <p>Specifies when to create snapshots of EBS volumes.</p><p>You must specify either a Cron expression or an interval, interval unit, and start time. You cannot specify both.</p>
 */
@interface AWSDlmCreateRule : AWSModel


/**
 <p>The schedule, as a Cron expression. The schedule interval must be between 1 hour and 1 year. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron expressions</a> in the <i>Amazon CloudWatch User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cronExpression;

/**
 <p>The interval between snapshots. The supported values are 1, 2, 3, 4, 6, 8, 12, and 24.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interval;

/**
 <p>The interval unit.</p>
 */
@property (nonatomic, assign) AWSDlmIntervalUnitValues intervalUnit;

/**
 <p>The time, in UTC, to start the operation. The supported format is hh:mm.</p><p>The operation occurs within a one-hour window following the specified time. If you do not specify a time, Amazon DLM selects a time within the next 24 hours.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable times;

@end

/**
 <p>Specifies the retention rule for cross-Region snapshot copies.</p>
 */
@interface AWSDlmCrossRegionCopyRetainRule : AWSModel


/**
 <p>The amount of time to retain each snapshot. The maximum is 100 years. This is equivalent to 1200 months, 5200 weeks, or 36500 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable interval;

/**
 <p>The unit of time for time-based retention.</p>
 */
@property (nonatomic, assign) AWSDlmRetentionIntervalUnitValues intervalUnit;

@end

/**
 <p>Specifies a rule for cross-Region snapshot copies.</p>
 Required parameters: [TargetRegion, Encrypted]
 */
@interface AWSDlmCrossRegionCopyRule : AWSModel


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
@property (nonatomic, strong) AWSDlmCrossRegionCopyRetainRule * _Nullable retainRule;

/**
 <p>The target Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetRegion;

@end

/**
 
 */
@interface AWSDlmDeleteLifecyclePolicyRequest : AWSRequest


/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSDlmDeleteLifecyclePolicyResponse : AWSModel


@end

/**
 <p>Specifies a rule for enabling fast snapshot restore. You can enable fast snapshot restore based on either a count or a time interval.</p>
 Required parameters: [AvailabilityZones]
 */
@interface AWSDlmFastRestoreRule : AWSModel


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
@property (nonatomic, assign) AWSDlmRetentionIntervalUnitValues intervalUnit;

@end

/**
 
 */
@interface AWSDlmGetLifecyclePoliciesRequest : AWSRequest


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
@property (nonatomic, assign) AWSDlmGettablePolicyStateValues state;

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
@interface AWSDlmGetLifecyclePoliciesResponse : AWSModel


/**
 <p>Summary information about the lifecycle policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSDlmLifecyclePolicySummary *> * _Nullable policies;

@end

/**
 
 */
@interface AWSDlmGetLifecyclePolicyRequest : AWSRequest


/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSDlmGetLifecyclePolicyResponse : AWSModel


/**
 <p>Detailed information about the lifecycle policy.</p>
 */
@property (nonatomic, strong) AWSDlmLifecyclePolicy * _Nullable policy;

@end

/**
 <p>Detailed information about a lifecycle policy.</p>
 */
@interface AWSDlmLifecyclePolicy : AWSModel


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
@property (nonatomic, strong) AWSDlmPolicyDetails * _Nullable policyDetails;

/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The activation state of the lifecycle policy.</p>
 */
@property (nonatomic, assign) AWSDlmGettablePolicyStateValues state;

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
@interface AWSDlmLifecyclePolicySummary : AWSModel


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
@property (nonatomic, assign) AWSDlmGettablePolicyStateValues state;

/**
 <p>The tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSDlmListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSDlmListTagsForResourceResponse : AWSModel


/**
 <p>Information about the tags.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Specifies optional parameters to add to a policy. The set of valid parameters depends on the combination of policy type and resource type.</p>
 */
@interface AWSDlmParameters : AWSModel


/**
 <p>[EBS Snapshot Management – Instance policies only] Indicates whether to exclude the root volume from snapshots created using <a href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateSnapshots.html">CreateSnapshots</a>. The default is false.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable excludeBootVolume;

@end

/**
 <p>Specifies the configuration of a lifecycle policy.</p>
 */
@interface AWSDlmPolicyDetails : AWSModel


/**
 <p>A set of optional parameters for the policy. </p>
 */
@property (nonatomic, strong) AWSDlmParameters * _Nullable parameters;

/**
 <p>The valid target resource types and actions a policy can manage. The default is EBS_SNAPSHOT_MANAGEMENT.</p>
 */
@property (nonatomic, assign) AWSDlmPolicyTypeValues policyType;

/**
 <p>The resource type. Use VOLUME to create snapshots of individual volumes or use INSTANCE to create multi-volume snapshots from the volumes for an instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceTypes;

/**
 <p>The schedule of policy-defined actions.</p>
 */
@property (nonatomic, strong) NSArray<AWSDlmSchedule *> * _Nullable schedules;

/**
 <p>The single tag that identifies targeted resources for this policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSDlmTag *> * _Nullable targetTags;

@end

/**
 <p>Specifies the retention rule for a lifecycle policy. You can retain snapshots based on either a count or a time interval.</p>
 */
@interface AWSDlmRetainRule : AWSModel


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
@property (nonatomic, assign) AWSDlmRetentionIntervalUnitValues intervalUnit;

@end

/**
 <p>Specifies a backup schedule.</p>
 */
@interface AWSDlmSchedule : AWSModel


/**
 <p>Copy all user-defined tags on a source volume to snapshots of the volume created by this policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable replicateTags;

/**
 <p>The creation rule.</p>
 */
@property (nonatomic, strong) AWSDlmCreateRule * _Nullable createRule;

/**
 <p>The rule for cross-Region snapshot copies.</p>
 */
@property (nonatomic, strong) NSArray<AWSDlmCrossRegionCopyRule *> * _Nullable crossRegionCopyRules;

/**
 <p>The rule for enabling fast snapshot restore.</p>
 */
@property (nonatomic, strong) AWSDlmFastRestoreRule * _Nullable fastRestoreRule;

/**
 <p>The name of the schedule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The retention rule.</p>
 */
@property (nonatomic, strong) AWSDlmRetainRule * _Nullable retainRule;

/**
 <p>The tags to apply to policy-created resources. These user-defined tags are in addition to the AWS-added lifecycle tags.</p>
 */
@property (nonatomic, strong) NSArray<AWSDlmTag *> * _Nullable tagsToAdd;

/**
 <p>A collection of key/value pairs with values determined dynamically when the policy is executed. Keys may be any valid Amazon EC2 tag key. Values must be in one of the two following formats: <code>$(instance-id)</code> or <code>$(timestamp)</code>. Variable tags are only valid for EBS Snapshot Management – Instance policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSDlmTag *> * _Nullable variableTags;

@end

/**
 <p>Specifies a tag for a resource.</p>
 Required parameters: [Key, Value]
 */
@interface AWSDlmTag : AWSModel


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
@interface AWSDlmTagResourceRequest : AWSRequest


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
@interface AWSDlmTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSDlmUntagResourceRequest : AWSRequest


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
@interface AWSDlmUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSDlmUpdateLifecyclePolicyRequest : AWSRequest


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
@property (nonatomic, strong) AWSDlmPolicyDetails * _Nullable policyDetails;

/**
 <p>The identifier of the lifecycle policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The desired activation state of the lifecycle policy after creation.</p>
 */
@property (nonatomic, assign) AWSDlmSettablePolicyStateValues state;

@end

/**
 
 */
@interface AWSDlmUpdateLifecyclePolicyResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
