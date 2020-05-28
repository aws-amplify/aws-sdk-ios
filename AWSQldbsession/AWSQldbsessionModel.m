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

#import "AWSQldbsessionModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSQldbsessionErrorDomain = @"com.amazonaws.AWSQldbsessionErrorDomain";

@implementation AWSQldbsessionAbortTransactionRequest

@end

@implementation AWSQldbsessionAbortTransactionResult

@end

@implementation AWSQldbsessionCommitTransactionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitDigest" : @"CommitDigest",
             @"transactionId" : @"TransactionId",
             };
}

@end

@implementation AWSQldbsessionCommitTransactionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"commitDigest" : @"CommitDigest",
             @"transactionId" : @"TransactionId",
             };
}

@end

@implementation AWSQldbsessionEndSessionRequest

@end

@implementation AWSQldbsessionEndSessionResult

@end

@implementation AWSQldbsessionExecuteStatementRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"parameters" : @"Parameters",
             @"statement" : @"Statement",
             @"transactionId" : @"TransactionId",
             };
}

+ (NSValueTransformer *)parametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQldbsessionValueHolder class]];
}

@end

@implementation AWSQldbsessionExecuteStatementResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"firstPage" : @"FirstPage",
             };
}

+ (NSValueTransformer *)firstPageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionPage class]];
}

@end

@implementation AWSQldbsessionFetchPageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"transactionId" : @"TransactionId",
             };
}

@end

@implementation AWSQldbsessionFetchPageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"page" : @"Page",
             };
}

+ (NSValueTransformer *)pageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionPage class]];
}

@end

@implementation AWSQldbsessionPage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextPageToken" : @"NextPageToken",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)valuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSQldbsessionValueHolder class]];
}

@end

@implementation AWSQldbsessionSendCommandRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortTransaction" : @"AbortTransaction",
             @"commitTransaction" : @"CommitTransaction",
             @"endSession" : @"EndSession",
             @"executeStatement" : @"ExecuteStatement",
             @"fetchPage" : @"FetchPage",
             @"sessionToken" : @"SessionToken",
             @"startSession" : @"StartSession",
             @"startTransaction" : @"StartTransaction",
             };
}

+ (NSValueTransformer *)abortTransactionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionAbortTransactionRequest class]];
}

+ (NSValueTransformer *)commitTransactionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionCommitTransactionRequest class]];
}

+ (NSValueTransformer *)endSessionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionEndSessionRequest class]];
}

+ (NSValueTransformer *)executeStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionExecuteStatementRequest class]];
}

+ (NSValueTransformer *)fetchPageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionFetchPageRequest class]];
}

+ (NSValueTransformer *)startSessionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionStartSessionRequest class]];
}

+ (NSValueTransformer *)startTransactionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionStartTransactionRequest class]];
}

@end

@implementation AWSQldbsessionSendCommandResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"abortTransaction" : @"AbortTransaction",
             @"commitTransaction" : @"CommitTransaction",
             @"endSession" : @"EndSession",
             @"executeStatement" : @"ExecuteStatement",
             @"fetchPage" : @"FetchPage",
             @"startSession" : @"StartSession",
             @"startTransaction" : @"StartTransaction",
             };
}

+ (NSValueTransformer *)abortTransactionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionAbortTransactionResult class]];
}

+ (NSValueTransformer *)commitTransactionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionCommitTransactionResult class]];
}

+ (NSValueTransformer *)endSessionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionEndSessionResult class]];
}

+ (NSValueTransformer *)executeStatementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionExecuteStatementResult class]];
}

+ (NSValueTransformer *)fetchPageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionFetchPageResult class]];
}

+ (NSValueTransformer *)startSessionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionStartSessionResult class]];
}

+ (NSValueTransformer *)startTransactionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSQldbsessionStartTransactionResult class]];
}

@end

@implementation AWSQldbsessionStartSessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ledgerName" : @"LedgerName",
             };
}

@end

@implementation AWSQldbsessionStartSessionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sessionToken" : @"SessionToken",
             };
}

@end

@implementation AWSQldbsessionStartTransactionRequest

@end

@implementation AWSQldbsessionStartTransactionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"transactionId" : @"TransactionId",
             };
}

@end

@implementation AWSQldbsessionValueHolder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ionBinary" : @"IonBinary",
             @"ionText" : @"IonText",
             };
}

@end
