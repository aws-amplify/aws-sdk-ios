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

FOUNDATION_EXPORT NSString *const AWSSecretsManagerErrorDomain;

typedef NS_ENUM(NSInteger, AWSSecretsManagerErrorType) {
    AWSSecretsManagerErrorUnknown,
    AWSSecretsManagerErrorDecryptionFailure,
    AWSSecretsManagerErrorEncryptionFailure,
    AWSSecretsManagerErrorInternalService,
    AWSSecretsManagerErrorInvalidNextToken,
    AWSSecretsManagerErrorInvalidParameter,
    AWSSecretsManagerErrorInvalidRequest,
    AWSSecretsManagerErrorLimitExceeded,
    AWSSecretsManagerErrorMalformedPolicyDocument,
    AWSSecretsManagerErrorPreconditionNotMet,
    AWSSecretsManagerErrorPublicPolicy,
    AWSSecretsManagerErrorResourceExists,
    AWSSecretsManagerErrorResourceNotFound,
};

typedef NS_ENUM(NSInteger, AWSSecretsManagerFilterNameStringType) {
    AWSSecretsManagerFilterNameStringTypeUnknown,
    AWSSecretsManagerFilterNameStringTypeDescription,
    AWSSecretsManagerFilterNameStringTypeName,
    AWSSecretsManagerFilterNameStringTypeTagKey,
    AWSSecretsManagerFilterNameStringTypeTagValue,
    AWSSecretsManagerFilterNameStringTypeAll,
};

typedef NS_ENUM(NSInteger, AWSSecretsManagerSortOrderType) {
    AWSSecretsManagerSortOrderTypeUnknown,
    AWSSecretsManagerSortOrderTypeAsc,
    AWSSecretsManagerSortOrderTypeDesc,
};

@class AWSSecretsManagerCancelRotateSecretRequest;
@class AWSSecretsManagerCancelRotateSecretResponse;
@class AWSSecretsManagerCreateSecretRequest;
@class AWSSecretsManagerCreateSecretResponse;
@class AWSSecretsManagerDeleteResourcePolicyRequest;
@class AWSSecretsManagerDeleteResourcePolicyResponse;
@class AWSSecretsManagerDeleteSecretRequest;
@class AWSSecretsManagerDeleteSecretResponse;
@class AWSSecretsManagerDescribeSecretRequest;
@class AWSSecretsManagerDescribeSecretResponse;
@class AWSSecretsManagerFilter;
@class AWSSecretsManagerGetRandomPasswordRequest;
@class AWSSecretsManagerGetRandomPasswordResponse;
@class AWSSecretsManagerGetResourcePolicyRequest;
@class AWSSecretsManagerGetResourcePolicyResponse;
@class AWSSecretsManagerGetSecretValueRequest;
@class AWSSecretsManagerGetSecretValueResponse;
@class AWSSecretsManagerListSecretVersionIdsRequest;
@class AWSSecretsManagerListSecretVersionIdsResponse;
@class AWSSecretsManagerListSecretsRequest;
@class AWSSecretsManagerListSecretsResponse;
@class AWSSecretsManagerPutResourcePolicyRequest;
@class AWSSecretsManagerPutResourcePolicyResponse;
@class AWSSecretsManagerPutSecretValueRequest;
@class AWSSecretsManagerPutSecretValueResponse;
@class AWSSecretsManagerRestoreSecretRequest;
@class AWSSecretsManagerRestoreSecretResponse;
@class AWSSecretsManagerRotateSecretRequest;
@class AWSSecretsManagerRotateSecretResponse;
@class AWSSecretsManagerRotationRulesType;
@class AWSSecretsManagerSecretListEntry;
@class AWSSecretsManagerSecretVersionsListEntry;
@class AWSSecretsManagerTag;
@class AWSSecretsManagerTagResourceRequest;
@class AWSSecretsManagerUntagResourceRequest;
@class AWSSecretsManagerUpdateSecretRequest;
@class AWSSecretsManagerUpdateSecretResponse;
@class AWSSecretsManagerUpdateSecretVersionStageRequest;
@class AWSSecretsManagerUpdateSecretVersionStageResponse;
@class AWSSecretsManagerValidateResourcePolicyRequest;
@class AWSSecretsManagerValidateResourcePolicyResponse;
@class AWSSecretsManagerValidationErrorsEntry;

/**
 
 */
@interface AWSSecretsManagerCancelRotateSecretRequest : AWSRequest


/**
 <p>Specifies the secret to cancel a rotation request. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

@end

/**
 
 */
@interface AWSSecretsManagerCancelRotateSecretResponse : AWSModel


