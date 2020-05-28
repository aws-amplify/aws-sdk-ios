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

FOUNDATION_EXPORT NSString *const AWSQldbsessionErrorDomain;

typedef NS_ENUM(NSInteger, AWSQldbsessionErrorType) {
    AWSQldbsessionErrorUnknown,
    AWSQldbsessionErrorBadRequest,
    AWSQldbsessionErrorInvalidSession,
    AWSQldbsessionErrorLimitExceeded,
    AWSQldbsessionErrorOccConflict,
    AWSQldbsessionErrorRateExceeded,
};

@class AWSQldbsessionAbortTransactionRequest;
@class AWSQldbsessionAbortTransactionResult;
@class AWSQldbsessionCommitTransactionRequest;
@class AWSQldbsessionCommitTransactionResult;
@class AWSQldbsessionEndSessionRequest;
@class AWSQldbsessionEndSessionResult;
@class AWSQldbsessionExecuteStatementRequest;
@class AWSQldbsessionExecuteStatementResult;
@class AWSQldbsessionFetchPageRequest;
@class AWSQldbsessionFetchPageResult;
@class AWSQldbsessionPage;
@class AWSQldbsessionSendCommandRequest;
@class AWSQldbsessionSendCommandResult;
@class AWSQldbsessionStartSessionRequest;
@class AWSQldbsessionStartSessionResult;
@class AWSQldbsessionStartTransactionRequest;
@class AWSQldbsessionStartTransactionResult;
@class AWSQldbsessionValueHolder;

/**
 <p>Contains the details of the transaction to abort.</p>
 */
@interface AWSQldbsessionAbortTransactionRequest : AWSModel


@end

/**
 <p>Contains the details of the aborted transaction.</p>
 */
@interface AWSQldbsessionAbortTransactionResult : AWSModel


@end

/**
 <p>Contains the details of the transaction to commit.</p>
 Required parameters: [TransactionId, CommitDigest]
 */
@interface AWSQldbsessionCommitTransactionRequest : AWSModel


/**
 <p>Specifies the commit digest for the transaction to commit. For every active transaction, the commit digest must be passed. QLDB validates <code>CommitDigest</code> and rejects the commit with an error if the digest computed on the client does not match the digest computed by QLDB.</p>
 */
@property (nonatomic, strong) NSData * _Nullable commitDigest;

/**
 <p>Specifies the transaction ID of the transaction to commit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transactionId;

@end

/**
 <p>Contains the details of the committed transaction.</p>
 */
@interface AWSQldbsessionCommitTransactionResult : AWSModel


/**
 <p>The commit digest of the committed transaction.</p>
 */
@property (nonatomic, strong) NSData * _Nullable commitDigest;

/**
 <p>The transaction ID of the committed transaction.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transactionId;

@end

/**
 <p>Specifies a request to end the session.</p>
 */
@interface AWSQldbsessionEndSessionRequest : AWSModel


@end

/**
 <p>Contains the details of the ended session.</p>
 */
@interface AWSQldbsessionEndSessionResult : AWSModel


@end

/**
 <p>Specifies a request to execute a statement.</p>
 Required parameters: [TransactionId, Statement]
 */
@interface AWSQldbsessionExecuteStatementRequest : AWSModel


/**
 <p>Specifies the parameters for the parameterized statement in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSQldbsessionValueHolder *> * _Nullable parameters;

/**
 <p>Specifies the statement of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable statement;

/**
 <p>Specifies the transaction ID of the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transactionId;

@end

/**
 <p>Contains the details of the executed statement.</p>
 */
@interface AWSQldbsessionExecuteStatementResult : AWSModel


/**
 <p>Contains the details of the first fetched page.</p>
 */
@property (nonatomic, strong) AWSQldbsessionPage * _Nullable firstPage;

@end

/**
 <p>Specifies the details of the page to be fetched.</p>
 Required parameters: [TransactionId, NextPageToken]
 */
@interface AWSQldbsessionFetchPageRequest : AWSModel


/**
 <p>Specifies the next page token of the page to be fetched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>Specifies the transaction ID of the page to be fetched.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transactionId;

@end

/**
 <p>Contains the page that was fetched.</p>
 */
@interface AWSQldbsessionFetchPageResult : AWSModel


/**
 <p>Contains details of the fetched page.</p>
 */
@property (nonatomic, strong) AWSQldbsessionPage * _Nullable page;

@end

/**
 <p>Contains details of the fetched page.</p>
 */
@interface AWSQldbsessionPage : AWSModel


