//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSIoTErrorIncompleteSignature,
    AWSIoTErrorInvalidClientTokenId,
    AWSIoTErrorMissingAuthenticationToken,
    AWSIoTErrorCertificateState,
    AWSIoTErrorDeleteConflict,
    AWSIoTErrorInternal,
    AWSIoTErrorInternalFailure,
    AWSIoTErrorInvalidRequest,
    AWSIoTErrorLimitExceeded,
    AWSIoTErrorMalformedPolicy,
    AWSIoTErrorResourceAlreadyExists,
    AWSIoTErrorResourceNotFound,
    AWSIoTErrorServiceUnavailable,
    AWSIoTErrorSqlParse,
    AWSIoTErrorThrottling,
    AWSIoTErrorTransferAlreadyCompleted,
    AWSIoTErrorTransferConflict,
    AWSIoTErrorUnauthorized,
    AWSIoTErrorVersionsLimitExceeded,
};

typedef NS_ENUM(NSInteger, AWSIoTCertificateStatus) {
    AWSIoTCertificateStatusUnknown,
    AWSIoTCertificateStatusActive,
    AWSIoTCertificateStatusInactive,
    AWSIoTCertificateStatusRevoked,
    AWSIoTCertificateStatusPendingTransfer,
};

typedef NS_ENUM(NSInteger, AWSIoTLogLevel) {
    AWSIoTLogLevelUnknown,
    AWSIoTLogLevelDebug,
    AWSIoTLogLevelInfo,
    AWSIoTLogLevelError,
    AWSIoTLogLevelWarn,
    AWSIoTLogLevelDisabled,
};

@class AWSIoTAcceptCertificateTransferRequest;
@class AWSIoTAction;
@class AWSIoTAttachPrincipalPolicyRequest;
@class AWSIoTAttachThingPrincipalRequest;
@class AWSIoTAttachThingPrincipalResponse;
@class AWSIoTAttributePayload;
@class AWSIoTCancelCertificateTransferRequest;
@class AWSIoTCertificate;
@class AWSIoTCertificateDescription;
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
@class AWSIoTCreateTopicRuleRequest;
@class AWSIoTDeleteCertificateRequest;
@class AWSIoTDeletePolicyRequest;
@class AWSIoTDeletePolicyVersionRequest;
@class AWSIoTDeleteThingRequest;
@class AWSIoTDeleteThingResponse;
@class AWSIoTDeleteTopicRuleRequest;
@class AWSIoTDescribeCertificateRequest;
@class AWSIoTDescribeCertificateResponse;
@class AWSIoTDescribeEndpointRequest;
@class AWSIoTDescribeEndpointResponse;
@class AWSIoTDescribeThingRequest;
@class AWSIoTDescribeThingResponse;
@class AWSIoTDetachPrincipalPolicyRequest;
@class AWSIoTDetachThingPrincipalRequest;
@class AWSIoTDetachThingPrincipalResponse;
@class AWSIoTDynamoDBAction;
@class AWSIoTFirehoseAction;
@class AWSIoTGetLoggingOptionsRequest;
@class AWSIoTGetLoggingOptionsResponse;
@class AWSIoTGetPolicyRequest;
@class AWSIoTGetPolicyResponse;
@class AWSIoTGetPolicyVersionRequest;
@class AWSIoTGetPolicyVersionResponse;
@class AWSIoTGetTopicRuleRequest;
@class AWSIoTGetTopicRuleResponse;
@class AWSIoTKeyPair;
@class AWSIoTKinesisAction;
@class AWSIoTLambdaAction;
@class AWSIoTListCertificatesRequest;
@class AWSIoTListCertificatesResponse;
@class AWSIoTListPoliciesRequest;
@class AWSIoTListPoliciesResponse;
@class AWSIoTListPolicyVersionsRequest;
@class AWSIoTListPolicyVersionsResponse;
@class AWSIoTListPrincipalPoliciesRequest;
@class AWSIoTListPrincipalPoliciesResponse;
@class AWSIoTListPrincipalThingsRequest;
@class AWSIoTListPrincipalThingsResponse;
@class AWSIoTListThingPrincipalsRequest;
@class AWSIoTListThingPrincipalsResponse;
@class AWSIoTListThingsRequest;
@class AWSIoTListThingsResponse;
@class AWSIoTListTopicRulesRequest;
@class AWSIoTListTopicRulesResponse;
@class AWSIoTLoggingOptionsPayload;
@class AWSIoTPolicy;
@class AWSIoTPolicyVersion;
@class AWSIoTRejectCertificateTransferRequest;
@class AWSIoTReplaceTopicRuleRequest;
@class AWSIoTRepublishAction;
@class AWSIoTS3Action;
@class AWSIoTSetDefaultPolicyVersionRequest;
@class AWSIoTSetLoggingOptionsRequest;
@class AWSIoTSnsAction;
@class AWSIoTSqsAction;
@class AWSIoTThingAttribute;
@class AWSIoTTopicRule;
@class AWSIoTTopicRuleListItem;
@class AWSIoTTopicRulePayload;
@class AWSIoTTransferCertificateRequest;
@class AWSIoTTransferCertificateResponse;
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
 <p>Write to a DynamoDB table.</p>
 */
