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

FOUNDATION_EXPORT NSString *const AWSAWSSupportErrorDomain;

typedef NS_ENUM(NSInteger, AWSAWSSupportErrorType) {
    AWSAWSSupportErrorUnknown,
    AWSAWSSupportErrorAttachmentIdNotFound,
    AWSAWSSupportErrorAttachmentLimitExceeded,
    AWSAWSSupportErrorAttachmentSetExpired,
    AWSAWSSupportErrorAttachmentSetIdNotFound,
    AWSAWSSupportErrorAttachmentSetSizeLimitExceeded,
    AWSAWSSupportErrorCaseCreationLimitExceeded,
    AWSAWSSupportErrorCaseIdNotFound,
    AWSAWSSupportErrorDescribeAttachmentLimitExceeded,
    AWSAWSSupportErrorInternalServer,
};

@class AWSAWSSupportAddAttachmentsToSetRequest;
@class AWSAWSSupportAddAttachmentsToSetResponse;
@class AWSAWSSupportAddCommunicationToCaseRequest;
@class AWSAWSSupportAddCommunicationToCaseResponse;
@class AWSAWSSupportAttachment;
@class AWSAWSSupportAttachmentDetails;
@class AWSAWSSupportCaseDetails;
@class AWSAWSSupportCategory;
@class AWSAWSSupportCommunication;
@class AWSAWSSupportCreateCaseRequest;
@class AWSAWSSupportCreateCaseResponse;
@class AWSAWSSupportDescribeAttachmentRequest;
@class AWSAWSSupportDescribeAttachmentResponse;
@class AWSAWSSupportDescribeCasesRequest;
@class AWSAWSSupportDescribeCasesResponse;
@class AWSAWSSupportDescribeCommunicationsRequest;
@class AWSAWSSupportDescribeCommunicationsResponse;
@class AWSAWSSupportDescribeServicesRequest;
@class AWSAWSSupportDescribeServicesResponse;
@class AWSAWSSupportDescribeSeverityLevelsRequest;
@class AWSAWSSupportDescribeSeverityLevelsResponse;
@class AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest;
@class AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse;
@class AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest;
@class AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse;
@class AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest;
@class AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse;
@class AWSAWSSupportDescribeTrustedAdvisorChecksRequest;
@class AWSAWSSupportDescribeTrustedAdvisorChecksResponse;
@class AWSAWSSupportRecentCaseCommunications;
@class AWSAWSSupportRefreshTrustedAdvisorCheckRequest;
@class AWSAWSSupportRefreshTrustedAdvisorCheckResponse;
@class AWSAWSSupportResolveCaseRequest;
@class AWSAWSSupportResolveCaseResponse;
@class AWSAWSSupportService;
@class AWSAWSSupportSeverityLevel;
@class AWSAWSSupportTrustedAdvisorCategorySpecificSummary;
@class AWSAWSSupportTrustedAdvisorCheckDescription;
@class AWSAWSSupportTrustedAdvisorCheckRefreshStatus;
@class AWSAWSSupportTrustedAdvisorCheckResult;
@class AWSAWSSupportTrustedAdvisorCheckSummary;
@class AWSAWSSupportTrustedAdvisorCostOptimizingSummary;
@class AWSAWSSupportTrustedAdvisorResourceDetail;
@class AWSAWSSupportTrustedAdvisorResourcesSummary;

/**
 
 */
@interface AWSAWSSupportAddAttachmentsToSetRequest : AWSRequest


/**
 <p>The ID of the attachment set. If an <code>attachmentSetId</code> is not specified, a new attachment set is created, and the ID of the set is returned in the response. If an <code>attachmentSetId</code> is specified, the attachments are added to the specified set, if it exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentSetId;

/**
 <p>One or more attachments to add to the set. You can add up to three attachments per set. The size limit is 5 MB per attachment.</p><p>In the <code>Attachment</code> object, use the <code>data</code> parameter to specify the contents of the attachment file. In the previous request syntax, the value for <code>data</code> appear as <code>blob</code>, which is represented as a base64-encoded string. The value for <code>fileName</code> is the name of the attachment, such as <code>troubleshoot-screenshot.png</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportAttachment *> * _Nullable attachments;

@end

/**
 <p>The ID and expiry time of the attachment set returned by the <a>AddAttachmentsToSet</a> operation.</p>
 */
