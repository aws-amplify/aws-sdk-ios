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

FOUNDATION_EXPORT NSString *const AWSHealthErrorDomain;

typedef NS_ENUM(NSInteger, AWSHealthErrorType) {
    AWSHealthErrorUnknown,
    AWSHealthErrorConcurrentModification,
    AWSHealthErrorInvalidPaginationToken,
    AWSHealthErrorUnsupportedLocale,
};

typedef NS_ENUM(NSInteger, AWSHealthentityStatusCode) {
    AWSHealthentityStatusCodeUnknown,
    AWSHealthentityStatusCodeImpaired,
    AWSHealthentityStatusCodeUnimpaired,
};

typedef NS_ENUM(NSInteger, AWSHealtheventAggregateField) {
    AWSHealtheventAggregateFieldUnknown,
    AWSHealtheventAggregateFieldEventTypeCategory,
};

typedef NS_ENUM(NSInteger, AWSHealtheventScopeCode) {
    AWSHealtheventScopeCodeUnknown,
    AWSHealtheventScopeCodePublic,
    AWSHealtheventScopeCodeAccountSpecific,
    AWSHealtheventScopeCodeNone,
};

typedef NS_ENUM(NSInteger, AWSHealtheventStatusCode) {
    AWSHealtheventStatusCodeUnknown,
    AWSHealtheventStatusCodeOpen,
    AWSHealtheventStatusCodeClosed,
    AWSHealtheventStatusCodeUpcoming,
};

typedef NS_ENUM(NSInteger, AWSHealtheventTypeCategory) {
    AWSHealtheventTypeCategoryUnknown,
    AWSHealtheventTypeCategoryIssue,
    AWSHealtheventTypeCategoryAccountNotification,
    AWSHealtheventTypeCategoryScheduledChange,
    AWSHealtheventTypeCategoryInvestigation,
};

@class AWSHealthAffectedEntity;
@class AWSHealthDateTimeRange;
@class AWSHealthDescribeAffectedAccountsForOrganizationRequest;
@class AWSHealthDescribeAffectedAccountsForOrganizationResponse;
@class AWSHealthDescribeAffectedEntitiesForOrganizationRequest;
@class AWSHealthDescribeAffectedEntitiesForOrganizationResponse;
@class AWSHealthDescribeAffectedEntitiesRequest;
@class AWSHealthDescribeAffectedEntitiesResponse;
@class AWSHealthDescribeEntityAggregatesRequest;
@class AWSHealthDescribeEntityAggregatesResponse;
@class AWSHealthDescribeEventAggregatesRequest;
@class AWSHealthDescribeEventAggregatesResponse;
@class AWSHealthDescribeEventDetailsForOrganizationRequest;
@class AWSHealthDescribeEventDetailsForOrganizationResponse;
@class AWSHealthDescribeEventDetailsRequest;
@class AWSHealthDescribeEventDetailsResponse;
@class AWSHealthDescribeEventTypesRequest;
@class AWSHealthDescribeEventTypesResponse;
@class AWSHealthDescribeEventsForOrganizationRequest;
@class AWSHealthDescribeEventsForOrganizationResponse;
@class AWSHealthDescribeEventsRequest;
@class AWSHealthDescribeEventsResponse;
@class AWSHealthDescribeHealthServiceStatusForOrganizationResponse;
@class AWSHealthEntityAggregate;
@class AWSHealthEntityFilter;
@class AWSHealthEvent;
@class AWSHealthEventAccountFilter;
@class AWSHealthEventAggregate;
@class AWSHealthEventDescription;
@class AWSHealthEventDetails;
@class AWSHealthEventDetailsErrorItem;
@class AWSHealthEventFilter;
@class AWSHealthEventType;
@class AWSHealthEventTypeFilter;
@class AWSHealthOrganizationAffectedEntitiesErrorItem;
@class AWSHealthOrganizationEvent;
@class AWSHealthOrganizationEventDetails;
@class AWSHealthOrganizationEventDetailsErrorItem;
@class AWSHealthOrganizationEventFilter;

