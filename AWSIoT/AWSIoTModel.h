//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSIoTErrorDomain;

typedef NS_ENUM(NSInteger, AWSIoTErrorType) {
    AWSIoTErrorUnknown,
    AWSIoTErrorCertificateConflict,
    AWSIoTErrorCertificateState,
    AWSIoTErrorCertificateValidation,
    AWSIoTErrorDeleteConflict,
    AWSIoTErrorInternal,
    AWSIoTErrorInternalFailure,
    AWSIoTErrorInvalidRequest,
    AWSIoTErrorLimitExceeded,
    AWSIoTErrorMalformedPolicy,
    AWSIoTErrorRegistrationCodeValidation,
    AWSIoTErrorResourceAlreadyExists,
    AWSIoTErrorResourceNotFound,
    AWSIoTErrorServiceUnavailable,
    AWSIoTErrorSqlParse,
    AWSIoTErrorThrottling,
    AWSIoTErrorTransferAlreadyCompleted,
    AWSIoTErrorTransferConflict,
    AWSIoTErrorUnauthorized,
    AWSIoTErrorVersionConflict,
    AWSIoTErrorVersionsLimitExceeded,
};

typedef NS_ENUM(NSInteger, AWSIoTAutoRegistrationStatus) {
    AWSIoTAutoRegistrationStatusUnknown,
    AWSIoTAutoRegistrationStatusEnable,
    AWSIoTAutoRegistrationStatusDisable,
};

typedef NS_ENUM(NSInteger, AWSIoTCACertificateStatus) {
    AWSIoTCACertificateStatusUnknown,
    AWSIoTCACertificateStatusActive,
    AWSIoTCACertificateStatusInactive,
};

typedef NS_ENUM(NSInteger, AWSIoTCannedAccessControlList) {
    AWSIoTCannedAccessControlListUnknown,
    AWSIoTCannedAccessControlListPrivate,
    AWSIoTCannedAccessControlListPublicRead,
    AWSIoTCannedAccessControlListPublicReadWrite,
    AWSIoTCannedAccessControlListAwsExecRead,
    AWSIoTCannedAccessControlListAuthenticatedRead,
    AWSIoTCannedAccessControlListBucketOwnerRead,
    AWSIoTCannedAccessControlListBucketOwnerFullControl,
    AWSIoTCannedAccessControlListLogDeliveryWrite,
};

typedef NS_ENUM(NSInteger, AWSIoTCertificateStatus) {
    AWSIoTCertificateStatusUnknown,
    AWSIoTCertificateStatusActive,
    AWSIoTCertificateStatusInactive,
    AWSIoTCertificateStatusRevoked,
    AWSIoTCertificateStatusPendingTransfer,
    AWSIoTCertificateStatusRegisterInactive,
    AWSIoTCertificateStatusPendingActivation,
};

typedef NS_ENUM(NSInteger, AWSIoTDynamoKeyType) {
    AWSIoTDynamoKeyTypeUnknown,
    AWSIoTDynamoKeyTypeString,
    AWSIoTDynamoKeyTypeNumber,
};

typedef NS_ENUM(NSInteger, AWSIoTLogLevel) {
    AWSIoTLogLevelUnknown,
    AWSIoTLogLevelDebug,
    AWSIoTLogLevelInfo,
    AWSIoTLogLevelError,
    AWSIoTLogLevelWarn,
    AWSIoTLogLevelDisabled,
};

typedef NS_ENUM(NSInteger, AWSIoTMessageFormat) {
    AWSIoTMessageFormatUnknown,
    AWSIoTMessageFormatRAW,
    AWSIoTMessageFormatJson,
};