@interface AWSAWSSupportAddAttachmentsToSetResponse : AWSModel


/**
 <p>The ID of the attachment set. If an <code>attachmentSetId</code> was not specified, a new attachment set is created, and the ID of the set is returned in the response. If an <code>attachmentSetId</code> was specified, the attachments are added to the specified set, if it exists.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentSetId;

/**
 <p>The time and date when the attachment set expires.</p>
 */
@property (nonatomic, strong) NSString * _Nullable expiryTime;

@end

/**
 <p>To be written.</p>
 Required parameters: [communicationBody]
 */
@interface AWSAWSSupportAddCommunicationToCaseRequest : AWSRequest


/**
 <p>The ID of a set of one or more attachments for the communication to add to the case. Create the set by calling <a>AddAttachmentsToSet</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentSetId;

/**
 <p>The AWS Support case ID requested or returned in the call. The case ID is an alphanumeric string formatted as shown in this example: case-<i>12345678910-2013-c4c1d2bf33c5cf47</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable caseId;

/**
 <p>The email addresses in the CC line of an email to be added to the support case.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ccEmailAddresses;

/**
 <p>The body of an email communication to add to the support case.</p>
 */
@property (nonatomic, strong) NSString * _Nullable communicationBody;

@end

/**
 <p>The result of the <a>AddCommunicationToCase</a> operation.</p>
 */
@interface AWSAWSSupportAddCommunicationToCaseResponse : AWSModel


/**
 <p>True if <a>AddCommunicationToCase</a> succeeds. Otherwise, returns an error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable result;

@end

/**
 <p>An attachment to a case communication. The attachment consists of the file name and the content of the file.</p>
 */
@interface AWSAWSSupportAttachment : AWSModel


/**
 <p>The content of the attachment file.</p>
 */
@property (nonatomic, strong) NSData * _Nullable data;

/**
 <p>The name of the attachment file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileName;

@end

/**
 <p>The file name and ID of an attachment to a case communication. You can use the ID to retrieve the attachment with the <a>DescribeAttachment</a> operation.</p>
 */
@interface AWSAWSSupportAttachmentDetails : AWSModel


/**
 <p>The ID of the attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

/**
 <p>The file name of the attachment.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fileName;

@end

/**
 <p>A JSON-formatted object that contains the metadata for a support case. It is contained the response from a <a>DescribeCases</a> request. <b>CaseDetails</b> contains the following fields:</p><ul><li><p><b>caseId.</b> The AWS Support case ID requested or returned in the call. The case ID is an alphanumeric string formatted as shown in this example: case-<i>12345678910-2013-c4c1d2bf33c5cf47</i>.</p></li><li><p><b>categoryCode.</b> The category of problem for the AWS Support case. Corresponds to the CategoryCode values returned by a call to <a>DescribeServices</a>.</p></li><li><p><b>displayId.</b> The identifier for the case on pages in the AWS Support Center.</p></li><li><p><b>language.</b> The ISO 639-1 code for the language in which AWS provides support. AWS Support currently supports English ("en") and Japanese ("ja"). Language parameters must be passed explicitly for operations that take them.</p></li><li><p><b>recentCommunications.</b> One or more <a>Communication</a> objects. Fields of these objects are <code>attachments</code>, <code>body</code>, <code>caseId</code>, <code>submittedBy</code>, and <code>timeCreated</code>.</p></li><li><p><b>nextToken.</b> A resumption point for pagination.</p></li><li><p><b>serviceCode.</b> The identifier for the AWS service that corresponds to the service code defined in the call to <a>DescribeServices</a>.</p></li><li><p><b>severityCode.</b> The severity code assigned to the case. Contains one of the values returned by the call to <a>DescribeSeverityLevels</a>. The possible values are: <code>low</code>, <code>normal</code>, <code>high</code>, <code>urgent</code>, and <code>critical</code>.</p></li><li><p><b>status.</b> The status of the case in the AWS Support Center. Valid values:</p><ul><li><p><code>opened</code></p></li><li><p><code>pending-customer-action</code></p></li><li><p><code>reopened</code></p></li><li><p><code>resolved</code></p></li><li><p><code>unassigned</code></p></li><li><p><code>work-in-progress</code></p></li></ul></li><li><p><b>subject.</b> The subject line of the case.</p></li><li><p><b>submittedBy.</b> The email address of the account that submitted the case.</p></li><li><p><b>timeCreated.</b> The time the case was created, in ISO-8601 format.</p></li></ul>
 */