@property (nonatomic, strong) AWSIoTDynamoDBAction * _Nullable dynamoDB;

/**
 
 */
@property (nonatomic, strong) AWSIoTFirehoseAction * _Nullable firehose;

/**
 <p>Write data to a Kinesis stream.</p>
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
 <p>Write to an S3 bucket.</p>
 */
@property (nonatomic, strong) AWSIoTS3Action * _Nullable s3;

/**
 <p>Publish to an SNS topic.</p>
 */
@property (nonatomic, strong) AWSIoTSnsAction * _Nullable sns;

/**
 <p>Publish to an SQS queue.</p>
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
 <p>The principal which can be a certificate ARN (as returned from the CreateCertificate operation) or a Cognito ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The input for the AttachThingPrincipal operation.</p>
 Required parameters: [thingName, principal]
 */
@interface AWSIoTAttachThingPrincipalRequest : AWSRequest


/**
 <p>The principal (certificate or other credential).</p>
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
 <p>The attribute payload, a JSON string containing up to three key-value pairs.</p><p>For example: {\"attributes\":{\"string1\":\"string2\"}}</p>
 */
@interface AWSIoTAttributePayload : AWSModel


/**
 <p>A JSON string containing up to three key-value pair in JSON format.</p><p>For example: {\"attributes\":{\"string1\":\"string2\"}}</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

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
 <p>The status of the certificate.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

@end

/**
 <p>Describes a certificate.</p>
 */