@class AWSIoTAcceptCertificateTransferRequest;
@class AWSIoTAction;
@class AWSIoTAttachPrincipalPolicyRequest;
@class AWSIoTAttachThingPrincipalRequest;
@class AWSIoTAttachThingPrincipalResponse;
@class AWSIoTAttributePayload;
@class AWSIoTCACertificate;
@class AWSIoTCACertificateDescription;
@class AWSIoTCancelCertificateTransferRequest;
@class AWSIoTCertificate;
@class AWSIoTCertificateDescription;
@class AWSIoTCloudwatchAlarmAction;
@class AWSIoTCloudwatchMetricAction;
@class AWSIoTCreateCertificateFromCsrRequest;
@class AWSIoTCreateCertificateFromCsrResponse;
@class AWSIoTCreateKeysAndCertificateRequest;
@class AWSIoTCreateKeysAndCertificateResponse;
@class AWSIoTCreatePolicyRequest;
@class AWSIoTCreatePolicyResponse;
@class AWSIoTCreatePolicyVersionRequest;
@class AWSIoTCreatePolicyVersionResponse;
@class AWSIoTCreateThingRequest;
@class AWSIoTCreateThingResponse;
@class AWSIoTCreateThingTypeRequest;
@class AWSIoTCreateThingTypeResponse;
@class AWSIoTCreateTopicRuleRequest;
@class AWSIoTDeleteCACertificateRequest;
@class AWSIoTDeleteCACertificateResponse;
@class AWSIoTDeleteCertificateRequest;
@class AWSIoTDeletePolicyRequest;
@class AWSIoTDeletePolicyVersionRequest;
@class AWSIoTDeleteRegistrationCodeRequest;
@class AWSIoTDeleteRegistrationCodeResponse;
@class AWSIoTDeleteThingRequest;
@class AWSIoTDeleteThingResponse;
@class AWSIoTDeleteThingTypeRequest;
@class AWSIoTDeleteThingTypeResponse;
@class AWSIoTDeleteTopicRuleRequest;
@class AWSIoTDeprecateThingTypeRequest;
@class AWSIoTDeprecateThingTypeResponse;
@class AWSIoTDescribeCACertificateRequest;
@class AWSIoTDescribeCACertificateResponse;
@class AWSIoTDescribeCertificateRequest;
@class AWSIoTDescribeCertificateResponse;
@class AWSIoTDescribeEndpointRequest;
@class AWSIoTDescribeEndpointResponse;
@class AWSIoTDescribeThingRequest;
@class AWSIoTDescribeThingResponse;
@class AWSIoTDescribeThingTypeRequest;
@class AWSIoTDescribeThingTypeResponse;
@class AWSIoTDetachPrincipalPolicyRequest;
@class AWSIoTDetachThingPrincipalRequest;
@class AWSIoTDetachThingPrincipalResponse;
@class AWSIoTDisableTopicRuleRequest;
@class AWSIoTDynamoDBAction;
@class AWSIoTDynamoDBv2Action;
@class AWSIoTElasticsearchAction;
@class AWSIoTEnableTopicRuleRequest;
@class AWSIoTFirehoseAction;
@class AWSIoTGetLoggingOptionsRequest;
@class AWSIoTGetLoggingOptionsResponse;
@class AWSIoTGetPolicyRequest;
@class AWSIoTGetPolicyResponse;
@class AWSIoTGetPolicyVersionRequest;
@class AWSIoTGetPolicyVersionResponse;
@class AWSIoTGetRegistrationCodeRequest;
@class AWSIoTGetRegistrationCodeResponse;
@class AWSIoTGetTopicRuleRequest;
@class AWSIoTGetTopicRuleResponse;
@class AWSIoTKeyPair;
@class AWSIoTKinesisAction;
@class AWSIoTLambdaAction;
@class AWSIoTListCACertificatesRequest;
@class AWSIoTListCACertificatesResponse;
@class AWSIoTListCertificatesByCARequest;
@class AWSIoTListCertificatesByCAResponse;
@class AWSIoTListCertificatesRequest;
@class AWSIoTListCertificatesResponse;
@class AWSIoTListOutgoingCertificatesRequest;
@class AWSIoTListOutgoingCertificatesResponse;
@class AWSIoTListPoliciesRequest;
@class AWSIoTListPoliciesResponse;
@class AWSIoTListPolicyPrincipalsRequest;
@class AWSIoTListPolicyPrincipalsResponse;
@class AWSIoTListPolicyVersionsRequest;
@class AWSIoTListPolicyVersionsResponse;
@class AWSIoTListPrincipalPoliciesRequest;
@class AWSIoTListPrincipalPoliciesResponse;
@class AWSIoTListPrincipalThingsRequest;
@class AWSIoTListPrincipalThingsResponse;
@class AWSIoTListThingPrincipalsRequest;
@class AWSIoTListThingPrincipalsResponse;
@class AWSIoTListThingTypesRequest;
@class AWSIoTListThingTypesResponse;
@class AWSIoTListThingsRequest;
@class AWSIoTListThingsResponse;
@class AWSIoTListTopicRulesRequest;
@class AWSIoTListTopicRulesResponse;
@class AWSIoTLoggingOptionsPayload;
@class AWSIoTOutgoingCertificate;
@class AWSIoTPolicy;
@class AWSIoTPolicyVersion;
@class AWSIoTPutItemInput;
@class AWSIoTRegisterCACertificateRequest;
@class AWSIoTRegisterCACertificateResponse;
@class AWSIoTRegisterCertificateRequest;
@class AWSIoTRegisterCertificateResponse;
@class AWSIoTRejectCertificateTransferRequest;
@class AWSIoTReplaceTopicRuleRequest;
@class AWSIoTRepublishAction;
@class AWSIoTS3Action;
@class AWSIoTSetDefaultPolicyVersionRequest;
@class AWSIoTSetLoggingOptionsRequest;
@class AWSIoTSnsAction;
@class AWSIoTSqsAction;
@class AWSIoTThingAttribute;
@class AWSIoTThingTypeDefinition;
@class AWSIoTThingTypeMetadata;
@class AWSIoTThingTypeProperties;
@class AWSIoTTopicRule;
@class AWSIoTTopicRuleListItem;
@class AWSIoTTopicRulePayload;
@class AWSIoTTransferCertificateRequest;
@class AWSIoTTransferCertificateResponse;
@class AWSIoTTransferData;
@class AWSIoTUpdateCACertificateRequest;
@class AWSIoTUpdateCertificateRequest;
@class AWSIoTUpdateThingRequest;
@class AWSIoTUpdateThingResponse;

/**
 <p>The input for the AcceptCertificateTransfer operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTAcceptCertificateTransferRequest : AWSRequest


/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>Specifies whether the certificate is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

@end

/**
 <p>Describes the actions associated with a rule.</p>
 */
@interface AWSIoTAction : AWSModel


/**
 <p>Change the state of a CloudWatch alarm.</p>
 */
@property (nonatomic, strong) AWSIoTCloudwatchAlarmAction * _Nullable cloudwatchAlarm;

/**
 <p>Capture a CloudWatch metric.</p>
 */
@property (nonatomic, strong) AWSIoTCloudwatchMetricAction * _Nullable cloudwatchMetric;

/**
 <p>Write to a DynamoDB table.</p>
 */
@property (nonatomic, strong) AWSIoTDynamoDBAction * _Nullable dynamoDB;

/**
 <p>Write to a DynamoDB table. This is a new version of the DynamoDB action. It allows you to write each attribute in an MQTT message payload into a separate DynamoDB column.</p>
 */
@property (nonatomic, strong) AWSIoTDynamoDBv2Action * _Nullable dynamoDBv2;

/**
 <p>Write data to an Amazon Elasticsearch Service domain.</p>
 */
@property (nonatomic, strong) AWSIoTElasticsearchAction * _Nullable elasticsearch;

/**
 <p>Write to an Amazon Kinesis Firehose stream.</p>
 */
@property (nonatomic, strong) AWSIoTFirehoseAction * _Nullable firehose;

/**
 <p>Write data to an Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) AWSIoTKinesisAction * _Nullable kinesis;

/**
 <p>Invoke a Lambda function.</p>
 */
@property (nonatomic, strong) AWSIoTLambdaAction * _Nullable lambda;

/**
 <p>Publish to another MQTT topic.</p>
 */