@interface AWSAWSSupportCaseDetails : AWSModel


/**
 <p>The AWS Support case ID requested or returned in the call. The case ID is an alphanumeric string formatted as shown in this example: case-<i>12345678910-2013-c4c1d2bf33c5cf47</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable caseId;

/**
 <p>The category of problem for the AWS Support case.</p>
 */
@property (nonatomic, strong) NSString * _Nullable categoryCode;

/**
 <p>The email addresses that receive copies of communication about the case.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ccEmailAddresses;

/**
 <p>The ID displayed for the case in the AWS Support Center. This is a numeric string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayId;

/**
 <p>The ISO 639-1 code for the language in which AWS provides support. AWS Support currently supports English ("en") and Japanese ("ja"). Language parameters must be passed explicitly for operations that take them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>The five most recent communications between you and AWS Support Center, including the IDs of any attachments to the communications. Also includes a <code>nextToken</code> that you can use to retrieve earlier communications.</p>
 */
@property (nonatomic, strong) AWSAWSSupportRecentCaseCommunications * _Nullable recentCommunications;

/**
 <p>The code for the AWS service. You can get a list of codes and the corresponding service names by calling <a>DescribeServices</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceCode;

/**
 <p>The code for the severity level returned by the call to <a>DescribeSeverityLevels</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable severityCode;

/**
 <p>The status of the case.</p><p>Valid values:</p><ul><li><p><code>opened</code></p></li><li><p><code>pending-customer-action</code></p></li><li><p><code>reopened</code></p></li><li><p><code>resolved</code></p></li><li><p><code>unassigned</code></p></li><li><p><code>work-in-progress</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The subject line for the case in the AWS Support Center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

/**
 <p>The email address of the account that submitted the case.</p>
 */
@property (nonatomic, strong) NSString * _Nullable submittedBy;

/**
 <p>The time that the case was case created in the AWS Support Center.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeCreated;

@end

/**
 <p>A JSON-formatted name/value pair that represents the category name and category code of the problem, selected from the <a>DescribeServices</a> response for each AWS service.</p>
 */
@interface AWSAWSSupportCategory : AWSModel


/**
 <p>The category code for the support case.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The category name for the support case.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A communication associated with an AWS Support case. The communication consists of the case ID, the message body, attachment information, the submitter of the communication, and the date and time of the communication.</p>
 */
@interface AWSAWSSupportCommunication : AWSModel


/**
 <p>Information about the attachments to the case communication.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportAttachmentDetails *> * _Nullable attachmentSet;

/**
 <p>The text of the communication between the customer and AWS Support.</p>
 */
@property (nonatomic, strong) NSString * _Nullable body;

/**
 <p>The AWS Support case ID requested or returned in the call. The case ID is an alphanumeric string formatted as shown in this example: case-<i>12345678910-2013-c4c1d2bf33c5cf47</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable caseId;

/**
 <p>The identity of the account that submitted, or responded to, the support case. Customer entries include the role or IAM user as well as the email address. For example, "AdminRole (Role) &lt;someone@example.com&gt;. Entries from the AWS Support team display "Amazon Web Services," and do not show an email address. </p>
 */
@property (nonatomic, strong) NSString * _Nullable submittedBy;

/**
 <p>The time the communication was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timeCreated;

@end

/**
 
 */
