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

FOUNDATION_EXPORT NSString *const AWSLexmodelbuildingserviceErrorDomain;

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceErrorType) {
    AWSLexmodelbuildingserviceErrorUnknown,
    AWSLexmodelbuildingserviceErrorBadRequest,
    AWSLexmodelbuildingserviceErrorConflict,
    AWSLexmodelbuildingserviceErrorInternalFailure,
    AWSLexmodelbuildingserviceErrorLimitExceeded,
    AWSLexmodelbuildingserviceErrorNotFound,
    AWSLexmodelbuildingserviceErrorPreconditionFailed,
    AWSLexmodelbuildingserviceErrorResourceInUse,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceChannelStatus) {
    AWSLexmodelbuildingserviceChannelStatusUnknown,
    AWSLexmodelbuildingserviceChannelStatusInProgress,
    AWSLexmodelbuildingserviceChannelStatusCreated,
    AWSLexmodelbuildingserviceChannelStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceChannelType) {
    AWSLexmodelbuildingserviceChannelTypeUnknown,
    AWSLexmodelbuildingserviceChannelTypeFacebook,
    AWSLexmodelbuildingserviceChannelTypeSlack,
    AWSLexmodelbuildingserviceChannelTypeTwilioSms,
    AWSLexmodelbuildingserviceChannelTypeKik,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceContentType) {
    AWSLexmodelbuildingserviceContentTypeUnknown,
    AWSLexmodelbuildingserviceContentTypePlainText,
    AWSLexmodelbuildingserviceContentTypeSsml,
    AWSLexmodelbuildingserviceContentTypeCustomPayload,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceDestination) {
    AWSLexmodelbuildingserviceDestinationUnknown,
    AWSLexmodelbuildingserviceDestinationCloudwatchLogs,
    AWSLexmodelbuildingserviceDestinationS3,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceExportStatus) {
    AWSLexmodelbuildingserviceExportStatusUnknown,
    AWSLexmodelbuildingserviceExportStatusInProgress,
    AWSLexmodelbuildingserviceExportStatusReady,
    AWSLexmodelbuildingserviceExportStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceExportType) {
    AWSLexmodelbuildingserviceExportTypeUnknown,
    AWSLexmodelbuildingserviceExportTypeAlexaSkillsKit,
    AWSLexmodelbuildingserviceExportTypeLex,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceFulfillmentActivityType) {
    AWSLexmodelbuildingserviceFulfillmentActivityTypeUnknown,
    AWSLexmodelbuildingserviceFulfillmentActivityTypeReturnIntent,
    AWSLexmodelbuildingserviceFulfillmentActivityTypeCodeHook,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceImportStatus) {
    AWSLexmodelbuildingserviceImportStatusUnknown,
    AWSLexmodelbuildingserviceImportStatusInProgress,
    AWSLexmodelbuildingserviceImportStatusComplete,
    AWSLexmodelbuildingserviceImportStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceLocale) {
    AWSLexmodelbuildingserviceLocaleUnknown,
    AWSLexmodelbuildingserviceLocaleEnUS,
    AWSLexmodelbuildingserviceLocaleEnGB,
    AWSLexmodelbuildingserviceLocaleDeDE,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceLogType) {
    AWSLexmodelbuildingserviceLogTypeUnknown,
    AWSLexmodelbuildingserviceLogTypeAudio,
    AWSLexmodelbuildingserviceLogTypeText,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceMergeStrategy) {
    AWSLexmodelbuildingserviceMergeStrategyUnknown,
    AWSLexmodelbuildingserviceMergeStrategyOverwriteLatest,
    AWSLexmodelbuildingserviceMergeStrategyFailOnConflict,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceObfuscationSetting) {
    AWSLexmodelbuildingserviceObfuscationSettingUnknown,
    AWSLexmodelbuildingserviceObfuscationSettingNone,
    AWSLexmodelbuildingserviceObfuscationSettingDefaultObfuscation,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceProcessBehavior) {
    AWSLexmodelbuildingserviceProcessBehaviorUnknown,
    AWSLexmodelbuildingserviceProcessBehaviorSave,
    AWSLexmodelbuildingserviceProcessBehaviorBuild,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceReferenceType) {
    AWSLexmodelbuildingserviceReferenceTypeUnknown,
    AWSLexmodelbuildingserviceReferenceTypeIntent,
    AWSLexmodelbuildingserviceReferenceTypeBot,
    AWSLexmodelbuildingserviceReferenceTypeBotAlias,
    AWSLexmodelbuildingserviceReferenceTypeBotChannel,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceResourceType) {
    AWSLexmodelbuildingserviceResourceTypeUnknown,
    AWSLexmodelbuildingserviceResourceTypeBot,
    AWSLexmodelbuildingserviceResourceTypeIntent,
    AWSLexmodelbuildingserviceResourceTypeSlotType,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceSlotConstraint) {
    AWSLexmodelbuildingserviceSlotConstraintUnknown,
    AWSLexmodelbuildingserviceSlotConstraintRequired,
    AWSLexmodelbuildingserviceSlotConstraintOptional,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceSlotValueSelectionStrategy) {
    AWSLexmodelbuildingserviceSlotValueSelectionStrategyUnknown,
    AWSLexmodelbuildingserviceSlotValueSelectionStrategyOriginalValue,
    AWSLexmodelbuildingserviceSlotValueSelectionStrategyTopResolution,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceStatus) {
    AWSLexmodelbuildingserviceStatusUnknown,
    AWSLexmodelbuildingserviceStatusBuilding,
    AWSLexmodelbuildingserviceStatusReady,
    AWSLexmodelbuildingserviceStatusReadyBasicTesting,
    AWSLexmodelbuildingserviceStatusFailed,
    AWSLexmodelbuildingserviceStatusNotBuilt,
};

typedef NS_ENUM(NSInteger, AWSLexmodelbuildingserviceStatusType) {
    AWSLexmodelbuildingserviceStatusTypeUnknown,
    AWSLexmodelbuildingserviceStatusTypeDetected,
    AWSLexmodelbuildingserviceStatusTypeMissed,
};

@class AWSLexmodelbuildingserviceBotAliasMetadata;
@class AWSLexmodelbuildingserviceBotChannelAssociation;
@class AWSLexmodelbuildingserviceBotMetadata;
@class AWSLexmodelbuildingserviceBuiltinIntentMetadata;
@class AWSLexmodelbuildingserviceBuiltinIntentSlot;
@class AWSLexmodelbuildingserviceBuiltinSlotTypeMetadata;
@class AWSLexmodelbuildingserviceCodeHook;
@class AWSLexmodelbuildingserviceConversationLogsRequest;
@class AWSLexmodelbuildingserviceConversationLogsResponse;
@class AWSLexmodelbuildingserviceCreateBotVersionRequest;
@class AWSLexmodelbuildingserviceCreateBotVersionResponse;
@class AWSLexmodelbuildingserviceCreateIntentVersionRequest;
@class AWSLexmodelbuildingserviceCreateIntentVersionResponse;
@class AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest;
@class AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse;
@class AWSLexmodelbuildingserviceDeleteBotAliasRequest;
@class AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest;
@class AWSLexmodelbuildingserviceDeleteBotRequest;
@class AWSLexmodelbuildingserviceDeleteBotVersionRequest;
@class AWSLexmodelbuildingserviceDeleteIntentRequest;
@class AWSLexmodelbuildingserviceDeleteIntentVersionRequest;
@class AWSLexmodelbuildingserviceDeleteSlotTypeRequest;
@class AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest;
@class AWSLexmodelbuildingserviceDeleteUtterancesRequest;
@class AWSLexmodelbuildingserviceEnumerationValue;
@class AWSLexmodelbuildingserviceFollowUpPrompt;
@class AWSLexmodelbuildingserviceFulfillmentActivity;
@class AWSLexmodelbuildingserviceGetBotAliasRequest;
@class AWSLexmodelbuildingserviceGetBotAliasResponse;
@class AWSLexmodelbuildingserviceGetBotAliasesRequest;
@class AWSLexmodelbuildingserviceGetBotAliasesResponse;
@class AWSLexmodelbuildingserviceGetBotChannelAssociationRequest;
@class AWSLexmodelbuildingserviceGetBotChannelAssociationResponse;
@class AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest;
@class AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse;
@class AWSLexmodelbuildingserviceGetBotRequest;
@class AWSLexmodelbuildingserviceGetBotResponse;
@class AWSLexmodelbuildingserviceGetBotVersionsRequest;
@class AWSLexmodelbuildingserviceGetBotVersionsResponse;
@class AWSLexmodelbuildingserviceGetBotsRequest;
@class AWSLexmodelbuildingserviceGetBotsResponse;
@class AWSLexmodelbuildingserviceGetBuiltinIntentRequest;
@class AWSLexmodelbuildingserviceGetBuiltinIntentResponse;
@class AWSLexmodelbuildingserviceGetBuiltinIntentsRequest;
@class AWSLexmodelbuildingserviceGetBuiltinIntentsResponse;
@class AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest;
@class AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse;
@class AWSLexmodelbuildingserviceGetExportRequest;
@class AWSLexmodelbuildingserviceGetExportResponse;
@class AWSLexmodelbuildingserviceGetImportRequest;
@class AWSLexmodelbuildingserviceGetImportResponse;
@class AWSLexmodelbuildingserviceGetIntentRequest;
@class AWSLexmodelbuildingserviceGetIntentResponse;
@class AWSLexmodelbuildingserviceGetIntentVersionsRequest;
@class AWSLexmodelbuildingserviceGetIntentVersionsResponse;
@class AWSLexmodelbuildingserviceGetIntentsRequest;
@class AWSLexmodelbuildingserviceGetIntentsResponse;
@class AWSLexmodelbuildingserviceGetSlotTypeRequest;
@class AWSLexmodelbuildingserviceGetSlotTypeResponse;
@class AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest;
@class AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse;
@class AWSLexmodelbuildingserviceGetSlotTypesRequest;
@class AWSLexmodelbuildingserviceGetSlotTypesResponse;
@class AWSLexmodelbuildingserviceGetUtterancesViewRequest;
@class AWSLexmodelbuildingserviceGetUtterancesViewResponse;
@class AWSLexmodelbuildingserviceIntent;
@class AWSLexmodelbuildingserviceIntentMetadata;
@class AWSLexmodelbuildingserviceKendraConfiguration;
@class AWSLexmodelbuildingserviceListTagsForResourceRequest;
@class AWSLexmodelbuildingserviceListTagsForResourceResponse;
@class AWSLexmodelbuildingserviceLogSettingsRequest;
@class AWSLexmodelbuildingserviceLogSettingsResponse;
@class AWSLexmodelbuildingserviceMessage;
@class AWSLexmodelbuildingservicePrompt;
@class AWSLexmodelbuildingservicePutBotAliasRequest;
@class AWSLexmodelbuildingservicePutBotAliasResponse;
@class AWSLexmodelbuildingservicePutBotRequest;
@class AWSLexmodelbuildingservicePutBotResponse;
@class AWSLexmodelbuildingservicePutIntentRequest;
@class AWSLexmodelbuildingservicePutIntentResponse;
@class AWSLexmodelbuildingservicePutSlotTypeRequest;
@class AWSLexmodelbuildingservicePutSlotTypeResponse;
@class AWSLexmodelbuildingserviceResourceReference;
@class AWSLexmodelbuildingserviceSlot;
@class AWSLexmodelbuildingserviceSlotTypeConfiguration;
@class AWSLexmodelbuildingserviceSlotTypeMetadata;
@class AWSLexmodelbuildingserviceSlotTypeRegexConfiguration;
@class AWSLexmodelbuildingserviceStartImportRequest;
@class AWSLexmodelbuildingserviceStartImportResponse;
@class AWSLexmodelbuildingserviceStatement;
@class AWSLexmodelbuildingserviceTag;
@class AWSLexmodelbuildingserviceTagResourceRequest;
@class AWSLexmodelbuildingserviceTagResourceResponse;
@class AWSLexmodelbuildingserviceUntagResourceRequest;
@class AWSLexmodelbuildingserviceUntagResourceResponse;
@class AWSLexmodelbuildingserviceUtteranceData;
@class AWSLexmodelbuildingserviceUtteranceList;