@property (nonatomic, strong) AWSIoTRepublishAction * _Nullable republish;

/**
 <p>Write to an Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) AWSIoTS3Action * _Nullable s3;

/**
 <p>Publish to an Amazon SNS topic.</p>
 */
@property (nonatomic, strong) AWSIoTSnsAction * _Nullable sns;

/**
 <p>Publish to an Amazon SQS queue.</p>
 */
@property (nonatomic, strong) AWSIoTSqsAction * _Nullable sqs;

@end

/**
 <p>The input for the AttachPrincipalPolicy operation.</p>
 Required parameters: [policyName, principal]
 */
@interface AWSIoTAttachPrincipalPolicyRequest : AWSRequest


/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The principal, which can be a certificate ARN (as returned from the CreateCertificate operation) or an Amazon Cognito ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The input for the AttachThingPrincipal operation.</p>
 Required parameters: [thingName, principal]
 */
@interface AWSIoTAttachThingPrincipalRequest : AWSRequest


/**
 <p>The principal, such as a certificate or other credential.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the AttachThingPrincipal operation.</p>
 */
@interface AWSIoTAttachThingPrincipalResponse : AWSModel


@end

/**
 <p>The attribute payload.</p>
 */
@interface AWSIoTAttributePayload : AWSModel


/**
 <p>A JSON string containing up to three key-value pair in JSON format. For example:</p><p><code>{\"attributes\":{\"string1\":\"string2\"}})</code></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>Specifies whether the list of attributes provided in the <code>AttributePayload</code> is merged with the attributes stored in the registry, instead of overwriting them.</p><p>To remove an attribute, call <code>UpdateThing</code> with an empty attribute value.</p><note><p>The <code>merge</code> attribute is only valid when calling <code>UpdateThing</code>.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable merge;

@end

/**
 <p>A CA certificate.</p>
 */
@interface AWSIoTCACertificate : AWSModel


/**
 <p>The ARN of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The date the CA certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The status of the CA certificate. </p><p>The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCACertificateStatus status;

@end

/**
 <p>Describes a CA certificate.</p>
 */
@interface AWSIoTCACertificateDescription : AWSModel


/**
 <p>Whether the CA certificate configured for auto registration of device certificates. Valid values are "ENABLE" and "DISABLE"</p>
 */
@property (nonatomic, assign) AWSIoTAutoRegistrationStatus autoRegistrationStatus;

/**
 <p>The CA certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The CA certificate ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The CA certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The date the CA certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The owner of the CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownedBy;

/**
 <p>The status of a CA certificate.</p>
 */
@property (nonatomic, assign) AWSIoTCACertificateStatus status;

@end

/**
 <p>The input for the CancelCertificateTransfer operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTCancelCertificateTransferRequest : AWSRequest


/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>Information about a certificate.</p>
 */
@interface AWSIoTCertificate : AWSModel


/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The date and time the certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The status of the certificate.</p><p>The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

@end

/**
 <p>Describes a certificate.</p>
 */
@interface AWSIoTCertificateDescription : AWSModel


/**
 <p>The certificate ID of the CA certificate used to sign this certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificateId;

/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The date and time the certificate was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date and time the certificate was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The ID of the AWS account that owns the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ownedBy;

/**
 <p>The ID of the AWS account of the previous owner of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable previousOwnedBy;

/**
 <p>The status of the certificate.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

/**
 <p>The transfer data.</p>
 */
@property (nonatomic, strong) AWSIoTTransferData * _Nullable transferData;

@end

/**
 <p>Describes an action that updates a CloudWatch alarm.</p>
 Required parameters: [roleArn, alarmName, stateReason, stateValue]
 */
@interface AWSIoTCloudwatchAlarmAction : AWSModel


/**
 <p>The CloudWatch alarm name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable alarmName;

/**
 <p>The IAM role that allows access to the CloudWatch alarm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The reason for the alarm change.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateReason;

/**
 <p>The value of the alarm state. Acceptable values are: OK, ALARM, INSUFFICIENT_DATA.</p>
 */
@property (nonatomic, strong) NSString * _Nullable stateValue;

@end

/**
 <p>Describes an action that captures a CloudWatch metric.</p>
 Required parameters: [roleArn, metricNamespace, metricName, metricValue, metricUnit]
 */
@interface AWSIoTCloudwatchMetricAction : AWSModel


/**
 <p>The CloudWatch metric name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricName;

/**
 <p>The CloudWatch metric namespace name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricNamespace;

/**
 <p>An optional <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp">Unix timestamp</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricTimestamp;

/**
 <p>The <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#Unit">metric unit</a> supported by CloudWatch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricUnit;

/**
 <p>The CloudWatch metric value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable metricValue;

/**
 <p>The IAM role that allows access to the CloudWatch metric.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The input for the CreateCertificateFromCsr operation.</p>
 Required parameters: [certificateSigningRequest]
 */
@interface AWSIoTCreateCertificateFromCsrRequest : AWSRequest


/**
 <p>The certificate signing request (CSR).</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateSigningRequest;

/**
 <p>Specifies whether the certificate is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

@end

/**
 <p>The output from the CreateCertificateFromCsr operation.</p>
 */
@interface AWSIoTCreateCertificateFromCsrResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the certificate. You can use the ARN as a principal for policy operations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate. Certificate management operations only take a certificateId.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

@end

/**
 <p>The input for the CreateKeysAndCertificate operation.</p>
 */
@interface AWSIoTCreateKeysAndCertificateRequest : AWSRequest


/**
 <p>Specifies whether the certificate is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

@end

/**
 <p>The output of the CreateKeysAndCertificate operation.</p>
 */
@interface AWSIoTCreateKeysAndCertificateResponse : AWSModel


/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The ID of the certificate. AWS IoT issues a default subject name for the certificate (for example, AWS IoT Certificate).</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>The generated key pair.</p>
 */
@property (nonatomic, strong) AWSIoTKeyPair * _Nullable keyPair;

@end