@interface AWSAWSSupportCreateCaseRequest : AWSRequest


/**
 <p>The ID of a set of one or more attachments for the case. Create the set by using the <a>AddAttachmentsToSet</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentSetId;

/**
 <p>The category of problem for the AWS Support case. You also use the <a>DescribeServices</a> operation to get the category code for a service. Each AWS service defines its own set of category codes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable categoryCode;

/**
 <p>A list of email addresses that AWS Support copies on case correspondence. AWS Support identifies the account that creates the case when you specify your AWS credentials in an HTTP POST method or use the <a href="http://aws.amazon.com/tools/">AWS SDKs</a>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ccEmailAddresses;

/**
 <p>The communication body text that describes the issue. This text appears in the <b>Description</b> field on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable communicationBody;

/**
 <p>The type of issue for the case. You can specify <code>customer-service</code> or <code>technical</code>. If you don't specify a value, the default is <code>technical</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable issueType;

/**
 <p>The language in which AWS Support handles the case. You must specify the ISO 639-1 code for the <code>language</code> parameter if you want support in that language. Currently, English ("en") and Japanese ("ja") are supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>The code for the AWS service. You can use the <a>DescribeServices</a> operation to get the possible <code>serviceCode</code> values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceCode;

/**
 <p>A value that indicates the urgency of the case. This value determines the response time according to your service level agreement with AWS Support. You can use the <a>DescribeSeverityLevels</a> operation to get the possible values for <code>severityCode</code>. </p><p>For more information, see <a>SeverityLevel</a> and <a href="https://docs.aws.amazon.com/awssupport/latest/user/getting-started.html#choosing-severity">Choosing a Severity</a> in the <i>AWS Support User Guide</i>.</p><note><p>The availability of severity levels depends on the support plan for the AWS account.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable severityCode;

/**
 <p>The title of the AWS Support case. The title appears in the <b>Subject</b> field on the AWS Support Center <a href="https://console.aws.amazon.com/support/home#/case/create">Create Case</a> page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

@end

/**
 <p>The AWS Support case ID returned by a successful completion of the <a>CreateCase</a> operation.</p>
 */
@interface AWSAWSSupportCreateCaseResponse : AWSModel


/**
 <p>The AWS Support case ID requested or returned in the call. The case ID is an alphanumeric string in the following format: case-<i>12345678910-2013-c4c1d2bf33c5cf47</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable caseId;

@end

/**
 
 */
@interface AWSAWSSupportDescribeAttachmentRequest : AWSRequest


/**
 <p>The ID of the attachment to return. Attachment IDs are returned by the <a>DescribeCommunications</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attachmentId;

@end

/**
 <p>The content and file name of the attachment returned by the <a>DescribeAttachment</a> operation.</p>
 */
@interface AWSAWSSupportDescribeAttachmentResponse : AWSModel


/**
 <p>This object includes the attachment content and file name.</p><p>In the previous response syntax, the value for the <code>data</code> parameter appears as <code>blob</code>, which is represented as a base64-encoded string. The value for <code>fileName</code> is the name of the attachment, such as <code>troubleshoot-screenshot.png</code>.</p>
 */
@property (nonatomic, strong) AWSAWSSupportAttachment * _Nullable attachment;

@end

/**
 
 */
@interface AWSAWSSupportDescribeCasesRequest : AWSRequest


/**
 <p>The start date for a filtered date search on support case communications. Case communications are available for 12 months after creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterTime;

/**
 <p>The end date for a filtered date search on support case communications. Case communications are available for 12 months after creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeTime;

/**
 <p>A list of ID numbers of the support cases you want returned. The maximum number of cases is 100.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable caseIdList;

/**
 <p>The ID displayed for a case in the AWS Support Center user interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayId;

/**
 <p>Specifies whether communications should be included in the <a>DescribeCases</a> results. The default is <i>true</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeCommunications;

/**
 <p>Specifies whether resolved support cases should be included in the <a>DescribeCases</a> results. The default is <i>false</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeResolvedCases;

/**
 <p>The ISO 639-1 code for the language in which AWS provides support. AWS Support currently supports English ("en") and Japanese ("ja"). Language parameters must be passed explicitly for operations that take them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>The maximum number of results to return before paginating.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A resumption point for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Returns an array of <a>CaseDetails</a> objects and a <code>nextToken</code> that defines a point for pagination in the result set.</p>
 */