/**
 <p>Information about an entity that is affected by a Health event.</p>
 */
@interface AWSHealthAffectedEntity : AWSModel


/**
 <p>The 12-digit AWS account number that contains the affected entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The unique identifier for the entity. Format: <code>arn:aws:health:<i>entity-region</i>:<i>aws-account</i>:entity/<i>entity-id</i></code>. Example: <code>arn:aws:health:us-east-1:111222333444:entity/AVh5GGT7ul1arKr1sE1K</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable entityArn;

/**
 <p>The URL of the affected entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityUrl;

/**
 <p>The ID of the affected entity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityValue;

/**
 <p>The unique identifier for the event. Format: <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i></code>. Example: <code>Example: arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable eventArn;

/**
 <p>The most recent time that the entity was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The most recent status of the entity affected by the event. The possible values are <code>IMPAIRED</code>, <code>UNIMPAIRED</code>, and <code>UNKNOWN</code>.</p>
 */
@property (nonatomic, assign) AWSHealthentityStatusCode statusCode;

/**
 <p>A map of entity tags attached to the affected entity.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>A range of dates and times that is used by the <a>EventFilter</a> and <a>EntityFilter</a> objects. If <code>from</code> is set and <code>to</code> is set: match items where the timestamp (<code>startTime</code>, <code>endTime</code>, or <code>lastUpdatedTime</code>) is between <code>from</code> and <code>to</code> inclusive. If <code>from</code> is set and <code>to</code> is not set: match items where the timestamp value is equal to or after <code>from</code>. If <code>from</code> is not set and <code>to</code> is set: match items where the timestamp value is equal to or before <code>to</code>.</p>
 */
@interface AWSHealthDateTimeRange : AWSModel


/**
 <p>The starting date and time of a time range.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable from;

/**
 <p>The ending date and time of a time range.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable to;

@end

/**
 
 */
@interface AWSHealthDescribeAffectedAccountsForOrganizationRequest : AWSRequest


/**
 <p>The unique identifier for the event. Format: <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i></code>. Example: <code>Example: arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable eventArn;

/**
 <p>The maximum number of items to return in one batch, between 10 and 100, inclusive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeAffectedAccountsForOrganizationResponse : AWSModel


/**
 <p>A JSON set of elements of the affected accounts.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable affectedAccounts;

/**
 
 */
@property (nonatomic, assign) AWSHealtheventScopeCode eventScopeCode;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeAffectedEntitiesForOrganizationRequest : AWSRequest


/**
 <p>The locale (language) to return information in. English (en) is the default and the only supported value at this time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>The maximum number of items to return in one batch, between 10 and 100, inclusive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A JSON set of elements including the <code>awsAccountId</code> and the <code>eventArn</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthEventAccountFilter *> * _Nullable organizationEntityFilters;

@end

/**
 
 */
@interface AWSHealthDescribeAffectedEntitiesForOrganizationResponse : AWSModel


/**
 <p>A JSON set of elements including the <code>awsAccountId</code> and its <code>entityArn</code>, <code>entityValue</code> and its <code>entityArn</code>, <code>lastUpdatedTime</code>, <code>statusCode</code>, and <code>tags</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthAffectedEntity *> * _Nullable entities;

/**
 <p>A JSON set of elements of the failed response, including the <code>awsAccountId</code>, <code>errorMessage</code>, <code>errorName</code>, and <code>eventArn</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthOrganizationAffectedEntitiesErrorItem *> * _Nullable failedSet;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeAffectedEntitiesRequest : AWSRequest


/**
 <p>Values to narrow the results returned. At least one event ARN is required.</p>
 */
@property (nonatomic, strong) AWSHealthEntityFilter * _Nullable filter;