/**
 <p>Provides information about a bot alias.</p>
 */
@interface AWSLexmodelbuildingserviceBotAliasMetadata : AWSModel


/**
 <p>The name of the bot to which the alias points.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The version of the Amazon Lex bot to which the alias points.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botVersion;

/**
 <p>Checksum of the bot alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>Settings that determine how Amazon Lex uses conversation logs for the alias.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceConversationLogsResponse * _Nullable conversationLogs;

/**
 <p>The date that the bot alias was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the bot alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date that the bot alias was updated. When you create a resource, the creation date and last updated date are the same.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the bot alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Represents an association between an Amazon Lex bot and an external messaging platform.</p>
 */
@interface AWSLexmodelbuildingserviceBotChannelAssociation : AWSModel


/**
 <p>An alias pointing to the specific version of the Amazon Lex bot to which this association is being made. </p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>Provides information necessary to communicate with the messaging platform. </p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable botConfiguration;

/**
 <p>The name of the Amazon Lex bot to which this association is being made. </p><note><p>Currently, Amazon Lex supports associations with Facebook and Slack, and Twilio.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The date that the association between the Amazon Lex bot and the channel was created. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A text description of the association you are creating. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the reason that it failed to create the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The name of the association between the bot and the channel. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the bot channel. </p><ul><li><p><code>CREATED</code> - The channel has been created and is ready for use.</p></li><li><p><code>IN_PROGRESS</code> - Channel creation is in progress.</p></li><li><p><code>FAILED</code> - There was an error creating the channel. For information about the reason for the failure, see the <code>failureReason</code> field.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceChannelStatus status;

/**
 <p>Specifies the type of association by indicating the type of channel being established between the Amazon Lex bot and the external messaging platform.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceChannelType types;

@end

/**
 <p>Provides information about a bot. .</p>
 */
@interface AWSLexmodelbuildingserviceBotMetadata : AWSModel


/**
 <p>The date that the bot was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date that the bot was updated. When you create a bot, the creation date and last updated date are the same. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the bot. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the bot.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceStatus status;

/**
 <p>The version of the bot. For a new bot, the version is always <code>$LATEST</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Provides metadata for a built-in intent.</p>
 */
@interface AWSLexmodelbuildingserviceBuiltinIntentMetadata : AWSModel


/**
 <p>A unique identifier for the built-in intent. To find the signature for an intent, see <a href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard Built-in Intents</a> in the <i>Alexa Skills Kit</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signature;

/**
 <p>A list of identifiers for the locales that the intent supports.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedLocales;

@end

/**
 <p>Provides information about a slot used in a built-in intent.</p>
 */
@interface AWSLexmodelbuildingserviceBuiltinIntentSlot : AWSModel


/**
 <p>A list of the slots defined for the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Provides information about a built in slot type.</p>
 */
@interface AWSLexmodelbuildingserviceBuiltinSlotTypeMetadata : AWSModel


/**
 <p>A unique identifier for the built-in slot type. To find the signature for a slot type, see <a href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference">Slot Type Reference</a> in the <i>Alexa Skills Kit</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signature;

/**
 <p>A list of target locales for the slot. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedLocales;

@end

/**
 <p>Specifies a Lambda function that verifies requests to a bot or fulfills the user's request to a bot..</p>
 Required parameters: [uri, messageVersion]
 */
@interface AWSLexmodelbuildingserviceCodeHook : AWSModel


/**
 <p>The version of the request-response that you want Amazon Lex to use to invoke your Lambda function. For more information, see <a>using-lambda</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable messageVersion;

/**
 <p>The Amazon Resource Name (ARN) of the Lambda function.</p>
 */
@property (nonatomic, strong) NSString * _Nullable uri;

@end

/**
 <p>Provides the settings needed for conversation logs.</p>
 Required parameters: [logSettings, iamRoleArn]
 */
@interface AWSLexmodelbuildingserviceConversationLogsRequest : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an IAM role with permission to write to your CloudWatch Logs for text logs and your S3 bucket for audio logs. If audio encryption is enabled, this role also provides access permission for the AWS KMS key used for encrypting audio logs. For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/conversation-logs-role-and-policy.html">Creating an IAM Role and Policy for Conversation Logs</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>The settings for your conversation logs. You can log the conversation text, conversation audio, or both.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceLogSettingsRequest *> * _Nullable logSettings;

@end

/**
 <p>Contains information about conversation log settings.</p>
 */
@interface AWSLexmodelbuildingserviceConversationLogsResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the IAM role used to write your logs to CloudWatch Logs or an S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable iamRoleArn;