@interface AWSAWSSupportDescribeCasesResponse : AWSModel


/**
 <p>The details for the cases that match the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportCaseDetails *> * _Nullable cases;

/**
 <p>A resumption point for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSSupportDescribeCommunicationsRequest : AWSRequest


/**
 <p>The start date for a filtered date search on support case communications. Case communications are available for 12 months after creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable afterTime;

/**
 <p>The end date for a filtered date search on support case communications. Case communications are available for 12 months after creation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable beforeTime;

/**
 <p>The AWS Support case ID requested or returned in the call. The case ID is an alphanumeric string formatted as shown in this example: case-<i>12345678910-2013-c4c1d2bf33c5cf47</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable caseId;

/**
 <p>The maximum number of results to return before paginating.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A resumption point for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The communications returned by the <a>DescribeCommunications</a> operation.</p>
 */
@interface AWSAWSSupportDescribeCommunicationsResponse : AWSModel


/**
 <p>The communications for the case.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportCommunication *> * _Nullable communications;

/**
 <p>A resumption point for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSAWSSupportDescribeServicesRequest : AWSRequest


/**
 <p>The ISO 639-1 code for the language in which AWS provides support. AWS Support currently supports English ("en") and Japanese ("ja"). Language parameters must be passed explicitly for operations that take them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

/**
 <p>A JSON-formatted list of service codes available for AWS services.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable serviceCodeList;

@end

/**
 <p>The list of AWS services returned by the <a>DescribeServices</a> operation.</p>
 */
@interface AWSAWSSupportDescribeServicesResponse : AWSModel


/**
 <p>A JSON-formatted list of AWS services.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportService *> * _Nullable services;

@end

/**
 
 */
@interface AWSAWSSupportDescribeSeverityLevelsRequest : AWSRequest


/**
 <p>The ISO 639-1 code for the language in which AWS provides support. AWS Support currently supports English ("en") and Japanese ("ja"). Language parameters must be passed explicitly for operations that take them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

@end

/**
 <p>The list of severity levels returned by the <a>DescribeSeverityLevels</a> operation.</p>
 */
@interface AWSAWSSupportDescribeSeverityLevelsResponse : AWSModel


/**
 <p>The available severity levels for the support case. Available severity levels are defined by your service level agreement with AWS.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportSeverityLevel *> * _Nullable severityLevels;

@end

/**
 <p/>
 Required parameters: [checkIds]
 */
@interface AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesRequest : AWSRequest


/**
 <p>The IDs of the Trusted Advisor checks to get the status of. <b>Note:</b> Specifying the check ID of a check that is automatically refreshed causes an <code>InvalidParameterValue</code> error.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable checkIds;

@end

/**
 <p>The statuses of the Trusted Advisor checks returned by the <a>DescribeTrustedAdvisorCheckRefreshStatuses</a> operation.</p>
 Required parameters: [statuses]
 */
@interface AWSAWSSupportDescribeTrustedAdvisorCheckRefreshStatusesResponse : AWSModel


/**
 <p>The refresh status of the specified Trusted Advisor checks.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportTrustedAdvisorCheckRefreshStatus *> * _Nullable statuses;

@end

/**
 <p/>
 Required parameters: [checkId]
 */
@interface AWSAWSSupportDescribeTrustedAdvisorCheckResultRequest : AWSRequest


/**
 <p>The unique identifier for the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkId;

/**
 <p>The ISO 639-1 code for the language in which AWS provides support. AWS Support currently supports English ("en") and Japanese ("ja"). Language parameters must be passed explicitly for operations that take them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

@end

/**
 <p>The result of the Trusted Advisor check returned by the <a>DescribeTrustedAdvisorCheckResult</a> operation.</p>
 */