/**
 <p>The ARN of the secret for which rotation was canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret for which rotation was canceled.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier of the version of the secret created during the rotation. This version might not be complete, and should be evaluated for possible deletion. At the very least, you should remove the <code>VersionStage</code> value <code>AWSPENDING</code> to enable this version to be deleted. Failing to clean up a cancelled rotation can block you from successfully starting future rotations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSSecretsManagerCreateSecretRequest : AWSRequest


/**
 <p>(Optional) If you include <code>SecretString</code> or <code>SecretBinary</code>, then an initial version is created as part of the secret, and this parameter specifies a unique identifier for the new version. </p><note><p>If you use the AWS CLI or one of the AWS SDK to call this operation, then you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes it as the value for this parameter in the request. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, then you must generate a <code>ClientRequestToken</code> yourself for the new version and include the value in the request.</p></note><p>This value helps ensure idempotency. Secrets Manager uses this value to prevent the accidental creation of duplicate versions if there are failures and retries during a rotation. We recommend that you generate a <a href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a> value to ensure uniqueness of your versions within the specified secret. </p><ul><li><p>If the <code>ClientRequestToken</code> value isn't already associated with a version of the secret then a new version of the secret is created. </p></li><li><p>If a version with this value already exists and the version <code>SecretString</code> and <code>SecretBinary</code> values are the same as those in the request, then the request is ignored.</p></li><li><p>If a version with this value already exists and that version's <code>SecretString</code> and <code>SecretBinary</code> values are different from those in the request then the request fails because you cannot modify an existing version. Instead, use <a>PutSecretValue</a> to create a new version.</p></li></ul><p>This value becomes the <code>VersionId</code> of the new version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>(Optional) Specifies a user-provided description of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>(Optional) Specifies the ARN, Key ID, or alias of the AWS KMS customer master key (CMK) to be used to encrypt the <code>SecretString</code> or <code>SecretBinary</code> values in the versions stored in this secret.</p><p>You can specify any of the supported ways to identify a AWS KMS key ID. If you need to reference a CMK in a different account, you can use only the key ARN or the alias ARN.</p><p>If you don't specify this value, then Secrets Manager defaults to using the AWS account's default CMK (the one named <code>aws/secretsmanager</code>). If a AWS KMS CMK with that name doesn't yet exist, then Secrets Manager creates it for you automatically the first time it needs to encrypt a version's <code>SecretString</code> or <code>SecretBinary</code> fields.</p><important><p>You can use the account default CMK to encrypt and decrypt only if you call this operation using credentials from the same account that owns the secret. If the secret resides in a different account, then you must create a custom CMK and specify the ARN in this field. </p></important>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Specifies the friendly name of the new secret.</p><p>The secret name must be ASCII letters, digits, or the following characters : /_+=.@-</p><note><p>Do not end your secret name with a hyphen followed by six characters. If you do so, you risk confusion and unexpected results when searching for a secret by partial ARN. Secrets Manager automatically adds a hyphen and six random characters at the end of the ARN.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>(Optional) Specifies binary data that you want to encrypt and store in the new version of the secret. To use this parameter in the command-line tools, we recommend that you store your binary data in a file and then use the appropriate technique for your tool to pass the contents of the file as a parameter.</p><p>Either <code>SecretString</code> or <code>SecretBinary</code> must have a value, but not both. They cannot both be empty.</p><p>This parameter is not available using the Secrets Manager console. It can be accessed only by using the AWS CLI or one of the AWS SDKs.</p>
 */
@property (nonatomic, strong) NSData * _Nullable secretBinary;

/**
 <p>(Optional) Specifies text data that you want to encrypt and store in this new version of the secret.</p><p>Either <code>SecretString</code> or <code>SecretBinary</code> must have a value, but not both. They cannot both be empty.</p><p>If you create a secret by using the Secrets Manager console then Secrets Manager puts the protected secret text in only the <code>SecretString</code> parameter. The Secrets Manager console stores the information as a JSON structure of key/value pairs that the Lambda rotation function knows how to parse.</p><p>For storing multiple values, we recommend that you use a JSON text string argument and specify key/value pairs. For information on how to format a JSON parameter for the various command line tool environments, see <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For example:</p><p><code>{"username":"bob","password":"abc123xyz456"}</code></p><p>If your command-line tool or SDK requires quotation marks around the parameter, you should use single quotes to avoid confusion with the double quotes required in the JSON text. </p>
 */
@property (nonatomic, strong) NSString * _Nullable secretString;

/**
 <p>(Optional) Specifies a list of user-defined tags that are attached to the secret. Each tag is a "Key" and "Value" pair of strings. This operation only appends tags to the existing list of tags. To remove tags, you must use <a>UntagResource</a>.</p><important><ul><li><p>Secrets Manager tag key names are case sensitive. A tag with the key "ABC" is a different tag from one with key "abc".</p></li><li><p>If you check tags in IAM policy <code>Condition</code> elements as part of your security strategy, then adding or removing a tag can change permissions. If the successful completion of this operation would result in you losing your permissions for this secret, then this operation is blocked and returns an <code>Access Denied</code> error.</p></li></ul></important><p>This parameter requires a JSON text string argument. For information on how to format a JSON parameter for the various command line tool environments, see <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For example:</p><p><code>[{"Key":"CostCenter","Value":"12345"},{"Key":"environment","Value":"production"}]</code></p><p>If your command-line tool or SDK requires quotation marks around the parameter, you should use single quotes to avoid confusion with the double quotes required in the JSON text. </p><p>The following basic restrictions apply to tags:</p><ul><li><p>Maximum number of tags per secret—50</p></li><li><p>Maximum key length—127 Unicode characters in UTF-8</p></li><li><p>Maximum value length—255 Unicode characters in UTF-8</p></li><li><p>Tag keys and values are case sensitive.</p></li><li><p>Do not use the <code>aws:</code> prefix in your tag names or values because AWS reserves it for AWS use. You can't edit or delete tag names or values with this prefix. Tags with this prefix do not count against your tags per secret limit.</p></li><li><p>If you use your tagging schema across multiple services and resources, remember other services might have restrictions on allowed characters. Generally allowed characters: letters, spaces, and numbers representable in UTF-8, plus the following special characters: + - = . _ : / @.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSSecretsManagerTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSecretsManagerCreateSecretResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the secret that you just created.</p><note><p>Secrets Manager automatically adds several random characters to the name at the end of the ARN when you initially create a secret. This affects only the ARN and not the actual friendly name. This ensures that if you create a new secret with the same name as an old secret that you previously deleted, then users with access to the old secret <i>don't</i> automatically get access to the new secret because the ARNs are different.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret that you just created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier associated with the version of the secret you just created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSSecretsManagerDeleteResourcePolicyRequest : AWSRequest


/**
 <p>Specifies the secret that you want to delete the attached resource-based policy for. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

@end

/**
 
 */