/**
 <p>The locale (language) to return information in. English (en) is the default and the only supported value at this time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>The maximum number of items to return in one batch, between 10 and 100, inclusive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeAffectedEntitiesResponse : AWSModel


/**
 <p>The entities that match the filter criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthAffectedEntity *> * _Nullable entities;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeEntityAggregatesRequest : AWSRequest


/**
 <p>A list of event ARNs (unique identifiers). For example: <code>"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456", "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventArns;

@end

/**
 
 */
@interface AWSHealthDescribeEntityAggregatesResponse : AWSModel


/**
 <p>The number of entities that are affected by each of the specified events.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthEntityAggregate *> * _Nullable entityAggregates;

@end

/**
 
 */
@interface AWSHealthDescribeEventAggregatesRequest : AWSRequest


/**
 <p>The only currently supported value is <code>eventTypeCategory</code>.</p>
 */
@property (nonatomic, assign) AWSHealtheventAggregateField aggregateField;

/**
 <p>Values to narrow the results returned.</p>
 */
@property (nonatomic, strong) AWSHealthEventFilter * _Nullable filter;

/**
 <p>The maximum number of items to return in one batch, between 10 and 100, inclusive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeEventAggregatesResponse : AWSModel


/**
 <p>The number of events in each category that meet the optional filter criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthEventAggregate *> * _Nullable eventAggregates;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeEventDetailsForOrganizationRequest : AWSRequest


/**
 <p>The locale (language) to return information in. English (en) is the default and the only supported value at this time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>A set of JSON elements that includes the <code>awsAccountId</code> and the <code>eventArn</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthEventAccountFilter *> * _Nullable organizationEventDetailFilters;

@end

/**
 
 */
@interface AWSHealthDescribeEventDetailsForOrganizationResponse : AWSModel


/**
 <p>Error messages for any events that could not be retrieved.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthOrganizationEventDetailsErrorItem *> * _Nullable failedSet;

/**
 <p>Information about the events that could be retrieved.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthOrganizationEventDetails *> * _Nullable successfulSet;

@end

/**
 
 */
@interface AWSHealthDescribeEventDetailsRequest : AWSRequest


/**
 <p>A list of event ARNs (unique identifiers). For example: <code>"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456", "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventArns;

/**
 <p>The locale (language) to return information in. English (en) is the default and the only supported value at this time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

@end

/**
 
 */
@interface AWSHealthDescribeEventDetailsResponse : AWSModel


/**
 <p>Error messages for any events that could not be retrieved.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthEventDetailsErrorItem *> * _Nullable failedSet;

/**
 <p>Information about the events that could be retrieved.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthEventDetails *> * _Nullable successfulSet;

@end

/**
 
 */
@interface AWSHealthDescribeEventTypesRequest : AWSRequest


/**
 <p>Values to narrow the results returned.</p>
 */
@property (nonatomic, strong) AWSHealthEventTypeFilter * _Nullable filter;

/**
 <p>The locale (language) to return information in. English (en) is the default and the only supported value at this time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>The maximum number of items to return in one batch, between 10 and 100, inclusive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeEventTypesResponse : AWSModel


/**
 <p>A list of event types that match the filter criteria. Event types have a category (<code>issue</code>, <code>accountNotification</code>, or <code>scheduledChange</code>), a service (for example, <code>EC2</code>, <code>RDS</code>, <code>DATAPIPELINE</code>, <code>BILLING</code>), and a code (in the format <code>AWS_<i>SERVICE</i>_<i>DESCRIPTION</i></code>; for example, <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>).</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthEventType *> * _Nullable eventTypes;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeEventsForOrganizationRequest : AWSRequest


/**
 <p>Values to narrow the results returned.</p>
 */
@property (nonatomic, strong) AWSHealthOrganizationEventFilter * _Nullable filter;