@interface AWSAWSSupportDescribeTrustedAdvisorCheckResultResponse : AWSModel


/**
 <p>The detailed results of the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) AWSAWSSupportTrustedAdvisorCheckResult * _Nullable result;

@end

/**
 
 */
@interface AWSAWSSupportDescribeTrustedAdvisorCheckSummariesRequest : AWSRequest


/**
 <p>The IDs of the Trusted Advisor checks.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable checkIds;

@end

/**
 <p>The summaries of the Trusted Advisor checks returned by the <a>DescribeTrustedAdvisorCheckSummaries</a> operation.</p>
 Required parameters: [summaries]
 */
@interface AWSAWSSupportDescribeTrustedAdvisorCheckSummariesResponse : AWSModel


/**
 <p>The summary information for the requested Trusted Advisor checks.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportTrustedAdvisorCheckSummary *> * _Nullable summaries;

@end

/**
 <p/>
 Required parameters: [language]
 */
@interface AWSAWSSupportDescribeTrustedAdvisorChecksRequest : AWSRequest


/**
 <p>The ISO 639-1 code for the language in which AWS provides support. AWS Support currently supports English ("en") and Japanese ("ja"). Language parameters must be passed explicitly for operations that take them.</p>
 */
@property (nonatomic, strong) NSString * _Nullable language;

@end

/**
 <p>Information about the Trusted Advisor checks returned by the <a>DescribeTrustedAdvisorChecks</a> operation.</p>
 Required parameters: [checks]
 */
@interface AWSAWSSupportDescribeTrustedAdvisorChecksResponse : AWSModel


/**
 <p>Information about all available Trusted Advisor checks.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportTrustedAdvisorCheckDescription *> * _Nullable checks;

@end

/**
 <p>The five most recent communications associated with the case.</p>
 */
@interface AWSAWSSupportRecentCaseCommunications : AWSModel


/**
 <p>The five most recent communications associated with the case.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportCommunication *> * _Nullable communications;

/**
 <p>A resumption point for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p/>
 Required parameters: [checkId]
 */
@interface AWSAWSSupportRefreshTrustedAdvisorCheckRequest : AWSRequest


/**
 <p>The unique identifier for the Trusted Advisor check to refresh. <b>Note:</b> Specifying the check ID of a check that is automatically refreshed causes an <code>InvalidParameterValue</code> error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkId;

@end

/**
 <p>The current refresh status of a Trusted Advisor check.</p>
 Required parameters: [status]
 */
@interface AWSAWSSupportRefreshTrustedAdvisorCheckResponse : AWSModel


/**
 <p>The current refresh status for a check, including the amount of time until the check is eligible for refresh.</p>
 */
@property (nonatomic, strong) AWSAWSSupportTrustedAdvisorCheckRefreshStatus * _Nullable status;

@end

/**
 
 */
@interface AWSAWSSupportResolveCaseRequest : AWSRequest


/**
 <p>The AWS Support case ID requested or returned in the call. The case ID is an alphanumeric string formatted as shown in this example: case-<i>12345678910-2013-c4c1d2bf33c5cf47</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable caseId;

@end

/**
 <p>The status of the case returned by the <a>ResolveCase</a> operation.</p>
 */
@interface AWSAWSSupportResolveCaseResponse : AWSModel


/**
 <p>The status of the case after the <a>ResolveCase</a> request was processed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable finalCaseStatus;

/**
 <p>The status of the case when the <a>ResolveCase</a> request was sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable initialCaseStatus;

@end

/**
 <p>Information about an AWS service returned by the <a>DescribeServices</a> operation.</p>
 */
@interface AWSAWSSupportService : AWSModel


/**
 <p>A list of categories that describe the type of support issue a case describes. Categories consist of a category name and a category code. Category names and codes are passed to AWS Support when you call <a>CreateCase</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportCategory *> * _Nullable categories;

/**
 <p>The code for an AWS service returned by the <a>DescribeServices</a> response. The <code>name</code> element contains the corresponding friendly name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The friendly name for an AWS service. The <code>code</code> element contains the corresponding code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>A code and name pair that represents the severity level of a support case. The available values depend on the support plan for the account. For more information, see <a href="https://docs.aws.amazon.com/awssupport/latest/user/getting-started.html#choosing-severity">Choosing a Severity</a>.</p>
 */