@interface AWSSecretsManagerDeleteResourcePolicyResponse : AWSModel


/**
 <p>The ARN of the secret that the resource-based policy was deleted for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret that the resource-based policy was deleted for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSecretsManagerDeleteSecretRequest : AWSRequest


/**
 <p>(Optional) Specifies that the secret is to be deleted without any recovery window. You can't use both this parameter and the <code>RecoveryWindowInDays</code> parameter in the same API call.</p><p>An asynchronous background process performs the actual deletion, so there can be a short delay before the operation completes. If you write code to delete and then immediately recreate a secret with the same name, ensure that your code includes appropriate back off and retry logic.</p><important><p>Use this parameter with caution. This parameter causes the operation to skip the normal waiting period before the permanent deletion that AWS would normally impose with the <code>RecoveryWindowInDays</code> parameter. If you delete a secret with the <code>ForceDeleteWithouRecovery</code> parameter, then you have no opportunity to recover the secret. It is permanently lost.</p></important>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceDeleteWithoutRecovery;

/**
 <p>(Optional) Specifies the number of days that Secrets Manager waits before it can delete the secret. You can't use both this parameter and the <code>ForceDeleteWithoutRecovery</code> parameter in the same API call.</p><p>This value can range from 7 to 30 days. The default value is 30.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recoveryWindowInDays;

/**
 <p>Specifies the secret that you want to delete. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

@end

/**
 
 */
@interface AWSSecretsManagerDeleteSecretResponse : AWSModel


/**
 <p>The ARN of the secret that is now scheduled for deletion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The date and time after which this secret can be deleted by Secrets Manager and can no longer be restored. This value is the date and time of the delete request plus the number of days specified in <code>RecoveryWindowInDays</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletionDate;

/**
 <p>The friendly name of the secret that is now scheduled for deletion.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSecretsManagerDescribeSecretRequest : AWSRequest


/**
 <p>The identifier of the secret whose details you want to retrieve. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

@end

/**
 
 */
@interface AWSSecretsManagerDescribeSecretResponse : AWSModel


/**
 <p>The ARN of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The date that the secret was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>This value exists if the secret is scheduled for deletion. Some time after the specified date and time, Secrets Manager deletes the secret and all of its versions.</p><p>If a secret is scheduled for deletion, then its details, including the encrypted secret information, is not accessible. To cancel a scheduled deletion and restore access, use <a>RestoreSecret</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletedDate;

/**
 <p>The user-provided description of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN or alias of the AWS KMS customer master key (CMK) that's used to encrypt the <code>SecretString</code> or <code>SecretBinary</code> fields in each version of the secret. If you don't provide a key, then Secrets Manager defaults to encrypting the secret fields with the default AWS KMS CMK (the one named <code>awssecretsmanager</code>) for this account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The last date that this secret was accessed. This value is truncated to midnight of the date and therefore shows only the date, not the time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAccessedDate;

/**
 <p>The last date and time that this secret was modified in any way.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastChangedDate;

/**
 <p>The most recent date and time that the Secrets Manager rotation process was successfully completed. This value is null if the secret has never rotated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastRotatedDate;

/**
 <p>The user-provided friendly name of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Returns the name of the service that created this secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owningService;

/**
 <p>Specifies whether automatic rotation is enabled for this secret.</p><p>To enable rotation, use <a>RotateSecret</a> with <code>AutomaticallyRotateAfterDays</code> set to a value greater than 0. To disable rotation, use <a>CancelRotateSecret</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rotationEnabled;

/**
 <p>The ARN of a Lambda function that's invoked by Secrets Manager to rotate the secret either automatically per the schedule or manually by a call to <code>RotateSecret</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rotationLambdaARN;

/**
 <p>A structure that contains the rotation configuration for this secret.</p>
 */
@property (nonatomic, strong) AWSSecretsManagerRotationRulesType * _Nullable rotationRules;

/**
 <p>The list of user-defined tags that are associated with the secret. To add tags to a secret, use <a>TagResource</a>. To remove tags, use <a>UntagResource</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSecretsManagerTag *> * _Nullable tags;

/**
 <p>A list of all of the currently assigned <code>VersionStage</code> staging labels and the <code>VersionId</code> that each is attached to. Staging labels are used to keep track of the different versions during the rotation process.</p><note><p>A version that does not have any staging labels attached is considered deprecated and subject to deletion. Such versions are not included in this list.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable versionIdsToStages;

@end

/**
 <p>Allows you to filter your list of secrets.</p>
 */