/**
 <p>The input for the CreatePolicy operation.</p>
 Required parameters: [policyName, policyDocument]
 */
@interface AWSIoTCreatePolicyRequest : AWSRequest


/**
 <p>The JSON document that describes the policy. <b>policyDocument</b> must have a minimum length of 1, with a maximum length of 2048, excluding whitespace.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the CreatePolicy operation.</p>
 */
@interface AWSIoTCreatePolicyResponse : AWSModel


/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input for the CreatePolicyVersion operation.</p>
 Required parameters: [policyName, policyDocument]
 */
@interface AWSIoTCreatePolicyVersionRequest : AWSRequest


/**
 <p>The JSON document that describes the policy. Minimum length of 1. Maximum length of 2048, excluding whitespaces</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>Specifies whether the policy version is set as the default. When this parameter is true, the new policy version becomes the operative version (that is, the version that is in effect for the certificates to which the policy is attached).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsDefault;

@end

/**
 <p>The output of the CreatePolicyVersion operation.</p>
 */
@interface AWSIoTCreatePolicyVersionResponse : AWSModel


/**
 <p>Specifies whether the policy version is the default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input for the CreateThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTCreateThingRequest : AWSRequest


/**
 <p>The attribute payload, which consists of up to three name/value pairs in a JSON document. For example:</p><p><code>{\"attributes\":{\"string1\":\"string2\"}})</code></p>
 */
@property (nonatomic, strong) AWSIoTAttributePayload * _Nullable attributePayload;

/**
 <p>The name of the thing to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The name of the thing type associated with the new thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output of the CreateThing operation.</p>
 */
@interface AWSIoTCreateThingResponse : AWSModel


/**
 <p>The ARN of the new thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The name of the new thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The input for the CreateThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTCreateThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The ThingTypeProperties for the thing type to create. It contains information about the new thing type including a description, and a list of searchable thing attribute names.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeProperties * _Nullable thingTypeProperties;

@end

/**
 <p>The output of the CreateThingType operation.</p>
 */
@interface AWSIoTCreateThingTypeResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeArn;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The input for the CreateTopicRule operation.</p>
 Required parameters: [ruleName, topicRulePayload]
 */
@interface AWSIoTCreateTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The rule payload.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRulePayload * _Nullable topicRulePayload;

@end

/**
 <p>Input for the DeleteCACertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDeleteCACertificateRequest : AWSRequest


/**
 <p>The ID of the certificate to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The output for the DeleteCACertificate operation.</p>
 */
@interface AWSIoTDeleteCACertificateResponse : AWSModel


@end

/**
 <p>The input for the DeleteCertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDeleteCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The input for the DeletePolicy operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTDeletePolicyRequest : AWSRequest


/**
 <p>The name of the policy to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The input for the DeletePolicyVersion operation.</p>
 Required parameters: [policyName, policyVersionId]
 */
@interface AWSIoTDeletePolicyVersionRequest : AWSRequest


/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input for the DeleteRegistrationCode operation.</p>
 */
@interface AWSIoTDeleteRegistrationCodeRequest : AWSRequest


@end

/**
 <p>The output for the DeleteRegistrationCode operation. </p>
 */
@interface AWSIoTDeleteRegistrationCodeResponse : AWSModel


@end

/**
 <p>The input for the DeleteThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDeleteThingRequest : AWSRequest


/**
 <p>The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the <code>DeleteThing</code> request is rejected with a <code>VersionConflictException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>The name of the thing to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output of the DeleteThing operation.</p>
 */
@interface AWSIoTDeleteThingResponse : AWSModel


@end

/**
 <p>The input for the DeleteThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTDeleteThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output for the DeleteThingType operation.</p>
 */
@interface AWSIoTDeleteThingTypeResponse : AWSModel


@end

/**
 <p>The input for the DeleteTopicRule operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTDeleteTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>The input for the DeprecateThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTDeprecateThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type to deprecate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>Whether to undeprecate a deprecated thing type. If <b>true</b>, the thing type will not be deprecated anymore and you can associate it with things.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable undoDeprecate;

@end

/**
 <p>The output for the DeprecateThingType operation.</p>
 */
@interface AWSIoTDeprecateThingTypeResponse : AWSModel


@end

/**
 <p>The input for the DescribeCACertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDescribeCACertificateRequest : AWSRequest


/**
 <p>The CA certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The output from the DescribeCACertificate operation.</p>
 */
@interface AWSIoTDescribeCACertificateResponse : AWSModel


/**
 <p>The CA certificate description.</p>
 */
@property (nonatomic, strong) AWSIoTCACertificateDescription * _Nullable certificateDescription;

@end

/**
 <p>The input for the DescribeCertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTDescribeCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The output of the DescribeCertificate operation.</p>
 */
@interface AWSIoTDescribeCertificateResponse : AWSModel


/**
 <p>The description of the certificate.</p>
 */
@property (nonatomic, strong) AWSIoTCertificateDescription * _Nullable certificateDescription;

@end

/**
 <p>The input for the DescribeEndpoint operation.</p>
 */
@interface AWSIoTDescribeEndpointRequest : AWSRequest


@end

/**
 <p>The output from the DescribeEndpoint operation.</p>
 */
@interface AWSIoTDescribeEndpointResponse : AWSModel


/**
 <p>The endpoint. The format of the endpoint is as follows: <i>identifier</i>.iot.<i>region</i>.amazonaws.com.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpointAddress;

@end

/**
 <p>The input for the DescribeThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDescribeThingRequest : AWSRequest


/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the DescribeThing operation.</p>
 */
@interface AWSIoTDescribeThingResponse : AWSModel


/**
 <p>The thing attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The default client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultClientId;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The thing type name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The current version of the thing record in the registry.</p><note><p>To avoid unintentional changes to the information in the registry, you can pass the version information in the <code>expectedVersion</code> parameter of the <code>UpdateThing</code> and <code>DeleteThing</code> calls.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>The input for the DescribeThingType operation.</p>
 Required parameters: [thingTypeName]
 */