/**
 <p>The settings for your conversation logs. You can log text, audio, or both.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceLogSettingsResponse *> * _Nullable logSettings;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceCreateBotVersionRequest : AWSRequest


/**
 <p>Identifies a specific revision of the <code>$LATEST</code> version of the bot. If you specify a checksum and the <code>$LATEST</code> version of the bot has a different checksum, a <code>PreconditionFailedException</code> exception is returned and Amazon Lex doesn't publish a new version. If you don't specify a checksum, Amazon Lex publishes the <code>$LATEST</code> version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>The name of the bot that you want to create a new version of. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceCreateBotVersionResponse : AWSModel


/**
 <p>The message that Amazon Lex uses to abort a conversation. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable abortStatement;

/**
 <p>Checksum identifying the version of the bot that was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>For each Amazon Lex bot created with the Amazon Lex Model Building Service, you must specify whether your use of Amazon Lex is related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to the Children's Online Privacy Protection Act (COPPA) by specifying <code>true</code> or <code>false</code> in the <code>childDirected</code> field. By specifying <code>true</code> in the <code>childDirected</code> field, you confirm that your use of Amazon Lex <b>is</b> related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA. By specifying <code>false</code> in the <code>childDirected</code> field, you confirm that your use of Amazon Lex <b>is not</b> related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA. You may not specify a default value for the <code>childDirected</code> field that does not accurately reflect whether your use of Amazon Lex is related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA.</p><p>If your use of Amazon Lex relates to a website, program, or other application that is directed in whole or in part, to children under age 13, you must obtain any required verifiable parental consent under COPPA. For information regarding the use of Amazon Lex in connection with websites, programs, or other applications that are directed or targeted, in whole or in part, to children under age 13, see the <a href="https://aws.amazon.com/lex/faqs#data-security">Amazon Lex FAQ.</a></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable childDirected;

/**
 <p>The message that Amazon Lex uses when it doesn't understand the user's request. For more information, see <a>PutBot</a>. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingservicePrompt * _Nullable clarificationPrompt;

/**
 <p>The date when the bot version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Indicates whether utterances entered by the user should be sent to Amazon Comprehend for sentiment analysis.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable detectSentiment;

/**
 <p>If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the reason that it failed to build the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The maximum time in seconds that Amazon Lex retains the data gathered in a conversation. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idleSessionTTLInSeconds;

/**
 <p>An array of <code>Intent</code> objects. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceIntent *> * _Nullable intents;

/**
 <p>The date when the <code>$LATEST</code> version of this bot was updated. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p> Specifies the target locale for the bot. </p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceLocale locale;

/**
 <p>The name of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> When you send a request to create or update a bot, Amazon Lex sets the <code>status</code> response element to <code>BUILDING</code>. After Amazon Lex builds the bot, it sets <code>status</code> to <code>READY</code>. If Amazon Lex can't build the bot, it sets <code>status</code> to <code>FAILED</code>. Amazon Lex returns the reason for the failure in the <code>failureReason</code> response element. </p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceStatus status;

/**
 <p>The version of the bot. </p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The Amazon Polly voice ID that Amazon Lex uses for voice interactions with the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceId;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceCreateIntentVersionRequest : AWSRequest


/**
 <p>Checksum of the <code>$LATEST</code> version of the intent that should be used to create the new version. If you specify a checksum and the <code>$LATEST</code> version of the intent has a different checksum, Amazon Lex returns a <code>PreconditionFailedException</code> exception and doesn't publish a new version. If you don't specify a checksum, Amazon Lex publishes the <code>$LATEST</code> version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>The name of the intent that you want to create a new version of. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceCreateIntentVersionResponse : AWSModel


/**
 <p>Checksum of the intent version created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>After the Lambda function specified in the <code>fulfillmentActivity</code> field fulfills the intent, Amazon Lex conveys this statement to the user. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable conclusionStatement;

/**
 <p>If defined, the prompt that Amazon Lex uses to confirm the user's intent before fulfilling it. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingservicePrompt * _Nullable confirmationPrompt;

/**
 <p>The date that the intent was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If defined, Amazon Lex invokes this Lambda function for each user input.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceCodeHook * _Nullable dialogCodeHook;

/**
 <p>If defined, Amazon Lex uses this prompt to solicit additional user activity after the intent is fulfilled. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceFollowUpPrompt * _Nullable followUpPrompt;

/**
 <p> Describes how the intent is fulfilled. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceFulfillmentActivity * _Nullable fulfillmentActivity;

/**
 <p>Configuration information, if any, for connectin an Amazon Kendra index with the <code>AMAZON.KendraSearchIntent</code> intent.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceKendraConfiguration * _Nullable kendraConfiguration;

/**
 <p>The date that the intent was updated. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a built-in intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentIntentSignature;

/**
 <p>If the user answers "no" to the question defined in <code>confirmationPrompt</code>, Amazon Lex responds with this statement to acknowledge that the intent was canceled. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable rejectionStatement;

/**
 <p>An array of sample utterances configured for the intent. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sampleUtterances;

/**
 <p>An array of slot types that defines the information required to fulfill the intent.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceSlot *> * _Nullable slots;

/**
 <p>The version number assigned to the new version of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceCreateSlotTypeVersionRequest : AWSRequest


/**
 <p>Checksum for the <code>$LATEST</code> version of the slot type that you want to publish. If you specify a checksum and the <code>$LATEST</code> version of the slot type has a different checksum, Amazon Lex returns a <code>PreconditionFailedException</code> exception and doesn't publish the new version. If you don't specify a checksum, Amazon Lex publishes the <code>$LATEST</code> version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>The name of the slot type that you want to create a new version for. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceCreateSlotTypeVersionResponse : AWSModel


/**
 <p>Checksum of the <code>$LATEST</code> version of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>The date that the slot type was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of <code>EnumerationValue</code> objects that defines the values that the slot type can take.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceEnumerationValue *> * _Nullable enumerationValues;

/**
 <p>The date that the slot type was updated. When you create a resource, the creation date and last update date are the same.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The built-in slot type used a the parent of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentSlotTypeSignature;

/**
 <p>Configuration information that extends the parent built-in slot type.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceSlotTypeConfiguration *> * _Nullable slotTypeConfigurations;

/**
 <p>The strategy that Amazon Lex uses to determine the value of the slot. For more information, see <a>PutSlotType</a>.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceSlotValueSelectionStrategy valueSelectionStrategy;

/**
 <p>The version assigned to the new slot type version. </p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceDeleteBotAliasRequest : AWSRequest


/**
 <p>The name of the bot that the alias points to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The name of the alias to delete. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceDeleteBotChannelAssociationRequest : AWSRequest


/**
 <p>An alias that points to the specific version of the Amazon Lex bot to which this association is being made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>The name of the Amazon Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The name of the association. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceDeleteBotRequest : AWSRequest


/**
 <p>The name of the bot. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceDeleteBotVersionRequest : AWSRequest


/**
 <p>The name of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the bot to delete. You cannot delete the <code>$LATEST</code> version of the bot. To delete the <code>$LATEST</code> version, use the <a>DeleteBot</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceDeleteIntentRequest : AWSRequest


/**
 <p>The name of the intent. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceDeleteIntentVersionRequest : AWSRequest


/**
 <p>The name of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the intent to delete. You cannot delete the <code>$LATEST</code> version of the intent. To delete the <code>$LATEST</code> version, use the <a>DeleteIntent</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceDeleteSlotTypeRequest : AWSRequest


/**
 <p>The name of the slot type. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceDeleteSlotTypeVersionRequest : AWSRequest


/**
 <p>The name of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the slot type to delete. You cannot delete the <code>$LATEST</code> version of the slot type. To delete the <code>$LATEST</code> version, use the <a>DeleteSlotType</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceDeleteUtterancesRequest : AWSRequest


/**
 <p>The name of the bot that stored the utterances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p> The unique identifier for the user that made the utterances. This is the user ID that was sent in the <a href="http://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostContent.html">PostContent</a> or <a href="http://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostText.html">PostText</a> operation request that contained the utterance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 <p>Each slot type can have a set of values. Each enumeration value represents a value the slot type can take. </p><p>For example, a pizza ordering bot could have a slot type that specifies the type of crust that the pizza should have. The slot type could include the values </p><ul><li><p>thick</p></li><li><p>thin</p></li><li><p>stuffed</p></li></ul>
 Required parameters: [value]
 */
@interface AWSLexmodelbuildingserviceEnumerationValue : AWSModel


/**
 <p>Additional values related to the slot type value.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable synonyms;

/**
 <p>The value of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>A prompt for additional activity after an intent is fulfilled. For example, after the <code>OrderPizza</code> intent is fulfilled, you might prompt the user to find out whether the user wants to order drinks.</p>
 Required parameters: [prompt, rejectionStatement]
 */
@interface AWSLexmodelbuildingserviceFollowUpPrompt : AWSModel


/**
 <p>Prompts for information from the user. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingservicePrompt * _Nullable prompt;

/**
 <p>If the user answers "no" to the question defined in the <code>prompt</code> field, Amazon Lex responds with this statement to acknowledge that the intent was canceled. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable rejectionStatement;

@end

/**
 <p> Describes how the intent is fulfilled after the user provides all of the information required for the intent. You can provide a Lambda function to process the intent, or you can return the intent information to the client application. We recommend that you use a Lambda function so that the relevant logic lives in the Cloud and limit the client-side code primarily to presentation. If you need to update the logic, you only update the Lambda function; you don't need to upgrade your client application. </p><p>Consider the following examples:</p><ul><li><p>In a pizza ordering application, after the user provides all of the information for placing an order, you use a Lambda function to place an order with a pizzeria. </p></li><li><p>In a gaming application, when a user says "pick up a rock," this information must go back to the client application so that it can perform the operation and update the graphics. In this case, you want Amazon Lex to return the intent data to the client. </p></li></ul>
 Required parameters: [type]
 */
@interface AWSLexmodelbuildingserviceFulfillmentActivity : AWSModel