/**
 <p>The locale (language) to return information in. English (en) is the default and the only supported value at this time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>The maximum number of items to return in one batch, between 10 and 100, inclusive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeEventsForOrganizationResponse : AWSModel


/**
 <p>The events that match the specified filter criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthOrganizationEvent *> * _Nullable events;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeEventsRequest : AWSRequest


/**
 <p>Values to narrow the results returned.</p>
 */
@property (nonatomic, strong) AWSHealthEventFilter * _Nullable filter;

/**
 <p>The locale (language) to return information in. English (en) is the default and the only supported value at this time.</p>
 */
@property (nonatomic, strong) NSString * _Nullable locale;

/**
 <p>The maximum number of items to return in one batch, between 10 and 100, inclusive.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeEventsResponse : AWSModel


/**
 <p>The events that match the specified filter criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthEvent *> * _Nullable events;

/**
 <p>If the results of a search are large, only a portion of the results are returned, and a <code>nextToken</code> pagination token is returned in the response. To retrieve the next batch of results, reissue the search request and include the returned token. When all results have been returned, the response does not contain a pagination token value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSHealthDescribeHealthServiceStatusForOrganizationResponse : AWSModel


/**
 <p>Information about the status of enabling or disabling AWS Health Organizational View in your organization.</p><p>Valid values are <code>ENABLED | DISABLED | PENDING</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable healthServiceAccessStatusForOrganization;

@end

/**
 <p>The number of entities that are affected by one or more events. Returned by the <a>DescribeEntityAggregates</a> operation.</p>
 */
@interface AWSHealthEntityAggregate : AWSModel


/**
 <p>The number entities that match the criteria for the specified events.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The unique identifier for the event. Format: <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i></code>. Example: <code>Example: arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable eventArn;

@end

/**
 <p>The values to use to filter results from the <a>DescribeAffectedEntities</a> operation.</p>
 Required parameters: [eventArns]
 */
@interface AWSHealthEntityFilter : AWSModel


/**
 <p>A list of entity ARNs (unique identifiers).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable entityArns;

/**
 <p>A list of IDs for affected entities.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable entityValues;

/**
 <p>A list of event ARNs (unique identifiers). For example: <code>"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456", "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventArns;

/**
 <p>A list of the most recent dates and times that the entity was updated.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthDateTimeRange *> * _Nullable lastUpdatedTimes;

/**
 <p>A list of entity status codes (<code>IMPAIRED</code>, <code>UNIMPAIRED</code>, or <code>UNKNOWN</code>).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable statusCodes;

/**
 <p>A map of entity tags attached to the affected entity.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> * _Nullable tags;

@end

/**
 <p>Summary information about an AWS Health event.</p>
 */
@interface AWSHealthEvent : AWSModel


/**
 <p>The unique identifier for the event. Format: <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i></code>. Example: <code>Example: arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The AWS Availability Zone of the event. For example, us-east-1a.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The date and time that the event ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 
 */
@property (nonatomic, assign) AWSHealtheventScopeCode eventScopeCode;

/**
 <p>The category of the event. Possible values are <code>issue</code>, <code>scheduledChange</code>, and <code>accountNotification</code>.</p>
 */
@property (nonatomic, assign) AWSHealtheventTypeCategory eventTypeCategory;

/**
 <p>The unique identifier for the event type. The format is <code>AWS_<i>SERVICE</i>_<i>DESCRIPTION</i></code>; for example, <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventTypeCode;

/**
 <p>The most recent date and time that the event was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The AWS region name of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The AWS service that is affected by the event. For example, <code>EC2</code>, <code>RDS</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable service;

/**
 <p>The date and time that the event began.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The most recent status of the event. Possible values are <code>open</code>, <code>closed</code>, and <code>upcoming</code>.</p>
 */
@property (nonatomic, assign) AWSHealtheventStatusCode statusCode;

@end

/**
 <p>The values used to filter results from the <a>DescribeEventDetailsForOrganization</a> and <a>DescribeAffectedEntitiesForOrganization</a> operations.</p>
 Required parameters: [eventArn]
 */