@interface AWSSecretsManagerFilter : AWSModel


/**
 <p>Filters your list of secrets by a specific key.</p>
 */
@property (nonatomic, assign) AWSSecretsManagerFilterNameStringType key;

/**
 <p>Filters your list of secrets by a specific value.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 
 */
@interface AWSSecretsManagerGetRandomPasswordRequest : AWSRequest


/**
 <p>A string that includes characters that should not be included in the generated password. The default is that all characters from the included sets can be used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable excludeCharacters;

/**
 <p>Specifies that the generated password should not include lowercase letters. The default if you do not include this switch parameter is that lowercase letters can be included.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable excludeLowercase;

/**
 <p>Specifies that the generated password should not include digits. The default if you do not include this switch parameter is that digits can be included.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable excludeNumbers;

/**
 <p>Specifies that the generated password should not include punctuation characters. The default if you do not include this switch parameter is that punctuation characters can be included.</p><p>The following are the punctuation characters that <i>can</i> be included in the generated password if you don't explicitly exclude them with <code>ExcludeCharacters</code> or <code>ExcludePunctuation</code>:</p><p><code>! " # $ % &amp; ' ( ) * + , - . / : ; &lt; = &gt; ? @ [ \ ] ^ _ ` { | } ~</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable excludePunctuation;

/**
 <p>Specifies that the generated password should not include uppercase letters. The default if you do not include this switch parameter is that uppercase letters can be included.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable excludeUppercase;

/**
 <p>Specifies that the generated password can include the space character. The default if you do not include this switch parameter is that the space character is not included.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeSpace;

/**
 <p>The desired length of the generated password. The default value if you do not include this parameter is 32 characters.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable passwordLength;

/**
 <p>A boolean value that specifies whether the generated password must include at least one of every allowed character type. The default value is <code>True</code> and the operation requires at least one of every character type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireEachIncludedType;

@end

/**
 
 */
@interface AWSSecretsManagerGetRandomPasswordResponse : AWSModel


/**
 <p>A string with the generated password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable randomPassword;

@end

/**
 
 */
@interface AWSSecretsManagerGetResourcePolicyRequest : AWSRequest


/**
 <p>Specifies the secret that you want to retrieve the attached resource-based policy for. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

@end

/**
 
 */
@interface AWSSecretsManagerGetResourcePolicyResponse : AWSModel


/**
 <p>The ARN of the secret that the resource-based policy was retrieved for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret that the resource-based policy was retrieved for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A JSON-formatted string that describes the permissions that are associated with the attached secret. These permissions are combined with any permissions that are associated with the user or role that attempts to access this secret. The combined permissions specify who can access the secret and what actions they can perform. For more information, see <a href="http://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication and Access Control for AWS Secrets Manager</a> in the <i>AWS Secrets Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourcePolicy;

@end

/**
 
 */
@interface AWSSecretsManagerGetSecretValueRequest : AWSRequest


/**
 <p>Specifies the secret containing the version that you want to retrieve. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

/**
 <p>Specifies the unique identifier of the version of the secret that you want to retrieve. If you specify this parameter then don't specify <code>VersionStage</code>. If you don't specify either a <code>VersionStage</code> or <code>VersionId</code> then the default is to perform the operation on the version with the <code>VersionStage</code> value of <code>AWSCURRENT</code>.</p><p>This value is typically a <a href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a> value with 32 hexadecimal digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

/**
 <p>Specifies the secret version that you want to retrieve by the staging label attached to the version.</p><p>Staging labels are used to keep track of different versions during the rotation process. If you use this parameter then don't specify <code>VersionId</code>. If you don't specify either a <code>VersionStage</code> or <code>VersionId</code>, then the default is to perform the operation on the version with the <code>VersionStage</code> value of <code>AWSCURRENT</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionStage;

@end

/**
 
 */
@interface AWSSecretsManagerGetSecretValueResponse : AWSModel


/**
 <p>The ARN of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The date and time that this version of the secret was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The friendly name of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The decrypted part of the protected secret information that was originally provided as binary data in the form of a byte array. The response parameter represents the binary data as a <a href="https://tools.ietf.org/html/rfc4648#section-4">base64-encoded</a> string.</p><p>This parameter is not used if the secret is created by the Secrets Manager console.</p><p>If you store custom information in this field of the secret, then you must code your Lambda rotation function to parse and interpret whatever you store in the <code>SecretString</code> or <code>SecretBinary</code> fields.</p>
 */
@property (nonatomic, strong) NSData * _Nullable secretBinary;

/**
 <p>The decrypted part of the protected secret information that was originally provided as a string.</p><p>If you create this secret by using the Secrets Manager console then only the <code>SecretString</code> parameter contains data. Secrets Manager stores the information as a JSON structure of key/value pairs that the Lambda rotation function knows how to parse.</p><p>If you store custom information in the secret by using the <a>CreateSecret</a>, <a>UpdateSecret</a>, or <a>PutSecretValue</a> API operations instead of the Secrets Manager console, or by using the <b>Other secret type</b> in the console, then you must code your Lambda rotation function to parse and interpret those values.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretString;

/**
 <p>The unique identifier of this version of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

/**
 <p>A list of all of the staging labels currently attached to this version of the secret.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable versionStages;

@end

/**
 
 */