/**
 <p> A description of the Lambda function that is run to fulfill the intent. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceCodeHook * _Nullable codeHook;

/**
 <p> How the intent should be fulfilled, either by running a Lambda function or by returning the slot data to the client application. </p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceFulfillmentActivityType types;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotAliasRequest : AWSRequest


/**
 <p>The name of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The name of the bot alias. The name is case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotAliasResponse : AWSModel


/**
 <p>The name of the bot that the alias points to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The version of the bot that the alias points to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botVersion;

/**
 <p>Checksum of the bot alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>The settings that determine how Amazon Lex uses conversation logs for the alias.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceConversationLogsResponse * _Nullable conversationLogs;

/**
 <p>The date that the bot alias was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the bot alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date that the bot alias was updated. When you create a resource, the creation date and the last updated date are the same.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the bot alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotAliasesRequest : AWSRequest


/**
 <p>The name of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The maximum number of aliases to return in the response. The default is 50. . </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Substring to match in bot alias names. An alias will be returned if any part of its name matches the substring. For example, "xyz" matches both "xyzabc" and "abcxyz."</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>A pagination token for fetching the next page of aliases. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of aliases, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotAliasesResponse : AWSModel


/**
 <p>An array of <code>BotAliasMetadata</code> objects, each describing a bot alias.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceBotAliasMetadata *> * _Nullable botAliases;

/**
 <p>A pagination token for fetching next page of aliases. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of aliases, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotChannelAssociationRequest : AWSRequest


/**
 <p>An alias pointing to the specific version of the Amazon Lex bot to which this association is being made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>The name of the Amazon Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The name of the association between the bot and the channel. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotChannelAssociationResponse : AWSModel


/**
 <p>An alias pointing to the specific version of the Amazon Lex bot to which this association is being made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>Provides information that the messaging platform needs to communicate with the Amazon Lex bot.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable botConfiguration;

/**
 <p>The name of the Amazon Lex bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The date that the association between the bot and the channel was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the association between the bot and the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the reason that it failed to create the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The name of the association between the bot and the channel.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the bot channel. </p><ul><li><p><code>CREATED</code> - The channel has been created and is ready for use.</p></li><li><p><code>IN_PROGRESS</code> - Channel creation is in progress.</p></li><li><p><code>FAILED</code> - There was an error creating the channel. For information about the reason for the failure, see the <code>failureReason</code> field.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceChannelStatus status;

/**
 <p>The type of the messaging platform.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceChannelType types;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotChannelAssociationsRequest : AWSRequest


/**
 <p>An alias pointing to the specific version of the Amazon Lex bot to which this association is being made.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botAlias;

/**
 <p>The name of the Amazon Lex bot in the association.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The maximum number of associations to return in the response. The default is 50. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Substring to match in channel association names. An association will be returned if any part of its name matches the substring. For example, "xyz" matches both "xyzabc" and "abcxyz." To return all bot channel associations, use a hyphen ("-") as the <code>nameContains</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>A pagination token for fetching the next page of associations. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of associations, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotChannelAssociationsResponse : AWSModel


/**
 <p>An array of objects, one for each association, that provides information about the Amazon Lex bot and its association with the channel. </p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceBotChannelAssociation *> * _Nullable botChannelAssociations;

/**
 <p>A pagination token that fetches the next page of associations. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of associations, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotRequest : AWSRequest


/**
 <p>The name of the bot. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version or alias of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionOrAlias;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotResponse : AWSModel


/**
 <p>The message that Amazon Lex returns when the user elects to end the conversation without completing it. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable abortStatement;

/**
 <p>Checksum of the bot used to identify a specific revision of the bot's <code>$LATEST</code> version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>For each Amazon Lex bot created with the Amazon Lex Model Building Service, you must specify whether your use of Amazon Lex is related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to the Children's Online Privacy Protection Act (COPPA) by specifying <code>true</code> or <code>false</code> in the <code>childDirected</code> field. By specifying <code>true</code> in the <code>childDirected</code> field, you confirm that your use of Amazon Lex <b>is</b> related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA. By specifying <code>false</code> in the <code>childDirected</code> field, you confirm that your use of Amazon Lex <b>is not</b> related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA. You may not specify a default value for the <code>childDirected</code> field that does not accurately reflect whether your use of Amazon Lex is related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA.</p><p>If your use of Amazon Lex relates to a website, program, or other application that is directed in whole or in part, to children under age 13, you must obtain any required verifiable parental consent under COPPA. For information regarding the use of Amazon Lex in connection with websites, programs, or other applications that are directed or targeted, in whole or in part, to children under age 13, see the <a href="https://aws.amazon.com/lex/faqs#data-security">Amazon Lex FAQ.</a></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable childDirected;

/**
 <p>The message Amazon Lex uses when it doesn't understand the user's request. For more information, see <a>PutBot</a>. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingservicePrompt * _Nullable clarificationPrompt;

/**
 <p>The date that the bot was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Indicates whether user utterances should be sent to Amazon Comprehend for sentiment analysis.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable detectSentiment;

/**
 <p>If <code>status</code> is <code>FAILED</code>, Amazon Lex explains why it failed to build the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The maximum time in seconds that Amazon Lex retains the data gathered in a conversation. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idleSessionTTLInSeconds;

/**
 <p>An array of <code>intent</code> objects. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceIntent *> * _Nullable intents;

/**
 <p>The date that the bot was updated. When you create a resource, the creation date and last updated date are the same. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p> The target locale for the bot. </p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceLocale locale;

/**
 <p>The name of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the bot. </p><p>When the status is <code>BUILDING</code> Amazon Lex is building the bot for testing and use.</p><p>If the status of the bot is <code>READY_BASIC_TESTING</code>, you can test the bot using the exact utterances specified in the bot's intents. When the bot is ready for full testing or to run, the status is <code>READY</code>.</p><p>If there was a problem with building the bot, the status is <code>FAILED</code> and the <code>failureReason</code> field explains why the bot did not build.</p><p>If the bot was saved but not built, the status is <code>NOT_BUILT</code>.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceStatus status;

/**
 <p>The version of the bot. For a new bot, the version is always <code>$LATEST</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The Amazon Polly voice ID that Amazon Lex uses for voice interaction with the user. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceId;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotVersionsRequest : AWSRequest


/**
 <p>The maximum number of bot versions to return in the response. The default is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the bot for which versions should be returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A pagination token for fetching the next page of bot versions. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of versions, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotVersionsResponse : AWSModel


/**
 <p>An array of <code>BotMetadata</code> objects, one for each numbered version of the bot plus one for the <code>$LATEST</code> version.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceBotMetadata *> * _Nullable bots;

/**
 <p>A pagination token for fetching the next page of bot versions. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of versions, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotsRequest : AWSRequest


/**
 <p>The maximum number of bots to return in the response that the request will return. The default is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Substring to match in bot names. A bot will be returned if any part of its name matches the substring. For example, "xyz" matches both "xyzabc" and "abcxyz."</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>A pagination token that fetches the next page of bots. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of bots, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBotsResponse : AWSModel


/**
 <p>An array of <code>botMetadata</code> objects, with one entry for each bot. </p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceBotMetadata *> * _Nullable bots;

/**
 <p>If the response is truncated, it includes a pagination token that you can specify in your next request to fetch the next page of bots. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBuiltinIntentRequest : AWSRequest


/**
 <p>The unique identifier for a built-in intent. To find the signature for an intent, see <a href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard Built-in Intents</a> in the <i>Alexa Skills Kit</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signature;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBuiltinIntentResponse : AWSModel


/**
 <p>The unique identifier for a built-in intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signature;

/**
 <p>An array of <code>BuiltinIntentSlot</code> objects, one entry for each slot type in the intent.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceBuiltinIntentSlot *> * _Nullable slots;

/**
 <p>A list of locales that the intent supports.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedLocales;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBuiltinIntentsRequest : AWSRequest


/**
 <p>A list of locales that the intent supports.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceLocale locale;

/**
 <p>The maximum number of intents to return in the response. The default is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A pagination token that fetches the next page of intents. If this API call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of intents, use the pagination token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Substring to match in built-in intent signatures. An intent will be returned if any part of its signature matches the substring. For example, "xyz" matches both "xyzabc" and "abcxyz." To find the signature for an intent, see <a href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard Built-in Intents</a> in the <i>Alexa Skills Kit</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable signatureContains;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBuiltinIntentsResponse : AWSModel


/**
 <p>An array of <code>builtinIntentMetadata</code> objects, one for each intent in the response.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceBuiltinIntentMetadata *> * _Nullable intents;

/**
 <p>A pagination token that fetches the next page of intents. If the response to this API call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of intents, specify the pagination token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBuiltinSlotTypesRequest : AWSRequest


/**
 <p>A list of locales that the slot type supports.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceLocale locale;

/**
 <p>The maximum number of slot types to return in the response. The default is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A pagination token that fetches the next page of slot types. If the response to this API call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of slot types, specify the pagination token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Substring to match in built-in slot type signatures. A slot type will be returned if any part of its signature matches the substring. For example, "xyz" matches both "xyzabc" and "abcxyz."</p>
 */
@property (nonatomic, strong) NSString * _Nullable signatureContains;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetBuiltinSlotTypesResponse : AWSModel


/**
 <p>If the response is truncated, the response includes a pagination token that you can use in your next request to fetch the next page of slot types.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>BuiltInSlotTypeMetadata</code> objects, one entry for each slot type returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceBuiltinSlotTypeMetadata *> * _Nullable slotTypes;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetExportRequest : AWSRequest


/**
 <p>The format of the exported data.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceExportType exportType;

/**
 <p>The name of the bot to export.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of resource to export. </p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceResourceType resourceType;

/**
 <p>The version of the bot to export.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetExportResponse : AWSModel


/**
 <p>The status of the export. </p><ul><li><p><code>IN_PROGRESS</code> - The export is in progress.</p></li><li><p><code>READY</code> - The export is complete.</p></li><li><p><code>FAILED</code> - The export could not be completed.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceExportStatus exportStatus;

/**
 <p>The format of the exported data.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceExportType exportType;

/**
 <p>If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the reason that it failed to export the resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The name of the bot being exported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of the exported resource.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceResourceType resourceType;

/**
 <p>An S3 pre-signed URL that provides the location of the exported resource. The exported resource is a ZIP archive that contains the exported resource in JSON format. The structure of the archive may change. Your code should not rely on the archive structure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

/**
 <p>The version of the bot being exported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetImportRequest : AWSRequest


/**
 <p>The identifier of the import job information to return.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importId;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetImportResponse : AWSModel


/**
 <p>A timestamp for the date and time that the import job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A string that describes why an import job failed to complete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable failureReason;

/**
 <p>The identifier for the specific import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importId;

/**
 <p>The status of the import job. If the status is <code>FAILED</code>, you can get the reason for the failure from the <code>failureReason</code> field.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceImportStatus importStatus;

/**
 <p>The action taken when there was a conflict between an existing resource and a resource in the import file.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceMergeStrategy mergeStrategy;

/**
 <p>The name given to the import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of resource imported.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceResourceType resourceType;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetIntentRequest : AWSRequest


/**
 <p>The name of the intent. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetIntentResponse : AWSModel


/**
 <p>Checksum of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>After the Lambda function specified in the <code>fulfillmentActivity</code> element fulfills the intent, Amazon Lex conveys this statement to the user.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable conclusionStatement;

/**
 <p>If defined in the bot, Amazon Lex uses prompt to confirm the intent before fulfilling the user's request. For more information, see <a>PutIntent</a>. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingservicePrompt * _Nullable confirmationPrompt;

/**
 <p>The date that the intent was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If defined in the bot, Amazon Amazon Lex invokes this Lambda function for each user input. For more information, see <a>PutIntent</a>. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceCodeHook * _Nullable dialogCodeHook;

/**
 <p>If defined in the bot, Amazon Lex uses this prompt to solicit additional user activity after the intent is fulfilled. For more information, see <a>PutIntent</a>.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceFollowUpPrompt * _Nullable followUpPrompt;

/**
 <p>Describes how the intent is fulfilled. For more information, see <a>PutIntent</a>. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceFulfillmentActivity * _Nullable fulfillmentActivity;

/**
 <p>Configuration information, if any, to connect to an Amazon Kendra index with the <code>AMAZON.KendraSearchIntent</code> intent.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceKendraConfiguration * _Nullable kendraConfiguration;

/**
 <p>The date that the intent was updated. When you create a resource, the creation date and the last updated date are the same. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for a built-in intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentIntentSignature;

/**
 <p>If the user answers "no" to the question defined in <code>confirmationPrompt</code>, Amazon Lex responds with this statement to acknowledge that the intent was canceled. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable rejectionStatement;

/**
 <p>An array of sample utterances configured for the intent.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sampleUtterances;

/**
 <p>An array of intent slots configured for the intent.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceSlot *> * _Nullable slots;

/**
 <p>The version of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetIntentVersionsRequest : AWSRequest


/**
 <p>The maximum number of intent versions to return in the response. The default is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the intent for which versions should be returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A pagination token for fetching the next page of intent versions. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of versions, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetIntentVersionsResponse : AWSModel


/**
 <p>An array of <code>IntentMetadata</code> objects, one for each numbered version of the intent plus one for the <code>$LATEST</code> version.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceIntentMetadata *> * _Nullable intents;

/**
 <p>A pagination token for fetching the next page of intent versions. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of versions, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetIntentsRequest : AWSRequest


/**
 <p>The maximum number of intents to return in the response. The default is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Substring to match in intent names. An intent will be returned if any part of its name matches the substring. For example, "xyz" matches both "xyzabc" and "abcxyz."</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>A pagination token that fetches the next page of intents. If the response to this API call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of intents, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetIntentsResponse : AWSModel


/**
 <p>An array of <code>Intent</code> objects. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceIntentMetadata *> * _Nullable intents;

/**
 <p>If the response is truncated, the response includes a pagination token that you can specify in your next request to fetch the next page of intents. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetSlotTypeRequest : AWSRequest


/**
 <p>The name of the slot type. The name is case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the slot type. </p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetSlotTypeResponse : AWSModel


/**
 <p>Checksum of the <code>$LATEST</code> version of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>The date that the slot type was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of <code>EnumerationValue</code> objects that defines the values that the slot type can take.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceEnumerationValue *> * _Nullable enumerationValues;

/**
 <p>The date that the slot type was updated. When you create a resource, the creation date and last update date are the same.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The built-in slot type used as a parent for the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentSlotTypeSignature;

/**
 <p>Configuration information that extends the parent built-in slot type.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceSlotTypeConfiguration *> * _Nullable slotTypeConfigurations;

/**
 <p>The strategy that Amazon Lex uses to determine the value of the slot. For more information, see <a>PutSlotType</a>.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceSlotValueSelectionStrategy valueSelectionStrategy;

/**
 <p>The version of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetSlotTypeVersionsRequest : AWSRequest


/**
 <p>The maximum number of slot type versions to return in the response. The default is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The name of the slot type for which versions should be returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A pagination token for fetching the next page of slot type versions. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of versions, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetSlotTypeVersionsResponse : AWSModel


/**
 <p>A pagination token for fetching the next page of slot type versions. If the response to this call is truncated, Amazon Lex returns a pagination token in the response. To fetch the next page of versions, specify the pagination token in the next request. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of <code>SlotTypeMetadata</code> objects, one for each numbered version of the slot type plus one for the <code>$LATEST</code> version.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceSlotTypeMetadata *> * _Nullable slotTypes;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetSlotTypesRequest : AWSRequest


/**
 <p>The maximum number of slot types to return in the response. The default is 10.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Substring to match in slot type names. A slot type will be returned if any part of its name matches the substring. For example, "xyz" matches both "xyzabc" and "abcxyz."</p>
 */