@interface AWSHealthEventAccountFilter : AWSModel


/**
 <p>The 12-digit AWS account numbers that contains the affected entities.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The unique identifier for the event. Format: <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i></code>. Example: <code>Example: arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable eventArn;

@end

/**
 <p>The number of events of each issue type. Returned by the <a>DescribeEventAggregates</a> operation.</p>
 */
@interface AWSHealthEventAggregate : AWSModel


/**
 <p>The issue type for the associated count.</p>
 */
@property (nonatomic, strong) NSString * _Nullable aggregateValue;

/**
 <p>The number of events of the associated issue type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

@end

/**
 <p>The detailed description of the event. Included in the information returned by the <a>DescribeEventDetails</a> operation.</p>
 */
@interface AWSHealthEventDescription : AWSModel


/**
 <p>The most recent description of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestDescription;

@end

/**
 <p>Detailed information about an event. A combination of an <a>Event</a> object, an <a>EventDescription</a> object, and additional metadata about the event. Returned by the <a>DescribeEventDetails</a> operation.</p>
 */
@interface AWSHealthEventDetails : AWSModel


/**
 <p>Summary information about the event.</p>
 */
@property (nonatomic, strong) AWSHealthEvent * _Nullable event;

/**
 <p>The most recent description of the event.</p>
 */
@property (nonatomic, strong) AWSHealthEventDescription * _Nullable eventDescription;

/**
 <p>Additional metadata about the event.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable eventMetadata;

@end

/**
 <p>Error information returned when a <a>DescribeEventDetails</a> operation cannot find a specified event.</p>
 */
@interface AWSHealthEventDetailsErrorItem : AWSModel


/**
 <p>A message that describes the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The name of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorName;

/**
 <p>The unique identifier for the event. Format: <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i></code>. Example: <code>Example: arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable eventArn;

@end

/**
 <p>The values to use to filter results from the <a>DescribeEvents</a> and <a>DescribeEventAggregates</a> operations.</p>
 */
@interface AWSHealthEventFilter : AWSModel


/**
 <p>A list of AWS availability zones.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>A list of dates and times that the event ended.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthDateTimeRange *> * _Nullable endTimes;

/**
 <p>A list of entity ARNs (unique identifiers).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable entityArns;

/**
 <p>A list of entity identifiers, such as EC2 instance IDs (<code>i-34ab692e</code>) or EBS volumes (<code>vol-426ab23e</code>).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable entityValues;

/**
 <p>A list of event ARNs (unique identifiers). For example: <code>"arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-CDE456", "arn:aws:health:us-west-1::event/EBS/AWS_EBS_LOST_VOLUME/AWS_EBS_LOST_VOLUME_CHI789_JKL101"</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventArns;

/**
 <p>A list of event status codes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventStatusCodes;

/**
 <p>A list of event type category codes (<code>issue</code>, <code>scheduledChange</code>, or <code>accountNotification</code>).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventTypeCategories;

/**
 <p>A list of unique identifiers for event types. For example, <code>"AWS_EC2_SYSTEM_MAINTENANCE_EVENT","AWS_RDS_MAINTENANCE_SCHEDULED".</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventTypeCodes;

/**
 <p>A list of dates and times that the event was last updated.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthDateTimeRange *> * _Nullable lastUpdatedTimes;

/**
 <p>A list of AWS regions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regions;

/**
 <p>The AWS services associated with the event. For example, <code>EC2</code>, <code>RDS</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable services;

/**
 <p>A list of dates and times that the event began.</p>
 */
@property (nonatomic, strong) NSArray<AWSHealthDateTimeRange *> * _Nullable startTimes;

/**
 <p>A map of entity tags attached to the affected entity.</p>
 */
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> * _Nullable tags;

@end