@interface AWSIoTDescribeThingTypeRequest : AWSRequest


/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output for the DescribeThingType operation.</p>
 */
@interface AWSIoTDescribeThingTypeResponse : AWSModel


/**
 <p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when time was deprecated.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeMetadata * _Nullable thingTypeMetadata;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The ThingTypeProperties contains information about the thing type including description, and a list of searchable thing attribute names.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeProperties * _Nullable thingTypeProperties;

@end

/**
 <p>The input for the DetachPrincipalPolicy operation.</p>
 Required parameters: [policyName, principal]
 */
@interface AWSIoTDetachPrincipalPolicyRequest : AWSRequest


/**
 <p>The name of the policy to detach.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The principal.</p><p>If the principal is a certificate, specify the certificate ARN. If the principal is an Amazon Cognito identity, specify the identity ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The input for the DetachThingPrincipal operation.</p>
 Required parameters: [thingName, principal]
 */
@interface AWSIoTDetachThingPrincipalRequest : AWSRequest


/**
 <p>If the principal is a certificate, this value must be ARN of the certificate. If the principal is an Amazon Cognito identity, this value must be the ID of the Amazon Cognito identity.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the DetachThingPrincipal operation.</p>
 */
@interface AWSIoTDetachThingPrincipalResponse : AWSModel


@end

/**
 <p>The input for the DisableTopicRuleRequest operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTDisableTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule to disable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>Describes an action to write to a DynamoDB table.</p><p>The <code>tableName</code>, <code>hashKeyField</code>, and <code>rangeKeyField</code> values must match the values used when you created the table.</p><p>The <code>hashKeyValue</code> and <code>rangeKeyvalue</code> fields use a substitution template syntax. These templates provide data at runtime. The syntax is as follows: ${<i>sql-expression</i>}.</p><p>You can specify any valid expression in a WHERE or SELECT clause, including JSON properties, comparisons, calculations, and functions. For example, the following field uses the third level of the topic:</p><p><code>"hashKeyValue": "${topic(3)}"</code></p><p>The following field uses the timestamp:</p><p><code>"rangeKeyValue": "${timestamp()}"</code></p>
 Required parameters: [tableName, roleArn, hashKeyField, hashKeyValue]
 */
@interface AWSIoTDynamoDBAction : AWSModel


/**
 <p>The hash key name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyField;

/**
 <p>The hash key type. Valid values are "STRING" or "NUMBER"</p>
 */
@property (nonatomic, assign) AWSIoTDynamoKeyType hashKeyType;

/**
 <p>The hash key value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyValue;

/**
 <p>The type of operation to be performed. This follows the substitution template, so it can be <code>${operation}</code>, but the substitution must result in one of the following: <code>INSERT</code>, <code>UPDATE</code>, or <code>DELETE</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operation;

/**
 <p>The action payload. This name can be customized.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadField;

/**
 <p>The range key name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyField;

/**
 <p>The range key type. Valid values are "STRING" or "NUMBER"</p>
 */
@property (nonatomic, assign) AWSIoTDynamoKeyType rangeKeyType;

/**
 <p>The range key value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyValue;

/**
 <p>The ARN of the IAM role that grants access to the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>Describes an action to write to a DynamoDB table.</p><p>This DynamoDB action writes each attribute in the message payload into it's own column in the DynamoDB table.</p>
 */
@interface AWSIoTDynamoDBv2Action : AWSModel


/**
 <p>Specifies the DynamoDB table to which the message data will be written. For example:</p><p><code>{ "dynamoDBv2": { "roleArn": "aws:iam:12341251:my-role" "putItem": { "tableName": "my-table" } } }</code></p><p>Each attribute in the message payload will be written to a separate column in the DynamoDB database.</p>
 */
@property (nonatomic, strong) AWSIoTPutItemInput * _Nullable putItem;

/**
 <p>The ARN of the IAM role that grants access to the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>Describes an action that writes data to an Amazon Elasticsearch Service domain.</p>
 Required parameters: [roleArn, endpoint, index, type, id]
 */
@interface AWSIoTElasticsearchAction : AWSModel


/**
 <p>The endpoint of your Elasticsearch domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>The unique identifier for the document you are storing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Elasticsearch index where you want to store your data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable index;

/**
 <p>The IAM role ARN that has access to Elasticsearch.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The type of document you are storing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

@end

/**
 <p>The input for the EnableTopicRuleRequest operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTEnableTopicRuleRequest : AWSRequest


/**
 <p>The name of the topic rule to enable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>Describes an action that writes data to an Amazon Kinesis Firehose stream.</p>
 Required parameters: [roleArn, deliveryStreamName]
 */
@interface AWSIoTFirehoseAction : AWSModel


/**
 <p>The delivery stream name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 <p>The IAM role that grants access to the Amazon Kinesis Firehost stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>A character separator that will be used to separate records written to the Firehose stream. Valid values are: '\n' (newline), '\t' (tab), '\r\n' (Windows newline), ',' (comma).</p>
 */
@property (nonatomic, strong) NSString * _Nullable separator;

@end

/**
 <p>The input for the GetLoggingOptions operation.</p>
 */
@interface AWSIoTGetLoggingOptionsRequest : AWSRequest


@end

/**
 <p>The output from the GetLoggingOptions operation.</p>
 */
@interface AWSIoTGetLoggingOptionsResponse : AWSModel


/**
 <p>The logging level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The input for the GetPolicy operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTGetPolicyRequest : AWSRequest


/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the GetPolicy operation.</p>
 */
@interface AWSIoTGetPolicyResponse : AWSModel


/**
 <p>The default policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultVersionId;

/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The input for the GetPolicyVersion operation.</p>
 Required parameters: [policyName, policyVersionId]
 */
@interface AWSIoTGetPolicyVersionRequest : AWSRequest


/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The output from the GetPolicyVersion operation.</p>
 */
@interface AWSIoTGetPolicyVersionResponse : AWSModel