@property (nonatomic, strong) NSString * _Nullable nameContains;

/**
 <p>A pagination token that fetches the next page of slot types. If the response to this API call is truncated, Amazon Lex returns a pagination token in the response. To fetch next page of slot types, specify the pagination token in the next request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetSlotTypesResponse : AWSModel


/**
 <p>If the response is truncated, it includes a pagination token that you can specify in your next request to fetch the next page of slot types.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>An array of objects, one for each slot type, that provides information such as the name of the slot type, the version, and a description.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceSlotTypeMetadata *> * _Nullable slotTypes;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetUtterancesViewRequest : AWSRequest


/**
 <p>The name of the bot for which utterance information should be returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>An array of bot versions for which utterance information should be returned. The limit is 5 versions per request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable botVersions;

/**
 <p>To return utterances that were recognized and handled, use <code>Detected</code>. To return utterances that were not recognized, use <code>Missed</code>.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceStatusType statusType;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceGetUtterancesViewResponse : AWSModel


/**
 <p>The name of the bot for which utterance information was returned.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>An array of <a>UtteranceList</a> objects, each containing a list of <a>UtteranceData</a> objects describing the utterances that were processed by your bot. The response contains a maximum of 100 <code>UtteranceData</code> objects for each version. Amazon Lex returns the most frequent utterances received by the bot in the last 15 days.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceUtteranceList *> * _Nullable utterances;

@end

/**
 <p>Identifies the specific version of an intent.</p>
 Required parameters: [intentName, intentVersion]
 */
@interface AWSLexmodelbuildingserviceIntent : AWSModel


/**
 <p>The name of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable intentName;

/**
 <p>The version of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable intentVersion;

@end

/**
 <p>Provides information about an intent.</p>
 */
@interface AWSLexmodelbuildingserviceIntentMetadata : AWSModel


/**
 <p>The date that the intent was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date that the intent was updated. When you create an intent, the creation date and last updated date are the same.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Provides configuration information for the AMAZON.KendraSearchIntent intent. When you use this intent, Amazon Lex searches the specified Amazon Kendra index and returns documents from the index that match the user's utterance. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/built-in-intent-kendra-search.html"> AMAZON.KendraSearchIntent</a>.</p>
 Required parameters: [kendraIndex, role]
 */
@interface AWSLexmodelbuildingserviceKendraConfiguration : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the Amazon Kendra index that you want the AMAZON.KendraSearchIntent intent to search. The index must be in the same account and Region as the Amazon Lex bot. If the Amazon Kendra index does not exist, you get an exception when you call the <code>PutIntent</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kendraIndex;

/**
 <p>A query filter that Amazon Lex sends to Amazon Kendra to filter the response from the query. The filter is in the format defined by Amazon Kendra. For more information, see <a href="http://docs.aws.amazon.com/kendra/latest/dg/filtering.html">Filtering queries</a>.</p><p>You can override this filter string with a new filter string at runtime.</p>
 */
@property (nonatomic, strong) NSString * _Nullable queryFilterString;

/**
 <p>The Amazon Resource Name (ARN) of an IAM role that has permission to search the Amazon Kendra index. The role must be in the same account and Region as the Amazon Lex bot. If the role does not exist, you get an exception when you call the <code>PutIntent</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable role;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to get a list of tags for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceListTagsForResourceResponse : AWSModel


/**
 <p>The tags associated with a resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceTag *> * _Nullable tags;

@end

/**
 <p>Settings used to configure delivery mode and destination for conversation logs.</p>
 Required parameters: [logType, destination, resourceArn]
 */
@interface AWSLexmodelbuildingserviceLogSettingsRequest : AWSModel


/**
 <p>Where the logs will be delivered. Text logs are delivered to a CloudWatch Logs log group. Audio logs are delivered to an S3 bucket.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceDestination destination;

/**
 <p>The Amazon Resource Name (ARN) of the AWS KMS customer managed key for encrypting audio logs delivered to an S3 bucket. The key does not apply to CloudWatch Logs and is optional for S3 buckets.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

/**
 <p>The type of logging to enable. Text logs are delivered to a CloudWatch Logs log group. Audio logs are delivered to an S3 bucket.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceLogType logType;

/**
 <p>The Amazon Resource Name (ARN) of the CloudWatch Logs log group or S3 bucket where the logs should be delivered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 <p>The settings for conversation logs.</p>
 */
@interface AWSLexmodelbuildingserviceLogSettingsResponse : AWSModel


/**
 <p>The destination where logs are delivered.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceDestination destination;

/**
 <p>The Amazon Resource Name (ARN) of the key used to encrypt audio logs in an S3 bucket.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

/**
 <p>The type of logging that is enabled.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceLogType logType;

/**
 <p>The Amazon Resource Name (ARN) of the CloudWatch Logs log group or S3 bucket where the logs are delivered.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The resource prefix is the first part of the S3 object key within the S3 bucket that you specified to contain audio logs. For CloudWatch Logs it is the prefix of the log stream name within the log group that you specified. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourcePrefix;

@end

/**
 <p>The message object that provides the message text and its type.</p>
 Required parameters: [contentType, content]
 */
@interface AWSLexmodelbuildingserviceMessage : AWSModel


/**
 <p>The text of the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>The content type of the message string.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceContentType contentType;

/**
 <p>Identifies the message group that the message belongs to. When a group is assigned to a message, Amazon Lex returns one message from each group in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable groupNumber;

@end

/**
 <p>Obtains information from the user. To define a prompt, provide one or more messages and specify the number of attempts to get information from the user. If you provide more than one message, Amazon Lex chooses one of the messages to use to prompt the user. For more information, see <a>how-it-works</a>.</p>
 Required parameters: [messages, maxAttempts]
 */
@interface AWSLexmodelbuildingservicePrompt : AWSModel


/**
 <p>The number of times to prompt the user for information.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxAttempts;

/**
 <p>An array of objects, each of which provides a message string and its type. You can specify the message string in plain text or in Speech Synthesis Markup Language (SSML).</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceMessage *> * _Nullable messages;

/**
 <p>A response card. Amazon Lex uses this prompt at runtime, in the <code>PostText</code> API response. It substitutes session attributes and slot values for placeholders in the response card. For more information, see <a>ex-resp-card</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable responseCard;

@end

/**
 
 */
@interface AWSLexmodelbuildingservicePutBotAliasRequest : AWSRequest