/**
 <p>Metadata about a type of event that is reported by AWS Health. Data consists of the category (for example, <code>issue</code>), the service (for example, <code>EC2</code>), and the event type code (for example, <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>).</p>
 */
@interface AWSHealthEventType : AWSModel


/**
 <p>A list of event type category codes (<code>issue</code>, <code>scheduledChange</code>, or <code>accountNotification</code>).</p>
 */
@property (nonatomic, assign) AWSHealtheventTypeCategory category;

/**
 <p>The unique identifier for the event type. The format is <code>AWS_<i>SERVICE</i>_<i>DESCRIPTION</i></code>; for example, <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The AWS service that is affected by the event. For example, <code>EC2</code>, <code>RDS</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable service;

@end

/**
 <p>The values to use to filter results from the <a>DescribeEventTypes</a> operation.</p>
 */
@interface AWSHealthEventTypeFilter : AWSModel


/**
 <p>A list of event type category codes (<code>issue</code>, <code>scheduledChange</code>, or <code>accountNotification</code>).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventTypeCategories;

/**
 <p>A list of event type codes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventTypeCodes;

/**
 <p>The AWS services associated with the event. For example, <code>EC2</code>, <code>RDS</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable services;

@end

/**
 <p>Error information returned when a <a>DescribeAffectedEntitiesForOrganization</a> operation cannot find or process a specific entity.</p>
 */
@interface AWSHealthOrganizationAffectedEntitiesErrorItem : AWSModel


/**
 <p>The 12-digit AWS account numbers that contains the affected entities.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>The unique identifier for the event type. The format is <code>AWS_SERVICE_DESCRIPTION</code>. For example, <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The name of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorName;

/**
 <p>The unique identifier for the event. Format: <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i></code>. Example: <code>Example: arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable eventArn;

@end

/**
 <p>Summary information about an event, returned by the <a>DescribeEventsForOrganization</a> operation.</p>
 */
@interface AWSHealthOrganizationEvent : AWSModel


/**
 <p>The unique identifier for the event. Format: <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i></code>. Example: <code>Example: arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time that the event ended.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable endTime;

/**
 
 */
@property (nonatomic, assign) AWSHealtheventScopeCode eventScopeCode;

/**
 <p>The category of the event type.</p>
 */
@property (nonatomic, assign) AWSHealtheventTypeCategory eventTypeCategory;

/**
 <p>The unique identifier for the event type. The format is <code>AWS_SERVICE_DESCRIPTION</code>. For example, <code>AWS_EC2_SYSTEM_MAINTENANCE_EVENT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventTypeCode;

/**
 <p>The most recent date and time that the event was updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The AWS Region name of the event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The AWS service that is affected by the event. For example, EC2, RDS.</p>
 */
@property (nonatomic, strong) NSString * _Nullable service;

/**
 <p>The date and time that the event began.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The most recent status of the event. Possible values are <code>open</code>, <code>closed</code>, and <code>upcoming</code>.</p>
 */
@property (nonatomic, assign) AWSHealtheventStatusCode statusCode;

@end

/**
 <p>Detailed information about an event. A combination of an <a>Event</a> object, an <a>EventDescription</a> object, and additional metadata about the event. Returned by the <a>DescribeEventDetailsForOrganization</a> operation.</p>
 */
@interface AWSHealthOrganizationEventDetails : AWSModel


/**
 <p>The 12-digit AWS account numbers that contains the affected entities.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>Summary information about an AWS Health event.</p>
 */
@property (nonatomic, strong) AWSHealthEvent * _Nullable event;

/**
 <p>The detailed description of the event. Included in the information returned by the <a>DescribeEventDetails</a> operation.</p>
 */
@property (nonatomic, strong) AWSHealthEventDescription * _Nullable eventDescription;

/**
 <p>Additional metadata about the event.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable eventMetadata;

@end

/**
 <p>Error information returned when a <a>DescribeEventDetailsForOrganization</a> operation cannot find a specified event.</p>
 */