@interface AWSAWSSupportSeverityLevel : AWSModel


/**
 <p>The code for case severity level.</p><p>Valid values: <code>low</code> | <code>normal</code> | <code>high</code> | <code>urgent</code> | <code>critical</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The name of the severity level that corresponds to the severity level code.</p><note><p>The values returned by the API differ from the values that are displayed in the AWS Support Center. For example, for the code "low", the API name is "Low", but the name in the Support Center is "General guidance". These are the Support Center code/name mappings:</p><ul><li><p><code>low</code>: General guidance</p></li><li><p><code>normal</code>: System impaired</p></li><li><p><code>high</code>: Production system impaired</p></li><li><p><code>urgent</code>: Production system down</p></li><li><p><code>critical</code>: Business-critical system down</p></li></ul></note><p>For more information, see <a href="https://docs.aws.amazon.com/awssupport/latest/user/getting-started.html#choosing-severity">Choosing a Severity</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The container for summary information that relates to the category of the Trusted Advisor check.</p>
 */
@interface AWSAWSSupportTrustedAdvisorCategorySpecificSummary : AWSModel


/**
 <p>The summary information about cost savings for a Trusted Advisor check that is in the Cost Optimizing category.</p>
 */
@property (nonatomic, strong) AWSAWSSupportTrustedAdvisorCostOptimizingSummary * _Nullable costOptimizing;

@end

/**
 <p>The description and metadata for a Trusted Advisor check.</p>
 Required parameters: [id, name, description, category, metadata]
 */
@interface AWSAWSSupportTrustedAdvisorCheckDescription : AWSModel


/**
 <p>The category of the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable category;

/**
 <p>The description of the Trusted Advisor check, which includes the alert criteria and recommended operations (contains HTML markup).</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique identifier for the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The column headings for the data returned by the Trusted Advisor check. The order of the headings corresponds to the order of the data in the <b>Metadata</b> element of the <a>TrustedAdvisorResourceDetail</a> for the check. <b>Metadata</b> contains all the data that is shown in the Excel download, even in those cases where the UI shows just summary data. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metadata;

/**
 <p>The display name for the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>The refresh status of a Trusted Advisor check.</p>
 Required parameters: [checkId, status, millisUntilNextRefreshable]
 */
@interface AWSAWSSupportTrustedAdvisorCheckRefreshStatus : AWSModel


/**
 <p>The unique identifier for the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkId;

/**
 <p>The amount of time, in milliseconds, until the Trusted Advisor check is eligible for refresh.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable millisUntilNextRefreshable;

/**
 <p>The status of the Trusted Advisor check for which a refresh has been requested: </p><ul><li><p><code>none:</code> The check is not refreshed or the non-success status exceeds the timeout</p></li><li><p><code>enqueued:</code> The check refresh requests has entered the refresh queue</p></li><li><p><code>processing:</code> The check refresh request is picked up by the rule processing engine</p></li><li><p><code>success:</code> The check is successfully refreshed</p></li><li><p><code>abandoned:</code> The check refresh has failed</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>The results of a Trusted Advisor check returned by <a>DescribeTrustedAdvisorCheckResult</a>.</p>
 Required parameters: [checkId, timestamp, status, resourcesSummary, categorySpecificSummary, flaggedResources]
 */
@interface AWSAWSSupportTrustedAdvisorCheckResult : AWSModel


/**
 <p>Summary information that relates to the category of the check. Cost Optimizing is the only category that is currently supported.</p>
 */
@property (nonatomic, strong) AWSAWSSupportTrustedAdvisorCategorySpecificSummary * _Nullable categorySpecificSummary;

/**
 <p>The unique identifier for the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkId;

/**
 <p>The details about each resource listed in the check result.</p>
 */