/**
 <p>Specifies whether the policy version is the default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON document that describes the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input to the GetRegistrationCode operation.</p>
 */
@interface AWSIoTGetRegistrationCodeRequest : AWSRequest


@end

/**
 <p>The output from the GetRegistrationCode operation.</p>
 */
@interface AWSIoTGetRegistrationCodeResponse : AWSModel


/**
 <p>The CA certificate registration code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable registrationCode;

@end

/**
 <p>The input for the GetTopicRule operation.</p>
 Required parameters: [ruleName]
 */
@interface AWSIoTGetTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

@end

/**
 <p>The output from the GetTopicRule operation.</p>
 */
@interface AWSIoTGetTopicRuleResponse : AWSModel


/**
 <p>The rule.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRule * _Nullable rule;

/**
 <p>The rule ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

@end

/**
 <p>Describes a key pair.</p>
 */
@interface AWSIoTKeyPair : AWSModel


/**
 <p>The private key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 <p>The public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicKey;

@end

/**
 <p>Describes an action to write data to an Amazon Kinesis stream.</p>
 Required parameters: [roleArn, streamName]
 */
@interface AWSIoTKinesisAction : AWSModel


/**
 <p>The partition key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable partitionKey;

/**
 <p>The ARN of the IAM role that grants access to the Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the Amazon Kinesis stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Describes an action to invoke a Lambda function.</p>
 Required parameters: [functionArn]
 */
@interface AWSIoTLambdaAction : AWSModel


/**
 <p>The ARN of the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

@end

/**
 <p>Input for the ListCACertificates operation.</p>
 */
@interface AWSIoTListCACertificatesRequest : AWSRequest


/**
 <p>Determines the order of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output from the ListCACertificates operation.</p>
 */
@interface AWSIoTListCACertificatesResponse : AWSModel


/**
 <p>The CA certificates registered in your AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTCACertificate *> * _Nullable certificates;

/**
 <p>The current position within the list of CA certificates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>The input to the ListCertificatesByCA operation.</p>
 Required parameters: [caCertificateId]
 */
@interface AWSIoTListCertificatesByCARequest : AWSRequest


/**
 <p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The ID of the CA certificate. This operation will list all registered device certificate that were signed by this CA certificate. </p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificateId;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output of the ListCertificatesByCA operation.</p>
 */
@interface AWSIoTListCertificatesByCAResponse : AWSModel


/**
 <p>The device certificates signed by the specified CA certificate.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTCertificate *> * _Nullable certificates;

/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>The input for the ListCertificates operation.</p>
 */
@interface AWSIoTListCertificatesRequest : AWSRequest


/**
 <p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output of the ListCertificates operation.</p>
 */
@interface AWSIoTListCertificatesResponse : AWSModel


/**
 <p>The descriptions of the certificates.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTCertificate *> * _Nullable certificates;

/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

@end

/**
 <p>The input to the ListOutgoingCertificates operation.</p>
 */
@interface AWSIoTListOutgoingCertificatesRequest : AWSRequest


/**
 <p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output from the ListOutgoingCertificates operation.</p>
 */
@interface AWSIoTListOutgoingCertificatesResponse : AWSModel


/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The certificates that are being transfered but not yet accepted.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTOutgoingCertificate *> * _Nullable outgoingCertificates;

@end

/**
 <p>The input for the ListPolicies operation.</p>
 */
@interface AWSIoTListPoliciesRequest : AWSRequest


/**
 <p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

@end

/**
 <p>The output from the ListPolicies operation.</p>
 */
@interface AWSIoTListPoliciesResponse : AWSModel


/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The descriptions of the policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>The input for the ListPolicyPrincipals operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTListPolicyPrincipalsRequest : AWSRequest


/**
 <p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the ListPolicyPrincipals operation.</p>
 */
@interface AWSIoTListPolicyPrincipalsResponse : AWSModel


/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The descriptions of the principals.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

@end

/**
 <p>The input for the ListPolicyVersions operation.</p>
 Required parameters: [policyName]
 */
@interface AWSIoTListPolicyVersionsRequest : AWSRequest


/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>The output from the ListPolicyVersions operation.</p>
 */
@interface AWSIoTListPolicyVersionsResponse : AWSModel


/**
 <p>The policy versions.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicyVersion *> * _Nullable policyVersions;

@end

/**
 <p>The input for the ListPrincipalPolicies operation.</p>
 Required parameters: [principal]
 */
@interface AWSIoTListPrincipalPoliciesRequest : AWSRequest


/**
 <p>Specifies the order for results. If true, results are returned in ascending creation order.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ascendingOrder;

/**
 <p>The marker for the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The result page size.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pageSize;

/**
 <p>The principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The output from the ListPrincipalPolicies operation.</p>
 */
@interface AWSIoTListPrincipalPoliciesResponse : AWSModel


/**
 <p>The marker for the next set of results, or null if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextMarker;

/**
 <p>The policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTPolicy *> * _Nullable policies;

@end

/**
 <p>The input for the ListPrincipalThings operation.</p>
 Required parameters: [principal]
 */
@interface AWSIoTListPrincipalThingsRequest : AWSRequest


/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The output from the ListPrincipalThings operation.</p>
 */
@interface AWSIoTListPrincipalThingsResponse : AWSModel


/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable things;

@end

/**
 <p>The input for the ListThingPrincipal operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTListThingPrincipalsRequest : AWSRequest


/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the ListThingPrincipals operation.</p>
 */
@interface AWSIoTListThingPrincipalsResponse : AWSModel


/**
 <p>The principals associated with the thing.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

@end

/**
 <p>The input for the ListThingTypes operation.</p>
 */
@interface AWSIoTListThingTypesRequest : AWSRequest


/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output for the ListThingTypes operation.</p>
 */
@interface AWSIoTListThingTypesResponse : AWSModel


/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The thing types.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTThingTypeDefinition *> * _Nullable thingTypes;

@end

/**
 <p>The input for the ListThings operation.</p>
 */
@interface AWSIoTListThingsRequest : AWSRequest