@interface AWSHealthOrganizationEventDetailsErrorItem : AWSModel


/**
 <p>Error information returned when a <a>DescribeEventDetailsForOrganization</a> operation cannot find a specified event.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsAccountId;

/**
 <p>A message that describes the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 <p>The name of the error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorName;

/**
 <p>The unique identifier for the event. Format: <code>arn:aws:health:<i>event-region</i>::event/<i>SERVICE</i>/<i>EVENT_TYPE_CODE</i>/<i>EVENT_TYPE_PLUS_ID</i></code>. Example: <code>Example: arn:aws:health:us-east-1::event/EC2/EC2_INSTANCE_RETIREMENT_SCHEDULED/EC2_INSTANCE_RETIREMENT_SCHEDULED_ABC123-DEF456</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable eventArn;

@end

/**
 <p>The values to filter results from the <a>DescribeEventsForOrganization</a> operation.</p>
 */
@interface AWSHealthOrganizationEventFilter : AWSModel


/**
 <p>A list of 12-digit AWS account numbers that contains the affected entities.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable awsAccountIds;

/**
 <p>A range of dates and times that is used by the <a>EventFilter</a> and <a>EntityFilter</a> objects. If <code>from</code> is set and <code>to</code> is set: match items where the timestamp (<code>startTime</code>, <code>endTime</code>, or <code>lastUpdatedTime</code>) is between <code>from</code> and <code>to</code> inclusive. If <code>from</code> is set and <code>to</code> is not set: match items where the timestamp value is equal to or after <code>from</code>. If <code>from</code> is not set and <code>to</code> is set: match items where the timestamp value is equal to or before <code>to</code>.</p>
 */
@property (nonatomic, strong) AWSHealthDateTimeRange * _Nullable endTime;

/**
 <p>REPLACEME</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable entityArns;

/**
 <p>A list of entity identifiers, such as EC2 instance IDs (i-34ab692e) or EBS volumes (vol-426ab23e).</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable entityValues;

/**
 <p>A list of event status codes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventStatusCodes;

/**
 <p>REPLACEME</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventTypeCategories;

/**
 <p>A list of unique identifiers for event types. For example, <code>"AWS_EC2_SYSTEM_MAINTENANCE_EVENT","AWS_RDS_MAINTENANCE_SCHEDULED".</code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventTypeCodes;

/**
 <p>A range of dates and times that is used by the <a>EventFilter</a> and <a>EntityFilter</a> objects. If <code>from</code> is set and <code>to</code> is set: match items where the timestamp (<code>startTime</code>, <code>endTime</code>, or <code>lastUpdatedTime</code>) is between <code>from</code> and <code>to</code> inclusive. If <code>from</code> is set and <code>to</code> is not set: match items where the timestamp value is equal to or after <code>from</code>. If <code>from</code> is not set and <code>to</code> is set: match items where the timestamp value is equal to or before <code>to</code>.</p>
 */
@property (nonatomic, strong) AWSHealthDateTimeRange * _Nullable lastUpdatedTime;

/**
 <p>A list of AWS Regions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable regions;

/**
 <p>The AWS services associated with the event. For example, <code>EC2</code>, <code>RDS</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable services;

/**
 <p>A range of dates and times that is used by the <a>EventFilter</a> and <a>EntityFilter</a> objects. If <code>from</code> is set and <code>to</code> is set: match items where the timestamp (<code>startTime</code>, <code>endTime</code>, or <code>lastUpdatedTime</code>) is between <code>from</code> and <code>to</code> inclusive. If <code>from</code> is set and <code>to</code> is not set: match items where the timestamp value is equal to or after <code>from</code>. If <code>from</code> is not set and <code>to</code> is set: match items where the timestamp value is equal to or before <code>to</code>.</p>
 */
@property (nonatomic, strong) AWSHealthDateTimeRange * _Nullable startTime;

@end

NS_ASSUME_NONNULL_END