@property (nonatomic, strong) NSArray<AWSAWSSupportTrustedAdvisorResourceDetail *> * _Nullable flaggedResources;

/**
 <p>Details about AWS resources that were analyzed in a call to Trusted Advisor <a>DescribeTrustedAdvisorCheckSummaries</a>.</p>
 */
@property (nonatomic, strong) AWSAWSSupportTrustedAdvisorResourcesSummary * _Nullable resourcesSummary;

/**
 <p>The alert status of the check: "ok" (green), "warning" (yellow), "error" (red), or "not_available".</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The time of the last refresh of the check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timestamp;

@end

/**
 <p>A summary of a Trusted Advisor check result, including the alert status, last refresh, and number of resources examined.</p>
 Required parameters: [checkId, timestamp, status, resourcesSummary, categorySpecificSummary]
 */
@interface AWSAWSSupportTrustedAdvisorCheckSummary : AWSModel


/**
 <p>Summary information that relates to the category of the check. Cost Optimizing is the only category that is currently supported.</p>
 */
@property (nonatomic, strong) AWSAWSSupportTrustedAdvisorCategorySpecificSummary * _Nullable categorySpecificSummary;

/**
 <p>The unique identifier for the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkId;

/**
 <p>Specifies whether the Trusted Advisor check has flagged resources.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hasFlaggedResources;

/**
 <p>Details about AWS resources that were analyzed in a call to Trusted Advisor <a>DescribeTrustedAdvisorCheckSummaries</a>.</p>
 */
@property (nonatomic, strong) AWSAWSSupportTrustedAdvisorResourcesSummary * _Nullable resourcesSummary;

/**
 <p>The alert status of the check: "ok" (green), "warning" (yellow), "error" (red), or "not_available".</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The time of the last refresh of the check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timestamp;

@end

/**
 <p>The estimated cost savings that might be realized if the recommended operations are taken.</p>
 Required parameters: [estimatedMonthlySavings, estimatedPercentMonthlySavings]
 */
@interface AWSAWSSupportTrustedAdvisorCostOptimizingSummary : AWSModel


/**
 <p>The estimated monthly savings that might be realized if the recommended operations are taken.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedMonthlySavings;

/**
 <p>The estimated percentage of savings that might be realized if the recommended operations are taken.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedPercentMonthlySavings;

@end

/**
 <p>Contains information about a resource identified by a Trusted Advisor check.</p>
 Required parameters: [status, resourceId, metadata]
 */
@interface AWSAWSSupportTrustedAdvisorResourceDetail : AWSModel


/**
 <p>Specifies whether the AWS resource was ignored by Trusted Advisor because it was marked as suppressed by the user.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isSuppressed;

/**
 <p>Additional information about the identified resource. The exact metadata and its order can be obtained by inspecting the <a>TrustedAdvisorCheckDescription</a> object returned by the call to <a>DescribeTrustedAdvisorChecks</a>. <b>Metadata</b> contains all the data that is shown in the Excel download, even in those cases where the UI shows just summary data.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable metadata;

/**
 <p>The AWS region in which the identified resource is located.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The unique identifier for the identified resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The status code for the resource identified in the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) NSString * _Nullable status;

@end

/**
 <p>Details about AWS resources that were analyzed in a call to Trusted Advisor <a>DescribeTrustedAdvisorCheckSummaries</a>.</p>
 Required parameters: [resourcesProcessed, resourcesFlagged, resourcesIgnored, resourcesSuppressed]
 */
@interface AWSAWSSupportTrustedAdvisorResourcesSummary : AWSModel


/**
 <p>The number of AWS resources that were flagged (listed) by the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resourcesFlagged;

/**
 <p>The number of AWS resources ignored by Trusted Advisor because information was unavailable.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resourcesIgnored;

/**
 <p>The number of AWS resources that were analyzed by the Trusted Advisor check.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resourcesProcessed;

/**
 <p>The number of AWS resources ignored by Trusted Advisor because they were marked as suppressed by the user.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable resourcesSuppressed;

@end

NS_ASSUME_NONNULL_END