/**
 <p>The name of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The version of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botVersion;

/**
 <p>Identifies a specific revision of the <code>$LATEST</code> version.</p><p>When you create a new bot alias, leave the <code>checksum</code> field blank. If you specify a checksum you get a <code>BadRequestException</code> exception.</p><p>When you want to update a bot alias, set the <code>checksum</code> field to the checksum of the most recent revision of the <code>$LATEST</code> version. If you don't specify the <code> checksum</code> field, or if the checksum does not match the <code>$LATEST</code> version, you get a <code>PreconditionFailedException</code> exception.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>Settings for conversation logs for the alias.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceConversationLogsRequest * _Nullable conversationLogs;

/**
 <p>A description of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the alias. The name is <i>not</i> case sensitive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of tags to add to the bot alias. You can only add tags when you create an alias, you can't use the <code>PutBotAlias</code> operation to update the tags on a bot alias. To update tags, use the <code>TagResource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLexmodelbuildingservicePutBotAliasResponse : AWSModel


/**
 <p>The name of the bot that the alias points to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botName;

/**
 <p>The version of the bot that the alias points to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botVersion;

/**
 <p>The checksum for the current version of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>The settings that determine how Amazon Lex uses conversation logs for the alias.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceConversationLogsResponse * _Nullable conversationLogs;

/**
 <p>The date that the bot alias was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date that the bot alias was updated. When you create a resource, the creation date and the last updated date are the same.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the alias.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of tags associated with a bot.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLexmodelbuildingservicePutBotRequest : AWSRequest


/**
 <p>When Amazon Lex can't understand the user's input in context, it tries to elicit the information a few times. After that, Amazon Lex sends the message defined in <code>abortStatement</code> to the user, and then aborts the conversation. To set the number of retries, use the <code>valueElicitationPrompt</code> field for the slot type. </p><p>For example, in a pizza ordering bot, Amazon Lex might ask a user "What type of crust would you like?" If the user's response is not one of the expected responses (for example, "thin crust, "deep dish," etc.), Amazon Lex tries to elicit a correct response a few more times. </p><p>For example, in a pizza ordering application, <code>OrderPizza</code> might be one of the intents. This intent might require the <code>CrustType</code> slot. You specify the <code>valueElicitationPrompt</code> field when you create the <code>CrustType</code> slot.</p><p>If you have defined a fallback intent the abort statement will not be sent to the user, the fallback intent is used instead. For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/built-in-intent-fallback.html"> AMAZON.FallbackIntent</a>.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable abortStatement;

/**
 <p>Identifies a specific revision of the <code>$LATEST</code> version.</p><p>When you create a new bot, leave the <code>checksum</code> field blank. If you specify a checksum you get a <code>BadRequestException</code> exception.</p><p>When you want to update a bot, set the <code>checksum</code> field to the checksum of the most recent revision of the <code>$LATEST</code> version. If you don't specify the <code> checksum</code> field, or if the checksum does not match the <code>$LATEST</code> version, you get a <code>PreconditionFailedException</code> exception.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>For each Amazon Lex bot created with the Amazon Lex Model Building Service, you must specify whether your use of Amazon Lex is related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to the Children's Online Privacy Protection Act (COPPA) by specifying <code>true</code> or <code>false</code> in the <code>childDirected</code> field. By specifying <code>true</code> in the <code>childDirected</code> field, you confirm that your use of Amazon Lex <b>is</b> related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA. By specifying <code>false</code> in the <code>childDirected</code> field, you confirm that your use of Amazon Lex <b>is not</b> related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA. You may not specify a default value for the <code>childDirected</code> field that does not accurately reflect whether your use of Amazon Lex is related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA.</p><p>If your use of Amazon Lex relates to a website, program, or other application that is directed in whole or in part, to children under age 13, you must obtain any required verifiable parental consent under COPPA. For information regarding the use of Amazon Lex in connection with websites, programs, or other applications that are directed or targeted, in whole or in part, to children under age 13, see the <a href="https://aws.amazon.com/lex/faqs#data-security">Amazon Lex FAQ.</a></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable childDirected;

/**
 <p>When Amazon Lex doesn't understand the user's intent, it uses this message to get clarification. To specify how many times Amazon Lex should repeat the clarification prompt, use the <code>maxAttempts</code> field. If Amazon Lex still doesn't understand, it sends the message in the <code>abortStatement</code> field. </p><p>When you create a clarification prompt, make sure that it suggests the correct response from the user. for example, for a bot that orders pizza and drinks, you might create this clarification prompt: "What would you like to do? You can say 'Order a pizza' or 'Order a drink.'"</p><p>If you have defined a fallback intent, it will be invoked if the clarification prompt is repeated the number of times defined in the <code>maxAttempts</code> field. For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/built-in-intent-fallback.html"> AMAZON.FallbackIntent</a>.</p><p>If you don't define a clarification prompt, at runtime Amazon Lex will return a 400 Bad Request exception in three cases: </p><ul><li><p>Follow-up prompt - When the user responds to a follow-up prompt but does not provide an intent. For example, in response to a follow-up prompt that says "Would you like anything else today?" the user says "Yes." Amazon Lex will return a 400 Bad Request exception because it does not have a clarification prompt to send to the user to get an intent.</p></li><li><p>Lambda function - When using a Lambda function, you return an <code>ElicitIntent</code> dialog type. Since Amazon Lex does not have a clarification prompt to get an intent from the user, it returns a 400 Bad Request exception.</p></li><li><p>PutSession operation - When using the <code>PutSession</code> operation, you send an <code>ElicitIntent</code> dialog type. Since Amazon Lex does not have a clarification prompt to get an intent from the user, it returns a 400 Bad Request exception.</p></li></ul>
 */
@property (nonatomic, strong) AWSLexmodelbuildingservicePrompt * _Nullable clarificationPrompt;

/**
 <p>When set to <code>true</code> a new numbered version of the bot is created. This is the same as calling the <code>CreateBotVersion</code> operation. If you don't specify <code>createVersion</code>, the default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createVersion;

/**
 <p>A description of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>When set to <code>true</code> user utterances are sent to Amazon Comprehend for sentiment analysis. If you don't specify <code>detectSentiment</code>, the default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable detectSentiment;

/**
 <p>The maximum time in seconds that Amazon Lex retains the data gathered in a conversation.</p><p>A user interaction session remains active for the amount of time specified. If no conversation occurs during this time, the session expires and Amazon Lex deletes any data provided before the timeout.</p><p>For example, suppose that a user chooses the OrderPizza intent, but gets sidetracked halfway through placing an order. If the user doesn't complete the order within the specified time, Amazon Lex discards the slot information that it gathered, and the user must start over.</p><p>If you don't include the <code>idleSessionTTLInSeconds</code> element in a <code>PutBot</code> operation request, Amazon Lex uses the default value. This is also true if the request replaces an existing bot.</p><p>The default is 300 seconds (5 minutes).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idleSessionTTLInSeconds;

/**
 <p>An array of <code>Intent</code> objects. Each intent represents a command that a user can express. For example, a pizza ordering bot might support an OrderPizza intent. For more information, see <a>how-it-works</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceIntent *> * _Nullable intents;

/**
 <p> Specifies the target locale for the bot. Any intent used in the bot must be compatible with the locale of the bot. </p><p>The default is <code>en-US</code>.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceLocale locale;

/**
 <p>The name of the bot. The name is <i>not</i> case sensitive. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If you set the <code>processBehavior</code> element to <code>BUILD</code>, Amazon Lex builds the bot so that it can be run. If you set the element to <code>SAVE</code> Amazon Lex saves the bot, but doesn't build it. </p><p>If you don't specify this value, the default value is <code>BUILD</code>.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceProcessBehavior processBehavior;

/**
 <p>A list of tags to add to the bot. You can only add tags when you create a bot, you can't use the <code>PutBot</code> operation to update the tags on a bot. To update tags, use the <code>TagResource</code> operation.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceTag *> * _Nullable tags;

/**
 <p>The Amazon Polly voice ID that you want Amazon Lex to use for voice interactions with the user. The locale configured for the voice must match the locale of the bot. For more information, see <a href="https://docs.aws.amazon.com/polly/latest/dg/voicelist.html">Voices in Amazon Polly</a> in the <i>Amazon Polly Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceId;

@end

/**
 
 */
@interface AWSLexmodelbuildingservicePutBotResponse : AWSModel


/**
 <p>The message that Amazon Lex uses to abort a conversation. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable abortStatement;

/**
 <p>Checksum of the bot that you created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>For each Amazon Lex bot created with the Amazon Lex Model Building Service, you must specify whether your use of Amazon Lex is related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to the Children's Online Privacy Protection Act (COPPA) by specifying <code>true</code> or <code>false</code> in the <code>childDirected</code> field. By specifying <code>true</code> in the <code>childDirected</code> field, you confirm that your use of Amazon Lex <b>is</b> related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA. By specifying <code>false</code> in the <code>childDirected</code> field, you confirm that your use of Amazon Lex <b>is not</b> related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA. You may not specify a default value for the <code>childDirected</code> field that does not accurately reflect whether your use of Amazon Lex is related to a website, program, or other application that is directed or targeted, in whole or in part, to children under age 13 and subject to COPPA.</p><p>If your use of Amazon Lex relates to a website, program, or other application that is directed in whole or in part, to children under age 13, you must obtain any required verifiable parental consent under COPPA. For information regarding the use of Amazon Lex in connection with websites, programs, or other applications that are directed or targeted, in whole or in part, to children under age 13, see the <a href="https://aws.amazon.com/lex/faqs#data-security">Amazon Lex FAQ.</a></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable childDirected;

/**
 <p> The prompts that Amazon Lex uses when it doesn't understand the user's intent. For more information, see <a>PutBot</a>. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingservicePrompt * _Nullable clarificationPrompt;

/**
 <p><code>True</code> if a new version of the bot was created. If the <code>createVersion</code> field was not specified in the request, the <code>createVersion</code> field is set to false in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createVersion;

/**
 <p>The date that the bot was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p><code>true</code> if the bot is configured to send user utterances to Amazon Comprehend for sentiment analysis. If the <code>detectSentiment</code> field was not specified in the request, the <code>detectSentiment</code> field is <code>false</code> in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable detectSentiment;

/**
 <p>If <code>status</code> is <code>FAILED</code>, Amazon Lex provides the reason that it failed to build the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable failureReason;

/**
 <p>The maximum length of time that Amazon Lex retains the data gathered in a conversation. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idleSessionTTLInSeconds;

/**
 <p>An array of <code>Intent</code> objects. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceIntent *> * _Nullable intents;

/**
 <p>The date that the bot was updated. When you create a resource, the creation date and last updated date are the same.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p> The target locale for the bot. </p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceLocale locale;

/**
 <p>The name of the bot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> When you send a request to create a bot with <code>processBehavior</code> set to <code>BUILD</code>, Amazon Lex sets the <code>status</code> response element to <code>BUILDING</code>.</p><p>In the <code>READY_BASIC_TESTING</code> state you can test the bot with user inputs that exactly match the utterances configured for the bot's intents and values in the slot types.</p><p>If Amazon Lex can't build the bot, Amazon Lex sets <code>status</code> to <code>FAILED</code>. Amazon Lex returns the reason for the failure in the <code>failureReason</code> response element. </p><p>When you set <code>processBehavior</code> to <code>SAVE</code>, Amazon Lex sets the status code to <code>NOT BUILT</code>.</p><p>When the bot is in the <code>READY</code> state you can test and publish the bot.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceStatus status;

/**
 <p>A list of tags associated with the bot.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceTag *> * _Nullable tags;

/**
 <p>The version of the bot. For a new bot, the version is always <code>$LATEST</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

/**
 <p>The Amazon Polly voice ID that Amazon Lex uses for voice interaction with the user. For more information, see <a>PutBot</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable voiceId;

@end

/**
 
 */