@interface AWSIoTCertificateDescription : AWSModel


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
 <p>The status of the certificate.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus status;

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
 <p>The ID of the certificate. AWS IoT issues a default subject name for the certificate (e.g., AWS IoT Certificate).</p>
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
 <p>The JSON document that describes the policy. The length of the <b>policyDocument</b> must be a minimum length of 1, with a maximum length of 2048, excluding whitespace.</p>
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
 <p>The JSON document that describes the policy. Minimum length of 1. Maximum length of 2048 excluding whitespaces</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>Specifies whether the policy version is set as the default. When this parameter is true, the new policy version becomes the operative version; that is, the version that is in effect for the certificates that the policy is attached to.</p>
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
 <p>The attribute payload. Which consists of up to 3 name/value pairs in a JSON document. For example: {\"attributes\":{\"string1\":\"string2\"}}</p>
 */
@property (nonatomic, strong) AWSIoTAttributePayload * _Nullable attributePayload;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output of the CreateThing operation.</p>
 */
@interface AWSIoTCreateThingResponse : AWSModel


/**
 <p>The thing ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingArn;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

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
 <p>The input for the DeleteThing operation.</p>
 Required parameters: [thingName]
 */
@interface AWSIoTDeleteThingRequest : AWSRequest


/**
 <p>The thing name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output of the DeleteThing operation.</p>
 */
@interface AWSIoTDeleteThingResponse : AWSModel


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
 <p>The attributes which are name/value pairs in JSON format. For example: </p><p>{\"attributes\":{\"some-name1\":\"some-value1\"}, {\"some-name2\":\"some-value2\"}, {\"some-name3\":\"some-value3\"}}</p>
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
 <p>The principal</p><p>If the principal is a certificate, specify the certificate ARN. If the principal is a Cognito identity specify the identity ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principal;

@end

/**
 <p>The input for the DetachThingPrincipal operation.</p>
 Required parameters: [thingName, principal]
 */
@interface AWSIoTDetachThingPrincipalRequest : AWSRequest


/**
 <p>The principal.</p>
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
 <p>Describes an action to write to a DynamoDB table.</p><p>The <code>tableName</code>, <code>hashKeyField</code>, and <code>rangeKeyField</code> values must match the values used when you created the table.</p><p>The <code>hashKeyValue</code> and <code>rangeKeyvalue</code> fields use a substitution template syntax. These templates provide data at runtime. The syntax is as follows: ${<i>sql-expression</i>}.</p><p>You can specify any expression that's valid in a WHERE or SELECT clause, including JSON properties, comparisons, calculations, and functions. For example, the following field uses the third level of the topic:</p><p><code>"hashKeyValue": "${topic(3)}"</code></p><p>The following field uses the timestamp:</p><p><code>"rangeKeyValue": "${timestamp()}"</code></p>
 Required parameters: [tableName, roleArn, hashKeyField, hashKeyValue, rangeKeyField, rangeKeyValue]
 */
@interface AWSIoTDynamoDBAction : AWSModel


/**
 <p>The hash key name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyField;

/**
 <p>The hash key value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable hashKeyValue;

/**
 <p>The action payload, this name can be customized.</p>
 */
@property (nonatomic, strong) NSString * _Nullable payloadField;

/**
 <p>The range key name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyField;

/**
 <p>The range key value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rangeKeyValue;

/**
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the DynamoDB table.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tableName;

@end

/**
 
 */
@interface AWSIoTFirehoseAction : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable deliveryStreamName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

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
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The name of the Kinesis stream.</p>
 */
@property (nonatomic, strong) NSString * _Nullable streamName;

@end

/**
 <p>Describes an action to invoke a Lamdba function.</p>
 Required parameters: [functionArn]
 */
@interface AWSIoTLambdaAction : AWSModel


/**
 <p>The ARN of the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable functionArn;

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
 <p>The maximum number of principals to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 
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
 <p>A token used to retrieve the next value.</p>
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
 <p>The principals.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable principals;

@end

/**
 <p>The input for the ListThings operation.</p>
 */
@interface AWSIoTListThingsRequest : AWSRequest


/**
 <p>The attribute name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The attribute value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeValue;

/**
 <p>The maximum number of results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The token for the next value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The output from the ListThings operation.</p>
 */
@interface AWSIoTListThingsResponse : AWSModel


/**
 <p>A token used to retrieve the next value.</p>
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
 <p>The input for the RejectCertificateTransfer operation.</p>
 Required parameters: [certificateId]
 */
@interface AWSIoTRejectCertificateTransferRequest : AWSRequest


/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

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
 <p>The S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable bucketName;

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
 <p>The ARN of the IAM role that grants access.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The ARN of the SNS topic.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetArn;

@end

/**
 <p>Describes an action to publish data to an SQS queue.</p>
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
 <p>Describes a thing attribute.</p>
 */
@interface AWSIoTThingAttribute : AWSModel


/**
 <p>The attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributes;

/**
 <p>The name of the thing.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

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
 <p>The SQL statement used to query the topic. When using a SQL query with multiple lines, be sure to escape the newline characters properly.</p>
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
 <p>The input for the UpdateCertificate operation.</p>
 Required parameters: [certificateId, newStatus]
 */
@interface AWSIoTUpdateCertificateRequest : AWSRequest


/**
 <p>The ID of the certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The new status.</p>
 */
@property (nonatomic, assign) AWSIoTCertificateStatus latestStatus;

@end

/**
 <p>The input for the UpdateThing operation.</p>
 Required parameters: [thingName, attributePayload]
 */
@interface AWSIoTUpdateThingRequest : AWSRequest


/**
 <p>The attribute payload, a JSON string containing up to three key-value pairs.</p><p>For example: {\"attributes\":{\"string1\":\"string2\"}}</p>
 */
@property (nonatomic, strong) AWSIoTAttributePayload * _Nullable attributePayload;

/**
 <p>The thing name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable thingName;

@end

/**
 <p>The output from the UpdateThing operation.</p>
 */
@interface AWSIoTUpdateThingResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