/**
 <p>The attribute name used to search for things.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The attribute value used to search for things.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

/**
 <p>The maximum number of results to return in this operation.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The name of the thing type used to search for things.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output from the ListThings operation.</p>
 */
@interface AWSIoTListThingsResponse : AWSModel


/**
 <p>The token for the next set of results, or <b>null</b> if there are no additional results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The things.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTThingAttribute *> * _Nullable things;

@end

/**
 <p>The input for the ListTopicRules operation.</p>
 */
@interface AWSIoTListTopicRulesRequest : AWSRequest


/**
 <p>The maximum number of results to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token used to retrieve the next value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>The output from the ListTopicRules operation.</p>
 */
@interface AWSIoTListTopicRulesResponse : AWSModel


/**
 <p>A token used to retrieve the next value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The rules.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTTopicRuleListItem *> * _Nullable rules;

@end

/**
 <p>Describes the logging options payload.</p>
 Required parameters: [roleArn]
 */
@interface AWSIoTLoggingOptionsPayload : AWSModel


/**
 <p>The logging level.</p>
 */
@property (nonatomic, assign) AWSIoTLogLevel logLevel;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>A certificate that has been transfered but not yet accepted.</p>
 */
@interface AWSIoTOutgoingCertificate : AWSModel


/**
 <p>The certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The certificate ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The certificate creation date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date the transfer was initiated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable transferDate;

/**
 <p>The transfer message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferMessage;

/**
 <p>The AWS account to which the transfer was made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferredTo;

@end

/**
 <p>Describes an AWS IoT policy.</p>
 */
@interface AWSIoTPolicy : AWSModel


/**
 <p>The policy ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Describes a policy version.</p>
 */
@interface AWSIoTPolicyVersion : AWSModel


/**
 <p>The date and time the policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>Specifies whether the policy version is the default.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>The input for the DynamoActionVS action that specifies the DynamoDB table to which the message data will be written.</p>
 Required parameters: [tableName]
 */
@interface AWSIoTPutItemInput : AWSModel


/**
 <p>The table where the message data will be written</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 <p>The input to the RegisterCACertificate operation.</p>
 Required parameters: [caCertificate, verificationCertificate]
 */
@interface AWSIoTRegisterCACertificateRequest : AWSRequest


/**
 <p>Allows this CA certificate to be used for auto registration of device certificates.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowAutoRegistration;

/**
 <p>The CA certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificate;

/**
 <p>A boolean value that specifies if the CA certificate is set to active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

/**
 <p>The private key verification certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable verificationCertificate;

@end

/**
 <p>The output from the RegisterCACertificateResponse operation.</p>
 */
@interface AWSIoTRegisterCACertificateResponse : AWSModel


/**
 <p>The CA certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The CA certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The input to the RegisterCertificate operation.</p>
 Required parameters: [certificatePem]
 */
@interface AWSIoTRegisterCertificateRequest : AWSRequest


/**
 <p>The CA certificate used to sign the device certificate being registered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable caCertificatePem;

/**
 <p>The certificate data, in PEM format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificatePem;

/**
 <p>A boolean value that specifies if the CA certificate is set to active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsActive;

/**
 
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

@end

/**
 <p>The output from the RegisterCertificate operation.</p>
 */
@interface AWSIoTRegisterCertificateResponse : AWSModel


/**
 <p>The certificate ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

/**
 <p>The certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

@end

/**
 <p>The input for the RejectCertificateTransfer operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTRejectCertificateTransferRequest : AWSRequest


/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The reason the certificate transfer was rejected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rejectReason;

@end

/**
 <p>The input for the ReplaceTopicRule operation.</p>
 Required parameters: [ruleName, topicRulePayload]
 */
@interface AWSIoTReplaceTopicRuleRequest : AWSRequest


/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The rule payload.</p>
 */
@property (nonatomic, strong) AWSIoTTopicRulePayload * _Nullable topicRulePayload;

@end

/**
 <p>Describes an action to republish to another topic.</p>
 Required parameters: [roleArn, topic]
 */
@interface AWSIoTRepublishAction : AWSModel


/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the MQTT topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topic;

@end

/**
 <p>Describes an action to write data to an Amazon S3 bucket.</p>
 Required parameters: [roleArn, bucketName, key]
 */
@interface AWSIoTS3Action : AWSModel


/**
 <p>The Amazon S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

/**
 <p>The Amazon S3 canned ACL that controls access to the object identified by the object key. For more information, see <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl">S3 canned ACLs</a>.</p>
 */
@property (nonatomic, assign) AWSIoTCannedAccessControlList cannedAcl;

/**
 <p>The object key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

@end

/**
 <p>The input for the SetDefaultPolicyVersion operation.</p>
 Required parameters: [policyName, policyVersionId]
 */
@interface AWSIoTSetDefaultPolicyVersionRequest : AWSRequest


/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy version ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyVersionId;

@end

/**
 <p>The input for the SetLoggingOptions operation.</p>
 Required parameters: [loggingOptionsPayload]
 */
@interface AWSIoTSetLoggingOptionsRequest : AWSRequest


/**
 <p>The logging options payload.</p>
 */
@property (nonatomic, strong) AWSIoTLoggingOptionsPayload * _Nullable loggingOptionsPayload;

@end

/**
 <p>Describes an action to publish to an Amazon SNS topic.</p>
 Required parameters: [targetArn, roleArn]
 */
@interface AWSIoTSnsAction : AWSModel


/**
 <p>The message format of the message to publish. Optional. Accepted values are "JSON" and "RAW". The default value of the attribute is "RAW". SNS uses this setting to determine if the payload should be parsed and relevant platform-specific bits of the payload should be extracted. To read more about SNS message formats, see <a href="http://docs.aws.amazon.com/sns/latest/dg/json-formats.html"></a> refer to their official documentation.</p>
 */
@property (nonatomic, assign) AWSIoTMessageFormat messageFormat;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The ARN of the SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 <p>Describes an action to publish data to an Amazon SQS queue.</p>
 Required parameters: [roleArn, queueUrl]
 */