@interface AWSLexmodelbuildingservicePutIntentRequest : AWSRequest


/**
 <p>Identifies a specific revision of the <code>$LATEST</code> version.</p><p>When you create a new intent, leave the <code>checksum</code> field blank. If you specify a checksum you get a <code>BadRequestException</code> exception.</p><p>When you want to update a intent, set the <code>checksum</code> field to the checksum of the most recent revision of the <code>$LATEST</code> version. If you don't specify the <code> checksum</code> field, or if the checksum does not match the <code>$LATEST</code> version, you get a <code>PreconditionFailedException</code> exception.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p> The statement that you want Amazon Lex to convey to the user after the intent is successfully fulfilled by the Lambda function. </p><p>This element is relevant only if you provide a Lambda function in the <code>fulfillmentActivity</code>. If you return the intent to the client application, you can't specify this element.</p><note><p>The <code>followUpPrompt</code> and <code>conclusionStatement</code> are mutually exclusive. You can specify only one.</p></note>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable conclusionStatement;

/**
 <p>Prompts the user to confirm the intent. This question should have a yes or no answer.</p><p>Amazon Lex uses this prompt to ensure that the user acknowledges that the intent is ready for fulfillment. For example, with the <code>OrderPizza</code> intent, you might want to confirm that the order is correct before placing it. For other intents, such as intents that simply respond to user questions, you might not need to ask the user for confirmation before providing the information. </p><note><p>You you must provide both the <code>rejectionStatement</code> and the <code>confirmationPrompt</code>, or neither.</p></note>
 */
@property (nonatomic, strong) AWSLexmodelbuildingservicePrompt * _Nullable confirmationPrompt;

/**
 <p>When set to <code>true</code> a new numbered version of the intent is created. This is the same as calling the <code>CreateIntentVersion</code> operation. If you do not specify <code>createVersion</code>, the default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createVersion;

/**
 <p>A description of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p> Specifies a Lambda function to invoke for each user input. You can invoke this Lambda function to personalize user interaction. </p><p>For example, suppose your bot determines that the user is John. Your Lambda function might retrieve John's information from a backend database and prepopulate some of the values. For example, if you find that John is gluten intolerant, you might set the corresponding intent slot, <code>GlutenIntolerant</code>, to true. You might find John's phone number and set the corresponding session attribute. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceCodeHook * _Nullable dialogCodeHook;

/**
 <p>Amazon Lex uses this prompt to solicit additional activity after fulfilling an intent. For example, after the <code>OrderPizza</code> intent is fulfilled, you might prompt the user to order a drink.</p><p>The action that Amazon Lex takes depends on the user's response, as follows:</p><ul><li><p>If the user says "Yes" it responds with the clarification prompt that is configured for the bot.</p></li><li><p>if the user says "Yes" and continues with an utterance that triggers an intent it starts a conversation for the intent.</p></li><li><p>If the user says "No" it responds with the rejection statement configured for the the follow-up prompt.</p></li><li><p>If it doesn't recognize the utterance it repeats the follow-up prompt again.</p></li></ul><p>The <code>followUpPrompt</code> field and the <code>conclusionStatement</code> field are mutually exclusive. You can specify only one. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceFollowUpPrompt * _Nullable followUpPrompt;

/**
 <p>Required. Describes how the intent is fulfilled. For example, after a user provides all of the information for a pizza order, <code>fulfillmentActivity</code> defines how the bot places an order with a local pizza store. </p><p> You might configure Amazon Lex to return all of the intent information to the client application, or direct it to invoke a Lambda function that can process the intent (for example, place an order with a pizzeria). </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceFulfillmentActivity * _Nullable fulfillmentActivity;

/**
 <p>Configuration information required to use the <code>AMAZON.KendraSearchIntent</code> intent to connect to an Amazon Kendra index. For more information, see <a href="http://docs.aws.amazon.com/lex/latest/dg/built-in-intent-kendra-search.html"> AMAZON.KendraSearchIntent</a>.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceKendraConfiguration * _Nullable kendraConfiguration;

/**
 <p>The name of the intent. The name is <i>not</i> case sensitive. </p><p>The name can't match a built-in intent name, or a built-in intent name with "AMAZON." removed. For example, because there is a built-in intent called <code>AMAZON.HelpIntent</code>, you can't create a custom intent called <code>HelpIntent</code>.</p><p>For a list of built-in intents, see <a href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard Built-in Intents</a> in the <i>Alexa Skills Kit</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for the built-in intent to base this intent on. To find the signature for an intent, see <a href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents">Standard Built-in Intents</a> in the <i>Alexa Skills Kit</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentIntentSignature;

/**
 <p>When the user answers "no" to the question defined in <code>confirmationPrompt</code>, Amazon Lex responds with this statement to acknowledge that the intent was canceled. </p><note><p>You must provide both the <code>rejectionStatement</code> and the <code>confirmationPrompt</code>, or neither.</p></note>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable rejectionStatement;

/**
 <p>An array of utterances (strings) that a user might say to signal the intent. For example, "I want {PizzaSize} pizza", "Order {Quantity} {PizzaSize} pizzas". </p><p>In each utterance, a slot name is enclosed in curly braces. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sampleUtterances;

/**
 <p>An array of intent slots. At runtime, Amazon Lex elicits required slot values from the user using prompts defined in the slots. For more information, see <a>how-it-works</a>. </p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceSlot *> * _Nullable slots;

@end

/**
 
 */
@interface AWSLexmodelbuildingservicePutIntentResponse : AWSModel


/**
 <p>Checksum of the <code>$LATEST</code>version of the intent created or updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>After the Lambda function specified in the<code>fulfillmentActivity</code>intent fulfills the intent, Amazon Lex conveys this statement to the user.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable conclusionStatement;

/**
 <p>If defined in the intent, Amazon Lex prompts the user to confirm the intent before fulfilling it.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingservicePrompt * _Nullable confirmationPrompt;

/**
 <p><code>True</code> if a new version of the intent was created. If the <code>createVersion</code> field was not specified in the request, the <code>createVersion</code> field is set to false in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createVersion;

/**
 <p>The date that the intent was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If defined in the intent, Amazon Lex invokes this Lambda function for each user input.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceCodeHook * _Nullable dialogCodeHook;

/**
 <p>If defined in the intent, Amazon Lex uses this prompt to solicit additional user activity after the intent is fulfilled.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceFollowUpPrompt * _Nullable followUpPrompt;

/**
 <p>If defined in the intent, Amazon Lex invokes this Lambda function to fulfill the intent after the user provides all of the information required by the intent.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceFulfillmentActivity * _Nullable fulfillmentActivity;

/**
 <p>Configuration information, if any, required to connect to an Amazon Kendra index and use the <code>AMAZON.KendraSearchIntent</code> intent.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceKendraConfiguration * _Nullable kendraConfiguration;

/**
 <p>The date that the intent was updated. When you create a resource, the creation date and last update dates are the same.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the intent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A unique identifier for the built-in intent that this intent is based on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentIntentSignature;

/**
 <p>If the user answers "no" to the question defined in <code>confirmationPrompt</code> Amazon Lex responds with this statement to acknowledge that the intent was canceled. </p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceStatement * _Nullable rejectionStatement;

/**
 <p> An array of sample utterances that are configured for the intent. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sampleUtterances;

/**
 <p>An array of intent slots that are configured for the intent.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceSlot *> * _Nullable slots;

/**
 <p>The version of the intent. For a new intent, the version is always <code>$LATEST</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 
 */
@interface AWSLexmodelbuildingservicePutSlotTypeRequest : AWSRequest


/**
 <p>Identifies a specific revision of the <code>$LATEST</code> version.</p><p>When you create a new slot type, leave the <code>checksum</code> field blank. If you specify a checksum you get a <code>BadRequestException</code> exception.</p><p>When you want to update a slot type, set the <code>checksum</code> field to the checksum of the most recent revision of the <code>$LATEST</code> version. If you don't specify the <code> checksum</code> field, or if the checksum does not match the <code>$LATEST</code> version, you get a <code>PreconditionFailedException</code> exception.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p>When set to <code>true</code> a new numbered version of the slot type is created. This is the same as calling the <code>CreateSlotTypeVersion</code> operation. If you do not specify <code>createVersion</code>, the default is <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createVersion;

/**
 <p>A description of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of <code>EnumerationValue</code> objects that defines the values that the slot type can take. Each value can have a list of <code>synonyms</code>, which are additional values that help train the machine learning model about the values that it resolves for a slot. </p><p>When Amazon Lex resolves a slot value, it generates a resolution list that contains up to five possible values for the slot. If you are using a Lambda function, this resolution list is passed to the function. If you are not using a Lambda function you can choose to return the value that the user entered or the first value in the resolution list as the slot value. The <code>valueSelectionStrategy</code> field indicates the option to use. </p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceEnumerationValue *> * _Nullable enumerationValues;

/**
 <p>The name of the slot type. The name is <i>not</i> case sensitive. </p><p>The name can't match a built-in slot type name, or a built-in slot type name with "AMAZON." removed. For example, because there is a built-in slot type called <code>AMAZON.DATE</code>, you can't create a custom slot type called <code>DATE</code>.</p><p>For a list of built-in slot types, see <a href="https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference">Slot Type Reference</a> in the <i>Alexa Skills Kit</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The built-in slot type used as the parent of the slot type. When you define a parent slot type, the new slot type has all of the same configuration as the parent.</p><p>Only <code>AMAZON.AlphaNumeric</code> is supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentSlotTypeSignature;

/**
 <p>Configuration information that extends the parent built-in slot type. The configuration is added to the settings for the parent slot type.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceSlotTypeConfiguration *> * _Nullable slotTypeConfigurations;

/**
 <p>Determines the slot resolution strategy that Amazon Lex uses to return slot type values. The field can be set to one of the following values:</p><ul><li><p><code>ORIGINAL_VALUE</code> - Returns the value entered by the user, if the user value is similar to the slot value.</p></li><li><p><code>TOP_RESOLUTION</code> - If there is a resolution list for the slot, return the first value in the resolution list as the slot type value. If there is no resolution list, null is returned.</p></li></ul><p>If you don't specify the <code>valueSelectionStrategy</code>, the default is <code>ORIGINAL_VALUE</code>.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceSlotValueSelectionStrategy valueSelectionStrategy;

@end

/**
 
 */