/**
 <p>The token of the next page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextPageToken;

/**
 <p>A structure that contains values in multiple encoding formats.</p>
 */
@property (nonatomic, strong) NSArray<AWSQldbsessionValueHolder *> * _Nullable values;

@end

/**
 
 */
@interface AWSQldbsessionSendCommandRequest : AWSRequest


/**
 <p>Command to abort the current transaction.</p>
 */
@property (nonatomic, strong) AWSQldbsessionAbortTransactionRequest * _Nullable abortTransaction;

/**
 <p>Command to commit the specified transaction.</p>
 */
@property (nonatomic, strong) AWSQldbsessionCommitTransactionRequest * _Nullable commitTransaction;

/**
 <p>Command to end the current session.</p>
 */
@property (nonatomic, strong) AWSQldbsessionEndSessionRequest * _Nullable endSession;

/**
 <p>Command to execute a statement in the specified transaction.</p>
 */
@property (nonatomic, strong) AWSQldbsessionExecuteStatementRequest * _Nullable executeStatement;

/**
 <p>Command to fetch a page.</p>
 */
@property (nonatomic, strong) AWSQldbsessionFetchPageRequest * _Nullable fetchPage;

/**
 <p>Specifies the session token for the current command. A session token is constant throughout the life of the session.</p><p>To obtain a session token, run the <code>StartSession</code> command. This <code>SessionToken</code> is required for every subsequent command that is issued during the current session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionToken;

/**
 <p>Command to start a new session. A session token is obtained as part of the response.</p>
 */
@property (nonatomic, strong) AWSQldbsessionStartSessionRequest * _Nullable startSession;

/**
 <p>Command to start a new transaction.</p>
 */
@property (nonatomic, strong) AWSQldbsessionStartTransactionRequest * _Nullable startTransaction;

@end

/**
 
 */
@interface AWSQldbsessionSendCommandResult : AWSModel


/**
 <p>Contains the details of the aborted transaction.</p>
 */
@property (nonatomic, strong) AWSQldbsessionAbortTransactionResult * _Nullable abortTransaction;

/**
 <p>Contains the details of the committed transaction.</p>
 */
@property (nonatomic, strong) AWSQldbsessionCommitTransactionResult * _Nullable commitTransaction;

/**
 <p>Contains the details of the ended session.</p>
 */
@property (nonatomic, strong) AWSQldbsessionEndSessionResult * _Nullable endSession;

/**
 <p>Contains the details of the executed statement.</p>
 */
@property (nonatomic, strong) AWSQldbsessionExecuteStatementResult * _Nullable executeStatement;

/**
 <p>Contains the details of the fetched page.</p>
 */
@property (nonatomic, strong) AWSQldbsessionFetchPageResult * _Nullable fetchPage;

/**
 <p>Contains the details of the started session that includes a session token. This <code>SessionToken</code> is required for every subsequent command that is issued during the current session.</p>
 */
@property (nonatomic, strong) AWSQldbsessionStartSessionResult * _Nullable startSession;

/**
 <p>Contains the details of the started transaction.</p>
 */
@property (nonatomic, strong) AWSQldbsessionStartTransactionResult * _Nullable startTransaction;

@end

/**
 <p>Specifies a request to start a new session.</p>
 Required parameters: [LedgerName]
 */
@interface AWSQldbsessionStartSessionRequest : AWSModel


/**
 <p>The name of the ledger to start a new session against.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ledgerName;

@end

/**
 <p>Contains the details of the started session.</p>
 */
@interface AWSQldbsessionStartSessionResult : AWSModel


/**
 <p>Session token of the started session. This <code>SessionToken</code> is required for every subsequent command that is issued during the current session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sessionToken;

@end

/**
 <p>Specifies a request to start a transaction.</p>
 */
@interface AWSQldbsessionStartTransactionRequest : AWSModel


@end

/**
 <p>Contains the details of the started transaction.</p>
 */
@interface AWSQldbsessionStartTransactionResult : AWSModel


/**
 <p>The transaction ID of the started transaction.</p>
 */
@property (nonatomic, strong) NSString * _Nullable transactionId;

@end

/**
 <p>A structure that can contain an Amazon Ion value in multiple encoding formats.</p>
 */
@interface AWSQldbsessionValueHolder : AWSModel


/**
 <p>An Amazon Ion binary value contained in a <code>ValueHolder</code> structure.</p>
 */
@property (nonatomic, strong) NSData * _Nullable ionBinary;

/**
 <p>An Amazon Ion plaintext value contained in a <code>ValueHolder</code> structure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ionText;

@end

NS_ASSUME_NONNULL_END