@interface AWSIoTSqsAction : AWSModel


/**
 <p>The URL of the Amazon SQS queue.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queueUrl;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies whether to use Base64 encoding.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable useBase64;

@end

/**
 <p>The properties of the thing, including thing name, thing type name, and a list of thing attributes.</p>
 */
@interface AWSIoTThingAttribute : AWSModel


/**
 <p>A list of thing attributes which are name-value pairs.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The name of the thing type, if the thing has been associated with a type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The version of the thing record in the registry.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable version;

@end

/**
 <p>The definition of the thing type, including thing type name and description.</p>
 */
@interface AWSIoTThingTypeDefinition : AWSModel


/**
 <p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when time was deprecated.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeMetadata * _Nullable thingTypeMetadata;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

/**
 <p>The ThingTypeProperties for the thing type.</p>
 */
@property (nonatomic, strong) AWSIoTThingTypeProperties * _Nullable thingTypeProperties;

@end

/**
 <p>The ThingTypeMetadata contains additional information about the thing type including: creation date and time, a value indicating whether the thing type is deprecated, and a date and time when time was deprecated.</p>
 */
@interface AWSIoTThingTypeMetadata : AWSModel


/**
 <p>The date and time when the thing type was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>Whether the thing type is deprecated. If <b>true</b>, no new things could be associated with this type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deprecated;

/**
 <p>The date and time when the thing type was deprecated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deprecationDate;

@end

/**
 <p>The ThingTypeProperties contains information about the thing type including: a thing type description, and a list of searchable thing attribute names.</p>
 */
@interface AWSIoTThingTypeProperties : AWSModel


/**
 <p>A list of searchable thing attribute names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable searchableAttributes;

/**
 <p>The description of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeDescription;

@end

/**
 <p>Describes a rule.</p>
 */
@interface AWSIoTTopicRule : AWSModel


/**
 <p>The actions associated with the rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAction *> * _Nullable actions;

/**
 <p>The version of the SQL rules engine to use when evaluating the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotSqlVersion;

/**
 <p>The date and time the rule was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The description of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The SQL statement used to query the topic. When using a SQL query with multiple lines, be sure to escape the newline characters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sql;

@end

/**
 <p>Describes a rule.</p>
 */
@interface AWSIoTTopicRuleListItem : AWSModel


/**
 <p>The date and time the rule was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>The rule ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleArn;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The name of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ruleName;

/**
 <p>The pattern for the topic names that apply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable topicPattern;

@end

/**
 <p>Describes a rule.</p>
 Required parameters: [sql, actions]
 */
@interface AWSIoTTopicRulePayload : AWSModel


/**
 <p>The actions associated with the rule.</p>
 */
@property (nonatomic, strong) NSArray<AWSIoTAction *> * _Nullable actions;

/**
 <p>The version of the SQL rules engine to use when evaluating the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable awsIotSqlVersion;

/**
 <p>The description of the rule.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies whether the rule is disabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable ruleDisabled;

/**
 <p>The SQL statement used to query the topic. For more information, see <a href="http://docs.aws.amazon.com/iot/latest/developerguide/iot-rules.html#aws-iot-sql-reference">AWS IoT SQL Reference</a> in the <i>AWS IoT Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sql;

@end

/**
 <p>The input for the TransferCertificate operation.</p>
 Required parameters: [certificateId, targetAwsAccount]
 */
@interface AWSIoTTransferCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetAwsAccount;

/**
 <p>The transfer message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferMessage;

@end

/**
 <p>The output from the TransferCertificate operation.</p>
 */
@interface AWSIoTTransferCertificateResponse : AWSModel


/**
 <p>The ARN of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferredCertificateArn;

@end

/**
 <p>Data used to transfer a certificate to an AWS account.</p>
 */
@interface AWSIoTTransferData : AWSModel


/**
 <p>The date the transfer was accepted.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable acceptDate;

/**
 <p>The date the transfer was rejected.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable rejectDate;

/**
 <p>The reason why the transfer was rejected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rejectReason;

/**
 <p>The date the transfer took place.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable transferDate;

/**
 <p>The transfer message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transferMessage;

@end

/**
 <p>The input to the UpdateCACertificate operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTUpdateCACertificateRequest : AWSRequest


/**
 <p>The CA certificate identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The new value for the auto registration status. Valid values are: "ENABLE" or "DISABLE".</p>
 */
@property (nonatomic, assign) AWSIoTAutoRegistrationStatus latestAutoRegistrationStatus;

/**
 <p>The updated status of the CA certificate.</p><p><b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCACertificateStatus latestStatus;

@end

/**
 <p>The input for the UpdateCertificate operation.</p>
 Required parameters: [certificateId, newStatus]
 */
@interface AWSIoTUpdateCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The new status.</p><p><b>Note:</b> Setting the status to PENDING_TRANSFER will result in an exception being thrown. PENDING_TRANSFER is a status used internally by AWS IoT. It is not intended for developer use.</p><p><b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should not be used.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus latestStatus;

@end

/**
 <p>The input for the UpdateThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTUpdateThingRequest : AWSRequest


/**
 <p>A list of thing attributes, a JSON string containing name-value pairs. For example:</p><p><code>{\"attributes\":{\"name1\":\"value2\"}})</code></p><p>This data is used to add new attributes or update existing attributes.</p>
 */
@property (nonatomic, strong) AWSIoTAttributePayload * _Nullable attributePayload;

/**
 <p>The expected version of the thing record in the registry. If the version of the record in the registry does not match the expected version specified in the request, the <code>UpdateThing</code> request is rejected with a <code>VersionConflictException</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expectedVersion;

/**
 <p>Remove a thing type association. If <b>true</b>, the assocation is removed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable removeThingType;

/**
 <p>The name of the thing to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

/**
 <p>The name of the thing type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingTypeName;

@end

/**
 <p>The output from the UpdateThing operation.</p>
 */
@interface AWSIoTUpdateThingResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