@interface AWSLexmodelbuildingservicePutSlotTypeResponse : AWSModel


/**
 <p>Checksum of the <code>$LATEST</code> version of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checksum;

/**
 <p><code>True</code> if a new version of the slot type was created. If the <code>createVersion</code> field was not specified in the request, the <code>createVersion</code> field is set to false in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable createVersion;

/**
 <p>The date that the slot type was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A list of <code>EnumerationValue</code> objects that defines the values that the slot type can take.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceEnumerationValue *> * _Nullable enumerationValues;

/**
 <p>The date that the slot type was updated. When you create a slot type, the creation date and last update date are the same.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The built-in slot type used as the parent of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentSlotTypeSignature;

/**
 <p>Configuration information that extends the parent built-in slot type.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceSlotTypeConfiguration *> * _Nullable slotTypeConfigurations;

/**
 <p>The slot resolution strategy that Amazon Lex uses to determine the value of the slot. For more information, see <a>PutSlotType</a>.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceSlotValueSelectionStrategy valueSelectionStrategy;

/**
 <p>The version of the slot type. For a new slot type, the version is always <code>$LATEST</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Describes the resource that refers to the resource that you are attempting to delete. This object is returned as part of the <code>ResourceInUseException</code> exception. </p>
 */
@interface AWSLexmodelbuildingserviceResourceReference : AWSModel


/**
 <p>The name of the resource that is using the resource that you are trying to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the resource that is using the resource that you are trying to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Identifies the version of a specific slot.</p>
 Required parameters: [name, slotConstraint]
 */
@interface AWSLexmodelbuildingserviceSlot : AWSModel


/**
 <p>A description of the slot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the slot.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Determines whether a slot is obfuscated in conversation logs and stored utterances. When you obfuscate a slot, the value is replaced by the slot name in curly braces ({}). For example, if the slot name is "full_name", obfuscated values are replaced with "{full_name}". For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/how-obfuscate.html"> Slot Obfuscation </a>. </p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceObfuscationSetting obfuscationSetting;

/**
 <p> Directs Amazon Lex the order in which to elicit this slot value from the user. For example, if the intent has two slots with priorities 1 and 2, AWS Amazon Lex first elicits a value for the slot with priority 1.</p><p>If multiple slots share the same priority, the order in which Amazon Lex elicits values is arbitrary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

/**
 <p> A set of possible responses for the slot type used by text-based clients. A user chooses an option from the response card, instead of using text to reply. </p>
 */
@property (nonatomic, strong) NSString * _Nullable responseCard;

/**
 <p> If you know a specific pattern with which users might respond to an Amazon Lex request for a slot value, you can provide those utterances to improve accuracy. This is optional. In most cases, Amazon Lex is capable of understanding user utterances. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable sampleUtterances;

/**
 <p>Specifies whether the slot is required or optional. </p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceSlotConstraint slotConstraint;

/**
 <p>The type of the slot, either a custom slot type that you defined or one of the built-in slot types.</p>
 */
@property (nonatomic, strong) NSString * _Nullable slotType;

/**
 <p>The version of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable slotTypeVersion;

/**
 <p>The prompt that Amazon Lex uses to elicit the slot value from the user.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingservicePrompt * _Nullable valueElicitationPrompt;

@end

/**
 <p>Provides configuration information for a slot type.</p>
 */
@interface AWSLexmodelbuildingserviceSlotTypeConfiguration : AWSModel


/**
 <p>A regular expression used to validate the value of a slot.</p>
 */
@property (nonatomic, strong) AWSLexmodelbuildingserviceSlotTypeRegexConfiguration * _Nullable regexConfiguration;

@end

/**
 <p>Provides information about a slot type..</p>
 */
@interface AWSLexmodelbuildingserviceSlotTypeMetadata : AWSModel


/**
 <p>The date that the slot type was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>A description of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The date that the slot type was updated. When you create a resource, the creation date and last updated date are the same. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedDate;

/**
 <p>The name of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The version of the slot type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>Provides a regular expression used to validate the value of a slot.</p>
 Required parameters: [pattern]
 */
@interface AWSLexmodelbuildingserviceSlotTypeRegexConfiguration : AWSModel


/**
 <p>A regular expression used to validate the value of a slot. </p><p>Use a standard regular expression. Amazon Lex supports the following characters in the regular expression:</p><ul><li><p>A-Z, a-z</p></li><li><p>0-9</p></li><li><p>Unicode characters ("\ u&lt;Unicode&gt;")</p></li></ul><p>Represent Unicode characters with four digits, for example "\u0041" or "\u005A".</p><p>The following regular expression operators are not supported:</p><ul><li><p>Infinite repeaters: *, +, or {x,} with no upper bound.</p></li><li><p>Wild card (.)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable pattern;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceStartImportRequest : AWSRequest


/**
 <p>Specifies the action that the <code>StartImport</code> operation should take when there is an existing resource with the same name.</p><ul><li><p>FAIL_ON_CONFLICT - The import operation is stopped on the first conflict between a resource in the import file and an existing resource. The name of the resource causing the conflict is in the <code>failureReason</code> field of the response to the <code>GetImport</code> operation.</p><p>OVERWRITE_LATEST - The import operation proceeds even if there is a conflict with an existing resource. The $LASTEST version of the existing resource is overwritten with the data from the import file.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceMergeStrategy mergeStrategy;

/**
 <p>A zip archive in binary format. The archive should contain one file, a JSON file containing the resource to import. The resource should match the type specified in the <code>resourceType</code> field.</p>
 */
@property (nonatomic, strong) NSData * _Nullable payload;

/**
 <p>Specifies the type of resource to export. Each resource also exports any resources that it depends on. </p><ul><li><p>A bot exports dependent intents.</p></li><li><p>An intent exports dependent slot types.</p></li></ul>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceResourceType resourceType;

/**
 <p>A list of tags to add to the imported bot. You can only add tags when you import a bot, you can't add tags to an intent or slot type.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceStartImportResponse : AWSModel


/**
 <p>A timestamp for the date and time that the import job was requested.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The identifier for the specific import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable importId;

/**
 <p>The status of the import job. If the status is <code>FAILED</code>, you can get the reason for the failure using the <code>GetImport</code> operation.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceImportStatus importStatus;

/**
 <p>The action to take when there is a merge conflict.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceMergeStrategy mergeStrategy;

/**
 <p>The name given to the import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of resource to import.</p>
 */
@property (nonatomic, assign) AWSLexmodelbuildingserviceResourceType resourceType;

/**
 <p>A list of tags added to the imported bot.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceTag *> * _Nullable tags;

@end

/**
 <p>A collection of messages that convey information to the user. At runtime, Amazon Lex selects the message to convey. </p>
 Required parameters: [messages]
 */
@interface AWSLexmodelbuildingserviceStatement : AWSModel


/**
 <p>A collection of message objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceMessage *> * _Nullable messages;

/**
 <p> At runtime, if the client is using the <a href="http://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostText.html">PostText</a> API, Amazon Lex includes the response card in the response. It substitutes all of the session attributes and slot values for placeholders in the response card. </p>
 */
@property (nonatomic, strong) NSString * _Nullable responseCard;

@end

/**
 <p>A list of key/value pairs that identify a bot, bot alias, or bot channel. Tag keys and values can consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - @. </p>
 Required parameters: [key, value]
 */
@interface AWSLexmodelbuildingserviceTag : AWSModel


/**
 <p>The key for the tag. Keys are not case-sensitive and must be unique.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value associated with a key. The value may be an empty string but it can't be null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the bot, bot alias, or bot channel to tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of tag keys to add to the resource. If a tag key already exists, the existing value is replaced with the new value.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSLexmodelbuildingserviceUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource to remove the tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>A list of tag keys to remove from the resource. If a tag key does not exist on the resource, it is ignored.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSLexmodelbuildingserviceUntagResourceResponse : AWSModel


@end

/**
 <p>Provides information about a single utterance that was made to your bot. </p>
 */
@interface AWSLexmodelbuildingserviceUtteranceData : AWSModel


/**
 <p>The number of times that the utterance was processed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The total number of individuals that used the utterance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable distinctUsers;

/**
 <p>The date that the utterance was first recorded.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable firstUtteredDate;

/**
 <p>The date that the utterance was last recorded.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUtteredDate;

/**
 <p>The text that was entered by the user or the text representation of an audio clip.</p>
 */
@property (nonatomic, strong) NSString * _Nullable utteranceString;

@end

/**
 <p>Provides a list of utterances that have been made to a specific version of your bot. The list contains a maximum of 100 utterances.</p>
 */
@interface AWSLexmodelbuildingserviceUtteranceList : AWSModel


/**
 <p>The version of the bot that processed the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable botVersion;

/**
 <p>One or more <a>UtteranceData</a> objects that contain information about the utterances that have been made to a bot. The maximum number of object is 100.</p>
 */
@property (nonatomic, strong) NSArray<AWSLexmodelbuildingserviceUtteranceData *> * _Nullable utterances;

@end

NS_ASSUME_NONNULL_END