@interface AWSSecretsManagerListSecretVersionIdsRequest : AWSRequest


/**
 <p>(Optional) Specifies that you want the results to include versions that do not have any staging labels attached to them. Such versions are considered deprecated and are subject to deletion by Secrets Manager as needed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeDeprecated;

/**
 <p>(Optional) Limits the number of results you want to include in the response. If you don't include this parameter, it defaults to a value that's specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (isn't null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Secrets Manager might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>(Optional) Use this parameter in a request if you receive a <code>NextToken</code> response in a previous request indicating there's more output available. In a subsequent call, set it to the value of the previous call <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The identifier for the secret containing the versions you want to list. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

@end

/**
 
 */
@interface AWSSecretsManagerListSecretVersionIdsResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the secret.</p><note><p>Secrets Manager automatically adds several random characters to the name at the end of the ARN when you initially create a secret. This affects only the ARN and not the actual friendly name. This ensures that if you create a new secret with the same name as an old secret that you previously deleted, then users with access to the old secret <i>don't</i> automatically get access to the new secret because the ARNs are different.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If present in the response, this value indicates that there's more output available than included in the current response. This can occur even when the response includes no values at all, such as when you ask for a filtered view of a very long list. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to continue processing and get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back empty (as <code>null</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of the currently available versions of the specified secret.</p>
 */
@property (nonatomic, strong) NSArray<AWSSecretsManagerSecretVersionsListEntry *> * _Nullable versions;

@end

/**
 
 */
@interface AWSSecretsManagerListSecretsRequest : AWSRequest


/**
 <p>Lists the secret request filters.</p>
 */
@property (nonatomic, strong) NSArray<AWSSecretsManagerFilter *> * _Nullable filters;

/**
 <p>(Optional) Limits the number of results you want to include in the response. If you don't include this parameter, it defaults to a value that's specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (isn't null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Secrets Manager might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>(Optional) Use this parameter in a request if you receive a <code>NextToken</code> response in a previous request indicating there's more output available. In a subsequent call, set it to the value of the previous call <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Lists secrets in the requested order. </p>
 */
@property (nonatomic, assign) AWSSecretsManagerSortOrderType sortOrder;

@end

/**
 
 */
@interface AWSSecretsManagerListSecretsResponse : AWSModel


/**
 <p>If present in the response, this value indicates that there's more output available than included in the current response. This can occur even when the response includes no values at all, such as when you ask for a filtered view of a very long list. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to continue processing and get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back empty (as <code>null</code>).</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the secrets in the account.</p>
 */
@property (nonatomic, strong) NSArray<AWSSecretsManagerSecretListEntry *> * _Nullable secretList;

@end

/**
 
 */
@interface AWSSecretsManagerPutResourcePolicyRequest : AWSRequest


/**
 <p>Makes an optional API call to Zelkova to validate the Resource Policy to prevent broad access to your secret.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blockPublicPolicy;

/**
 <p>A JSON-formatted string that's constructed according to the grammar and syntax for an AWS resource-based policy. The policy in the string identifies who can access or manage this secret and its versions. For information on how to format a JSON parameter for the various command line tool environments, see <a href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourcePolicy;

/**
 <p>Specifies the secret that you want to attach the resource-based policy to. You can specify either the ARN or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

@end

/**
 
 */
@interface AWSSecretsManagerPutResourcePolicyResponse : AWSModel


/**
 <p>The ARN of the secret retrieved by the resource-based policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret that the retrieved by the resource-based policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSecretsManagerPutSecretValueRequest : AWSRequest


/**
 <p>(Optional) Specifies a unique identifier for the new version of the secret. </p><note><p>If you use the AWS CLI or one of the AWS SDK to call this operation, then you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes that in the request. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, then you must generate a <code>ClientRequestToken</code> yourself for new versions and include that value in the request. </p></note><p>This value helps ensure idempotency. Secrets Manager uses this value to prevent the accidental creation of duplicate versions if there are failures and retries during the Lambda rotation function's processing. We recommend that you generate a <a href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a> value to ensure uniqueness within the specified secret. </p><ul><li><p>If the <code>ClientRequestToken</code> value isn't already associated with a version of the secret then a new version of the secret is created. </p></li><li><p>If a version with this value already exists and that version's <code>SecretString</code> or <code>SecretBinary</code> values are the same as those in the request then the request is ignored (the operation is idempotent). </p></li><li><p>If a version with this value already exists and the version of the <code>SecretString</code> and <code>SecretBinary</code> values are different from those in the request then the request fails because you cannot modify an existing secret version. You can only create new versions to store new secret values.</p></li></ul><p>This value becomes the <code>VersionId</code> of the new version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>(Optional) Specifies binary data that you want to encrypt and store in the new version of the secret. To use this parameter in the command-line tools, we recommend that you store your binary data in a file and then use the appropriate technique for your tool to pass the contents of the file as a parameter. Either <code>SecretBinary</code> or <code>SecretString</code> must have a value, but not both. They cannot both be empty.</p><p>This parameter is not accessible if the secret using the Secrets Manager console.</p><p/>
 */
@property (nonatomic, strong) NSData * _Nullable secretBinary;

/**
 <p>Specifies the secret to which you want to add a new version. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret. The secret must already exist.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

/**
 <p>(Optional) Specifies text data that you want to encrypt and store in this new version of the secret. Either <code>SecretString</code> or <code>SecretBinary</code> must have a value, but not both. They cannot both be empty.</p><p>If you create this secret by using the Secrets Manager console then Secrets Manager puts the protected secret text in only the <code>SecretString</code> parameter. The Secrets Manager console stores the information as a JSON structure of key/value pairs that the default Lambda rotation function knows how to parse.</p><p>For storing multiple values, we recommend that you use a JSON text string argument and specify key/value pairs. For information on how to format a JSON parameter for the various command line tool environments, see <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>.</p><p> For example:</p><p><code>[{"username":"bob"},{"password":"abc123xyz456"}]</code></p><p>If your command-line tool or SDK requires quotation marks around the parameter, you should use single quotes to avoid confusion with the double quotes required in the JSON text.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretString;

/**
 <p>(Optional) Specifies a list of staging labels that are attached to this version of the secret. These staging labels are used to track the versions through the rotation process by the Lambda rotation function.</p><p>A staging label must be unique to a single version of the secret. If you specify a staging label that's already associated with a different version of the same secret then that staging label is automatically removed from the other version and attached to this version.</p><p>If you do not specify a value for <code>VersionStages</code> then Secrets Manager automatically moves the staging label <code>AWSCURRENT</code> to this new version.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable versionStages;

@end

/**
 
 */
@interface AWSSecretsManagerPutSecretValueResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the secret for which you just created a version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret for which you just created or updated a version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier of the version of the secret you just created or updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

/**
 <p>The list of staging labels that are currently attached to this version of the secret. Staging labels are used to track a version as it progresses through the secret rotation process.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable versionStages;

@end

/**
 
 */
@interface AWSSecretsManagerRestoreSecretRequest : AWSRequest


/**
 <p>Specifies the secret that you want to restore from a previously scheduled deletion. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

@end

/**
 
 */
@interface AWSSecretsManagerRestoreSecretResponse : AWSModel


/**
 <p>The ARN of the secret that was restored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret that was restored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSecretsManagerRotateSecretRequest : AWSRequest


/**
 <p>(Optional) Specifies a unique identifier for the new version of the secret that helps ensure idempotency. </p><p>If you use the AWS CLI or one of the AWS SDK to call this operation, then you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes that in the request for this parameter. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, then you must generate a <code>ClientRequestToken</code> yourself for new versions and include that value in the request.</p><p>You only need to specify your own value if you implement your own retry logic and want to ensure that a given secret is not created twice. We recommend that you generate a <a href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a> value to ensure uniqueness within the specified secret. </p><p>Secrets Manager uses this value to prevent the accidental creation of duplicate versions if there are failures and retries during the function's processing. This value becomes the <code>VersionId</code> of the new version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>(Optional) Specifies the ARN of the Lambda function that can rotate the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rotationLambdaARN;

/**
 <p>A structure that defines the rotation configuration for this secret.</p>
 */
@property (nonatomic, strong) AWSSecretsManagerRotationRulesType * _Nullable rotationRules;

/**
 <p>Specifies the secret that you want to rotate. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

@end

/**
 
 */
@interface AWSSecretsManagerRotateSecretResponse : AWSModel


/**
 <p>The ARN of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The ID of the new version of the secret created by the rotation started by this request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>A structure that defines the rotation configuration for the secret.</p>
 */
@interface AWSSecretsManagerRotationRulesType : AWSModel


/**
 <p>Specifies the number of days between automatic scheduled rotations of the secret.</p><p>Secrets Manager schedules the next rotation when the previous one is complete. Secrets Manager schedules the date by adding the rotation interval (number of days) to the actual date of the last rotation. The service chooses the hour within that 24-hour date window randomly. The minute is also chosen somewhat randomly, but weighted towards the top of the hour and influenced by a variety of factors that help distribute load.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automaticallyAfterDays;

@end

/**
 <p>A structure that contains the details about a secret. It does not include the encrypted <code>SecretString</code> and <code>SecretBinary</code> values. To get those values, use the <a>GetSecretValue</a> operation.</p>
 */
@interface AWSSecretsManagerSecretListEntry : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the secret.</p><p>For more information about ARNs in Secrets Manager, see <a href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#iam-resources">Policy Resources</a> in the <i>AWS Secrets Manager User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The date and time when a secret was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The date and time the deletion of the secret occurred. Not present on active secrets. The secret can be recovered until the number of days in the recovery window has passed, as specified in the <code>RecoveryWindowInDays</code> parameter of the <a>DeleteSecret</a> operation.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deletedDate;

/**
 <p>The user-provided description of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ARN or alias of the AWS KMS customer master key (CMK) used to encrypt the <code>SecretString</code> and <code>SecretBinary</code> fields in each version of the secret. If you don't provide a key, then Secrets Manager defaults to encrypting the secret fields with the default KMS CMK, the key named <code>awssecretsmanager</code>, for this account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The last date that this secret was accessed. This value is truncated to midnight of the date and therefore shows only the date, not the time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAccessedDate;

/**
 <p>The last date and time that this secret was modified in any way.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastChangedDate;

/**
 <p>The last date and time that the rotation process for this secret was invoked.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastRotatedDate;

/**
 <p>The friendly name of the secret. You can use forward slashes in the name to represent a path hierarchy. For example, <code>/prod/databases/dbserver1</code> could represent the secret for a server named <code>dbserver1</code> in the folder <code>databases</code> in the folder <code>prod</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Returns the name of the service that created the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable owningService;

/**
 <p>Indicates whether automatic, scheduled rotation is enabled for this secret.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rotationEnabled;

/**
 <p>The ARN of an AWS Lambda function invoked by Secrets Manager to rotate and expire the secret either automatically per the schedule or manually by a call to <a>RotateSecret</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rotationLambdaARN;

/**
 <p>A structure that defines the rotation configuration for the secret.</p>
 */
@property (nonatomic, strong) AWSSecretsManagerRotationRulesType * _Nullable rotationRules;

/**
 <p>A list of all of the currently assigned <code>SecretVersionStage</code> staging labels and the <code>SecretVersionId</code> attached to each one. Staging labels are used to keep track of the different versions during the rotation process.</p><note><p>A version that does not have any <code>SecretVersionStage</code> is considered deprecated and subject to deletion. Such versions are not included in this list.</p></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> * _Nullable secretVersionsToStages;

/**
 <p>The list of user-defined tags associated with the secret. To add tags to a secret, use <a>TagResource</a>. To remove tags, use <a>UntagResource</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSSecretsManagerTag *> * _Nullable tags;

@end

/**
 <p>A structure that contains information about one version of a secret.</p>
 */
@interface AWSSecretsManagerSecretVersionsListEntry : AWSModel


/**
 <p>The date and time this version of the secret was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdDate;

/**
 <p>The date that this version of the secret was last accessed. Note that the resolution of this field is at the date level and does not include the time.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAccessedDate;

/**
 <p>The unique version identifier of this version of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

/**
 <p>An array of staging labels that are currently associated with this version of the secret.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable versionStages;

@end

/**
 <p>A structure that contains information about a tag.</p>
 */
@interface AWSSecretsManagerTag : AWSModel


/**
 <p>The key identifier, or name, of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The string value associated with the key of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSSecretsManagerTagResourceRequest : AWSRequest


/**
 <p>The identifier for the secret that you want to attach tags to. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

/**
 <p>The tags to attach to the secret. Each element in the list consists of a <code>Key</code> and a <code>Value</code>.</p><p>This parameter to the API requires a JSON text string argument. For information on how to format a JSON parameter for the various command line tool environments, see <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For the AWS CLI, you can also use the syntax: <code>--Tags Key="Key1",Value="Value1",Key="Key2",Value="Value2"[,…]</code></p>
 */
@property (nonatomic, strong) NSArray<AWSSecretsManagerTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSSecretsManagerUntagResourceRequest : AWSRequest


/**
 <p>The identifier for the secret that you want to remove tags from. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

/**
 <p>A list of tag key names to remove from the secret. You don't specify the value. Both the key and its associated value are removed.</p><p>This parameter to the API requires a JSON text string argument. For information on how to format a JSON parameter for the various command line tool environments, see <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSSecretsManagerUpdateSecretRequest : AWSRequest


/**
 <p>(Optional) If you want to add a new version to the secret, this parameter specifies a unique identifier for the new version that helps ensure idempotency. </p><p>If you use the AWS CLI or one of the AWS SDK to call this operation, then you can leave this parameter empty. The CLI or SDK generates a random UUID for you and includes that in the request. If you don't use the SDK and instead generate a raw HTTP request to the Secrets Manager service endpoint, then you must generate a <code>ClientRequestToken</code> yourself for new versions and include that value in the request.</p><p>You typically only need to interact with this value if you implement your own retry logic and want to ensure that a given secret is not created twice. We recommend that you generate a <a href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a> value to ensure uniqueness within the specified secret. </p><p>Secrets Manager uses this value to prevent the accidental creation of duplicate versions if there are failures and retries during the Lambda rotation function's processing.</p><ul><li><p>If the <code>ClientRequestToken</code> value isn't already associated with a version of the secret then a new version of the secret is created. </p></li><li><p>If a version with this value already exists and that version's <code>SecretString</code> and <code>SecretBinary</code> values are the same as those in the request then the request is ignored (the operation is idempotent). </p></li><li><p>If a version with this value already exists and that version's <code>SecretString</code> and <code>SecretBinary</code> values are different from the request then an error occurs because you cannot modify an existing secret value.</p></li></ul><p>This value becomes the <code>VersionId</code> of the new version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientRequestToken;

/**
 <p>(Optional) Specifies an updated user-provided description of the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>(Optional) Specifies an updated ARN or alias of the AWS KMS customer master key (CMK) to be used to encrypt the protected text in new versions of this secret.</p><important><p>You can only use the account's default CMK to encrypt and decrypt if you call this operation using credentials from the same account that owns the secret. If the secret is in a different account, then you must create a custom CMK and provide the ARN of that CMK in this field. The user making the call must have permissions to both the secret and the CMK in their respective accounts.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>(Optional) Specifies updated binary data that you want to encrypt and store in the new version of the secret. To use this parameter in the command-line tools, we recommend that you store your binary data in a file and then use the appropriate technique for your tool to pass the contents of the file as a parameter. Either <code>SecretBinary</code> or <code>SecretString</code> must have a value, but not both. They cannot both be empty.</p><p>This parameter is not accessible using the Secrets Manager console.</p>
 */
@property (nonatomic, strong) NSData * _Nullable secretBinary;

/**
 <p>Specifies the secret that you want to modify or to which you want to add a new version. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

/**
 <p>(Optional) Specifies updated text data that you want to encrypt and store in this new version of the secret. Either <code>SecretBinary</code> or <code>SecretString</code> must have a value, but not both. They cannot both be empty.</p><p>If you create this secret by using the Secrets Manager console then Secrets Manager puts the protected secret text in only the <code>SecretString</code> parameter. The Secrets Manager console stores the information as a JSON structure of key/value pairs that the default Lambda rotation function knows how to parse.</p><p>For storing multiple values, we recommend that you use a JSON text string argument and specify key/value pairs. For information on how to format a JSON parameter for the various command line tool environments, see <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For example:</p><p><code>[{"username":"bob"},{"password":"abc123xyz456"}]</code></p><p>If your command-line tool or SDK requires quotation marks around the parameter, you should use single quotes to avoid confusion with the double quotes required in the JSON text. You can also 'escape' the double quote character in the embedded JSON text by prefacing each with a backslash. For example, the following string is surrounded by double-quotes. All of the embedded double quotes are escaped:</p><p><code>"[{\"username\":\"bob\"},{\"password\":\"abc123xyz456\"}]"</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable secretString;

@end

/**
 
 */
@interface AWSSecretsManagerUpdateSecretResponse : AWSModel


/**
 <p>The ARN of the secret that was updated.</p><note><p>Secrets Manager automatically adds several random characters to the name at the end of the ARN when you initially create a secret. This affects only the ARN and not the actual friendly name. This ensures that if you create a new secret with the same name as an old secret that you previously deleted, then users with access to the old secret <i>don't</i> automatically get access to the new secret because the ARNs are different.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>If a new version of the secret was created by this operation, then <code>VersionId</code> contains the unique identifier of the new version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSSecretsManagerUpdateSecretVersionStageRequest : AWSRequest


/**
 <p>(Optional) The secret version ID that you want to add the staging label. If you want to remove a label from a version, then do not specify this parameter.</p><p>If the staging label is already attached to a different version of the secret, then you must also specify the <code>RemoveFromVersionId</code> parameter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable moveToVersionId;

/**
 <p>Specifies the secret version ID of the version that the staging label is to be removed from. If the staging label you are trying to attach to one version is already attached to a different version, then you must include this parameter and specify the version that the label is to be removed from. If the label is attached and you either do not specify this parameter, or the version ID does not match, then the operation fails.</p>
 */
@property (nonatomic, strong) NSString * _Nullable removeFromVersionId;

/**
 <p>Specifies the secret with the version with the list of staging labels you want to modify. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

/**
 <p>The staging label to add to this version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionStage;

@end

/**
 
 */
@interface AWSSecretsManagerUpdateSecretVersionStageResponse : AWSModel


/**
 <p>The ARN of the secret with the modified staging label.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>The friendly name of the secret with the modified staging label.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSSecretsManagerValidateResourcePolicyRequest : AWSRequest


/**
 <p>Identifies the Resource Policy attached to the secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourcePolicy;

/**
 <p> The identifier for the secret that you want to validate a resource policy. You can specify either the Amazon Resource Name (ARN) or the friendly name of the secret.</p><note><p>If you specify an ARN, we generally recommend that you specify a complete ARN. You can specify a partial ARN too—for example, if you don’t include the final hyphen and six random characters that Secrets Manager adds at the end of the ARN when you created the secret. A partial ARN match can work as long as it uniquely matches only one secret. However, if your secret has a name that ends in a hyphen followed by six characters (before Secrets Manager adds the hyphen and six characters to the ARN) and you try to use that as a partial ARN, then those characters cause Secrets Manager to assume that you’re specifying a complete ARN. This confusion can cause unexpected results. To avoid this situation, we recommend that you don’t create secret names ending with a hyphen followed by six characters.</p><p>If you specify an incomplete ARN without the random suffix, and instead provide the 'friendly name', you <i>must</i> not include the random suffix. If you do include the random suffix added by Secrets Manager, you receive either a <i>ResourceNotFoundException</i> or an <i>AccessDeniedException</i> error, depending on your permissions.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable secretId;

@end

/**
 
 */
@interface AWSSecretsManagerValidateResourcePolicyResponse : AWSModel


/**
 <p>Returns a message stating that your Reource Policy passed validation. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable policyValidationPassed;

/**
 <p>Returns an error message if your policy doesn't pass validatation.</p>
 */
@property (nonatomic, strong) NSArray<AWSSecretsManagerValidationErrorsEntry *> * _Nullable validationErrors;

@end

/**
 <p>Displays errors that occurred during validation of the resource policy.</p>
 */
@interface AWSSecretsManagerValidationErrorsEntry : AWSModel


/**
 <p>Checks the name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable checkName;

/**
 <p>Displays error messages if validation encounters problems during validation of the resource policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

@end

NS_ASSUME_NONNULL_END
